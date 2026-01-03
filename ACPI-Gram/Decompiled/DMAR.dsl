/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20251212 (32-bit version)
 * Copyright (c) 2000 - 2025 Intel Corporation
 * 
 * Disassembly of DMAR.aml
 *
 * ACPI Data Table [DMAR]
 *
 * Format: [HexOffset DecimalOffset ByteLength]  FieldName : FieldValue (in hex)
 */

[000h 0000 004h]                   Signature : "DMAR"    [DMA Remapping Table]
[004h 0004 004h]                Table Length : 000000A8
[008h 0008 001h]                    Revision : 01
[009h 0009 001h]                    Checksum : 2D
[00Ah 0010 006h]                      Oem ID : "LGE   "
[010h 0016 008h]                Oem Table ID : "LGPC    "
[018h 0024 004h]                Oem Revision : 00000002
[01Ch 0028 004h]             Asl Compiler ID : "PTEC"
[020h 0032 004h]       Asl Compiler Revision : 00000002

[024h 0036 001h]          Host Address Width : 26
[025h 0037 001h]                       Flags : 01
[026h 0038 00Ah]                    Reserved : 00 00 00 00 00 00 00 00 00 00

[030h 0048 002h]               Subtable Type : 0000 [Hardware Unit Definition]
[032h 0050 002h]                      Length : 0018

[034h 0052 001h]                       Flags : 00
[035h 0053 001h]        Size (decoded below) : 00
                          Size (pages, log2) : 0
[036h 0054 002h]          PCI Segment Number : 0000
[038h 0056 008h]       Register Base Address : 00000000FED90000

[040h 0064 001h]           Device Scope Type : 01 [PCI Endpoint Device]
[041h 0065 001h]                Entry Length : 08
[042h 0066 001h]                       Flags : 00
[043h 0067 001h]                    Reserved : 00
[044h 0068 001h]              Enumeration ID : 00
[045h 0069 001h]              PCI Bus Number : 00

[046h 0070 002h]                    PCI Path : 02,00


[048h 0072 002h]               Subtable Type : 0000 [Hardware Unit Definition]
[04Ah 0074 002h]                      Length : 0020

[04Ch 0076 001h]                       Flags : 01
[04Dh 0077 001h]        Size (decoded below) : 00
                          Size (pages, log2) : 0
[04Eh 0078 002h]          PCI Segment Number : 0000
[050h 0080 008h]       Register Base Address : 00000000FED91000

[058h 0088 001h]           Device Scope Type : 03 [IOAPIC Device]
[059h 0089 001h]                Entry Length : 08
[05Ah 0090 001h]                       Flags : 00
[05Bh 0091 001h]                    Reserved : 00
[05Ch 0092 001h]              Enumeration ID : 02
[05Dh 0093 001h]              PCI Bus Number : 00

[05Eh 0094 002h]                    PCI Path : 1E,07


[060h 0096 001h]           Device Scope Type : 04 [Message-capable HPET Device]
[061h 0097 001h]                Entry Length : 08
[062h 0098 001h]                       Flags : 00
[063h 0099 001h]                    Reserved : 00
[064h 0100 001h]              Enumeration ID : 00
[065h 0101 001h]              PCI Bus Number : 00

[066h 0102 002h]                    PCI Path : 1E,06


[068h 0104 002h]               Subtable Type : 0001 [Reserved Memory Region]
[06Ah 0106 002h]                      Length : 0020

[06Ch 0108 002h]                    Reserved : 0000
[06Eh 0110 002h]          PCI Segment Number : 0000
[070h 0112 008h]                Base Address : 000000006F8A5000
[078h 0120 008h]         End Address (limit) : 000000006F8C4FFF

[080h 0128 001h]           Device Scope Type : 01 [PCI Endpoint Device]
[081h 0129 001h]                Entry Length : 08
[082h 0130 001h]                       Flags : 00
[083h 0131 001h]                    Reserved : 00
[084h 0132 001h]              Enumeration ID : 00
[085h 0133 001h]              PCI Bus Number : 00

[086h 0134 002h]                    PCI Path : 14,00


[088h 0136 002h]               Subtable Type : 0001 [Reserved Memory Region]
[08Ah 0138 002h]                      Length : 0020

[08Ch 0140 002h]                    Reserved : 0000
[08Eh 0142 002h]          PCI Segment Number : 0000
[090h 0144 008h]                Base Address : 0000000079000000
[098h 0152 008h]         End Address (limit) : 000000007B7FFFFF

[0A0h 0160 001h]           Device Scope Type : 01 [PCI Endpoint Device]
[0A1h 0161 001h]                Entry Length : 08
[0A2h 0162 001h]                       Flags : 00
[0A3h 0163 001h]                    Reserved : 00
[0A4h 0164 001h]              Enumeration ID : 00
[0A5h 0165 001h]              PCI Bus Number : 00

[0A6h 0166 002h]                    PCI Path : 02,00


Raw Table Data: Length 168 (0xA8)

    0000: 44 4D 41 52 A8 00 00 00 01 2D 4C 47 45 20 20 20  // DMAR.....-LGE   
    0010: 4C 47 50 43 20 20 20 20 02 00 00 00 50 54 45 43  // LGPC    ....PTEC
    0020: 02 00 00 00 26 01 00 00 00 00 00 00 00 00 00 00  // ....&...........
    0030: 00 00 18 00 00 00 00 00 00 00 D9 FE 00 00 00 00  // ................
    0040: 01 08 00 00 00 00 02 00 00 00 20 00 01 00 00 00  // .......... .....
    0050: 00 10 D9 FE 00 00 00 00 03 08 00 00 02 00 1E 07  // ................
    0060: 04 08 00 00 00 00 1E 06 01 00 20 00 00 00 00 00  // .......... .....
    0070: 00 50 8A 6F 00 00 00 00 FF 4F 8C 6F 00 00 00 00  // .P.o.....O.o....
    0080: 01 08 00 00 00 00 14 00 01 00 20 00 00 00 00 00  // .......... .....
    0090: 00 00 00 79 00 00 00 00 FF FF 7F 7B 00 00 00 00  // ...y.......{....
    00A0: 01 08 00 00 00 00 02 00                          // ........
