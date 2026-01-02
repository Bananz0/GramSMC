#!/bin/bash
# GramSMC Installation Script
# Installs daemon and app (kext and SSDT must be installed manually to EFI)

set -e

echo "╔════════════════════════════════════════════════════════════╗"
echo "║          LG Gram Control Center Installation              ║"
echo "╚════════════════════════════════════════════════════════════╝"
echo ""

# Check for root
if [[ $EUID -ne 0 ]]; then
   echo "❌ This script must be run as root (use sudo)"
   exit 1
fi

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Stop existing daemon
echo "⏹  Stopping existing daemon..."
launchctl unload /Library/LaunchAgents/com.gramsmc.GramSMCDaemon.plist 2>/dev/null || true
pkill -f GramSMCDaemon 2>/dev/null || true
sleep 1

# Install daemon binary
echo "📦 Installing GramSMCDaemon..."
mkdir -p /usr/local/bin
cp "$SCRIPT_DIR/GramSMCDaemon" /usr/local/bin/
chmod 755 /usr/local/bin/GramSMCDaemon
chown root:wheel /usr/local/bin/GramSMCDaemon
xattr -d com.apple.quarantine /usr/local/bin/GramSMCDaemon 2>/dev/null || true

# Install daemon plist
echo "📦 Installing daemon launch agent..."
cp "$SCRIPT_DIR/com.gramsmc.GramSMCDaemon.plist" /Library/LaunchAgents/
chmod 644 /Library/LaunchAgents/com.gramsmc.GramSMCDaemon.plist
chown root:wheel /Library/LaunchAgents/com.gramsmc.GramSMCDaemon.plist
xattr -d com.apple.quarantine /Library/LaunchAgents/com.gramsmc.GramSMCDaemon.plist 2>/dev/null || true

# Start daemon
echo "▶️  Starting daemon..."
launchctl load /Library/LaunchAgents/com.gramsmc.GramSMCDaemon.plist

# Install app
echo "📦 Installing GramControlCenter.app..."
if [ -d "/Applications/GramControlCenter.app" ]; then
    rm -rf /Applications/GramControlCenter.app
fi
cp -R "$SCRIPT_DIR/GramControlCenter.app" /Applications/
xattr -dr com.apple.quarantine /Applications/GramControlCenter.app 2>/dev/null || true

echo ""
echo "✅ Installation complete!"
echo ""
echo "⚠️  IMPORTANT: You must manually install the SSDT and kext to EFI:"
echo ""
echo "1. Mount your EFI partition:"
echo "   sudo diskutil mount EFI"
echo ""
echo "2. Copy SSDT-GramSMC.aml to:"
echo "   /Volumes/EFI/EFI/OC/ACPI/"
echo ""
echo "3. Copy GramSMC.kext to:"
echo "   /Library/Extensions/"
echo ""
echo "4. Update config.plist with the ACPI patches (see FinalBuild/config.plist)"
echo ""
echo "5. Rebuild kext cache:"
echo "   sudo kextcache -i /"
echo ""
echo "6. Reboot your system"
echo ""
