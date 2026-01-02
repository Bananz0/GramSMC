#!/bin/bash

# GramSMC v2.0.0 Installation Script
# Kills existing daemon/app, installs kext, daemon, app, and SSDT

set -e

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Configuration
PROJECT_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
BUILD_DIR="$PROJECT_ROOT/build/Release"
DAEMON_DEST="/usr/local/bin"
DAEMON_PLIST="/Library/LaunchAgents"
APP_DEST="/Applications"

echo -e "${BLUE}=== GramSMC v2.0.0 Installer ===${NC}"

# Step 1: Kill existing daemon and app FIRST
echo -e "\n${BLUE}[1/5] Stopping existing GramSMC services...${NC}"

# Kill daemon if running
if pgrep -x "GramSMCDaemon" > /dev/null; then
    echo "Stopping GramSMCDaemon..."
    sudo launchctl unload "$DAEMON_PLIST/com.gramsmc.GramSMCDaemon.plist" 2>/dev/null || true
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

# Step 2: Build SSDT
echo -e "\n${BLUE}[2/5] Building SSDT-GramSMC...${NC}"
if [ ! -f "$PROJECT_ROOT/Scripts/build_ssdt.sh" ]; then
    echo -e "${YELLOW}Warning: build_ssdt.sh not found, skipping SSDT build${NC}"
else
    bash "$PROJECT_ROOT/Scripts/build_ssdt.sh" "$PROJECT_ROOT" "$BUILD_DIR" || {
        echo -e "${YELLOW}Warning: SSDT build failed, continuing anyway${NC}"
    }
fi

# Step 3: Check if we have required files
if [ ! -d "$BUILD_DIR/GramSMC.kext" ]; then
    echo -e "${RED}Error: Build artifacts not found in $BUILD_DIR${NC}"
    echo "Please build the project first with: xcodebuild -project GramSMC.xcodeproj -scheme GramSMC -configuration Release build"
    exit 1
fi

# Step 4: Install Daemon
echo -e "\n${BLUE}[3/5] Installing GramSMCDaemon...${NC}"
sudo mkdir -p "$DAEMON_DEST"
sudo cp "$BUILD_DIR/GramSMCDaemon" "$DAEMON_DEST/"
sudo chown root:wheel "$DAEMON_DEST/GramSMCDaemon"
sudo chmod 755 "$DAEMON_DEST/GramSMCDaemon"

# Install daemon plist
sudo cp "$PROJECT_ROOT/GramSMCDaemon/com.gramsmc.GramSMCDaemon.plist" "$DAEMON_PLIST/"
sudo chown root:wheel "$DAEMON_PLIST/com.gramsmc.GramSMCDaemon.plist"
sudo chmod 644 "$DAEMON_PLIST/com.gramsmc.GramSMCDaemon.plist"

echo -e "${GREEN}Daemon installed.${NC}"

# Step 5: Install App
echo -e "\n${BLUE}[4/5] Installing GramControlCenter...${NC}"
sudo rm -rf "$APP_DEST/GramControlCenter.app"
sudo cp -R "$BUILD_DIR/GramControlCenter.app" "$APP_DEST/"
sudo xattr -cr "$APP_DEST/GramControlCenter.app"

echo -e "${GREEN}App installed.${NC}"

# Step 6: Check Kext Status and provide deployment files
echo -e "\n${BLUE}[5/5] Checking Kext status...${NC}"

# Check if SSDT is loaded
if ioreg -l | grep -q "GRAM0001"; then
    echo -e "${GREEN}✓ SSDT-GramSMC is loaded (GRAM0001 device found)${NC}"
    SSDT_LOADED=true
else
    echo -e "${YELLOW}⚠ SSDT-GramSMC not loaded (GRAM0001 device not found)${NC}"
    echo -e "${YELLOW}  Please add SSDT-GramSMC.aml to your OpenCore config${NC}"
    SSDT_LOADED=false
fi

# Check if kext is loaded
if kextstat | grep -q "com.gramsmc.GramSMC"; then
    KEXT_VERSION=$(ioreg -l | grep "GramSMC-Version" | awk -F'"' '{print $4}' | head -1)
    echo -e "${GREEN}✓ GramSMC kext is loaded (version: $KEXT_VERSION)${NC}"
    KEXT_LOADED=true
else
    echo -e "${YELLOW}⚠ GramSMC kext not loaded${NC}"
    echo -e "${YELLOW}  Please add GramSMC.kext to your OpenCore config${NC}"
    KEXT_LOADED=false
fi

# Start daemon
echo -e "\n${BLUE}Starting GramSMCDaemon...${NC}"
sudo launchctl load "$DAEMON_PLIST/com.gramsmc.GramSMCDaemon.plist"
sleep 2

# Verify daemon is running
if pgrep -x "GramSMCDaemon" > /dev/null; then
    echo -e "${GREEN}✓ GramSMCDaemon started successfully${NC}"
else
    echo -e "${RED}✗ Failed to start GramSMCDaemon${NC}"
fi

