# GramSMC Stack Integration Analysis

## Overview

This document analyzes the complete communication flow from SSDT-GramSMC.dsl → GramSMC.kext → GramSMCDaemon → GramControlCenter.app and identifies integration issues.

---

## Architecture Summary

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                              HARDWARE LAYER                                  │
│                       (LG Gram EC - Embedded Controller)                     │
│                  EC Registers: 0xE0, 0xE4, 0xC8, 0xCB, 0xDC, etc.           │
└─────────────────────────────────────────────────────────────────────────────┘
                                     │
                                     ▼
┌─────────────────────────────────────────────────────────────────────────────┐
│                           SSDT-GramSMC.dsl (ACPI)                           │
│  • Defines GRAM0001 device                                                  │
│  • EC Query methods (_Q50, _Q51, _Q30, _Q34, _Q36, _Q37, _Q64, _Q72)        │
│  • Feature get/set methods (GKBL/SKBL, GFMD/SFMD, GBCL/SBCL, etc.)          │
│  • Event notification via NEVT/GEVT                                          │
└─────────────────────────────────────────────────────────────────────────────┘
                                     │
                                     ▼
┌─────────────────────────────────────────────────────────────────────────────┐
│                           GramSMC.kext (Kernel)                             │
│  • Matches on "GRAM0001" HID                                                │
│  • Handles ACPI notifications via message()                                 │
│  • KernEventServer for daemon communication                                 │
│  • VirtualAppleKeyboard for HID events                                      │
│  • VirtualSMC integration for ALS/Fan keys                                  │
│  • IORegistry properties for app communication                              │
└─────────────────────────────────────────────────────────────────────────────┘
                            │                    │
           (Kernel Events)  │                    │  (IORegistry)
                            ▼                    ▼
