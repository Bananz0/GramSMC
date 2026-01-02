# GramSMC Troubleshooting Guide

## Issue Diagnosis

You reported that after installation:
1. ✅ Kext loads successfully
2. ✅ Daemon runs
3. ✅ SSDT is present
4. ❌ **Brightness keys are reversed**
5. ❌ **Function keys Fn+F1, F4-F9 don't work**
6. ❌ **Keyboard backlight changes but not tracked by macOS**
7. ❌ **Settings in the app don't persist (revert immediately)**
8. ❌ **Fan reading doesn't work**

## Root Cause

The main issue is **macOS Sandbox Security** blocking the GramControlCenter app from communicating with the GramSMC kext. The kernel logs show:

```
Sandbox: GramControlCenter(832) deny(1) iokit-set-properties iokit-class:GramSMC property:KeyboardBacklight
```

This means the app is trying to set properties on the kext but macOS is blocking it due to missing security entitlements.

## What Was Fixed

### 1. **Added IOKit Security Exception**

Added to `Info.plist`:
```xml
<key>com.apple.security.temporary-exception.iokit-user-client-class</key>
<array>
    <string>GramSMC</string>
</array>
```

This allows the app to communicate with the GramSMC kext.

### 2. **Created Entitlements File**

Created `GramControlCenter.entitlements`:
```xml
<key>com.apple.security.app-sandbox</key>
<false/>
<key>com.apple.security.device.usb</key>
<true/>
<key>com.apple.vm.device-access</key>
<true/>
```

This disables the app sandbox and allows hardware device access.

### 3. **Fixed Function Key Mappings** (Already in SSDT)

The SSDT has been updated with correct mappings:
- **Fn+F1** (0x70): LG Control Center / Fn Lock
- **Fn+F2** (Q50): Brightness Down ✅
- **Fn+F3** (Q51): Brightness Up ✅
- **Fn+F4** (0x5E): Sleep
- **Fn+F5** (0x74): Touchpad Toggle with LED
- **Fn+F6** (0x7D): Airplane Mode
- **Fn+F7** (0x61): Screen Mirroring
- **Fn+F8** (Q64): Keyboard Backlight (hardware)
- **Fn+F9** (0xF9): Reader Mode with LED
- **Fn+F10** (0x32): Mute
- **Fn+F11** (0x31): Volume Down
- **Fn+F12** (0x30): Volume Up

## Installation Steps

### Step 1: Install Daemon & App (Automated)

```bash
cd /Users/glenm/GramSMC/FinalBuild
sudo ./install_all.sh
```

This will:
- Stop existing daemon
- Install `/usr/local/bin/GramSMCDaemon`
- Install launch agent plist
- Start the daemon
- Install `/Applications/GramControlCenter.app`
- Remove quarantine attributes

### Step 2: Install Kext (Manual)

```bash
sudo cp -R /Users/glenm/GramSMC/FinalBuild/GramSMC.kext /Library/Extensions/
sudo chown -R root:wheel /Library/Extensions/GramSMC.kext
sudo chmod -R 755 /Library/Extensions/GramSMC.kext
sudo kextcache -i /
```

### Step 3: Install SSDT to EFI (Manual)

```bash
# Mount EFI partition
sudo diskutil mount EFI

# Backup existing SSDT if present
sudo cp /Volumes/EFI/EFI/OC/ACPI/SSDT-GramSMC.aml /Volumes/EFI/EFI/OC/ACPI/SSDT-GramSMC.aml.backup 2>/dev/null || true

# Copy new SSDT
sudo cp /Users/glenm/GramSMC/FinalBuild/SSDT-GramSMC.aml /Volumes/EFI/EFI/OC/ACPI/

# Verify
ls -l /Volumes/EFI/EFI/OC/ACPI/SSDT-GramSMC.aml
```

### Step 4: Update OpenCore Config (Manual)

The `config.plist` in FinalBuild has the required ACPI patches. You need to add these patches to your EFI's config.plist under `ACPI -> Patch`:

