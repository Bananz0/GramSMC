/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20251212 (32-bit version)
 * Copyright (c) 2000 - 2025 Intel Corporation
 * 
 * Disassembly of TPM2.aml
 *
 * ACPI Data Table [TPM2]
 *
 * Format: [HexOffset DecimalOffset ByteLength]  FieldName : FieldValue (in hex)
 */

[000h 0000 004h]                   Signature : "TPM2"    [Trusted Platform Module hardware interface Table]
[004h 0004 004h]                Table Length : 00000034
[008h 0008 001h]                    Revision : 03
[009h 0009 001h]                    Checksum : 7F
[00Ah 0010 006h]                      Oem ID : "LGE   "
[010h 0016 008h]                Oem Table ID : "LGPC    "
[018h 0024 004h]                Oem Revision : 00000002
[01Ch 0028 004h]             Asl Compiler ID : "PTEC"
[020h 0032 004h]       Asl Compiler Revision : 00000002

[024h 0036 004h]                    Reserved : 00000000
[028h 0040 008h]             Control Address : 00000000FED40040
[030h 0048 004h]                Start Method : 00000007

Raw Table Data: Length 52 (0x34)

    0000: 54 50 4D 32 34 00 00 00 03 7F 4C 47 45 20 20 20  // TPM24.....LGE   
    0010: 4C 47 50 43 20 20 20 20 02 00 00 00 50 54 45 43  // LGPC    ....PTEC
    0020: 02 00 00 00 00 00 00 00 40 00 D4 FE 00 00 00 00  // ........@.......
    0030: 07 00 00 00                                      // ....