# Summary
echo -e "\n${BLUE}=== Installation Summary ===${NC}"
echo -e "Daemon:      ${GREEN}Installed${NC} ($DAEMON_DEST/GramSMCDaemon)"
echo -e "App:         ${GREEN}Installed${NC} ($APP_DEST/GramControlCenter.app)"
echo -e "Build Files: ${GREEN}Available${NC} ($BUILD_DIR)"

if [ "$SSDT_LOADED" = true ] && [ "$KEXT_LOADED" = true ]; then
    echo -e "SSDT:        ${GREEN}✓ Loaded${NC}"
    echo -e "Kext:        ${GREEN}✓ Loaded (v$KEXT_VERSION)${NC}"
    echo ""
    echo -e "${GREEN}✓ Installation complete! GramControlCenter should now work.${NC}"
    echo -e "${GREEN}  Launch from Applications or menu bar.${NC}"
else
    echo -e "SSDT:        ${YELLOW}⚠ Not loaded${NC}"
    echo -e "Kext:        ${YELLOW}⚠ Not loaded${NC}"
    echo ""
    echo -e "${YELLOW}⚠ Manual Steps Required:${NC}"
    echo -e "   The following files are ready for OpenCore deployment:"
    echo -e "   1. ${BLUE}$BUILD_DIR/SSDT-GramSMC.aml${NC} → Copy to EFI/OC/ACPI/"
    echo -e "   2. ${BLUE}$BUILD_DIR/GramSMC.kext${NC} → Copy to EFI/OC/Kexts/"
    echo -e ""
    echo -e "   3. Update config.plist:"
    echo -e "      - Add SSDT-GramSMC.aml to ACPI -> Add"
    echo -e "      - Add GramSMC.kext to Kernel -> Add"
    echo -e "      - Ensure all _Qxx → XQxx renames are present (see docs)"
    echo -e "   4. Reboot"
    echo ""
    echo -e "${BLUE}After reboot, run this script again to verify installation.${NC}"
fi

# Debug info
echo -e "\n${BLUE}=== Debug Information ===${NC}"
echo "IORegistry check for GRAM device:"
ioreg -l | grep -A5 "GRAM0001" || echo "  No GRAM0001 device found"

echo ""
echo "Kext status:"
kextstat | grep -i gram || echo "  No GramSMC kext loaded"

echo ""
echo "Daemon status:"
pgrep -fl GramSMCDaemon || echo "  Daemon not running"

echo ""
echo -e "${BLUE}Deployment files location: ${GREEN}$BUILD_DIR${NC}"
ls -lh "$BUILD_DIR" | grep -E "(GramSMC|SSDT)" || true


# Verify daemon is running
if pgrep -x "GramSMCDaemon" > /dev/null; then
    echo -e "${GREEN}✓ GramSMCDaemon started successfully${NC}"
else
    echo -e "${RED}✗ Failed to start GramSMCDaemon${NC}"
fi

# Summary
echo -e "\n${BLUE}=== Installation Summary ===${NC}"
echo -e "Daemon:      ${GREEN}Installed${NC} ($DAEMON_DEST/GramSMCDaemon)"
echo -e "App:         ${GREEN}Installed${NC} ($APP_DEST/GramControlCenter.app)"

if [ "$SSDT_LOADED" = true ] && [ "$KEXT_LOADED" = true ]; then
    echo -e "SSDT:        ${GREEN}✓ Loaded${NC}"
    echo -e "Kext:        ${GREEN}✓ Loaded (v$KEXT_VERSION)${NC}"
    echo ""
    echo -e "${GREEN}✓ Installation complete! GramControlCenter should now work.${NC}"
    echo -e "${GREEN}  Launch from Applications or menu bar.${NC}"
else
    echo -e "SSDT:        ${YELLOW}⚠ Not loaded${NC}"
    echo -e "Kext:        ${YELLOW}⚠ Not loaded${NC}"
    echo ""
    echo -e "${YELLOW}⚠ Manual Steps Required:${NC}"
    echo -e "   1. Copy $BUILD_DIR/SSDT-GramSMC.aml to EFI/OC/ACPI/"
    echo -e "   2. Copy $BUILD_DIR/GramSMC.kext to EFI/OC/Kexts/"
    echo -e "   3. Update config.plist:"
    echo -e "      - Add SSDT-GramSMC.aml to ACPI -> Add"
    echo -e "      - Add GramSMC.kext to Kernel -> Add"
    echo -e "      - Ensure all _Qxx → XQxx renames are present (see config.plist example)"
    echo -e "   4. Reboot"
    echo ""
    echo -e "${BLUE}After reboot, run this script again to verify installation.${NC}"
fi

# Debug info
echo -e "\n${BLUE}=== Debug Information ===${NC}"
echo "IORegistry check for GRAM device:"
ioreg -l | grep -A5 "GRAM0001" || echo "  No GRAM0001 device found"

echo ""
echo "Kext status:"
kextstat | grep -i gram || echo "  No GramSMC kext loaded"

echo ""
echo "Daemon status:"
pgrep -fl GramSMCDaemon || echo "  Daemon not running"
