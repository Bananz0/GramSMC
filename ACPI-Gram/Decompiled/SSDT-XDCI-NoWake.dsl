/*
 * SSDT-XDCI-NoWake.dsl
 * 
 * Disables XDCI (USB Type-C Device Controller Interface) as a wake source
 * 
 * PROBLEM:
 * The XDCI controller causes spurious wakes from sleep in macOS, visible in
 * pmset -g log as "Wake from Normal Sleep [CDNVA] : due to RTC XDCI/..."
 * This results in the system waking every ~30 minutes even when sleeping.
 *
 * SOLUTION:
 * Override the _PRW method to return zero (0x00), preventing XDCI from
 * waking the system while still allowing it to function normally.
 *
 * TECHNICAL DETAILS:
 * - Original _PRW returns GPRW(0x6D, 0x04) at DSDT line 6619
 * - XDCI is Intel's USB Device Mode controller (allows PC to act as USB device)
 * - Rarely needed in macOS/hackintosh unless using device mode features
 * - Disabling wake does NOT disable XDCI functionality
 *
 * REQUIREMENTS:
 * - No rename patches needed - direct _PRW override works via SSDT
 * - Place compiled .aml in EFI/OC/ACPI/
 * - Add to config.plist ACPI->Add section
 *
 * VERIFICATION:
 * After applying, check pmset -g log - XDCI should no longer appear in wake reasons
 *
 * Copyright (c) 2026 Glen Muthoka Mutinda
 * Based on DSDT analysis for LG Gram 13z990-R
 */

DefinitionBlock ("", "SSDT", 2, "GRAM", "XDCIFix", 0x00001000)
{
    External (_SB_.PCI0.XDCI, DeviceObj)
    
    // Override XDCI's Power Resources for Wake method
    Scope (_SB.PCI0.XDCI)
    {
        // _PRW: Power Resources for Wake
        // Return 0x00 (zero) to disable wake capability
        // This prevents XDCI from waking the system from sleep
        Method (_PRW, 0, NotSerialized)
        {
            // Original returns GPRW(0x6D, 0x04) which enables wake
            // Return zero package to disable wake completely
            Return (Package (0x02)
            {
                Zero,  // GPE number (0 = no wake)
                Zero   // Wake from S-state (0 = no wake)
            })
        }
    }
}
