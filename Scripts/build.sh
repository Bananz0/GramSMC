#!/bin/bash

# Local build script for GramSMC components
# Builds SSDT, Kext, App, and Daemon

set -euo pipefail

# Ensure we are in the project root
cd "$(dirname "$0")/.."

echo "--- Building SSDT ---"
if command -v iasl >/dev/null 2>&1; then
    iasl -ve -tc GramSMC/SSDT-GramSMC.dsl
    echo "SSDT build successful: GramSMC/SSDT-GramSMC.aml"
else
    echo "Warning: iasl not found. Skipping SSDT build."
    echo "Install with 'brew install acpica' on macOS."
fi

echo ""
echo "--- Building Xcode Projects (Kext, App, Daemon) ---"
# Select configuration (Debug by default for local testing)
CONFIG=${1:-Debug}

xcodebuild -project GramSMC.xcodeproj \
           -scheme "GramSMC All" \
           -configuration "$CONFIG" \
           -derivedDataPath build \
           build \
           CODE_SIGNING_ALLOWED=NO \
           CODE_SIGNING_REQUIRED=NO

echo ""
echo "--- Build Summary ---"
find build -type d -name "*.kext" -o -name "*.app"
find build -type f -name "GramSMCDaemon"
if [[ -f "GramSMC/SSDT-GramSMC.aml" ]]; then
    echo "GramSMC/SSDT-GramSMC.aml"
fi

echo ""
echo "Build completed successfully ($CONFIG)."
