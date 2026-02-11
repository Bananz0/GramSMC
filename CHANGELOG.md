# GramSMC Changelog

## v1.5.1

### Fixed
- Fixed kext build failure on macOS 26 / Xcode 26.2 CI runner.
- Updated header search paths for MacKernelSDK compatibility.
- Added ARM64e library support for kernel extensions.
- Synchronized all component versions to 1.5.1.

## v1.5.0

GramSMC is a fork of AsusSMC adapted for LG Gram laptops. Built for macOS Tahoe (macOS 26) with Xcode 26.

### Added

- SSDT-GramSMC.dsl with LG Gram EC register access
- GramControlCenter.app menu bar application
- GramSMCDaemon with OSD bezel support
- Fan mode control (Normal/Silent matching original LG Control Center)
- Battery care limit control (80%/100%)
- USB charging toggle
- Fn lock toggle
- Reader mode toggle
- Webcam toggle
- CPU temperature monitoring
- Fan RPM monitoring
- IORegistry property exposure for user-space apps
- Research folder with EC dump methodology and WMI reference

### Changed

- Renamed all AsusSMC references to GramSMC
- Changed device matching from ATK to GRAM0001
- Replaced ASUS WMI methods with direct EC access
- Updated Info.plist bundle identifiers
- Updated Xcode project structure
- Added proper _OSI("Darwin") checks for Windows compatibility
- Fan mode simplified to 2 modes (Normal/Silent) to match original LG Control Center

### Removed

- ASUS WMI interface code
- ASUS ATK device matching
- Battery RSOC monitoring (not applicable to LG Gram)

### Known Limitations

- Full bidirectional app-to-hardware control needs hardware testing
- Some function key actions need verification
- OSD bezels not shown for all feature toggles

---

## AsusSMC Changelog (Original Project)

The following changelog entries are from the original AsusSMC project by Le Bao Hiep.

### v1.4.1

- Added MacKernelSDK with Xcode 12 compatibility
- Drop experimental custom fan control code
- Drop AsusHID as I could not make it work on Catalina and above
- Improving touchpad toggling mechanism

### v1.4.0

- Rework keyboard backlight mechanism
- Rework ambient light sensor mechanism
- Add experimental support for reading fan speed with WMI
- Support battery charge threshold found on new laptops

### v1.3.1

- Removed unimplemented virtual methods for kext to load correctly

### v1.3.0

- Native keyboard backlight on Catalina

### v1.2.3

- Remove unused WMI code
- Correct usage of powerStateOrdinal in setPowerState

### v1.2.2

- Fix keyboard backlight remaining off after sleep on Catalina

### v1.2.1

- Built with Lilu 1.4.1 and VirtualSMC 1.1.0
- Update OSBundleLibraries
- Fix install_daemon.sh

### v1.2.0

- Added support for USB HID keyboards found on ROG models
- Optimized code
- Updated MaciASL patches
- Unified release archive names
- Changed dependency from IOHIDSystem to IOHIDFamily
- Change AsusSMCDaemon installation location for Catalina
- Add workaround for keyboard backlight on Catalina

### v1.1.1

- Fixed memory leaks
- Added support for direct messages from ACPI

### v1.1.0

- Optimized code

### v1.0.3

- Improved message handling mechanism

### v1.0.2

- Optimized code

### v1.0.1

- Write data to SMC key after setting keyboard backlight

### v1.0.0

- Initial release