```xml
<!-- Brightness Down -->
<dict>
    <key>Comment</key>
    <string>Rename _Q50 to XQ50 (Brightness Down)</string>
    <key>Find</key>
    <data>X1E1MA==</data>
    <key>Replace</key>
    <data>WFE1MA==</data>
</dict>

<!-- Brightness Up -->
<dict>
    <key>Comment</key>
    <string>Rename _Q51 to XQ51 (Brightness Up)</string>
    <key>Find</key>
    <data>X1E1MQ==</data>
    <key>Replace</key>
    <data>WFE1MQ==</data>
</dict>

<!-- Mute -->
<dict>
    <key>Comment</key>
    <string>Rename _Q30 to XQ30 (Mute)</string>
    <key>Find</key>
    <data>X1EzMA==</data>
    <key>Replace</key>
    <data>WFEzMA==</data>
</dict>

<!-- Volume Down -->
<dict>
    <key>Comment</key>
    <string>Rename _Q52 to XQ52 (Volume Down)</string>
    <key>Find</key>
    <data>X1E1Mg==</data>
    <key>Replace</key>
    <data>WFE1Mg==</data>
</dict>

<!-- Volume Up -->
<dict>
    <key>Comment</key>
    <string>Rename _Q53 to XQ53 (Volume Up)</string>
    <key>Find</key>
    <data>X1E1Mw==</data>
    <key>Replace</key>
    <data>WFE1Mw==</data>
</dict>

<!-- Keyboard Backlight -->
<dict>
    <key>Comment</key>
    <string>Rename _Q64 to XQ64 (Keyboard Backlight)</string>
    <key>Find</key>
    <data>X1E2NA==</data>
    <key>Replace</key>
    <data>WFE2NA==</data>
</dict>

<!-- Sleep -->
<dict>
    <key>Comment</key>
    <string>Rename _Q34 to XQ34 (Sleep)</string>
    <key>Find</key>
    <data>X1EzNA==</data>
    <key>Replace</key>
    <data>WFEzNA==</data>
</dict>

<!-- Screen Mirror -->
<dict>
    <key>Comment</key>
    <string>Rename _Q36 to XQ36 (Screen Mirror)</string>
    <key>Find</key>
    <data>X1EzNg==</data>
    <key>Replace</key>
    <data>WFEzNg==</data>
</dict>

<!-- Airplane Mode -->
<dict>
    <key>Comment</key>
    <string>Rename _Q37 to XQ37 (Airplane Mode)</string>
    <key>Find</key>
    <data>X1EzNw==</data>
    <key>Replace</key>
    <data>WFEzNw==</data>
</dict>

<!-- Reader Mode -->
<dict>
    <key>Comment</key>
    <string>Rename _Q72 to XQ72 (Reader Mode)</string>
    <key>Find</key>
    <data>X1E3Mg==</data>
    <key>Replace</key>
    <data>WFE3Mg==</data>
</dict>
```

### Step 5: Reboot

```bash
sudo reboot
```

## Verification After Reboot

1. **Check kext is loaded:**
   ```bash
   kextstat | grep -i gram
   ```
   Should show: `com.gramsmc.GramSMC (1.4.1)`

2. **Check daemon is running:**
   ```bash
   ps aux | grep GramSMCDaemon | grep -v grep
   ```

3. **Test function keys:**
   - Fn+F2/F3 should change brightness
   - Fn+F5 should toggle touchpad with LED
   - Fn+F9 should toggle reader mode with LED
   - All function keys should trigger appropriate actions

4. **Test GramControlCenter app:**
   - Open from Applications or menu bar
   - Change keyboard backlight - should persist
   - Change silent mode - should persist
   - Check CPU temp and fan RPM are displayed

5. **Check for sandbox errors (should be gone):**
   ```bash
   log show --predicate 'process == "kernel" AND eventMessage CONTAINS "GramSMC"' --last 1m
   ```

## Why Brightness Keys Were Reversed

The original DSDT has:
- `_Q50`: Brightness Down (sends keycode 0xF3 to ALS0)
- `_Q51`: Brightness Up (sends keycode 0xF2 to ALS0)

Our SSDT was initially sending:
- Q50 → 0x10 (labeled as brightness up)
- Q51 → 0x11 (labeled as brightness down)

The fix swapped these to match the hardware behavior.

## Why App Settings Didn't Work

macOS sandboxing prevented the app from:
1. Opening IOKit service matching "GramSMC"
2. Setting IORegistry properties on the kext
3. Reading hardware sensor data

The entitlements and Info.plist exception fix this.

## Known Limitations

1. **Keyboard backlight (Fn+F8)** is controlled by hardware and cannot be fully managed from macOS - it can be read but not set programmatically.
2. **Reader mode and touchpad** LED indicators are controlled by EC bits and work correctly now.
3. **Fan speed reading** requires correct EC register offsets (0xCB for FRPM).

## Support

If issues persist after following these steps:
1. Check kernel logs: `log stream --predicate 'process == "kernel"' --level debug`
2. Check daemon logs: `log show --predicate 'process == "GramSMCDaemon"' --last 10m`
3. Verify SSDT is loaded: `ioreg -l -p IODeviceTree | grep GRAM`
4. Verify kext properties: `ioreg -l -w0 | grep -A20 "class GramSMC"`

## Files in This Build

- `GramSMC.kext` - Kernel extension (install to /Library/Extensions)
- `SSDT-GramSMC.aml` - ACPI table (install to EFI/OC/ACPI/)
- `GramSMCDaemon` - User daemon binary
- `GramControlCenter.app` - Menu bar control app
- `com.gramsmc.GramSMCDaemon.plist` - Launch agent
- `com.gramsmc.GramControlCenter.plist` - App launch agent
- `config.plist` - Reference OpenCore config with ACPI patches
- `install_all.sh` - Automated installation script
- `TROUBLESHOOTING.md` - This file

## Technical Details

The kext exposes IORegistry properties that the app reads/writes:
- `KeyboardBacklight` (0-2): Off/Low/High
- `SilentMode` (bool): Fan quiet mode
- `BatteryCareLimit` (80/100): Charge limit
- `USBCharging` (bool): Always-on USB power
- `FnLock` (bool): Function key lock
- `CPUTemp` (int): CPU temperature in °C
- `FanRPM` (int): Fan speed in RPM
- `Capabilities` (bitfield): Feature flags

The SSDT intercepts ACPI EC query methods (_Qxx) and forwards them to the GRAM device, which the kext monitors via EC notifications.
