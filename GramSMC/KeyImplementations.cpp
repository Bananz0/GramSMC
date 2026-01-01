//
//  KeyImplementations.cpp
//  GramSMC
//
//  Based on AsusSMC by Le Bao Hiep
//  Modified for LG Gram laptops
//
//  Copyright © 2018-2020 Le Bao Hiep. All rights reserved.
//  Copyright © 2024-2025 GramSMC contributors.
//

#include "KeyImplementations.hpp"
#include "GramSMC.hpp"

SMC_RESULT SMCALSValue::readAccess() {
    auto value = reinterpret_cast<Value *>(data);
    uint32_t lux = atomic_load_explicit(currentLux, memory_order_acquire);
    uint8_t bits = forceBits->bits();

    if (lux == 0xFFFFFFFF) {
        value->valid = false;
    } else {
        value->valid = true;
        if (!(bits & ALSForceBits::kALSForceHighGain))
            value->highGain = true;
        if (!(bits & ALSForceBits::kALSForceChan))
            value->chan0 = OSSwapHostToBigInt16(lux);
        if (!(bits & ALSForceBits::kALSForceLux))
            value->roomLux = OSSwapHostToBigInt32(lux << 14);
    }

    return SmcSuccess;
}

SMC_RESULT SMCKBrdBLightValue::update(const SMC_DATA *src)  {
    lkb *value = new lkb;
    lilu_os_memcpy(value, src, size);

    // tval is in range [0x0, 0xffb]
    uint16_t tval = (value->val1 << 4) | (value->val2 >> 4);
    DBGLOG("lksb", "LKSB update %d", tval);

    delete value;

    if (gramSMCInstance) {
        gramSMCInstance->message(kSetKeyboardBacklightMessage, nullptr, &tval);
    }

    lilu_os_memcpy(data, src, size);
    return SmcSuccess;
}

SMC_RESULT F0Ac::readAccess() {
    uint16_t speed = atomic_load_explicit(currentSpeed, memory_order_acquire);
    *reinterpret_cast<uint16_t *>(data) = VirtualSMCAPI::encodeIntFp(SmcKeyTypeFpe2, speed);
    return SmcSuccess;
}

// Note: BDVT (BatteryDev Toggle) is removed for LG Gram as it uses different
// battery management. The class remains in header for API compatibility.
SMC_RESULT BDVT::update(const SMC_DATA *src)  {
    // LG Gram does not support this feature
    // Just copy data and return success
    lilu_os_memcpy(data, src, size);
    return SmcSuccess;
}
