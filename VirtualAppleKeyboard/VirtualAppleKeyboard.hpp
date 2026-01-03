//
//  VirtualAppleKeyboard.hpp
//  VirtualAppleKeyboard
//
//  Copyright © 2018-2020 Le Bao Hiep. All rights reserved.
//  Copyright © 2026 Glen Muthoka Mutinda.
//

#include <IOKit/hid/IOHIDDevice.h>

class VirtualAppleKeyboard final : public IOHIDDevice {
    OSDeclareDefaultStructors(VirtualAppleKeyboard);

public:
    bool handleStart(IOService *provider) override;

    IOReturn newReportDescriptor(IOMemoryDescriptor **descriptor) const override;

    IOReturn getReport(IOMemoryDescriptor *report, IOHIDReportType reportType, IOOptionBits options) override;

    OSString *newManufacturerString() const override;
    OSString *newProductString() const override;
    OSNumber *newVendorIDNumber() const override;
    OSNumber *newProductIDNumber() const override;
    OSNumber *newLocationIDNumber() const override;
    OSNumber *newCountryCodeNumber() const override;
    OSNumber *newVersionNumber() const override;
    OSNumber *newPrimaryUsagePageNumber() const override;
    OSNumber *newPrimaryUsageNumber() const override;
};
