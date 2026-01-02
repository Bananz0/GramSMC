# LG Gram Function Key Fix Summary

## Issues Fixed

1. **Brightness keys reversed** - F2/F3 were swapped
2. **Fn+F1, F4, F5, F6, F7, F8, F9 not working** - Missing EC query method handlers
3. **Keyboard backlight not synced with macOS** - Hardware changes weren't relayed
4. **Fan reading not working** - Wrong EC register offset

## Changes Made

### 1. SSDT-GramSMC.dsl (Complete Rewrite)

The SSDT now includes:

#### EC Register Offsets (Verified from DSDT)
- `0x64 bit 0` = TPDP (Touchpad disable/enable setting)
- `0x64 bit 1` = TPDU (Touchpad LED status - 1=LED on/touchpad disabled)
- `0x66 bit 0` = RDMD (Reader Mode - also controls LED)
- `0x73 bit 2` = FNLK (Fn Lock)
- `0xBA` = BMB1 (Battery Care Limit: 0x50=80%, 0x64=100%)
- `0xBE bit 0` = USCC (USB Charging)
- `0xC0 bit 5` = CAMA (Webcam)
- `0xC8` = TMP1 (Temperature)
- `0xCB` = FRPM (Fan RPM / 100)
- `0xCF` = DFAN (Fan Mode)
- `0xDC-DD` = ALS (Ambient Light Sensor, 16-bit)
- `0xE0` = LBRI (Keyboard Backlight Brightness)
- `0xE4` = FNKN (Function Key Number pressed)
- `0xEB bits 0-2` = SLED (Keyboard backlight LED status)

#### Function Key Handlers
| Key | EC Query | Code | Function | LED Control |
|-----|----------|------|----------|-------------|
| Fn+F1 | _Q36 | 0x70 | LG Control Center / Fn Lock Toggle | - |
| Fn+F2 | _Q50 | - | Brightness Down (KEY_F14) | - |
| Fn+F3 | _Q51 | - | Brightness Up (KEY_F15) | - |
| Fn+F4 | _Q34 | 0x5E | Sleep | - |
| Fn+F5 | _Q36 | 0x74 | Touchpad Toggle (KEY_F19) | Yes - EC 0x64 bit 1 (TPDU) |
| Fn+F6 | _Q37 | 0x7D | Airplane Mode | - |
| Fn+F7 | _Q36 | 0x61 | Screen Mirroring (KEY_F16) | - |
| Fn+F8 | _Q64 | - | Keyboard Backlight (hardware) | EC 0xEB bits 0-2 (SLED) |
| Fn+F9 | _Q72 | 0xF9 | Reader Mode Toggle (KEY_F18) | Yes - EC 0x66 bit 0 (RDMD) |
| Fn+F10 | _Q30 | 0x32 | Mute | - |
| Fn+F11 | _Q52 | 0x31 | Volume Down | - |
| Fn+F12 | _Q53 | 0x30 | Volume Up | - |

#### LG Control Center Methods
- `GCAP` - Get capabilities bitmask
- `GFMD/SFMD` - Get/Set Fan Mode (0=Optimal, 1=Silent, 2=Performance)
- `GBCL/SBCL` - Get/Set Battery Care Limit (80 or 100%)
- `GUSC/SUSC` - Get/Set USB Charging
- `GRDM/SRDM` - Get/Set Reader Mode
- `GFNL/SFNL` - Get/Set Fn Lock
- `GWCM/SWCM` - Get/Set Webcam

### 2. config.plist - Added ACPI Patches

New patches added to rename EC query methods:
- `_Q30 → XQ30` (Mute)
- `_Q37 → XQ37` (Airplane mode)
- `_Q52 → XQ52` (Volume Down)
- `_Q53 → XQ53` (Volume Up)
- `_Q72 → XQ72` (Reader Mode)

Existing patches retained:
- `_Q50 → XQ50` (Brightness Down)
- `_Q51 → XQ51` (Brightness Up)
- `_Q34 → XQ34` (Sleep)
- `_Q36 → XQ36` (Multi-function key handler)
- `_Q64 → XQ64` (Keyboard backlight)

### 3. GramSMC.cpp - Updated Event Handler

Added handler for `0x74` (Fn+F5 keyboard backlight toggle).

## Installation Steps

1. **Compile the SSDT:**
   ```bash
   cd /Users/glenm/GramSMC/ACPI-Gram/Patched
   iasl SSDT-GramSMC.dsl
   ```
   Or use MaciASL to compile.

2. **Copy files to OpenCore:**
   ```bash
   # Copy compiled SSDT
   cp SSDT-GramSMC.aml /Volumes/EFI/EFI/OC/ACPI/
   
   # Backup and copy config.plist
   cp /Volumes/EFI/EFI/OC/config.plist /Volumes/EFI/EFI/OC/config.plist.backup
   cp /Users/glenm/GramSMC/ACPI-Gram/config.plist /Volumes/EFI/EFI/OC/config.plist
   ```

3. **Rebuild and install the kext:**
   ```bash
   cd /Users/glenm/GramSMC
   xcodebuild -scheme GramSMC -configuration Release build
   sudo cp -R build/Release/GramSMC.kext /Library/Extensions/
   sudo kextcache -i /
   ```

4. **Reboot**

## VoodooPS2 Configuration

The SSDT includes a `RMCF` configuration block for VoodooPS2:
- Print Screen → F13 (for screenshots)
- Scroll Lock → Dead key

## Debugging

If keys still don't work, check the kernel log:
```bash
log show --predicate 'senderImagePath CONTAINS "GramSMC"' --last 5m
```

Look for messages like:
```
Received key 112(0x70)  # Fn+F1
Received key 116(0x74)  # Fn+F5
```

## Notes

- Brightness keys (F2/F3) are hardware-controlled by EC but now properly notify macOS
- Keyboard backlight (F8) level changes are hardware-controlled and state is tracked in SLED register
- Fan speed is read from EC register 0xCB (value × 100 = RPM)
- **Touchpad LED (Fn+F5)**: Controlled by EC register 0x64 bit 1 (TPDU)
  - When TPDU = 1: LED is ON, touchpad is DISABLED
  - When TPDU = 0: LED is OFF, touchpad is ENABLED
  - SSDT automatically toggles both the LED and touchpad state
- **Reader Mode LED (Fn+F9)**: Controlled by EC register 0x66 bit 0 (RDMD)
  - When RDMD = 1: LED is ON, reader mode is ENABLED
  - When RDMD = 0: LED is OFF, reader mode is DISABLED
  - SSDT toggles the EC bit which controls both the feature and LED
