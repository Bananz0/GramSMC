# LG Gram EC/WMI Interface Reference

Based on analysis of:
- Linux kernel `lg-laptop.c` driver (by Matan Ziv-Av)
- EC register dumps from LG Control Center
- DSDT/SSDT analysis

## WMI Interface

### WMI GUIDs

```c
// WMI Event GUIDs
#define WMI_EVENT_GUID0  "E4FB94F9-7F2B-4173-AD1A-CD1D95086248"
#define WMI_EVENT_GUID1  "023B133E-49D1-4E10-B313-698220140DC2"
#define WMI_EVENT_GUID2  "37BE1AC0-C3F2-4B1F-BFBE-8FDEAF2814D6"
#define WMI_EVENT_GUID3  "911BAD44-7DF8-4FBB-9319-BABA1C4B293B"

// WMI Method GUIDs
#define WMI_METHOD_WMAB  "C3A72B38-D3EF-42D3-8CBB-D5A57049F66D"
#define WMI_METHOD_WMBB  "2B4F501A-BD3C-4394-8DCF-00A7D2BC8210"
```

### ACPI Device ID
- **LGEX0820** - LG Gram ACPI device

### WMI Method Constants

```c
// WMAB Methods (called via ACPI WMAB)
#define WM_FAN_MODE     0x33    // Fan mode (0=Optimal, 1=Silent, 2=Performance)
#define WM_READER_MODE  0x??    // Reader mode toggle
#define WM_FN_LOCK      0x??    // Fn lock toggle
#define WM_BATT_LIMIT   0x??    // Battery charge limit (pre-2019 models)
#define WM_KEY_LIGHT    0x??    // Keyboard backlight
#define WM_TLED         0x??    // Touchpad LED

// WMBB Methods (used for 2019+ models)
#define WMBB_USB_CHARGE 0x??    // USB charging toggle
#define WMBB_BATT_LIMIT 0x??    // Battery charge limit (2019+ models)

// Operation modes
#define WM_GET          0x00    // Read value
#define WM_SET          0x01    // Write value
```

### Fan Mode Bits
```c
#define FAN_MODE_LOWER  GENMASK(1, 0)  // Bits 0-1: DC power fan mode
#define FAN_MODE_UPPER  GENMASK(5, 4)  // Bits 4-5: AC power fan mode

// Fan mode values:
// 0 = Optimal (Auto)
// 1 = Silent (Low noise)
// 2 = Performance (Maximum cooling)
```

---

## EC Register Map (EC6662)

Based on EC dump analysis from LG Control Center (verified Jan 2026 from 21 dumps):

### Feature Control Registers

| Offset | Name | Size | Description | Values |
|--------|------|------|-------------|--------|
| 0x73 | FNLK | bit 2 | Fn Lock | 0x00=OFF (Fn needed), 0x04=ON (F1-F12 direct) |
| 0xBC | BCSP | 8-bit | Battery Care Limit | 0x50=80%, 0x64=100% |
| 0xBE | USCC | bit 0 | USB Charging (off/on) | 0x00=off, 0x01=on |
| 0xC8 | TSR1 | 8-bit | CPU Temperature | Dynamic value |
| 0xCF | DFAN | 8-bit | Silent Mode | 0x00=off, 0x11=on |

### Temperature & Fan Registers

| Offset | Name | Size | Description | Notes |
|--------|------|------|-------------|-------|
| 0xC8 | TMP1 | 8-bit | CPU Temperature (likely) | Value fluctuates, unlikely to be Touch Screen |
| 0xC9 | TMP2 | 8-bit | Temperature Sensor 2 | |
| 0xCB | FRPM | 8-bit | Fan RPM (raw) | Multiply by 100 for approx RPM (Read 0x00 in idle dumps) |
| 0xCC | DFAN | 8-bit | Fan Mode Register | Remained 0x00 in dumps; likely used for Performance mode |
| 0xCF | SLNT | 8-bit | Silent Mode Toggle | **Primary Control**: 0x00=Normal, 0x11=Silent |

### Keyboard Backlight Registers

| Offset | Name | Size | Description | Values |
|--------|------|------|-------------|--------|
| 0x72 | KBLV | 8-bit | Keyboard Backlight Level | 0x80=Off, 0xA2=Low, 0xA4=High |
| 0xE4 | FNKN | 8-bit | Function Key Number | Last Fn key pressed |
| 0xEB | SLED | 8-bit | Keyboard LED State | Status bits |

