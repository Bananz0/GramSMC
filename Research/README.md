# Research and Reverse Engineering

This directory contains raw data, documentation, and notes used to reverse engineer the LG Gram Embedded Controller (EC) and WMI interface.

## LG_GRAM_EC_WMI_REFERENCE.md

Comprehensive documentation of EC registers and WMI methods based on analysis of the Linux lg-laptop.c driver, EC register dumps, and DSDT analysis.

## EC Dumps (`/EC_Dumps`)

The `.bin` files are organized into subdirectories by feature:

- **Backlight/**: Keyboard backlight toggles (High/Low/Off)
- **Fan_Thermal/**: Silent mode and fan control tests
- **Power_Battery/**: Battery care, USB charging, and power management
- **Input/**: Touchpad, Touchscreen, and Fn key locks
- **Baseline/**: Control dumps with no features active

### File Naming
The filenames describe the state of the laptop when the dump was taken. By comparing dumps with different features toggled, we identified the control registers.

**Examples:**
- `EC6662 kbl high.bin` vs `EC6662 kbl off.bin` → Identified Keyboard Backlight register (`0xE0`)
- `silent mode enabled.bin` vs `silent mode disabled.bin` → Identified Fan Mode register (`0xCB`)
- `battery limit enabled.bin` → Identified Battery Care Mode (`0xF0` / `0xFC`)

## Key Findings

| Feature | Register (Offset) | Values |
| :--- | :--- | :--- |
| **Keyboard Backlight** | `0xE0` | `0`=Off, `1`=Low, `2`=High |
| **Fan Mode** | `0xCB` | `0`=Optimal, `1`=Silent, `2`=Performance |
| **Battery Care** | `0xF0` or `0xFC` | `80` = 80% Limit, `100` = Full Charge |
| **USB Charging** | `0xBE` | `1`=On, `0`=Off |
| **Touchpad Lock** | `0x79` (Bit 6) | `1`=Locked, `0`=Unlocked |

## Methodology

1. Boot into Windows/Linux or UEFI Shell.
2. Toggle a specific feature (e.g., turn on Silent Mode).
3. Dump EC memory to a file.
4. Toggle the feature off.
5. Dump EC memory again.
6. Binary diff the two files to find changed bytes.
