# Build System Reorganization Summary

## Problem Statement
The build system had several issues:
1. Build products were buried deep in DerivedData: `/Users/glenm/Library/Developer/Xcode/DerivedData/GramSMC-dweuwqxgfypzkldhwlsfbpbfihnp/Build/Products/Debug/`
2. SSDT compilation created both DSL and AML files in the source directory
3. No centralized build output location
4. No installation script in the build folder

## Solution Implemented

### 1. Centralized Build Directory
**New Location**: `/Users/glenm/GramSMC/build/Debug` (or `build/Release`)

All build products now go to a single, predictable location in the project root.

### 2. SSDT Build Process (First Shell Script Phase)
**Script Location**: Target "GramSMC All" → Build Phases → First ShellScript

**What it does**:
- Compiles `/Users/glenm/GramSMC/GramSMC/SSDT-GramSMC.dsl` 
- Outputs `SSDT-GramSMC.aml` to `build/${CONFIGURATION}/`
- **Moves** (not copies) AML out of source directory
- Cleans up `.hex` artifacts from source
- Keeps DSL file in source (as it should be)

### 3. Product Collection (Second Shell Script Phase)
**Script Location**: Target "GramSMC All" → Build Phases → Second ShellScript

**What it does**:
- Copies `GramSMC.kext` from DerivedData to `build/${CONFIGURATION}/`
- Copies `GramControlCenter.app` from DerivedData to `build/${CONFIGURATION}/`
- Copies `GramSMCDaemon` binary to `build/${CONFIGURATION}/`
- Copies `com.gramsmc.GramSMCDaemon.plist` to `build/${CONFIGURATION}/`
- Copies installation script as `install.sh` to `build/${CONFIGURATION}/`
- Lists all files for verification

### 4. Installation Script
**Location**: `/Users/glenm/GramSMC/Scripts/install_daemon_app.sh`
**Copied to**: `build/${CONFIGURATION}/install.sh`

**What it does**:
- Stops and uninstalls existing GramSMCDaemon (if running)
- Stops and uninstalls existing GramControlCenter (if running)
- Installs new daemon to `/usr/local/bin/GramSMCDaemon`
- Installs new app to `/Applications/GramControlCenter.app`
- Sets up LaunchAgent for daemon auto-start
- Provides instructions for manual kext/SSDT installation to OpenCore

### 5. Documentation
**Created**: `/Users/glenm/GramSMC/build/README.md`

Comprehensive guide covering:
- Build directory contents
- Installation procedures (automatic and manual)
- Uninstallation procedures  
- Troubleshooting tips
- File organization

## File Organization

### Source Files (No Build Artifacts)
```
/Users/glenm/GramSMC/
├── GramSMC/
│   ├── SSDT-GramSMC.dsl          # Source file (KEPT)
│   └── [NO .aml or .hex files]   # Artifacts removed
├── GramSMCDaemon/
│   ├── main.m
│   └── com.gramsmc.GramSMCDaemon.plist
└── GramControlCenter/
    └── [source files]
```

### Build Output (All Products Together)
```
/Users/glenm/GramSMC/build/Debug/  # or Release
├── GramSMC.kext/                   # Kext (for OpenCore)
├── GramControlCenter.app/          # App (auto-installed)
├── GramSMCDaemon                   # Daemon (auto-installed)
├── com.gramsmc.GramSMCDaemon.plist # LaunchAgent config
├── SSDT-GramSMC.aml                # ACPI table (for OpenCore)
├── install.sh                      # Installation script
└── README.md                       # Documentation
```

## Usage

### Building
1. Open `GramSMC.xcodeproj` in Xcode
2. Select **"GramSMC All"** target
3. Build (⌘B)
4. All products appear in `build/Debug/` (or `build/Release/`)

### Installing Daemon & App
```bash
cd /Users/glenm/GramSMC/build/Debug
./install.sh
```

### Installing Kext & SSDT (Manual)
1. Mount EFI partition
2. Copy `GramSMC.kext` to `EFI/OC/Kexts/`
3. Copy `SSDT-GramSMC.aml` to `EFI/OC/ACPI/`
4. Add both to `config.plist`
5. Reboot

## Benefits

1. **Predictable locations**: No more searching through DerivedData
2. **Clean source tree**: No build artifacts in source directories
3. **All-in-one package**: Everything needed in one folder
4. **Easy distribution**: Zip the build folder and share
5. **Automated installation**: One-command install for daemon/app
6. **Clear separation**: Manual install for kext/SSDT (as intended for OpenCore)

## Changes Made to Project

### Modified Files
1. `/Users/glenm/GramSMC/GramSMC.xcodeproj/project.pbxproj`
   - Added first shell script phase for SSDT compilation
   - Added second shell script phase for product collection
   - Both phases added to "GramSMC All" target

### Created Files
1. `/Users/glenm/GramSMC/Scripts/install_daemon_app.sh` - Installation script
2. `/Users/glenm/GramSMC/build/README.md` - Documentation

### No Breaking Changes
- Existing build targets (GramSMC, GramSMCDaemon, GramControlCenter) unchanged
- DerivedData still contains intermediate build products (as normal)
- Only "GramSMC All" aggregate target has new behavior

## Testing

After building "GramSMC All" target, verify:
```bash
ls -lh /Users/glenm/GramSMC/build/Debug/
# Should show:
# - GramSMC.kext/
# - GramControlCenter.app/
# - GramSMCDaemon
# - com.gramsmc.GramSMCDaemon.plist
# - SSDT-GramSMC.aml
# - install.sh
# - README.md
```

Check source is clean:
```bash
ls /Users/glenm/GramSMC/GramSMC/SSDT*
# Should only show:
# SSDT-GramSMC.dsl
```

## Notes

- Build configuration (Debug/Release) determines subfolder in `build/`
- SSDT compilation requires `iasl` (install via `brew install acpica`)
- Installation script requires sudo for daemon installation
- Kext and SSDT must be installed to OpenCore manually (by design)