┌─────────────────────────────────┐   ┌─────────────────────────────────────┐
│       GramSMCDaemon             │   │       GramControlCenter.app         │
│  • Listens on kernel events     │   │  • Reads/writes IORegistry props    │
│  • Shows OSD bezels             │   │  • Menu bar UI                      │
│  • Handles airplane mode        │   │  • Settings window                  │
│  • Triggers sleep               │   │  • Periodic polling (5s)            │
└─────────────────────────────────┘   └─────────────────────────────────────┘
```

---

## 1. SSDT-GramSMC.dsl Analysis

### ✅ Working Components

| Component | Status | Notes |
|-----------|--------|-------|
| GRAM0001 Device | ✅ OK | Properly defined with _HID, _CID, _UID |
| EC Read (ECRX) | ✅ OK | Used throughout for reading registers |
| EC Write (ECWX) | ✅ OK | Used for writing to EC registers |
| Event Buffer (EVTB/NEVT/GEVT) | ✅ OK | Proper event queuing mechanism |
| Keyboard Backlight (GKBL/SKBL) | ✅ OK | Reads/writes 0xE0 register |
| Fan Mode (GFMD/SFMD) | ✅ OK | Reads/writes 0xCF register |
| Battery Care (GBCL/SBCL) | ✅ OK | Reads/writes 0xBA register |
| USB Charging (GUSC/SUSC) | ✅ OK | Reads/writes 0xBE register |
| Reader Mode (GRDM/SRDM) | ✅ OK | Reads/writes 0x66 register |
| Fn Lock (GFNL/SFNL) | ✅ OK | Reads/writes 0x73 register |
| Webcam (GWCM/SWCM) | ✅ OK | Reads/writes 0xC0 register |
| Temperature (GTMP) | ✅ OK | Reads 0xC8 register |
| Fan Speed (GFAN) | ✅ OK | Reads 0xCB register × 100 |
| ALS (ALSS) | ✅ OK | Reads 0xDC-0xDD (16-bit) |
| Touchpad State (GTPD/STPD) | ✅ OK | Reads/writes 0x64 register |
| Capabilities (GCAP) | ✅ OK | Returns 0x03FF bitmask |

### Event Mapping (EC Query → Event Codes)

| EC Query | Event Code | Description | Kext Handler |
|----------|------------|-------------|--------------|
| _Q50 | N/A | Brightness Down | PS2K Notify 0x0405 |
| _Q51 | N/A | Brightness Up | PS2K Notify 0x0406 |
| _Q30 | 0x32 | Mute | handleMessage(0x32) |
| _Q52 | 0x31 | Volume Down | handleMessage(0x31) |
| _Q53 | 0x30 | Volume Up | handleMessage(0x30) |
| _Q64 | 0xC4/0xC5 | KB Backlight | handleMessage(0xC4/0xC5) |
| _Q34 | 0x5E | Sleep | handleMessage(0x5E) |
| _Q36 | Variable | Fn keys | handleMessage(code) |
| _Q37 | 0x7D | Airplane Mode | handleMessage(0x7D) |
| _Q72 | 0xF9 | Reader Mode | handleMessage(0xF9) |

---

## 2. GramSMC.kext Analysis

### ✅ Working Components

| Component | Status | Notes |
|-----------|--------|-------|
| Device Matching | ✅ OK | Matches on GRAM0001 |
| ACPI Message Handler | ✅ OK | message() calls handleMessage() |
| GEVT Integration | ✅ OK | Reads event from SSDT buffer |
| VirtualAppleKeyboard | ✅ OK | Initialized and attached |
| KernEventServer | ✅ OK | Vendor ID "com.bananz0" |
| IORegistry Properties | ✅ OK | setProperty() called for all features |

### ⚠️ Critical Issues Found

#### Issue 1: Missing Function Implementations
**Severity: CRITICAL** 🔴

The following functions are **declared in GramSMC.hpp but NOT implemented in GramSMC.cpp**:

```cpp
// Declared but NOT implemented:
void letSleep();                    // Line 100 in .hpp
void toggleAirplaneMode();          // Line 101 in .hpp
void toggleTouchpad();              // Line 102 in .hpp
void displayOff();                  // Line 103 in .hpp
void toggleTouchpadWithLED();       // Line 228 in .hpp
void dispatchCSMRReport(int code, int loop = 1);  // Line 240 in .hpp
void dispatchTCReport(int code, int loop = 1);    // Line 241 in .hpp
void registerNotifications(void);   // Line 246 in .hpp
void registerVSMC(void);            // Line 254 in .hpp
```

**Impact**: The kext compiles (verified with xcodebuild) but these functions are undefined at link time or produce undefined behavior. The build succeeds likely due to:
1. Weak linking
2. Dead code elimination
3. These functions never being called in the current code paths

**Called but undefined**:
- `letSleep()` - called at line 709
- `toggleTouchpad()` - called at line 740  
- `toggleAirplaneMode()` - called at line 744
- `dispatchCSMRReport()` - called at lines 713, 717, 721
- `dispatchTCReport()` - called at lines 689, 693, 698, 704, 725, 735, 755, 758
- `registerNotifications()` - called at line 105
- `registerVSMC()` - called at line 107

#### Issue 2: Keyboard Backlight Level Mapping
**Severity: MEDIUM** 🟡

The app expects 3 levels (0=Off, 1=Low, 2=High) but the SSDT uses raw EC values (0-255):

```cpp
// In kext start():
uint32_t kblRaw = getKeyboardBacklight();
uint32_t kblLevel = kblRaw == 0 ? 0 : (kblRaw <= 127 ? 1 : 2);  // ✅ Correct mapping
setProperty("KeyboardBacklight", kblLevel, 32);

