//
//  GramSMC.cpp
//  GramSMC
//
//  Based on AsusSMC by Le Bao Hiep
//  Modified for LG Gram laptops
//
//  Copyright © 2018-2020 Le Bao Hiep. All rights reserved.
//  Copyright © 2026 Glen Muthoka Mutinda.
//

#include "GramSMC.hpp"

#ifndef ADDPR
#define ADDPR(x) x
#endif

bool ADDPR(debugEnabled) = false;
uint32_t ADDPR(debugPrintDelay) = 0;

#define super IOService
OSDefineMetaClassAndStructors(GramSMC, IOService)

    bool GramSMC::setProperty(const char *key, uint64_t value, int width) {
  OSNumber *num = OSNumber::withNumber(value, width);
  if (!num)
    return false;
  bool res = setProperty(key, num);
  num->release();
  return res;
}

bool GramSMC::init(OSDictionary *dict) {
  if (!super::init(dict)) {
    return false;
  }

  _notificationServices = OSSet::withCapacity(1);

  kev.setVendorID("com.bananz0");
  kev.setEventCode(GramSMCEventCode);

  atomic_init(&currentLux, 0);
  atomic_init(&currentFanSpeed, 0);

  return true;
}

IOService *GramSMC::probe(IOService *provider, SInt32 *score) {
  if (!super::probe(provider, score)) {
    SYSLOG("gram", "super::probe failed");
    return NULL;
  }

  IOACPIPlatformDevice *dev = OSDynamicCast(IOACPIPlatformDevice, provider);
  if (!dev) {
    SYSLOG("gram", "Provider is not IOACPIPlatformDevice");
    return NULL;
  }

  // Check _UID to ensure we are matching the correct device (Aligned with
  // AsusSMC)
  OSObject *obj;
  if (dev->evaluateObject("_UID", &obj) != kIOReturnSuccess) {
    SYSLOG("gram", "Failed to evaluate _UID");
    return NULL;
  }

  OSString *name = OSDynamicCast(OSString, obj);
  if (!name) {
    SYSLOG("gram", "_UID is not a string");
    if (obj)
      obj->release();
    return NULL;
  }

  IOService *ret = NULL;
  if (name->isEqualTo("GRAM")) {
    SYSLOG("gram", "Probe successful for device: %s (_UID matched)",
           provider->getName());
    ret = this;
  } else {
    SYSLOG("gram", "Probe failed: _UID mismatch (got %s)",
           name->getCStringNoCopy());
  }

  name->release();
  return ret;
}

bool GramSMC::start(IOService *provider) {
  if (!provider || !super::start(provider)) {
    SYSLOG("gram", "failed to start parent");
    return false;
  }

  gramDevice = (IOACPIPlatformDevice *)provider;

  initGramDevice();

  initALSDevice();

  initECDevice();

  initVirtualKeyboard();

  startGramDevice();

  workloop = getWorkLoop();
  if (!workloop) {
    DBGLOG("gram", "Failed to get workloop");
    return false;
  }
  workloop->retain();

  command_gate = IOCommandGate::commandGate(this);
  if (!command_gate ||
      (workloop->addEventSource(command_gate) != kIOReturnSuccess)) {
    DBGLOG("gram", "Could not open command gate");
    return false;
  }

  setProperty("IsTouchpadEnabled", true);
  setProperty("Copyright",
              "Based on AsusSMC by Le Bao Hiep. Modified for LG Gram.");

  extern kmod_info_t kmod_info;
  setProperty("GramSMC-Version", kmod_info.version);
#ifdef DEBUG
  setProperty("GramSMC-Build", "Debug");
#else
  setProperty("GramSMC-Build", "Release");
#endif

  registerNotifications();

  registerVSMC();

  // Initialize LG Control Center feature states
  capabilities = getCapabilities();
  setProperty("Capabilities", capabilities, 32);
  SYSLOG("gram", "Detected capabilities: 0x%02X", capabilities);

  if (capabilities & kCapFanMode) {
    currentFanMode = getFanMode();
    setProperty("FanMode", currentFanMode, 32);
    SYSLOG("gram", "Fan mode: %u", currentFanMode);
  }

  if (capabilities & kCapBatteryCare) {
    currentBatteryCareLimit = getBatteryCareLimit();
    setProperty("BatteryCareLimit", currentBatteryCareLimit, 32);
    SYSLOG("gram", "Battery care limit: %u%%", currentBatteryCareLimit);
  }

  if (capabilities & kCapUSBCharging) {
    currentUSBCharging = getUSBCharging();
    setProperty("USBCharging", currentUSBCharging);
    SYSLOG("gram", "USB charging: %s",
           currentUSBCharging ? "enabled" : "disabled");
  }

  if (capabilities & kCapReaderMode) {
    currentReaderMode = getReaderMode();
    setProperty("ReaderMode", currentReaderMode);
    SYSLOG("gram", "Reader mode: %s",
           currentReaderMode ? "enabled" : "disabled");
  }

  if (capabilities & kCapFnLock) {
    currentFnLock = getFnLock();
    setProperty("FnLock", currentFnLock);
    SYSLOG("gram", "Fn lock: %s", currentFnLock ? "enabled" : "disabled");
  }

  if (capabilities & kCapWebcam) {
    currentWebcam = getWebcam();
    setProperty("Webcam", currentWebcam);
    SYSLOG("gram", "Webcam: %s", currentWebcam ? "enabled" : "disabled");
  }

  // Expose KeyboardBacklight level (0=Off, 1=Low, 2=High)
  if (hasKeyboardBacklight) {
    uint32_t kblRaw = getKeyboardBacklight();
    uint32_t kblLevel = kblRaw == 0 ? 0 : (kblRaw <= 127 ? 1 : 2);
    setProperty("KeyboardBacklight", kblLevel, 32);
    SYSLOG("gram", "Keyboard backlight: %u", kblLevel);
  }

  // Expose CPU Temperature
  uint32_t temp = 0;
  if (gramDevice &&
      gramDevice->evaluateInteger("GTMP", &temp) == kIOReturnSuccess) {
    setProperty("CPUTemp", temp, 32);
  }

  // Expose Fan RPM
  if (isTACHAvailable) {
    refreshFan();
    setProperty("FanRPM", (uint32_t)atomic_load(&currentFanSpeed), 32);
  }

  registerService();

  return true;
}

