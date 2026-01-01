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
    
    // External references for LG WMI methods (LGEX0820 device)
    // These are the native ACPI methods used by LG Control Center
    External (_SB_.WMAB, MethodObj)    // 3 Args: method, operation (1=GET, 2=SET), value
    External (_SB_.WMBB, MethodObj)    // 3 Args: ignored, instance, buffer[32]
    
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
            
            // ============================================
            // LG Control Center Feature Methods
            // Method IDs from Linux lg-laptop.c kernel driver
            // ============================================
            
            // WMI Method ID Constants
            Name (WFMD, 0x33)    // WM_FAN_MODE
            Name (WBLT, 0x61)    // WM_BATT_LIMIT (WMAB)
            Name (WBBB, 0x10C)   // WMBB_BATT_LIMIT (for 2019+ models)
            Name (WUSB, 0x10B)   // WMBB_USB_CHARGE
            Name (WRDM, 0xBF)    // WM_READER_MODE
            Name (WFNL, 0x407)   // WM_FN_LOCK
            Name (WKLT, 0x400)   // WM_KEY_LIGHT
            
            // Additional method IDs (reverse engineered from LG Control Center)
            Name (WSMN, 0x114)   // WM_SMART_ON (Instant Boot)
            Name (WBST, 0xBD)    // WM_BOOST_MODE (Performance boost)
            Name (WECO, 0xEF)    // WM_ECO_MODE (Power saving)
            Name (WTPC, 0x40A)   // WM_USB_TYPEC (USB-C mode)
            Name (WTPB, 0xED)    // WM_USB_TYPEC_BATTERY (USB-C battery level)
            Name (WWCM, 0x80)    // WM_WEBCAM (Webcam toggle)
            
            // Operation constants
            Name (WGET, One)     // Get operation
            Name (WSET, 0x02)    // Set operation
            
            // ============================================
            // Fan Mode Control (0=Optimal, 1=Silent, 2=Performance)
            // ============================================
            
            // GFMD - Get Fan Mode
            // Returns: 0=Optimal, 1=Silent, 2=Performance
            Method (GFMD, 0, Serialized)
            {
                If (CondRefOf (\_SB.WMAB))
                {
                    Local0 = \_SB.WMAB (WFMD, WGET, Zero)
                    If ((ObjectType (Local0) == 0x01))  // Integer
                    {
                        Return (Local0 & 0x03)
                    }
                    ElseIf ((ObjectType (Local0) == 0x03))  // Buffer
                    {
                        Return (DerefOf (Local0 [Zero]) & 0x03)
                    }
                }
                Return (Zero)  // Default: Optimal
            }
            
            // SFMD - Set Fan Mode
            // Arg0: 0=Optimal, 1=Silent, 2=Performance
            // Returns: 0 on success
            Method (SFMD, 1, Serialized)
            {
                If ((Arg0 <= 0x02))
                {
                    If (CondRefOf (\_SB.WMAB))
                    {
                        // Fan mode needs both lower and upper nibble set
                        Local0 = (Arg0 | (Arg0 << 4))
                        \_SB.WMAB (WFMD, WSET, Local0)
                        Return (Zero)
                    }
                }
                Return (One)  // Error
            }
            
            // ============================================
            // Battery Care Limit (80% or 100%)
            // ============================================
            
            // GBCL - Get Battery Care Limit
            // Returns: 80 or 100
            Method (GBCL, 0, Serialized)
            {
                // Try WMBB first (for 2019+ models)
                If (CondRefOf (\_SB.WMBB))
                {
                    Local0 = Buffer (0x20) {}
                    Local0 [Zero] = (WBBB & 0xFF)
                    Local0 [One] = ((WBBB >> 8) & 0xFF)
                    Local1 = \_SB.WMBB (Zero, One, Local0)
                    If ((ObjectType (Local1) == 0x03))  // Buffer
                    {
                        Local2 = DerefOf (Local1 [0x10])
                        If ((Local2 == 0x50) || (Local2 == 0x64))  // 80 or 100
                        {
                            Return (Local2)
                        }
                    }
                }
                // Fallback to WMAB
                If (CondRefOf (\_SB.WMAB))
                {
                    Local0 = \_SB.WMAB (WBLT, WGET, Zero)
                    If ((ObjectType (Local0) == 0x01))
                    {
                        If ((Local0 == 0x50) || (Local0 == 0x64))
                        {
                            Return (Local0)
                        }
                    }
                }
                Return (0x64)  // Default: 100%
            }
            
            // SBCL - Set Battery Care Limit
            // Arg0: 80 or 100
            // Returns: 0 on success
            Method (SBCL, 1, Serialized)
            {
                If ((Arg0 == 0x50) || (Arg0 == 0x64))  // 80 or 100
                {
                    // Try WMBB first (for 2019+ models)
                    If (CondRefOf (\_SB.WMBB))
                    {
                        Local0 = Buffer (0x20) {}
                        Local0 [Zero] = (WBBB & 0xFF)
                        Local0 [One] = ((WBBB >> 8) & 0xFF)
                        Local0 [0x04] = Arg0
                        \_SB.WMBB (Zero, One, Local0)
                        Return (Zero)
                    }
                    // Fallback to WMAB
                    If (CondRefOf (\_SB.WMAB))
                    {
                        \_SB.WMAB (WBLT, WSET, Arg0)
                        Return (Zero)
                    }
                }
                Return (One)  // Error
            }
            
            // ============================================
            // USB Charging (charge devices when laptop off)
            // ============================================
            
            // GUSC - Get USB Charge State
            // Returns: 0=off, 1=on
            Method (GUSC, 0, Serialized)
            {
                If (CondRefOf (\_SB.WMBB))
                {
                    Local0 = Buffer (0x20) {}
                    Local0 [Zero] = (WUSB & 0xFF)
                    Local0 [One] = ((WUSB >> 8) & 0xFF)
                    Local1 = \_SB.WMBB (Zero, One, Local0)
                    If ((ObjectType (Local1) == 0x03))  // Buffer
                    {
                        Return (DerefOf (Local1 [0x10]) != Zero)
                    }
                }
                Return (Zero)  // Default: off
            }
            
            // SUSC - Set USB Charge State
            // Arg0: 0=off, 1=on
            // Returns: 0 on success
            Method (SUSC, 1, Serialized)
            {
                If (CondRefOf (\_SB.WMBB))
                {
                    Local0 = Buffer (0x20) {}
                    Local0 [Zero] = (WUSB & 0xFF)
                    Local0 [One] = ((WUSB >> 8) & 0xFF)
                    Local0 [0x04] = (Arg0 != Zero)
                    \_SB.WMBB (Zero, One, Local0)
                    Return (Zero)
                }
                Return (One)  // Error
            }
            
            // ============================================
            // Reader Mode (reduce blue light)
            // ============================================
            
            // GRDM - Get Reader Mode State
            // Returns: 0=off, 1=on
            Method (GRDM, 0, Serialized)
            {
                If (CondRefOf (\_SB.WMAB))
                {
                    Local0 = \_SB.WMAB (WRDM, WGET, Zero)
                    If ((ObjectType (Local0) == 0x01))
                    {
                        Return (Local0 != Zero)
                    }
                }
                Return (Zero)  // Default: off
            }
            
            // SRDM - Set Reader Mode State
            // Arg0: 0=off, 1=on
            // Returns: 0 on success
            Method (SRDM, 1, Serialized)
            {
                If (CondRefOf (\_SB.WMAB))
                {
                    \_SB.WMAB (WRDM, WSET, (Arg0 != Zero))
                    Return (Zero)
                }
                Return (One)  // Error
            }
            
            // ============================================
            // Fn Lock (swap function key behavior)
            // ============================================
            
            // GFNL - Get Fn Lock State
            // Returns: 0=off (Fn needed for F1-F12), 1=on (F1-F12 direct)
            Method (GFNL, 0, Serialized)
            {
                If (CondRefOf (\_SB.WMAB))
                {
                    Local0 = \_SB.WMAB (WFNL, WGET, Zero)
                    If ((ObjectType (Local0) == 0x03))  // Buffer
                    {
                        Return (DerefOf (Local0 [Zero]) != Zero)
                    }
                }
                Return (Zero)  // Default: off
            }
            
            // SFNL - Set Fn Lock State
            // Arg0: 0=off, 1=on
            // Returns: 0 on success
            Method (SFNL, 1, Serialized)
            {
                If (CondRefOf (\_SB.WMAB))
                {
                    \_SB.WMAB (WFNL, WSET, (Arg0 != Zero))
                    Return (Zero)
                }
                Return (One)  // Error
            }
            
            // ============================================
            // Feature Support Detection
            // ============================================
            
            // ============================================
            // SmartOn (Instant Boot) - Fast wake from sleep
            // ============================================
            
            // GSMN - Get SmartOn State
            // Returns: 0=off, 1=on
            Method (GSMN, 0, Serialized)
            {
                If (CondRefOf (\_SB.WMAB))
                {
                    Local0 = \_SB.WMAB (WSMN, WGET, Zero)
                    If ((ObjectType (Local0) == 0x01))
                    {
                        Return (Local0 != Zero)
                    }
                }
                Return (Zero)
            }
            
            // SSMN - Set SmartOn State
            // Arg0: 0=off, 1=on
            Method (SSMN, 1, Serialized)
            {
                If (CondRefOf (\_SB.WMAB))
                {
                    \_SB.WMAB (WSMN, WSET, (Arg0 != Zero))
                    Return (Zero)
                }
                Return (One)
            }
            
            // ============================================
            // Boost Mode (Performance boost)
            // ============================================
            
            // GBST - Get Boost Mode State
            // Returns: 0=off, 1=on
            Method (GBST, 0, Serialized)
            {
                If (CondRefOf (\_SB.WMAB))
                {
                    Local0 = \_SB.WMAB (WBST, WGET, Zero)
                    If ((ObjectType (Local0) == 0x01))
                    {
                        Return (Local0 != Zero)
                    }
                }
                Return (Zero)
            }
            
            // SBST - Set Boost Mode State  
            // Arg0: 0=off, 1=on
            Method (SBST, 1, Serialized)
            {
                If (CondRefOf (\_SB.WMAB))
                {
                    \_SB.WMAB (WBST, WSET, (Arg0 != Zero))
                    Return (Zero)
                }
                Return (One)
            }
            
            // ============================================
            // Eco Mode (Power saving)
            // ============================================
            
            // GECO - Get Eco Mode State
            // Returns: 0=off, 1=on
            Method (GECO, 0, Serialized)
            {
                If (CondRefOf (\_SB.WMAB))
                {
                    Local0 = \_SB.WMAB (WECO, WGET, Zero)
                    If ((ObjectType (Local0) == 0x01))
                    {
                        Return (Local0 != Zero)
                    }
                }
                Return (Zero)
            }
            
            // SECO - Set Eco Mode State
            // Arg0: 0=off, 1=on
            Method (SECO, 1, Serialized)
            {
                If (CondRefOf (\_SB.WMAB))
                {
                    \_SB.WMAB (WECO, WSET, (Arg0 != Zero))
                    Return (Zero)
                }
                Return (One)
            }
            
            // ============================================
            // USB Type-C Mode
            // ============================================
            
            // GTPC - Get USB Type-C Mode
            // Returns: mode value
            Method (GTPC, 0, Serialized)
            {
                If (CondRefOf (\_SB.WMAB))
                {
                    Local0 = \_SB.WMAB (WTPC, WGET, Zero)
                    If ((ObjectType (Local0) == 0x01))
                    {
                        Return (Local0)
                    }
                }
                Return (Zero)
            }
            
            // STPC - Set USB Type-C Mode
            // Arg0: mode value
            Method (STPC, 1, Serialized)
            {
                If (CondRefOf (\_SB.WMAB))
                {
                    \_SB.WMAB (WTPC, WSET, Arg0)
                    Return (Zero)
                }
                Return (One)
            }
            
            // ============================================
            // Webcam Toggle
            // ============================================
            
            // GWCM - Get Webcam State
            // Returns: 0=disabled, 1=enabled
            Method (GWCM, 0, Serialized)
            {
                If (CondRefOf (\_SB.WMAB))
                {
                    Local0 = \_SB.WMAB (WWCM, WGET, Zero)
                    If ((ObjectType (Local0) == 0x01))
                    {
                        Return (Local0 != Zero)
                    }
                }
                Return (One)  // Default: enabled
            }
            
            // SWCM - Set Webcam State
            // Arg0: 0=disabled, 1=enabled
            Method (SWCM, 1, Serialized)
            {
                If (CondRefOf (\_SB.WMAB))
                {
                    \_SB.WMAB (WWCM, WSET, (Arg0 != Zero))
                    Return (Zero)
                }
                Return (One)
            }
            
            // ============================================
            // Feature Support Detection
            // ============================================
            
            // GCAP - Get Capabilities
            // Returns bitmask of supported features:
            //   Bit 0: Fan Mode
            //   Bit 1: Battery Care Limit
            //   Bit 2: USB Charging
            //   Bit 3: Reader Mode
            //   Bit 4: Fn Lock
            //   Bit 5: SmartOn (Instant Boot)
            //   Bit 6: Boost Mode
            //   Bit 7: Eco Mode
            //   Bit 8: USB Type-C
            //   Bit 9: Webcam
            Method (GCAP, 0, Serialized)
            {
                Local0 = Zero
                If (CondRefOf (\_SB.WMAB))
                {
                    Local0 |= 0x01   // Fan Mode
                    Local0 |= 0x02   // Battery Care
                    Local0 |= 0x08   // Reader Mode
                    Local0 |= 0x10   // Fn Lock
                    Local0 |= 0x20   // SmartOn
                    Local0 |= 0x40   // Boost Mode
                    Local0 |= 0x80   // Eco Mode
                    Local0 |= 0x100  // USB Type-C
                    Local0 |= 0x200  // Webcam
                }
                If (CondRefOf (\_SB.WMBB))
                {
                    Local0 |= 0x02   // Battery Care (WMBB variant)
                    Local0 |= 0x04   // USB Charging
                }
                Return (Local0)
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
