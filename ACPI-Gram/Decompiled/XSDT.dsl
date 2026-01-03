/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20251212 (32-bit version)
 * Copyright (c) 2000 - 2025 Intel Corporation
 * 
 * Disassembly of XSDT.aml
 *
 * ACPI Data Table [XSDT]
 *
 * Format: [HexOffset DecimalOffset ByteLength]  FieldName : FieldValue (in hex)
 */

[000h 0000 004h]                   Signature : "XSDT"    [Extended System Description Table]
[004h 0004 004h]                Table Length : 0000011C
[008h 0008 001h]                    Revision : 01
[009h 0009 001h]                    Checksum : 7D
[00Ah 0010 006h]                      Oem ID : "LGE   "
[010h 0016 008h]                Oem Table ID : "LGPC    "
[018h 0024 004h]                Oem Revision : 20170001
[01Ch 0028 004h]             Asl Compiler ID : "PTEC"
[020h 0032 004h]       Asl Compiler Revision : 00000002

[024h 0036 008h]       ACPI Table Address   0 : 000000006D745000
[02Ch 0044 008h]       ACPI Table Address   1 : 000000006D7E9000
[034h 0052 008h]       ACPI Table Address   2 : 000000006D7E8000
[03Ch 0060 008h]       ACPI Table Address   3 : 000000006D7E3000
[044h 0068 008h]       ACPI Table Address   4 : 000000006D7A5000
[04Ch 0076 008h]       ACPI Table Address   5 : 000000006D7A4000
[054h 0084 008h]       ACPI Table Address   6 : 000000006D747000
[05Ch 0092 008h]       ACPI Table Address   7 : 000000006D746000
[064h 0100 008h]       ACPI Table Address   8 : 000000006D744000
[06Ch 0108 008h]       ACPI Table Address   9 : 000000006D743000
[074h 0116 008h]       ACPI Table Address  10 : 000000006D742000
[07Ch 0124 008h]       ACPI Table Address  11 : 000000006D73F000
[084h 0132 008h]       ACPI Table Address  12 : 000000006D6FC000
[08Ch 0140 008h]       ACPI Table Address  13 : 000000006D6F9000
[094h 0148 008h]       ACPI Table Address  14 : 000000006D6F8000
[09Ch 0156 008h]       ACPI Table Address  15 : 000000006D6F7000
[0A4h 0164 008h]       ACPI Table Address  16 : 000000006D6F6000
[0ACh 0172 008h]       ACPI Table Address  17 : 000000006D6F5000
[0B4h 0180 008h]       ACPI Table Address  18 : 000000006F8FE000
[0BCh 0188 008h]       ACPI Table Address  19 : 000000006D6F2000
[0C4h 0196 008h]       ACPI Table Address  20 : 000000006D6F1000
[0CCh 0204 008h]       ACPI Table Address  21 : 000000006D6F0000
[0D4h 0212 008h]       ACPI Table Address  22 : 000000006D6EE000
[0DCh 0220 008h]       ACPI Table Address  23 : 000000006D6ED000
[0E4h 0228 008h]       ACPI Table Address  24 : 000000006D6EC000
[0ECh 0236 008h]       ACPI Table Address  25 : 000000006D6EB000
[0F4h 0244 008h]       ACPI Table Address  26 : 000000006D6E9000
[0FCh 0252 008h]       ACPI Table Address  27 : 000000006B8E7000
[104h 0260 008h]       ACPI Table Address  28 : 000000006B8E0000
[10Ch 0268 008h]       ACPI Table Address  29 : 000000006B8DF000
[114h 0276 008h]       ACPI Table Address  30 : 000000006F8FC000

Raw Table Data: Length 284 (0x11C)

    0000: 58 53 44 54 1C 01 00 00 01 7D 4C 47 45 20 20 20  // XSDT.....}LGE   
    0010: 4C 47 50 43 20 20 20 20 01 00 17 20 50 54 45 43  // LGPC    ... PTEC
    0020: 02 00 00 00 00 50 74 6D 00 00 00 00 00 90 7E 6D  // .....Ptm......~m
    0030: 00 00 00 00 00 80 7E 6D 00 00 00 00 00 30 7E 6D  // ......~m.....0~m
    0040: 00 00 00 00 00 50 7A 6D 00 00 00 00 00 40 7A 6D  // .....Pzm.....@zm
    0050: 00 00 00 00 00 70 74 6D 00 00 00 00 00 60 74 6D  // .....ptm.....`tm
    0060: 00 00 00 00 00 40 74 6D 00 00 00 00 00 30 74 6D  // .....@tm.....0tm
    0070: 00 00 00 00 00 20 74 6D 00 00 00 00 00 F0 73 6D  // ..... tm......sm
    0080: 00 00 00 00 00 C0 6F 6D 00 00 00 00 00 90 6F 6D  // ......om......om
    0090: 00 00 00 00 00 80 6F 6D 00 00 00 00 00 70 6F 6D  // ......om.....pom
    00A0: 00 00 00 00 00 60 6F 6D 00 00 00 00 00 50 6F 6D  // .....`om.....Pom
    00B0: 00 00 00 00 00 E0 8F 6F 00 00 00 00 00 20 6F 6D  // .......o..... om
    00C0: 00 00 00 00 00 10 6F 6D 00 00 00 00 00 00 6F 6D  // ......om......om
    00D0: 00 00 00 00 00 E0 6E 6D 00 00 00 00 00 D0 6E 6D  // ......nm......nm
    00E0: 00 00 00 00 00 C0 6E 6D 00 00 00 00 00 B0 6E 6D  // ......nm......nm
    00F0: 00 00 00 00 00 90 6E 6D 00 00 00 00 00 70 8E 6B  // ......nm.....p.k
    0100: 00 00 00 00 00 00 8E 6B 00 00 00 00 00 F0 8D 6B  // .......k.......k
    0110: 00 00 00 00 00 C0 8F 6F 00 00 00 00              // .......o....