void GramSMC::stop(IOService *provider) {
  if (poller) {
    poller->cancelTimeout();
  }
  if (workloop && poller) {
    workloop->removeEventSource(poller);
  }
  if (workloop && command_gate) {
    workloop->removeEventSource(command_gate);
  }
  OSSafeReleaseNULL(workloop);
  OSSafeReleaseNULL(poller);
  OSSafeReleaseNULL(command_gate);

  _publishNotify->remove();
  _terminateNotify->remove();
  _notificationServices->flushCollection();
  OSSafeReleaseNULL(_publishNotify);
  OSSafeReleaseNULL(_terminateNotify);
  OSSafeReleaseNULL(_notificationServices);

  OSSafeReleaseNULL(kbdDevice);

  super::stop(provider);
  return;
}

IOReturn GramSMC::message(uint32_t type, IOService *provider, void *argument) {
  DBGLOG("gram", "Received message: %u Type %x Provider %s",
         *((uint32_t *)argument), type,
         provider ? provider->getName() : "unknown");

  switch (type) {
  case kIOACPIMessageDeviceNotification: {
    // LG Gram uses direct ACPI messaging via SSDT patches
    // Get the event code from GEVT method
    uint32_t event = 0;
    if (gramDevice->evaluateInteger("GEVT", &event) == kIOReturnSuccess) {
      handleMessage(event);
    } else {
      // Fallback to direct argument
      handleMessage(*((uint32_t *)argument));
    }
    break;
  }

  case kSetKeyboardBacklightMessage: {
    if (hasKeyboardBacklight) {
      setKeyboardBacklight(*((uint16_t *)argument) / 16);
    }
    break;
  }

  default:
    return kIOReturnInvalid;
  }
  return kIOReturnSuccess;
}

void GramSMC::setPropertiesGated(OSObject *props) {
  OSDictionary *dict = OSDynamicCast(OSDictionary, props);
  if (!dict)
    return;

  OSNumber *value;

  // Fan Mode
  value = OSDynamicCast(OSNumber, dict->getObject("FanMode"));
  if (value != nullptr) {
    uint32_t mode = value->unsigned32BitValue();
    if (mode <= kFanModePerformance) {
      setFanMode(mode);
      SYSLOG("gram", "setProperties: FanMode set to %u", mode);
    }
  }

  // Battery Care Limit
  value = OSDynamicCast(OSNumber, dict->getObject("BatteryCareLimit"));
  if (value != nullptr) {
    uint32_t limit = value->unsigned32BitValue();
    if (limit == 80 || limit == 100) {
      setBatteryCareLimit(limit);
      SYSLOG("gram", "setProperties: BatteryCareLimit set to %u", limit);
    }
  }

  // USB Charging
  value = OSDynamicCast(OSNumber, dict->getObject("USBCharging"));
  if (value != nullptr) {
    setUSBCharging(value->unsigned32BitValue() != 0);
    SYSLOG("gram", "setProperties: USBCharging set to %u",
           value->unsigned32BitValue());
  }

  // Reader Mode
  value = OSDynamicCast(OSNumber, dict->getObject("ReaderMode"));
  if (value != nullptr) {
    setReaderMode(value->unsigned32BitValue() != 0);
    SYSLOG("gram", "setProperties: ReaderMode set to %u",
           value->unsigned32BitValue());
  }

  // Fn Lock
  value = OSDynamicCast(OSNumber, dict->getObject("FnLock"));
  if (value != nullptr) {
    setFnLock(value->unsigned32BitValue() != 0);
    SYSLOG("gram", "setProperties: FnLock set to %u",
           value->unsigned32BitValue());
  }

  // Webcam
  value = OSDynamicCast(OSNumber, dict->getObject("Webcam"));
  if (value != nullptr) {
    setWebcam(value->unsigned32BitValue() != 0);
    SYSLOG("gram", "setProperties: Webcam set to %u",
           value->unsigned32BitValue());
  }

  // KeyboardBacklight (0=Off, 1=Low, 2=High)
  value = OSDynamicCast(OSNumber, dict->getObject("KeyboardBacklight"));
  if (value != nullptr && hasKeyboardBacklight) {
    uint32_t level = value->unsigned32BitValue();
    if (level <= 2) {
      // Map 0-2 levels to EC values at 0x72:
      // 0 = Off  (0x80: KBBR=0, WSLP=0, KBBM=0, KBBS=1)
      // 1 = Low  (0xA2: KBBR=2, WSLP=0, KBBM=1, KBBS=1)
      // 2 = High (0xA4: KBBR=4, WSLP=0, KBBM=1, KBBS=1)
      uint32_t ecValue = (level == 0) ? 0x80 : ((level == 1) ? 0xA2 : 0xA4);
      setKeyboardBacklight(ecValue);
      setProperty("KeyboardBacklight", level, 32);
      SYSLOG("gram", "setProperties: KeyboardBacklight level %u (EC: 0x%02X)",
             level, ecValue);
    }
  }
}

