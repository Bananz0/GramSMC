#!/bin/bash
# GramSMC Daemon and App Installation Script
# Installs only the daemon and app (kext/SSDT must be installed via OpenCore)

set -e

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Get script directory
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Configuration
DAEMON_DEST="/usr/local/bin"
DAEMON_PLIST="/Library/LaunchDaemons"
AGENT_PLIST="/Library/LaunchAgents"
APP_DEST="/Applications"

echo -e "${BLUE}=== GramSMC Daemon & App Installer ===${NC}"

# Step 1: Stop existing services
echo -e "\n${BLUE}[1/3] Stopping existing GramSMC services...${NC}"

# Kill daemon if running
if pgrep -x "GramSMCDaemon" > /dev/null; then
    echo "Stopping GramSMCDaemon..."
    sudo launchctl unload "$DAEMON_PLIST/com.bananz0.GramSMCDaemon.plist" 2>/dev/null || true
    sudo killall -9 GramSMCDaemon 2>/dev/null || true
    sleep 2
fi

# Kill app if running
if pgrep -x "GramControlCenter" > /dev/null; then
    echo "Stopping GramControlCenter..."
    killall -9 GramControlCenter 2>/dev/null || true
    sleep 1
fi

echo -e "${GREEN}Services stopped.${NC}"

# Step 2: Install Daemon
echo -e "\n${BLUE}[2/3] Installing GramSMCDaemon...${NC}"

if [ ! -f "$SCRIPT_DIR/GramSMCDaemon" ]; then
    echo -e "${RED}Error: GramSMCDaemon not found in $SCRIPT_DIR${NC}"
    exit 1
fi

sudo mkdir -p "$DAEMON_DEST"
sudo cp "$SCRIPT_DIR/GramSMCDaemon" "$DAEMON_DEST/"
sudo chown root:wheel "$DAEMON_DEST/GramSMCDaemon"
sudo chmod 755 "$DAEMON_DEST/GramSMCDaemon"

# Install daemon plist
if [ -f "$SCRIPT_DIR/com.bananz0.GramSMCDaemon.plist" ]; then
    sudo cp "$SCRIPT_DIR/com.bananz0.GramSMCDaemon.plist" "$DAEMON_PLIST/"
    sudo chown root:wheel "$DAEMON_PLIST/com.bananz0.GramSMCDaemon.plist"
    sudo chmod 644 "$DAEMON_PLIST/com.bananz0.GramSMCDaemon.plist"
else
    echo -e "${RED}Error: com.bananz0.GramSMCDaemon.plist not found${NC}"
    exit 1
fi

echo -e "${GREEN}Daemon installed.${NC}"

# Install app agent plist
if [ -f "$SCRIPT_DIR/com.bananz0.GramControlCenter.plist" ]; then
    sudo cp "$SCRIPT_DIR/com.bananz0.GramControlCenter.plist" "$AGENT_PLIST/"
    sudo chown root:wheel "$AGENT_PLIST/com.bananz0.GramControlCenter.plist"
    sudo chmod 644 "$AGENT_PLIST/com.bananz0.GramControlCenter.plist"
    echo -e "${GREEN}App agent installed.${NC}"
else
    echo -e "${YELLOW}Warning: com.bananz0.GramControlCenter.plist not found (autostart may not work)${NC}"
fi

# Step 3: Install App
echo -e "\n${BLUE}[3/3] Installing GramControlCenter...${NC}"

if [ ! -d "$SCRIPT_DIR/GramControlCenter.app" ]; then
    echo -e "${RED}Error: GramControlCenter.app not found in $SCRIPT_DIR${NC}"
    exit 1
fi

sudo rm -rf "$APP_DEST/GramControlCenter.app"
sudo cp -R "$SCRIPT_DIR/GramControlCenter.app" "$APP_DEST/"
sudo xattr -cr "$APP_DEST/GramControlCenter.app"

echo -e "${GREEN}App installed.${NC}"

# Step 4: Start daemon
echo -e "\n${BLUE}Starting GramSMCDaemon...${NC}"
sudo launchctl load "$DAEMON_PLIST/com.bananz0.GramSMCDaemon.plist"
sleep 2

# Verify daemon is running
if pgrep -x "GramSMCDaemon" > /dev/null; then
    echo -e "${GREEN}✓ GramSMCDaemon started successfully${NC}"
else
    echo -e "${YELLOW}⚠ Daemon may not have started. Check with: sudo launchctl list | grep GramSMC${NC}"
fi

# Summary
echo -e "\n${BLUE}=== Installation Summary ===${NC}"
echo -e "Daemon: ${GREEN}Installed${NC} ($DAEMON_DEST/GramSMCDaemon)"
echo -e "App:    ${GREEN}Installed${NC} ($APP_DEST/GramControlCenter.app)"
echo ""
echo -e "${GREEN}✓ Installation complete!${NC}"
echo -e "Launch GramControlCenter from Applications or the menu bar."
echo ""
echo -e "${YELLOW}Note: The kext and SSDT must be installed via OpenCore:${NC}"
echo -e "  - Copy ${BLUE}GramSMC.kext${NC} to EFI/OC/Kexts/"
echo -e "  - Copy ${BLUE}SSDT-GramSMC.aml${NC} to EFI/OC/ACPI/"
echo -e "  - Update config.plist and reboot"
