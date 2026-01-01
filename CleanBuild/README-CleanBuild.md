# LG Gram Function Key Fix - Clean Build

## Files Included

### Core Components
- `SSDT-GramSMC.aml` - Compiled ACPI table with function key handlers
- `GramSMC.kext` - Kernel extension for SMC communication
- `GramSMCDaemon` - User-space daemon for LG Control Center features
- `config.plist` - OpenCore configuration with ACPI patches

### Documentation
- `FUNCTION_KEY_FIX_SUMMARY.md` - Detailed implementation notes
- `README.md` - Original project documentation
- `install_all.sh` - Installation script for daemon and app

## Installation Instructions

### Option 1: Automated Installation (Recommended)
```bash
cd CleanBuild
./install_all.sh
```
This will install the daemon and app, then provide instructions for the EFI components.

### Option 2: Manual Installation

1. **Install daemon and app:**
   ```bash
   sudo cp GramSMCDaemon /usr/local/bin/
   sudo chmod +x /usr/local/bin/GramSMCDaemon
   sudo cp com.gramsmc.GramSMCDaemon.plist /Library/LaunchAgents/
   sudo launchctl load /Library/LaunchAgents/com.gramsmc.GramSMCDaemon.plist
   sudo cp -R GramControlCenter.app /Applications/
   ```

2. **Mount EFI partition:**
   ```bash
   sudo diskutil mount EFI
   ```

3. **Copy files to EFI:**
   ```bash
   sudo cp SSDT-GramSMC.aml /Volumes/EFI/EFI/OC/ACPI/
   sudo cp config.plist /Volumes/EFI/EFI/OC/config.plist
   ```

4. **Install kext and daemon:**
   ```bash
   sudo cp -R GramSMC.kext /Library/Extensions/
   ```

5. **Rebuild kext cache:**
   ```bash
   sudo kextcache -i /
   ```

6. **Reboot**

## Function Key Mappings

| Key | Function | LED Support |
|-----|----------|-------------|
| Fn+F1 | LG Control Center | - |
| Fn+F2 | Brightness Down | - |
| Fn+F3 | Brightness Up | - |
| Fn+F4 | Sleep | - |
| Fn+F5 | Touchpad Toggle | ✅ LED at EC 0x64 bit 1 |
| Fn+F6 | Airplane Mode | - |
| Fn+F7 | Screen Mirroring | - |
| Fn+F8 | Keyboard Backlight | Hardware controlled |
| Fn+F9 | Reader Mode Toggle | ✅ LED at EC 0x66 bit 0 |
| Fn+F10 | Mute | - |
| Fn+F11 | Volume Down | - |
| Fn+F12 | Volume Up | - |

## LED Control Details

### Touchpad LED (Fn+F5)
- **EC Register:** `0x64 bit 1` (TPDU)
- **LED ON:** Bit = 1, Touchpad DISABLED
- **LED OFF:** Bit = 0, Touchpad ENABLED

### Reader Mode LED (Fn+F9)
- **EC Register:** `0x66 bit 0` (RDMD)
- **LED ON:** Bit = 1, Reader Mode ENABLED
- **LED OFF:** Bit = 0, Reader Mode DISABLED

## Troubleshooting

Check kernel logs:
```bash
log show --predicate 'senderImagePath CONTAINS "GramSMC"' --last 5m
```

## Build Information

- **Compiled:** January 1, 2026
- **ACPI Compiler:** iasl version 20251212
- **Xcode:** Version 26.2 (17C52)
- **Target:** macOS 11.0+

## Credits

Based on the original GramSMC project with enhancements for LG Gram 17z90n function key support.
