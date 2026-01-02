#!/bin/bash

# GramSMC Daemon & App Installer
# Installs daemon and app from build directory
# User will manually install kext and SSDT to OpenCore

set -e

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m'

# Detect script location
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BUILD_DIR="$(dirname "$SCRIPT_DIR")/build/${1:-Debug}"

if [ ! -d "$BUILD_DIR" ]; then
    echo -e "${RED}Error: Build directory not found: $BUILD_DIR${NC}"
    echo -e "${YELLOW}Usage: $0 [Debug|Release]${NC}"
    echo -e "${YELLOW}Default: Debug${NC}"
    exit 1
fi

echo -e "${BLUE}=== GramSMC Daemon & App Installer ===${NC}"
echo -e "${BLUE}Build directory: $BUILD_DIR${NC}\n"

# Step 1: Stop and uninstall existing daemon
echo -e "${BLUE}[1/4] Stopping existing GramSMCDaemon...${NC}"

if pgrep -x "GramSMCDaemon" > /dev/null; then
    echo "Stopping GramSMCDaemon..."
    sudo launchctl bootout gui/$(id -u)/com.gramsmc.GramSMCDaemon 2>/dev/null || true
    sudo launchctl unload /Library/LaunchAgents/com.gramsmc.GramSMCDaemon.plist 2>/dev/null || true
    sudo killall -9 GramSMCDaemon 2>/dev/null || true
    sleep 2
    echo -e "${GREEN}✓ Daemon stopped${NC}"
else
    echo -e "${YELLOW}Daemon not running${NC}"
fi

# Remove old daemon files
sudo rm -f /usr/local/bin/GramSMCDaemon 2>/dev/null || true
sudo rm -f /Library/LaunchAgents/com.gramsmc.GramSMCDaemon.plist 2>/dev/null || true

# Step 2: Stop and uninstall existing app
echo -e "\n${BLUE}[2/4] Stopping existing GramControlCenter...${NC}"

if pgrep -x "GramControlCenter" > /dev/null; then
    echo "Stopping GramControlCenter..."
    killall -9 GramControlCenter 2>/dev/null || true
    sleep 1
    echo -e "${GREEN}✓ App stopped${NC}"
else
    echo -e "${YELLOW}App not running${NC}"
fi

# Remove old app
if [ -d "/Applications/GramControlCenter.app" ]; then
    sudo rm -rf "/Applications/GramControlCenter.app"
    echo -e "${GREEN}✓ Old app removed${NC}"
fi

# Step 3: Install daemon
echo -e "\n${BLUE}[3/4] Installing GramSMCDaemon...${NC}"

if [ ! -f "$BUILD_DIR/GramSMCDaemon" ]; then
    echo -e "${RED}Error: GramSMCDaemon not found in $BUILD_DIR${NC}"
    exit 1
fi

if [ ! -f "$BUILD_DIR/com.gramsmc.GramSMCDaemon.plist" ]; then
    echo -e "${RED}Error: com.gramsmc.GramSMCDaemon.plist not found in $BUILD_DIR${NC}"
    exit 1
fi

sudo mkdir -p /usr/local/bin
sudo chmod 755 /usr/local/bin
sudo cp "$BUILD_DIR/GramSMCDaemon" /usr/local/bin/
sudo chmod 755 /usr/local/bin/GramSMCDaemon
sudo chown root:wheel /usr/local/bin/GramSMCDaemon
sudo xattr -d com.apple.quarantine /usr/local/bin/GramSMCDaemon 2>/dev/null || true

sudo cp "$BUILD_DIR/com.gramsmc.GramSMCDaemon.plist" /Library/LaunchAgents/
sudo chmod 644 /Library/LaunchAgents/com.gramsmc.GramSMCDaemon.plist
sudo chown root:wheel /Library/LaunchAgents/com.gramsmc.GramSMCDaemon.plist
sudo xattr -d com.apple.quarantine /Library/LaunchAgents/com.gramsmc.GramSMCDaemon.plist 2>/dev/null || true

# Load daemon
sudo launchctl load /Library/LaunchAgents/com.gramsmc.GramSMCDaemon.plist 2>/dev/null || \
    sudo launchctl bootstrap gui/$(id -u) /Library/LaunchAgents/com.gramsmc.GramSMCDaemon.plist

sleep 2

if pgrep -x "GramSMCDaemon" > /dev/null; then
    echo -e "${GREEN}✓ Daemon installed and running${NC}"
else
    echo -e "${YELLOW}⚠ Daemon installed but not running (check logs)${NC}"
fi

# Step 4: Install app
echo -e "\n${BLUE}[4/4] Installing GramControlCenter.app...${NC}"

if [ ! -d "$BUILD_DIR/GramControlCenter.app" ]; then
    echo -e "${RED}Error: GramControlCenter.app not found in $BUILD_DIR${NC}"
    exit 1
fi

sudo cp -R "$BUILD_DIR/GramControlCenter.app" /Applications/
sudo xattr -d com.apple.quarantine /Applications/GramControlCenter.app 2>/dev/null || true
sudo chmod -R 755 /Applications/GramControlCenter.app

echo -e "${GREEN}✓ App installed to /Applications${NC}"

# Summary
echo -e "\n${GREEN}=== Installation Complete ===${NC}"
echo -e "${GREEN}✓ Daemon: /usr/local/bin/GramSMCDaemon${NC}"
echo -e "${GREEN}✓ LaunchAgent: /Library/LaunchAgents/com.gramsmc.GramSMCDaemon.plist${NC}"
echo -e "${GREEN}✓ App: /Applications/GramControlCenter.app${NC}"

echo -e "\n${BLUE}=== Manual Steps Required ===${NC}"
echo -e "${YELLOW}You need to manually install to OpenCore:${NC}"
echo -e "  1. ${BLUE}Kext:${NC} Copy ${BUILD_DIR}/GramSMC.kext to EFI/OC/Kexts/"
echo -e "  2. ${BLUE}SSDT:${NC} Copy ${BUILD_DIR}/SSDT-GramSMC.aml to EFI/OC/ACPI/"
echo -e "  3. ${BLUE}Config:${NC} Add both to config.plist"
echo -e "     - Kernel -> Add -> GramSMC.kext (Enabled=true)"
echo -e "     - ACPI -> Add -> SSDT-GramSMC.aml (Enabled=true)"

echo -e "\n${BLUE}Launch GramControlCenter from Applications or menu bar.${NC}"
