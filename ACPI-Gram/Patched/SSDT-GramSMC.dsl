/*
 * SSDT-GramSMC.dsl
 * 
 * LG Gram SMC ACPI Support Table
 * Provides interface between macOS GramSMC kext and LG Gram EC
 *
 * Based on DSDT analysis of LG Gram laptop
 * EC Device: _SB.PCI0.LPCB.H_EC
 * 
 * EC Registers:
 *   LBRI (0xE0) - Keyboard Backlight Brightness
 *   SLED (0xEB) - Keyboard LED state
 *   FNKN (0xE4) - Function key number
 *   ALS  (0xDC) - Ambient Light Sensor (16-bit)
 *   TSR1 (0xC8) - Temperature sensor 1
 *   TSR2 (0xC9) - Temperature sensor 2
 *   FRPM (0xCB) - Fan RPM
 *
 * Copyright (c) 2024-2025
 */

DefinitionBlock ("", "SSDT", 2, "GRAM", "GramSMC", 0x00001000)
{
    // External references to existing DSDT objects
    External (_SB_.PCI0.LPCB, DeviceObj)
    External (_SB_.PCI0.LPCB.H_EC, DeviceObj)
    External (_SB_.PCI0.LPCB.H_EC.ECAV, IntObj)
    External (_SB_.PCI0.LPCB.H_EC.ECRD, MethodObj)    // 1 Arg - Read EC register
    External (_SB_.PCI0.LPCB.H_EC.ECWT, MethodObj)    // 2 Args - Write EC register
    External (_SB_.PCI0.LPCB.H_EC.ECRX, MethodObj)    // 1 Arg - Read EC byte by offset
    External (_SB_.PCI0.LPCB.H_EC.ECWX, MethodObj)    // 2 Args - Write EC byte by offset
    External (_SB_.PCI0.LPCB.H_EC.LBRI, FieldUnitObj) // Keyboard backlight register
    External (_SB_.PCI0.LPCB.H_EC.SLED, FieldUnitObj) // Keyboard LED state
    External (_SB_.PCI0.LPCB.H_EC.FNKN, FieldUnitObj) // Function key number
    External (_SB_.PCI0.LPCB.H_EC.TSR1, FieldUnitObj) // Temperature sensor 1
    External (_SB_.PCI0.LPCB.H_EC.TSR2, FieldUnitObj) // Temperature sensor 2
    External (_SB_.PCI0.LPCB.H_EC.FRPM, FieldUnitObj) // Fan RPM
    External (_SB_.PCI0.LPCB.H_EC.ALS, FieldUnitObj)  // Ambient light sensor
    External (ECON, IntObj)                            // EC ready flag
    
    // External references for renamed EC query methods
    // These will exist after applying binary patches (_Qxx -> XQxx)
    External (_SB_.PCI0.LPCB.H_EC.XQ50, MethodObj)
    External (_SB_.PCI0.LPCB.H_EC.XQ51, MethodObj)
    External (_SB_.PCI0.LPCB.H_EC.XQ64, MethodObj)
    External (_SB_.PCI0.LPCB.H_EC.XQ34, MethodObj)
    External (_SB_.PCI0.LPCB.H_EC.XQ36, MethodObj)

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
            Name (KBLS, Zero)  // Keyboard backlight state cache
            
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
            // ============================================
            
            // GKBL - Get Keyboard Backlight Level
            // Returns: Current backlight level (0-255)
            Method (GKBL, 0, Serialized)
            {
                If ((ECON == One))
                {
                    Return (\_SB.PCI0.LPCB.H_EC.ECRX (0xE0))
                }
                Return (Zero)
            }
            
            // SKBL - Set Keyboard Backlight Level
            // Arg0: Backlight level (0-255)
            // Returns: 0 on success
            Method (SKBL, 1, Serialized)
            {
                If ((ECON == One))
                {
                    // Clamp value to 0-255
                    Local0 = Arg0
                    If ((Local0 > 0xFF))
                    {
                        Local0 = 0xFF
                    }
                    
                    \_SB.PCI0.LPCB.H_EC.ECWX (0xE0, Local0)
                    KBLS = Local0
                    Return (Zero)
                }
                Return (One)  // Error
            }
            
            // GKBS - Get Keyboard Backlight State (on/off)
            // Returns: 1 if on, 0 if off
            Method (GKBS, 0, Serialized)
            {
                If ((ECON == One))
                {
                    Local0 = \_SB.PCI0.LPCB.H_EC.ECRX (0xE0)
                    If ((Local0 > Zero))
                    {
                        Return (One)
                    }
                }
                Return (Zero)
            }
            
            // ============================================
            // Ambient Light Sensor Methods
            // ============================================
            
            // ALSS - Get Ambient Light Sensor Value
            // Returns: Lux value (16-bit)
            Method (ALSS, 0, Serialized)
            {
                If ((ECON == One))
                {
                    // ALS is at offset 0xDC, 16-bit
                    Local0 = \_SB.PCI0.LPCB.H_EC.ECRX (0xDC)
                    Local1 = \_SB.PCI0.LPCB.H_EC.ECRX (0xDD)
                    Return ((Local1 << 8) | Local0)
                }
                Return (0x96)  // Default 150 lux
            }
            
            // ============================================
            // Temperature & Fan Methods
            // ============================================
            
            // GTMP - Get Temperature (CPU)
            // Returns: Temperature in Celsius
            Method (GTMP, 0, Serialized)
            {
                If ((ECON == One))
                {
                    Return (\_SB.PCI0.LPCB.H_EC.ECRX (0xC8))
                }
                Return (0x32)  // Default 50°C
            }
            
            // GFAN - Get Fan Speed
            // Returns: Fan RPM (approximate)
            Method (GFAN, 0, Serialized)
            {
                If ((ECON == One))
                {
                    Local0 = \_SB.PCI0.LPCB.H_EC.ECRX (0xCB)
                    // Convert to approximate RPM (register * 100)
                    Return ((Local0 * 0x64))
                }
                Return (Zero)
            }
            
            // ============================================
            // Function Key Methods
            // ============================================
            
            // GFNK - Get last Function Key pressed
            // Returns: Function key code
            Method (GFNK, 0, Serialized)
            {
                If ((ECON == One))
                {
                    Return (\_SB.PCI0.LPCB.H_EC.ECRX (0xE4))
                }
                Return (Zero)
            }
            
            // ============================================
            // Event Notification Method
            // Called by patched EC _Qxx methods
            // ============================================
            
            // NEVT - Notify Event
            // Arg0: Event code
            Method (NEVT, 1, Serialized)
            {
                EVTB = Arg0
                Notify (GRAM, 0x80)  // Status change notification
            }
            
            // GEVT - Get Event
            // Returns: Last event code and clears buffer
            Method (GEVT, 0, Serialized)
            {
                Local0 = EVTB
                EVTB = Zero
                Return (Local0)
            }
            
            // ============================================
            // Direct ACPI Messaging Support
            // ============================================
            
            // DMES - Direct Message Enabled Status
            // Returns: 1 if direct messaging is supported
            Method (DMES, 0, NotSerialized)
            {
                Return (One)
            }
        }
    }
    
    // ============================================
    // EC Query Method Patches
    // These redirect EC events to GramSMC device
    // 
    // Note: These require corresponding binary patches
    // to rename original methods (e.g., _Q50 -> XQ50)
    // ============================================
    
    Scope (\_SB.PCI0.LPCB.H_EC)
    {
        // Brightness Down Key (Fn+F2)
        // Original _Q50 handles brightness down
        // Requires patch: _Q50 -> XQ50
        Method (_Q50, 0, NotSerialized)
        {
            If (_OSI ("Darwin"))
            {
                // macOS: Notify GramSMC
                \_SB.GRAM.NEVT (0x10)
            }
            Else
            {
                // Windows: Call original method
                If (CondRefOf (XQ50))
                {
                    XQ50 ()
                }
            }
        }
        
        // Brightness Up Key (Fn+F3)
        // Original _Q51 handles brightness up
        // Requires patch: _Q51 -> XQ51
        Method (_Q51, 0, NotSerialized)
        {
            If (_OSI ("Darwin"))
            {
                // macOS: Notify GramSMC
                \_SB.GRAM.NEVT (0x11)
            }
            Else
            {
                // Windows: Call original method
                If (CondRefOf (XQ51))
                {
                    XQ51 ()
                }
            }
        }
        
        // Keyboard Backlight Toggle (Fn+F8 or similar)
        // Original _Q64 handles keyboard backlight
        // Requires patch: _Q64 -> XQ64
        Method (_Q64, 0, NotSerialized)
        {
            If (_OSI ("Darwin"))
            {
                // macOS: Notify GramSMC with keyboard backlight state
                Local0 = \_SB.PCI0.LPCB.H_EC.ECRX (0xEB)
                If ((Local0 & 0x01))
                {
                    \_SB.GRAM.NEVT (0xC4)  // Backlight increasing
                }
                Else
                {
                    \_SB.GRAM.NEVT (0xC5)  // Backlight decreasing
                }
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
        // Original _Q34 handles sleep
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
        
        // Function Key Event (Fn key combination)
        // Original _Q36 handles Fn key
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
