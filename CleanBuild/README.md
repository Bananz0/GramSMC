# GramSMC

A VirtualSMC plugin that provides native support for ALS, keyboard backlight, and Fn keys for **LG Gram laptops** on macOS.

*Based on [AsusSMC](https://github.com/hieplpvip/AsusSMC) by Le Bao Hiep*

## Features
- Full Fn keys support (brightness, keyboard backlight, sleep, etc.)
- Native ALS (Ambient Light Sensor) support
- Native keyboard backlight support (16 levels, smooth transition)
- Fan speed monitoring
- Temperature reading

## Requirements
- LG Gram laptop with Intel processor
- SSDT-GramSMC.aml (provided in `ACPI-Gram/Patched/`)
- [Lilu](https://github.com/acidanthera/Lilu)
- [VirtualSMC](https://github.com/acidanthera/VirtualSMC)

## Installation

### 1. Compile SSDT-GramSMC
```bash
cd ACPI-Gram/Patched
iasl SSDT-GramSMC.dsl
```
Copy the resulting `SSDT-GramSMC.aml` to your EFI/OC/ACPI folder.

### 2. Add ACPI Patches
Add the following patches to your OpenCore config.plist under ACPI > Patch:

| Comment | Find | Replace |
|---------|------|---------|
| _Q50 to XQ50 | `5F513530` | `58513530` |
| _Q51 to XQ51 | `5F513531` | `58513531` |
| _Q64 to XQ64 | `5F513634` | `58513634` |
| _Q34 to XQ34 | `5F513334` | `58513334` |
| _Q36 to XQ36 | `5F513336` | `58513336` |

### 3. Install Kext
Copy `GramSMC.kext` to your EFI/OC/Kexts folder and add to config.plist.

## Boot Arguments
- Add `-gramsmcdbg` to enable debug printing (available in DEBUG binaries).

## Supported Keys
| Function | Key Combination |
|----------|-----------------|
| Brightness Up | Fn + F3 |
| Brightness Down | Fn + F2 |
| Keyboard Backlight | Fn + F8 |
| Sleep | Fn + F12 |
| Touchpad Toggle | Fn + F9 |
| Airplane Mode | Fn + F7 |

## EC Registers
GramSMC interfaces with the following LG Gram EC registers:

| Register | Offset | Purpose |
|----------|--------|---------|
| LBRI | 0xE0 | Keyboard Backlight Brightness |
| SLED | 0xEB | Keyboard LED State |
| FNKN | 0xE4 | Function Key Number |
| ALS | 0xDC | Ambient Light Sensor |
| TSR1 | 0xC8 | Temperature Sensor 1 |
| FRPM | 0xCB | Fan RPM |

## Credits
- [Le Bao Hiep](https://github.com/hieplpvip) for [AsusSMC](https://github.com/hieplpvip/AsusSMC) (original project)
- [Apple](https://www.apple.com) for macOS
- [vit9696](https://github.com/vit9696) for [Lilu](https://github.com/acidanthera/Lilu) and [VirtualSMC](https://github.com/acidanthera/VirtualSMC)
- [lvs1974](https://github.com/lvs1974) and [usr-sse2](https://github.com/usr-sse2) for ambient light sensor support
- [tekezo](https://github.com/tekezo) for [VirtualHIDKeyboard](https://github.com/pqrs-org/Karabiner-VirtualHIDDevice/)

## License
BSD 3-Clause License
