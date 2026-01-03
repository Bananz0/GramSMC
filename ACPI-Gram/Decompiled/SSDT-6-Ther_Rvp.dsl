/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20251212 (32-bit version)
 * Copyright (c) 2000 - 2025 Intel Corporation
 * 
 * Disassembling to symbolic ASL+ operators
 *
 * Disassembly of SSDT-6-Ther_Rvp.aml
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x00000112 (274)
 *     Revision         0x02
 *     Checksum         0x71
 *     OEM ID           "LGE   "
 *     OEM Table ID     "Ther_Rvp"
 *     OEM Revision     0x00001000 (4096)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20160527 (538314023)
 */
DefinitionBlock ("", "SSDT", 2, "LGE   ", "Ther_Rvp", 0x00001000)
{
    External (_SB_.PCI0.LPCB.H_EC.MAP1, DeviceObj)
    External (_SB_.PCI0.LPCB.H_EC.MAP1.CA82, IntObj)
    External (_SB_.PCI0.LPCB.H_EC.MAP1.CAUS, IntObj)
    External (CRTT, IntObj)
    External (N00U, IntObj)
    External (N038, FieldUnitObj)
    External (N04C, MethodObj)    // 0 Arguments

    Scope (\_TZ)
    {
        ThermalZone (TZ00)
        {
            Name (PTMP, 0x0BB8)
            Method (_CRT, 0, Serialized)  // _CRT: Critical Temperature
            {
                Return (C2K (\CRTT))
            }

            Method (_HOT, 0, Serialized)  // _HOT: Hot Temperature
            {
                Local0 = (\CRTT - 0x02)
                Return (C2K ((\CRTT - 0x02)))
            }

            Method (_TMP, 0, Serialized)  // _TMP: Temperature
            {
                If (CondRefOf (\N04C))
                {
                    Return (\N04C ())
                }

                Return (PTMP) /* \_TZ_.TZ00.PTMP */
            }
        }

        Method (C2K, 1, NotSerialized)
        {
            Local0 = ((Arg0 * 0x0A) + 0x0AAC)
            Return (Local0)
        }
    }
}

