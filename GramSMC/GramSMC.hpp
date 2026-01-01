//
//  GramSMC.hpp
//  GramSMC
//
//  Based on AsusSMC by Le Bao Hiep
//  Modified for LG Gram laptops
//
//  Copyright © 2018-2020 Le Bao Hiep. All rights reserved.
//  Copyright © 2024-2025 GramSMC contributors.
//

#ifndef _GramSMC_hpp
#define _GramSMC_hpp

#include <IOKit/IOTimerEventSource.h>
#include <IOKit/IOCommandGate.h>
#include <IOKit/acpi/IOACPIPlatformDevice.h>
#include "HIDReport.hpp"
#include "HIDUsageTables.h"
#include "VirtualAppleKeyboard.hpp"
#include "KernEventServer.hpp"
#include "KeyImplementations.hpp"

// LG Gram EC register offsets
#define GRAM_EC_KBBL_REG           0xE0    // Keyboard backlight brightness
#define GRAM_EC_SLED_REG           0xEB    // Keyboard LED state
#define GRAM_EC_FNKN_REG           0xE4    // Function key number
#define GRAM_EC_ALS_REG            0xDC    // Ambient light sensor (16-bit)
#define GRAM_EC_TEMP1_REG          0xC8    // Temperature sensor 1
#define GRAM_EC_TEMP2_REG          0xC9    // Temperature sensor 2
#define GRAM_EC_FAN_REG            0xCB    // Fan RPM register

// LG Gram Event codes (from SSDT-GramSMC)
#define GRAM_EVENT_BRIGHTNESS_DOWN 0x10
#define GRAM_EVENT_BRIGHTNESS_UP   0x11
#define GRAM_EVENT_KBBL_UP         0xC4
#define GRAM_EVENT_KBBL_DOWN       0xC5
#define GRAM_EVENT_SLEEP           0x5E

#define kDeliverNotifications "RM,deliverNotifications"

#define GramSMCEventCode 0x80

class GramSMC : public IOService {
    OSDeclareDefaultStructors(GramSMC)

    VirtualSMCAPI::Plugin vsmcPlugin {
        xStringify(PRODUCT_NAME),
        parseModuleVersion(xStringify(MODULE_VERSION)),
        VirtualSMCAPI::Version,
    };

public:
    bool init(OSDictionary *dictionary) override;
    bool start(IOService *provider) override;
    void stop(IOService *provider) override;
    IOService *probe(IOService *provider, SInt32 *score) override;
    IOReturn message(uint32_t type, IOService *provider, void *argument) override;

    void letSleep();
    void toggleAirplaneMode();
    void toggleTouchpad();
    void displayOff();

private:
    enum {
        kKeyboardSetTouchStatus = iokit_vendor_specific_msg(100), // set disable/enable touchpad (data is bool*)
        kKeyboardGetTouchStatus = iokit_vendor_specific_msg(101), // get disable/enable touchpad (data is bool*)
        kKeyboardKeyPressTime = iokit_vendor_specific_msg(110),   // notify of timestamp a non-modifier key was pressed (data is uint64_t*)
    };

    enum {
        kDaemonKeyboardBacklight = 1,
        kDaemonAirplaneMode = 2,
        kDaemonSleep = 3,
        kDaemonTouchpad = 4,
    };

    static constexpr uint32_t SensorUpdateTimeoutMS {1000};

    // LG Gram brightness event codes
    static constexpr uint8_t NOTIFY_BRIGHTNESS_UP_MIN = 0x10;
    static constexpr uint8_t NOTIFY_BRIGHTNESS_UP_MAX = 0x1F;

    static constexpr uint8_t NOTIFY_BRIGHTNESS_DOWN_MIN = 0x20;
    static constexpr uint8_t NOTIFY_BRIGHTNESS_DOWN_MAX = 0x2F;

    void initGramDevice();
    void initALSDevice();
    void initECDevice();
    void initVirtualKeyboard();

    void startGramDevice();
    
    bool refreshALS(bool post);
    bool refreshFan();

    void handleMessage(int code);

    // LG Gram device (GRAM0001 from SSDT)
    IOACPIPlatformDevice *gramDevice {nullptr};
    IOACPIPlatformDevice *alsDevice {nullptr};
    IOACPIPlatformDevice *ecDevice {nullptr};
    VirtualAppleKeyboard *kbdDevice {nullptr};

    ALSForceBits forceBits;
    _Atomic(uint32_t) currentLux = ATOMIC_VAR_INIT(0);
    _Atomic(uint16_t) currentFanSpeed = ATOMIC_VAR_INIT(0);

    IONotifier *vsmcNotifier {nullptr};

    IOWorkLoop *workloop {nullptr};
    IOCommandGate *command_gate {nullptr};
    IOTimerEventSource *poller {nullptr};

    KernEventServer kev;

    consumer_input csmrreport;
    apple_vendor_top_case_input tcreport;

    bool directACPImessaging {true};   // LG Gram uses direct messaging
    bool hasKeyboardBacklight {true};  // LG Gram has keyboard backlight
    bool isALSEnabled {true};
    bool isTouchpadEnabled {true};
    bool isPanelBackLightOn {true};
    bool isTACHAvailable {false};

    uint32_t panelBrightnessLevel {16};
    char backlightEntry[1000];

    int checkBacklightEntry();
    int findBacklightEntry();
    void readPanelBrightnessValue();

    // Keyboard backlight control via ACPI
    uint32_t getKeyboardBacklight();
    void setKeyboardBacklight(uint32_t level);

    IOReturn postKeyboardInputReport(const void *report, uint32_t reportSize);
    void dispatchCSMRReport(int code, int loop = 1);
    void dispatchTCReport(int code, int loop = 1);

    IONotifier *_publishNotify {nullptr};
    IONotifier *_terminateNotify {nullptr};
    OSSet *_notificationServices {nullptr};
    void registerNotifications(void);
    void notificationHandlerGated(IOService *newService, IONotifier *notifier);
    bool notificationHandler(void *refCon, IOService *newService, IONotifier *notifier);
    void dispatchMessageGated(int *message, void *data);
    void dispatchMessage(int message, void *data);

    void registerVSMC(void);
    static bool vsmcNotificationHandler(void *sensors, void *refCon, IOService *vsmc, IONotifier *notifier);
};

#endif //_GramSMC_hpp
