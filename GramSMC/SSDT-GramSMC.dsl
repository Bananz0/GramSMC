/*
 * SSDT-GramSMC.dsl
 * 
 * LG Gram SMC ACPI Support Table
 * Provides interface between macOS GramSMC kext and LG Gram EC
 *
 * TARGET HARDWARE: LG Gram 13z990-R (2019 Model)
 * EC Chip: EC6662
 * ACPI Device: _SB.PCI0.LPCB.H_EC
 * 
 * IMPORTANT: This implementation is tailored for the 13z990-R model.
 * Other LG Gram models may have different EC register layouts or use WMI interfaces.
 * See Research/LG_GRAM_EC_WMI_REFERENCE.md for general reference (covers multiple models).
 *
 * CONFIRMED EC REGISTERS (verified via 21+ EC dumps, Jan 2026):
 * ==============================================================
 *   0x64 (RDMD) - Reader Mode: Bit 7 (0x80 mask)
 *                 Bit 7 = 0: Reader Mode OFF
 *                 Bit 7 = 1: Reader Mode ON (reduces blue light via LED control)
 *
 *   0x72 (KBLV) - Keyboard Backlight Level (full byte):
 *                 0x80 = Off
 *                 0xA2 = Low (brightness level 1)
 *                 0xA4 = High (brightness level 2)
 *
 *   0x73 (FNLK) - Fn Lock: Bit 2 (0x04 mask)
 *                 0x00 = OFF (Fn key needed for F1-F12)
 *                 0x04 = ON (F1-F12 direct, Fn inverts)
 *
 *   0xBC (BCSP) - Battery Care Limit (full byte):
 *                 0x50 = 80% charge limit (battery saver)
 *                 0x64 = 100% full charge
 *
 *   0xBE (USCC) - USB Always-On Charging: Bit 0
 *                 0x00 = OFF
 *                 0x01 = ON (charges devices when laptop sleep/off)
 *
 *   0xCF (SLNT) - Silent Mode / Fan Control (full byte):
 *                 0x00 = Normal mode (auto fan)
 *                 0x11 = Silent mode (reduced fan speed)
 *
 * READ-ONLY STATUS REGISTERS:
 * ===========================
 *   0xC8 (TMP1) - CPU Temperature (Celsius)
 *   0xCB (FRPM) - Fan RPM (raw value, multiply by ~100 for actual RPM)
 *   0xE4 (FNKN) - Last Fn key event code
 *
 * NOTES:
 * - Webcam control (0xC0 bit 5) NOT implemented - 13z990-R lacks hardware support
 * - USB-C Source/Sink modes NOT in EC space (handled by separate PD controller)
 * - Settings (USB charging, battery limit) reset to defaults on boot
 *
 * Copyright (c) 2026 Glen Muthoka Mutinda
 * Based on EC analysis and DSDT reverse engineering
 */

