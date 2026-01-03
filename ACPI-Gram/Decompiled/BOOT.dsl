/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20251212 (32-bit version)
 * Copyright (c) 2000 - 2025 Intel Corporation
 * 
 * Disassembly of BOOT.aml
 *
 * ACPI Data Table [BOOT]
 *
 * Format: [HexOffset DecimalOffset ByteLength]  FieldName : FieldValue (in hex)
 */

[000h 0000 004h]                   Signature : "BOOT"    [Simple Boot Flag Table]
[004h 0004 004h]                Table Length : 00000028
[008h 0008 001h]                    Revision : 01
[009h 0009 001h]                    Checksum : 4E
[00Ah 0010 006h]                      Oem ID : "LGE   "
[010h 0016 008h]                Oem Table ID : "LGPC    "
[018h 0024 004h]                Oem Revision : 00000002
[01Ch 0028 004h]             Asl Compiler ID : "PTEC"
[020h 0032 004h]       Asl Compiler Revision : 00000002

[024h 0036 001h]         Boot Register Index : 47
[025h 0037 003h]                    Reserved : 000000

Raw Table Data: Length 40 (0x28)

    0000: 42 4F 4F 54 28 00 00 00 01 4E 4C 47 45 20 20 20  // BOOT(....NLGE   
    0010: 4C 47 50 43 20 20 20 20 02 00 00 00 50 54 45 43  // LGPC    ....PTEC
    0020: 02 00 00 00 47 00 00 00                          // ....G...
