//
//  GramSMC.hpp
//  GramSMC
//
//  Based on AsusSMC by Le Bao Hiep.
//  Modified for LG Gram laptops.
//
//  Copyright © 2018-2020 Le Bao Hiep. All rights reserved.
//  Copyright © 2026 Glen Muthoka Mutinda.
//

#ifndef GramSMC_hpp
#define GramSMC_hpp

#include <IOKit/IOCommandGate.h>
#include <IOKit/IOLib.h>
#include <IOKit/IOService.h>
#include <IOKit/IOTimerEventSource.h>
#include <IOKit/acpi/IOACPIPlatformDevice.h>

#include "../Global/HIDReport.hpp"
#include "../KernEventServer/KernEventServer.hpp"
#include "../VirtualAppleKeyboard/VirtualAppleKeyboard.hpp"
#include "KeyImplementations.hpp"

#define PRODUCT_NAME GramSMC

// Lilu's ADDPR macro is now defined via KeyImplementations.hpp includes
// Declare the debug flags that will be defined in GramSMC.cpp
extern bool ADDPR(debugEnabled);
extern uint32_t ADDPR(debugPrintDelay);

#define GramSMCEventCode 0x4752414D // 'GRAM'

// LG Gram capabilities bits (matches LG Control Center)
#define kCapFanMode 0x01
#define kCapBatteryCare 0x02
#define kCapUSBCharging 0x04
#define kCapReaderMode 0x08
#define kCapFnLock 0x10
#define kCapWebcam 0x20

// Fan Modes (matching LG Control Center: Normal and Silent only)
#define kFanModeNormal 0
#define kFanModeSilent 1

// LG Gram specific event codes (from SSDT-GramSMC)
#define GRAM_EVENT_BRIGHTNESS_DOWN 0x10
#define GRAM_EVENT_BRIGHTNESS_UP 0x11
#define GRAM_EVENT_KBBL_UP 0xC4
#define GRAM_EVENT_KBBL_DOWN 0xC5
#define GRAM_EVENT_SLEEP 0x5E

#define NOTIFY_BRIGHTNESS_DOWN_MIN 0x20
#define NOTIFY_BRIGHTNESS_DOWN_MAX 0x2F
#define NOTIFY_BRIGHTNESS_UP_MIN 0x10
#define NOTIFY_BRIGHTNESS_UP_MAX 0x1F

#define SensorUpdateTimeoutMS 1000

class GramSMC : public IOService {
OSDeclareDefaultStructors(GramSMC)

    public : virtual bool init(OSDictionary *dict) override;
  virtual IOService *probe(IOService *provider, SInt32 *score) override;
  virtual bool start(IOService *provider) override;
  virtual void stop(IOService *provider) override;
  virtual IOReturn message(uint32_t type, IOService *provider,
                           void *argument = 0) override;
  virtual IOReturn setProperties(OSObject *properties) override;
  virtual bool setProperty(const char *key, uint64_t value, int width);
  using IOService::setProperty;

  bool hasKeyboardBacklight = false;
  _Atomic(uint32_t) currentLux;
  _Atomic(uint16_t) currentFanSpeed;

  static IOReturn gramNotificationHandler(void *refCon, UInt32 messageType,
                                          IOService *provider,
                                          void *messageArgument);

protected:
  void handleMessage(int code);
  void setPropertiesGated(OSObject *props);

  void initGramDevice();
  void initALSDevice();
  void initECDevice();
  void initVirtualKeyboard();
  void startGramDevice();

  bool refreshALS(bool post);
  bool refreshFan();
  void refreshECStates();

  // LG Control Center Features
  uint32_t getCapabilities();

  uint32_t getFanMode();
  void setFanMode(uint32_t mode);
  void cycleFanMode();

  uint32_t getBatteryCareLimit();
  void setBatteryCareLimit(uint32_t limit);

  bool getUSBCharging();
  void setUSBCharging(bool enabled);

  bool getReaderMode();
  void setReaderMode(bool enabled);
  void toggleReaderMode();

  bool getFnLock();
  void setFnLock(bool enabled);

  bool getWebcam();
  void setWebcam(bool enabled);

  uint32_t getKeyboardBacklight();

  void setKeyboardBacklight(uint32_t level);

  void readPanelBrightnessValue();
  int findBacklightEntry();
  int checkBacklightEntry();
  void displayOff();

  void toggleTouchpad();
  void toggleAirplaneMode();
  void letSleep();

  void dispatchTCReport(int code, int loop = 1);
  void dispatchCSMRReport(int code, int loop = 1);
  IOReturn postKeyboardInputReport(const void *report, uint32_t reportSize);

private:
  IOACPIPlatformDevice *gramDevice;
  IOACPIPlatformDevice *alsDevice;
  IOACPIPlatformDevice *ecDevice;

  VirtualAppleKeyboard *kbdDevice;
  apple_vendor_top_case_input tcreport;
  consumer_input csmrreport;

  KernEventServer kev;

  IOWorkLoop *workloop;
  IOTimerEventSource *poller;
  IOCommandGate *command_gate;

  bool directACPImessaging = false;
  bool isALSEnabled = false;
  bool isTACHAvailable = false;
  bool isTouchpadEnabled = true;

  uint32_t capabilities;
  uint32_t currentFanMode = 0;
  uint32_t currentBatteryCareLimit = 100;
  bool currentUSBCharging = false;
  bool currentReaderMode = false;
  bool currentFnLock = false;
  bool currentWebcam = true;

  bool isPanelBackLightOn = true;
  uint32_t panelBrightnessLevel = 0;
  char backlightEntry[256];

  OSSet *_notificationServices;
  IONotifier *_publishNotify;
  IONotifier *_terminateNotify;

  ALSForceBits forceBits;
  IONotifier *vsmcNotifier;

  VirtualSMCAPI::Plugin vsmcPlugin{
      xStringify(PRODUCT_NAME),
      parseModuleVersion(xStringify(MODULE_VERSION)),
      VirtualSMCAPI::Version,
  };

  static bool vsmcNotificationHandler(void *sensors, void *refCon,
                                      IOService *vsmc, IONotifier *notifier);

  void registerNotifications();

#include "../Global/HIDUsageTables.h"

#define kDeliverNotifications "RM,deliverNotifications"

  enum {
    kDaemonKeyboardBacklight = 1,
    kDaemonAirplaneMode = 2,
    kDaemonSleep = 3,
    kDaemonTouchpad = 4,
    kDaemonFanMode = 5,
    kDaemonReaderMode = 6,
  };

  static IOReturn notificationHandlerGated(OSObject *owner, void *arg0,
                                           void *arg1, void *arg2, void *arg3);
  bool notificationHandler(void *refCon, IOService *newService,
                           IONotifier *notifier);

  void registerVSMC();
};

#endif /* GramSMC_hpp */
