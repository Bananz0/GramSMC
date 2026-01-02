#!/bin/bash

# Unified GramSMC Build Script
# Builds all targets (kext, daemon, app) and SSDT, then organizes in Release folder

set -e

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

PROJECT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
BUILD_DIR="$PROJECT_DIR/build"
RELEASE_DIR="$BUILD_DIR/Release"

echo -e "${BLUE}=== GramSMC Unified Build Script ===${NC}"

# Clean previous build
echo -e "\n${BLUE}[1/4] Cleaning previous build...${NC}"
rm -rf "$BUILD_DIR"
mkdir -p "$RELEASE_DIR"

# Build all targets
echo -e "\n${BLUE}[2/4] Building all targets...${NC}"

# Build GramSMC kext (this will also build SSDT via build phase)
echo "Building GramSMC kext..."
xcodebuild -project "$PROJECT_DIR/GramSMC.xcodeproj" \
           -scheme GramSMC \
           -configuration Release \
           -derivedDataPath "$BUILD_DIR/DerivedData" \
           build \
           CONFIGURATION_BUILD_DIR="$RELEASE_DIR" \
           2>&1 | grep -E "(error|warning|===)" || true

# Build GramSMCDaemon
echo "Building GramSMCDaemon..."
xcodebuild -project "$PROJECT_DIR/GramSMC.xcodeproj" \
           -scheme GramSMCDaemon \
           -configuration Release \
           -derivedDataPath "$BUILD_DIR/DerivedData" \
           build \
           CONFIGURATION_BUILD_DIR="$RELEASE_DIR" \
           2>&1 | grep -E "(error|warning|===)" || true

# Build GramControlCenter app
echo "Building GramControlCenter app..."
xcodebuild -project "$PROJECT_DIR/GramSMC.xcodeproj" \
           -scheme GramControlCenter \
           -configuration Release \
           -derivedDataPath "$BUILD_DIR/DerivedData" \
           build \
           CONFIGURATION_BUILD_DIR="$RELEASE_DIR" \
           2>&1 | grep -E "(error|warning|===)" || true

# Build SSDT manually (in case build phase didn't work)
echo -e "\n${BLUE}[3/4] Building SSDT-GramSMC...${NC}"
if [ -f "$PROJECT_DIR/Scripts/build_ssdt.sh" ]; then
    bash "$PROJECT_DIR/Scripts/build_ssdt.sh" "$PROJECT_DIR" "$RELEASE_DIR" || {
        echo -e "${YELLOW}Warning: SSDT build failed, trying manual compilation${NC}"
        # Fallback: compile manually
        if command -v iasl &> /dev/null; then
            cd "$PROJECT_DIR/GramSMC"
            iasl -ve -tc SSDT-GramSMC.dsl 2>/dev/null || true
            cp SSDT-GramSMC.aml "$RELEASE_DIR/" 2>/dev/null || true
            cp SSDT-GramSMC.dsl "$RELEASE_DIR/" 2>/dev/null || true
        fi
    }
fi

# Copy additional files
echo -e "\n${BLUE}[4/4] Organizing build artifacts...${NC}"

# Copy daemon plist
cp "$PROJECT_DIR/GramSMCDaemon/com.bananz0.GramSMCDaemon.plist" "$RELEASE_DIR/" 2>/dev/null || true

# Copy install scripts
cp "$PROJECT_DIR/Scripts/install_all.sh" "$RELEASE_DIR/" 2>/dev/null || true
cp "$PROJECT_DIR/install_all.sh" "$RELEASE_DIR/" 2>/dev/null || true

# Copy config files
cp "$PROJECT_DIR/FinalBuild/config.plist" "$RELEASE_DIR/" 2>/dev/null || true
cp "$PROJECT_DIR/ACPI-Gram/config.plist" "$RELEASE_DIR/" 2>/dev/null || true

# Copy TROUBLESHOOTING guide
cp "$PROJECT_DIR/FinalBuild/TROUBLESHOOTING.md" "$RELEASE_DIR/" 2>/dev/null || true

# Verify build
echo -e "\n${BLUE}=== Build Verification ===${NC}"
echo "Contents of $RELEASE_DIR:"
ls -lah "$RELEASE_DIR" | grep -E "(GramSMC|Daemon|app|SSDT|\.sh|\.plist|\.md)" || echo "No build artifacts found"

# Check for required files
MISSING_FILES=()
[ -d "$RELEASE_DIR/GramSMC.kext" ] || MISSING_FILES+=("GramSMC.kext")
[ -f "$RELEASE_DIR/GramSMCDaemon" ] || MISSING_FILES+=("GramSMCDaemon")
[ -d "$RELEASE_DIR/GramControlCenter.app" ] || MISSING_FILES+=("GramControlCenter.app")
[ -f "$RELEASE_DIR/SSDT-GramSMC.aml" ] || MISSING_FILES+=("SSDT-GramSMC.aml")

if [ ${#MISSING_FILES[@]} -eq 0 ]; then
    echo -e "\n${GREEN}✓ Build successful! All components built.${NC}"
    echo -e "${GREEN}  Ready for deployment to OpenCore.${NC}"
    echo -e "\n${BLUE}Next steps:${NC}"
    echo -e "  1. Copy files from $RELEASE_DIR to OpenCore EFI"
    echo -e "  2. Update config.plist"
    echo -e "  3. Reboot"
    echo -e "  4. Run: sudo bash $RELEASE_DIR/install_all.sh"
else
    echo -e "\n${RED}✗ Build incomplete. Missing files: ${MISSING_FILES[*]}${NC}"
    exit 1
fi

echo -e "\n${BLUE}Build completed at: $(date)${NC}"