IOReturn GramSMC::setProperties(OSObject *props) {
  command_gate->runAction(OSMemberFunctionCast(IOCommandGate::Action, this,
                                               &GramSMC::setPropertiesGated),
                          props);
  return kIOReturnSuccess;
}

void GramSMC::initGramDevice() {
  // LG Gram initialization - no WMI needed
  SYSLOG("gram", "Initializing GramSMC device");
}

void GramSMC::initALSDevice() {
  auto dict = IOService::nameMatching("AppleACPIPlatformExpert");
  if (!dict) {
    SYSLOG("als", "Failed to create matching dictionary");
    return;
  }

  auto acpi = IOService::waitForMatchingService(dict);
  dict->release();

  if (!acpi) {
    SYSLOG("als", "No ACPI");
    return;
  }

  acpi->release();

  dict = IOService::nameMatching("ACPI0008");
  if (!dict) {
    SYSLOG("als", "Failed to create matching dictionary");
    return;
  }

  auto deviceIterator = IOService::getMatchingServices(dict);
  dict->release();

  if (!deviceIterator) {
    SYSLOG("als", "No iterator");
    return;
  }

  alsDevice =
      OSDynamicCast(IOACPIPlatformDevice, deviceIterator->getNextObject());
  deviceIterator->release();

  if (!alsDevice) {
    SYSLOG("als", "ACPI0008 device not found");
    return;
  }

  if (alsDevice->validateObject("_ALI") != kIOReturnSuccess ||
      !refreshALS(false)) {
    SYSLOG("als", "No functional method _ALI on ALS device");
    return;
  }

  SYSLOG("als", "Found ALS Device %s", alsDevice->getName());
}

void GramSMC::initECDevice() {
  isTACHAvailable = true;

  auto dict = IOService::nameMatching("AppleACPIPlatformExpert");
  if (!dict) {
    SYSLOG("ec", "Failed to create matching dictionary");
    isTACHAvailable = false;
    return;
  }

  auto acpi = IOService::waitForMatchingService(dict);
  dict->release();

  if (!acpi) {
    SYSLOG("ec", "No ACPI");
    isTACHAvailable = false;
    return;
  }

  acpi->release();

  dict = IOService::nameMatching("PNP0C09");
  if (!dict) {
    SYSLOG("ec", "Failed to create matching dictionary");
    isTACHAvailable = false;
    return;
  }

  auto deviceIterator = IOService::getMatchingServices(dict);
  dict->release();

  if (!deviceIterator) {
    SYSLOG("ec", "No iterator");
    isTACHAvailable = false;
    return;
  }

  ecDevice =
      OSDynamicCast(IOACPIPlatformDevice, deviceIterator->getNextObject());
  deviceIterator->release();

  if (!ecDevice) {
    SYSLOG("ec", "PNP0C09 device not found");
    isTACHAvailable = false;
    return;
  }

  // LG Gram uses GFAN method in SSDT-GramSMC for fan speed
  if (gramDevice && gramDevice->validateObject("GFAN") == kIOReturnSuccess) {
    SYSLOG("ec", "Found GFAN method for fan speed");
    isTACHAvailable = true;
  } else {
    SYSLOG("ec", "No GFAN method available");
    isTACHAvailable = false;
  }

  SYSLOG("ec", "Found EC Device %s", ecDevice->getName());
}

