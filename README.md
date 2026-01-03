# GramSMC

A VirtualSMC plugin for LG Gram laptops on macOS. Provides ambient light sensor support, keyboard backlight control, function key handling, and fan monitoring.

Based on AsusSMC by Le Bao Hiep (https://github.com/hieplpvip/AsusSMC).

Project Home: https://github.com/Bananz0/GramSMC


## Current Status

GramSMC v1.5.0 is under active development. Built for macOS Tahoe (macOS 26) with Xcode 26.

### Working

- SSDT-GramSMC loads and creates the GRAM0001 ACPI device
- GramSMC.kext loads and attaches to the GRAM0001 device
- Kext exposes properties to IORegistry (readable by apps)
- GramControlCenter.app can read all kext properties
- GramSMCDaemon connects to kext via kernel events
- EC register access methods (ECRX/ECWX) in SSDT are functional
- VirtualSMC plugin registration for ALS and fan keys

### Partially Working

- Function key events are detected by the kext
- App-to-kext property writes are received but some do not propagate to hardware
- Brightness keys notify PS2K but may require VoodooPS2 configuration
- Keyboard backlight level mapping between app (0-2) and EC (0-255) is implemented

### Not Yet Working

- Full bidirectional control from app to hardware
- Some function key actions need hardware testing
- OSD bezels for all feature toggles


## Components

### SSDT-GramSMC.dsl

Defines the GRAM0001 device and provides methods for EC access.

Location: ACPI-Gram/Patched/SSDT-GramSMC.dsl

Key methods:
- GKBL/SKBL for keyboard backlight
- GFMD/SFMD for fan mode (Normal/Silent)
- GBCL/SBCL for battery care limit
- GTMP for CPU temperature
- GFAN for fan speed

### GramSMC.kext

The kernel extension that bridges ACPI and VirtualSMC.

Location: GramSMC/

Features:
- Matches on GRAM0001 HID
- Handles ACPI notifications via message()
- Exposes IORegistry properties for user-space apps
- Integrates with VirtualSMC for SMC keys

### GramSMCDaemon

Background process that receives kernel events and shows OSD bezels.

Location: GramSMCDaemon/

Handles:
- Fan mode changes
- Keyboard backlight changes
- Sleep command
- Airplane mode toggle

### GramControlCenter.app

Menu bar application for controlling LG Gram features.

Location: GramControlCenter/

Controls:
- Fan mode (Normal/Silent)
- Keyboard backlight level
- Battery care limit
- USB charging toggle
- Fn lock toggle


## Requirements

- LG Gram laptop with Intel processor
- macOS Tahoe (macOS 26) or later
- Xcode 26 for building
- Lilu (https://github.com/acidanthera/Lilu)
- VirtualSMC (https://github.com/acidanthera/VirtualSMC)
- OpenCore bootloader


## Installation

### 1. Compile SSDT

```
cd ACPI-Gram/Patched
iasl SSDT-GramSMC.dsl
```

Copy SSDT-GramSMC.aml to EFI/OC/ACPI/

### 2. Add ACPI Patches

Add the following patches to config.plist under ACPI, Patch:

| Comment | Find | Replace |
|---------|------|---------|
| _Q50 to XQ50 | 5F513530 | 58513530 |
| _Q51 to XQ51 | 5F513531 | 58513531 |
| _Q64 to XQ64 | 5F513634 | 58513634 |
| _Q34 to XQ34 | 5F513334 | 58513334 |
| _Q36 to XQ36 | 5F513336 | 58513336 |
| _Q30 to XQ30 | 5F513330 | 58513330 |
| _Q37 to XQ37 | 5F513337 | 58513337 |
| _Q52 to XQ52 | 5F513532 | 58513532 |
| _Q53 to XQ53 | 5F513533 | 58513533 |
| _Q72 to XQ72 | 5F513732 | 58513732 |

### 3. Install Kext

Copy GramSMC.kext to EFI/OC/Kexts/ and add to config.plist Kernel, Add section.

### 4. Install Daemon and App

```
cp GramSMCDaemon /usr/local/bin/
cp -R GramControlCenter.app /Applications/
```

Install the launchd plist to auto-start the daemon.


## EC Register Reference

The following EC registers are accessed by GramSMC. See Research/EC_Dumps/ for the raw dumps used to identify these offsets.

| Register | Offset | Purpose |
|----------|--------|---------|
| FNLK | 0x73 bit 2 | Fn Lock |
| BCSP | 0xBC | Battery Care Limit (0x50=80%, 0x64=100%) |
| USCC | 0xBE bit 0 | USB Charging |
| TSR1 | 0xC8 | CPU Temperature |
| FRPM | 0xCB | Fan RPM (multiply by 100) |
| DFAN | 0xCF | Fan Mode (0x00=Normal, 0x11=Silent) |
| LBRI | 0xE0 | Keyboard Backlight Brightness |
| FNKN | 0xE4 | Function Key Number |
| SLED | 0xEB | Keyboard LED State |
| ALS | 0xDC-0xDD | Ambient Light Sensor (16-bit) |

For detailed WMI and EC documentation see Research/LG_GRAM_EC_WMI_REFERENCE.md.


## Function Keys

| Key | EC Query | Action |
|-----|----------|--------|
| Fn+F1 | _Q36 | Launch Control Center app (original) or custom action via macOS binding or Fn mode toggle |
| Fn+F2 | _Q50 | Brightness down |
| Fn+F3 | _Q51 | Brightness up |
| Fn+F4 | _Q34 | Sleep |
| Fn+F5 | _Q36 | Touchpad toggle |
| Fn+F6 | _Q37 | Airplane mode |
| Fn+F7 | _Q36 | Screen mirroring |
| Fn+F8 | _Q64 | Keyboard backlight |
| Fn+F9 | _Q72 | Reader mode |
| Fn+F10 | _Q30 | Mute |
| Fn+F11 | _Q52 | Volume down |
| Fn+F12 | _Q53 | Volume up |


## Fan Modes

GramSMC supports two fan modes matching the original LG Control Center:

| Mode | Value | Description |
|------|-------|-------------|
| Normal | 0x00 | Standard fan behavior |
| Silent | 0x11 | Reduced fan speed for quiet operation |


## Boot Arguments

- `-gramsmcdbg` enables debug logging in DEBUG builds
- `-vsmcdbg` enables VirtualSMC debug logging


## Building from Source

### Requirements

- macOS Tahoe (macOS 26)
- Xcode 26
- MacKernelSDK
- Lilu SDK
- VirtualSMC SDK

### Build

```
git clone https://github.com/acidanthera/MacKernelSDK
cd GramSMC
bash Scripts/bootstrap.sh
xcodebuild -project GramSMC.xcodeproj \
           -scheme 'GramSMC All' \
           -configuration Release \
           -derivedDataPath build \
           build
```

Artifacts will be located in `build/Release/`.



## Research Data

The Research/ directory contains:
- EC_Dumps/ with categorized EC memory snapshots
- LG_GRAM_EC_WMI_REFERENCE.md with WMI and EC register documentation
- README.md explaining the dump methodology

These dumps were captured by toggling features in LG Control Center on Windows and comparing the binary differences.


## Future Considerations

ECEnabler (https://github.com/averycblack/ECEnabler) may be used in future versions for EC reads and writes instead of custom SSDT methods.


## Known Issues

- Full bidirectional app-to-hardware control needs hardware testing
- Some function key LEDs may not synchronize with software state
- Windows dual-boot may be affected by ACPI patches (boot Windows directly from BIOS to avoid)


## Credits

- Le Bao Hiep for AsusSMC (https://github.com/hieplpvip/AsusSMC)
- Nate Thompson for Shifty and CBBlueLightClient (https://github.com/thompsonate/Shifty)
- vit9696 for Lilu and VirtualSMC
- lvs1974 and usr-sse2 for ambient light sensor support
- tekezo for VirtualHIDKeyboard
- Matan Ziv-Av for lg-laptop.c Linux driver


## License

BSD 3-Clause License

Copyright 2018-2020 Le Bao Hiep
Copyright 2024-2026 Glen Muthoka Mutinda