// In setKeyboardBacklight():
OSNumber *arg = OSNumber::withNumber(level, 32);
gramDevice->evaluateObject("SKBL", NULL, (OSObject **)&arg, 1);  // ⚠️ Passes raw level
```

When app sets level 2 (High), it sends `2` but SSDT SKBL expects 0-255 range.

**Fix needed in setKeyboardBacklight()**:
```cpp
void GramSMC::setKeyboardBacklight(uint32_t level) {
  if (gramDevice) {
    uint32_t rawValue = (level == 0) ? 0 : ((level == 1) ? 127 : 255);  // Map levels
    OSNumber *arg = OSNumber::withNumber(rawValue, 32);
    gramDevice->evaluateObject("SKBL", NULL, (OSObject **)&arg, 1);
    arg->release();
  }
}
```

---

## 3. GramSMCDaemon Analysis

### ✅ Working Components

| Component | Status | Notes |
|-----------|--------|-------|
| Kernel Event Socket | ✅ OK | Uses `com.bananz0` vendor ID |
| Event Code Matching | ✅ OK | Checks `GramSMCEventCode` (0x80) |
| Message Struct | ✅ OK | Matches kext's `GramSMCMessage` |
| BezelServices | ✅ OK | Falls back to OSD framework |
| Sleep Function | ✅ OK | Uses AESendMessage with kAESleep |
| Airplane Mode | ✅ OK | Toggles WiFi and Bluetooth |

### ⚠️ Issues Found

#### Issue 1: Event Types Not All Handled
**Severity: LOW** 🟢

Some kext event types are received but silently ignored:
```objective-c
case kDaemonBatteryCare:
case kDaemonUSBCharging:
case kDaemonReaderMode:
case kDaemonFnLock:
case kDaemonWebcam:
  // These features toggle silently without OSD
  break;
```

This is intentional for most features, but the daemon could show notifications.

#### Issue 2: Missing Events from Kext
**Severity: HIGH** 🔴

The daemon receives events via kernel events, but the kext only sends events in:
- `cycleFanMode()` - sends `kDaemonFanMode`
- `toggleReaderMode()` - sends `kDaemonReaderMode`

**Missing sends for**:
- Keyboard backlight changes (no OSD shown for Fn+F9)
- Battery care changes
- USB charging changes
- Fn lock changes
- Webcam changes

---

## 4. GramControlCenter.app Analysis

### ✅ Working Components

| Component | Status | Notes |
|-----------|--------|-------|
| IOKit Service Matching | ✅ OK | Matches on "GramSMC" class |
| Property Reading | ✅ OK | Uses IORegistryEntryCreateCFProperty |
| Property Writing | ✅ OK | Uses IORegistryEntrySetCFProperty |
| Refresh Timer | ✅ OK | Polls every 5 seconds |
| UI Bindings | ✅ OK | SwiftUI bindings to controller |

### ⚠️ Issues Found

#### Issue 1: setPropertiesGated() Doesn't Handle KeyboardBacklight
**Severity: MEDIUM** 🟡

The app writes `KeyboardBacklight` property, but `setPropertiesGated()` doesn't handle it:

```cpp
// In setPropertiesGated() - MISSING:
// if ((value = OSDynamicCast(OSNumber, dict->getObject("KeyboardBacklight")))) {
//   setKeyboardBacklight(value->unsigned32BitValue());
// }
```

**Impact**: App UI updates but hardware doesn't change when setting keyboard backlight.

#### Issue 2: ReaderMode Property Not Exposed
**Severity: LOW** 🟢

The kext doesn't expose `ReaderMode` property in start():
```cpp
// setProperty("ReaderMode", currentReaderMode); - NOT CALLED in start()
```

But `getReaderMode()` is implemented and would work if called.

---

## 5. Communication Flow Verification

### 5.1 Button Press Flow (Working ✅)

```
User presses Fn+F1 (Fan Mode)
       │
       ▼
EC triggers _Q36 interrupt
       │
       ▼
SSDT _Q36 reads FNKN (0xE4) = 0x70
       │
       ▼
SSDT calls NEVT(0x70) → sets EVTB = 0x70, Notify(GRAM, 0x80)
       │
       ▼
Kext message() receives kIOACPIMessageDeviceNotification
       │
       ▼
Kext calls GEVT → returns 0x70
       │
       ▼
Kext handleMessage(0x70) → cycleFanMode() → kev.sendMessage(kDaemonFanMode)
       │
       ▼