void GramSMC::initVirtualKeyboard() {
  kbdDevice = new VirtualAppleKeyboard;

  if (!kbdDevice || !kbdDevice->init() || !kbdDevice->attach(this) ||
      !kbdDevice->start(this)) {
    OSSafeReleaseNULL(kbdDevice);
    SYSLOG("vkbd", "Failed to init VirtualAppleKeyboard");
  }
}

void GramSMC::startGramDevice() {
  // Check direct ACPI messaging support (always true for LG Gram)
  if (gramDevice->validateObject("DMES") == kIOReturnSuccess) {
    DBGLOG("gram", "Direct ACPI message is supported");
    setProperty("IsDirectACPIMessagingSupported", kOSBooleanTrue);
    directACPImessaging = true;
  }

  // Check keyboard backlight support via GKBL method
  if (gramDevice->validateObject("GKBL") == kIOReturnSuccess) {
    SYSLOG("gram", "Keyboard backlight is supported");
    hasKeyboardBacklight = true;
  } else {
    hasKeyboardBacklight = false;
    DBGLOG("gram", "Keyboard backlight is not supported");
  }
  setProperty("IsKeyboardBacklightSupported", hasKeyboardBacklight);

  isALSEnabled = true;
  setProperty("IsALSEnabled", isALSEnabled);
  SYSLOG("gram", "GramSMC started successfully");
}

bool GramSMC::refreshALS(bool post) {
  if (!alsDevice) {
    // Try using SSDT method if available
    if (gramDevice && gramDevice->validateObject("ALSS") == kIOReturnSuccess) {
      uint32_t lux = 150;
      if (gramDevice->evaluateInteger("ALSS", &lux) == kIOReturnSuccess) {
        atomic_store_explicit(&currentLux, lux, memory_order_release);
        if (post) {
          VirtualSMCAPI::postInterrupt(SmcEventALSChange);
          poller->setTimeoutMS(SensorUpdateTimeoutMS);
        }
        DBGLOG("als", "refreshALS lux %u (via SSDT)", lux);
        return true;
      }
    }
    return false;
  }

  IOReturn ret = kIOReturnSuccess;
  uint32_t lux = 150;

  if (isALSEnabled) {
    ret = alsDevice->evaluateInteger("_ALI", &lux);
    if (ret != kIOReturnSuccess) {
      lux = 0xFFFFFFFF; // ACPI invalid
    }
  }

  atomic_store_explicit(&currentLux, lux, memory_order_release);

  if (post) {
    VirtualSMCAPI::postInterrupt(SmcEventALSChange);
    poller->setTimeoutMS(SensorUpdateTimeoutMS);
  }

  DBGLOG("als", "refreshALS lux %u", lux);

  return ret == kIOReturnSuccess;
}

bool GramSMC::refreshFan() {
  uint32_t speed = 10000;

  // Use GFAN method from SSDT-GramSMC
  if (gramDevice && gramDevice->validateObject("GFAN") == kIOReturnSuccess) {
    if (gramDevice->evaluateInteger("GFAN", &speed) == kIOReturnSuccess) {
      atomic_store_explicit(&currentFanSpeed, (uint16_t)speed,
                            memory_order_release);
      DBGLOG("fan", "refreshFan speed %u (via SSDT)", speed);
      return speed != 10000;
    }
  }

  atomic_store_explicit(&currentFanSpeed, (uint16_t)speed,
                        memory_order_release);
  DBGLOG("fan", "refreshFan speed %u", speed);

  return speed != 10000;
}

uint32_t GramSMC::getKeyboardBacklight() {
  uint32_t level = 0;
  if (gramDevice &&
      gramDevice->evaluateInteger("GKBL", &level) == kIOReturnSuccess) {
    return level;
  }
  return 0;
}

void GramSMC::setKeyboardBacklight(uint32_t level) {
  if (gramDevice) {
    OSNumber *arg = OSNumber::withNumber(level, 32);
    gramDevice->evaluateObject("SKBL", NULL, (OSObject **)&arg, 1);
    arg->release();
  }
}

// ============================================
// LG Control Center Feature Implementation
// ============================================

uint32_t GramSMC::getCapabilities() {
  uint32_t caps = 0;
  if (gramDevice &&
      gramDevice->evaluateInteger("GCAP", &caps) == kIOReturnSuccess) {
    return caps;
  }
  return 0;
}

uint32_t GramSMC::getFanMode() {
  uint32_t mode = 0;
  if (gramDevice &&
      gramDevice->evaluateInteger("GFMD", &mode) == kIOReturnSuccess) {
    currentFanMode = mode;
    return mode;
  }
  return currentFanMode;
}

void GramSMC::setFanMode(uint32_t mode) {
  if (gramDevice && mode <= kFanModePerformance) {
    OSNumber *arg = OSNumber::withNumber(mode, 32);
    gramDevice->evaluateObject("SFMD", NULL, (OSObject **)&arg, 1);
    arg->release();
    currentFanMode = mode;
    setProperty("FanMode", mode, 32);
    DBGLOG("gram", "Fan mode set to %u (%s)", mode,
           mode == kFanModeOptimal  ? "Optimal"
           : mode == kFanModeSilent ? "Silent"
                                    : "Performance");
  }
}