DefinitionBlock ("", "SSDT", 2, "GRAM", "GramSMC", 0x00002000)
{
    // External references to existing DSDT objects
    External (_SB_.PCI0.LPCB, DeviceObj)
    External (_SB_.PCI0.LPCB.H_EC, DeviceObj)
    External (_SB_.PCI0.LPCB.H_EC.ECAV, IntObj)
    External (_SB_.PCI0.LPCB.H_EC.ECRX, MethodObj)    // 1 Arg - Read EC byte by offset
    External (_SB_.PCI0.LPCB.H_EC.ECWX, MethodObj)    // 2 Args - Write EC byte by offset
    External (ECON, IntObj)                            // EC ready flag
    
    // External references for renamed EC query methods (if patching Fn keys)
    // Brightness keys - COMMENTED OUT per user request (let graphics driver handle)
    // External (_SB_.PCI0.LPCB.H_EC.XQ50, MethodObj)  // Brightness Down
    // External (_SB_.PCI0.LPCB.H_EC.XQ51, MethodObj)  // Brightness Up
    External (_SB_.PCI0.LPCB.H_EC.XQ64, MethodObj)     // Keyboard Backlight / F8
    External (_SB_.PCI0.LPCB.H_EC.XQ34, MethodObj)     // Sleep
    External (_SB_.PCI0.LPCB.H_EC.XQ36, MethodObj)     // Fn key events

    // GramSMC Device - Interface for macOS kext
    Scope (_SB)
    {
        Device (GRAM)
        {
            Name (_HID, "GRAM0001")  // Hardware ID for kext matching
            Name (_CID, "GRAM0001")  // Compatible ID
            Name (_UID, One)
            
            // Event buffer for kext communication
            Name (EVTB, Zero)  // Event buffer
            Name (KBLS, Zero)  // Keyboard backlight state cache (0=Off, 1=Low, 2=High)
            
            Method (_STA, 0, NotSerialized)
            {
                If ((ECON == One))
                {
                    Return (0x0F)  // Present, enabled, functioning
                }
                Return (Zero)
            }
            
            // ============================================
            // Keyboard Backlight Methods
            // EC Register: 0x72
            // Values: 0x80=Off, 0xA2=Low, 0xA4=High
            // ============================================
            
            // GKBL - Get Keyboard Backlight Level
            // Returns: 0=Off, 1=Low, 2=High
            Method (GKBL, 0, Serialized)
            {
                If ((ECON == One))
                {
                    Local0 = \_SB.PCI0.LPCB.H_EC.ECRX (0x72)
                    If ((Local0 == 0x80))
                    {
                        Return (Zero)  // Off
                    }
                    ElseIf ((Local0 == 0xA2))
                    {
                        Return (One)   // Low
                    }
                    ElseIf ((Local0 == 0xA4))
                    {
                        Return (0x02)  // High
                    }
                }
                Return (Zero)  // Default: Off
            }
            
            // SKBL - Set Keyboard Backlight Level
            // Arg0: 0=Off, 1=Low, 2=High
            // Returns: 0 on success
            Method (SKBL, 1, Serialized)
            {
                If ((ECON == One))
                {
                    If ((Arg0 == Zero))
                    {
                        \_SB.PCI0.LPCB.H_EC.ECWX (0x72, 0x80)  // Off
                        KBLS = Zero
                    }
                    ElseIf ((Arg0 == One))
                    {
                        \_SB.PCI0.LPCB.H_EC.ECWX (0x72, 0xA2)  // Low
                        KBLS = One
                    }
                    ElseIf ((Arg0 == 0x02))
                    {
                        \_SB.PCI0.LPCB.H_EC.ECWX (0x72, 0xA4)  // High
                        KBLS = 0x02
                    }
                    Else
                    {
                        Return (One)  // Invalid argument
                    }
                    Return (Zero)  // Success
                }
                Return (One)  // Error: EC not ready
            }
            
            // CKBL - Cycle Keyboard Backlight (for Fn+F8)
            // Cycles: Off -> Low -> High -> Off
            // Returns: new level (0-2)
            Method (CKBL, 0, Serialized)
            {
                Local0 = GKBL ()
                Local0 = (Local0 + One) % 0x03
                SKBL (Local0)
                Return (Local0)
            }
            
            // ============================================
            // Silent Mode (Fan Mode)
            // EC Register: 0xCF
            // Values: 0x00=Normal, 0x11=Silent
            // ============================================
            
            // GSLM - Get Silent Mode
            // Returns: 0=Normal, 1=Silent
            Method (GSLM, 0, Serialized)
            {
                If ((ECON == One))
                {
                    Local0 = \_SB.PCI0.LPCB.H_EC.ECRX (0xCF)
                    If ((Local0 == 0x11))
                    {
                        Return (One)  // Silent
                    }
                }
                Return (Zero)  // Normal
            }
            
            // SSLM - Set Silent Mode
            // Arg0: 0=Normal, 1=Silent
            // Returns: 0 on success
            Method (SSLM, 1, Serialized)
            {
                If ((ECON == One))
                {
                    If ((Arg0 == Zero))
                    {
                        \_SB.PCI0.LPCB.H_EC.ECWX (0xCF, 0x00)  // Normal
                    }
                    Else
                    {
                        \_SB.PCI0.LPCB.H_EC.ECWX (0xCF, 0x11)  // Silent
                    }
                    Return (Zero)
                }
                Return (One)  // Error
            }
            
            // ============================================
            // Battery Care Limit
            // EC Register: 0xBC
            // Values: 0x50=80%, 0x64=100%
            // ============================================
            
            // GBCL - Get Battery Care Limit
            // Returns: 80 or 100
            Method (GBCL, 0, Serialized)
            {
                If ((ECON == One))
                {
                    Local0 = \_SB.PCI0.LPCB.H_EC.ECRX (0xBC)
                    If ((Local0 == 0x50))
                    {
                        Return (0x50)  // 80%
                    }
                }
                Return (0x64)  // 100% (default)
            }
            
            // SBCL - Set Battery Care Limit
            // Arg0: 80 (0x50) or 100 (0x64)
            // Returns: 0 on success
            Method (SBCL, 1, Serialized)
            {
                If ((ECON == One))
                {
                    If ((Arg0 == 0x50) || (Arg0 == 80))
                    {
                        \_SB.PCI0.LPCB.H_EC.ECWX (0xBC, 0x50)
                        Return (Zero)
                    }
                    ElseIf ((Arg0 == 0x64) || (Arg0 == 100))
                    {
                        \_SB.PCI0.LPCB.H_EC.ECWX (0xBC, 0x64)
                        Return (Zero)
                    }
                }
                Return (One)  // Error
            }
            
            // ============================================
            // USB Always-On Charging
            // EC Register: 0xBE
            // Values: 0x00=Off, 0x01=On
            // ============================================
            
            // GUSC - Get USB Charge State
            // Returns: 0=Off, 1=On
            Method (GUSC, 0, Serialized)
            {
                If ((ECON == One))
                {
                    Local0 = \_SB.PCI0.LPCB.H_EC.ECRX (0xBE)
                    Return ((Local0 != Zero))
                }
                Return (Zero)  // Default: Off
            }
            
            // SUSC - Set USB Charge State
            // Arg0: 0=Off, 1=On
            // Returns: 0 on success
            Method (SUSC, 1, Serialized)
            {
                If ((ECON == One))
                {
                    If ((Arg0 == Zero))
                    {
                        \_SB.PCI0.LPCB.H_EC.ECWX (0xBE, 0x00)
                    }
                    Else
                    {
                        \_SB.PCI0.LPCB.H_EC.ECWX (0xBE, 0x01)
                    }
                    Return (Zero)
                }
                Return (One)  // Error
            }
            
            // ============================================
            // Reader Mode (Blue Light Filter)
            // EC Register: 0x64, Bit 7 (0x80 mask)
            // Controls LED-level blue light reduction
            // ============================================
            
            // GRDM - Get Reader Mode State
            // Returns: 0=Off, 1=On
            Method (GRDM, 0, Serialized)
            {
                If ((ECON == One))
                {
                    Local0 = \_SB.PCI0.LPCB.H_EC.ECRX (0x64)
                    // Check bit 7 (0x80)
                    If ((Local0 & 0x80))
                    {
                        Return (One)   // Reader Mode ON
                    }
                }
                Return (Zero)  // Reader Mode OFF
            }
            
            // SRDM - Set Reader Mode State
            // Arg0: 0=Off, 1=On
            // Returns: 0 on success
            Method (SRDM, 1, Serialized)
            {
                If ((ECON == One))
                {
                    Local0 = \_SB.PCI0.LPCB.H_EC.ECRX (0x64)
                    If ((Arg0 == Zero))
                    {
                        // Clear bit 7 (Reader Mode OFF)
                        Local0 &= 0x7F
                    }
                    Else
                    {
                        // Set bit 7 (Reader Mode ON)
                        Local0 |= 0x80
                    }
                    \_SB.PCI0.LPCB.H_EC.ECWX (0x64, Local0)
                    Return (Zero)
                }
                Return (One)  // Error
            }
            
            // ============================================
            // Fn Lock
            // EC Register: 0x73, Bit 2 (0x04 mask)
            // ============================================
            
            // GFNL - Get Fn Lock State
            // Returns: 0=Off (Fn needed for F1-F12), 1=On (F1-F12 direct)
            Method (GFNL, 0, Serialized)
            {
                If ((ECON == One))
                {
                    Local0 = \_SB.PCI0.LPCB.H_EC.ECRX (0x73)
                    // 0x04 means Fn Lock is ON
                    If ((Local0 == 0x04))
                    {
                        Return (One)   // Fn Lock ON
                    }
                }
                Return (Zero)  // Fn Lock OFF
            }
            
            // SFNL - Set Fn Lock State
            // Arg0: 0=Off, 1=On
            // Returns: 0 on success
            Method (SFNL, 1, Serialized)
            {
                If ((ECON == One))
                {
                    If ((Arg0 == Zero))
                    {
                        // Fn Lock OFF -> write 0x00
                        \_SB.PCI0.LPCB.H_EC.ECWX (0x73, 0x00)
                    }
                    Else
                    {
                        // Fn Lock ON -> write 0x04
                        \_SB.PCI0.LPCB.H_EC.ECWX (0x73, 0x04)
                    }
                    Return (Zero)
                }
                Return (One)  // Error
            }
            
            // ============================================
            // Temperature & Fan (Read-Only)
            // ============================================
            
            // GTMP - Get CPU Temperature
            // Returns: Temperature in Celsius
            Method (GTMP, 0, Serialized)
            {
                If ((ECON == One))
                {
                    Return (\_SB.PCI0.LPCB.H_EC.ECRX (0xC8))
                }
                Return (0x32)  // Default 50°C
            }
            
            // GFAN - Get Fan Speed (approximate RPM)
            // Returns: Fan RPM
            Method (GFAN, 0, Serialized)
            {
                If ((ECON == One))
                {
                    Local0 = \_SB.PCI0.LPCB.H_EC.ECRX (0xCB)
                    Return ((Local0 * 100))  // Approximate conversion
                }
                Return (Zero)
            }
            
            // ============================================
            // Event Notification Methods
            // ============================================
            
            // NEVT - Notify Event (called by patched _Qxx methods)
            // Arg0: Event code
            Method (NEVT, 1, Serialized)
            {
                EVTB = Arg0
                Notify (GRAM, 0x80)  // Status change notification
            }
            
            // GEVT - Get Event (called by kext)
            // Returns: Last event code and clears buffer
            Method (GEVT, 0, Serialized)
            {
                Local0 = EVTB
                EVTB = Zero
                Return (Local0)
            }
            
            // ============================================
            // Feature Capability Detection
            // ============================================
            
            // GCAP - Get Capabilities
            // Returns bitmask of supported features for LG Gram 13z990-R:
            //   Bit 0 (0x01): Fan Mode (Silent Mode)
            //   Bit 1 (0x02): Battery Care Limit
            //   Bit 2 (0x04): USB Always-On Charging
            //   Bit 3 (0x08): Reader Mode (Blue Light Filter)
            //   Bit 4 (0x10): Fn Lock
            //   Bit 5 (0x20): Webcam Control (NOT SUPPORTED on 13z990-R)
            // Result: 0x1F (bits 0-4 set, bit 5 clear)
            Method (GCAP, 0, Serialized)
            {
                If ((ECON == One))
                {
                    // Bits 0-4: Silent, Battery, USB, Reader, FnLock
                    // Bit 5 (Webcam) = 0 (not supported on this model)
                    Return (0x1F)
                }
                Return (Zero)
            }
        }
    }
    
    // ============================================
    // EC Query Method Patches
    // Note: Brightness keys (F2/F3) left to graphics driver
    // ============================================
    
    Scope (\_SB.PCI0.LPCB.H_EC)
    {
        // Keyboard Backlight Key (Fn+F8)
        // Note: F8 may trigger mute on some systems; we cycle backlight instead
        // Requires patch: _Q64 -> XQ64
        Method (_Q64, 0, NotSerialized)
        {
            If (_OSI ("Darwin"))
            {
                // macOS: Cycle keyboard backlight and notify app
                Local0 = \_SB.GRAM.CKBL ()
                // Notify with backlight level (0xC0 + level)
                \_SB.GRAM.NEVT ((0xC0 + Local0))
            }
            Else
            {
                // Windows: Call original method
                If (CondRefOf (XQ64))
                {
                    XQ64 ()
                }
            }
        }
        
        // Sleep Button (Fn+F12 or Power)
        // Requires patch: _Q34 -> XQ34
        Method (_Q34, 0, NotSerialized)
        {
            If (_OSI ("Darwin"))
            {
                // macOS: Notify GramSMC of sleep event
                \_SB.GRAM.NEVT (0x5E)
            }
            Else
            {
                // Windows: Call original method
                If (CondRefOf (XQ34))
                {
                    XQ34 ()
                }
            }
        }
        
        // Function Key Event (Fn key combinations)
        // Requires patch: _Q36 -> XQ36
        Method (_Q36, 0, NotSerialized)
        {
            If (_OSI ("Darwin"))
            {
                // macOS: Get function key code and notify GramSMC
                Local0 = \_SB.PCI0.LPCB.H_EC.ECRX (0xE4)
                \_SB.GRAM.NEVT (Local0)
            }
            Else
            {
                // Windows: Call original method
                If (CondRefOf (XQ36))
                {
                    XQ36 ()
                }
            }
        }
    }
}