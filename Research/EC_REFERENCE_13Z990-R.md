# LG Gram 13z990-R EC Register Reference

**IMPORTANT**: This document is specific to the **LG Gram 13z990-R (2019 model)**.

Other LG Gram models may have different register layouts or use WMI interfaces instead of direct EC access. See `LG_GRAM_EC_WMI_REFERENCE.md` for general information covering multiple models, but note that much of that document does NOT apply to the 13z990-R.

---

## Hardware Specifications

- **Model**: LG Gram 13z990-R
- **Year**: 2019
- **EC Chip**: EC6662
- **ACPI Device Path**: `\_SB.PCI0.LPCB.H_EC`
- **Verification**: 21+ EC dump analysis (January 2026)

---

## EC Register Map

All registers accessed via ACPI methods `ECRX` (read) and `ECWX` (write).

### Feature Control Registers

| Offset | Name | Type | Description | Values | Notes |
|--------|------|------|-------------|--------|-------|
| **0x64** | RDMD | Bit 7 | **Reader Mode** (Blue Light Filter) | Bit 7=0: OFF<br>Bit 7=1: ON | Controls LED-level blue light reduction. Read-modify-write required to preserve other bits. |
| **0x72** | KBLV | Byte | **Keyboard Backlight Level** | 0x80: Off<br>0xA2: Low<br>0xA4: High | Full byte write. No intermediate values supported. |
| **0x73** | FNLK | Bit 2 | **Fn Lock** | 0x00: OFF (Fn needed)<br>0x04: ON (F1-F12 direct) | Bit 2 controls lock state. |
| **0xBC** | BCSP | Byte | **Battery Care Limit** | 0x50: 80%<br>0x64: 100% | Charge limit. Resets to 100% on boot. |
| **0xBE** | USCC | Bit 0 | **USB Always-On Charging** | 0x00: OFF<br>0x01: ON | Allows charging devices when laptop is asleep/off. Resets to OFF on boot. |
| **0xCF** | SLNT | Byte | **Silent Mode** (Fan Control) | 0x00: Normal<br>0x11: Silent | Primary fan control register. |

### Status/Sensor Registers (Read-Only)

| Offset | Name | Type | Description | Notes |
|--------|------|------|-------------|-------|
| **0xC8** | TMP1 | Byte | **CPU Temperature** | Value in Celsius |
| **0xCB** | FRPM | Byte | **Fan RPM** (raw) | Multiply by ~100 for actual RPM |
| **0xE4** | FNKN | Byte | **Last Fn Key Code** | Event code from last Fn+Fxx press |

### Battery Data Registers (Dynamic, Read-Only)

| Offset | Description |
|--------|-------------|
| 0x94-0x99 | Battery voltage/current/state data |
| 0x9C | Battery status flags |
| 0x9D | Battery data |

---

## Implementation in GramSMC

### SSDT Methods

All methods are in `SSDT-GramSMC.dsl` under device `\_SB.GRAM`:

#### Keyboard Backlight
- `GKBL()` - Get level (returns 0/1/2)
- `SKBL(level)` - Set level (0=Off, 1=Low, 2=High)
- `CKBL()` - Cycle levels (Off → Low → High → Off)

#### Reader Mode
- `GRDM()` - Get state (returns 0=Off, 1=On)
- `SRDM(state)` - Set state (0=Off, 1=On)
  - Reads 0x64, masks bit 7, writes back

#### Fan Mode (Silent Mode)
- `GSLM()` - Get mode (returns 0=Normal, 1=Silent)
- `SSLM(mode)` - Set mode (0=Normal, 1=Silent)

#### Battery Care
- `GBCL()` - Get limit (returns 80 or 100)
- `SBCL(limit)` - Set limit (80 or 100)

#### USB Charging
- `GUSC()` - Get state (returns 0=Off, 1=On)
- `SUSC(state)` - Set state (0=Off, 1=On)

#### Fn Lock
- `GFNL()` - Get state (returns 0=Off, 1=On)
- `SFNL(state)` - Set state (0=Off, 1=On)

#### Sensors
- `GTMP()` - Get CPU temperature (Celsius)
- `GFAN()` - Get fan RPM

#### System
- `GCAP()` - Get capabilities (returns 0x1F for 13z990-R)
- `GEVT()` - Get last event code (for kext communication)
- `NEVT(code)` - Notify event (internal use by EC query methods)

### Capabilities Bitmap

`GCAP()` returns `0x1F` (binary: 0001 1111) for the 13z990-R:

