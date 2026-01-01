/*
 * SSDT-LGSMC.dsl
 * 
 * LG Gram SMC - ACPI Support Table
 * Creates a matchable device for the LGSMC kext and provides
 * methods to read EC notification codes and control keyboard backlight.
 *
 * EC Register Map (from DSDT):
 *   Offset 0x72:
 *     KBBR (bits 0-3) - Keyboard Backlight Brightness (0-15)
 *     WSLP (bit 4)    - Wireless Sleep
 *     KBBM (bits 5-6) - Keyboard Backlight Mode
 *     KBBS (bit 7)    - Keyboard Backlight State
 *
 * Copyright © 2024. Licensed under MIT.
 */

DefinitionBlock ("", "SSDT", 2, "LGSMC", "LGhotkey", 0x00001000)
{
    // External references to EC and its fields
    External (_SB_.PCI0.LPCB.H_EC, DeviceObj)
    External (_SB_.PCI0.LPCB.H_EC.MAP1.CA82, IntObj)
    External (_SB_.PCI0.LPCB.H_EC.KBBR, FieldUnitObj)   // Keyboard backlight brightness (4 bits)
    External (_SB_.PCI0.LPCB.H_EC.KBBM, FieldUnitObj)   // Keyboard backlight mode (2 bits)
    External (_SB_.PCI0.LPCB.H_EC.KBBS, FieldUnitObj)   // Keyboard backlight state (1 bit)
    External (_SB_.PCI0.LPCB.H_EC.ECRD, MethodObj)      // EC read method (1 arg)
    External (_SB_.PCI0.LPCB.H_EC.ECWT, MethodObj)      // EC write method (2 args)
    External (_SB_.PCI0.LPCB.H_EC.ECAV, IntObj)         // EC available flag
    External (_SB_.PCI0.LPCB.H_EC.ECMT, MutexObj)       // EC mutex
    
    Scope (_SB)
    {
        Device (LGSM)
        {
            Name (_HID, "LGE0001")  // Hardware ID for kext matching
            Name (_CID, "LGE0001")  // Compatible ID
            Name (_UID, One)
            
            // Device status - only active on macOS (Darwin)
            Method (_STA, 0, NotSerialized)
            {
                If (_OSI ("Darwin"))
                {
                    Return (0x0F)  // Present, enabled, functioning
                }
                Return (Zero)  // Hidden on other OSes
            }
            
            // Get current notification code from MAP1.CA82
            // Called by kext to read what key was pressed
            Method (GTNC, 0, NotSerialized)
            {
                Return (\_SB.PCI0.LPCB.H_EC.MAP1.CA82)
            }
            
            // Get keyboard backlight level (0-15, but typically 0-4 used)
            // Returns: Current brightness level
            Method (GKBL, 0, Serialized)
            {
                // Check if EC is available
                If (CondRefOf (\_SB.PCI0.LPCB.H_EC.ECAV))
                {
                    If ((\_SB.PCI0.LPCB.H_EC.ECAV == Zero))
                    {
                        Return (Zero)
                    }
                }
                
                // Try to read KBBR directly
                If (CondRefOf (\_SB.PCI0.LPCB.H_EC.KBBR))
                {
                    // Use EC mutex for safe access
                    If (CondRefOf (\_SB.PCI0.LPCB.H_EC.ECMT))
                    {
                        Acquire (\_SB.PCI0.LPCB.H_EC.ECMT, 0xFFFF)
                        Local0 = \_SB.PCI0.LPCB.H_EC.KBBR
                        Release (\_SB.PCI0.LPCB.H_EC.ECMT)
                        Return (Local0)
                    }
                    Else
                    {
                        Return (\_SB.PCI0.LPCB.H_EC.KBBR)
                    }
                }
                
                // Fallback: try ECRD method
                If (CondRefOf (\_SB.PCI0.LPCB.H_EC.ECRD))
                {
                    Return (\_SB.PCI0.LPCB.H_EC.ECRD (RefOf (\_SB.PCI0.LPCB.H_EC.KBBR)))
                }
                
                Return (Zero)
            }
            
            // Set keyboard backlight level
            // Arg0: brightness level (0-15, typically 0-4)
            Method (SKBL, 1, Serialized)
            {
                // Clamp to valid range (4 bits = 0-15)
                Local0 = (Arg0 & 0x0F)
                
                // Check if EC is available
                If (CondRefOf (\_SB.PCI0.LPCB.H_EC.ECAV))
                {
                    If ((\_SB.PCI0.LPCB.H_EC.ECAV == Zero))
                    {
                        Return (Zero)
                    }
                }
                
                // Try to write KBBR directly
                If (CondRefOf (\_SB.PCI0.LPCB.H_EC.KBBR))
                {
                    // Use EC mutex for safe access
                    If (CondRefOf (\_SB.PCI0.LPCB.H_EC.ECMT))
                    {
                        Acquire (\_SB.PCI0.LPCB.H_EC.ECMT, 0xFFFF)
                        \_SB.PCI0.LPCB.H_EC.KBBR = Local0
                        Release (\_SB.PCI0.LPCB.H_EC.ECMT)
                        Return (One)
                    }
                    Else
                    {
                        \_SB.PCI0.LPCB.H_EC.KBBR = Local0
                        Return (One)
                    }
                }
                
                // Fallback: try ECWT method
                If (CondRefOf (\_SB.PCI0.LPCB.H_EC.ECWT))
                {
                    \_SB.PCI0.LPCB.H_EC.ECWT (Local0, RefOf (\_SB.PCI0.LPCB.H_EC.KBBR))
                    Return (One)
                }
                
                Return (Zero)
            }
            
            // Get keyboard backlight state (on/off)
            Method (GKBS, 0, Serialized)
            {
                If (CondRefOf (\_SB.PCI0.LPCB.H_EC.KBBS))
                {
                    If (CondRefOf (\_SB.PCI0.LPCB.H_EC.ECMT))
                    {
                        Acquire (\_SB.PCI0.LPCB.H_EC.ECMT, 0xFFFF)
                        Local0 = \_SB.PCI0.LPCB.H_EC.KBBS
                        Release (\_SB.PCI0.LPCB.H_EC.ECMT)
                        Return (Local0)
                    }
                    Return (\_SB.PCI0.LPCB.H_EC.KBBS)
                }
                Return (Zero)
            }
            
            // Set keyboard backlight state (on/off)
            // Arg0: 0 = off, 1 = on
            Method (SKBS, 1, Serialized)
            {
                Local0 = (Arg0 & One)
                
                If (CondRefOf (\_SB.PCI0.LPCB.H_EC.KBBS))
                {
                    If (CondRefOf (\_SB.PCI0.LPCB.H_EC.ECMT))
                    {
                        Acquire (\_SB.PCI0.LPCB.H_EC.ECMT, 0xFFFF)
                        \_SB.PCI0.LPCB.H_EC.KBBS = Local0
                        Release (\_SB.PCI0.LPCB.H_EC.ECMT)
                        Return (One)
                    }
                    \_SB.PCI0.LPCB.H_EC.KBBS = Local0
                    Return (One)
                }
                Return (Zero)
            }
            
            // Method called by EC queries to notify the kext
            // Arg0: notification type (typically 0x82)
            Method (NTFY, 1, NotSerialized)
            {
                Notify (LGSM, Arg0)
            }
        }
    }
}
