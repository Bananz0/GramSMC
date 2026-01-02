#!/bin/bash

# GramSMC v1.5.0 All-in-One Installer
# Automates building and installation of SSDT, Kext, Daemon, and Control Center App.

set -e

# Configuration
PROJECT_ROOT="$( pwd )"
FINAL_BUILD="$PROJECT_ROOT/FinalBuild"
EFI_OC_ACPI="/Volumes/EFI/efi/oc/ACPI"
EFI_OC_KEXTS="/Volumes/EFI/efi/oc/Kexts"
DAEMON_DEST="/usr/local/bin"
DAEMON_PLIST="/Library/LaunchAgents"
APP_DEST="/Applications"

# Colors for output
PRINT_GREEN='\033[0;32m'
PRINT_BLUE='\033[0;34m'
PRINT_RED='\033[0;31m'
PRINT_NC='\033[0m' # No Color

echo -e "${PRINT_BLUE}=== GramSMC v1.5.0 All-in-One Installer ===${PRINT_NC}"

# Check for required tools
command -v xcodebuild >/dev/null 2>&1 || { echo -e "${PRINT_RED}Error: xcodebuild is required but not installed.${PRINT_NC}" >&2; exit 1; }
command -v iasl >/dev/null 2>&1 || { echo -e "${PRINT_RED}Warning: iasl not found. SSDT compilation will be skipped.${PRINT_NC}" >&2; }

# Step 1: Build SSDT
if command -v iasl >/dev/null 2>&1; then
    echo -e "\n${PRINT_BLUE}[1/4] Compiling SSDT...${PRINT_NC}"
    cd "$PROJECT_ROOT/ACPI-Gram/Patched"
    iasl -ve SSDT-GramSMC.dsl
    cp SSDT-GramSMC.aml "$FINAL_BUILD/"
    echo -e "${PRINT_GREEN}SSDT compiled and copied to FinalBuild.${PRINT_NC}"
else
    echo -e "\n${PRINT_BLUE}[1/4] Skipping SSDT compilation (iasl not found)${PRINT_NC}"
fi

# Step 2: Build Kext, Daemon, and App
echo -e "\n${PRINT_BLUE}[2/4] Building Kext, Daemon, and App with Xcode...${PRINT_NC}"
cd "$PROJECT_ROOT"
xcodebuild -project GramSMC.xcodeproj -scheme GramSMC -configuration Release build
xcodebuild -project GramSMC.xcodeproj -scheme GramSMCDaemon -configuration Release build
xcodebuild -project GramSMC.xcodeproj -scheme GramControlCenter -configuration Release build

# Copy build artifacts to FinalBuild
DERIVED_DATA="$(xcodebuild -project GramSMC.xcodeproj -scheme GramSMC -configuration Release -showBuildSettings | grep -m 1 "BUILT_PRODUCTS_DIR" | cut -d "=" -f 2 | xargs)"

mkdir -p "$FINAL_BUILD"
rm -rf "$FINAL_BUILD/GramSMC.kext" "$FINAL_BUILD/GramControlCenter.app"
cp -R "$DERIVED_DATA/GramSMC.kext" "$FINAL_BUILD/"
cp "$DERIVED_DATA/GramSMCDaemon" "$FINAL_BUILD/"
cp -R "$DERIVED_DATA/GramControlCenter.app" "$FINAL_BUILD/"

echo -e "${PRINT_GREEN}All binaries built and copied to FinalBuild.${PRINT_NC}"

# Step 3: Optional Installation to EFI
echo -e "\n${PRINT_BLUE}[3/4] Installation to EFI${PRINT_NC}"
if [ -d "$EFI_OC_ACPI" ]; then
    read -p "Install SSDT and Kext to EFI? (y/n) " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        sudo rm -rf "$EFI_OC_KEXTS/GramSMC.kext"
        sudo cp "$FINAL_BUILD/SSDT-GramSMC.aml" "$EFI_OC_ACPI/"
        sudo cp -R "$FINAL_BUILD/GramSMC.kext" "$EFI_OC_KEXTS/"
        echo -e "${PRINT_GREEN}Installed to EFI. Reboot required.${PRINT_NC}"
    fi
else
    echo -e "${PRINT_RED}EFI partition not found or not mounted at $EFI_OC_ACPI.${PRINT_NC}"
fi

# Step 4: Optional Installation of Daemon and App
echo -e "\n${PRINT_BLUE}[4/4] Installation to System${NC}"
read -p "Install Daemon and App to system locations? (y/n) " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    # Daemon
    echo "Installing GramSMCDaemon..."
    sudo mkdir -p "$DAEMON_DEST"
    sudo cp "$FINAL_BUILD/GramSMCDaemon" "$DAEMON_DEST/"
    sudo chown root:wheel "$DAEMON_DEST/GramSMCDaemon"
    sudo chmod 755 "$DAEMON_DEST/GramSMCDaemon"
    
    # Plist
    sudo cp "$PROJECT_ROOT/GramSMCDaemon/com.bananz0.GramSMCDaemon.plist" "$DAEMON_PLIST/"
    sudo chown root:wheel "$DAEMON_PLIST/com.bananz0.GramSMCDaemon.plist"
    sudo chmod 644 "$DAEMON_PLIST/com.bananz0.GramSMCDaemon.plist"
    
    # Reload Daemon
    sudo launchctl unload "$DAEMON_PLIST/com.gramsmc.GramSMCDaemon.plist" 2>/dev/null || true
    sudo launchctl unload "$DAEMON_PLIST/com.bananz0.GramSMCDaemon.plist" 2>/dev/null || true
    sudo launchctl load "$DAEMON_PLIST/com.bananz0.GramSMCDaemon.plist"
    
    # App
    echo "Installing GramControlCenter to Applications..."
    sudo rm -rf "$APP_DEST/GramControlCenter.app"
    sudo cp -R "$FINAL_BUILD/GramControlCenter.app" "$APP_DEST/"
    
    echo -e "${PRINT_GREEN}Daemon and App installed.${PRINT_NC}"
fi

echo -e "\n${PRINT_GREEN}GramSMC installer finished!${PRINT_NC}"
