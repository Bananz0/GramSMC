# GramSMC v1.5.0 Implementation Summary

## Overview

All components have been updated to v1.5.0 with synchronized properties and handlers.

## Changes Made

### 1. SSDT-GramSMC.dsl ✅
- **Location:** `ACPI-Gram/Patched/SSDT-GramSMC.dsl`
- **OEM Revision:** Already set to `0x00020000` (v1.5.0)
- **ECON Checks:** Not present (uses direct EC access via `ECRX`/`ECWX`)
- **Brightness Keys:** Uses PS2K notifications (`0x0405`/`0x0406`) - SSDT-FNKey approach
- **Compiled:** `Compiled/SSDT-GramSMC.aml`

### 2. config.plist ✅
- **Location:** `ACPI-Gram/config.plist` and `FinalBuild/config.plist`
- **All Required Renames Present:**
  - `_Q50 → XQ50` (Brightness Down)
  - `_Q51 → XQ51` (Brightness Up)
  - `_Q36 → XQ36` (LG Hotkey remapping)
  - `_Q30 → XQ30` (Mute key)
  - `_Q37 → XQ37` (Airplane mode)
  - `_Q52 → XQ52` (Volume Down)
  - `_Q53 → XQ53` (Volume Up)
  - `_Q64 → XQ64` (Keyboard backlight)
  - `_Q34 → XQ34` (Sleep)
  - `_Q72 → XQ72` (Reader Mode)
  - `_OSI → XOSI` (For SSDT-XOSI)

### 3. GramSMC Kext ✅
- **Location:** `GramSMC/GramSMC.cpp`, `GramSMC/GramSMC.hpp`
- **Version:** Updated to 1.5.0 in `project.pbxproj`
- **New Features:**
  - Added `KeyboardBacklight` handler in `setPropertiesGated()` (0=Off, 1=Low, 2=High)
  - Added `SilentMode` alias for `FanMode` (backwards compatibility)
  - Exposed properties to IORegistry:
    - `KeyboardBacklight` (0-2)
    - `CPUTemp` (from GTMP)
    - `FanRPM` (from GFAN)
    - `GramSMC-Version` (already present)
- **Compiled:** `Compiled/GramSMC.kext`

### 4. GramSMCDaemon ✅
- **Location:** `GramSMCDaemon/main.m`
- **Version:** Already shows `v1.5.0` in startup message
- **Handlers:** All present (kDaemonFanMode=5 through kDaemonWebcam=10)
- **Enum values synced with kext**
- **Compiled:** `Compiled/GramSMCDaemon`

### 5. GramControlCenter App ✅
- **Location:** `GramControlCenter/GramControlCenterApp.swift`
- **Version:** Already set to 1.5.0 in `Info.plist`
- **Changes Made:**
  - Changed `SilentMode` toggle to `FanMode` picker (Optimal/Silent/Performance)
  - Added `fanModeString` computed property for display
  - Added `cycleFanMode()` action for menu bar quick toggle
  - Menu bar shows current fan mode ("Fan Mode: Optimal/Silent/Performance")
  - Settings view has full fan mode picker
  - About section displays:
    - App Version (from Bundle)
    - Kext Version (from `GramSMC-Version` property)
    - Daemon Version (static "1.5.0")
- **Compiled:** `Compiled/GramControlCenter.app`

## Property Synchronization

| Property | SSDT Method | Kext Property | App Uses |
|----------|-------------|---------------|----------|
| Keyboard Backlight | GKBL/SKBL | KeyboardBacklight | ✅ |
| Fan Mode | GFMD/SFMD | FanMode | ✅ |
| Battery Care | GBCL/SBCL | BatteryCareLimit | ✅ |
| USB Charging | GUSC/SUSC | USBCharging | ✅ |
| Fn Lock | GFNL/SFNL | FnLock | ✅ |
| Reader Mode | GRDM/SRDM | ReaderMode | ✅ |
| Webcam | GWCM/SWCM | Webcam | ✅ |
| CPU Temp | GTMP | CPUTemp | ✅ |
| Fan RPM | GFAN | FanRPM | ✅ |
| Capabilities | GCAP | Capabilities | ✅ |

## Build Artifacts

All compiled artifacts are in the `Compiled/` folder:
- `GramSMC.kext` - v1.5.0
- `GramControlCenter.app` - v1.5.0
- `GramSMCDaemon` - v1.5.0
- `SSDT-GramSMC.aml` - OEM Rev 0x00020000

## Installation

1. Copy `SSDT-GramSMC.aml` to `EFI/OC/ACPI/`
2. Update `config.plist` with the renames (already configured in `ACPI-Gram/config.plist`)
3. Copy `GramSMC.kext` to `EFI/OC/Kexts/`
4. Copy `GramSMCDaemon` to `/usr/local/bin/`
5. Copy `GramControlCenter.app` to `/Applications/`
6. Install the launchd plist for the daemon

## Notes

- The FinalBuild folder has permission issues - use `Compiled/` folder instead
- SSDT uses direct EC access via ECRX/ECWX methods (no ECON checks needed)
- Brightness keys use PS2K notifications for native macOS brightness OSD
