#!/bin/bash

# GramSMC Complete Installation Script
# Installs daemon, app, and provides instructions for EFI components
# Run this from the CleanBuild directory

set -e  # Exit on any error

echo "=== GramSMC Complete Installation Script ==="
echo "This will install the daemon and app components."
echo "You'll need to manually install the EFI components (SSDT, kext, config)."
echo ""

# Check if running from correct directory
if [ ! -f "GramSMCDaemon" ] || [ ! -d "GramControlCenter.app" ]; then
    echo "ERROR: Please run this script from the CleanBuild directory containing the built files."
    exit 1
fi

# Function to check if command succeeded
check_command() {
    if [ $? -ne 0 ]; then
        echo "ERROR: Command failed: $1"
        exit 1
    fi
}

# Stop any existing daemon
echo "Stopping existing daemon (if running)..."
sudo launchctl unload /Library/LaunchAgents/com.gramsmc.GramSMCDaemon.plist 2>/dev/null || true
sudo pkill -f GramSMCDaemon 2>/dev/null || true

# Install daemon binary
echo "Installing GramSMCDaemon..."
sudo mkdir -p /usr/local/bin/
sudo cp GramSMCDaemon /usr/local/bin/
check_command "Failed to copy daemon"
sudo chmod 755 /usr/local/bin/GramSMCDaemon
sudo chown root:wheel /usr/local/bin/GramSMCDaemon
sudo xattr -d com.apple.quarantine /usr/local/bin/GramSMCDaemon 2>/dev/null || true

# Install daemon plist
echo "Installing daemon launch agent..."
sudo cp com.gramsmc.GramSMCDaemon.plist /Library/LaunchAgents/
check_command "Failed to copy plist"
sudo chmod 644 /Library/LaunchAgents/com.gramsmc.GramSMCDaemon.plist
sudo chown root:wheel /Library/LaunchAgents/com.gramsmc.GramSMCDaemon.plist
sudo xattr -d com.apple.quarantine /Library/LaunchAgents/com.gramsmc.GramSMCDaemon.plist 2>/dev/null || true

# Load daemon
echo "Starting daemon..."
sudo launchctl load /Library/LaunchAgents/com.gramsmc.GramSMCDaemon.plist
check_command "Failed to load daemon"

# Install app
echo "Installing GramControlCenter app..."
if [ -d "/Applications/GramControlCenter.app" ]; then
    echo "Removing existing app..."
    sudo rm -rf /Applications/GramControlCenter.app
fi
sudo cp -R GramControlCenter.app /Applications/
check_command "Failed to copy app"
sudo xattr -d com.apple.quarantine /Applications/GramControlCenter.app 2>/dev/null || true

echo ""
echo "=== Installation Complete ==="
echo ""
echo "✅ What's been installed:"
echo "   • GramSMCDaemon -> /usr/local/bin/"
echo "   • Launch agent -> /Library/LaunchAgents/"
echo "   • GramControlCenter.app -> /Applications/"
echo ""
echo "⚠️  REMAINING STEPS (you need to do these manually):"
echo ""
echo "1. Mount your EFI partition:"
echo "   sudo diskutil mount EFI"
echo ""
echo "2. Copy EFI components:"
echo "   sudo cp SSDT-GramSMC.aml /Volumes/EFI/EFI/OC/ACPI/"
echo "   sudo cp config.plist /Volumes/EFI/EFI/OC/config.plist"
echo ""
echo "3. Install kext:"
echo "   sudo cp -R GramSMC.kext /Library/Extensions/"
echo ""
echo "4. Rebuild kext cache:"
echo "   sudo kextcache -i /"
echo ""
echo "5. Reboot your system"
echo ""
echo "After reboot, all function keys should work with LED indicators!"
echo "Check the app in your Applications folder or menu bar."
