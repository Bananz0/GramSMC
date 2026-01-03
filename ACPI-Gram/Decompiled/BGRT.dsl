/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20251212 (32-bit version)
 * Copyright (c) 2000 - 2025 Intel Corporation
 * 
 * Disassembly of BGRT.aml
 *
 * ACPI Data Table [BGRT]
 *
 * Format: [HexOffset DecimalOffset ByteLength]  FieldName : FieldValue (in hex)
 */

[000h 0000 004h]                   Signature : "BGRT"    [Boot Graphics Resource Table]
[004h 0004 004h]                Table Length : 00000038
[008h 0008 001h]                    Revision : 01
[009h 0009 001h]                    Checksum : 25
[00Ah 0010 006h]                      Oem ID : "LGE   "
[010h 0016 008h]                Oem Table ID : "LGPC    "
[018h 0024 004h]                Oem Revision : 20170001
[01Ch 0028 004h]             Asl Compiler ID : "PTEC"
[020h 0032 004h]       Asl Compiler Revision : 00000002

[024h 0036 002h]                     Version : 0001
[026h 0038 001h]      Status (decoded below) : 00
                                   Displayed : 0
                          Orientation Offset : 0
[027h 0039 001h]                  Image Type : 00
[028h 0040 008h]               Image Address : 000000006618C000
[030h 0048 004h]               Image OffsetX : 000002CC
[034h 0052 004h]               Image OffsetY : 00000121

Raw Table Data: Length 56 (0x38)

    0000: 42 47 52 54 38 00 00 00 01 25 4C 47 45 20 20 20  // BGRT8....%LGE   
    0010: 4C 47 50 43 20 20 20 20 01 00 17 20 50 54 45 43  // LGPC    ... PTEC
    0020: 02 00 00 00 01 00 00 00 00 C0 18 66 00 00 00 00  // ...........f....
    0030: CC 02 00 00 21 01 00 00                          // ....!...