Daemon receives kDaemonFanMode → showOSD()
```

### 5.2 App Control Flow (Partially Working ⚠️)

```
User changes Fan Mode in App
       │
       ▼
App calls GramSMCController.setFanMode(1)
       │
       ▼
App calls IORegistryEntrySetCFProperty(service, "FanMode", 1)
       │
       ▼
Kext setProperties() triggers setPropertiesGated()
       │
       ▼
Kext calls setFanMode(1)
       │
       ▼
Kext calls SFMD(1) via ACPI
       │
       ▼
SSDT writes to EC register 0xCF
       │
       ▼
✅ Hardware changes
```

### 5.3 Keyboard Backlight Flow (BROKEN 🔴)

```
User changes KB Backlight in App
       │
       ▼
App calls setKeyboardBacklight(2)  // Level 2 = High
       │
       ▼
App calls IORegistryEntrySetCFProperty(service, "KeyboardBacklight", 2)
       │
       ▼
Kext setProperties() → setPropertiesGated()
       │
       ▼
❌ NO HANDLER FOR "KeyboardBacklight" in setPropertiesGated()
       │
       ▼
❌ Hardware does NOT change
```

---

## 6. Critical Missing Implementations

### Functions That MUST Be Implemented

```cpp
// 1. Sleep function - required for Fn+F12
void GramSMC::letSleep() {
    kev.sendMessage(kDaemonSleep, 0, 0);
}

// 2. Airplane mode toggle - required for Fn+F6
void GramSMC::toggleAirplaneMode() {
    kev.sendMessage(kDaemonAirplaneMode, 0, 0);
}

// 3. Touchpad toggle - required for Fn+F5  
void GramSMC::toggleTouchpad() {
    isTouchpadEnabled = !isTouchpadEnabled;
    setProperty("IsTouchpadEnabled", isTouchpadEnabled);
    kev.sendMessage(kDaemonTouchpad, isTouchpadEnabled ? 1 : 0, 0);
}

// 4. Consumer report dispatch - required for volume keys
void GramSMC::dispatchCSMRReport(int code, int loop) {
    if (!kbdDevice) return;
    
    bzero(&csmrreport, sizeof(csmrreport));
    csmrreport.reportID = 2;  // Consumer report ID from HID descriptor
    csmrreport.keys[0] = code;
    
    for (int i = 0; i < loop; i++) {
        kbdDevice->handleReport(IOBufferMemoryDescriptor::withBytes(
            &csmrreport, sizeof(csmrreport), kIODirectionNone));
        
        // Release key
        bzero(&csmrreport.keys, sizeof(csmrreport.keys));
        kbdDevice->handleReport(IOBufferMemoryDescriptor::withBytes(
            &csmrreport, sizeof(csmrreport), kIODirectionNone));
    }
}

// 5. TopCase report dispatch - required for brightness/illumination
void GramSMC::dispatchTCReport(int code, int loop) {
    if (!kbdDevice) return;
    
    bzero(&tcreport, sizeof(tcreport));
    tcreport.reportID = 3;  // TopCase report ID from HID descriptor
    tcreport.keys[0] = code;
    
    for (int i = 0; i < loop; i++) {
        kbdDevice->handleReport(IOBufferMemoryDescriptor::withBytes(
            &tcreport, sizeof(tcreport), kIODirectionNone));
        
        // Release key
        bzero(&tcreport.keys, sizeof(tcreport.keys));
        kbdDevice->handleReport(IOBufferMemoryDescriptor::withBytes(
            &tcreport, sizeof(tcreport), kIODirectionNone));
    }
}