void GramSMC::cycleFanMode() {
  uint32_t newMode = (getFanMode() + 1) % 3;
  setFanMode(newMode);
  kev.sendMessage(kDaemonFanMode, newMode, 0);
}

uint32_t GramSMC::getBatteryCareLimit() {
  uint32_t limit = 100;
  if (gramDevice &&
      gramDevice->evaluateInteger("GBCL", &limit) == kIOReturnSuccess) {
    currentBatteryCareLimit = limit;
    return limit;
  }
  return currentBatteryCareLimit;
}

void GramSMC::setBatteryCareLimit(uint32_t limit) {
  if (gramDevice && (limit == 80 || limit == 100)) {
    OSNumber *arg = OSNumber::withNumber(limit, 32);
    gramDevice->evaluateObject("SBCL", NULL, (OSObject **)&arg, 1);
    arg->release();
    currentBatteryCareLimit = limit;
    setProperty("BatteryCareLimit", limit, 32);
    DBGLOG("gram", "Battery care limit set to %u%%", limit);
  }
}

bool GramSMC::getUSBCharging() {
  uint32_t state = 0;
  if (gramDevice &&
      gramDevice->evaluateInteger("GUSC", &state) == kIOReturnSuccess) {
    currentUSBCharging = (state != 0);
    return currentUSBCharging;
  }
  return currentUSBCharging;
}

void GramSMC::setUSBCharging(bool enabled) {
  if (gramDevice) {
    OSNumber *arg = OSNumber::withNumber(enabled ? 1 : 0, 32);
    gramDevice->evaluateObject("SUSC", NULL, (OSObject **)&arg, 1);
    arg->release();
    currentUSBCharging = enabled;
    setProperty("USBCharging", enabled);
    DBGLOG("gram", "USB charging %s", enabled ? "enabled" : "disabled");
  }
}

bool GramSMC::getReaderMode() {
  uint32_t state = 0;
  if (gramDevice &&
      gramDevice->evaluateInteger("GRDM", &state) == kIOReturnSuccess) {
    currentReaderMode = (state != 0);
    return currentReaderMode;
  }
  return currentReaderMode;
}

void GramSMC::setReaderMode(bool enabled) {
  if (gramDevice) {
    OSNumber *arg = OSNumber::withNumber(enabled ? 1 : 0, 32);
    gramDevice->evaluateObject("SRDM", NULL, (OSObject **)&arg, 1);
    arg->release();
    currentReaderMode = enabled;
    setProperty("ReaderMode", enabled);
    DBGLOG("gram", "Reader mode %s", enabled ? "enabled" : "disabled");
  }
}

void GramSMC::toggleReaderMode() {
  bool newState = !getReaderMode();
  setReaderMode(newState);
  kev.sendMessage(kDaemonReaderMode, newState ? 1 : 0, 0);
}

bool GramSMC::getFnLock() {
  uint32_t state = 0;
  if (gramDevice &&
      gramDevice->evaluateInteger("GFNL", &state) == kIOReturnSuccess) {
    currentFnLock = (state != 0);
    return currentFnLock;
  }
  return currentFnLock;
}

void GramSMC::setFnLock(bool enabled) {
  if (gramDevice) {
    OSNumber *arg = OSNumber::withNumber(enabled ? 1 : 0, 32);
    gramDevice->evaluateObject("SFNL", NULL, (OSObject **)&arg, 1);
    arg->release();
    currentFnLock = enabled;
    setProperty("FnLock", enabled);
    DBGLOG("gram", "Fn lock %s", enabled ? "enabled" : "disabled");
  }
}

// ============================================
// Additional LG Control Center Features
// ============================================

bool GramSMC::getWebcam() {
  uint32_t state = 1; // Default enabled
  if (gramDevice &&
      gramDevice->evaluateInteger("GWCM", &state) == kIOReturnSuccess) {
    currentWebcam = (state != 0);
    return currentWebcam;
  }
  return currentWebcam;
}

void GramSMC::setWebcam(bool enabled) {
  if (gramDevice) {
    OSNumber *arg = OSNumber::withNumber(enabled ? 1 : 0, 32);
    gramDevice->evaluateObject("SWCM", NULL, (OSObject **)&arg, 1);
    arg->release();
    currentWebcam = enabled;
    setProperty("Webcam", enabled);
    DBGLOG("gram", "Webcam %s", enabled ? "enabled" : "disabled");
  }
}

