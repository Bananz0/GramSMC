# GramSMC Quick Start Guide

## What Changed

The build system has been reorganized:

### Before
- Products scattered in: `~/Library/Developer/Xcode/DerivedData/GramSMC-xxx/Build/Products/Debug/`
- SSDT `.aml` files cluttering source directory
- No easy way to install everything

### After  
- All products in: `/Users/glenm/GramSMC/build/Debug/` (or `build/Release`)
- Source directory stays clean (only `.dsl` file)
- One-command installation script included

## Building

1. Open `GramSMC.xcodeproj` in Xcode
2. Select **"GramSMC All"** scheme/target
3. Build (⌘B or Product → Build)
4. Find everything in `build/Debug/` (or `build/Release` for Release builds)

## What Gets Built

The `build/Debug/` folder will contain:
```
build/Debug/
├── GramSMC.kext/                    # Kext for OpenCore
├── GramControlCenter.app/           # Menu bar app
├── GramSMCDaemon                    # Function key daemon
├── com.gramsmc.GramSMCDaemon.plist  # LaunchAgent config
├── SSDT-GramSMC.aml                 # ACPI table for EC access
├── install.sh                       # Installation script
└── README.md                        # Documentation
```

## Installation

### Quick Install (Daemon & App)
```bash
cd /Users/glenm/GramSMC/build/Debug
./install.sh
```

This installs:
- GramSMCDaemon → `/usr/local/bin/`
- GramControlCenter.app → `/Applications/`
- Auto-starts the daemon

### Manual Install (Kext & SSDT to OpenCore)

**The kext and SSDT must be manually installed to your OpenCore EFI:**

1. Mount EFI partition:
   ```bash
   sudo diskutil mount disk0s1
   ```

2. Copy files:
   ```bash
   cp -R build/Debug/GramSMC.kext /Volumes/EFI/EFI/OC/Kexts/
   cp build/Debug/SSDT-GramSMC.aml /Volumes/EFI/EFI/OC/ACPI/
   ```

3. Edit `config.plist`:
   - Add `GramSMC.kext` to `Kernel → Add` (Enabled=true)
   - Add `SSDT-GramSMC.aml` to `ACPI → Add` (Enabled=true)

4. Reboot

## Verification

After installation:

### Check Daemon
```bash
ps aux | grep GramSMCDaemon
```

### Check Kext
```bash
kextstat | grep GramSMC
```

### Check SSDT
```bash
ioreg -l | grep GRAM0001
```

### Check App
Open from Applications folder or launch from menu bar.

## Troubleshooting

### Build Failed
- Make sure `iasl` is installed: `brew install acpica`
- Check Xcode version compatibility

### Daemon Not Running
```bash
# Check logs
log show --predicate 'process == "GramSMCDaemon"' --last 5m

# Manual start
sudo launchctl load /Library/LaunchAgents/com.gramsmc.GramSMCDaemon.plist
```

### Kext Not Loading
```bash
# Check logs
log show --predicate 'subsystem contains "GramSMC"' --last 5m

# Verify SSDT loaded
ioreg -l | grep GRAM
```

## Clean Build

To start fresh:
```bash
# Clean Xcode build
Product → Clean Build Folder (⇧⌘K)

# Remove build directory
rm -rf build/Debug

# Rebuild
Product → Build (⌘B)
```

## Source Tree Organization

```
GramSMC/
├── build/                         # Build products (git-ignored)
│   ├── Debug/                     # Debug build output
│   └── Release/                   # Release build output
├── GramSMC/
│   └── SSDT-GramSMC.dsl          # Source (no .aml!)
├── GramSMCDaemon/
│   ├── main.m
│   └── com.gramsmc.GramSMCDaemon.plist
├── GramControlCenter/
│   └── [source files]
└── Scripts/
    └── install_daemon_app.sh      # Installation script
```

## Version Management

All components share version **1.5.0**, defined in:
- `/Users/glenm/GramSMC/GramSMCVersion.h` (for C/Obj-C code)
- Xcode project settings (`MODULE_VERSION` and `MARKETING_VERSION`)

To update version, change both places.

## More Information

- **Detailed build system docs**: See `BUILD_SYSTEM_CHANGES.md`
- **Build directory guide**: See `build/README.md`
- **Installation guide**: See `docs/INSTALLATION_GUIDE.md`

---

**Current Version**: 1.5.0  
**Build System Updated**: January 2, 2026