// 6. Register notifications for VoodooInput/VoodooPS2
void GramSMC::registerNotifications(void) {
    OSDictionary *propertyMatch = propertyMatching(OSSymbol::withCString(kDeliverNotifications), kOSBooleanTrue);
    if (propertyMatch) {
        IOServiceMatchingNotificationHandler handler = 
            OSMemberFunctionCast(IOServiceMatchingNotificationHandler, this, 
                &GramSMC::notificationHandler);
        
        _publishNotify = addMatchingNotification(gIOFirstPublishNotification,
            propertyMatch, handler, this, 0, 10000);
        _terminateNotify = addMatchingNotification(gIOTerminatedNotification,
            propertyMatch, handler, this, 0, 10000);
        propertyMatch->release();
    }
}

// 7. Register with VirtualSMC for ALS/Fan keys
void GramSMC::registerVSMC(void) {
    auto &plugin = vsmcPlugin;
    
    // ALS keys
    VirtualSMCAPI::addKey(KeyALV0, plugin.data, 
        new SMCALSValue(&currentLux, &forceBits));
    VirtualSMCAPI::addKey(KeyLKSB, plugin.data,
        new SMCKBrdBLightValue(this), SMC_KEY_ATTRIBUTE_READ | SMC_KEY_ATTRIBUTE_WRITE);
    
    // Fan keys  
    VirtualSMCAPI::addKey(KeyFNum, plugin.data,
        VirtualSMCAPI::valueWithUint8(1));
    VirtualSMCAPI::addKey(KeyF0Ac, plugin.data,
        new F0Ac(&currentFanSpeed));
}
```

---

## 7. Fix Summary

### Priority 1: Critical Fixes (Kext Won't Function Properly)

| Issue | Location | Fix |
|-------|----------|-----|
| Missing `letSleep()` | GramSMC.cpp | Implement to send kDaemonSleep |
| Missing `toggleAirplaneMode()` | GramSMC.cpp | Implement to send kDaemonAirplaneMode |
| Missing `toggleTouchpad()` | GramSMC.cpp | Implement to toggle state |
| Missing `dispatchCSMRReport()` | GramSMC.cpp | Implement HID report dispatch |
| Missing `dispatchTCReport()` | GramSMC.cpp | Implement HID report dispatch |
| Missing `registerNotifications()` | GramSMC.cpp | Implement notification registration |
| Missing `registerVSMC()` | GramSMC.cpp | Implement VirtualSMC key registration |

### Priority 2: Functional Fixes (Features Won't Work)

| Issue | Location | Fix |
|-------|----------|-----|
| KeyboardBacklight not handled in setProperties | GramSMC.cpp | Add handler in setPropertiesGated() |
| KeyboardBacklight level mapping | GramSMC.cpp | Map 0-2 to 0/127/255 in setKeyboardBacklight() |

### Priority 3: Enhancements

| Issue | Location | Fix |
|-------|----------|-----|
| Missing OSD for some features | GramSMCDaemon | Add BezelServices calls |
| Expose ReaderMode property | GramSMC.cpp | Add setProperty in start() |

---

## 8. Testing Checklist

After implementing fixes, verify:

- [ ] `Fn+F1` toggles fan mode and shows OSD
- [ ] `Fn+F5` toggles touchpad
- [ ] `Fn+F6` toggles airplane mode (WiFi + Bluetooth)
- [ ] `Fn+F9` toggles keyboard backlight
- [ ] `Fn+F12` puts system to sleep
- [ ] Volume keys show OSD and adjust volume
- [ ] Brightness keys adjust screen brightness
- [ ] App can read all IORegistry properties
- [ ] App can write and change: FanMode, BatteryCareLimit, USBCharging, FnLock, KeyboardBacklight
- [ ] CPU temp and Fan RPM display correctly in app

---

## 9. Conclusion

The stack has a **solid foundation** but has **critical missing implementations** in the kext. The SSDT-GramSMC.dsl is well-designed with proper EC access methods. The daemon and app are functional for their purposes. The main blockers are:

1. **8 undefined functions** in GramSMC.cpp that are called but never implemented
2. **KeyboardBacklight setProperty handler missing** - app can't control KB backlight
3. **Level mapping issue** - app sends 0-2 but SSDT expects 0-255

Once these are fixed, the entire stack should work end-to-end.
