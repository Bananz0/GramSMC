# Windows Boot & Sleep Issues - Analysis and Fixes

## Issues Reported

1. **Windows audio and WiFi not working** when booting from OpenCore
2. **Sleep doesn't wake** sometimes, requires restart
3. **BIOS options reset** after forced restart

## Root Causes

### Issue 1: Windows Audio/WiFi Not Working

**Primary Cause: ACPI Binary Patches Affecting Windows**

The following patches in your config.plist affect **ALL operating systems**, including Windows:

1. **`_OSI to XOSI` rename** - This breaks Windows OS detection
   - Windows checks `_OSI("Windows 2015")` etc. to enable devices
   - After rename, it checks `XOSI()` instead, which only returns true for Windows versions in SSDT-XOSI
   - **Problem:** SSDT-XOSI is designed for macOS and may not properly handle all Windows checks

2. **EC Query renames** (_Q50, _Q51, _Q36 to XQ50, XQ51, XQ36)
   - These renames affect the embedded controller in both macOS AND Windows
   - SSDT-FNKey only handles these queries when `_OSI("Darwin")` is true
   - **Problem:** In Windows, the XQ methods are called but never defined, breaking keyboard hotkeys and possibly audio/WiFi control

3. **HPET IRQ patches** (RTC IRQ 8, TIMR IRQ 0 removal)
   - These patches modify hardware resource allocation globally
   - Can affect Windows driver loading and device initialization

### Issue 2: Sleep Not Waking + BIOS Reset

**Primary Causes: RTC/NVRAM Issues**

1. **`DisableRtcChecksum = false`**
   - RTC checksum validation can cause wake failures
   - When RTC memory is corrupted during sleep/wake, system may fail to resume

2. **`ResetHwSig = false`**
   - FACS Hardware Signature not being reset can cause sleep issues
   - System may think hardware changed and refuse to wake properly

3. **SSDT-RTCAWAC forcing STAS=0**
   - This disables AWAC and forces legacy RTC mode
   - Can conflict with Windows expectations on modern systems
   - May cause RTC memory issues

4. **BIOS reset after forced restart**
   - Indicates NVRAM/RTC memory corruption
   - Likely due to improper RTC handling during failed wake

## Fixes Applied

### ✅ Fix 1: Enable `ResetHwSig` (COMPLETED)
```xml
<key>ResetHwSig</key>
<true/>
```
**Purpose:** Resets FACS Hardware Signature to fix sleep/wake issues

### ✅ Fix 2: Enable `DisableRtcChecksum` (COMPLETED)
```xml
<key>DisableRtcChecksum</key>
<true/>
```
**Purpose:** Prevents RTC checksum validation that can cause BIOS resets

### ✅ Fix 3: Add HPET _STA to XSTA Rename (COMPLETED)
**Purpose:** Properly supports SSDT-HPET fallback logic

## Additional Fixes Needed for Windows Boot

### 🔧 Fix 4: Conditionally Apply ACPI Patches (RECOMMENDED)

**Option A: Boot Windows Directly from BIOS** (Easiest)
- Press F12/F11/Del during boot to access boot menu
- Select Windows Boot Manager directly (NOT through OpenCore)
- This bypasses all OpenCore patches
- **Pros:** No configuration changes needed, Windows works perfectly
- **Cons:** Must select boot option manually each time

**Option B: Disable XOSI Patch for Windows** (More Complex)

The `_OSI to XOSI` rename is the main culprit. You have two approaches:

1. **Disable SSDT-XOSI and _OSI rename completely**
   - Set `Enabled = false` for SSDT-XOSI in ACPI->Add
   - Set `Enabled = false` for "_OSI to XOSI" and "OSID to XSID" patches
   - **Warning:** May affect some macOS devices that need Windows spoofing

2. **Modify SSDT-XOSI to properly handle Windows** (Advanced)
   - Current SSDT-XOSI returns true for various Windows versions
   - But it may not handle all OS queries that Windows makes
   - Would need to analyze what specific OS checks Windows audio/WiFi drivers use

### 🔧 Fix 5: Disable EC Query Renames for Windows (RECOMMENDED)

Modify SSDT-FNKey to handle both Darwin AND non-Darwin cases:

