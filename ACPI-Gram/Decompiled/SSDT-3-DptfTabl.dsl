/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20251212 (32-bit version)
 * Copyright (c) 2000 - 2025 Intel Corporation
 * 
 * Disassembling to symbolic ASL+ operators
 *
 * Disassembly of SSDT-3-DptfTabl.aml
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x000083C4 (33732)
 *     Revision         0x02
 *     Checksum         0xD1
 *     OEM ID           "LGE   "
 *     OEM Table ID     "DptfTabl"
 *     OEM Revision     0x00001000 (4096)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20160527 (538314023)
 */
DefinitionBlock ("", "SSDT", 2, "LGE   ", "DptfTabl", 0x00001000)
{
    External (_SB_, DeviceObj)
    External (_SB_.AAC0, FieldUnitObj)
    External (_SB_.ACRT, FieldUnitObj)
    External (_SB_.APSV, FieldUnitObj)
    External (_SB_.CBMI, FieldUnitObj)
    External (_SB_.CFGD, FieldUnitObj)
    External (_SB_.CLVL, FieldUnitObj)
    External (_SB_.CPPC, FieldUnitObj)
    External (_SB_.CTC0, FieldUnitObj)
    External (_SB_.CTC1, FieldUnitObj)
    External (_SB_.CTC2, FieldUnitObj)
    External (_SB_.OSCP, IntObj)
    External (_SB_.PAGD, DeviceObj)
    External (_SB_.PAGD._PUR, PkgObj)
    External (_SB_.PAGD._STA, MethodObj)    // 0 Arguments
    External (_SB_.PCI0, DeviceObj)
    External (_SB_.PCI0.B0D4, DeviceObj)
    External (_SB_.PCI0.GFX0.DD1F._BCL, MethodObj)    // 0 Arguments
    External (_SB_.PCI0.GFX0.DD1F._BCM, MethodObj)    // 1 Arguments
    External (_SB_.PCI0.GFX0.DD1F._BQC, MethodObj)    // 0 Arguments
    External (_SB_.PCI0.GFX0.DD1F._DCS, MethodObj)    // 0 Arguments
    External (_SB_.PCI0.LPCB.ADBG, UnknownObj)
    External (_SB_.PCI0.LPCB.H_EC, DeviceObj)
    External (_SB_.PCI0.LPCB.H_EC.ACUR, FieldUnitObj)
    External (_SB_.PCI0.LPCB.H_EC.AP01, FieldUnitObj)
    External (_SB_.PCI0.LPCB.H_EC.AP02, FieldUnitObj)
    External (_SB_.PCI0.LPCB.H_EC.AP10, FieldUnitObj)
    External (_SB_.PCI0.LPCB.H_EC.APKP, FieldUnitObj)
    External (_SB_.PCI0.LPCB.H_EC.APKT, FieldUnitObj)
    External (_SB_.PCI0.LPCB.H_EC.ARTG, FieldUnitObj)
    External (_SB_.PCI0.LPCB.H_EC.AVOL, FieldUnitObj)
    External (_SB_.PCI0.LPCB.H_EC.B1FC, FieldUnitObj)
    External (_SB_.PCI0.LPCB.H_EC.B1RC, FieldUnitObj)
    External (_SB_.PCI0.LPCB.H_EC.BAT1._BIX, MethodObj)    // 0 Arguments
    External (_SB_.PCI0.LPCB.H_EC.BAT1._BST, MethodObj)    // 0 Arguments
    External (_SB_.PCI0.LPCB.H_EC.BICC, FieldUnitObj)
    External (_SB_.PCI0.LPCB.H_EC.BMAX, FieldUnitObj)
    External (_SB_.PCI0.LPCB.H_EC.CFAN, FieldUnitObj)
    External (_SB_.PCI0.LPCB.H_EC.CFSP, FieldUnitObj)
    External (_SB_.PCI0.LPCB.H_EC.CHGR, FieldUnitObj)
    External (_SB_.PCI0.LPCB.H_EC.CMDR, FieldUnitObj)
    External (_SB_.PCI0.LPCB.H_EC.CPUP, FieldUnitObj)
    External (_SB_.PCI0.LPCB.H_EC.CTYP, FieldUnitObj)
    External (_SB_.PCI0.LPCB.H_EC.DPTF, FieldUnitObj)
    External (_SB_.PCI0.LPCB.H_EC.ECAV, IntObj)
    External (_SB_.PCI0.LPCB.H_EC.ECF2, OpRegionObj)
    External (_SB_.PCI0.LPCB.H_EC.ECMD, MethodObj)    // 1 Arguments
    External (_SB_.PCI0.LPCB.H_EC.ECRD, MethodObj)    // 1 Arguments
    External (_SB_.PCI0.LPCB.H_EC.ECWT, MethodObj)    // 2 Arguments
    External (_SB_.PCI0.LPCB.H_EC.FCHG, FieldUnitObj)
    External (_SB_.PCI0.LPCB.H_EC.HYST, FieldUnitObj)
    External (_SB_.PCI0.LPCB.H_EC.LSOC, FieldUnitObj)
    External (_SB_.PCI0.LPCB.H_EC.MAP1, DeviceObj)
    External (_SB_.PCI0.LPCB.H_EC.MAP1.CA82, IntObj)
    External (_SB_.PCI0.LPCB.H_EC.MAP1.CAUS, IntObj)
    External (_SB_.PCI0.LPCB.H_EC.NPWR, FieldUnitObj)
    External (_SB_.PCI0.LPCB.H_EC.PBOK, FieldUnitObj)
    External (_SB_.PCI0.LPCB.H_EC.PBSS, FieldUnitObj)
    External (_SB_.PCI0.LPCB.H_EC.PECH, FieldUnitObj)
    External (_SB_.PCI0.LPCB.H_EC.PENS, FieldUnitObj)
    External (_SB_.PCI0.LPCB.H_EC.PENV, FieldUnitObj)
    External (_SB_.PCI0.LPCB.H_EC.PINV, FieldUnitObj)
    External (_SB_.PCI0.LPCB.H_EC.PLMX, FieldUnitObj)
    External (_SB_.PCI0.LPCB.H_EC.PMAX, FieldUnitObj)
    External (_SB_.PCI0.LPCB.H_EC.PPSH, FieldUnitObj)
    External (_SB_.PCI0.LPCB.H_EC.PPSL, FieldUnitObj)
    External (_SB_.PCI0.LPCB.H_EC.PPWR, FieldUnitObj)
    External (_SB_.PCI0.LPCB.H_EC.PROP, FieldUnitObj)
    External (_SB_.PCI0.LPCB.H_EC.PSOC, FieldUnitObj)
    External (_SB_.PCI0.LPCB.H_EC.PSTP, FieldUnitObj)
    External (_SB_.PCI0.LPCB.H_EC.PWRT, FieldUnitObj)
    External (_SB_.PCI0.LPCB.H_EC.TSHT, FieldUnitObj)
    External (_SB_.PCI0.LPCB.H_EC.TSI_, FieldUnitObj)
    External (_SB_.PCI0.LPCB.H_EC.TSLT, FieldUnitObj)
    External (_SB_.PCI0.LPCB.H_EC.TSR1, FieldUnitObj)
    External (_SB_.PCI0.LPCB.H_EC.TSR2, FieldUnitObj)
    External (_SB_.PCI0.LPCB.H_EC.TSR3, FieldUnitObj)
    External (_SB_.PCI0.LPCB.H_EC.TSR4, FieldUnitObj)
    External (_SB_.PCI0.LPCB.H_EC.TSR5, FieldUnitObj)
    External (_SB_.PCI0.LPCB.H_EC.TSSR, FieldUnitObj)
    External (_SB_.PCI0.LPCB.H_EC.VMIN, FieldUnitObj)
    External (_SB_.PCI0.MHBR, FieldUnitObj)
    External (_SB_.PL10, FieldUnitObj)
    External (_SB_.PL11, FieldUnitObj)
    External (_SB_.PL12, FieldUnitObj)
    External (_SB_.PL20, FieldUnitObj)
    External (_SB_.PL21, FieldUnitObj)
    External (_SB_.PL22, FieldUnitObj)
    External (_SB_.PLW0, FieldUnitObj)
    External (_SB_.PLW1, FieldUnitObj)
    External (_SB_.PLW2, FieldUnitObj)
    External (_SB_.PR00, ProcessorObj)
    External (_SB_.PR00._PSS, MethodObj)    // 0 Arguments
    External (_SB_.PR00._TPC, IntObj)
    External (_SB_.PR00._TSD, MethodObj)    // 0 Arguments
    External (_SB_.PR00._TSS, MethodObj)    // 0 Arguments
    External (_SB_.PR00.LPSS, PkgObj)
    External (_SB_.PR00.TPSS, PkgObj)
    External (_SB_.PR00.TSMC, PkgObj)
    External (_SB_.PR00.TSMF, PkgObj)
    External (_SB_.PR01, ProcessorObj)
    External (_SB_.PR02, ProcessorObj)
    External (_SB_.PR03, ProcessorObj)
    External (_SB_.PR04, ProcessorObj)
    External (_SB_.PR05, ProcessorObj)
    External (_SB_.PR06, ProcessorObj)
    External (_SB_.PR07, ProcessorObj)
    External (_SB_.PR08, ProcessorObj)
    External (_SB_.PR09, ProcessorObj)
    External (_SB_.PR10, ProcessorObj)
    External (_SB_.PR11, ProcessorObj)
    External (_SB_.PR12, ProcessorObj)
    External (_SB_.PR13, ProcessorObj)
    External (_SB_.PR14, ProcessorObj)
    External (_SB_.PR15, ProcessorObj)
    External (_SB_.SLPB, DeviceObj)
    External (_SB_.TAR0, FieldUnitObj)
    External (_SB_.TAR1, FieldUnitObj)
    External (_SB_.TAR2, FieldUnitObj)
    External (_TZ_.ETMD, IntObj)
    External (_TZ_.TZ00, ThermalZoneObj)
    External (_TZ_.TZ01, ThermalZoneObj)
    External (ACTT, IntObj)
    External (ADBG, MethodObj)    // 1 Arguments
    External (APPE, IntObj)
    External (ATMC, IntObj)
    External (ATPC, IntObj)
    External (CA2D, IntObj)
    External (CHGE, IntObj)
    External (CPUS, IntObj)
    External (CRTT, IntObj)
    External (CTDP, IntObj)
    External (DCFE, IntObj)
    External (DISE, IntObj)
    External (DPAP, IntObj)
    External (DPCP, IntObj)
    External (DPHL, IntObj)
    External (DPLL, IntObj)
    External (DPPP, IntObj)
    External (DPTF, IntObj)
    External (FND1, IntObj)
    External (HIDW, MethodObj)    // 4 Arguments
    External (HIWC, MethodObj)    // 1 Arguments
    External (LPER, IntObj)
    External (LPOE, IntObj)
    External (LPOP, IntObj)
    External (LPOS, IntObj)
    External (LPOW, IntObj)
    External (MPL0, IntObj)
    External (MPL1, IntObj)
    External (MPL2, IntObj)
    External (N00U, IntObj)
    External (N038, FieldUnitObj)
    External (ODV0, IntObj)
    External (ODV1, IntObj)
    External (ODV2, IntObj)
    External (ODV3, IntObj)
    External (ODV4, IntObj)
    External (ODV5, IntObj)
    External (PBPE, IntObj)
    External (PC00, IntObj)
    External (PIDE, IntObj)
    External (PLID, UnknownObj)
    External (PNHM, IntObj)
    External (PPPR, IntObj)
    External (PPSZ, IntObj)
    External (PSVT, IntObj)
    External (PTMC, IntObj)
    External (PTPC, IntObj)
    External (PWRE, IntObj)
    External (PWRS, IntObj)
    External (RFIM, IntObj)
    External (S1AT, IntObj)
    External (S1CT, IntObj)
    External (S1DE, IntObj)
    External (S1HT, IntObj)
    External (S1PT, IntObj)
    External (S1S3, IntObj)
    External (S2AT, IntObj)
    External (S2CT, IntObj)
    External (S2DE, IntObj)
    External (S2HT, IntObj)
    External (S2PT, IntObj)
    External (S2S3, IntObj)
    External (S3AT, IntObj)
    External (S3CT, IntObj)
    External (S3DE, IntObj)
    External (S3HT, IntObj)
    External (S3PT, IntObj)
    External (S3S3, IntObj)
    External (S4AT, IntObj)
    External (S4CT, IntObj)
    External (S4DE, IntObj)
    External (S4HT, IntObj)
    External (S4PT, IntObj)
    External (S4S3, IntObj)
    External (S5AT, IntObj)
    External (S5CT, IntObj)
    External (S5DE, IntObj)
    External (S5HT, IntObj)
    External (S5PT, IntObj)
    External (S5S3, IntObj)
    External (SAC3, IntObj)
    External (SACT, IntObj)
    External (SADE, IntObj)
    External (SAHT, IntObj)
    External (SAT1, IntObj)
    External (SAT2, IntObj)
    External (SC31, IntObj)
    External (SC32, IntObj)
    External (SCT1, IntObj)
    External (SCT2, IntObj)
    External (SGE1, IntObj)
    External (SGE2, IntObj)
    External (SHT1, IntObj)
    External (SHT2, IntObj)
    External (SPT1, IntObj)
    External (SPT2, IntObj)
    External (SSP1, IntObj)
    External (SSP2, IntObj)
    External (SSP3, IntObj)
    External (SSP4, IntObj)
    External (SSP5, IntObj)
    External (TCNT, IntObj)
    External (TJMX, IntObj)
    External (TRTV, IntObj)
    External (TSOD, IntObj)
    External (V1AT, IntObj)
    External (V1C3, IntObj)
    External (V1CR, IntObj)
    External (V1HT, IntObj)
    External (V1PV, IntObj)
    External (V2AT, IntObj)
    External (V2C3, IntObj)
    External (V2CR, IntObj)
    External (V2HT, IntObj)
    External (V2PV, IntObj)
    External (VSP1, IntObj)
    External (VSP2, IntObj)
    External (VSPE, IntObj)
    External (WAND, IntObj)
    External (WLC3, IntObj)
    External (WRAT, IntObj)
    External (WRCT, IntObj)
    External (WRFD, IntObj)
    External (WRHT, IntObj)
    External (WRPT, IntObj)
    External (WTSP, IntObj)
    External (WWAT, IntObj)
    External (WWC3, IntObj)
    External (WWCT, IntObj)
    External (WWHT, IntObj)
    External (WWPT, IntObj)
    External (XMID, FieldUnitObj)

    Scope (\_SB)
    {
        Device (IETM)
        {
            Name (_HID, EisaId ("INT3400") /* Intel Dynamic Power Performance Management */)  // _HID: Hardware ID
            Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
            {
                If (CondRefOf (HIWC))
                {
                    If (HIWC (Arg0))
                    {
                        If (CondRefOf (HIDW))
                        {
                            Return (HIDW (Arg0, Arg1, Arg2, Arg3))
                        }
                    }
                }

                Return (Buffer (One)
                {
                     0x00                                             // .
                })
            }

            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If ((DPTF == One))
                {
                    Return (0x0F)
                }
                Else
                {
                    Return (Zero)
                }
            }

            Name (IDTP, Package (0x0C)
            {
                ToUUID ("9e04115a-ae87-4d1c-9500-0f3e340bfe75") /* Unknown UUID */, 
                ToUUID ("42a441d6-ae6a-462b-a84b-4a8ce79027d3") /* Unknown UUID */, 
                ToUUID ("3a95c389-e4b8-4629-a526-c52c88626bae") /* Unknown UUID */, 
                ToUUID ("0e56fab6-bdfc-4e8c-8246-40ecfd4d74ea") /* Unknown UUID */, 
                ToUUID ("97c68ae7-15fa-499c-b8c9-5da81d606e0a") /* Unknown UUID */, 
                ToUUID ("c4ce1849-243a-49f3-b8d5-f97002f38e6a") /* Unknown UUID */, 
                ToUUID ("e145970a-e4c1-4d73-900e-c9c5a69dd067") /* Unknown UUID */, 
                ToUUID ("f5a35014-c209-46a4-993a-eb56de7530a1") /* Unknown UUID */, 
                ToUUID ("63be270f-1c11-48fd-a6f7-3af253ff3e2d") /* Unknown UUID */, 
                ToUUID ("6ed722a7-9240-48a5-b479-31eef723d7cf") /* Unknown UUID */, 
                ToUUID ("42496e14-bc1b-46e8-a798-ca915464426f") /* Unknown UUID */, 
                Buffer (0x10)
                {
                    /* 0000 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 0008 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00   // ........
                }
            })
            Name (TMPP, Package (0x0C)
            {
                Buffer (0x10)
                {
                    /* 0000 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 0008 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00   // ........
                }, 

                Buffer (0x10)
                {
                    /* 0000 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 0008 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00   // ........
                }, 

                Buffer (0x10)
                {
                    /* 0000 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 0008 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00   // ........
                }, 

                Buffer (0x10)
                {
                    /* 0000 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 0008 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00   // ........
                }, 

                Buffer (0x10)
                {
                    /* 0000 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 0008 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00   // ........
                }, 

                Buffer (0x10)
                {
                    /* 0000 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 0008 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00   // ........
                }, 

                Buffer (0x10)
                {
                    /* 0000 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 0008 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00   // ........
                }, 

                Buffer (0x10)
                {
                    /* 0000 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 0008 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00   // ........
                }, 

                Buffer (0x10)
                {
                    /* 0000 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 0008 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00   // ........
                }, 

                Buffer (0x10)
                {
                    /* 0000 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 0008 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00   // ........
                }, 

                Buffer (0x10)
                {
                    /* 0000 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 0008 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00   // ........
                }, 

                Buffer (0x10)
                {
                    /* 0000 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 0008 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00   // ........
                }
            })
            Name (PTRP, Zero)
            Name (PSEM, Zero)
            Name (ATRP, Zero)
            Name (ASEM, Zero)
            Name (YTRP, Zero)
            Name (YSEM, Zero)
            Method (IDSP, 0, Serialized)
            {
                Name (TMPI, Zero)
                If (((\DPPP == 0x02) && CondRefOf (DP2P)))
                {
                    TMPP [TMPI] = DerefOf (DP2P [Zero])
                    TMPI++
                }

                If (((\DPPP == One) && CondRefOf (DPSP)))
                {
                    TMPP [TMPI] = DerefOf (DPSP [Zero])
                    TMPI++
                }

                If (((\DPAP == One) && CondRefOf (DASP)))
                {
                    TMPP [TMPI] = DerefOf (DASP [Zero])
                    TMPI++
                }

                If (((\DPAP == 0x02) && CondRefOf (DA2P)))
                {
                    TMPP [TMPI] = DerefOf (DA2P [Zero])
                    TMPI++
                }

                If (((\DPCP == One) && CondRefOf (DCSP)))
                {
                    TMPP [TMPI] = DerefOf (DCSP [Zero])
                    TMPI++
                }

                If (((\RFIM == One) && CondRefOf (RFIP)))
                {
                    TMPP [TMPI] = DerefOf (RFIP [Zero])
                    TMPI++
                }

                If (CondRefOf (CTSP))
                {
                    If (((\SADE == One) && (\CTDP == One)))
                    {
                        TMPP [TMPI] = DerefOf (CTSP [Zero])
                        TMPI++
                    }
                }

                If (((\PBPE == One) && CondRefOf (POBP)))
                {
                    TMPP [TMPI] = DerefOf (POBP [Zero])
                    TMPI++
                }

                If (((\APPE == One) && CondRefOf (DAPP)))
                {
                    TMPP [TMPI] = DerefOf (DAPP [Zero])
                    TMPI++
                }

                If (((\VSPE == One) && CondRefOf (DVSP)))
                {
                    TMPP [TMPI] = DerefOf (DVSP [Zero])
                    TMPI++
                }

                If (((\PIDE == One) && CondRefOf (DPID)))
                {
                    TMPP [TMPI] = DerefOf (DPID [Zero])
                    TMPI++
                }

                Return (TMPP) /* \_SB_.IETM.TMPP */
            }

            Method (_OSC, 4, Serialized)  // _OSC: Operating System Capabilities
            {
                Name (NUMP, Zero)
                Name (UID2, Buffer (0x10)
                {
                    /* 0000 */  0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF,  // ........
                    /* 0008 */  0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF   // ........
                })
                CreateDWordField (Arg3, Zero, STS1)
                CreateDWordField (Arg3, 0x04, CAP1)
                NUMP = SizeOf (IDTP)
                CreateDWordField (Arg0, Zero, IID0)
                CreateDWordField (Arg0, 0x04, IID1)
                CreateDWordField (Arg0, 0x08, IID2)
                CreateDWordField (Arg0, 0x0C, IID3)
                CreateDWordField (UID2, Zero, EID0)
                CreateDWordField (UID2, 0x04, EID1)
                CreateDWordField (UID2, 0x08, EID2)
                CreateDWordField (UID2, 0x0C, EID3)
                While (NUMP)
                {
                    UID2 = DerefOf (IDTP [(NUMP - One)])
                    If ((((IID0 == EID0) && (IID1 == EID1)) && ((IID2 == 
                        EID2) && (IID3 == EID3))))
                    {
                        Break
                    }

                    NUMP--
                }

                If ((Arg1 != One))
                {
                    STS1 &= 0xFFFFFF00
                    STS1 |= 0x0A
                    Return (Arg3)
                }

                If ((Arg2 != 0x02))
                {
                    STS1 &= 0xFFFFFF00
                    STS1 |= 0x02
                    Return (Arg3)
                }

                If (((\DPPP == 0x02) && CondRefOf (\_SB.APSV)))
                {
                    If ((PSEM == Zero))
                    {
                        PSEM = One
                        PTRP = \_SB.APSV /* External reference */
                    }

                    If (CondRefOf (DP2P))
                    {
                        UID2 = DerefOf (DP2P [Zero])
                    }

                    If ((((IID0 == EID0) && (IID1 == EID1)) && ((IID2 == 
                        EID2) && (IID3 == EID3))))
                    {
                        If (~(STS1 & One))
                        {
                            If ((CAP1 & One))
                            {
                                \_SB.APSV = 0x6E
                                \_SB.PCI0.LPCB.H_EC.DPTF = One
                            }
                            Else
                            {
                                \_SB.APSV = PTRP /* \_SB_.IETM.PTRP */
                                \_SB.PCI0.LPCB.H_EC.DPTF = Zero
                            }

                            If (CondRefOf (\TZ.TZ00))
                            {
                                Notify (\_TZ.TZ00, 0x81) // Information Change
                            }

                            If (CondRefOf (\TZ.TZ01))
                            {
                                Notify (\_TZ.TZ01, 0x81) // Information Change
                            }
                        }

                        Return (Arg3)
                    }
                }

                If (((\DPPP == One) && CondRefOf (\_SB.APSV)))
                {
                    If ((PSEM == Zero))
                    {
                        PSEM = One
                        PTRP = \_SB.APSV /* External reference */
                    }

                    If (CondRefOf (DPSP))
                    {
                        UID2 = DerefOf (DPSP [Zero])
                    }

                    If ((((IID0 == EID0) && (IID1 == EID1)) && ((IID2 == 
                        EID2) && (IID3 == EID3))))
                    {
                        If (~(STS1 & One))
                        {
                            If ((CAP1 & One))
                            {
                                \_SB.APSV = 0x6E
                            }
                            Else
                            {
                                \_SB.APSV = PTRP /* \_SB_.IETM.PTRP */
                            }

                            If (CondRefOf (\TZ.TZ00))
                            {
                                Notify (\_TZ.TZ00, 0x81) // Information Change
                            }

                            If (CondRefOf (\TZ.TZ01))
                            {
                                Notify (\_TZ.TZ01, 0x81) // Information Change
                            }
                        }

                        Return (Arg3)
                    }
                }

                If (((\PIDE == One) && CondRefOf (\_SB.APSV)))
                {
                    If ((PSEM == Zero))
                    {
                        PSEM = One
                        PTRP = \_SB.APSV /* External reference */
                    }

                    If (CondRefOf (DPID))
                    {
                        UID2 = DerefOf (DPID [Zero])
                    }

                    If ((((IID0 == EID0) && (IID1 == EID1)) && ((IID2 == 
                        EID2) && (IID3 == EID3))))
                    {
                        If (~(STS1 & One))
                        {
                            If ((CAP1 & One))
                            {
                                \_SB.APSV = 0x6E
                            }
                            Else
                            {
                                \_SB.APSV = PTRP /* \_SB_.IETM.PTRP */
                            }

                            If (CondRefOf (\TZ.TZ00))
                            {
                                Notify (\_TZ.TZ00, 0x81) // Information Change
                            }

                            If (CondRefOf (\TZ.TZ01))
                            {
                                Notify (\_TZ.TZ01, 0x81) // Information Change
                            }
                        }

                        Return (Arg3)
                    }
                }

                If (((\DPAP == One) && CondRefOf (\_SB.AAC0)))
                {
                    If ((ASEM == Zero))
                    {
                        ASEM = One
                        ATRP = \_SB.AAC0 /* External reference */
                    }

                    If (CondRefOf (DASP))
                    {
                        UID2 = DerefOf (DASP [Zero])
                    }

                    If ((((IID0 == EID0) && (IID1 == EID1)) && ((IID2 == 
                        EID2) && (IID3 == EID3))))
                    {
                        If (~(STS1 & One))
                        {
                            If ((CAP1 & One))
                            {
                                \_SB.AAC0 = 0x6E
                                \_TZ.ETMD = Zero
                                \_SB.PCI0.LPCB.H_EC.DPTF = One
                            }
                            Else
                            {
                                \_SB.AAC0 = ATRP /* \_SB_.IETM.ATRP */
                                \_TZ.ETMD = One
                                \_SB.PCI0.LPCB.H_EC.DPTF = Zero
                            }

                            If (CondRefOf (\TZ.TZ00))
                            {
                                Notify (\_TZ.TZ00, 0x81) // Information Change
                            }

                            If (CondRefOf (\TZ.TZ01))
                            {
                                Notify (\_TZ.TZ01, 0x81) // Information Change
                            }
                        }

                        Return (Arg3)
                    }
                }

                If (((\DPAP == 0x02) && CondRefOf (\_SB.AAC0)))
                {
                    If ((ASEM == Zero))
                    {
                        ASEM = One
                        ATRP = \_SB.AAC0 /* External reference */
                    }

                    If (CondRefOf (DA2P))
                    {
                        UID2 = DerefOf (DA2P [Zero])
                    }

                    If ((((IID0 == EID0) && (IID1 == EID1)) && ((IID2 == 
                        EID2) && (IID3 == EID3))))
                    {
                        If (~(STS1 & One))
                        {
                            If ((CAP1 & One))
                            {
                                \_SB.AAC0 = 0x6E
                                \_TZ.ETMD = Zero
                            }
                            Else
                            {
                                \_SB.AAC0 = ATRP /* \_SB_.IETM.ATRP */
                                \_TZ.ETMD = One
                            }

                            If (CondRefOf (\TZ.TZ00))
                            {
                                Notify (\_TZ.TZ00, 0x81) // Information Change
                            }

                            If (CondRefOf (\TZ.TZ01))
                            {
                                Notify (\_TZ.TZ01, 0x81) // Information Change
                            }
                        }

                        Return (Arg3)
                    }
                }

                If (((\DPCP == One) && CondRefOf (\_SB.ACRT)))
                {
                    If ((YSEM == Zero))
                    {
                        YSEM = One
                        YTRP = \_SB.ACRT /* External reference */
                    }

                    If (CondRefOf (DCSP))
                    {
                        UID2 = DerefOf (DCSP [Zero])
                    }

                    If ((((IID0 == EID0) && (IID1 == EID1)) && ((IID2 == 
                        EID2) && (IID3 == EID3))))
                    {
                        If (~(STS1 & One))
                        {
                            If ((CAP1 & One))
                            {
                                \_SB.ACRT = 0xD2
                            }
                            Else
                            {
                                \_SB.ACRT = YTRP /* \_SB_.IETM.YTRP */
                            }

                            If (CondRefOf (\TZ.TZ00))
                            {
                                Notify (\_TZ.TZ00, 0x81) // Information Change
                            }

                            If (CondRefOf (\TZ.TZ01))
                            {
                                Notify (\_TZ.TZ01, 0x81) // Information Change
                                If ((\DPCP == One))
                                {
                                    CopyObject (TJMX, CRTT) /* External reference */
                                }
                            }
                        }

                        Return (Arg3)
                    }
                }

                Return (Arg3)
            }

            Method (DCFG, 0, NotSerialized)
            {
                Return (\DCFE) /* External reference */
            }

            Name (ODVX, Package (0x06)
            {
                Zero, 
                Zero, 
                Zero, 
                Zero, 
                Zero, 
                Zero
            })
            Method (ODVP, 0, Serialized)
            {
                ODVX [Zero] = \ODV0 /* External reference */
                ODVX [One] = \ODV1 /* External reference */
                ODVX [0x02] = \ODV2 /* External reference */
                ODVX [0x03] = \ODV3 /* External reference */
                ODVX [0x04] = \ODV4 /* External reference */
                ODVX [0x05] = \ODV5 /* External reference */
                Return (ODVX) /* \_SB_.IETM.ODVX */
            }
        }
    }

    Scope (\_SB.PCI0.LPCB.H_EC)
    {
        Mutex (PATM, 0x00)
        Method (_QF1, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
        {
            ADBG ("Method _QF1")
            Local0 = \_SB.PCI0.LPCB.H_EC.ECRD (RefOf (\_SB.PCI0.LPCB.H_EC.TSSR))
            While (Local0)
            {
                \_SB.PCI0.LPCB.H_EC.ECWT (Zero, RefOf (\_SB.PCI0.LPCB.H_EC.TSSR))
                If ((Local0 & 0x02))
                {
                    ADBG ("Sensor 2")
                    Notify (\_SB.PCI0.LPCB.H_EC.SEN2, 0x90) // Device-Specific
                }

                If ((Local0 & One))
                {
                    Notify (\_SB.PCI0.LPCB.H_EC.SEN1, 0x90) // Device-Specific
                }

                Local0 = \_SB.PCI0.LPCB.H_EC.ECRD (RefOf (\_SB.PCI0.LPCB.H_EC.TSSR))
            }
        }
    }

    Scope (\_SB.IETM)
    {
        Method (KTOC, 1, Serialized)
        {
            If ((Arg0 > 0x0AAC))
            {
                Return (((Arg0 - 0x0AAC) / 0x0A))
            }
            Else
            {
                Return (Zero)
            }
        }

        Method (CTOK, 1, Serialized)
        {
            Return (((Arg0 * 0x0A) + 0x0AAC))
        }

        Method (C10K, 1, Serialized)
        {
            Name (TMP1, Buffer (0x10)
            {
                 0x00                                             // .
            })
            CreateByteField (TMP1, Zero, TMPL)
            CreateByteField (TMP1, One, TMPH)
            Local0 = (Arg0 + 0x0AAC)
            TMPL = (Local0 & 0xFF)
            TMPH = ((Local0 & 0xFF00) >> 0x08)
            ToInteger (TMP1, Local1)
            Return (Local1)
        }

        Method (K10C, 1, Serialized)
        {
            If ((Arg0 > 0x0AAC))
            {
                Return ((Arg0 - 0x0AAC))
            }
            Else
            {
                Return (Zero)
            }
        }
    }

    Scope (\_SB.PCI0.B0D4)
    {
        Name (PFLG, Zero)
        Method (_STA, 0, NotSerialized)  // _STA: Status
        {
            If ((\SADE == One))
            {
                Return (0x0F)
            }
            Else
            {
                Return (Zero)
            }
        }

        OperationRegion (MBAR, SystemMemory, ((MHBR << 0x0F) + 0x5000), 0x1000)
        Field (MBAR, ByteAcc, NoLock, Preserve)
        {
            Offset (0x930), 
            PTDP,   15, 
            Offset (0x932), 
            PMIN,   15, 
            Offset (0x934), 
            PMAX,   15, 
            Offset (0x936), 
            TMAX,   7, 
            Offset (0x938), 
            PWRU,   4, 
            Offset (0x939), 
            EGYU,   5, 
            Offset (0x93A), 
            TIMU,   4, 
            Offset (0x958), 
            Offset (0x95C), 
            LPMS,   1, 
            CTNL,   2, 
            Offset (0x978), 
            PCTP,   8, 
            Offset (0x998), 
            RP0C,   8, 
            RP1C,   8, 
            RPNC,   8, 
            Offset (0xF3C), 
            TRAT,   8, 
            Offset (0xF40), 
            PTD1,   15, 
            Offset (0xF42), 
            TRA1,   8, 
            Offset (0xF44), 
            PMX1,   15, 
            Offset (0xF46), 
            PMN1,   15, 
            Offset (0xF48), 
            PTD2,   15, 
            Offset (0xF4A), 
            TRA2,   8, 
            Offset (0xF4C), 
            PMX2,   15, 
            Offset (0xF4E), 
            PMN2,   15, 
            Offset (0xF50), 
            CTCL,   2, 
                ,   29, 
            CLCK,   1, 
            MNTR,   8
        }

        Name (XPCC, Zero)
        Method (PPCC, 0, Serialized)
        {
            If (((XPCC == Zero) && CondRefOf (\_SB.CBMI)))
            {
                Switch (ToInteger (\_SB.CBMI))
                {
                    Case (Zero)
                    {
                        If (((\_SB.CLVL >= One) && (\_SB.CLVL <= 0x03)))
                        {
                            CPL0 ()
                            XPCC = One
                        }
                    }
                    Case (One)
                    {
                        If (((\_SB.CLVL == 0x02) || (\_SB.CLVL == 0x03)))
                        {
                            CPL1 ()
                            XPCC = One
                        }
                    }
                    Case (0x02)
                    {
                        If ((\_SB.CLVL == 0x03))
                        {
                            CPL2 ()
                            XPCC = One
                        }
                    }

                }

                DerefOf (\_SB.PCI0.B0D4.NPCC [One]) [One] = 0x1B58
                If (((\XMID == Zero) || (\XMID == 0x04)))
                {
                    DerefOf (\_SB.PCI0.B0D4.NPCC [One]) [One] = 0x1388
                }
                ElseIf (((\XMID == 0x03) || (\XMID == 0x07)))
                {
                    DerefOf (\_SB.PCI0.B0D4.NPCC [One]) [One] = 0x1388
                }
                ElseIf (((\XMID == 0x02) || (\XMID == 0x06)))
                {
                    DerefOf (\_SB.PCI0.B0D4.NPCC [One]) [One] = 0x1388
                }
                ElseIf (((\XMID == One) || (\XMID == 0x05)))
                {
                    DerefOf (\_SB.PCI0.B0D4.NPCC [One]) [One] = 0x1388
                }
            }

            Return (NPCC) /* \_SB_.PCI0.B0D4.NPCC */
        }

        Name (NPCC, Package (0x03)
        {
            0x02, 
            Package (0x06)
            {
                Zero, 
                0x88B8, 
                0xAFC8, 
                0x6D60, 
                0x7D00, 
                0x03E8
            }, 

            Package (0x06)
            {
                One, 
                0xDBBA, 
                0xDBBA, 
                Zero, 
                Zero, 
                0x03E8
            }
        })
        Method (CPNU, 2, Serialized)
        {
            Name (CNVT, Zero)
            Name (PPUU, Zero)
            Name (RMDR, Zero)
            If ((PWRU == Zero))
            {
                PPUU = One
            }
            Else
            {
                PPUU = (PWRU-- << 0x02)
            }

            Divide (Arg0, PPUU, RMDR, CNVT) /* \_SB_.PCI0.B0D4.CPNU.CNVT */
            If ((Arg1 == Zero))
            {
                Return (CNVT) /* \_SB_.PCI0.B0D4.CPNU.CNVT */
            }
            Else
            {
                CNVT *= 0x03E8
                RMDR *= 0x03E8
                RMDR /= PPUU
                CNVT += RMDR /* \_SB_.PCI0.B0D4.CPNU.RMDR */
                Return (CNVT) /* \_SB_.PCI0.B0D4.CPNU.CNVT */
            }
        }

        Method (CPL0, 0, NotSerialized)
        {
            \_SB.PCI0.B0D4.NPCC [Zero] = 0x02
            DerefOf (\_SB.PCI0.B0D4.NPCC [One]) [Zero] = Zero
            DerefOf (\_SB.PCI0.B0D4.NPCC [One]) [One] = \MPL0 /* External reference */
            DerefOf (\_SB.PCI0.B0D4.NPCC [One]) [0x02] = CPNU (\_SB.PL10, One)
            DerefOf (\_SB.PCI0.B0D4.NPCC [One]) [0x03] = (\_SB.PLW0 * 0x03E8)
            DerefOf (\_SB.PCI0.B0D4.NPCC [One]) [0x04] = ((\_SB.PLW0 * 0x03E8
                ) + 0x0FA0)
            DerefOf (\_SB.PCI0.B0D4.NPCC [One]) [0x05] = PPSZ /* External reference */
            DerefOf (\_SB.PCI0.B0D4.NPCC [0x02]) [Zero] = One
            DerefOf (\_SB.PCI0.B0D4.NPCC [0x02]) [One] = CPNU (\_SB.PL20, One)
            DerefOf (\_SB.PCI0.B0D4.NPCC [0x02]) [0x02] = CPNU (\_SB.PL20, One)
            DerefOf (\_SB.PCI0.B0D4.NPCC [0x02]) [0x03] = Zero
            DerefOf (\_SB.PCI0.B0D4.NPCC [0x02]) [0x04] = Zero
            DerefOf (\_SB.PCI0.B0D4.NPCC [0x02]) [0x05] = PPSZ /* External reference */
        }

        Method (CPL1, 0, NotSerialized)
        {
            \_SB.PCI0.B0D4.NPCC [Zero] = 0x02
            DerefOf (\_SB.PCI0.B0D4.NPCC [One]) [Zero] = Zero
            DerefOf (\_SB.PCI0.B0D4.NPCC [One]) [One] = \MPL1 /* External reference */
            DerefOf (\_SB.PCI0.B0D4.NPCC [One]) [0x02] = CPNU (\_SB.PL11, One)
            DerefOf (\_SB.PCI0.B0D4.NPCC [One]) [0x03] = (\_SB.PLW1 * 0x03E8)
            DerefOf (\_SB.PCI0.B0D4.NPCC [One]) [0x04] = ((\_SB.PLW1 * 0x03E8
                ) + 0x0FA0)
            DerefOf (\_SB.PCI0.B0D4.NPCC [One]) [0x05] = PPSZ /* External reference */
            DerefOf (\_SB.PCI0.B0D4.NPCC [0x02]) [Zero] = One
            DerefOf (\_SB.PCI0.B0D4.NPCC [0x02]) [One] = CPNU (\_SB.PL21, One)
            DerefOf (\_SB.PCI0.B0D4.NPCC [0x02]) [0x02] = CPNU (\_SB.PL21, One)
            DerefOf (\_SB.PCI0.B0D4.NPCC [0x02]) [0x03] = Zero
            DerefOf (\_SB.PCI0.B0D4.NPCC [0x02]) [0x04] = Zero
            DerefOf (\_SB.PCI0.B0D4.NPCC [0x02]) [0x05] = PPSZ /* External reference */
        }

        Method (CPL2, 0, NotSerialized)
        {
            \_SB.PCI0.B0D4.NPCC [Zero] = 0x02
            DerefOf (\_SB.PCI0.B0D4.NPCC [One]) [Zero] = Zero
            DerefOf (\_SB.PCI0.B0D4.NPCC [One]) [One] = \MPL2 /* External reference */
            DerefOf (\_SB.PCI0.B0D4.NPCC [One]) [0x02] = CPNU (\_SB.PL12, One)
            DerefOf (\_SB.PCI0.B0D4.NPCC [One]) [0x03] = (\_SB.PLW2 * 0x03E8)
            DerefOf (\_SB.PCI0.B0D4.NPCC [One]) [0x04] = ((\_SB.PLW2 * 0x03E8
                ) + 0x0FA0)
            DerefOf (\_SB.PCI0.B0D4.NPCC [One]) [0x05] = PPSZ /* External reference */
            DerefOf (\_SB.PCI0.B0D4.NPCC [0x02]) [Zero] = One
            DerefOf (\_SB.PCI0.B0D4.NPCC [0x02]) [One] = CPNU (\_SB.PL22, One)
            DerefOf (\_SB.PCI0.B0D4.NPCC [0x02]) [0x02] = CPNU (\_SB.PL22, One)
            DerefOf (\_SB.PCI0.B0D4.NPCC [0x02]) [0x03] = Zero
            DerefOf (\_SB.PCI0.B0D4.NPCC [0x02]) [0x04] = Zero
            DerefOf (\_SB.PCI0.B0D4.NPCC [0x02]) [0x05] = PPSZ /* External reference */
        }

        Name (LSTM, Zero)
        Name (_PPC, Zero)  // _PPC: Performance Present Capabilities
        Method (SPPC, 1, Serialized)
        {
            If (CondRefOf (\_SB.CPPC))
            {
                \_SB.CPPC = Arg0
            }

            Switch (ToInteger (\TCNT))
            {
                Case (0x10)
                {
                    Notify (\_SB.PR00, 0x80) // Status Change
                    Notify (\_SB.PR01, 0x80) // Status Change
                    Notify (\_SB.PR02, 0x80) // Status Change
                    Notify (\_SB.PR03, 0x80) // Status Change
                    Notify (\_SB.PR04, 0x80) // Status Change
                    Notify (\_SB.PR05, 0x80) // Status Change
                    Notify (\_SB.PR06, 0x80) // Status Change
                    Notify (\_SB.PR07, 0x80) // Status Change
                    Notify (\_SB.PR08, 0x80) // Status Change
                    Notify (\_SB.PR09, 0x80) // Status Change
                    Notify (\_SB.PR10, 0x80) // Status Change
                    Notify (\_SB.PR11, 0x80) // Status Change
                    Notify (\_SB.PR12, 0x80) // Status Change
                    Notify (\_SB.PR13, 0x80) // Status Change
                    Notify (\_SB.PR14, 0x80) // Status Change
                    Notify (\_SB.PR15, 0x80) // Status Change
                }
                Case (0x0E)
                {
                    Notify (\_SB.PR00, 0x80) // Status Change
                    Notify (\_SB.PR01, 0x80) // Status Change
                    Notify (\_SB.PR02, 0x80) // Status Change
                    Notify (\_SB.PR03, 0x80) // Status Change
                    Notify (\_SB.PR04, 0x80) // Status Change
                    Notify (\_SB.PR05, 0x80) // Status Change
                    Notify (\_SB.PR06, 0x80) // Status Change
                    Notify (\_SB.PR07, 0x80) // Status Change
                    Notify (\_SB.PR08, 0x80) // Status Change
                    Notify (\_SB.PR09, 0x80) // Status Change
                    Notify (\_SB.PR10, 0x80) // Status Change
                    Notify (\_SB.PR11, 0x80) // Status Change
                    Notify (\_SB.PR12, 0x80) // Status Change
                    Notify (\_SB.PR13, 0x80) // Status Change
                }
                Case (0x0C)
                {
                    Notify (\_SB.PR00, 0x80) // Status Change
                    Notify (\_SB.PR01, 0x80) // Status Change
                    Notify (\_SB.PR02, 0x80) // Status Change
                    Notify (\_SB.PR03, 0x80) // Status Change
                    Notify (\_SB.PR04, 0x80) // Status Change
                    Notify (\_SB.PR05, 0x80) // Status Change
                    Notify (\_SB.PR06, 0x80) // Status Change
                    Notify (\_SB.PR07, 0x80) // Status Change
                    Notify (\_SB.PR08, 0x80) // Status Change
                    Notify (\_SB.PR09, 0x80) // Status Change
                    Notify (\_SB.PR10, 0x80) // Status Change
                    Notify (\_SB.PR11, 0x80) // Status Change
                }
                Case (0x0A)
                {
                    Notify (\_SB.PR00, 0x80) // Status Change
                    Notify (\_SB.PR01, 0x80) // Status Change
                    Notify (\_SB.PR02, 0x80) // Status Change
                    Notify (\_SB.PR03, 0x80) // Status Change
                    Notify (\_SB.PR04, 0x80) // Status Change
                    Notify (\_SB.PR05, 0x80) // Status Change
                    Notify (\_SB.PR06, 0x80) // Status Change
                    Notify (\_SB.PR07, 0x80) // Status Change
                    Notify (\_SB.PR08, 0x80) // Status Change
                    Notify (\_SB.PR09, 0x80) // Status Change
                }
                Case (0x08)
                {
                    Notify (\_SB.PR00, 0x80) // Status Change
                    Notify (\_SB.PR01, 0x80) // Status Change
                    Notify (\_SB.PR02, 0x80) // Status Change
                    Notify (\_SB.PR03, 0x80) // Status Change
                    Notify (\_SB.PR04, 0x80) // Status Change
                    Notify (\_SB.PR05, 0x80) // Status Change
                    Notify (\_SB.PR06, 0x80) // Status Change
                    Notify (\_SB.PR07, 0x80) // Status Change
                }
                Case (0x07)
                {
                    Notify (\_SB.PR00, 0x80) // Status Change
                    Notify (\_SB.PR01, 0x80) // Status Change
                    Notify (\_SB.PR02, 0x80) // Status Change
                    Notify (\_SB.PR03, 0x80) // Status Change
                    Notify (\_SB.PR04, 0x80) // Status Change
                    Notify (\_SB.PR05, 0x80) // Status Change
                    Notify (\_SB.PR06, 0x80) // Status Change
                }
                Case (0x06)
                {
                    Notify (\_SB.PR00, 0x80) // Status Change
                    Notify (\_SB.PR01, 0x80) // Status Change
                    Notify (\_SB.PR02, 0x80) // Status Change
                    Notify (\_SB.PR03, 0x80) // Status Change
                    Notify (\_SB.PR04, 0x80) // Status Change
                    Notify (\_SB.PR05, 0x80) // Status Change
                }
                Case (0x05)
                {
                    Notify (\_SB.PR00, 0x80) // Status Change
                    Notify (\_SB.PR01, 0x80) // Status Change
                    Notify (\_SB.PR02, 0x80) // Status Change
                    Notify (\_SB.PR03, 0x80) // Status Change
                    Notify (\_SB.PR04, 0x80) // Status Change
                }
                Case (0x04)
                {
                    Notify (\_SB.PR00, 0x80) // Status Change
                    Notify (\_SB.PR01, 0x80) // Status Change
                    Notify (\_SB.PR02, 0x80) // Status Change
                    Notify (\_SB.PR03, 0x80) // Status Change
                }
                Case (0x03)
                {
                    Notify (\_SB.PR00, 0x80) // Status Change
                    Notify (\_SB.PR01, 0x80) // Status Change
                    Notify (\_SB.PR02, 0x80) // Status Change
                }
                Case (0x02)
                {
                    Notify (\_SB.PR00, 0x80) // Status Change
                    Notify (\_SB.PR01, 0x80) // Status Change
                }
                Default
                {
                    Notify (\_SB.PR00, 0x80) // Status Change
                }

            }
        }

        Name (TLPO, Package (0x06)
        {
            One, 
            One, 
            Zero, 
            One, 
            One, 
            0x02
        })
        Method (CLPO, 0, NotSerialized)
        {
            TLPO [One] = LPOE /* External reference */
            If (CondRefOf (\_SB.PR00._PSS))
            {
                If ((\_SB.OSCP & 0x0400))
                {
                    Local1 = SizeOf (\_SB.PR00.TPSS)
                }
                Else
                {
                    Local1 = SizeOf (\_SB.PR00.LPSS)
                }
            }
            Else
            {
                Local1 = Zero
            }

            If ((LPOP < Local1))
            {
                TLPO [0x02] = LPOP /* External reference */
            }
            Else
            {
                Local1--
                TLPO [0x02] = Local1
            }

            TLPO [0x03] = LPOS /* External reference */
            TLPO [0x04] = LPOW /* External reference */
            TLPO [0x05] = LPER /* External reference */
            Return (TLPO) /* \_SB_.PCI0.B0D4.TLPO */
        }

        Method (SPUR, 1, NotSerialized)
        {
            If ((Arg0 <= \TCNT))
            {
                If ((\_SB.PAGD._STA () == 0x0F))
                {
                    \_SB.PAGD._PUR [One] = Arg0
                    Notify (\_SB.PAGD, 0x80) // Status Change
                }
            }
        }

        Name (AEXL, Package (0x04)
        {
            "svchost.exe", 
            "dllhost.exe", 
            "smss.exe", 
            "WinSAT.exe"
        })
        Method (PCCC, 0, Serialized)
        {
            PCCX [Zero] = One
            Switch (ToInteger (CPNU (PTDP, Zero)))
            {
                Case (0x39)
                {
                    DerefOf (PCCX [One]) [Zero] = 0xA7F8
                    DerefOf (PCCX [One]) [One] = 0x00017318
                }
                Case (0x2F)
                {
                    DerefOf (PCCX [One]) [Zero] = 0x9858
                    DerefOf (PCCX [One]) [One] = 0x00014C08
                }
                Case (0x25)
                {
                    DerefOf (PCCX [One]) [Zero] = 0x7148
                    DerefOf (PCCX [One]) [One] = 0xD6D8
                }
                Case (0x19)
                {
                    DerefOf (PCCX [One]) [Zero] = 0x3E80
                    DerefOf (PCCX [One]) [One] = 0x7D00
                }
                Case (0x0F)
                {
                    DerefOf (PCCX [One]) [Zero] = 0x36B0
                    DerefOf (PCCX [One]) [One] = 0x7D00
                }
                Case (0x0B)
                {
                    DerefOf (PCCX [One]) [Zero] = 0x36B0
                    DerefOf (PCCX [One]) [One] = 0x61A8
                }
                Default
                {
                    DerefOf (PCCX [One]) [Zero] = 0xFF
                    DerefOf (PCCX [One]) [One] = 0xFF
                }

            }

            Return (PCCX) /* \_SB_.PCI0.B0D4.PCCX */
        }

        Name (PCCX, Package (0x02)
        {
            0x80000000, 
            Package (0x02)
            {
                0x80000000, 
                0x80000000
            }
        })
        Name (KEFF, Package (0x1E)
        {
            Package (0x02)
            {
                0x01BC, 
                Zero
            }, 

            Package (0x02)
            {
                0x01CF, 
                0x27
            }, 

            Package (0x02)
            {
                0x01E1, 
                0x4B
            }, 

            Package (0x02)
            {
                0x01F3, 
                0x6C
            }, 

            Package (0x02)
            {
                0x0206, 
                0x8B
            }, 

            Package (0x02)
            {
                0x0218, 
                0xA8
            }, 

            Package (0x02)
            {
                0x022A, 
                0xC3
            }, 

            Package (0x02)
            {
                0x023D, 
                0xDD
            }, 

            Package (0x02)
            {
                0x024F, 
                0xF4
            }, 

            Package (0x02)
            {
                0x0261, 
                0x010B
            }, 

            Package (0x02)
            {
                0x0274, 
                0x011F
            }, 

            Package (0x02)
            {
                0x032C, 
                0x01BD
            }, 

            Package (0x02)
            {
                0x03D7, 
                0x0227
            }, 

            Package (0x02)
            {
                0x048B, 
                0x026D
            }, 

            Package (0x02)
            {
                0x053E, 
                0x02A1
            }, 

            Package (0x02)
            {
                0x05F7, 
                0x02C6
            }, 

            Package (0x02)
            {
                0x06A8, 
                0x02E6
            }, 

            Package (0x02)
            {
                0x075D, 
                0x02FF
            }, 

            Package (0x02)
            {
                0x0818, 
                0x0311
            }, 

            Package (0x02)
            {
                0x08CF, 
                0x0322
            }, 

            Package (0x02)
            {
                0x179C, 
                0x0381
            }, 

            Package (0x02)
            {
                0x2DDC, 
                0x039C
            }, 

            Package (0x02)
            {
                0x44A8, 
                0x039E
            }, 

            Package (0x02)
            {
                0x5C35, 
                0x0397
            }, 

            Package (0x02)
            {
                0x747D, 
                0x038D
            }, 

            Package (0x02)
            {
                0x8D7F, 
                0x0382
            }, 

            Package (0x02)
            {
                0xA768, 
                0x0376
            }, 

            Package (0x02)
            {
                0xC23B, 
                0x0369
            }, 

            Package (0x02)
            {
                0xDE26, 
                0x035A
            }, 

            Package (0x02)
            {
                0xFB7C, 
                0x034A
            }
        })
        Name (CEUP, Package (0x06)
        {
            0x80000000, 
            0x80000000, 
            0x80000000, 
            0x80000000, 
            0x80000000, 
            0x80000000
        })
        Method (XTMP, 0, Serialized)
        {
            Return (\_SB.IETM.CTOK (PCTP))
        }

        Method (_DTI, 1, NotSerialized)  // _DTI: Device Temperature Indication
        {
            LSTM = Arg0
            Notify (\_SB.PCI0.B0D4, 0x91) // Device-Specific
        }

        Method (_NTT, 0, NotSerialized)  // _NTT: Notification Temperature Threshold
        {
            Return (0x0ADE)
        }

        Name (PTYP, Zero)
        Method (_PSS, 0, NotSerialized)  // _PSS: Performance Supported States
        {
            If (CondRefOf (\_SB.PR00._PSS))
            {
                Return (\_SB.PR00._PSS ())
            }
            Else
            {
                Return (Package (0x02)
                {
                    Package (0x06)
                    {
                        Zero, 
                        Zero, 
                        Zero, 
                        Zero, 
                        Zero, 
                        Zero
                    }, 

                    Package (0x06)
                    {
                        Zero, 
                        Zero, 
                        Zero, 
                        Zero, 
                        Zero, 
                        Zero
                    }
                })
            }
        }

        Method (_TSS, 0, NotSerialized)  // _TSS: Throttling Supported States
        {
            If (CondRefOf (\_SB.PR00._TSS))
            {
                Return (\_SB.PR00._TSS ())
            }
            Else
            {
                Return (Package (0x02)
                {
                    Package (0x05)
                    {
                        Zero, 
                        Zero, 
                        Zero, 
                        Zero, 
                        Zero
                    }, 

                    Package (0x05)
                    {
                        Zero, 
                        Zero, 
                        Zero, 
                        Zero, 
                        Zero
                    }
                })
            }
        }

        Method (_TPC, 0, NotSerialized)  // _TPC: Throttling Present Capabilities
        {
            If (CondRefOf (\_SB.PR00._TPC))
            {
                Return (\_SB.PR00._TPC) /* External reference */
            }
            Else
            {
                Return (Zero)
            }
        }

        Method (_PTC, 0, NotSerialized)  // _PTC: Processor Throttling Control
        {
            If ((CondRefOf (\PC00) && (\PC00 != 0x80000000)))
            {
                If ((\PC00 & 0x04))
                {
                    Return (Package (0x02)
                    {
                        ResourceTemplate ()
                        {
                            Register (FFixedHW, 
                                0x00,               // Bit Width
                                0x00,               // Bit Offset
                                0x0000000000000000, // Address
                                ,)
                        }, 

                        ResourceTemplate ()
                        {
                            Register (FFixedHW, 
                                0x00,               // Bit Width
                                0x00,               // Bit Offset
                                0x0000000000000000, // Address
                                ,)
                        }
                    })
                }
                Else
                {
                    Return (Package (0x02)
                    {
                        ResourceTemplate ()
                        {
                            Register (SystemIO, 
                                0x05,               // Bit Width
                                0x00,               // Bit Offset
                                0x0000000000001810, // Address
                                ,)
                        }, 

                        ResourceTemplate ()
                        {
                            Register (SystemIO, 
                                0x05,               // Bit Width
                                0x00,               // Bit Offset
                                0x0000000000001810, // Address
                                ,)
                        }
                    })
                }
            }
            Else
            {
                Return (Package (0x02)
                {
                    ResourceTemplate ()
                    {
                        Register (FFixedHW, 
                            0x00,               // Bit Width
                            0x00,               // Bit Offset
                            0x0000000000000000, // Address
                            ,)
                    }, 

                    ResourceTemplate ()
                    {
                        Register (FFixedHW, 
                            0x00,               // Bit Width
                            0x00,               // Bit Offset
                            0x0000000000000000, // Address
                            ,)
                    }
                })
            }
        }

        Method (_TSD, 0, NotSerialized)  // _TSD: Throttling State Dependencies
        {
            If (CondRefOf (\_SB.PR00._TSD))
            {
                Return (\_SB.PR00._TSD ())
            }
            Else
            {
                Return (Package (0x02)
                {
                    Package (0x05)
                    {
                        0x05, 
                        Zero, 
                        Zero, 
                        Zero, 
                        Zero
                    }, 

                    Package (0x05)
                    {
                        0x05, 
                        Zero, 
                        Zero, 
                        Zero, 
                        Zero
                    }
                })
            }
        }

        Method (_TDL, 0, NotSerialized)  // _TDL: T-State Depth Limit
        {
            If ((CondRefOf (\_SB.PR00._TSS) && CondRefOf (\_SB.CFGD)))
            {
                If ((\_SB.CFGD & 0x2000))
                {
                    Return ((SizeOf (\_SB.PR00.TSMF) - One))
                }
                Else
                {
                    Return ((SizeOf (\_SB.PR00.TSMC) - One))
                }
            }
            Else
            {
                Return (Zero)
            }
        }

        Method (_PDL, 0, NotSerialized)  // _PDL: P-state Depth Limit
        {
            If (CondRefOf (\_SB.PR00._PSS))
            {
                If ((\_SB.OSCP & 0x0400))
                {
                    Return ((SizeOf (\_SB.PR00.TPSS) - One))
                }
                Else
                {
                    Return ((SizeOf (\_SB.PR00.LPSS) - One))
                }
            }
            Else
            {
                Return (Zero)
            }
        }

        Method (_TSP, 0, Serialized)  // _TSP: Thermal Sampling Period
        {
            Return (\CPUS) /* External reference */
        }

        Method (_AC0, 0, Serialized)  // _ACx: Active Cooling, x=0-9
        {
            If ((\ATMC == Zero))
            {
                Return (0xFFFFFFFF)
            }

            Local1 = \_SB.IETM.CTOK (\ATMC)
            If ((LSTM >= Local1))
            {
                Return ((Local1 - 0x14))
            }
            Else
            {
                Return (Local1)
            }
        }

        Method (_AC1, 0, Serialized)  // _ACx: Active Cooling, x=0-9
        {
            If ((\ATMC == Zero))
            {
                Return (0xFFFFFFFF)
            }

            Local0 = \_SB.IETM.CTOK (\ATMC)
            Local0 -= 0x32
            If ((LSTM >= Local0))
            {
                Return ((Local0 - 0x14))
            }
            Else
            {
                Return (Local0)
            }
        }

        Method (_AC2, 0, Serialized)  // _ACx: Active Cooling, x=0-9
        {
            If ((\ATMC == Zero))
            {
                Return (0xFFFFFFFF)
            }

            Local0 = \_SB.IETM.CTOK (\ATMC)
            Local0 -= 0x64
            If ((LSTM >= Local0))
            {
                Return ((Local0 - 0x14))
            }
            Else
            {
                Return (Local0)
            }
        }

        Method (_AC3, 0, Serialized)  // _ACx: Active Cooling, x=0-9
        {
            If ((\ATMC == Zero))
            {
                Return (0xFFFFFFFF)
            }

            Local0 = \_SB.IETM.CTOK (\ATMC)
            Local0 -= 0x96
            If ((LSTM >= Local0))
            {
                Return ((Local0 - 0x14))
            }
            Else
            {
                Return (Local0)
            }
        }

        Method (_AC4, 0, Serialized)  // _ACx: Active Cooling, x=0-9
        {
            If ((\ATMC == Zero))
            {
                Return (0xFFFFFFFF)
            }

            Local0 = \_SB.IETM.CTOK (\ATMC)
            Local0 -= 0xC8
            If ((LSTM >= Local0))
            {
                Return ((Local0 - 0x14))
            }
            Else
            {
                Return (Local0)
            }
        }

        Method (_PSV, 0, Serialized)  // _PSV: Passive Temperature
        {
            If ((\PTMC == Zero))
            {
                Return (0xFFFFFFFF)
            }

            Return (\_SB.IETM.CTOK (\PTMC))
        }

        Method (_CRT, 0, Serialized)  // _CRT: Critical Temperature
        {
            If ((\SACT == Zero))
            {
                Return (0xFFFFFFFF)
            }

            Return (\_SB.IETM.CTOK (\SACT))
        }

        Method (_CR3, 0, Serialized)  // _CR3: Warm/Standby Temperature
        {
            If ((\SAC3 == Zero))
            {
                Return (0xFFFFFFFF)
            }

            Return (\_SB.IETM.CTOK (\SAC3))
        }

        Method (_HOT, 0, Serialized)  // _HOT: Hot Temperature
        {
            If ((\SAHT == Zero))
            {
                Return (0xFFFFFFFF)
            }

            Return (\_SB.IETM.CTOK (\SAHT))
        }
    }

    Scope (\_SB.IETM)
    {
        Name (CTSP, Package (0x01)
        {
            ToUUID ("e145970a-e4c1-4d73-900e-c9c5a69dd067") /* Unknown UUID */
        })
    }

    Scope (\_SB.PCI0.B0D4)
    {
        Method (TDPL, 0, Serialized)
        {
            Name (AAAA, Zero)
            Name (BBBB, Zero)
            Name (CCCC, Zero)
            Local0 = CTNL /* \_SB_.PCI0.B0D4.CTNL */
            If (((Local0 == One) || (Local0 == 0x02)))
            {
                Local0 = \_SB.CLVL /* External reference */
            }
            Else
            {
                Return (Package (0x01)
                {
                    Zero
                })
            }

            If ((CLCK == One))
            {
                Local0 = One
            }

            AAAA = CPNU (\_SB.PL10, One)
            BBBB = CPNU (\_SB.PL11, One)
            CCCC = CPNU (\_SB.PL12, One)
            Name (TMP1, Package (0x01)
            {
                Package (0x05)
                {
                    0x80000000, 
                    0x80000000, 
                    0x80000000, 
                    0x80000000, 
                    0x80000000
                }
            })
            Name (TMP2, Package (0x02)
            {
                Package (0x05)
                {
                    0x80000000, 
                    0x80000000, 
                    0x80000000, 
                    0x80000000, 
                    0x80000000
                }, 

                Package (0x05)
                {
                    0x80000000, 
                    0x80000000, 
                    0x80000000, 
                    0x80000000, 
                    0x80000000
                }
            })
            Name (TMP3, Package (0x03)
            {
                Package (0x05)
                {
                    0x80000000, 
                    0x80000000, 
                    0x80000000, 
                    0x80000000, 
                    0x80000000
                }, 

                Package (0x05)
                {
                    0x80000000, 
                    0x80000000, 
                    0x80000000, 
                    0x80000000, 
                    0x80000000
                }, 

                Package (0x05)
                {
                    0x80000000, 
                    0x80000000, 
                    0x80000000, 
                    0x80000000, 
                    0x80000000
                }
            })
            If ((Local0 == 0x03))
            {
                If ((AAAA > BBBB))
                {
                    If ((AAAA > CCCC))
                    {
                        If ((BBBB > CCCC))
                        {
                            Local3 = Zero
                            LEV0 = Zero
                            Local4 = One
                            LEV1 = One
                            Local5 = 0x02
                            LEV2 = 0x02
                        }
                        Else
                        {
                            Local3 = Zero
                            LEV0 = Zero
                            Local5 = One
                            LEV1 = 0x02
                            Local4 = 0x02
                            LEV2 = One
                        }
                    }
                    Else
                    {
                        Local5 = Zero
                        LEV0 = 0x02
                        Local3 = One
                        LEV1 = Zero
                        Local4 = 0x02
                        LEV2 = One
                    }
                }
                ElseIf ((BBBB > CCCC))
                {
                    If ((AAAA > CCCC))
                    {
                        Local4 = Zero
                        LEV0 = One
                        Local3 = One
                        LEV1 = Zero
                        Local5 = 0x02
                        LEV2 = 0x02
                    }
                    Else
                    {
                        Local4 = Zero
                        LEV0 = One
                        Local5 = One
                        LEV1 = 0x02
                        Local3 = 0x02
                        LEV2 = Zero
                    }
                }
                Else
                {
                    Local5 = Zero
                    LEV0 = 0x02
                    Local4 = One
                    LEV1 = One
                    Local3 = 0x02
                    LEV2 = Zero
                }

                Local1 = (\_SB.TAR0 + One)
                Local2 = (Local1 * 0x64)
                DerefOf (TMP3 [Local3]) [Zero] = AAAA /* \_SB_.PCI0.B0D4.TDPL.AAAA */
                DerefOf (TMP3 [Local3]) [One] = Local2
                DerefOf (TMP3 [Local3]) [0x02] = \_SB.CTC0 /* External reference */
                DerefOf (TMP3 [Local3]) [0x03] = Local1
                DerefOf (TMP3 [Local3]) [0x04] = Zero
                Local1 = (\_SB.TAR1 + One)
                Local2 = (Local1 * 0x64)
                DerefOf (TMP3 [Local4]) [Zero] = BBBB /* \_SB_.PCI0.B0D4.TDPL.BBBB */
                DerefOf (TMP3 [Local4]) [One] = Local2
                DerefOf (TMP3 [Local4]) [0x02] = \_SB.CTC1 /* External reference */
                DerefOf (TMP3 [Local4]) [0x03] = Local1
                DerefOf (TMP3 [Local4]) [0x04] = Zero
                Local1 = (\_SB.TAR2 + One)
                Local2 = (Local1 * 0x64)
                DerefOf (TMP3 [Local5]) [Zero] = CCCC /* \_SB_.PCI0.B0D4.TDPL.CCCC */
                DerefOf (TMP3 [Local5]) [One] = Local2
                DerefOf (TMP3 [Local5]) [0x02] = \_SB.CTC2 /* External reference */
                DerefOf (TMP3 [Local5]) [0x03] = Local1
                DerefOf (TMP3 [Local5]) [0x04] = Zero
                Return (TMP3) /* \_SB_.PCI0.B0D4.TDPL.TMP3 */
            }

            If ((Local0 == 0x02))
            {
                If ((AAAA > BBBB))
                {
                    Local3 = Zero
                    Local4 = One
                    LEV0 = Zero
                    LEV1 = One
                    LEV2 = Zero
                }
                Else
                {
                    Local4 = Zero
                    Local3 = One
                    LEV0 = One
                    LEV1 = Zero
                    LEV2 = Zero
                }

                Local1 = (\_SB.TAR0 + One)
                Local2 = (Local1 * 0x64)
                DerefOf (TMP2 [Local3]) [Zero] = AAAA /* \_SB_.PCI0.B0D4.TDPL.AAAA */
                DerefOf (TMP2 [Local3]) [One] = Local2
                DerefOf (TMP2 [Local3]) [0x02] = \_SB.CTC0 /* External reference */
                DerefOf (TMP2 [Local3]) [0x03] = Local1
                DerefOf (TMP2 [Local3]) [0x04] = Zero
                Local1 = (\_SB.TAR1 + One)
                Local2 = (Local1 * 0x64)
                DerefOf (TMP2 [Local4]) [Zero] = BBBB /* \_SB_.PCI0.B0D4.TDPL.BBBB */
                DerefOf (TMP2 [Local4]) [One] = Local2
                DerefOf (TMP2 [Local4]) [0x02] = \_SB.CTC1 /* External reference */
                DerefOf (TMP2 [Local4]) [0x03] = Local1
                DerefOf (TMP2 [Local4]) [0x04] = Zero
                Return (TMP2) /* \_SB_.PCI0.B0D4.TDPL.TMP2 */
            }

            If ((Local0 == One))
            {
                Switch (ToInteger (\_SB.CBMI))
                {
                    Case (Zero)
                    {
                        Local1 = (\_SB.TAR0 + One)
                        Local2 = (Local1 * 0x64)
                        DerefOf (TMP1 [Zero]) [Zero] = AAAA /* \_SB_.PCI0.B0D4.TDPL.AAAA */
                        DerefOf (TMP1 [Zero]) [One] = Local2
                        DerefOf (TMP1 [Zero]) [0x02] = \_SB.CTC0 /* External reference */
                        DerefOf (TMP1 [Zero]) [0x03] = Local1
                        DerefOf (TMP1 [Zero]) [0x04] = Zero
                        LEV0 = Zero
                        LEV1 = Zero
                        LEV2 = Zero
                    }
                    Case (One)
                    {
                        Local1 = (\_SB.TAR1 + One)
                        Local2 = (Local1 * 0x64)
                        DerefOf (TMP1 [Zero]) [Zero] = BBBB /* \_SB_.PCI0.B0D4.TDPL.BBBB */
                        DerefOf (TMP1 [Zero]) [One] = Local2
                        DerefOf (TMP1 [Zero]) [0x02] = \_SB.CTC1 /* External reference */
                        DerefOf (TMP1 [Zero]) [0x03] = Local1
                        DerefOf (TMP1 [Zero]) [0x04] = Zero
                        LEV0 = One
                        LEV1 = One
                        LEV2 = One
                    }
                    Case (0x02)
                    {
                        Local1 = (\_SB.TAR2 + One)
                        Local2 = (Local1 * 0x64)
                        DerefOf (TMP1 [Zero]) [Zero] = CCCC /* \_SB_.PCI0.B0D4.TDPL.CCCC */
                        DerefOf (TMP1 [Zero]) [One] = Local2
                        DerefOf (TMP1 [Zero]) [0x02] = \_SB.CTC2 /* External reference */
                        DerefOf (TMP1 [Zero]) [0x03] = Local1
                        DerefOf (TMP1 [Zero]) [0x04] = Zero
                        LEV0 = 0x02
                        LEV1 = 0x02
                        LEV2 = 0x02
                    }

                }

                Return (TMP1) /* \_SB_.PCI0.B0D4.TDPL.TMP1 */
            }

            Return (Zero)
        }

        Name (MAXT, Zero)
        Method (TDPC, 0, NotSerialized)
        {
            Return (MAXT) /* \_SB_.PCI0.B0D4.MAXT */
        }

        Name (LEV0, Zero)
        Name (LEV1, Zero)
        Name (LEV2, Zero)
        Method (STDP, 1, Serialized)
        {
            If ((Arg0 >= \_SB.CLVL))
            {
                Return (Zero)
            }

            Switch (ToInteger (Arg0))
            {
                Case (Zero)
                {
                    Local0 = LEV0 /* \_SB_.PCI0.B0D4.LEV0 */
                }
                Case (One)
                {
                    Local0 = LEV1 /* \_SB_.PCI0.B0D4.LEV1 */
                }
                Case (0x02)
                {
                    Local0 = LEV2 /* \_SB_.PCI0.B0D4.LEV2 */
                }

            }

            Switch (ToInteger (Local0))
            {
                Case (Zero)
                {
                    CPL0 ()
                }
                Case (One)
                {
                    CPL1 ()
                }
                Case (0x02)
                {
                    CPL2 ()
                }

            }

            Notify (\_SB.PCI0.B0D4, 0x83) // Device-Specific Change
        }
    }

    Scope (\_SB.PCI0.LPCB.H_EC)
    {
        Device (TFN1)
        {
            Name (_HID, EisaId ("INT3404"))  // _HID: Hardware ID
            Name (_UID, "TFN1")  // _UID: Unique ID
            Name (_STR, Unicode ("Fan 1"))  // _STR: Description String
            Name (PTYP, 0x04)
            Name (FON, One)
            Name (PFLG, Zero)
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If ((FND1 == One))
                {
                    Return (0x0F)
                }
                Else
                {
                    Return (Zero)
                }
            }

            Method (_FIF, 0, NotSerialized)  // _FIF: Fan Information
            {
                Return (Package (0x04)
                {
                    Zero, 
                    One, 
                    0x02, 
                    Zero
                })
            }

            Method (_FPS, 0, NotSerialized)  // _FPS: Fan Performance States
            {
                Return (Package (0x0E)
                {
                    Zero, 
                    Package (0x05)
                    {
                        0x64, 
                        0xFFFFFFFF, 
                        0x3A98, 
                        0x01F4, 
                        0x1388
                    }, 

                    Package (0x05)
                    {
                        0x5F, 
                        0xFFFFFFFF, 
                        0x39D0, 
                        0x01DB, 
                        0x128E
                    }, 

                    Package (0x05)
                    {
                        0x5A, 
                        0xFFFFFFFF, 
                        0x33F4, 
                        0x01C2, 
                        0x1194
                    }, 

                    Package (0x05)
                    {
                        0x55, 
                        0xFFFFFFFF, 
                        0x319C, 
                        0x01A9, 
                        0x109A
                    }, 

                    Package (0x05)
                    {
                        0x50, 
                        0xFFFFFFFF, 
                        0x2EE0, 
                        0x0190, 
                        0x0FA0
                    }, 

                    Package (0x05)
                    {
                        0x4B, 
                        0xFFFFFFFF, 
                        0x2BC0, 
                        0x0177, 
                        0x0EA6
                    }, 

                    Package (0x05)
                    {
                        0x46, 
                        0xFFFFFFFF, 
                        0x2904, 
                        0x015E, 
                        0x0DAC
                    }, 

                    Package (0x05)
                    {
                        0x3C, 
                        0xFFFFFFFF, 
                        0x238C, 
                        0x012C, 
                        0x0BB8
                    }, 

                    Package (0x05)
                    {
                        0x32, 
                        0xFFFFFFFF, 
                        0x1D4C, 
                        0xFA, 
                        0x09C4
                    }, 

                    Package (0x05)
                    {
                        0x28, 
                        0xFFFFFFFF, 
                        0x1770, 
                        0xC8, 
                        0x07D0
                    }, 

                    Package (0x05)
                    {
                        0x1E, 
                        0xFFFFFFFF, 
                        0x1004, 
                        0x96, 
                        0x05DC
                    }, 

                    Package (0x05)
                    {
                        0x19, 
                        0xFFFFFFFF, 
                        0x0C80, 
                        0x7D, 
                        0x04E2
                    }, 

                    Package (0x05)
                    {
                        Zero, 
                        0xFFFFFFFF, 
                        Zero, 
                        Zero, 
                        Zero
                    }
                })
            }

            Method (_FSL, 1, Serialized)  // _FSL: Fan Set Level
            {
                If (\_SB.PCI0.LPCB.H_EC.ECAV)
                {
                    If ((Arg0 != \_SB.PCI0.LPCB.H_EC.ECRD (RefOf (\_SB.PCI0.LPCB.H_EC.PENV))))
                    {
                        \_SB.PCI0.LPCB.H_EC.ECWT (Zero, RefOf (\_SB.PCI0.LPCB.H_EC.PPSL))
                        \_SB.PCI0.LPCB.H_EC.ECWT (Zero, RefOf (\_SB.PCI0.LPCB.H_EC.PPSH))
                        \_SB.PCI0.LPCB.H_EC.ECWT (\_SB.PCI0.LPCB.H_EC.ECRD (RefOf (\_SB.PCI0.LPCB.H_EC.PENS)), RefOf (\_SB.PCI0.LPCB.H_EC.PINV))
                        \_SB.PCI0.LPCB.H_EC.ECWT (Arg0, RefOf (\_SB.PCI0.LPCB.H_EC.PENV))
                        \_SB.PCI0.LPCB.H_EC.ECWT (0x14, RefOf (\_SB.PCI0.LPCB.H_EC.PSTP))
                        \_SB.PCI0.LPCB.H_EC.ECMD (0x1A)
                    }
                }
            }

            Name (TFST, Package (0x03)
            {
                Zero, 
                0xFFFFFFFF, 
                0xFFFFFFFF
            })
            Method (_FST, 0, Serialized)  // _FST: Fan Status
            {
                If (\_SB.PCI0.LPCB.H_EC.ECAV)
                {
                    TFST [One] = \_SB.PCI0.LPCB.H_EC.ECRD (RefOf (\_SB.PCI0.LPCB.H_EC.PENV))
                    TFST [0x02] = \_SB.PCI0.LPCB.H_EC.ECRD (RefOf (\_SB.PCI0.LPCB.H_EC.CFSP))
                }

                Return (TFST) /* \_SB_.PCI0.LPCB.H_EC.TFN1.TFST */
            }
        }
    }

    Scope (\_SB.PCI0)
    {
        Device (DPLY)
        {
            Name (_HID, EisaId ("INT3406") /* Intel Dynamic Platform & Thermal Framework Display Participant */)  // _HID: Hardware ID
            Name (_UID, "DPLY")  // _UID: Unique ID
            Name (_STR, Unicode ("Display"))  // _STR: Description String
            Name (PTYP, 0x0A)
            Name (PFLG, Zero)
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If ((DISE == One))
                {
                    Return (0x0F)
                }
                Else
                {
                    Return (Zero)
                }
            }

            Method (DDDL, 0, NotSerialized)
            {
                Return (\DPLL) /* External reference */
            }

            Method (DDPC, 0, NotSerialized)
            {
                Return (\DPHL) /* External reference */
            }

            Method (_BCL, 0, NotSerialized)  // _BCL: Brightness Control Levels
            {
                If (CondRefOf (\_SB.PCI0.GFX0.DD1F._BCL))
                {
                    Return (\_SB.PCI0.GFX0.DD1F._BCL ())
                }
                Else
                {
                    Return (Package (0x01)
                    {
                        Zero
                    })
                }
            }

            Method (_BCM, 1, NotSerialized)  // _BCM: Brightness Control Method
            {
                If (CondRefOf (\_SB.PCI0.GFX0.DD1F._BCM))
                {
                    \_SB.PCI0.GFX0.DD1F._BCM (Arg0)
                }
            }

            Method (_BQC, 0, NotSerialized)  // _BQC: Brightness Query Current
            {
                If (CondRefOf (\_SB.PCI0.GFX0.DD1F._BQC))
                {
                    Return (\_SB.PCI0.GFX0.DD1F._BQC ())
                }
                Else
                {
                    Return (Zero)
                }
            }

            Method (_DCS, 0, NotSerialized)  // _DCS: Display Current Status
            {
                If (CondRefOf (\_SB.PCI0.GFX0.DD1F._DCS))
                {
                    Return (\_SB.PCI0.GFX0.DD1F._DCS ())
                }
                Else
                {
                    Return (Zero)
                }
            }
        }
    }

    Scope (\_SB)
    {
        Device (TPWR)
        {
            Name (_HID, EisaId ("INT3407") /* DPTF Platform Power Meter */)  // _HID: Hardware ID
            Name (_UID, "TPWR")  // _UID: Unique ID
            Name (_STR, Unicode ("Platform Power"))  // _STR: Description String
            Name (PTYP, 0x11)
            Name (PFLG, Zero)
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If ((\PWRE == One))
                {
                    Return (0x0F)
                }
                Else
                {
                    Return (Zero)
                }
            }

            Method (_BST, 0, NotSerialized)  // _BST: Battery Status
            {
                If (CondRefOf (\_SB.PCI0.LPCB.H_EC.BAT1._BST))
                {
                    Return (\_SB.PCI0.LPCB.H_EC.BAT1._BST ())
                }
                Else
                {
                    Return (Package (0x04)
                    {
                        Zero, 
                        Zero, 
                        Zero, 
                        Zero
                    })
                }
            }

            Method (_BIX, 0, NotSerialized)  // _BIX: Battery Information Extended
            {
                If (CondRefOf (\_SB.PCI0.LPCB.H_EC.BAT1._BIX))
                {
                    Return (\_SB.PCI0.LPCB.H_EC.BAT1._BIX ())
                }
                Else
                {
                    Return (Package (0x14)
                    {
                        Zero, 
                        Zero, 
                        Zero, 
                        Zero, 
                        Zero, 
                        Zero, 
                        Zero, 
                        Zero, 
                        Zero, 
                        Zero, 
                        Zero, 
                        Zero, 
                        Zero, 
                        Zero, 
                        Zero, 
                        Zero, 
                        "0", 
                        "0", 
                        "0", 
                        "0"
                    })
                }
            }

            Method (PSOC, 0, NotSerialized)
            {
                If ((\_SB.PCI0.LPCB.H_EC.ECAV == Zero))
                {
                    Return (Zero)
                }

                If ((\_SB.PCI0.LPCB.H_EC.ECRD (RefOf (\_SB.PCI0.LPCB.H_EC.B1FC)) == Zero))
                {
                    Return (Zero)
                }

                If ((\_SB.PCI0.LPCB.H_EC.ECRD (RefOf (\_SB.PCI0.LPCB.H_EC.B1RC)) > \_SB.PCI0.LPCB.H_EC.ECRD (RefOf (\_SB.PCI0.LPCB.H_EC.B1FC))))
                {
                    Return (Zero)
                }

                If ((\_SB.PCI0.LPCB.H_EC.ECRD (RefOf (\_SB.PCI0.LPCB.H_EC.B1RC)) == \_SB.PCI0.LPCB.H_EC.ECRD (RefOf (\_SB.PCI0.LPCB.H_EC.B1FC))))
                {
                    Return (0x64)
                }

                If ((\_SB.PCI0.LPCB.H_EC.ECRD (RefOf (\_SB.PCI0.LPCB.H_EC.B1RC)) < \_SB.PCI0.LPCB.H_EC.ECRD (RefOf (\_SB.PCI0.LPCB.H_EC.B1FC))))
                {
                    Local0 = (\_SB.PCI0.LPCB.H_EC.ECRD (RefOf (\_SB.PCI0.LPCB.H_EC.B1RC)) * 0x64)
                    Divide (Local0, \_SB.PCI0.LPCB.H_EC.ECRD (RefOf (\_SB.PCI0.LPCB.H_EC.B1FC)), Local2, Local1)
                    Local2 /= 0x64
                    Local3 = (\_SB.PCI0.LPCB.H_EC.ECRD (RefOf (\_SB.PCI0.LPCB.H_EC.B1FC)) / 0xC8)
                    If ((Local2 >= Local3))
                    {
                        Local1 += One
                    }

                    Return (Local1)
                }
                Else
                {
                    Return (Zero)
                }
            }

            Method (PMAX, 0, Serialized)
            {
                If ((\_SB.PCI0.LPCB.H_EC.ECAV == One))
                {
                    Local0 = \_SB.PCI0.LPCB.H_EC.ECRD (RefOf (\_SB.PCI0.LPCB.H_EC.BMAX))
                    If (Local0)
                    {
                        Local0 = ~Local0 |= 0xFFFF0000
                        Local0 = (Local0 += One * 0x0A)
                    }

                    Return (Local0)
                }
                Else
                {
                    Return (Zero)
                }
            }

            Method (NPWR, 0, NotSerialized)
            {
                If ((\_SB.PCI0.LPCB.H_EC.ECAV == One))
                {
                    Return (\_SB.PCI0.LPCB.H_EC.NPWR) /* External reference */
                }
                Else
                {
                    Return (0x4E20)
                }
            }

            Method (PSRC, 0, Serialized)
            {
                ADBG ("PSRC")
                If ((\_SB.PCI0.LPCB.H_EC.ECAV == Zero))
                {
                    ADBG ("ECAV 0")
                    Return (Zero)
                }
                Else
                {
                    Local0 = \_SB.PCI0.LPCB.H_EC.ECRD (RefOf (\_SB.PCI0.LPCB.H_EC.PWRT))
                    Local1 = (Local0 & 0xF0)
                }

                Switch (ToInteger ((ToInteger (Local0) & 0x07)))
                {
                    Case (Zero)
                    {
                        ADBG ("DC")
                        Local1 |= Zero
                    }
                    Case (One)
                    {
                        ADBG ("AC")
                        Local1 |= One
                    }
                    Case (0x02)
                    {
                        ADBG ("PD")
                        Local1 |= 0x02
                    }
                    Default
                    {
                        ADBG ("Default DC")
                        Local1 |= Zero
                    }

                }

                Return (Local1)
            }

            Method (ARTG, 0, NotSerialized)
            {
                If (((PSRC () & 0x07) == One))
                {
                    If ((\_SB.PCI0.LPCB.H_EC.ECAV == One))
                    {
                        Local0 = (\_SB.PCI0.LPCB.H_EC.ARTG * 0x0A)
                        Return (Local0)
                    }
                    Else
                    {
                        Return (0x00015F90)
                    }
                }
                Else
                {
                    Return (Zero)
                }
            }

            Method (LSOC, 0, NotSerialized)
            {
                If ((\_SB.PCI0.LPCB.H_EC.ECAV == One))
                {
                    Return (\_SB.PCI0.LPCB.H_EC.LSOC) /* External reference */
                }
                Else
                {
                    Return (0x32)
                }
            }

            Method (CTYP, 0, NotSerialized)
            {
                If ((\_SB.PCI0.LPCB.H_EC.ECAV == One))
                {
                    Return (\_SB.PCI0.LPCB.H_EC.CTYP) /* External reference */
                }
                Else
                {
                    Return (0x03)
                }
            }

            Method (PROP, 0, NotSerialized)
            {
                If ((\_SB.PCI0.LPCB.H_EC.ECAV == One))
                {
                    Local0 = (\_SB.PCI0.LPCB.H_EC.PROP * 0x03E8)
                    Return (Local0)
                }
                Else
                {
                    Return (0x61A8)
                }
            }

            Method (APKP, 0, NotSerialized)
            {
                If ((\_SB.PCI0.LPCB.H_EC.ECAV == One))
                {
                    Return (\_SB.PCI0.LPCB.H_EC.APKP) /* External reference */
                }
                Else
                {
                    Return (0x00015F90)
                }
            }

            Method (APKT, 0, NotSerialized)
            {
                If ((\_SB.PCI0.LPCB.H_EC.ECAV == One))
                {
                    Return (\_SB.PCI0.LPCB.H_EC.APKT) /* External reference */
                }
                Else
                {
                    Return (0x0A)
                }
            }

            Method (PBSS, 0, NotSerialized)
            {
                If ((\_SB.PCI0.LPCB.H_EC.ECAV == One))
                {
                    Local0 = \_SB.PCI0.LPCB.H_EC.ECRD (RefOf (\_SB.PCI0.LPCB.H_EC.PBSS))
                    Return (Local0)
                }

                Return (0x64)
            }

            Method (DPSP, 0, Serialized)
            {
                Return (\PPPR) /* External reference */
            }

            Method (AVOL, 0, Serialized)
            {
                If ((\_SB.PCI0.LPCB.H_EC.ECAV == One))
                {
                    Return (\_SB.PCI0.LPCB.H_EC.AVOL) /* External reference */
                }
                Else
                {
                    Return (Zero)
                }
            }

            Method (ACUR, 0, Serialized)
            {
                If ((\_SB.PCI0.LPCB.H_EC.ECAV == One))
                {
                    Return (\_SB.PCI0.LPCB.H_EC.ACUR) /* External reference */
                }
                Else
                {
                    Return (Zero)
                }
            }

            Method (AP01, 0, Serialized)
            {
                If ((\_SB.PCI0.LPCB.H_EC.ECAV == One))
                {
                    Return (\_SB.PCI0.LPCB.H_EC.AP01) /* External reference */
                }
                Else
                {
                    Return (Zero)
                }
            }

            Method (AP02, 0, Serialized)
            {
                If ((\_SB.PCI0.LPCB.H_EC.ECAV == One))
                {
                    Return (\_SB.PCI0.LPCB.H_EC.AP02) /* External reference */
                }
                Else
                {
                    Return (Zero)
                }
            }

            Method (AP10, 0, Serialized)
            {
                If ((\_SB.PCI0.LPCB.H_EC.ECAV == One))
                {
                    Return (\_SB.PCI0.LPCB.H_EC.AP10) /* External reference */
                }
                Else
                {
                    Return (Zero)
                }
            }

            Method (PBOK, 1, Serialized)
            {
                If ((\_SB.PCI0.LPCB.H_EC.ECAV == One))
                {
                    Local0 = (Arg0 & 0x0F)
                    \_SB.PCI0.LPCB.H_EC.ECWT (Local0, RefOf (\_SB.PCI0.LPCB.H_EC.PBOK))
                    \_SB.PCI0.LPCB.H_EC.ECMD (0x15)
                }
            }
        }
    }

    Scope (\_SB)
    {
        Device (WRLS)
        {
            Name (_HID, EisaId ("INT3408"))  // _HID: Hardware ID
            Name (_UID, "WRLS")  // _UID: Unique ID
            Name (_STR, Unicode ("Wireless WiFi, WiGig"))  // _STR: Description String
            Name (PTYP, 0x07)
            Name (CTYP, Zero)
            Name (PFLG, Zero)
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If ((\WRFD == One))
                {
                    Return (0x0F)
                }
                Else
                {
                    Return (Zero)
                }
            }

            Name (GTSH, 0x14)
            Name (LSTM, Zero)
            Method (_DTI, 1, NotSerialized)  // _DTI: Device Temperature Indication
            {
                LSTM = Arg0
                Notify (\_SB.WRLS, 0x91) // Device-Specific
            }

            Method (_NTT, 0, NotSerialized)  // _NTT: Notification Temperature Threshold
            {
                Return (0x0ADE)
            }

            Method (_TSP, 0, Serialized)  // _TSP: Thermal Sampling Period
            {
                Return (\WTSP) /* External reference */
            }

            Method (_AC0, 0, Serialized)  // _ACx: Active Cooling, x=0-9
            {
                If (CTYP)
                {
                    If ((\WRPT == Zero))
                    {
                        Return (0xFFFFFFFF)
                    }

                    Local1 = \_SB.IETM.CTOK (\WRPT)
                }
                Else
                {
                    If ((\WRAT == Zero))
                    {
                        Return (0xFFFFFFFF)
                    }

                    Local1 = \_SB.IETM.CTOK (\WRAT)
                }

                If ((LSTM >= Local1))
                {
                    Return ((Local1 - GTSH))
                }
                Else
                {
                    Return (Local1)
                }
            }

            Method (_PSV, 0, Serialized)  // _PSV: Passive Temperature
            {
                If (CTYP)
                {
                    If ((\WRAT == Zero))
                    {
                        Return (0xFFFFFFFF)
                    }

                    Return (\_SB.IETM.CTOK (\WRAT))
                }
                Else
                {
                    If ((\WRPT == Zero))
                    {
                        Return (0xFFFFFFFF)
                    }

                    Return (\_SB.IETM.CTOK (\WRPT))
                }
            }

            Method (_CRT, 0, Serialized)  // _CRT: Critical Temperature
            {
                If ((\WRCT == Zero))
                {
                    Return (0xFFFFFFFF)
                }

                Return (\_SB.IETM.CTOK (\WRCT))
            }

            Method (_CR3, 0, Serialized)  // _CR3: Warm/Standby Temperature
            {
                If ((\WLC3 == Zero))
                {
                    Return (0xFFFFFFFF)
                }

                Return (\_SB.IETM.CTOK (\WLC3))
            }

            Method (_HOT, 0, Serialized)  // _HOT: Hot Temperature
            {
                If ((\WRHT == Zero))
                {
                    Return (0xFFFFFFFF)
                }

                Return (\_SB.IETM.CTOK (\WRHT))
            }
        }
    }

    Scope (\_SB)
    {
        Device (STG1)
        {
            Name (_HID, EisaId ("INT340A"))  // _HID: Hardware ID
            Name (_UID, "STG1")  // _UID: Unique ID
            Name (_STR, Unicode ("Storage Participant1"))  // _STR: Description String
            Name (PTYP, 0x1D)
            Name (CTYP, Zero)
            Name (PFLG, Zero)
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (\SGE1)
                {
                    Return (0x0F)
                }
                Else
                {
                    Return (Zero)
                }
            }

            Method (PPCC, 0, Serialized)
            {
                Return (NPCC) /* \_SB_.STG1.NPCC */
            }

            Name (NPCC, Package (0x02)
            {
                0x02, 
                Package (0x06)
                {
                    Zero, 
                    0x03E8, 
                    0x2710, 
                    Zero, 
                    Zero, 
                    0x03E8
                }
            })
            Name (PATC, Zero)
            Method (_AC0, 0, Serialized)  // _ACx: Active Cooling, x=0-9
            {
                If ((\SAT1 == Zero))
                {
                    Return (0xFFFFFFFF)
                }

                Return (\_SB.IETM.CTOK (\SAT1))
            }

            Method (_PSV, 0, Serialized)  // _PSV: Passive Temperature
            {
                If ((\SPT1 == Zero))
                {
                    Return (0xFFFFFFFF)
                }

                Return (\_SB.IETM.CTOK (\SPT1))
            }

            Method (_CRT, 0, Serialized)  // _CRT: Critical Temperature
            {
                If ((\SCT1 == Zero))
                {
                    Return (0xFFFFFFFF)
                }

                Return (\_SB.IETM.CTOK (\SCT1))
            }

            Method (_CR3, 0, Serialized)  // _CR3: Warm/Standby Temperature
            {
                If ((\SC31 == Zero))
                {
                    Return (0xFFFFFFFF)
                }

                Return (\_SB.IETM.CTOK (\SC31))
            }

            Method (_HOT, 0, Serialized)  // _HOT: Hot Temperature
            {
                If ((\SHT1 == Zero))
                {
                    Return (0xFFFFFFFF)
                }

                Return (\_SB.IETM.CTOK (\SHT1))
            }

            Method (PORT, 0, Serialized)
            {
                Return (0xFFFFFFFF)
            }

            Method (SCBL, 0, Serialized)
            {
                Return (0xFFFFFFFF)
            }
        }
    }

    Scope (\_SB)
    {
        Device (STG2)
        {
            Name (_HID, EisaId ("INT340A"))  // _HID: Hardware ID
            Name (_UID, "STG2")  // _UID: Unique ID
            Name (_STR, Unicode ("Storage Participant2"))  // _STR: Description String
            Name (PTYP, 0x1D)
            Name (CTYP, Zero)
            Name (PFLG, Zero)
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (\SGE2)
                {
                    Return (0x0F)
                }
                Else
                {
                    Return (Zero)
                }
            }

            Method (PPCC, 0, Serialized)
            {
                Return (NPCC) /* \_SB_.STG2.NPCC */
            }

            Name (NPCC, Package (0x02)
            {
                0x02, 
                Package (0x06)
                {
                    Zero, 
                    0x03E8, 
                    0x2710, 
                    Zero, 
                    Zero, 
                    0x03E8
                }
            })
            Name (PATC, Zero)
            Method (_AC0, 0, Serialized)  // _ACx: Active Cooling, x=0-9
            {
                If ((\SAT2 == Zero))
                {
                    Return (0xFFFFFFFF)
                }

                Return (\_SB.IETM.CTOK (\SAT2))
            }

            Method (_PSV, 0, Serialized)  // _PSV: Passive Temperature
            {
                If ((\SPT2 == Zero))
                {
                    Return (0xFFFFFFFF)
                }

                Return (\_SB.IETM.CTOK (\SPT2))
            }

            Method (_CRT, 0, Serialized)  // _CRT: Critical Temperature
            {
                If ((\SCT2 == Zero))
                {
                    Return (0xFFFFFFFF)
                }

                Return (\_SB.IETM.CTOK (\SCT2))
            }

            Method (_CR3, 0, Serialized)  // _CR3: Warm/Standby Temperature
            {
                If ((\SC32 == Zero))
                {
                    Return (0xFFFFFFFF)
                }

                Return (\_SB.IETM.CTOK (\SC32))
            }

            Method (_HOT, 0, Serialized)  // _HOT: Hot Temperature
            {
                If ((\SHT2 == Zero))
                {
                    Return (0xFFFFFFFF)
                }

                Return (\_SB.IETM.CTOK (\SHT2))
            }

            Method (PORT, 0, Serialized)
            {
                Return (0xFFFFFFFF)
            }

            Method (SCBL, 0, Serialized)
            {
                Return (0xFFFFFFFF)
            }
        }
    }

    Scope (\_SB.PCI0.LPCB.H_EC)
    {
        Device (SEN1)
        {
            Name (_HID, EisaId ("INT3403") /* DPTF Temperature Sensor */)  // _HID: Hardware ID
            Name (_UID, "SEN1")  // _UID: Unique ID
            Name (_STR, Unicode ("Thermistor PCH VR"))  // _STR: Description String
            Name (PTYP, 0x03)
            Name (CTYP, Zero)
            Name (PFLG, Zero)
            Name (FAUX, Zero)
            Name (SAUX, Zero)
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If ((\S1DE == One))
                {
                    Return (0x0F)
                }
                Else
                {
                    Return (Zero)
                }
            }

            Name (LTMP, 0x1E)
            Method (_TMP, 0, Serialized)  // _TMP: Temperature
            {
                If (\_SB.PCI0.LPCB.H_EC.ECAV)
                {
                    Local0 = \_SB.PCI0.LPCB.H_EC.ECRD (RefOf (\_SB.PCI0.LPCB.H_EC.TSR1))
                    If ((Local0 > Zero))
                    {
                        LTMP = Local0
                    }

                    Return (\_SB.IETM.CTOK (LTMP))
                }
                Else
                {
                    Return (0x0BB8)
                }
            }

            Name (PATC, 0x02)
            Name (AT0, Ones)
            Method (PAT0, 1, Serialized)
            {
                If (\_SB.PCI0.LPCB.H_EC.ECAV)
                {
                    Local0 = Acquire (\_SB.PCI0.LPCB.H_EC.PATM, 0x0064)
                    If ((Local0 == Zero))
                    {
                        AT0 = Arg0
                        Local1 = \_SB.IETM.KTOC (Arg0)
                        If ((Local1 != FAUX))
                        {
                            FAUX = Local1
                            \_SB.PCI0.LPCB.H_EC.ECWT (Zero, RefOf (\_SB.PCI0.LPCB.H_EC.TSI))
                            \_SB.PCI0.LPCB.H_EC.ECWT (0x02, RefOf (\_SB.PCI0.LPCB.H_EC.HYST))
                            \_SB.PCI0.LPCB.H_EC.ECWT (FAUX, RefOf (\_SB.PCI0.LPCB.H_EC.TSLT))
                            \_SB.PCI0.LPCB.H_EC.ECMD (0x4A)
                        }

                        Release (\_SB.PCI0.LPCB.H_EC.PATM)
                    }
                }
            }

            Name (AT1, Ones)
            Method (PAT1, 1, Serialized)
            {
                If (\_SB.PCI0.LPCB.H_EC.ECAV)
                {
                    Local0 = Acquire (\_SB.PCI0.LPCB.H_EC.PATM, 0x0064)
                    If ((Local0 == Zero))
                    {
                        AT1 = Arg0
                        Local1 = \_SB.IETM.KTOC (Arg0)
                        If ((Local1 != SAUX))
                        {
                            SAUX = Local1
                            \_SB.PCI0.LPCB.H_EC.ECWT (Zero, RefOf (\_SB.PCI0.LPCB.H_EC.TSI))
                            \_SB.PCI0.LPCB.H_EC.ECWT (0x02, RefOf (\_SB.PCI0.LPCB.H_EC.HYST))
                            \_SB.PCI0.LPCB.H_EC.ECWT (SAUX, RefOf (\_SB.PCI0.LPCB.H_EC.TSHT))
                            \_SB.PCI0.LPCB.H_EC.ECMD (0x4A)
                        }

                        Release (\_SB.PCI0.LPCB.H_EC.PATM)
                    }
                }
            }

            Name (GTSH, 0x14)
            Name (LSTM, Zero)
            Method (_DTI, 1, NotSerialized)  // _DTI: Device Temperature Indication
            {
                LSTM = Arg0
                Notify (\_SB.PCI0.LPCB.H_EC.SEN1, 0x91) // Device-Specific
            }

            Method (_NTT, 0, NotSerialized)  // _NTT: Notification Temperature Threshold
            {
                Return (0x0ADE)
            }

            Method (_TSP, 0, Serialized)  // _TSP: Thermal Sampling Period
            {
                Return (\SSP1) /* External reference */
            }

            Method (_AC0, 0, Serialized)  // _ACx: Active Cooling, x=0-9
            {
                Return (0xFFFFFFFF)
            }

            Method (_PSV, 0, Serialized)  // _PSV: Passive Temperature
            {
                Return (0xFFFFFFFF)
            }

            Method (_CRT, 0, Serialized)  // _CRT: Critical Temperature
            {
                Return (\_SB.IETM.CTOK (0x63))
            }

            Method (_CR3, 0, Serialized)  // _CR3: Warm/Standby Temperature
            {
                Return (0xFFFFFFFF)
            }

            Method (_HOT, 0, Serialized)  // _HOT: Hot Temperature
            {
                Return (\_SB.IETM.CTOK (0x61))
            }
        }
    }

    Scope (\_SB.PCI0.LPCB.H_EC)
    {
        Device (SEN2)
        {
            Name (_HID, EisaId ("INT3403") /* DPTF Temperature Sensor */)  // _HID: Hardware ID
            Name (_UID, "SEN2")  // _UID: Unique ID
            Name (_STR, Unicode ("Thermistor GT VR"))  // _STR: Description String
            Name (PTYP, 0x03)
            Name (CTYP, Zero)
            Name (PFLG, Zero)
            Name (FAUX, Zero)
            Name (SAUX, Zero)
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If ((\S2DE == One))
                {
                    Return (0x0F)
                }
                Else
                {
                    Return (Zero)
                }
            }

            Name (LTMP, 0x1E)
            Method (_TMP, 0, Serialized)  // _TMP: Temperature
            {
                If (\_SB.PCI0.LPCB.H_EC.ECAV)
                {
                    Local0 = \_SB.PCI0.LPCB.H_EC.ECRD (RefOf (\_SB.PCI0.LPCB.H_EC.TSR2))
                    If ((Local0 > Zero))
                    {
                        LTMP = Local0
                    }

                    Return (\_SB.IETM.CTOK (LTMP))
                }
                Else
                {
                    Return (0x0BB8)
                }
            }

            Name (PATC, 0x02)
            Method (PAT0, 1, Serialized)
            {
                If (\_SB.PCI0.LPCB.H_EC.ECAV)
                {
                    Local0 = Acquire (\_SB.PCI0.LPCB.H_EC.PATM, 0x0064)
                    If ((Local0 == Zero))
                    {
                        Local1 = \_SB.IETM.KTOC (Arg0)
                        If ((Local1 != FAUX))
                        {
                            FAUX = Local1
                            \_SB.PCI0.LPCB.H_EC.ECWT (One, RefOf (\_SB.PCI0.LPCB.H_EC.TSI))
                            \_SB.PCI0.LPCB.H_EC.ECWT (0x02, RefOf (\_SB.PCI0.LPCB.H_EC.HYST))
                            \_SB.PCI0.LPCB.H_EC.ECWT (FAUX, RefOf (\_SB.PCI0.LPCB.H_EC.TSLT))
                            \_SB.PCI0.LPCB.H_EC.ECMD (0x4A)
                        }

                        Release (\_SB.PCI0.LPCB.H_EC.PATM)
                    }
                }
            }

            Method (PAT1, 1, Serialized)
            {
                If (\_SB.PCI0.LPCB.H_EC.ECAV)
                {
                    Local0 = Acquire (\_SB.PCI0.LPCB.H_EC.PATM, 0x0064)
                    If ((Local0 == Zero))
                    {
                        Local1 = \_SB.IETM.KTOC (Arg0)
                        If ((Local1 != SAUX))
                        {
                            SAUX = Local1
                            \_SB.PCI0.LPCB.H_EC.ECWT (One, RefOf (\_SB.PCI0.LPCB.H_EC.TSI))
                            \_SB.PCI0.LPCB.H_EC.ECWT (0x02, RefOf (\_SB.PCI0.LPCB.H_EC.HYST))
                            \_SB.PCI0.LPCB.H_EC.ECWT (SAUX, RefOf (\_SB.PCI0.LPCB.H_EC.TSHT))
                            \_SB.PCI0.LPCB.H_EC.ECMD (0x4A)
                        }

                        Release (\_SB.PCI0.LPCB.H_EC.PATM)
                    }
                }
            }

            Name (GTSH, 0x14)
            Name (LSTM, Zero)
            Method (_DTI, 1, NotSerialized)  // _DTI: Device Temperature Indication
            {
                LSTM = Arg0
                Notify (\_SB.PCI0.LPCB.H_EC.SEN2, 0x91) // Device-Specific
            }

            Method (_NTT, 0, NotSerialized)  // _NTT: Notification Temperature Threshold
            {
                Return (0x0ADE)
            }

            Method (_TSP, 0, Serialized)  // _TSP: Thermal Sampling Period
            {
                Return (\SSP2) /* External reference */
            }

            Method (_AC0, 0, Serialized)  // _ACx: Active Cooling, x=0-9
            {
                If (CTYP)
                {
                    If ((\S2PT == Zero))
                    {
                        Return (0xFFFFFFFF)
                    }

                    Local1 = \_SB.IETM.CTOK (\S2PT)
                }
                Else
                {
                    If ((\S2AT == Zero))
                    {
                        Return (0xFFFFFFFF)
                    }

                    Local1 = \_SB.IETM.CTOK (\S2AT)
                }

                If ((LSTM >= Local1))
                {
                    Return ((Local1 - 0x14))
                }
                Else
                {
                    Return (Local1)
                }
            }

            Method (_AC1, 0, Serialized)  // _ACx: Active Cooling, x=0-9
            {
                If (CTYP)
                {
                    If ((\S2PT == Zero))
                    {
                        Return (0xFFFFFFFF)
                    }
                }
                ElseIf ((\S2AT == Zero))
                {
                    Return (0xFFFFFFFF)
                }

                Return ((_AC0 () - 0x32))
            }

            Method (_AC2, 0, Serialized)  // _ACx: Active Cooling, x=0-9
            {
                If (CTYP)
                {
                    If ((\S2PT == Zero))
                    {
                        Return (0xFFFFFFFF)
                    }
                }
                ElseIf ((\S2AT == Zero))
                {
                    Return (0xFFFFFFFF)
                }

                Return ((_AC1 () - 0x32))
            }

            Method (_AC3, 0, Serialized)  // _ACx: Active Cooling, x=0-9
            {
                If (CTYP)
                {
                    If ((\S2PT == Zero))
                    {
                        Return (0xFFFFFFFF)
                    }
                }
                ElseIf ((\S2AT == Zero))
                {
                    Return (0xFFFFFFFF)
                }

                Return ((_AC2 () - 0x32))
            }

            Method (_PSV, 0, Serialized)  // _PSV: Passive Temperature
            {
                If (CTYP)
                {
                    If ((\S2AT == Zero))
                    {
                        Return (0xFFFFFFFF)
                    }

                    Return (\_SB.IETM.CTOK (\S2AT))
                }
                Else
                {
                    If ((\S2PT == Zero))
                    {
                        Return (0xFFFFFFFF)
                    }

                    Return (\_SB.IETM.CTOK (\S2PT))
                }
            }

            Method (_CRT, 0, Serialized)  // _CRT: Critical Temperature
            {
                Return (0xFFFFFFFF)
            }

            Method (_CR3, 0, Serialized)  // _CR3: Warm/Standby Temperature
            {
                Return (0xFFFFFFFF)
            }

            Method (_HOT, 0, Serialized)  // _HOT: Hot Temperature
            {
                Return (0xFFFFFFFF)
            }
        }
    }

    Scope (\_SB.IETM)
    {
        Name (TRT0, Package (0x03)
        {
            Package (0x08)
            {
                \_SB.PCI0.B0D4, 
                \_SB.PCI0.B0D4, 
                0x12, 
                0x32, 
                Zero, 
                Zero, 
                Zero, 
                Zero
            }, 

            Package (0x08)
            {
                \_SB.PCI0.B0D4, 
                \_SB.PCI0.LPCB.H_EC.SEN1, 
                0x14, 
                0xC8, 
                Zero, 
                Zero, 
                Zero, 
                Zero
            }, 

            Package (0x08)
            {
                \_SB.PCI0.B0D4, 
                \_SB.PCI0.LPCB.H_EC.SEN2, 
                0x14, 
                0xC8, 
                Zero, 
                Zero, 
                Zero, 
                Zero
            }
        })
        Method (TRTR, 0, NotSerialized)
        {
            Return (\TRTV) /* External reference */
        }

        Method (_TRT, 0, NotSerialized)  // _TRT: Thermal Relationship Table
        {
            Return (TRT0) /* \_SB_.IETM.TRT0 */
        }
    }

    Scope (\_SB.IETM)
    {
        Name (PTTL, 0x14)
        Method (PSVT, 0, Serialized)
        {
            If (((\XMID == Zero) || (\XMID == 0x04)))
            {
                Return (Package (0x02)
                {
                    0x02, 
                    Package (0x0C)
                    {
                        \_SB.PCI0.B0D4, 
                        \_SB.PCI0.LPCB.H_EC.SEN2, 
                        One, 
                        0x1E, 
                        0x0CFA, 
                        0x09, 
                        0x00010000, 
                        "MAX", 
                        0xFA, 
                        0x0A, 
                        0x14, 
                        Zero
                    }
                })
            }
            ElseIf (((\XMID == 0x03) || (\XMID == 0x07)))
            {
                Return (Package (0x02)
                {
                    0x02, 
                    Package (0x0C)
                    {
                        \_SB.PCI0.B0D4, 
                        \_SB.PCI0.LPCB.H_EC.SEN2, 
                        One, 
                        0x1E, 
                        0x0CD2, 
                        0x09, 
                        0x00010000, 
                        "MAX", 
                        0xFA, 
                        0x0A, 
                        0x14, 
                        Zero
                    }
                })
            }
            ElseIf (((\XMID == 0x02) || (\XMID == 0x06)))
            {
                Return (Package (0x02)
                {
                    0x02, 
                    Package (0x0C)
                    {
                        \_SB.PCI0.B0D4, 
                        \_SB.PCI0.LPCB.H_EC.SEN2, 
                        One, 
                        0x1E, 
                        0x0CD2, 
                        0x09, 
                        0x00010000, 
                        "MAX", 
                        0xFA, 
                        0x0A, 
                        0x14, 
                        Zero
                    }
                })
            }
            ElseIf (((\XMID == One) || (\XMID == 0x05)))
            {
                Return (Package (0x02)
                {
                    0x02, 
                    Package (0x0C)
                    {
                        \_SB.PCI0.B0D4, 
                        \_SB.PCI0.LPCB.H_EC.SEN2, 
                        One, 
                        0x1E, 
                        0x0CBE, 
                        0x09, 
                        0x00010000, 
                        "MAX", 
                        0xFA, 
                        0x0A, 
                        0x14, 
                        Zero
                    }
                })
            }
            Else
            {
                Return (Package (0x05)
                {
                    0x02, 
                    Package (0x0C)
                    {
                        \_SB.PCI0.B0D4, 
                        \_SB.PCI0.B0D4, 
                        0x02, 
                        0x012C, 
                        0x0D04, 
                        0x09, 
                        0x00010000, 
                        0x2EE0, 
                        0x01F4, 
                        0x0A, 
                        0x14, 
                        Zero
                    }, 

                    Package (0x0C)
                    {
                        \_SB.PCI0.B0D4, 
                        \_SB.PCI0.B0D4, 
                        0x02, 
                        0x012C, 
                        0x0D68, 
                        0x09, 
                        0x00010000, 
                        0x2328, 
                        0x01F4, 
                        0x0A, 
                        0x14, 
                        Zero
                    }, 

                    Package (0x0C)
                    {
                        \_SB.PCI0.B0D4, 
                        \_SB.PCI0.B0D4, 
                        0x02, 
                        0x012C, 
                        0x0DCC, 
                        0x09, 
                        0x00010000, 
                        0x1770, 
                        0x01F4, 
                        0x0A, 
                        0x14, 
                        Zero
                    }, 

                    Package (0x0C)
                    {
                        \_SB.PCI0.B0D4, 
                        \_SB.PCI0.B0D4, 
                        One, 
                        0x012C, 
                        0x0E30, 
                        0x09, 
                        0x00010000, 
                        "MIN", 
                        0x01F4, 
                        0x0A, 
                        0x14, 
                        Zero
                    }
                })
            }
        }
    }

    Scope (\_SB.IETM)
    {
        Name (ART1, Package (0x04)
        {
            Zero, 
            Package (0x0D)
            {
                \_SB.PCI0.LPCB.H_EC.TFN1, 
                \_SB.PCI0.B0D4, 
                0x64, 
                0x46, 
                0x32, 
                0xFFFFFFFF, 
                0xFFFFFFFF, 
                0xFFFFFFFF, 
                0xFFFFFFFF, 
                0xFFFFFFFF, 
                0xFFFFFFFF, 
                0xFFFFFFFF, 
                0xFFFFFFFF
            }, 

            Package (0x0D)
            {
                \_SB.PCI0.LPCB.H_EC.TFN1, 
                \_SB.PCI0.LPCB.H_EC.SEN1, 
                0x64, 
                0x46, 
                0xFFFFFFFF, 
                0xFFFFFFFF, 
                0xFFFFFFFF, 
                0xFFFFFFFF, 
                0xFFFFFFFF, 
                0xFFFFFFFF, 
                0xFFFFFFFF, 
                0xFFFFFFFF, 
                0xFFFFFFFF
            }, 

            Package (0x0D)
            {
                \_SB.PCI0.LPCB.H_EC.TFN1, 
                \_SB.PCI0.LPCB.H_EC.SEN2, 
                0x64, 
                0x28, 
                0x23, 
                0x1E, 
                0x19, 
                0xFFFFFFFF, 
                0xFFFFFFFF, 
                0xFFFFFFFF, 
                0xFFFFFFFF, 
                0xFFFFFFFF, 
                0xFFFFFFFF
            }
        })
        Name (ART0, Package (0x04)
        {
            Zero, 
            Package (0x0D)
            {
                \_SB.PCI0.LPCB.H_EC.TFN1, 
                \_SB.PCI0.B0D4, 
                0x64, 
                0x64, 
                0x50, 
                0x41, 
                0x2D, 
                0x19, 
                0xFFFFFFFF, 
                0xFFFFFFFF, 
                0xFFFFFFFF, 
                0xFFFFFFFF, 
                0xFFFFFFFF
            }, 

            Package (0x0D)
            {
                \_SB.PCI0.LPCB.H_EC.TFN1, 
                \_SB.PCI0.LPCB.H_EC.SEN1, 
                0x64, 
                0x5A, 
                0xFFFFFFFF, 
                0xFFFFFFFF, 
                0xFFFFFFFF, 
                0xFFFFFFFF, 
                0xFFFFFFFF, 
                0xFFFFFFFF, 
                0xFFFFFFFF, 
                0xFFFFFFFF, 
                0xFFFFFFFF
            }, 

            Package (0x0D)
            {
                \_SB.PCI0.LPCB.H_EC.TFN1, 
                \_SB.PCI0.LPCB.H_EC.SEN2, 
                0x64, 
                0x3C, 
                0x32, 
                0x28, 
                0x1E, 
                0xFFFFFFFF, 
                0xFFFFFFFF, 
                0xFFFFFFFF, 
                0xFFFFFFFF, 
                0xFFFFFFFF, 
                0xFFFFFFFF
            }
        })
        Method (_ART, 0, NotSerialized)  // _ART: Active Cooling Relationship Table
        {
            Return (ART0) /* \_SB_.IETM.ART0 */
        }
    }

    Scope (\_SB.IETM)
    {
        Name (DP2P, Package (0x01)
        {
            ToUUID ("9e04115a-ae87-4d1c-9500-0f3e340bfe75") /* Unknown UUID */
        })
        Name (DPSP, Package (0x01)
        {
            ToUUID ("42a441d6-ae6a-462b-a84b-4a8ce79027d3") /* Unknown UUID */
        })
        Name (DASP, Package (0x01)
        {
            ToUUID ("3a95c389-e4b8-4629-a526-c52c88626bae") /* Unknown UUID */
        })
        Name (DA2P, Package (0x01)
        {
            ToUUID ("0e56fab6-bdfc-4e8c-8246-40ecfd4d74ea") /* Unknown UUID */
        })
        Name (DCSP, Package (0x01)
        {
            ToUUID ("97c68ae7-15fa-499c-b8c9-5da81d606e0a") /* Unknown UUID */
        })
        Name (RFIP, Package (0x01)
        {
            ToUUID ("c4ce1849-243a-49f3-b8d5-f97002f38e6a") /* Unknown UUID */
        })
        Name (POBP, Package (0x01)
        {
            ToUUID ("f5a35014-c209-46a4-993a-eb56de7530a1") /* Unknown UUID */
        })
        Name (DAPP, Package (0x01)
        {
            ToUUID ("63be270f-1c11-48fd-a6f7-3af253ff3e2d") /* Unknown UUID */
        })
        Name (DVSP, Package (0x01)
        {
            ToUUID ("6ed722a7-9240-48a5-b479-31eef723d7cf") /* Unknown UUID */
        })
        Name (DPID, Package (0x01)
        {
            ToUUID ("42496e14-bc1b-46e8-a798-ca915464426f") /* Unknown UUID */
        })
    }

    Scope (\_SB.IETM)
    {
        Method (GDDV, 0, Serialized)
        {
            Name (BUF0, Package (0x01)
            {
                Buffer (0x2602)
                {
                    /* 0000 */  0xE5, 0x1F, 0x0C, 0x00, 0x00, 0x00, 0x00, 0x01,  // ........
                    /* 0008 */  0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                    /* 0010 */  0x14, 0x00, 0x00, 0x00, 0x2F, 0x73, 0x68, 0x61,  // ..../sha
                    /* 0018 */  0x72, 0x65, 0x64, 0x2F, 0x65, 0x78, 0x70, 0x6F,  // red/expo
                    /* 0020 */  0x72, 0x74, 0x2F, 0x61, 0x70, 0x61, 0x74, 0x00,  // rt/apat.
                    /* 0028 */  0x07, 0x00, 0x00, 0x00, 0x94, 0x0A, 0x00, 0x00,  // ........
                    /* 0030 */  0x04, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00,  // ........
                    /* 0038 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 0040 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 0048 */  0x08, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 0050 */  0x00, 0x00, 0x00, 0x00, 0x31, 0x35, 0x57, 0x00,  // ....15W.
                    /* 0058 */  0x08, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00,  // ........
                    /* 0060 */  0x00, 0x00, 0x00, 0x00, 0x5C, 0x5F, 0x53, 0x42,  // ....\_SB
                    /* 0068 */  0x5F, 0x2E, 0x50, 0x43, 0x49, 0x30, 0x2E, 0x42,  // _.PCI0.B
                    /* 0070 */  0x30, 0x44, 0x34, 0x00, 0x04, 0x00, 0x00, 0x00,  // 0D4.....
                    /* 0078 */  0x09, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 0080 */  0x08, 0x00, 0x00, 0x00, 0x07, 0x00, 0x00, 0x00,  // ........
                    /* 0088 */  0x00, 0x00, 0x00, 0x00, 0x50, 0x4C, 0x31, 0x4D,  // ....PL1M
                    /* 0090 */  0x41, 0x58, 0x00, 0x08, 0x00, 0x00, 0x00, 0x06,  // AX......
                    /* 0098 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x31,  // .......1
                    /* 00A0 */  0x35, 0x30, 0x30, 0x30, 0x00, 0x04, 0x00, 0x00,  // 5000....
                    /* 00A8 */  0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 00B0 */  0x00, 0x08, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00,  // ........
                    /* 00B8 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x31, 0x35, 0x57,  // .....15W
                    /* 00C0 */  0x00, 0x08, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00,  // ........
                    /* 00C8 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x5C, 0x5F, 0x53,  // .....\_S
                    /* 00D0 */  0x42, 0x5F, 0x2E, 0x50, 0x43, 0x49, 0x30, 0x2E,  // B_.PCI0.
                    /* 00D8 */  0x42, 0x30, 0x44, 0x34, 0x00, 0x04, 0x00, 0x00,  // B0D4....
                    /* 00E0 */  0x00, 0x09, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 00E8 */  0x00, 0x08, 0x00, 0x00, 0x00, 0x07, 0x00, 0x00,  // ........
                    /* 00F0 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x50, 0x4C, 0x31,  // .....PL1
                    /* 00F8 */  0x4D, 0x49, 0x4E, 0x00, 0x08, 0x00, 0x00, 0x00,  // MIN.....
                    /* 0100 */  0x05, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 0108 */  0x35, 0x30, 0x30, 0x30, 0x00, 0x04, 0x00, 0x00,  // 5000....
                    /* 0110 */  0x00, 0x07, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 0118 */  0x00, 0x08, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00,  // ........
                    /* 0120 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x31, 0x34, 0x57,  // .....14W
                    /* 0128 */  0x00, 0x08, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00,  // ........
                    /* 0130 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x5C, 0x5F, 0x53,  // .....\_S
                    /* 0138 */  0x42, 0x5F, 0x2E, 0x50, 0x43, 0x49, 0x30, 0x2E,  // B_.PCI0.
                    /* 0140 */  0x42, 0x30, 0x44, 0x34, 0x00, 0x04, 0x00, 0x00,  // B0D4....
                    /* 0148 */  0x00, 0x09, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 0150 */  0x00, 0x08, 0x00, 0x00, 0x00, 0x07, 0x00, 0x00,  // ........
                    /* 0158 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x50, 0x4C, 0x31,  // .....PL1
                    /* 0160 */  0x4D, 0x41, 0x58, 0x00, 0x08, 0x00, 0x00, 0x00,  // MAX.....
                    /* 0168 */  0x06, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 0170 */  0x31, 0x34, 0x30, 0x30, 0x30, 0x00, 0x04, 0x00,  // 14000...
                    /* 0178 */  0x00, 0x00, 0x07, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 0180 */  0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x04, 0x00,  // ........
                    /* 0188 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x31, 0x34,  // ......14
                    /* 0190 */  0x57, 0x00, 0x08, 0x00, 0x00, 0x00, 0x10, 0x00,  // W.......
                    /* 0198 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x5C, 0x5F,  // ......\_
                    /* 01A0 */  0x53, 0x42, 0x5F, 0x2E, 0x50, 0x43, 0x49, 0x30,  // SB_.PCI0
                    /* 01A8 */  0x2E, 0x42, 0x30, 0x44, 0x34, 0x00, 0x04, 0x00,  // .B0D4...
                    /* 01B0 */  0x00, 0x00, 0x09, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 01B8 */  0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x07, 0x00,  // ........
                    /* 01C0 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x50, 0x4C,  // ......PL
                    /* 01C8 */  0x31, 0x4D, 0x49, 0x4E, 0x00, 0x08, 0x00, 0x00,  // 1MIN....
                    /* 01D0 */  0x00, 0x05, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 01D8 */  0x00, 0x35, 0x30, 0x30, 0x30, 0x00, 0x04, 0x00,  // .5000...
                    /* 01E0 */  0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 01E8 */  0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x04, 0x00,  // ........
                    /* 01F0 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x31, 0x33,  // ......13
                    /* 01F8 */  0x57, 0x00, 0x08, 0x00, 0x00, 0x00, 0x10, 0x00,  // W.......
                    /* 0200 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x5C, 0x5F,  // ......\_
                    /* 0208 */  0x53, 0x42, 0x5F, 0x2E, 0x50, 0x43, 0x49, 0x30,  // SB_.PCI0
                    /* 0210 */  0x2E, 0x42, 0x30, 0x44, 0x34, 0x00, 0x04, 0x00,  // .B0D4...
                    /* 0218 */  0x00, 0x00, 0x09, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 0220 */  0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x07, 0x00,  // ........
                    /* 0228 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x50, 0x4C,  // ......PL
                    /* 0230 */  0x31, 0x4D, 0x41, 0x58, 0x00, 0x08, 0x00, 0x00,  // 1MAX....
                    /* 0238 */  0x00, 0x06, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 0240 */  0x00, 0x31, 0x33, 0x30, 0x30, 0x30, 0x00, 0x04,  // .13000..
                    /* 0248 */  0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 0250 */  0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x04,  // ........
                    /* 0258 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x31,  // .......1
                    /* 0260 */  0x33, 0x57, 0x00, 0x08, 0x00, 0x00, 0x00, 0x10,  // 3W......
                    /* 0268 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x5C,  // .......\
                    /* 0270 */  0x5F, 0x53, 0x42, 0x5F, 0x2E, 0x50, 0x43, 0x49,  // _SB_.PCI
                    /* 0278 */  0x30, 0x2E, 0x42, 0x30, 0x44, 0x34, 0x00, 0x04,  // 0.B0D4..
                    /* 0280 */  0x00, 0x00, 0x00, 0x09, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 0288 */  0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x07,  // ........
                    /* 0290 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x50,  // .......P
                    /* 0298 */  0x4C, 0x31, 0x4D, 0x49, 0x4E, 0x00, 0x08, 0x00,  // L1MIN...
                    /* 02A0 */  0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 02A8 */  0x00, 0x00, 0x35, 0x30, 0x30, 0x30, 0x00, 0x04,  // ..5000..
                    /* 02B0 */  0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 02B8 */  0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x04,  // ........
                    /* 02C0 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x31,  // .......1
                    /* 02C8 */  0x32, 0x57, 0x00, 0x08, 0x00, 0x00, 0x00, 0x10,  // 2W......
                    /* 02D0 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x5C,  // .......\
                    /* 02D8 */  0x5F, 0x53, 0x42, 0x5F, 0x2E, 0x50, 0x43, 0x49,  // _SB_.PCI
                    /* 02E0 */  0x30, 0x2E, 0x42, 0x30, 0x44, 0x34, 0x00, 0x04,  // 0.B0D4..
                    /* 02E8 */  0x00, 0x00, 0x00, 0x09, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 02F0 */  0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x07,  // ........
                    /* 02F8 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x50,  // .......P
                    /* 0300 */  0x4C, 0x31, 0x4D, 0x41, 0x58, 0x00, 0x08, 0x00,  // L1MAX...
                    /* 0308 */  0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 0310 */  0x00, 0x00, 0x31, 0x32, 0x30, 0x30, 0x30, 0x00,  // ..12000.
                    /* 0318 */  0x04, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00,  // ........
                    /* 0320 */  0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00,  // ........
                    /* 0328 */  0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 0330 */  0x31, 0x32, 0x57, 0x00, 0x08, 0x00, 0x00, 0x00,  // 12W.....
                    /* 0338 */  0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 0340 */  0x5C, 0x5F, 0x53, 0x42, 0x5F, 0x2E, 0x50, 0x43,  // \_SB_.PC
                    /* 0348 */  0x49, 0x30, 0x2E, 0x42, 0x30, 0x44, 0x34, 0x00,  // I0.B0D4.
                    /* 0350 */  0x04, 0x00, 0x00, 0x00, 0x09, 0x00, 0x00, 0x00,  // ........
                    /* 0358 */  0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00,  // ........
                    /* 0360 */  0x07, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 0368 */  0x50, 0x4C, 0x31, 0x4D, 0x49, 0x4E, 0x00, 0x08,  // PL1MIN..
                    /* 0370 */  0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 0378 */  0x00, 0x00, 0x00, 0x35, 0x30, 0x30, 0x30, 0x00,  // ...5000.
                    /* 0380 */  0x04, 0x00, 0x00, 0x00, 0x09, 0x00, 0x00, 0x00,  // ........
                    /* 0388 */  0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00,  // ........
                    /* 0390 */  0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 0398 */  0x31, 0x31, 0x57, 0x00, 0x08, 0x00, 0x00, 0x00,  // 11W.....
                    /* 03A0 */  0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 03A8 */  0x5C, 0x5F, 0x53, 0x42, 0x5F, 0x2E, 0x50, 0x43,  // \_SB_.PC
                    /* 03B0 */  0x49, 0x30, 0x2E, 0x42, 0x30, 0x44, 0x34, 0x00,  // I0.B0D4.
                    /* 03B8 */  0x04, 0x00, 0x00, 0x00, 0x09, 0x00, 0x00, 0x00,  // ........
                    /* 03C0 */  0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00,  // ........
                    /* 03C8 */  0x07, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 03D0 */  0x50, 0x4C, 0x31, 0x4D, 0x41, 0x58, 0x00, 0x08,  // PL1MAX..
                    /* 03D8 */  0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 03E0 */  0x00, 0x00, 0x00, 0x31, 0x31, 0x30, 0x30, 0x30,  // ...11000
                    /* 03E8 */  0x00, 0x04, 0x00, 0x00, 0x00, 0x09, 0x00, 0x00,  // ........
                    /* 03F0 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00,  // ........
                    /* 03F8 */  0x00, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 0400 */  0x00, 0x31, 0x31, 0x57, 0x00, 0x08, 0x00, 0x00,  // .11W....
                    /* 0408 */  0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 0410 */  0x00, 0x5C, 0x5F, 0x53, 0x42, 0x5F, 0x2E, 0x50,  // .\_SB_.P
                    /* 0418 */  0x43, 0x49, 0x30, 0x2E, 0x42, 0x30, 0x44, 0x34,  // CI0.B0D4
                    /* 0420 */  0x00, 0x04, 0x00, 0x00, 0x00, 0x09, 0x00, 0x00,  // ........
                    /* 0428 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00,  // ........
                    /* 0430 */  0x00, 0x07, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 0438 */  0x00, 0x50, 0x4C, 0x31, 0x4D, 0x49, 0x4E, 0x00,  // .PL1MIN.
                    /* 0440 */  0x08, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00,  // ........
                    /* 0448 */  0x00, 0x00, 0x00, 0x00, 0x35, 0x30, 0x30, 0x30,  // ....5000
                    /* 0450 */  0x00, 0x04, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00,  // ........
                    /* 0458 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00,  // ........
                    /* 0460 */  0x00, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 0468 */  0x00, 0x31, 0x30, 0x57, 0x00, 0x08, 0x00, 0x00,  // .10W....
                    /* 0470 */  0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 0478 */  0x00, 0x5C, 0x5F, 0x53, 0x42, 0x5F, 0x2E, 0x50,  // .\_SB_.P
                    /* 0480 */  0x43, 0x49, 0x30, 0x2E, 0x42, 0x30, 0x44, 0x34,  // CI0.B0D4
                    /* 0488 */  0x00, 0x04, 0x00, 0x00, 0x00, 0x09, 0x00, 0x00,  // ........
                    /* 0490 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00,  // ........
                    /* 0498 */  0x00, 0x07, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 04A0 */  0x00, 0x50, 0x4C, 0x31, 0x4D, 0x41, 0x58, 0x00,  // .PL1MAX.
                    /* 04A8 */  0x08, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00,  // ........
                    /* 04B0 */  0x00, 0x00, 0x00, 0x00, 0x31, 0x30, 0x30, 0x30,  // ....1000
                    /* 04B8 */  0x30, 0x00, 0x04, 0x00, 0x00, 0x00, 0x03, 0x00,  // 0.......
                    /* 04C0 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00,  // ........
                    /* 04C8 */  0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 04D0 */  0x00, 0x00, 0x31, 0x30, 0x57, 0x00, 0x08, 0x00,  // ..10W...
                    /* 04D8 */  0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 04E0 */  0x00, 0x00, 0x5C, 0x5F, 0x53, 0x42, 0x5F, 0x2E,  // ..\_SB_.
                    /* 04E8 */  0x50, 0x43, 0x49, 0x30, 0x2E, 0x42, 0x30, 0x44,  // PCI0.B0D
                    /* 04F0 */  0x34, 0x00, 0x04, 0x00, 0x00, 0x00, 0x09, 0x00,  // 4.......
                    /* 04F8 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00,  // ........
                    /* 0500 */  0x00, 0x00, 0x07, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 0508 */  0x00, 0x00, 0x50, 0x4C, 0x31, 0x4D, 0x49, 0x4E,  // ..PL1MIN
                    /* 0510 */  0x00, 0x08, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00,  // ........
                    /* 0518 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x35, 0x30, 0x30,  // .....500
                    /* 0520 */  0x30, 0x00, 0x04, 0x00, 0x00, 0x00, 0x0A, 0x00,  // 0.......
                    /* 0528 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00,  // ........
                    /* 0530 */  0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 0538 */  0x00, 0x00, 0x39, 0x57, 0x00, 0x08, 0x00, 0x00,  // ..9W....
                    /* 0540 */  0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 0548 */  0x00, 0x5C, 0x5F, 0x53, 0x42, 0x5F, 0x2E, 0x50,  // .\_SB_.P
                    /* 0550 */  0x43, 0x49, 0x30, 0x2E, 0x42, 0x30, 0x44, 0x34,  // CI0.B0D4
                    /* 0558 */  0x00, 0x04, 0x00, 0x00, 0x00, 0x09, 0x00, 0x00,  // ........
                    /* 0560 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00,  // ........
                    /* 0568 */  0x00, 0x07, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 0570 */  0x00, 0x50, 0x4C, 0x31, 0x4D, 0x41, 0x58, 0x00,  // .PL1MAX.
                    /* 0578 */  0x08, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00,  // ........
                    /* 0580 */  0x00, 0x00, 0x00, 0x00, 0x39, 0x30, 0x30, 0x30,  // ....9000
                    /* 0588 */  0x00, 0x04, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00,  // ........
                    /* 0590 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00,  // ........
                    /* 0598 */  0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 05A0 */  0x00, 0x39, 0x57, 0x00, 0x08, 0x00, 0x00, 0x00,  // .9W.....
                    /* 05A8 */  0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 05B0 */  0x5C, 0x5F, 0x53, 0x42, 0x5F, 0x2E, 0x50, 0x43,  // \_SB_.PC
                    /* 05B8 */  0x49, 0x30, 0x2E, 0x42, 0x30, 0x44, 0x34, 0x00,  // I0.B0D4.
                    /* 05C0 */  0x04, 0x00, 0x00, 0x00, 0x09, 0x00, 0x00, 0x00,  // ........
                    /* 05C8 */  0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00,  // ........
                    /* 05D0 */  0x07, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 05D8 */  0x50, 0x4C, 0x31, 0x4D, 0x49, 0x4E, 0x00, 0x08,  // PL1MIN..
                    /* 05E0 */  0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 05E8 */  0x00, 0x00, 0x00, 0x35, 0x30, 0x30, 0x30, 0x00,  // ...5000.
                    /* 05F0 */  0x04, 0x00, 0x00, 0x00, 0x0B, 0x00, 0x00, 0x00,  // ........
                    /* 05F8 */  0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00,  // ........
                    /* 0600 */  0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 0608 */  0x38, 0x57, 0x00, 0x08, 0x00, 0x00, 0x00, 0x10,  // 8W......
                    /* 0610 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x5C,  // .......\
                    /* 0618 */  0x5F, 0x53, 0x42, 0x5F, 0x2E, 0x50, 0x43, 0x49,  // _SB_.PCI
                    /* 0620 */  0x30, 0x2E, 0x42, 0x30, 0x44, 0x34, 0x00, 0x04,  // 0.B0D4..
                    /* 0628 */  0x00, 0x00, 0x00, 0x09, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 0630 */  0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x07,  // ........
                    /* 0638 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x50,  // .......P
                    /* 0640 */  0x4C, 0x31, 0x4D, 0x41, 0x58, 0x00, 0x08, 0x00,  // L1MAX...
                    /* 0648 */  0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 0650 */  0x00, 0x00, 0x38, 0x30, 0x30, 0x30, 0x00, 0x04,  // ..8000..
                    /* 0658 */  0x00, 0x00, 0x00, 0x0B, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 0660 */  0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x03,  // ........
                    /* 0668 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x38,  // .......8
                    /* 0670 */  0x57, 0x00, 0x08, 0x00, 0x00, 0x00, 0x10, 0x00,  // W.......
                    /* 0678 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x5C, 0x5F,  // ......\_
                    /* 0680 */  0x53, 0x42, 0x5F, 0x2E, 0x50, 0x43, 0x49, 0x30,  // SB_.PCI0
                    /* 0688 */  0x2E, 0x42, 0x30, 0x44, 0x34, 0x00, 0x04, 0x00,  // .B0D4...
                    /* 0690 */  0x00, 0x00, 0x09, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 0698 */  0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x07, 0x00,  // ........
                    /* 06A0 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x50, 0x4C,  // ......PL
                    /* 06A8 */  0x31, 0x4D, 0x49, 0x4E, 0x00, 0x08, 0x00, 0x00,  // 1MIN....
                    /* 06B0 */  0x00, 0x05, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 06B8 */  0x00, 0x35, 0x30, 0x30, 0x30, 0x00, 0x04, 0x00,  // .5000...
                    /* 06C0 */  0x00, 0x00, 0x0C, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 06C8 */  0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x03, 0x00,  // ........
                    /* 06D0 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x37, 0x57,  // ......7W
                    /* 06D8 */  0x00, 0x08, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00,  // ........
                    /* 06E0 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x5C, 0x5F, 0x53,  // .....\_S
                    /* 06E8 */  0x42, 0x5F, 0x2E, 0x50, 0x43, 0x49, 0x30, 0x2E,  // B_.PCI0.
                    /* 06F0 */  0x42, 0x30, 0x44, 0x34, 0x00, 0x04, 0x00, 0x00,  // B0D4....
                    /* 06F8 */  0x00, 0x09, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 0700 */  0x00, 0x08, 0x00, 0x00, 0x00, 0x07, 0x00, 0x00,  // ........
                    /* 0708 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x50, 0x4C, 0x31,  // .....PL1
                    /* 0710 */  0x4D, 0x41, 0x58, 0x00, 0x08, 0x00, 0x00, 0x00,  // MAX.....
                    /* 0718 */  0x05, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 0720 */  0x37, 0x30, 0x30, 0x30, 0x00, 0x04, 0x00, 0x00,  // 7000....
                    /* 0728 */  0x00, 0x0C, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 0730 */  0x00, 0x08, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00,  // ........
                    /* 0738 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x37, 0x57, 0x00,  // .....7W.
                    /* 0740 */  0x08, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00,  // ........
                    /* 0748 */  0x00, 0x00, 0x00, 0x00, 0x5C, 0x5F, 0x53, 0x42,  // ....\_SB
                    /* 0750 */  0x5F, 0x2E, 0x50, 0x43, 0x49, 0x30, 0x2E, 0x42,  // _.PCI0.B
                    /* 0758 */  0x30, 0x44, 0x34, 0x00, 0x04, 0x00, 0x00, 0x00,  // 0D4.....
                    /* 0760 */  0x09, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 0768 */  0x08, 0x00, 0x00, 0x00, 0x07, 0x00, 0x00, 0x00,  // ........
                    /* 0770 */  0x00, 0x00, 0x00, 0x00, 0x50, 0x4C, 0x31, 0x4D,  // ....PL1M
                    /* 0778 */  0x49, 0x4E, 0x00, 0x08, 0x00, 0x00, 0x00, 0x05,  // IN......
                    /* 0780 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x35,  // .......5
                    /* 0788 */  0x30, 0x30, 0x30, 0x00, 0x04, 0x00, 0x00, 0x00,  // 000.....
                    /* 0790 */  0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 0798 */  0x08, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00,  // ........
                    /* 07A0 */  0x00, 0x00, 0x00, 0x00, 0x36, 0x57, 0x00, 0x08,  // ....6W..
                    /* 07A8 */  0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 07B0 */  0x00, 0x00, 0x00, 0x5C, 0x5F, 0x53, 0x42, 0x5F,  // ...\_SB_
                    /* 07B8 */  0x2E, 0x50, 0x43, 0x49, 0x30, 0x2E, 0x42, 0x30,  // .PCI0.B0
                    /* 07C0 */  0x44, 0x34, 0x00, 0x04, 0x00, 0x00, 0x00, 0x09,  // D4......
                    /* 07C8 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08,  // ........
                    /* 07D0 */  0x00, 0x00, 0x00, 0x07, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 07D8 */  0x00, 0x00, 0x00, 0x50, 0x4C, 0x31, 0x4D, 0x41,  // ...PL1MA
                    /* 07E0 */  0x58, 0x00, 0x08, 0x00, 0x00, 0x00, 0x05, 0x00,  // X.......
                    /* 07E8 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x36, 0x30,  // ......60
                    /* 07F0 */  0x30, 0x30, 0x00, 0x04, 0x00, 0x00, 0x00, 0x04,  // 00......
                    /* 07F8 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08,  // ........
                    /* 0800 */  0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 0808 */  0x00, 0x00, 0x00, 0x36, 0x57, 0x00, 0x08, 0x00,  // ...6W...
                    /* 0810 */  0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 0818 */  0x00, 0x00, 0x5C, 0x5F, 0x53, 0x42, 0x5F, 0x2E,  // ..\_SB_.
                    /* 0820 */  0x50, 0x43, 0x49, 0x30, 0x2E, 0x42, 0x30, 0x44,  // PCI0.B0D
                    /* 0828 */  0x34, 0x00, 0x04, 0x00, 0x00, 0x00, 0x09, 0x00,  // 4.......
                    /* 0830 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00,  // ........
                    /* 0838 */  0x00, 0x00, 0x07, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 0840 */  0x00, 0x00, 0x50, 0x4C, 0x31, 0x4D, 0x49, 0x4E,  // ..PL1MIN
                    /* 0848 */  0x00, 0x08, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00,  // ........
                    /* 0850 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x35, 0x30, 0x30,  // .....500
                    /* 0858 */  0x30, 0x00, 0x04, 0x00, 0x00, 0x00, 0x0D, 0x00,  // 0.......
                    /* 0860 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00,  // ........
                    /* 0868 */  0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 0870 */  0x00, 0x00, 0x35, 0x57, 0x00, 0x08, 0x00, 0x00,  // ..5W....
                    /* 0878 */  0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 0880 */  0x00, 0x5C, 0x5F, 0x53, 0x42, 0x5F, 0x2E, 0x50,  // .\_SB_.P
                    /* 0888 */  0x43, 0x49, 0x30, 0x2E, 0x42, 0x30, 0x44, 0x34,  // CI0.B0D4
                    /* 0890 */  0x00, 0x04, 0x00, 0x00, 0x00, 0x09, 0x00, 0x00,  // ........
                    /* 0898 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00,  // ........
                    /* 08A0 */  0x00, 0x07, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 08A8 */  0x00, 0x50, 0x4C, 0x31, 0x4D, 0x41, 0x58, 0x00,  // .PL1MAX.
                    /* 08B0 */  0x08, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00,  // ........
                    /* 08B8 */  0x00, 0x00, 0x00, 0x00, 0x35, 0x30, 0x30, 0x30,  // ....5000
                    /* 08C0 */  0x00, 0x04, 0x00, 0x00, 0x00, 0x0D, 0x00, 0x00,  // ........
                    /* 08C8 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00,  // ........
                    /* 08D0 */  0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 08D8 */  0x00, 0x35, 0x57, 0x00, 0x08, 0x00, 0x00, 0x00,  // .5W.....
                    /* 08E0 */  0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 08E8 */  0x5C, 0x5F, 0x53, 0x42, 0x5F, 0x2E, 0x50, 0x43,  // \_SB_.PC
                    /* 08F0 */  0x49, 0x30, 0x2E, 0x42, 0x30, 0x44, 0x34, 0x00,  // I0.B0D4.
                    /* 08F8 */  0x04, 0x00, 0x00, 0x00, 0x09, 0x00, 0x00, 0x00,  // ........
                    /* 0900 */  0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00,  // ........
                    /* 0908 */  0x07, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 0910 */  0x50, 0x4C, 0x31, 0x4D, 0x49, 0x4E, 0x00, 0x08,  // PL1MIN..
                    /* 0918 */  0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 0920 */  0x00, 0x00, 0x00, 0x35, 0x30, 0x30, 0x30, 0x00,  // ...5000.
                    /* 0928 */  0x04, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00,  // ........
                    /* 0930 */  0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00,  // ........
                    /* 0938 */  0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 0940 */  0x34, 0x57, 0x00, 0x08, 0x00, 0x00, 0x00, 0x10,  // 4W......
                    /* 0948 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x5C,  // .......\
                    /* 0950 */  0x5F, 0x53, 0x42, 0x5F, 0x2E, 0x50, 0x43, 0x49,  // _SB_.PCI
                    /* 0958 */  0x30, 0x2E, 0x42, 0x30, 0x44, 0x34, 0x00, 0x04,  // 0.B0D4..
                    /* 0960 */  0x00, 0x00, 0x00, 0x09, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 0968 */  0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x07,  // ........
                    /* 0970 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x50,  // .......P
                    /* 0978 */  0x4C, 0x31, 0x4D, 0x41, 0x58, 0x00, 0x08, 0x00,  // L1MAX...
                    /* 0980 */  0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 0988 */  0x00, 0x00, 0x34, 0x30, 0x30, 0x30, 0x00, 0x04,  // ..4000..
                    /* 0990 */  0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 0998 */  0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x03,  // ........
                    /* 09A0 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x34,  // .......4
                    /* 09A8 */  0x57, 0x00, 0x08, 0x00, 0x00, 0x00, 0x10, 0x00,  // W.......
                    /* 09B0 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x5C, 0x5F,  // ......\_
                    /* 09B8 */  0x53, 0x42, 0x5F, 0x2E, 0x50, 0x43, 0x49, 0x30,  // SB_.PCI0
                    /* 09C0 */  0x2E, 0x42, 0x30, 0x44, 0x34, 0x00, 0x04, 0x00,  // .B0D4...
                    /* 09C8 */  0x00, 0x00, 0x09, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 09D0 */  0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x07, 0x00,  // ........
                    /* 09D8 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x50, 0x4C,  // ......PL
                    /* 09E0 */  0x31, 0x4D, 0x49, 0x4E, 0x00, 0x08, 0x00, 0x00,  // 1MIN....
                    /* 09E8 */  0x00, 0x05, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 09F0 */  0x00, 0x34, 0x30, 0x30, 0x30, 0x00, 0x04, 0x00,  // .4000...
                    /* 09F8 */  0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 0A00 */  0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x03, 0x00,  // ........
                    /* 0A08 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x33, 0x57,  // ......3W
                    /* 0A10 */  0x00, 0x08, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00,  // ........
                    /* 0A18 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x5C, 0x5F, 0x53,  // .....\_S
                    /* 0A20 */  0x42, 0x5F, 0x2E, 0x50, 0x43, 0x49, 0x30, 0x2E,  // B_.PCI0.
                    /* 0A28 */  0x42, 0x30, 0x44, 0x34, 0x00, 0x04, 0x00, 0x00,  // B0D4....
                    /* 0A30 */  0x00, 0x09, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 0A38 */  0x00, 0x08, 0x00, 0x00, 0x00, 0x07, 0x00, 0x00,  // ........
                    /* 0A40 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x50, 0x4C, 0x31,  // .....PL1
                    /* 0A48 */  0x4D, 0x41, 0x58, 0x00, 0x08, 0x00, 0x00, 0x00,  // MAX.....
                    /* 0A50 */  0x05, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 0A58 */  0x33, 0x30, 0x30, 0x30, 0x00, 0x04, 0x00, 0x00,  // 3000....
                    /* 0A60 */  0x00, 0x06, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 0A68 */  0x00, 0x08, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00,  // ........
                    /* 0A70 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x33, 0x57, 0x00,  // .....3W.
                    /* 0A78 */  0x08, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00,  // ........
                    /* 0A80 */  0x00, 0x00, 0x00, 0x00, 0x5C, 0x5F, 0x53, 0x42,  // ....\_SB
                    /* 0A88 */  0x5F, 0x2E, 0x50, 0x43, 0x49, 0x30, 0x2E, 0x42,  // _.PCI0.B
                    /* 0A90 */  0x30, 0x44, 0x34, 0x00, 0x04, 0x00, 0x00, 0x00,  // 0D4.....
                    /* 0A98 */  0x09, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 0AA0 */  0x08, 0x00, 0x00, 0x00, 0x07, 0x00, 0x00, 0x00,  // ........
                    /* 0AA8 */  0x00, 0x00, 0x00, 0x00, 0x50, 0x4C, 0x31, 0x4D,  // ....PL1M
                    /* 0AB0 */  0x49, 0x4E, 0x00, 0x08, 0x00, 0x00, 0x00, 0x05,  // IN......
                    /* 0AB8 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x33,  // .......3
                    /* 0AC0 */  0x30, 0x30, 0x30, 0x00, 0x01, 0x00, 0x00, 0x00,  // 000.....
                    /* 0AC8 */  0x14, 0x00, 0x00, 0x00, 0x2F, 0x73, 0x68, 0x61,  // ..../sha
                    /* 0AD0 */  0x72, 0x65, 0x64, 0x2F, 0x65, 0x78, 0x70, 0x6F,  // red/expo
                    /* 0AD8 */  0x72, 0x74, 0x2F, 0x61, 0x70, 0x63, 0x74, 0x00,  // rt/apct.
                    /* 0AE0 */  0x07, 0x00, 0x00, 0x00, 0x6C, 0x18, 0x00, 0x00,  // ....l...
                    /* 0AE8 */  0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                    /* 0AF0 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 0AF8 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 0B00 */  0x04, 0x00, 0x00, 0x00, 0x13, 0x00, 0x00, 0x00,  // ........
                    /* 0B08 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 0B10 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 0B18 */  0x04, 0x00, 0x00, 0x00, 0x0F, 0x00, 0x00, 0x00,  // ........
                    /* 0B20 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 0B28 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 0B30 */  0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                    /* 0B38 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 0B40 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 0B48 */  0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                    /* 0B50 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 0B58 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 0B60 */  0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                    /* 0B68 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 0B70 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 0B78 */  0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                    /* 0B80 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 0B88 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 0B90 */  0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                    /* 0B98 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 0BA0 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 0BA8 */  0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                    /* 0BB0 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 0BB8 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 0BC0 */  0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                    /* 0BC8 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 0BD0 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 0BD8 */  0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                    /* 0BE0 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 0BE8 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 0BF0 */  0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                    /* 0BF8 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 0C00 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 0C08 */  0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                    /* 0C10 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 0C18 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 0C20 */  0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                    /* 0C28 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 0C30 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 0C38 */  0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                    /* 0C40 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 0C48 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 0C50 */  0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                    /* 0C58 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 0C60 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 0C68 */  0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                    /* 0C70 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 0C78 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 0C80 */  0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                    /* 0C88 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 0C90 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 0C98 */  0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                    /* 0CA0 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 0CA8 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 0CB0 */  0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                    /* 0CB8 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 0CC0 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 0CC8 */  0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                    /* 0CD0 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 0CD8 */  0x07, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 0CE0 */  0x04, 0x00, 0x00, 0x00, 0x13, 0x00, 0x00, 0x00,  // ........
                    /* 0CE8 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 0CF0 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 0CF8 */  0x04, 0x00, 0x00, 0x00, 0x0E, 0x00, 0x00, 0x00,  // ........
                    /* 0D00 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 0D08 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 0D10 */  0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                    /* 0D18 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 0D20 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 0D28 */  0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                    /* 0D30 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 0D38 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 0D40 */  0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                    /* 0D48 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 0D50 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 0D58 */  0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                    /* 0D60 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 0D68 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 0D70 */  0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                    /* 0D78 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 0D80 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 0D88 */  0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                    /* 0D90 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 0D98 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 0DA0 */  0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                    /* 0DA8 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 0DB0 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 0DB8 */  0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                    /* 0DC0 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 0DC8 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 0DD0 */  0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                    /* 0DD8 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 0DE0 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 0DE8 */  0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                    /* 0DF0 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 0DF8 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 0E00 */  0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                    /* 0E08 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 0E10 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 0E18 */  0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                    /* 0E20 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 0E28 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 0E30 */  0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                    /* 0E38 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 0E40 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 0E48 */  0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                    /* 0E50 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 0E58 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 0E60 */  0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                    /* 0E68 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 0E70 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 0E78 */  0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                    /* 0E80 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 0E88 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 0E90 */  0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                    /* 0E98 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 0EA0 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 0EA8 */  0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                    /* 0EB0 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 0EB8 */  0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 0EC0 */  0x04, 0x00, 0x00, 0x00, 0x13, 0x00, 0x00, 0x00,  // ........
                    /* 0EC8 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 0ED0 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 0ED8 */  0x04, 0x00, 0x00, 0x00, 0x0D, 0x00, 0x00, 0x00,  // ........
                    /* 0EE0 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 0EE8 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 0EF0 */  0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                    /* 0EF8 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 0F00 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 0F08 */  0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                    /* 0F10 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 0F18 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 0F20 */  0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                    /* 0F28 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 0F30 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 0F38 */  0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                    /* 0F40 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 0F48 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 0F50 */  0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                    /* 0F58 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 0F60 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 0F68 */  0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                    /* 0F70 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 0F78 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 0F80 */  0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                    /* 0F88 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 0F90 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 0F98 */  0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                    /* 0FA0 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 0FA8 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 0FB0 */  0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                    /* 0FB8 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 0FC0 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 0FC8 */  0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                    /* 0FD0 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 0FD8 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 0FE0 */  0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                    /* 0FE8 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 0FF0 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 0FF8 */  0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                    /* 1000 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 1008 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 1010 */  0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                    /* 1018 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 1020 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 1028 */  0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                    /* 1030 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 1038 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 1040 */  0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                    /* 1048 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 1050 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 1058 */  0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                    /* 1060 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 1068 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 1070 */  0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                    /* 1078 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 1080 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 1088 */  0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                    /* 1090 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 1098 */  0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 10A0 */  0x04, 0x00, 0x00, 0x00, 0x13, 0x00, 0x00, 0x00,  // ........
                    /* 10A8 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 10B0 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 10B8 */  0x04, 0x00, 0x00, 0x00, 0x0C, 0x00, 0x00, 0x00,  // ........
                    /* 10C0 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 10C8 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 10D0 */  0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                    /* 10D8 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 10E0 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 10E8 */  0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                    /* 10F0 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 10F8 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 1100 */  0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                    /* 1108 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 1110 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 1118 */  0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                    /* 1120 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 1128 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 1130 */  0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                    /* 1138 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 1140 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 1148 */  0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                    /* 1150 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 1158 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 1160 */  0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                    /* 1168 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 1170 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 1178 */  0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                    /* 1180 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 1188 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 1190 */  0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                    /* 1198 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 11A0 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 11A8 */  0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                    /* 11B0 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 11B8 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 11C0 */  0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                    /* 11C8 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 11D0 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 11D8 */  0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                    /* 11E0 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 11E8 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 11F0 */  0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                    /* 11F8 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 1200 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 1208 */  0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                    /* 1210 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 1218 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 1220 */  0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                    /* 1228 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 1230 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 1238 */  0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                    /* 1240 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 1248 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 1250 */  0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                    /* 1258 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 1260 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 1268 */  0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                    /* 1270 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 1278 */  0x09, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 1280 */  0x04, 0x00, 0x00, 0x00, 0x13, 0x00, 0x00, 0x00,  // ........
                    /* 1288 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 1290 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 1298 */  0x04, 0x00, 0x00, 0x00, 0x0B, 0x00, 0x00, 0x00,  // ........
                    /* 12A0 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 12A8 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 12B0 */  0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                    /* 12B8 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 12C0 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 12C8 */  0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                    /* 12D0 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 12D8 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 12E0 */  0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                    /* 12E8 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 12F0 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 12F8 */  0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                    /* 1300 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 1308 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 1310 */  0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                    /* 1318 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 1320 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 1328 */  0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                    /* 1330 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 1338 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 1340 */  0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                    /* 1348 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 1350 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 1358 */  0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                    /* 1360 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 1368 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 1370 */  0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                    /* 1378 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 1380 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 1388 */  0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                    /* 1390 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 1398 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 13A0 */  0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                    /* 13A8 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 13B0 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 13B8 */  0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                    /* 13C0 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 13C8 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 13D0 */  0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                    /* 13D8 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 13E0 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 13E8 */  0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                    /* 13F0 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 13F8 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 1400 */  0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                    /* 1408 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 1410 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 1418 */  0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                    /* 1420 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 1428 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 1430 */  0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                    /* 1438 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 1440 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 1448 */  0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                    /* 1450 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 1458 */  0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 1460 */  0x04, 0x00, 0x00, 0x00, 0x13, 0x00, 0x00, 0x00,  // ........
                    /* 1468 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 1470 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 1478 */  0x04, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00,  // ........
                    /* 1480 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 1488 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 1490 */  0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                    /* 1498 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 14A0 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 14A8 */  0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                    /* 14B0 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 14B8 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 14C0 */  0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                    /* 14C8 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 14D0 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 14D8 */  0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                    /* 14E0 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 14E8 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 14F0 */  0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                    /* 14F8 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 1500 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 1508 */  0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                    /* 1510 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 1518 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 1520 */  0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                    /* 1528 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 1530 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 1538 */  0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                    /* 1540 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 1548 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 1550 */  0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                    /* 1558 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 1560 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 1568 */  0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                    /* 1570 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 1578 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 1580 */  0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                    /* 1588 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 1590 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 1598 */  0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                    /* 15A0 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 15A8 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 15B0 */  0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                    /* 15B8 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 15C0 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 15C8 */  0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                    /* 15D0 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 15D8 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 15E0 */  0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                    /* 15E8 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 15F0 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 15F8 */  0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                    /* 1600 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 1608 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 1610 */  0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                    /* 1618 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 1620 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 1628 */  0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                    /* 1630 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 1638 */  0x0A, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 1640 */  0x04, 0x00, 0x00, 0x00, 0x13, 0x00, 0x00, 0x00,  // ........
                    /* 1648 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 1650 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 1658 */  0x04, 0x00, 0x00, 0x00, 0x09, 0x00, 0x00, 0x00,  // ........
                    /* 1660 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 1668 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 1670 */  0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                    /* 1678 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 1680 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 1688 */  0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                    /* 1690 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 1698 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 16A0 */  0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                    /* 16A8 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 16B0 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 16B8 */  0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                    /* 16C0 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 16C8 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 16D0 */  0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                    /* 16D8 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 16E0 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 16E8 */  0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                    /* 16F0 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 16F8 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 1700 */  0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                    /* 1708 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 1710 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 1718 */  0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                    /* 1720 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 1728 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 1730 */  0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                    /* 1738 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 1740 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 1748 */  0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                    /* 1750 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 1758 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 1760 */  0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                    /* 1768 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 1770 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 1778 */  0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                    /* 1780 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 1788 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 1790 */  0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                    /* 1798 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 17A0 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 17A8 */  0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                    /* 17B0 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 17B8 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 17C0 */  0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                    /* 17C8 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 17D0 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 17D8 */  0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                    /* 17E0 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 17E8 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 17F0 */  0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                    /* 17F8 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 1800 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 1808 */  0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                    /* 1810 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 1818 */  0x0B, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 1820 */  0x04, 0x00, 0x00, 0x00, 0x13, 0x00, 0x00, 0x00,  // ........
                    /* 1828 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 1830 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 1838 */  0x04, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00,  // ........
                    /* 1840 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 1848 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 1850 */  0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                    /* 1858 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 1860 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 1868 */  0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                    /* 1870 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 1878 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 1880 */  0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                    /* 1888 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 1890 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 1898 */  0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                    /* 18A0 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 18A8 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 18B0 */  0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                    /* 18B8 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 18C0 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 18C8 */  0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                    /* 18D0 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 18D8 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 18E0 */  0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                    /* 18E8 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 18F0 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 18F8 */  0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                    /* 1900 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 1908 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 1910 */  0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                    /* 1918 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 1920 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 1928 */  0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                    /* 1930 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 1938 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 1940 */  0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                    /* 1948 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 1950 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 1958 */  0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                    /* 1960 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 1968 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 1970 */  0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                    /* 1978 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 1980 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 1988 */  0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                    /* 1990 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 1998 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 19A0 */  0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                    /* 19A8 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 19B0 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 19B8 */  0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                    /* 19C0 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 19C8 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 19D0 */  0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                    /* 19D8 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 19E0 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 19E8 */  0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                    /* 19F0 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 19F8 */  0x0C, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 1A00 */  0x04, 0x00, 0x00, 0x00, 0x13, 0x00, 0x00, 0x00,  // ........
                    /* 1A08 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 1A10 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 1A18 */  0x04, 0x00, 0x00, 0x00, 0x07, 0x00, 0x00, 0x00,  // ........
                    /* 1A20 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 1A28 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 1A30 */  0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                    /* 1A38 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 1A40 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 1A48 */  0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                    /* 1A50 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 1A58 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 1A60 */  0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                    /* 1A68 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 1A70 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 1A78 */  0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                    /* 1A80 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 1A88 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 1A90 */  0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                    /* 1A98 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 1AA0 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 1AA8 */  0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                    /* 1AB0 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 1AB8 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 1AC0 */  0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                    /* 1AC8 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 1AD0 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 1AD8 */  0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                    /* 1AE0 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 1AE8 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 1AF0 */  0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                    /* 1AF8 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 1B00 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 1B08 */  0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                    /* 1B10 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 1B18 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 1B20 */  0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                    /* 1B28 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 1B30 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 1B38 */  0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                    /* 1B40 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 1B48 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 1B50 */  0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                    /* 1B58 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 1B60 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 1B68 */  0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                    /* 1B70 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 1B78 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 1B80 */  0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                    /* 1B88 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 1B90 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 1B98 */  0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                    /* 1BA0 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 1BA8 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 1BB0 */  0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                    /* 1BB8 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 1BC0 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 1BC8 */  0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                    /* 1BD0 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 1BD8 */  0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 1BE0 */  0x04, 0x00, 0x00, 0x00, 0x13, 0x00, 0x00, 0x00,  // ........
                    /* 1BE8 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 1BF0 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 1BF8 */  0x04, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00,  // ........
                    /* 1C00 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 1C08 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 1C10 */  0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                    /* 1C18 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 1C20 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 1C28 */  0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                    /* 1C30 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 1C38 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 1C40 */  0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                    /* 1C48 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 1C50 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 1C58 */  0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                    /* 1C60 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 1C68 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 1C70 */  0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                    /* 1C78 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 1C80 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 1C88 */  0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                    /* 1C90 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 1C98 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 1CA0 */  0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                    /* 1CA8 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 1CB0 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 1CB8 */  0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                    /* 1CC0 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 1CC8 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 1CD0 */  0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                    /* 1CD8 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 1CE0 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 1CE8 */  0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                    /* 1CF0 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 1CF8 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 1D00 */  0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                    /* 1D08 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 1D10 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 1D18 */  0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                    /* 1D20 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 1D28 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 1D30 */  0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                    /* 1D38 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 1D40 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 1D48 */  0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                    /* 1D50 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 1D58 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 1D60 */  0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                    /* 1D68 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 1D70 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 1D78 */  0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                    /* 1D80 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 1D88 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 1D90 */  0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                    /* 1D98 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 1DA0 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 1DA8 */  0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                    /* 1DB0 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 1DB8 */  0x0D, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 1DC0 */  0x04, 0x00, 0x00, 0x00, 0x13, 0x00, 0x00, 0x00,  // ........
                    /* 1DC8 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 1DD0 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 1DD8 */  0x04, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00,  // ........
                    /* 1DE0 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 1DE8 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 1DF0 */  0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                    /* 1DF8 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 1E00 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 1E08 */  0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                    /* 1E10 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 1E18 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 1E20 */  0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                    /* 1E28 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 1E30 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 1E38 */  0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                    /* 1E40 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 1E48 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 1E50 */  0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                    /* 1E58 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 1E60 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 1E68 */  0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                    /* 1E70 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 1E78 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 1E80 */  0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                    /* 1E88 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 1E90 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 1E98 */  0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                    /* 1EA0 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 1EA8 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 1EB0 */  0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                    /* 1EB8 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 1EC0 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 1EC8 */  0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                    /* 1ED0 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 1ED8 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 1EE0 */  0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                    /* 1EE8 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 1EF0 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 1EF8 */  0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                    /* 1F00 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 1F08 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 1F10 */  0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                    /* 1F18 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 1F20 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 1F28 */  0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                    /* 1F30 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 1F38 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 1F40 */  0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                    /* 1F48 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 1F50 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 1F58 */  0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                    /* 1F60 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 1F68 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 1F70 */  0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                    /* 1F78 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 1F80 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 1F88 */  0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                    /* 1F90 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 1F98 */  0x05, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 1FA0 */  0x04, 0x00, 0x00, 0x00, 0x13, 0x00, 0x00, 0x00,  // ........
                    /* 1FA8 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 1FB0 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 1FB8 */  0x04, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 1FC0 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 1FC8 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 1FD0 */  0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                    /* 1FD8 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 1FE0 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 1FE8 */  0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                    /* 1FF0 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 1FF8 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 2000 */  0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                    /* 2008 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 2010 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 2018 */  0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                    /* 2020 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 2028 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 2030 */  0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                    /* 2038 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 2040 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 2048 */  0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                    /* 2050 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 2058 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 2060 */  0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                    /* 2068 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 2070 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 2078 */  0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                    /* 2080 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 2088 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 2090 */  0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                    /* 2098 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 20A0 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 20A8 */  0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                    /* 20B0 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 20B8 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 20C0 */  0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                    /* 20C8 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 20D0 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 20D8 */  0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                    /* 20E0 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 20E8 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 20F0 */  0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                    /* 20F8 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 2100 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 2108 */  0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                    /* 2110 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 2118 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 2120 */  0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                    /* 2128 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 2130 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 2138 */  0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                    /* 2140 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 2148 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 2150 */  0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                    /* 2158 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 2160 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 2168 */  0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                    /* 2170 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 2178 */  0x06, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 2180 */  0x04, 0x00, 0x00, 0x00, 0x13, 0x00, 0x00, 0x00,  // ........
                    /* 2188 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 2190 */  0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 2198 */  0x04, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00,  // ........
                    /* 21A0 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 21A8 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 21B0 */  0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                    /* 21B8 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 21C0 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 21C8 */  0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                    /* 21D0 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 21D8 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 21E0 */  0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                    /* 21E8 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 21F0 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 21F8 */  0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                    /* 2200 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 2208 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 2210 */  0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                    /* 2218 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 2220 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 2228 */  0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                    /* 2230 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 2238 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 2240 */  0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                    /* 2248 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 2250 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 2258 */  0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                    /* 2260 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 2268 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 2270 */  0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                    /* 2278 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 2280 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 2288 */  0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                    /* 2290 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 2298 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 22A0 */  0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                    /* 22A8 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 22B0 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 22B8 */  0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                    /* 22C0 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 22C8 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 22D0 */  0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                    /* 22D8 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 22E0 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 22E8 */  0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                    /* 22F0 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 22F8 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 2300 */  0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                    /* 2308 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 2310 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 2318 */  0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                    /* 2320 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 2328 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 2330 */  0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                    /* 2338 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 2340 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 2348 */  0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                    /* 2350 */  0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,  // ........
                    /* 2358 */  0x14, 0x00, 0x00, 0x00, 0x2F, 0x73, 0x68, 0x61,  // ..../sha
                    /* 2360 */  0x72, 0x65, 0x64, 0x2F, 0x65, 0x78, 0x70, 0x6F,  // red/expo
                    /* 2368 */  0x72, 0x74, 0x2F, 0x70, 0x62, 0x61, 0x74, 0x00,  // rt/pbat.
                    /* 2370 */  0x07, 0x00, 0x00, 0x00, 0x7A, 0x00, 0x00, 0x00,  // ....z...
                    /* 2378 */  0x04, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00,  // ........
                    /* 2380 */  0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00,  // ........
                    /* 2388 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 2390 */  0x08, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00,  // ........
                    /* 2398 */  0x00, 0x00, 0x00, 0x00, 0x30, 0x00, 0x08, 0x00,  // ....0...
                    /* 23A0 */  0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 23A8 */  0x00, 0x00, 0x5C, 0x5F, 0x53, 0x42, 0x5F, 0x2E,  // ..\_SB_.
                    /* 23B0 */  0x50, 0x43, 0x49, 0x30, 0x2E, 0x42, 0x30, 0x44,  // PCI0.B0D
                    /* 23B8 */  0x34, 0x00, 0x04, 0x00, 0x00, 0x00, 0x09, 0x00,  // 4.......
                    /* 23C0 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00,  // ........
                    /* 23C8 */  0x00, 0x00, 0x0E, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 23D0 */  0x00, 0x00, 0x50, 0x4C, 0x31, 0x50, 0x6F, 0x77,  // ..PL1Pow
                    /* 23D8 */  0x65, 0x72, 0x4C, 0x69, 0x6D, 0x69, 0x74, 0x00,  // erLimit.
                    /* 23E0 */  0x08, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00,  // ........
                    /* 23E8 */  0x00, 0x00, 0x00, 0x00, 0x31, 0x35, 0x30, 0x30,  // ....1500
                    /* 23F0 */  0x30, 0x00, 0x01, 0x00, 0x00, 0x00, 0x14, 0x00,  // 0.......
                    /* 23F8 */  0x00, 0x00, 0x2F, 0x73, 0x68, 0x61, 0x72, 0x65,  // ../share
                    /* 2400 */  0x64, 0x2F, 0x65, 0x78, 0x70, 0x6F, 0x72, 0x74,  // d/export
                    /* 2408 */  0x2F, 0x70, 0x62, 0x63, 0x74, 0x00, 0x07, 0x00,  // /pbct...
                    /* 2410 */  0x00, 0x00, 0xEC, 0x01, 0x00, 0x00, 0x04, 0x00,  // ........
                    /* 2418 */  0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 2420 */  0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x01, 0x00,  // ........
                    /* 2428 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x04, 0x00,  // ........
                    /* 2430 */  0x00, 0x00, 0x13, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 2438 */  0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x01, 0x00,  // ........
                    /* 2440 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x04, 0x00,  // ........
                    /* 2448 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 2450 */  0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x01, 0x00,  // ........
                    /* 2458 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x04, 0x00,  // ........
                    /* 2460 */  0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 2468 */  0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x01, 0x00,  // ........
                    /* 2470 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x04, 0x00,  // ........
                    /* 2478 */  0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 2480 */  0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x01, 0x00,  // ........
                    /* 2488 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x04, 0x00,  // ........
                    /* 2490 */  0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 2498 */  0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x01, 0x00,  // ........
                    /* 24A0 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x04, 0x00,  // ........
                    /* 24A8 */  0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 24B0 */  0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x01, 0x00,  // ........
                    /* 24B8 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x04, 0x00,  // ........
                    /* 24C0 */  0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 24C8 */  0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x01, 0x00,  // ........
                    /* 24D0 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x04, 0x00,  // ........
                    /* 24D8 */  0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 24E0 */  0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x01, 0x00,  // ........
                    /* 24E8 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x04, 0x00,  // ........
                    /* 24F0 */  0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 24F8 */  0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x01, 0x00,  // ........
                    /* 2500 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x04, 0x00,  // ........
                    /* 2508 */  0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 2510 */  0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x01, 0x00,  // ........
                    /* 2518 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x04, 0x00,  // ........
                    /* 2520 */  0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 2528 */  0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x01, 0x00,  // ........
                    /* 2530 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x04, 0x00,  // ........
                    /* 2538 */  0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 2540 */  0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x01, 0x00,  // ........
                    /* 2548 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x04, 0x00,  // ........
                    /* 2550 */  0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 2558 */  0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x01, 0x00,  // ........
                    /* 2560 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x04, 0x00,  // ........
                    /* 2568 */  0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 2570 */  0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x01, 0x00,  // ........
                    /* 2578 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x04, 0x00,  // ........
                    /* 2580 */  0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 2588 */  0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x01, 0x00,  // ........
                    /* 2590 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x04, 0x00,  // ........
                    /* 2598 */  0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 25A0 */  0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x01, 0x00,  // ........
                    /* 25A8 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x04, 0x00,  // ........
                    /* 25B0 */  0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 25B8 */  0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x01, 0x00,  // ........
                    /* 25C0 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x04, 0x00,  // ........
                    /* 25C8 */  0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 25D0 */  0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x01, 0x00,  // ........
                    /* 25D8 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x04, 0x00,  // ........
                    /* 25E0 */  0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 25E8 */  0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x01, 0x00,  // ........
                    /* 25F0 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x04, 0x00,  // ........
                    /* 25F8 */  0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 2600 */  0x00, 0x00                                       // ..
                }
            })
            If (((\XMID == Zero) || (\XMID == 0x04)))
            {
                Return (BUF0) /* \_SB_.IETM.GDDV.BUF0 */
            }
            ElseIf (((\XMID == 0x03) || (\XMID == 0x07)))
            {
                Return (BUF0) /* \_SB_.IETM.GDDV.BUF0 */
            }
            ElseIf (((\XMID == 0x02) || (\XMID == 0x06)))
            {
                Return (BUF0) /* \_SB_.IETM.GDDV.BUF0 */
            }
            ElseIf (((\XMID == One) || (\XMID == 0x05)))
            {
                Return (BUF0) /* \_SB_.IETM.GDDV.BUF0 */
            }
            Else
            {
                Return (Package (0x01)
                {
                    Buffer (0x0C)
                    {
                        /* 0000 */  0xE5, 0x1F, 0x0C, 0x00, 0x00, 0x00, 0x00, 0x01,  // ........
                        /* 0008 */  0x00, 0x00, 0x00, 0x00                           // ....
                    }
                })
            }
        }

        If (((PLID == 0x14) || (PLID == 0x15)))
        {
            Method (IMOK, 1, NotSerialized)
            {
                ADBG ("IMOK")
                ADBG (Arg0)
                Return (Arg0)
            }
        }
    }
}