### Power Management Notes
- **USB Charging (0xBE)**: Controls "Always On Charging" (charging other devices while laptop is sleep/off).
- **USB-C Source/Sink**: These settings (Source/Sink/Auto) do **not** appear in the EC 0x00-0xFF range. likely handled by USB-PD controller or separate EC bank.

### Battery Data Registers (Dynamic)

| Offset | Name | Description |
|--------|------|-------------|
| 0x94 | | Battery voltage/current (changes frequently) |
| 0x95 | | Battery data |
| 0x96 | | Battery data |
| 0x98 | | Battery data |
| 0x99 | | Battery data |
| 0x9C | | Battery state flags |
| 0x9D | | Battery data |

### Other Known Registers

| Offset | Name | Description |
|--------|------|-------------|
| 0x64 | RDMD | Reader Mode (bit 7) |
| 0xB9 | BMB1 | Battery Management (possibly old offset) |
| 0xC0 | CAMA | Webcam Enable (bit 5) |
| 0xDC-0xDD | ALS | Ambient Light Sensor (16-bit) |

---

## Linux Driver Address Space

The lg-laptop.c driver uses a custom ACPI address space for debugging:

```c
#define LG_ADDRESS_SPACE_ID                     0x8C

// Field addresses
#define LG_ADDRESS_SPACE_DEBUG_FLAG_ADR         0x00
#define LG_ADDRESS_SPACE_FAN_MODE_ADR           0x40
#define LG_ADDRESS_SPACE_CPU_TEMP_ADR           0x60
#define LG_ADDRESS_SPACE_CPU_TRIP_LOW_ADR       0x64
#define LG_ADDRESS_SPACE_CPU_TRIP_HIGH_ADR      0x68
#define LG_ADDRESS_SPACE_MB_TEMP_ADR            0x70
#define LG_ADDRESS_SPACE_MB_TRIP_LOW_ADR        0x74
#define LG_ADDRESS_SPACE_MB_TRIP_HIGH_ADR       0x78
#define LG_ADDRESS_SPACE_HD_AUDIO_POWER_ADDR    0xD0
#define LG_ADDRESS_SPACE_DEBUG_MSG_START_ADR    0xD8
#define LG_ADDRESS_SPACE_DEBUG_MSG_END_ADR      0xFF
#define LG_ADDRESS_SPACE_DTTM_FLAG_ADR          0xD4
```

---

## Function Key Events

| Key Combo | Event Code | Linux Keycode | Description |
|-----------|------------|---------------|-------------|
| Fn+F1 | 0x70 | F15 | LG Control Panel |
| Fn+F5 | 0x74 | F21 | Touchpad Toggle |
| Fn+F6 | | RFKILL | Airplane Mode |
| Fn+F8 | 0x10000000 | F16 | Keyboard Backlight |
| Fn+F9 | 0xf020000 | F14 | Reader Mode |

---

## Usage Examples

### Reading Fan Mode (via WMAB)
```
WMAB(0x33, 0x00, 0x00)  // WM_FAN_MODE, WM_GET
Returns: Integer with fan mode in bits 0-1 (DC) and 4-5 (AC)
```

### Setting Fan Mode (via WMAB)
```
WMAB(0x33, 0x01, mode | (mode << 4))  // Set both AC and DC to same mode
mode: 0=Optimal, 1=Silent, 2=Performance
```

### Reading USB Charge (via WMBB)
```
WMBB(WMBB_USB_CHARGE, 0x00, 0x00)  // WM_GET
Returns: Buffer with status at offset 0x10
```

### Setting USB Charge (via WMBB)
```
WMBB(WMBB_USB_CHARGE, 0x01, value)  // WM_SET, 0=off, 1=on
```

---

## Notes

1. **Year Detection**: The Linux driver detects the laptop year from DMI product name:
   - Position 4-5 in product name indicates year
   - 2019+ models use WMBB for battery limit
   - Older models use WMAB

2. **Battery Limit Reset**: The battery charge limit resets to 100% on boot

3. **USB Charge Reset**: USB charging setting resets to 0 (off) on boot

4. **Keyboard Backlight Levels**:
   - 0x00 = Off
   - 0x22 = Low
   - 0x24 = High

---

## Implementation Notes for GramSMC

For the macOS kext, you can:

1. **Use WMI via ACPI** - Call WMAB/WMBB methods directly
2. **Use direct EC access** - Read/write EC registers via ECRD/ECWT methods
3. **Hybrid approach** - Use WMI for complex operations, direct EC for simple toggles

The WMI approach is safer and more compatible across different LG Gram models.