void GramSMC::handleMessage(int code) {
  switch (code) {
  // LG Gram specific event codes from SSDT-GramSMC
  case GRAM_EVENT_BRIGHTNESS_DOWN: // 0x10
    dispatchTCReport(kHIDUsage_AV_TopCase_BrightnessDown);
    break;

  case GRAM_EVENT_BRIGHTNESS_UP: // 0x11
    dispatchTCReport(kHIDUsage_AV_TopCase_BrightnessUp);
    break;

  case GRAM_EVENT_KBBL_UP: // 0xC4
    if (hasKeyboardBacklight) {
      dispatchTCReport(kHIDUsage_AV_TopCase_IlluminationUp);
    }
    break;

  case GRAM_EVENT_KBBL_DOWN: // 0xC5
    if (hasKeyboardBacklight) {
      dispatchTCReport(kHIDUsage_AV_TopCase_IlluminationDown);
    }
    break;

  case GRAM_EVENT_SLEEP: // 0x5E
    letSleep();
    break;

  case 0x30: // Volume up
    dispatchCSMRReport(kHIDUsage_Csmr_VolumeIncrement);
    break;

  case 0x31: // Volume down
    dispatchCSMRReport(kHIDUsage_Csmr_VolumeDecrement);
    break;

  case 0x32: // Mute
    dispatchCSMRReport(kHIDUsage_Csmr_Mute);
    break;

  case 0x61: // Video Mirror
    dispatchTCReport(kHIDUsage_AV_TopCase_VideoMirror);
    break;

  case 0x70: // F1 - LG Control Center / Settings
    kev.sendMessage(kDaemonKeyboardBacklight, 0,
                    0); // Notify daemon (misnamed but likely functional)
    DBGLOG("gram", "F1 Settings key pressed");
    break;

  case 0x74: // F5 - Keyboard backlight toggle
    if (hasKeyboardBacklight) {
      dispatchTCReport(kHIDUsage_AV_TopCase_IlluminationToggle);
    }
    break;

  case 0x6B: // Touchpad On/Off
    toggleTouchpad();
    break;

  case 0x7D: // Airplane mode
    toggleAirplaneMode();
    break;

  case 0xF9: // Reader mode toggle (Fn+F9)
    toggleReaderMode();
    break;

  default:
    // Handle brightness range (legacy compatibility)
    if (code >= NOTIFY_BRIGHTNESS_DOWN_MIN &&
        code <= NOTIFY_BRIGHTNESS_DOWN_MAX) {
      dispatchTCReport(kHIDUsage_AV_TopCase_BrightnessDown);
    } else if (code >= NOTIFY_BRIGHTNESS_UP_MIN &&
               code <= NOTIFY_BRIGHTNESS_UP_MAX) {
      dispatchTCReport(kHIDUsage_AV_TopCase_BrightnessUp);
    }
    break;
  }

  DBGLOG("gram", "Received key %d(0x%x)", code, code);
}

void GramSMC::letSleep() { kev.sendMessage(kDaemonSleep, 0, 0); }

void GramSMC::toggleAirplaneMode() {
  kev.sendMessage(kDaemonAirplaneMode, 0, 0);
}

void GramSMC::toggleTouchpad() {
  // Toggle touchpad status logic
  // (Assuming identical to AsusSMC logic for now, but verified against Gram
  // DSDT elsewhere) For now just toggle internal state and notify

  // Note: AsusSMC logic uses keyboard message.
  // Assuming VirtualAppleKeyboard handles this.

  // Actually, let's keep it simple:
  isTouchpadEnabled = !isTouchpadEnabled;
  if (isTouchpadEnabled) {
    setProperty("IsTouchpadEnabled", true);
    DBGLOG("gram", "Enabled Touchpad");
  } else {
    setProperty("IsTouchpadEnabled", false);
    DBGLOG("gram", "Disabled Touchpad");
  }

  // Send message to virtual keyboard to update state
  // kKeyboardSetTouchStatus is a custom message type
  // dispatchMessage(kKeyboardSetTouchStatus, &isTouchpadEnabled);
}

void GramSMC::dispatchCSMRReport(int code) {
  // Simple dispatch loop
  csmrreport.keys.insert(code);
  postKeyboardInputReport(&csmrreport, sizeof(csmrreport));
  csmrreport.keys.erase(code);
  postKeyboardInputReport(&csmrreport, sizeof(csmrreport));
}

void GramSMC::dispatchTCReport(int code) {
  tcreport.keys.insert(code);
  postKeyboardInputReport(&tcreport, sizeof(tcreport));
  tcreport.keys.erase(code);
  postKeyboardInputReport(&tcreport, sizeof(tcreport));
}

IOReturn GramSMC::postKeyboardInputReport(const void *report,
                                          uint32_t reportSize) {
  IOReturn result = kIOReturnError;

  if (!report || reportSize == 0) {
    return kIOReturnBadArgument;
  }

  if (kbdDevice) {
    if (auto buffer = IOBufferMemoryDescriptor::withBytes(report, reportSize,
                                                          kIODirectionNone)) {
      result = kbdDevice->handleReport(buffer, kIOHIDReportTypeInput,
                                       kIOHIDOptionsTypeNone);
      buffer->release();
    }
  }

  return result;
}