| Bit | Value | Feature | Status |
|-----|-------|---------|--------|
| 0 | 0x01 | Fan Mode (Silent) | ✅ Supported |
| 1 | 0x02 | Battery Care Limit | ✅ Supported |
| 2 | 0x04 | USB Always-On Charging | ✅ Supported |
| 3 | 0x08 | Reader Mode | ✅ Supported |
| 4 | 0x10 | Fn Lock | ✅ Supported |
| 5 | 0x20 | Webcam Control | ❌ **NOT supported** on 13z990-R |

### Kext Implementation

File: `GramSMC/GramSMC.cpp`

**Initialization** (`start` method):
1. Calls `getCapabilities()` → evaluates `GCAP()`
2. For each capability bit set, reads current state and sets property
3. Registers with VirtualSMC for sensor keys

**Property Updates** (`setPropertiesGated` method):
- App/daemon can set properties via IORegistry
- Kext validates values and calls appropriate SSDT method
- Example: Setting `KeyboardBacklight=2` → calls `SKBL(2)` → writes 0xA4 to EC 0x72

**Event Handling** (`handleMessage` method):
- EC query methods (`_Q64`, `_Q34`, `_Q36`) call `NEVT(code)`
- Kext polls via `GEVT()` and dispatches to `handleMessage`
- Example: Fn+F8 → `_Q64` → `CKBL()` → `NEVT(0xC0+level)` → kext updates property

**State Refresh** (`refreshECStates` method):
- Called periodically and after events
- Reads all feature states via `GXXX()` methods
- Updates IORegistry properties if changed
- Ensures app stays synchronized with hardware

---

## Complete Data Flow Example: Changing Reader Mode

### From App/Daemon → Hardware

```
App/GramControlCenter
  ↓ (sets IORegistry property)
GramSMC kext: setPropertiesGated()
  ↓ (validates, calls ACPI)
SSDT method: SRDM(1)
  ↓ (read-modify-write)
EC register 0x64: |= 0x80
  ↓ (hardware effect)
Display: Blue light reduced
```

### From Hardware → App/Daemon

```
User presses Fn+F9
  ↓ (EC event)
EC Query: _Q36 triggered
  ↓ (SSDT handler)
SSDT: NEVT(0x74) [F9 event code]
  ↓ (notification)
GramSMC kext: handleMessage(0x74)
  ↓ (dispatches)
Kext: toggleReaderMode()
  ↓ (calls ACPI)
SSDT: GRDM() → SRDM(!current)
  ↓ (EC write)
EC 0x64: bit 7 toggled
  ↓ (refresh state)
Kext: refreshECStates()
  ↓ (reads back)
SSDT: GRDM() returns new state
  ↓ (updates property)
Kext: setProperty("ReaderMode", new_state)
  ↓ (notifies)
KernEventServer → Daemon
  ↓ (message)
App: Updates UI toggle state
```

---

## Feature NOT Supported on 13z990-R

### Webcam Control
- **Status**: ❌ Not implemented
- **Reason**: Hardware does not support software webcam disable
- **EC Register 0xC0 bit 5**: Exists on other models but non-functional on 13z990-R
- **Kext**: All webcam methods removed
- **SSDT**: No `GWCM`/`SWCM` methods defined
- **Capability bit 5**: Not set in `GCAP()` return value

---

## Notes

1. **Boot Behavior**:
   - USB Charging resets to OFF
   - Battery Care Limit resets to 100%
   - Other settings (Reader Mode, Fn Lock, Silent Mode) persist

2. **Read-Modify-Write Required**:
   - Reader Mode (0x64): Must preserve other bits when toggling bit 7
   - Fn Lock (0x73): Must preserve other bits when toggling bit 2

3. **Full Byte Writes**:
   - Keyboard Backlight (0x72): Write full value (0x80/0xA2/0xA4)
   - Silent Mode (0xCF): Write full value (0x00/0x11)
   - Battery Care (0xBC): Write full value (0x50/0x64)

4. **Event Codes**:
   - 0x10: Brightness down
   - 0x11: Brightness up
   - 0x5E: Sleep button
   - 0x64: Keyboard backlight toggle (Fn+F8)
   - 0x74: Reader mode toggle (Fn+F9)
   - 0xC0-0xC2: Backlight level notifications (from CKBL)

---

## Version History

- **2026-01-04**: Initial documentation based on EC dump analysis
- Verified against 21 EC dumps from various system states
- Cross-referenced with DSDT/SSDT and GramSMC implementation
