/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20251212 (32-bit version)
 * Copyright (c) 2000 - 2025 Intel Corporation
 * 
 * Disassembling to symbolic ASL+ operators
 *
 * Disassembly of SSDT-1-XnSsdt.aml
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x00000E3A (3642)
 *     Revision         0x02
 *     Checksum         0x42
 *     OEM ID           "LGE   "
 *     OEM Table ID     "XnSsdt "
 *     OEM Revision     0x00003000 (12288)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20160527 (538314023)
 */
DefinitionBlock ("", "SSDT", 2, "LGE   ", "XnSsdt ", 0x00003000)
{
    External (_GPE._L2B, MethodObj)    // 0 Arguments
    External (_PR_.CPU0, UnknownObj)
    External (_PR_.CPU0.TPSS, PkgObj)
    External (_PR_.CPU1, UnknownObj)
    External (_PR_.CPU2, UnknownObj)
    External (_PR_.CPU3, UnknownObj)
    External (_PR_.CPU4, UnknownObj)
    External (_PR_.CPU5, UnknownObj)
    External (_PR_.CPU6, UnknownObj)
    External (_PR_.CPU7, UnknownObj)
    External (_PR_.DSAE, UnknownObj)
    External (_PR_.DTS1, UnknownObj)
    External (_PR_.DTS2, UnknownObj)
    External (_PR_.DTS3, UnknownObj)
    External (_PR_.DTS4, UnknownObj)
    External (_PR_.DTSE, UnknownObj)
    External (_PR_.DTSF, UnknownObj)
    External (_PR_.PDTS, UnknownObj)
    External (_PR_.PKGA, UnknownObj)
    External (_PR_.TRPD, UnknownObj)
    External (_PR_.TRPF, UnknownObj)
    External (_SB_, DeviceObj)
    External (_SB_.CFGD, FieldUnitObj)
    External (_SB_.PCI0, DeviceObj)
    External (_SB_.PCI0.DOCK, DeviceObj)
    External (_SB_.PCI0.GFX0, DeviceObj)
    External (_SB_.PCI0.GFX0.ALSI, UnknownObj)
    External (_SB_.PCI0.GFX0.CBLV, UnknownObj)
    External (_SB_.PCI0.GFX0.CDCK, UnknownObj)
    External (_SB_.PCI0.GFX0.GSSE, UnknownObj)
    External (_SB_.PCI0.LPCB, DeviceObj)
    External (_SB_.PCI0.LPCB.H_EC, DeviceObj)
    External (_SB_.PCI0.LPCB.H_EC._Q63, MethodObj)    // 0 Arguments
    External (_SB_.PCI0.LPCB.H_EC.MAP1, DeviceObj)
    External (_SB_.PCI0.LPCB.H_EC.MAP1._WED, MethodObj)    // 1 Arguments
    External (_SB_.PCI0.LPCB.H_EC.MAP1.CA82, IntObj)
    External (_SB_.PCI0.LPCB.H_EC.MAP1.CAUS, IntObj)
    External (_SB_.PCI0.LPCB.H_EC.MAP1.WMAB, MethodObj)    // 3 Arguments
    External (_SB_.PCI0.LPCB.H_EC.MAP1.WMBA, MethodObj)    // 3 Arguments
    External (_SB_.PCI0.LPCB.H_EC.MAP1.WMBB, MethodObj)    // 3 Arguments
    External (_SB_.PCI0.RP01, DeviceObj)
    External (_SB_.PCI0.RP01.HPEX, FieldUnitObj)
    External (_SB_.PCI0.RP01.PMSX, FieldUnitObj)
    External (_SB_.PCI0.RP01.PXSX, DeviceObj)
    External (_SB_.PCI0.RP07, DeviceObj)
    External (_SB_.PCI0.XDCI, DeviceObj)
    External (_SB_.PWRB, DeviceObj)
    External (_TZ_.ETMD, IntObj)
    External (_TZ_.TZ00, ThermalZoneObj)
    External (_TZ_.TZ01, ThermalZoneObj)
    External (ACTT, IntObj)
    External (ADBG, MethodObj)    // 1 Arguments
    External (AITS, FieldUnitObj)
    External (ALSD, DeviceObj)
    External (ALSE, UnknownObj)
    External (BDRV, FieldUnitObj)
    External (BID_, IntObj)
    External (BRTL, UnknownObj)
    External (CTDB, IntObj)
    External (CWLS, FieldUnitObj)
    External (DBGS, IntObj)
    External (DKSM, IntObj)
    External (DSEN, IntObj)
    External (DSTS, IntObj)
    External (DTS1, FieldUnitObj)
    External (DTS2, FieldUnitObj)
    External (DTSE, FieldUnitObj)
    External (ECAV, UnknownObj)
    External (ECDB, IntObj)
    External (ECLP, IntObj)
    External (ECNO, IntObj)
    External (ECON, IntObj)
    External (ECRV, FieldUnitObj)
    External (ECUP, IntObj)
    External (EHLD, UnknownObj)
    External (FCEX, FieldUnitObj)
    External (FNKC, FieldUnitObj)
    External (FNMC, FieldUnitObj)
    External (FXOS, FieldUnitObj)
    External (HEFE, IntObj)
    External (IGDS, UnknownObj)
    External (IUBE, IntObj)
    External (IUCE, IntObj)
    External (IUDE, IntObj)
    External (LGON, FieldUnitObj)
    External (LHIH, UnknownObj)
    External (LIDS, UnknownObj)
    External (LLOW, UnknownObj)
    External (N00U, IntObj)
    External (N00W, FieldUnitObj)
    External (N00X, FieldUnitObj)
    External (N00Y, FieldUnitObj)
    External (N00Z, FieldUnitObj)
    External (N010, FieldUnitObj)
    External (N011, FieldUnitObj)
    External (N012, FieldUnitObj)
    External (N013, FieldUnitObj)
    External (N014, FieldUnitObj)
    External (N015, FieldUnitObj)
    External (N01W, FieldUnitObj)
    External (N023, FieldUnitObj)
    External (N024, FieldUnitObj)
    External (N02S, FieldUnitObj)
    External (N02W, FieldUnitObj)
    External (N02Y, MethodObj)    // 1 Arguments
    External (N02Z, MethodObj)    // 2 Arguments
    External (N038, FieldUnitObj)
    External (N03F, FieldUnitObj)
    External (N03G, FieldUnitObj)
    External (N03H, FieldUnitObj)
    External (N03I, FieldUnitObj)
    External (N03J, FieldUnitObj)
    External (N03K, FieldUnitObj)
    External (N03L, FieldUnitObj)
    External (N03M, FieldUnitObj)
    External (N03N, FieldUnitObj)
    External (N03O, FieldUnitObj)
    External (N03P, FieldUnitObj)
    External (N03Q, FieldUnitObj)
    External (N03R, FieldUnitObj)
    External (N03T, FieldUnitObj)
    External (N03U, FieldUnitObj)
    External (N03X, MethodObj)    // 0 Arguments
    External (N03Y, MethodObj)    // 0 Arguments
    External (N03Z, MethodObj)    // 0 Arguments
    External (N040, MethodObj)    // 0 Arguments
    External (N041, MethodObj)    // 0 Arguments
    External (N042, MethodObj)    // 0 Arguments
    External (N043, MethodObj)    // 0 Arguments
    External (N044, MethodObj)    // 0 Arguments
    External (N04D, FieldUnitObj)
    External (N055, MethodObj)    // 0 Arguments
    External (OSYS, IntObj)
    External (P2ME, FieldUnitObj)
    External (P2MK, FieldUnitObj)
    External (PB1E, IntObj)
    External (PFID, FieldUnitObj)
    External (PFLV, IntObj)
    External (PLMS, FieldUnitObj)
    External (PNOT, MethodObj)    // 0 Arguments
    External (PSVT, IntObj)
    External (PWRS, IntObj)
    External (RBEC, FieldUnitObj)
    External (RDMS, FieldUnitObj)
    External (RONS, FieldUnitObj)
    External (SSMP, IntObj)
    External (SWCM, FieldUnitObj)
    External (TBTS, IntObj)
    External (TCNT, IntObj)
    External (TRBA, FieldUnitObj)
    External (TRSZ, FieldUnitObj)
    External (UAMS, UnknownObj)
    External (WIFC, IntObj)
    External (WOLE, FieldUnitObj)
    External (XMID, FieldUnitObj)

    Name (LGEC, Zero)
    Name (XSTY, Zero)
    Name (XNTD, Zero)
    Name (NTFF, Zero)
    Method (NTF0, 1, NotSerialized)
    {
        If ((NTFF == Zero))
        {
            If ((Arg0 == 0x80))
            {
                \_SB.PCI0.LPCB.H_EC._Q63 ()
            }

            Notify (\_SB.PCI0.LPCB.H_EC.MAP1, Arg0)
        }
        Else
        {
            Notify (\XINI, Arg0)
        }
    }

    Device (XINI)
    {
        Name (_HID, "LGEX0820")  // _HID: Hardware ID
        Name (CCFG, Zero)
        OperationRegion (XIN1, 0x8F, Zero, 0x04B0)
        Field (XIN1, AnyAcc, Lock, Preserve)
        {
            DMSG,   8, 
            Offset (0x10), 
            P80B,   8, 
            P81B,   8, 
            P82B,   8, 
            P83B,   8, 
            P84B,   8, 
            P85B,   8, 
            P86B,   8, 
            P87B,   8, 
            Offset (0x3E8), 
            PMSG,   1600
        }

        Field (XIN1, DWordAcc, Lock, Preserve)
        {
            Offset (0x10), 
            P80D,   32, 
            P84D,   32
        }

        Name (PLAV, Zero)
        Method (_REG, 2, NotSerialized)  // _REG: Region Availability
        {
            If ((Arg0 == 0x8F))
            {
                If ((Arg1 == One))
                {
                    PLAV = One
                }
                Else
                {
                    PLAV = Zero
                }
            }
        }

        Method (_STA, 0, NotSerialized)  // _STA: Status
        {
            If (PLMS)
            {
                Return (0x1F)
            }
            Else
            {
                Return (Zero)
            }
        }

        Method (WMAB, 3, Serialized)
        {
            Return (\_SB.PCI0.LPCB.H_EC.MAP1.WMAB (Arg0, Arg1, Arg2))
        }

        Method (WMBA, 3, NotSerialized)
        {
            Return (\_SB.PCI0.LPCB.H_EC.MAP1.WMBA (Arg0, Arg1, Arg2))
        }

        Method (WMBB, 3, NotSerialized)
        {
            Return (\_SB.PCI0.LPCB.H_EC.MAP1.WMBB (Arg0, Arg1, Arg2))
        }

        Method (_WED, 1, NotSerialized)  // _Wxx: Wake Event, xx=0x00-0xFF
        {
            Return (\_SB.PCI0.LPCB.H_EC.MAP1._WED (Arg0))
        }

        Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
        {
            If ((Arg0 == ToUUID ("e9d5c705-0052-4646-aea3-ebdeca39001a") /* Unknown UUID */))
            {
                Switch (ToInteger (Arg2))
                {
                    Case (Zero)
                    {
                        If (\TBTS)
                        {
                            Return (Buffer (One)
                            {
                                 0x1D                                             // .
                            })
                        }
                        Else
                        {
                            Return (Buffer (One)
                            {
                                 0x05                                             // .
                            })
                        }
                    }
                    Case (One)
                    {
                        Return (Buffer (One)
                        {
                             0x00                                             // .
                        })
                    }
                    Case (0x02)
                    {
                        N055 ()
                        Return (Zero)
                    }
                    Case (0x03)
                    {
                        \_GPE._L2B ()
                        Return (Zero)
                    }
                    Case (0x04)
                    {
                        Notify (\_SB, Zero) // Bus Check
                        Return (Zero)
                    }
                    Case (0x05)
                    {
                        If ((CCFG == Zero))
                        {
                            CCFG = \_SB.CFGD /* External reference */
                        }
                        Else
                        {
                            \_SB.CFGD = CCFG /* \XINI.CCFG */
                            PNOT ()
                        }

                        Return (Zero)
                    }

                }
            }

            Return (Buffer (One)
            {
                 0x00                                             // .
            })
        }

        Method (IREP, 0, Serialized)
        {
            If ((XNTD & One))
            {
                ADBG ("IREP")
            }

            Return (Zero)
        }

        Method (OREP, 2, Serialized)
        {
            Switch (ToInteger (Arg0))
            {
                Case (Zero)
                {
                    Local0 = (Arg1 & 0xFF)
                    Local1 = Zero
                    If (CondRefOf (N02Y))
                    {
                        Local1 = N02Y (Local0)
                    }

                    Return (Local1)
                }
                Case (One)
                {
                    Local0 = (Arg1 & 0xFF)
                    Local1 = ((Arg1 >> 0x08) & 0xFF)
                    If (CondRefOf (N02Z))
                    {
                        N02Z (Local0, Local1)
                    }

                    Return (Zero)
                }
                Case (0x02)
                {
                    \XNTD = ToInteger (Arg1)
                    Return (Zero)
                }
                Case (0x03)
                {
                    Switch (ToInteger (Arg1))
                    {
                        Case (Zero)
                        {
                            If ((XNTD & One))
                            {
                                ADBG ("Going To S0")
                            }

                            If (CondRefOf (\N03X))
                            {
                                N03X ()
                            }
                        }
                        Case (One)
                        {
                            If ((XNTD & One))
                            {
                                ADBG ("Goint To Sx")
                            }

                            If (CondRefOf (\N03Y))
                            {
                                N03Y ()
                            }
                        }
                        Case (0x08)
                        {
                            If ((XNTD & One))
                            {
                                ADBG ("Goint To S3")
                            }
                        }
                        Case (0x10)
                        {
                            If ((XNTD & One))
                            {
                                ADBG ("Goint To Hibernate")
                            }

                            If (CondRefOf (\N03Z))
                            {
                                N03Z ()
                            }
                        }
                        Case (0x18)
                        {
                            If ((XNTD & One))
                            {
                                ADBG ("Goint To Hibrid Sleep")
                            }

                            If (CondRefOf (\N040))
                            {
                                N040 ()
                            }
                        }
                        Case (0x20)
                        {
                            If ((XNTD & One))
                            {
                                ADBG ("Goint To S5")
                            }

                            If (CondRefOf (\N041))
                            {
                                N041 ()
                            }
                        }
                        Case (0x30)
                        {
                            If ((XNTD & One))
                            {
                                ADBG ("Goint To Hibrid Shutdown")
                            }

                            If (CondRefOf (\N042))
                            {
                                N042 ()
                            }
                        }
                        Case (0x0100)
                        {
                            ADBG ("Boot and Resume Completed...")
                            If (CondRefOf (\N043))
                            {
                                N043 ()
                            }
                        }
                        Case (0x0101)
                        {
                            ADBG ("Temperature Updated")
                            If (CondRefOf (\N044))
                            {
                                N044 ()
                            }
                        }
                        Default
                        {
                            If ((XNTD & One))
                            {
                                ADBG ("XNTI Callback")
                                ADBG (ToHexString (Arg1))
                            }
                        }

                    }

                    Return (Zero)
                }
                Case (0x04)
                {
                    \NTFF = ToInteger (Arg1)
                    Return (Zero)
                }
                Case (0x06)
                {
                    WOLE = ToInteger (Arg1)
                    Return (Zero)
                }
                Default
                {
                    Return (Zero)
                }

            }
        }
    }

    Scope (\)
    {
        Name (WFLG, 0xFF)
        Name (OWNE, Zero)
        Name (HINH, Zero)
        Name (SPPC, Zero)
        Name (RDLY, Zero)
        Name (ARQ0, Zero)
        Name (OSDP, Zero)
        Name (PIPP, Zero)
        Name (FRED, Zero)
        Name (TSRC, 0x55)
        Name (TSEL, Zero)
        Name (ECOS, Zero)
        Method (G_DD, 2, NotSerialized)
        {
            CreateDWordField (Arg0, Arg1, Z001)
            Return (Z001) /* \G_DD.Z001 */
        }

        Method (G_DW, 2, NotSerialized)
        {
            CreateWordField (Arg0, Arg1, Z003)
            Return (Z003) /* \G_DW.Z003 */
        }

        Method (G_DB, 2, NotSerialized)
        {
            CreateByteField (Arg0, Arg1, Z005)
            Return (Z005) /* \G_DB.Z005 */
        }

        Method (S_DD, 3, NotSerialized)
        {
            CreateDWordField (Arg0, Arg1, Z001)
            Z001 = Arg2
        }

        Method (S_DW, 3, NotSerialized)
        {
            CreateWordField (Arg0, Arg1, Z003)
            Z003 = Arg2
        }

        Method (S_DB, 3, NotSerialized)
        {
            CreateByteField (Arg0, Arg1, Z005)
            Z005 = Arg2
        }

        Name (FCHE, Zero)
        Name (FPDC, Zero)
        Name (FPAC, Zero)
        Name (CSCT, Zero)
        Name (IFTM, Zero)
        Name (VIBC, Zero)
        Name (FFSD, Zero)
        Name (IFTA, Zero)
        Name (SEC, Zero)
        Name (MIN, Zero)
        Name (HOUR, Zero)
        Name (CIRM, Zero)
        Name (DATE, Zero)
        Name (MON, Zero)
        Name (YEAR, Zero)
        Name (CEN, Zero)
        Name (TVTM, Zero)
        Name (TV04, Zero)
        Name (TV07, Zero)
        Name (PLGE, Zero)
        Name (NAIO, Zero)
        Name (BSAT, Zero)
        Name (RECO, Zero)
        Name (BTW8, Zero)
        Name (XSAT, Zero)
        Name (NEXT, Zero)
        Name (CRNT, Zero)
        Name (CSST, Zero)
    }

    Scope (\_SB.PCI0.LPCB.H_EC)
    {
        Device (HBTN)
        {
            Name (_HID, "LGEX0815")  // _HID: Hardware ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If ((N023 && (OSYS >= 0x07DC)))
                {
                    Return (0x1F)
                }
                Else
                {
                    Return (Zero)
                }
            }

            Method (_WED, 1, NotSerialized)  // _Wxx: Wake Event, xx=0x00-0xFF
            {
                Return (Zero)
            }

            Method (IREP, 0, NotSerialized)
            {
                Debug = "IREP"
                Local0 = One
                Return (Local0)
            }

            Method (OREP, 2, NotSerialized)
            {
                Debug = "OREP"
                Return (Zero)
            }
        }
    }

    Name (EVKY, One)
    Name (EVBR, 0x0140)
    Name (EVWL, 0x0136)
    Name (EVFN, 0x013B)
    Name (EVDK, 0x0148)
}