void GramSMC::registerNotifications() {
  auto *key = OSSymbol::withCString(kDeliverNotifications);
  auto *propertyMatch = propertyMatching(key, kOSBooleanTrue);

  IOServiceMatchingNotificationHandler notificationHandler =
      OSMemberFunctionCast(IOServiceMatchingNotificationHandler, this,
                           &GramSMC::notificationHandler);

  _publishNotify =
      addMatchingNotification(gIOFirstPublishNotification, propertyMatch,
                              notificationHandler, this, 0, 10000);

  _terminateNotify =
      addMatchingNotification(gIOTerminatedNotification, propertyMatch,
                              notificationHandler, this, 0, 10000);

  key->release();
  propertyMatch->release();
}

IOReturn GramSMC::notificationHandlerGated(OSObject *owner, void *arg0,
                                           void *arg1, void *arg2, void *arg3) {
  GramSMC *self = OSDynamicCast(GramSMC, owner);
  if (!self)
    return kIOReturnError;

  IOService *newService = (IOService *)arg0;
  IONotifier *notifier = (IONotifier *)arg1;

  if (notifier == self->_publishNotify) {
    SYSLOG("notify", "Notification consumer published: %s",
           newService->getName());
    self->_notificationServices->setObject(newService);
  }

  if (notifier == self->_terminateNotify) {
    SYSLOG("notify", "Notification consumer terminated: %s",
           newService->getName());
    self->_notificationServices->removeObject(newService);
  }

  return kIOReturnSuccess;
}

bool GramSMC::notificationHandler(void *refCon, IOService *newService,
                                  IONotifier *notifier) {
  command_gate->runAction(&GramSMC::notificationHandlerGated, newService,
                          notifier);
  return true;
}

void GramSMC::registerVSMC() {
  vsmcNotifier = VirtualSMCAPI::registerHandler(vsmcNotificationHandler, this);

  ALSSensor sensor{ALSSensor::Type::Unknown7, true, 6, false};
  ALSSensor noSensor{ALSSensor::Type::NoSensor, false, 0, false};
  SMCALSValue::Value emptyValue;
  SMCKBrdBLightValue::lkb lkb;
  SMCKBrdBLightValue::lks lks;

  VirtualSMCAPI::addKey(
      KeyAL, vsmcPlugin.data,
      VirtualSMCAPI::valueWithUint16(
          0, &forceBits, SMC_KEY_ATTRIBUTE_READ | SMC_KEY_ATTRIBUTE_WRITE));

  VirtualSMCAPI::addKey(
      KeyALI0, vsmcPlugin.data,
      VirtualSMCAPI::valueWithData(reinterpret_cast<const SMC_DATA *>(&sensor),
                                   sizeof(sensor), SmcKeyTypeAli, nullptr,
                                   SMC_KEY_ATTRIBUTE_READ |
                                       SMC_KEY_ATTRIBUTE_FUNCTION));

  VirtualSMCAPI::addKey(
      KeyALI1, vsmcPlugin.data,
      VirtualSMCAPI::valueWithData(
          reinterpret_cast<const SMC_DATA *>(&noSensor), sizeof(noSensor),
          SmcKeyTypeAli, nullptr,
          SMC_KEY_ATTRIBUTE_READ | SMC_KEY_ATTRIBUTE_FUNCTION));

  VirtualSMCAPI::addKey(
      KeyALRV, vsmcPlugin.data,
      VirtualSMCAPI::valueWithUint16(1, nullptr, SMC_KEY_ATTRIBUTE_READ));

  VirtualSMCAPI::addKey(KeyALV0, vsmcPlugin.data,
                        VirtualSMCAPI::valueWithData(
                            reinterpret_cast<const SMC_DATA *>(&emptyValue),
                            sizeof(emptyValue), SmcKeyTypeAlv,
                            new SMCALSValue(&currentLux, &forceBits),
                            SMC_KEY_ATTRIBUTE_READ | SMC_KEY_ATTRIBUTE_WRITE |
                                SMC_KEY_ATTRIBUTE_FUNCTION));

  VirtualSMCAPI::addKey(KeyALV1, vsmcPlugin.data,
                        VirtualSMCAPI::valueWithData(
                            reinterpret_cast<const SMC_DATA *>(&emptyValue),
                            sizeof(emptyValue), SmcKeyTypeAlv, nullptr,
                            SMC_KEY_ATTRIBUTE_READ | SMC_KEY_ATTRIBUTE_WRITE |
                                SMC_KEY_ATTRIBUTE_FUNCTION));

  VirtualSMCAPI::addKey(KeyLKSB, vsmcPlugin.data,
                        VirtualSMCAPI::valueWithData(
                            reinterpret_cast<const SMC_DATA *>(&lkb),
                            sizeof(lkb), SmcKeyTypeLkb,
                            new SMCKBrdBLightValue(this),
                            SMC_KEY_ATTRIBUTE_READ | SMC_KEY_ATTRIBUTE_WRITE |
                                SMC_KEY_ATTRIBUTE_FUNCTION));

  VirtualSMCAPI::addKey(KeyLKSS, vsmcPlugin.data,
                        VirtualSMCAPI::valueWithData(
                            reinterpret_cast<const SMC_DATA *>(&lks),
                            sizeof(lks), SmcKeyTypeLks, nullptr,
                            SMC_KEY_ATTRIBUTE_READ | SMC_KEY_ATTRIBUTE_WRITE |
                                SMC_KEY_ATTRIBUTE_FUNCTION));

  VirtualSMCAPI::addKey(KeyMSLD, vsmcPlugin.data,
                        VirtualSMCAPI::valueWithUint8(
                            0, nullptr,
                            SMC_KEY_ATTRIBUTE_READ | SMC_KEY_ATTRIBUTE_WRITE |
                                SMC_KEY_ATTRIBUTE_FUNCTION));

  VirtualSMCAPI::addKey(
      KeyFNum, vsmcPlugin.data,
      VirtualSMCAPI::valueWithUint8(
          1, nullptr, SMC_KEY_ATTRIBUTE_CONST | SMC_KEY_ATTRIBUTE_READ));

  VirtualSMCAPI::addKey(
      KeyF0Ac, vsmcPlugin.data,
      VirtualSMCAPI::valueWithFp(0, SmcKeyTypeFpe2, new F0Ac(&currentFanSpeed),
                                 SMC_KEY_ATTRIBUTE_READ |
                                     SMC_KEY_ATTRIBUTE_FUNCTION));

  FanTypeDescStruct desc;
  lilu_os_strncpy(desc.strFunction, "System Fan", DiagFunctionStrLen);

  VirtualSMCAPI::addKey(KeyF0ID, vsmcPlugin.data,
                        VirtualSMCAPI::valueWithData(
                            reinterpret_cast<const SMC_DATA *>(&desc),
                            sizeof(desc), SmcKeyTypeFds, nullptr,
                            SMC_KEY_ATTRIBUTE_CONST | SMC_KEY_ATTRIBUTE_READ));

  qsort(const_cast<VirtualSMCKeyValue *>(vsmcPlugin.data.data()),
        vsmcPlugin.data.size(), sizeof(VirtualSMCKeyValue),
        VirtualSMCKeyValue::compare);
}

