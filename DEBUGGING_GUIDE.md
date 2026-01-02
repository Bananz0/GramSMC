# GramSMC Debugging Guide

## Current Status (Jan 2, 2026)

### ✅ What's Working
1. **SSDT-GramSMC is loaded** - GRAM0001 device is present in IORegistry
2. **Build system** - Compiles SSDT automatically during kext build
3. **Daemon & App** - Can be installed via Scripts/install_all.sh

### ❌ What's NOT Working
1. **GramSMC.kext is NOT loaded** - No entry in kernel extensions list
2. **App can't connect** - Because kext isn't loaded

## IORegistry Status

The GRAM device is present:
```
| +-o GRAM  <class IOACPIPlatformDevice, id 0x10000022c, registered, matched, active, busy 0 (0 ms), retain 7>
| |   {
| |     "_STA" = 15
| |     "_UID" = "1"
| |     "name" = <"GRAM0001">
| |     "compatible" = <"GRAM0001">
| |   }
```

**This means:**
- ✅ SSDT-GramSMC.aml is loaded by OpenCore
- ✅ ACPI device GRAM0001 is present
- ❌ GramSMC.kext is NOT attaching to it

## Why GramSMC.kext Isn't Loading

### Possible Causes:

1. **Kext not in OpenCore config.plist**
   - Check: `EFI/OC/config.plist` → `Kernel` → `Add`
   - Must have entry for GramSMC.kext with `Enabled = true`

2. **Kext not copied to OpenCore**
   - The kext must be at: `EFI/OC/Kexts/GramSMC.kext`
   - Use the one from: `build/Release/GramSMC.kext`

3. **Dependencies not met**
   - GramSMC requires:
     - Lilu.kext (must load BEFORE GramSMC)
     - VirtualSMC.kext (must load BEFORE GramSMC)
   - Check load order in config.plist

4. **IOKit matching problem**
   - GramSMC.kext Info.plist must match "GRAM0001"
   - Check `IOKitPersonalities` section

5. **Security/signing issues**
   - macOS may block unsigned kexts
   - Need to disable SIP or sign the kext

## Checking Your OpenCore Config

### Current OpenCore Files Location
Your OpenCore installation is on your EFI partition. To check:

```bash
# List all EFI partitions
diskutil list

# Mount EFI (usually disk0s1 or disk1s1)
sudo diskutil mount disk0s1

# Check if GramSMC.kext is there
ls -la /Volumes/EFI/EFI/OC/Kexts/ | grep GramSMC
```

### Check config.plist

Look for GramSMC in the Kernel section:
```xml
<key>Kernel</key>
<dict>
    <key>Add</key>
    <array>
        <!-- Should have Lilu first -->
        <dict>
            <key>BundlePath</key>
            <string>Lilu.kext</string>
            <key>Enabled</key>
            <true/>
            ...
        </dict>
        <!-- Then VirtualSMC -->
        <dict>
            <key>BundlePath</key>
            <string>VirtualSMC.kext</string>
            <key>Enabled</key>
            <true/>
            ...
        </dict>
        <!-- THEN GramSMC -->
        <dict>
            <key>BundlePath</key>
            <string>GramSMC.kext</string>
            <key>Enabled</key>
            <true/>
            <key>ExecutablePath</key>
            <string>Contents/MacOS/GramSMC</string>
            <key>PlistPath</key>
            <string>Contents/Info.plist</string>
            <key>MinKernel</key>
            <string>20.0.0</string>
            <key>MaxKernel</key>
            <string></string>
        </dict>
    </array>
</dict>
```

## Installation Steps

### 1. Build Everything
```bash
cd /Users/glenm/GramSMC

# Clean build
xcodebuild -project GramSMC.xcodeproj -scheme GramSMC -configuration Release clean

# Build (will also compile SSDT)
xcodebuild -project GramSMC.xcodeproj -scheme GramSMC -configuration Release build
```

