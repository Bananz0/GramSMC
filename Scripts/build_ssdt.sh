#!/bin/bash

# Build SSDT-GramSMC from source
set -e

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

SOURCE_DIR="$1"
OUTPUT_DIR="$2"

if [ -z "$SOURCE_DIR" ] || [ -z "$OUTPUT_DIR" ]; then
    echo -e "${RED}Usage: $0 <source_dir> <output_dir>${NC}"
    exit 1
fi

SSDT_DSL="$SOURCE_DIR/GramSMC/SSDT-GramSMC.dsl"
SSDT_AML="$OUTPUT_DIR/SSDT-GramSMC.aml"

echo -e "${BLUE}Building SSDT-GramSMC...${NC}"

if [ ! -f "$SSDT_DSL" ]; then
    echo -e "${RED}Error: SSDT source not found: $SSDT_DSL${NC}"
    exit 1
fi

# Check if iasl is available
if ! command -v iasl &> /dev/null; then
    echo -e "${RED}Error: iasl compiler not found. Please install ACPICATools${NC}"
    echo -e "${RED}  brew install acpica${NC}"
    exit 1
fi

# Compile SSDT
cd "$(dirname "$SSDT_DSL")"
iasl -ve -tc "$SSDT_DSL" || {
    echo -e "${RED}Error: Failed to compile SSDT${NC}"
    exit 1
}

# Copy to output
mkdir -p "$OUTPUT_DIR"
cp "$(dirname "$SSDT_DSL")/SSDT-GramSMC.aml" "$SSDT_AML" || {
    echo -e "${RED}Error: Failed to copy SSDT to output${NC}"
    exit 1
}

# Copy DSL for reference
cp "$SSDT_DSL" "$OUTPUT_DIR/" || true

echo -e "${GREEN}✓ SSDT compiled successfully: $SSDT_AML${NC}"