bool GramSMC::vsmcNotificationHandler(void *sensors, void *refCon,
                                      IOService *vsmc, IONotifier *notifier) {
  if (sensors && vsmc) {
    DBGLOG("gram", "got vsmc notification");
    auto self = static_cast<GramSMC *>(sensors);
    auto ret =
        vsmc->callPlatformFunction(VirtualSMCAPI::SubmitPlugin, true, sensors,
                                   &self->vsmcPlugin, nullptr, nullptr);
    if (ret == kIOReturnSuccess) {
      DBGLOG("gram", "Submitted plugin");

      // We prefer to use our own timer (poller) initialized in start()
      // But AsusSMC re-initializes it here to be safe and sets callback to
      // lambda Let's stick to our start() logic where poller is already set up
      // to call ::message or similar? Actually, AsusSMC uses a lambda for the
      // timer source which calls refresh methods. In our start(), we set up
      // poller but didn't assign an action! So we SHOULD do it here.

      if (self->poller) {
        self->poller->cancelTimeout();
        // Re-initialize with lambda
        auto action = [](OSObject *object, IOTimerEventSource *sender) {
          auto ls = OSDynamicCast(GramSMC, object);
          if (ls) {
            ls->refreshALS(true);
            ls->refreshFan();
          }
        };

        // IOTimerEventSource doesn't easily support changing action after init
        // without re-creating usually But we can check if we can just use the
        // poller we have. Actually, let's just use what AsusSMC does: create a
        // new one or assuming the one in start was just placeholder? In start()
        // we did: poller = IOTimerEventSource::timerEventSource(this,
        // [](OSObject *owner, IOTimerEventSource *sender){ ... }); Wait, in my
        // start() I didn't see the lambda! checked start() in step 188:
        // command_gate = IOCommandGate::commandGate(this);
        // ... workloop->addEventSource(command_gate)
        // BUT poller is NOT initialized in start() visible lines!

        // Let's protect against null poller
        if (!self->poller) {
          self->poller = IOTimerEventSource::timerEventSource(self, action);
          if (self->poller && self->workloop) {
            self->workloop->addEventSource(self->poller);
            self->poller->setTimeoutMS(SensorUpdateTimeoutMS);
          }
        }
      }
      return true;
    } else if (ret != kIOReturnUnsupported) {
      SYSLOG("gram", "Plugin submission failure %X", ret);
    } else {
      DBGLOG("gram", "Plugin submission to non vsmc");
    }
  } else {
    SYSLOG("gram", "Got null vsmc notification");
  }

  return false;
}