**Current SSDT-FNKey logic:**
```asl
Method (_Q51, 0, NotSerialized)
{
    If (_OSI ("Darwin"))
    {
        Notify (\_SB.PCI0.LPCB.PS2K, 0x0405)
    }
    Else
    {
        \_SB.PCI0.LPCB.H_EC.XQ51 ()  // Calls renamed method
    }
}
```

**Problem:** This works in theory, but the Else branch calls XQ51 which should exist. However, the original _Q51 was renamed to XQ51 globally, so Windows also sees XQ51 instead of _Q51.

**Solutions:**

1. **Option A: Disable EC query renames and SSDT-FNKey**
   - Set these patches to `Enabled = false`:
     - "_Q51 to XQ51"
     - "_Q50 to XQ50"
     - "_Q36 to XQ36"
   - Set `Enabled = false` for SSDT-FNKey
   - **Result:** Lose brightness keys in macOS, but Windows works

2. **Option B: Use AML-level _OSI checking in rename patches** (Not possible with binary patches)
   - Binary patches don't support conditional application
   - Would require SSDT that conditionally defines methods based on OS

### 🔧 Fix 6: Verify Boot Quirks

Check your Booter->Quirks section. These can affect Windows:

```xml
<key>EnableWriteUnprotector</key>
<true/>
<!-- Should be true, doesn't affect Windows -->

<key>ForceExitBootServices</key>
<true/>
<!-- Can cause issues on some systems, try false if Windows has boot problems -->

<key>ProtectSecureBoot</key>
<true/>
<!-- May affect Windows Secure Boot, but shouldn't affect audio/WiFi -->
```

## Recommended Action Plan

### For Sleep/Wake Issues (BIOS Reset):
✅ **COMPLETED** - Applied fixes should resolve this:
1. `ResetHwSig = true` - Enables proper sleep/wake
2. `DisableRtcChecksum = true` - Prevents BIOS reset after wake failures

**Test:** Try sleep/wake in macOS now. Should be more stable.

### For Windows Audio/WiFi Issues:

**Immediate Solution (Recommended):**
1. Boot Windows **directly from BIOS boot menu**, not through OpenCore
   - This is the cleanest solution
   - Windows will work perfectly with all features
   - macOS remains unaffected

**Long-term Solution (If you need OpenCore boot menu for Windows):**

1. **Disable problematic patches when booting Windows:**
   - Create a second config.plist with patches disabled
   - OR use OpenCore's boot argument to skip certain SSDTs
   - OR disable these patches globally and test macOS:
     ```
     _OSI to XOSI - Set to false
     OSID to XSID - Set to false
     _Q51 to XQ51 - Set to false
     _Q50 to XQ50 - Set to false
     _Q36 to XQ36 - Set to false
     SSDT-XOSI - Set enabled to false
     SSDT-FNKey - Set enabled to false
     ```

2. **Test macOS after disabling:**
   - Most features should work (EC, HPET, PLUG, etc. don't need these patches)
   - You'll lose:
     - Brightness keys (can use Fn+F2/F3 directly)
     - Some Windows-specific device enablement
   
3. **If macOS needs these patches:**
   - The only clean solution is to boot Windows from BIOS directly
   - OR use separate EFI folders for different OSes

## Why This Happens

OpenCore applies ACPI patches and SSDTs **before the OS loads**. Unlike Clover which had OS-specific patch application, OpenCore's ACPI patches are universal. The only OS-specific logic is in SSDT code via `_OSI("Darwin")` checks, but:

1. **Binary patches** (like _OSI to XOSI) can't check OS
2. **Renamed methods** affect all operating systems
3. **SSDTs with _OSI checks** work correctly, but rely on renamed methods existing

This creates a conflict where Windows sees renamed methods (XQ51, XOSI, etc.) but the SSDT handling these only works fully in macOS.

## Summary

- ✅ Sleep/BIOS reset issues should be **FIXED** with the config changes
- ⚠️ Windows audio/WiFi issues require **booting Windows directly from BIOS** (easiest solution)
- 🔧 Alternative: Disable XOSI and EC query patches globally, test macOS functionality

Test the sleep fixes first. For Windows, use BIOS boot menu (F12/F11/Del) to select "Windows Boot Manager" directly.
