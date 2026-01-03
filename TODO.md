# Project Roadmap & Todo

## Night Shift Integration
The app code for Night Shift is implemented but requires build system configuration and hardware hooking.

- [ ] **Xcode Configuration**:
  - Configure `Objective-C Bridging Header` build setting to point to `GramControlCenter/GramControlCenter-Bridging-Header.h`.
  - Link `CoreBrightness.framework` (private framework). May need to be added as "Optional".
- [ ] **Fn+F9 Toggle Logic**:
  - **Goal**: Make Fn+F9 toggle Night Shift AND the physical LED.
  - **Kext**: Needs to toggle EC LED register (`0x66` bit 0 for RDMD).
  - **Communication**: Kext needs to signal the App (or Daemon) to call `setNightShift`.
  - **Current State**: App has `toggleNightShift()` ready to be called.

## ACPI / EC Architecture
- [ ] **ECEnabler Integration**:
  - Investigate using [ECEnabler](https://github.com/averycblack/ECEnabler) for generic EC read/write operations.
  - **Potential Benefit**: Could improve compatibility and reduce custom SSDT code by replacing manual `ECRX`/`ECWX` methods with standard ACPI fields that ECEnabler unlocks.