### 2. Check Build Output
```bash
ls -lh build/Release/
# Should see:
#   - GramSMC.kext/
#   - GramSMCDaemon
#   - GramControlCenter.app/
#   - SSDT-GramSMC.aml
#   - SSDT-GramSMC.dsl
```

### 3. Install to OpenCore (MANUAL - Don't Mount EFI via Terminal)

**Use OpenCore Configurator or ProperTree:**

a) Mount EFI partition using Finder/Disk Utility
b) Copy files:
   - `build/Release/GramSMC.kext` → `EFI/OC/Kexts/`
   - `build/Release/SSDT-GramSMC.aml` → `EFI/OC/ACPI/`

c) Edit config.plist:
   - Add SSDT-GramSMC.aml to ACPI → Add
   - Add GramSMC.kext to Kernel → Add (AFTER Lilu and VirtualSMC)
   - Ensure all required ACPI renames are present (see docs/LG_GRAM_EC_WMI_REFERENCE.md)

d) Save and reboot

### 4. Install Daemon & App
```bash
# After reboot, install userspace components
sudo bash Scripts/install_all.sh
```

## Verification Commands

### Check if SSDT is loaded
```bash
ioreg -l | grep -i GRAM
# Should show GRAM0001 device
```

### Check if kext is loaded
```bash
kextstat | grep -i gram
# Should show com.gramsmc.GramSMC
```

### Check kext version in IORegistry
```bash
ioreg -l | grep "GramSMC-Version"
```

### Check daemon status
```bash
pgrep -fl GramSMCDaemon
launchctl list | grep gramsmc
```

## Common Issues

### Issue: "Kext not loading after reboot"
**Solution:**
- Check OpenCore config.plist has correct kext entry
- Verify dependencies (Lilu, VirtualSMC) load first
- Check kext is signed or SIP is disabled

### Issue: "App says 'kext not found'"
**Solution:**
- Kext must be loaded in kernel: `kextstat | grep GramSMC`
- Check IORegistry for GramSMC service
- Restart daemon: `sudo launchctl unload /Library/LaunchAgents/com.gramsmc.GramSMCDaemon.plist && sudo launchctl load /Library/LaunchAgents/com.gramsmc.GramSMCDaemon.plist`

### Issue: "SSDT not loading"
**Solution:**
- Check it's in EFI/OC/ACPI/
- Verify it's enabled in config.plist ACPI → Add
- Check ACPI logs in OpenCore debug

## Required ACPI Renames

Your config.plist must have these renames:

```xml
<key>ACPI</key>
<dict>
    <key>Patch</key>
    <array>
        <!-- _Q0A to XQ0A (Battery status change) -->
        <dict>
            <key>Find</key>
            <data>X1EwQQ==</data>
            <key>Replace</key>
            <data>WFEwQQ==</data>
        </dict>
        <!-- _Q0C to XQ0C (Lid close) -->
        <dict>
            <key>Find</key>
            <data>X1EwQw==</data>
            <key>Replace</key>
            <data>WFEwQw==</data>
        </dict>
        <!-- Add more as needed for function keys -->
    </array>
</dict>
```

## Next Steps

1. **Verify SSDT is actually loading** (you've confirmed this ✅)
2. **Add GramSMC.kext to OpenCore config** (THIS IS THE PROBLEM ❌)
3. **Reboot**
4. **Verify kext loads**: `kextstat | grep GramSMC`
5. **Install daemon & app**: `sudo bash Scripts/install_all.sh`
6. **Test functionality**

## Build System Changes Made

1. Added `Scripts/build_ssdt.sh` - Compiles SSDT from .dsl source
2. Modified `Scripts/install_all.sh` - Kills daemon/app first, builds SSDT, deploys to build/Release/
3. Added Xcode build phase "Build SSDT" - Automatically compiles SSDT during kext build
4. SSDT output goes to: `build/Release/SSDT-GramSMC.aml`

All build artifacts are now in `build/Release/` ready for deployment!
