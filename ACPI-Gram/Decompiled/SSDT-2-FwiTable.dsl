/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20251212 (32-bit version)
 * Copyright (c) 2000 - 2025 Intel Corporation
 * 
 * Disassembling to symbolic ASL+ operators
 *
 * Disassembly of SSDT-2-FwiTable.aml
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x000046A2 (18082)
 *     Revision         0x01
 *     Checksum         0xDA
 *     OEM ID           "LGE   "
 *     OEM Table ID     "FwiTable"
 *     OEM Revision     0x00001000 (4096)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20160527 (538314023)
 */
DefinitionBlock ("", "SSDT", 1, "LGE   ", "FwiTable", 0x00001000)
{
    External (_SB_.DTS1, FieldUnitObj)
    External (_SB_.DTS2, FieldUnitObj)
    External (_SB_.DTSE, FieldUnitObj)
    External (_SB_.PCI0.LPCB.H_EC, DeviceObj)
    External (_SB_.PCI0.LPCB.H_EC.ACP_, FieldUnitObj)
    External (_SB_.PCI0.LPCB.H_EC.ALSD, DeviceObj)
    External (_SB_.PCI0.LPCB.H_EC.APPV, IntObj)
    External (_SB_.PCI0.LPCB.H_EC.AUDI, FieldUnitObj)
    External (_SB_.PCI0.LPCB.H_EC.BCEL, FieldUnitObj)
    External (_SB_.PCI0.LPCB.H_EC.BLW3, FieldUnitObj)
    External (_SB_.PCI0.LPCB.H_EC.BMB1, FieldUnitObj)
    External (_SB_.PCI0.LPCB.H_EC.BMB2, FieldUnitObj)
    External (_SB_.PCI0.LPCB.H_EC.BPP_, FieldUnitObj)
    External (_SB_.PCI0.LPCB.H_EC.BTST, FieldUnitObj)
    External (_SB_.PCI0.LPCB.H_EC.CBT_, FieldUnitObj)
    External (_SB_.PCI0.LPCB.H_EC.DATR, FieldUnitObj)
    External (_SB_.PCI0.LPCB.H_EC.DATW, FieldUnitObj)
    External (_SB_.PCI0.LPCB.H_EC.DAYM, FieldUnitObj)
    External (_SB_.PCI0.LPCB.H_EC.DAYS, FieldUnitObj)
    External (_SB_.PCI0.LPCB.H_EC.DBCH, FieldUnitObj)
    External (_SB_.PCI0.LPCB.H_EC.DFAN, FieldUnitObj)
    External (_SB_.PCI0.LPCB.H_EC.ECC0, FieldUnitObj)
    External (_SB_.PCI0.LPCB.H_EC.FCHE, FieldUnitObj)
    External (_SB_.PCI0.LPCB.H_EC.FMOD, FieldUnitObj)
    External (_SB_.PCI0.LPCB.H_EC.FNKN, FieldUnitObj)
    External (_SB_.PCI0.LPCB.H_EC.FNLK, FieldUnitObj)
    External (_SB_.PCI0.LPCB.H_EC.FRPM, FieldUnitObj)
    External (_SB_.PCI0.LPCB.H_EC.FSTM, FieldUnitObj)
    External (_SB_.PCI0.LPCB.H_EC.FTMP, FieldUnitObj)
    External (_SB_.PCI0.LPCB.H_EC.GTMP, FieldUnitObj)
    External (_SB_.PCI0.LPCB.H_EC.HBSP, FieldUnitObj)
    External (_SB_.PCI0.LPCB.H_EC.IKDP, FieldUnitObj)
    External (_SB_.PCI0.LPCB.H_EC.IKDU, FieldUnitObj)
    External (_SB_.PCI0.LPCB.H_EC.KBBM, FieldUnitObj)
    External (_SB_.PCI0.LPCB.H_EC.KBBR, FieldUnitObj)
    External (_SB_.PCI0.LPCB.H_EC.KBBS, FieldUnitObj)
    External (_SB_.PCI0.LPCB.H_EC.LBCR, FieldUnitObj)
    External (_SB_.PCI0.LPCB.H_EC.LBRI, FieldUnitObj)
    External (_SB_.PCI0.LPCB.H_EC.LID_, FieldUnitObj)
    External (_SB_.PCI0.LPCB.H_EC.LMD_, FieldUnitObj)
    External (_SB_.PCI0.LPCB.H_EC.MAP1, DeviceObj)
    External (_SB_.PCI0.LPCB.H_EC.MAP1.BCT1, MethodObj)    // 2 Arguments
    External (_SB_.PCI0.LPCB.H_EC.MAP1.CA82, IntObj)
    External (_SB_.PCI0.LPCB.H_EC.MAP1.CAUS, IntObj)
    External (_SB_.PCI0.LPCB.H_EC.MAP1.N00A, MethodObj)    // 0 Arguments
    External (_SB_.PCI0.LPCB.H_EC.MAP1.N00B, MethodObj)    // 0 Arguments
    External (_SB_.PCI0.LPCB.H_EC.MAP1.N00C, MethodObj)    // 1 Arguments
    External (_SB_.PCI0.LPCB.H_EC.MAP1.N00D, MethodObj)    // 0 Arguments
    External (_SB_.PCI0.LPCB.H_EC.MAP1.N00E, MethodObj)    // 0 Arguments
    External (_SB_.PCI0.LPCB.H_EC.MAP1.N00F, MethodObj)    // 1 Arguments
    External (_SB_.PCI0.LPCB.H_EC.MAP1.N00K, MethodObj)    // 0 Arguments
    External (_SB_.PCI0.LPCB.H_EC.MAP1.N00L, MethodObj)    // 0 Arguments
    External (_SB_.PCI0.LPCB.H_EC.MAP1.N00M, MethodObj)    // 0 Arguments
    External (_SB_.PCI0.LPCB.H_EC.MAP1.N00N, MethodObj)    // 0 Arguments
    External (_SB_.PCI0.LPCB.H_EC.MAP1.N00O, MethodObj)    // 2 Arguments
    External (_SB_.PCI0.LPCB.H_EC.MAP1.N00P, MethodObj)    // 0 Arguments
    External (_SB_.PCI0.LPCB.H_EC.MAP1.N00Q, MethodObj)    // 0 Arguments
    External (_SB_.PCI0.LPCB.H_EC.MAP1.N00R, MethodObj)    // 1 Arguments
    External (_SB_.PCI0.LPCB.H_EC.MAP1.N00S, MethodObj)    // 2 Arguments
    External (_SB_.PCI0.LPCB.H_EC.MAP1.N016, MethodObj)    // 0 Arguments
    External (_SB_.PCI0.LPCB.H_EC.MAP1.N017, MethodObj)    // 0 Arguments
    External (_SB_.PCI0.LPCB.H_EC.MAP1.N018, MethodObj)    // 1 Arguments
    External (_SB_.PCI0.LPCB.H_EC.MAP1.N019, MethodObj)    // 0 Arguments
    External (_SB_.PCI0.LPCB.H_EC.MAP1.N01A, MethodObj)    // 0 Arguments
    External (_SB_.PCI0.LPCB.H_EC.MAP1.N01B, MethodObj)    // 1 Arguments
    External (_SB_.PCI0.LPCB.H_EC.MAP1.N01C, MethodObj)    // 0 Arguments
    External (_SB_.PCI0.LPCB.H_EC.MAP1.N01D, MethodObj)    // 0 Arguments
    External (_SB_.PCI0.LPCB.H_EC.MAP1.N01E, MethodObj)    // 1 Arguments
    External (_SB_.PCI0.LPCB.H_EC.MAP1.N01F, MethodObj)    // 0 Arguments
    External (_SB_.PCI0.LPCB.H_EC.MAP1.N01G, MethodObj)    // 0 Arguments
    External (_SB_.PCI0.LPCB.H_EC.MAP1.N01H, MethodObj)    // 1 Arguments
    External (_SB_.PCI0.LPCB.H_EC.MAP1.N01I, MethodObj)    // 0 Arguments
    External (_SB_.PCI0.LPCB.H_EC.MAP1.N01J, MethodObj)    // 0 Arguments
    External (_SB_.PCI0.LPCB.H_EC.MAP1.N01K, MethodObj)    // 1 Arguments
    External (_SB_.PCI0.LPCB.H_EC.MAP1.N01L, MethodObj)    // 0 Arguments
    External (_SB_.PCI0.LPCB.H_EC.MAP1.N01M, MethodObj)    // 0 Arguments
    External (_SB_.PCI0.LPCB.H_EC.MAP1.N01N, MethodObj)    // 1 Arguments
    External (_SB_.PCI0.LPCB.H_EC.MAP1.N01O, MethodObj)    // 0 Arguments
    External (_SB_.PCI0.LPCB.H_EC.MAP1.N01P, MethodObj)    // 0 Arguments
    External (_SB_.PCI0.LPCB.H_EC.MAP1.N01Q, MethodObj)    // 0 Arguments
    External (_SB_.PCI0.LPCB.H_EC.MAP1.N01R, MethodObj)    // 0 Arguments
    External (_SB_.PCI0.LPCB.H_EC.MAP1.N01S, MethodObj)    // 1 Arguments
    External (_SB_.PCI0.LPCB.H_EC.MAP1.N01T, MethodObj)    // 0 Arguments
    External (_SB_.PCI0.LPCB.H_EC.MAP1.N01U, MethodObj)    // 1 Arguments
    External (_SB_.PCI0.LPCB.H_EC.MAP1.N01V, MethodObj)    // 2 Arguments
    External (_SB_.PCI0.LPCB.H_EC.MAP1.N025, MethodObj)    // 0 Arguments
    External (_SB_.PCI0.LPCB.H_EC.MAP1.N026, MethodObj)    // 1 Arguments
    External (_SB_.PCI0.LPCB.H_EC.MAP1.N027, MethodObj)    // 0 Arguments
    External (_SB_.PCI0.LPCB.H_EC.MAP1.N028, MethodObj)    // 2 Arguments
    External (_SB_.PCI0.LPCB.H_EC.MAP1.N029, MethodObj)    // 2 Arguments
    External (_SB_.PCI0.LPCB.H_EC.MAP1.N02A, MethodObj)    // 2 Arguments
    External (_SB_.PCI0.LPCB.H_EC.MAP1.N02B, MethodObj)    // 2 Arguments
    External (_SB_.PCI0.LPCB.H_EC.MAP1.N02G, MethodObj)    // 2 Arguments
    External (_SB_.PCI0.LPCB.H_EC.MAP1.N02H, MethodObj)    // 2 Arguments
    External (_SB_.PCI0.LPCB.H_EC.MAP1.N02I, MethodObj)    // 2 Arguments
    External (_SB_.PCI0.LPCB.H_EC.MAP1.N02J, MethodObj)    // 2 Arguments
    External (_SB_.PCI0.LPCB.H_EC.MAP1.N02K, MethodObj)    // 2 Arguments
    External (_SB_.PCI0.LPCB.H_EC.MAP1.N02L, MethodObj)    // 2 Arguments
    External (_SB_.PCI0.LPCB.H_EC.MAP1.N02M, MethodObj)    // 2 Arguments
    External (_SB_.PCI0.LPCB.H_EC.MAP1.N02U, MethodObj)    // 0 Arguments
    External (_SB_.PCI0.LPCB.H_EC.MAP1.N02V, MethodObj)    // 1 Arguments
    External (_SB_.PCI0.LPCB.H_EC.MAP1.N02Y, MethodObj)    // 1 Arguments
    External (_SB_.PCI0.LPCB.H_EC.MAP1.N02Z, MethodObj)    // 2 Arguments
    External (_SB_.PCI0.LPCB.H_EC.MAP1.N033, MethodObj)    // 0 Arguments
    External (_SB_.PCI0.LPCB.H_EC.MAP1.N034, MethodObj)    // 1 Arguments
    External (_SB_.PCI0.LPCB.H_EC.MAP1.N03D, MethodObj)    // 0 Arguments
    External (_SB_.PCI0.LPCB.H_EC.MAP1.N03E, MethodObj)    // 1 Arguments
    External (_SB_.PCI0.LPCB.H_EC.MAP1.N03V, MethodObj)    // 0 Arguments
    External (_SB_.PCI0.LPCB.H_EC.MAP1.N03W, MethodObj)    // 0 Arguments
    External (_SB_.PCI0.LPCB.H_EC.MAP1.N049, MethodObj)    // 2 Arguments
    External (_SB_.PCI0.LPCB.H_EC.MAP1.N04A, MethodObj)    // 2 Arguments
    External (_SB_.PCI0.LPCB.H_EC.MAP1.N04B, MethodObj)    // 2 Arguments
    External (_SB_.PCI0.LPCB.H_EC.MAP1.TPCT, MethodObj)    // 2 Arguments
    External (_SB_.PCI0.LPCB.H_EC.MAP1.WMAB, MethodObj)    // 3 Arguments
    External (_SB_.PCI0.LPCB.H_EC.MUTE, FieldUnitObj)
    External (_SB_.PCI0.LPCB.H_EC.NOST, FieldUnitObj)
    External (_SB_.PCI0.LPCB.H_EC.OPCR, FieldUnitObj)
    External (_SB_.PCI0.LPCB.H_EC.PBP_, FieldUnitObj)
    External (_SB_.PCI0.LPCB.H_EC.PFD_, FieldUnitObj)
    External (_SB_.PCI0.LPCB.H_EC.PIP_, FieldUnitObj)
    External (_SB_.PCI0.LPCB.H_EC.PRDU, FieldUnitObj)
    External (_SB_.PCI0.LPCB.H_EC.PTPT, FieldUnitObj)
    External (_SB_.PCI0.LPCB.H_EC.RDMD, FieldUnitObj)
    External (_SB_.PCI0.LPCB.H_EC.RPM2, FieldUnitObj)
    External (_SB_.PCI0.LPCB.H_EC.RRRR, FieldUnitObj)
    External (_SB_.PCI0.LPCB.H_EC.SD0A, FieldUnitObj)
    External (_SB_.PCI0.LPCB.H_EC.SD0B, FieldUnitObj)
    External (_SB_.PCI0.LPCB.H_EC.SD0C, FieldUnitObj)
    External (_SB_.PCI0.LPCB.H_EC.SD0D, FieldUnitObj)
    External (_SB_.PCI0.LPCB.H_EC.SD0E, FieldUnitObj)
    External (_SB_.PCI0.LPCB.H_EC.SD0F, FieldUnitObj)
    External (_SB_.PCI0.LPCB.H_EC.SD10, FieldUnitObj)
    External (_SB_.PCI0.LPCB.H_EC.SD11, FieldUnitObj)
    External (_SB_.PCI0.LPCB.H_EC.SD12, FieldUnitObj)
    External (_SB_.PCI0.LPCB.H_EC.SD13, FieldUnitObj)
    External (_SB_.PCI0.LPCB.H_EC.SD14, FieldUnitObj)
    External (_SB_.PCI0.LPCB.H_EC.SD15, FieldUnitObj)
    External (_SB_.PCI0.LPCB.H_EC.SD16, FieldUnitObj)
    External (_SB_.PCI0.LPCB.H_EC.SD17, FieldUnitObj)
    External (_SB_.PCI0.LPCB.H_EC.SD18, FieldUnitObj)
    External (_SB_.PCI0.LPCB.H_EC.SD19, FieldUnitObj)
    External (_SB_.PCI0.LPCB.H_EC.SD1A, FieldUnitObj)
    External (_SB_.PCI0.LPCB.H_EC.SD1B, FieldUnitObj)
    External (_SB_.PCI0.LPCB.H_EC.SD1C, FieldUnitObj)
    External (_SB_.PCI0.LPCB.H_EC.SD1D, FieldUnitObj)
    External (_SB_.PCI0.LPCB.H_EC.SD1E, FieldUnitObj)
    External (_SB_.PCI0.LPCB.H_EC.SD1F, FieldUnitObj)
    External (_SB_.PCI0.LPCB.H_EC.SDA0, FieldUnitObj)
    External (_SB_.PCI0.LPCB.H_EC.SDA1, FieldUnitObj)
    External (_SB_.PCI0.LPCB.H_EC.SDA2, FieldUnitObj)
    External (_SB_.PCI0.LPCB.H_EC.SDA3, FieldUnitObj)
    External (_SB_.PCI0.LPCB.H_EC.SDA4, FieldUnitObj)
    External (_SB_.PCI0.LPCB.H_EC.SDA5, FieldUnitObj)
    External (_SB_.PCI0.LPCB.H_EC.SDA6, FieldUnitObj)
    External (_SB_.PCI0.LPCB.H_EC.SDA7, FieldUnitObj)
    External (_SB_.PCI0.LPCB.H_EC.SDA8, FieldUnitObj)
    External (_SB_.PCI0.LPCB.H_EC.SDA9, FieldUnitObj)
    External (_SB_.PCI0.LPCB.H_EC.SLPB, DeviceObj)
    External (_SB_.PCI0.LPCB.H_EC.SMAD, FieldUnitObj)
    External (_SB_.PCI0.LPCB.H_EC.SMCM, FieldUnitObj)
    External (_SB_.PCI0.LPCB.H_EC.SMCT, FieldUnitObj)
    External (_SB_.PCI0.LPCB.H_EC.SMDE, FieldUnitObj)
    External (_SB_.PCI0.LPCB.H_EC.SMPR, FieldUnitObj)
    External (_SB_.PCI0.LPCB.H_EC.SMST, FieldUnitObj)
    External (_SB_.PCI0.LPCB.H_EC.TMOD, FieldUnitObj)
    External (_SB_.PCI0.LPCB.H_EC.TMP1, FieldUnitObj)
    External (_SB_.PCI0.LPCB.H_EC.TMP2, FieldUnitObj)
    External (_SB_.PCI0.LPCB.H_EC.TPDP, FieldUnitObj)
    External (_SB_.PCI0.LPCB.H_EC.TPDU, FieldUnitObj)
    External (_SB_.PCI0.LPCB.H_EC.TVT0, FieldUnitObj)
    External (_SB_.PCI0.LPCB.H_EC.TVT1, FieldUnitObj)
    External (_SB_.PCI0.LPCB.H_EC.TVT2, FieldUnitObj)
    External (_SB_.PCI0.LPCB.H_EC.TVT3, FieldUnitObj)
    External (_SB_.PCI0.LPCB.H_EC.VER_, FieldUnitObj)
    External (_SB_.PCI0.LPCB.H_EC.VIBC, FieldUnitObj)
    External (_SB_.PCI0.RP01, DeviceObj)
    External (_SB_.PCI0.RP01.HPEX, FieldUnitObj)
    External (_SB_.PCI0.RP01.PMSX, FieldUnitObj)
    External (_SB_.PCI0.RP01.PXSX, DeviceObj)
    External (_SB_.PWRB, DeviceObj)
    External (_SB_.SLPB, DeviceObj)
    External (AFAN, FieldUnitObj)
    External (AITS, FieldUnitObj)
    External (ARQ0, IntObj)
    External (BDRV, FieldUnitObj)
    External (CCLB, FieldUnitObj)
    External (CDAT, FieldUnitObj)
    External (CEN_, UnknownObj)
    External (CIND, FieldUnitObj)
    External (CIRM, IntObj)
    External (CRNT, FieldUnitObj)
    External (CWLS, FieldUnitObj)
    External (DATE, UnknownObj)
    External (DFAN, FieldUnitObj)
    External (DTS1, FieldUnitObj)
    External (DTS2, FieldUnitObj)
    External (DTSE, FieldUnitObj)
    External (ECON, FieldUnitObj)
    External (ECRV, FieldUnitObj)
    External (FCEX, FieldUnitObj)
    External (FCHE, FieldUnitObj)
    External (FLUX, IntObj)
    External (FNKC, FieldUnitObj)
    External (FNMC, FieldUnitObj)
    External (FRED, IntObj)
    External (FXOS, FieldUnitObj)
    External (G_DB, MethodObj)    // 2 Arguments
    External (G_DD, MethodObj)    // 2 Arguments
    External (G_DW, MethodObj)    // 2 Arguments
    External (HINH, IntObj)
    External (HOUR, UnknownObj)
    External (IGDS, UnknownObj)
    External (LGEC, IntObj)
    External (LGON, FieldUnitObj)
    External (LXIN, IntObj)
    External (LXOT, IntObj)
    External (LXSV, IntObj)
    External (MIN_, UnknownObj)
    External (MON_, UnknownObj)
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
    External (N01X, FieldUnitObj)
    External (N023, FieldUnitObj)
    External (N024, FieldUnitObj)
    External (N02S, FieldUnitObj)
    External (N02T, FieldUnitObj)
    External (N02W, FieldUnitObj)
    External (N02X, FieldUnitObj)
    External (N032, FieldUnitObj)
    External (N037, FieldUnitObj)
    External (N038, FieldUnitObj)
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
    External (N04D, FieldUnitObj)
    External (NEXT, IntObj)
    External (NTF0, MethodObj)    // 1 Arguments
    External (OSDP, IntObj)
    External (OSYS, IntObj)
    External (OWNE, IntObj)
    External (P8XH, MethodObj)    // 2 Arguments
    External (PFID, FieldUnitObj)
    External (PIPP, IntObj)
    External (PLMS, FieldUnitObj)
    External (PWRS, FieldUnitObj)
    External (RBEC, FieldUnitObj)
    External (RDLY, IntObj)
    External (RDMS, FieldUnitObj)
    External (RONS, FieldUnitObj)
    External (S_DB, MethodObj)    // 3 Arguments
    External (S_DD, MethodObj)    // 3 Arguments
    External (S_DW, MethodObj)    // 3 Arguments
    External (SEC_, UnknownObj)
    External (SWCM, FieldUnitObj)
    External (TRBA, FieldUnitObj)
    External (TRSZ, FieldUnitObj)
    External (TSEL, IntObj)
    External (TSRC, IntObj)
    External (TV04, IntObj)
    External (TV07, IntObj)
    External (TVTM, UnknownObj)
    External (VIBC, IntObj)
    External (WOLE, FieldUnitObj)
    External (XMID, FieldUnitObj)
    External (YEAR, UnknownObj)

    Scope (\_SB.PCI0.LPCB.H_EC)
    {
        Device (MAP1)
        {
            Method (_HID, 0, NotSerialized)  // _HID: Hardware ID
            {
                Return (0x140CD041)
            }

            Name (_UID, Zero)  // _UID: Unique ID
            Name (MAR0, Zero)
            Name (MAR1, Zero)
            Name (MAR2, Zero)
            Name (APCT, Zero)
            Name (EVKY, One)
            Name (EVBR, 0x0140)
            Name (EVWL, 0x0136)
            Name (EVFN, 0x013B)
            Name (EVDK, 0x0148)
            Name (_WDG, Buffer (0xA0)
            {
                /* 0000 */  0x38, 0x2B, 0xA7, 0xC3, 0xEF, 0xD3, 0xD3, 0x42,  // 8+.....B
                /* 0008 */  0x8C, 0xBB, 0xD5, 0xA5, 0x70, 0x49, 0xF6, 0x6D,  // ....pI.m
                /* 0010 */  0x41, 0x42, 0xFF, 0x02, 0xF9, 0x94, 0xFB, 0xE4,  // AB......
                /* 0018 */  0x2B, 0x7F, 0x73, 0x41, 0xAD, 0x1A, 0xCD, 0x1D,  // +.sA....
                /* 0020 */  0x95, 0x08, 0x62, 0x48, 0x80, 0x00, 0x01, 0x08,  // ..bH....
                /* 0028 */  0x3E, 0x13, 0x3B, 0x02, 0xD1, 0x49, 0x10, 0x4E,  // >.;..I.N
                /* 0030 */  0xB3, 0x13, 0x69, 0x82, 0x20, 0x14, 0x0D, 0xC2,  // ..i. ...
                /* 0038 */  0x81, 0x00, 0x01, 0x08, 0xC0, 0x1A, 0xBE, 0x37,  // .......7
                /* 0040 */  0xF2, 0xC3, 0x1F, 0x4B, 0xBF, 0xBE, 0x8F, 0xDE,  // ...K....
                /* 0048 */  0xAF, 0x28, 0x14, 0xD6, 0x82, 0x00, 0x01, 0x08,  // .(......
                /* 0050 */  0x44, 0xAD, 0x1B, 0x91, 0xF8, 0x7D, 0xBB, 0x4F,  // D....}.O
                /* 0058 */  0x93, 0x19, 0xBA, 0xBA, 0x1C, 0x4B, 0x29, 0x3B,  // .....K);
                /* 0060 */  0x8F, 0x00, 0x01, 0x08, 0x04, 0x44, 0x5C, 0x4E,  // .....D\N
                /* 0068 */  0xED, 0x3C, 0x5E, 0x4A, 0x8C, 0x7A, 0x1B, 0xA8,  // .<^J.z..
                /* 0070 */  0x75, 0xD0, 0x0A, 0x43, 0x42, 0x41, 0x01, 0x02,  // u..CBA..
                /* 0078 */  0x1A, 0x50, 0x4F, 0x2B, 0x3C, 0xBD, 0x94, 0x43,  // .PO+<..C
                /* 0080 */  0x8D, 0xCF, 0x00, 0xA7, 0xD2, 0xBC, 0x82, 0x10,  // ........
                /* 0088 */  0x42, 0x42, 0x01, 0x02, 0x21, 0x12, 0x90, 0x05,  // BB..!...
                /* 0090 */  0x66, 0xD5, 0xD1, 0x11, 0xB2, 0xF0, 0x00, 0xA0,  // f.......
                /* 0098 */  0xC9, 0x06, 0x29, 0x10, 0x41, 0x43, 0x01, 0x00   // ..).AC..
            })
            Method (_WED, 1, NotSerialized)  // _Wxx: Wake Event, xx=0x00-0xFF
            {
                If ((Arg0 == 0x80))
                {
                    Return (EKEY (CAUS))
                }

                If ((Arg0 == 0x81))
                {
                    Return (ETMP (Zero))
                }

                If ((Arg0 == 0x82))
                {
                    Return (EMIS (Zero))
                }

                Return (Arg0)
            }

            Method (WE80, 1, NotSerialized)
            {
                Return (Zero)
            }

            Name (CAUS, Zero)
            Name (CA81, Zero)
            Name (CA82, Zero)
            Method (EKEY, 1, NotSerialized)
            {
                Local0 = Zero
                If ((CAUS == EVKY))
                {
                    If (CondRefOf (N00K))
                    {
                        Local0 = N00K ()
                    }

                    Return (Local0)
                }

                If ((CAUS == EVBR))
                {
                    If (CondRefOf (N00L))
                    {
                        Local0 = N00L ()
                    }

                    Local0 <<= 0x10
                    Local0 |= EVBR /* \_SB_.PCI0.LPCB.H_EC.MAP1.EVBR */
                    Return (Local0)
                }

                If ((CAUS == EVDK))
                {
                    If (CondRefOf (N00M))
                    {
                        Local0 = N00M ()
                    }

                    Local0 <<= 0x10
                    Local0 |= EVDK /* \_SB_.PCI0.LPCB.H_EC.MAP1.EVDK */
                    CAUS = Zero
                    Return (Local0)
                }

                If ((CAUS == EVFN))
                {
                    If (CondRefOf (N00N))
                    {
                        Local0 = N00N ()
                    }

                    Local0 <<= 0x10
                    Local0 |= EVFN /* \_SB_.PCI0.LPCB.H_EC.MAP1.EVFN */
                    Return (Local0)
                }

                If ((CAUS == EVWL))
                {
                    If (CondRefOf (N00O))
                    {
                        Local0 = N00O (One, Zero)
                    }

                    Local0 <<= 0x10
                    Local0 |= EVWL /* \_SB_.PCI0.LPCB.H_EC.MAP1.EVWL */
                    Return (Local0)
                }

                Return (Local0)
            }

            Method (ETMP, 1, NotSerialized)
            {
                Local1 = CA81 /* \_SB_.PCI0.LPCB.H_EC.MAP1.CA81 */
                If ((Local1 != Zero))
                {
                    Return (Local1)
                }

                Local0 = Zero
                If ((Local0 == 0x04))
                {
                    If (APCT)
                    {
                        Local0 = 0x0280
                    }
                    Else
                    {
                        Notify (\_SB.PWRB, 0x80) // Status Change
                    }
                }
                Else
                {
                    Local0 |= 0x01000000
                }

                Return (Local0)
            }

            Method (EMIS, 1, NotSerialized)
            {
                Local0 = CA82 /* \_SB_.PCI0.LPCB.H_EC.MAP1.CA82 */
                Return (Local0)
            }

            Method (WMBA, 3, Serialized)
            {
                Local0 = Arg2
                S_DW (Local0, 0x08, 0x80000001)
                If (((Arg1 == One) || (Arg1 == 0x02)))
                {
                    If ((G_DD (Local0, Zero) <= 0xFF))
                    {
                        If ((G_DW (Local0, 0x04) == One))
                        {
                            S_DW (Local0, 0x08, Zero)
                            S_DD (Local0, 0x10, ^WMAB (G_DD (Local0, Zero), One, Zero))
                        }
                        ElseIf ((G_DW (Local0, 0x04) == 0x02))
                        {
                            S_DW (Local0, 0x08, Zero)
                            ^WMAB (G_DD (Local0, Zero), 0x02, G_DD (Local0, 0x10))
                        }
                        Else
                        {
                            S_DW (Local0, 0x08, 0x80000001)
                        }
                    }
                    ElseIf ((G_DD (Local0, Zero) >= 0x0100))
                    {
                        If ((G_DD (Local0, Zero) == 0x0100))
                        {
                            If ((G_DW (Local0, 0x04) == Zero))
                            {
                                S_DW (Local0, 0x10, \_SB.PCI0.LPCB.H_EC.TMP1)
                                S_DW (Local0, 0x12, \_SB.PCI0.LPCB.H_EC.GTMP)
                                If (DTSE){}
                                S_DW (Local0, 0x16, DTS1)
                                S_DW (Local0, 0x18, DTS2)
                            }
                        }
                    }

                    Return (Local0)
                }

                Return (Zero)
            }

            Method (WMBB, 3, Serialized)
            {
                Local0 = Arg2
                S_DW (Local0, 0x08, 0x80000001)
                If (((Arg1 == One) || (Arg1 == 0x02)))
                {
                    Switch (G_DD (Local0, Zero))
                    {
                        Case (0x0100)
                        {
                            If ((G_DW (Local0, 0x04) == 0x02))
                            {
                                S_DW (Local0, 0x08, Zero)
                                \_SB.PCI0.LPCB.H_EC.SMAD = 0x08
                                \_SB.PCI0.LPCB.H_EC.SMCM = 0x05
                                \_SB.PCI0.LPCB.H_EC.SMCT = 0x02
                                \_SB.PCI0.LPCB.H_EC.SDA0 = (G_DW (Local0, 0x10) & 0xFF)
                                \_SB.PCI0.LPCB.H_EC.SDA1 = (G_DW (Local0, 0x12) & 0xFF)
                                \RDLY = (G_DW (Local0, 0x12) & 0xFF)
                                \_SB.PCI0.LPCB.H_EC.SMPR = 0x0A
                            }
                        }
                        Case (0x0108)
                        {
                            S_DW (Local0, 0x08, Zero)
                            Switch (G_DW (Local0, 0x04))
                            {
                                Case (0x0100)
                                {
                                    S_DB (Local0, 0x10, \_SB.PCI0.LPCB.H_EC.ECC0)
                                    S_DB (Local0, 0x11, \_SB.PCI0.LPCB.H_EC.FMOD)
                                    S_DB (Local0, 0x12, \_SB.PCI0.LPCB.H_EC.FRPM)
                                    S_DB (Local0, 0x13, \_SB.PCI0.LPCB.H_EC.TMOD)
                                    S_DW (Local0, 0x14, \_SB.PCI0.LPCB.H_EC.CBT)
                                    S_DB (Local0, 0x0F, 0x06)
                                }
                                Case (0x0101)
                                {
                                    If ((G_DB (Local0, 0x0C) & One))
                                    {
                                        \_SB.PCI0.LPCB.H_EC.ECC0 = G_DB (Local0, 0x10)
                                    }

                                    If ((G_DB (Local0, 0x0C) & 0x02))
                                    {
                                        \_SB.PCI0.LPCB.H_EC.FMOD = G_DB (Local0, 0x11)
                                    }

                                    If ((G_DB (Local0, 0x0C) & 0x40))
                                    {
                                        \_SB.PCI0.LPCB.H_EC.RPM2 = G_DB (Local0, 0x16)
                                    }

                                    If ((G_DB (Local0, 0x0C) & 0x80))
                                    {
                                        \_SB.PCI0.LPCB.H_EC.FTMP = G_DB (Local0, 0x17)
                                    }

                                    If ((G_DB (Local0, 0x0C) & 0x04))
                                    {
                                        \_SB.PCI0.LPCB.H_EC.FRPM = G_DB (Local0, 0x12)
                                    }

                                    If ((G_DB (Local0, 0x0C) & 0x08))
                                    {
                                        \_SB.PCI0.LPCB.H_EC.TMOD = G_DB (Local0, 0x13)
                                    }
                                }
                                Case (0x0102)
                                {
                                    \_SB.PCI0.LPCB.H_EC.SMST &= 0x40
                                    Switch ((G_DB (Local0, 0x0C) & One))
                                    {
                                        Case (One)
                                        {
                                            \_SB.PCI0.LPCB.H_EC.SMAD = G_DB (Local0, 0x0D)
                                            \_SB.PCI0.LPCB.H_EC.SMCM = G_DB (Local0, 0x0E)
                                            \_SB.PCI0.LPCB.H_EC.SMPR = G_DB (Local0, 0x0C)
                                            While (!Local1 = (\_SB.PCI0.LPCB.H_EC.SMST & 0xBF))
                                            {
                                                Sleep (0x02)
                                            }

                                            If ((Local1 == 0x80))
                                            {
                                                S_DB (Local0, 0x0F, \_SB.PCI0.LPCB.H_EC.SMCT)
                                                S_DB (Local0, 0x10, \_SB.PCI0.LPCB.H_EC.SDA0)
                                                S_DB (Local0, 0x11, \_SB.PCI0.LPCB.H_EC.SDA1)
                                                S_DB (Local0, 0x12, \_SB.PCI0.LPCB.H_EC.SDA2)
                                                S_DB (Local0, 0x13, \_SB.PCI0.LPCB.H_EC.SDA3)
                                                S_DB (Local0, 0x14, \_SB.PCI0.LPCB.H_EC.SDA4)
                                                S_DB (Local0, 0x15, \_SB.PCI0.LPCB.H_EC.SDA5)
                                                S_DB (Local0, 0x16, \_SB.PCI0.LPCB.H_EC.SDA6)
                                                S_DB (Local0, 0x17, \_SB.PCI0.LPCB.H_EC.SDA7)
                                                S_DB (Local0, 0x18, \_SB.PCI0.LPCB.H_EC.SDA8)
                                                S_DB (Local0, 0x19, \_SB.PCI0.LPCB.H_EC.SDA9)
                                                S_DB (Local0, 0x1A, \_SB.PCI0.LPCB.H_EC.SD0A)
                                                S_DB (Local0, 0x1B, \_SB.PCI0.LPCB.H_EC.SD0B)
                                                S_DB (Local0, 0x1C, \_SB.PCI0.LPCB.H_EC.SD0C)
                                                S_DB (Local0, 0x1D, \_SB.PCI0.LPCB.H_EC.SD0D)
                                                S_DB (Local0, 0x1E, \_SB.PCI0.LPCB.H_EC.SD0E)
                                                S_DB (Local0, 0x1F, \_SB.PCI0.LPCB.H_EC.SD0F)
                                                S_DB (Local0, 0x20, \_SB.PCI0.LPCB.H_EC.SD10)
                                                S_DB (Local0, 0x21, \_SB.PCI0.LPCB.H_EC.SD11)
                                                S_DB (Local0, 0x22, \_SB.PCI0.LPCB.H_EC.SD12)
                                                S_DB (Local0, 0x23, \_SB.PCI0.LPCB.H_EC.SD13)
                                                S_DB (Local0, 0x24, \_SB.PCI0.LPCB.H_EC.SD14)
                                                S_DB (Local0, 0x25, \_SB.PCI0.LPCB.H_EC.SD15)
                                                S_DB (Local0, 0x26, \_SB.PCI0.LPCB.H_EC.SD16)
                                                S_DB (Local0, 0x27, \_SB.PCI0.LPCB.H_EC.SD17)
                                                S_DB (Local0, 0x28, \_SB.PCI0.LPCB.H_EC.SD18)
                                                S_DB (Local0, 0x29, \_SB.PCI0.LPCB.H_EC.SD19)
                                                S_DB (Local0, 0x2A, \_SB.PCI0.LPCB.H_EC.SD1A)
                                                S_DB (Local0, 0x2B, \_SB.PCI0.LPCB.H_EC.SD1B)
                                                S_DB (Local0, 0x2C, \_SB.PCI0.LPCB.H_EC.SD1C)
                                                S_DB (Local0, 0x2D, \_SB.PCI0.LPCB.H_EC.SD1D)
                                                S_DB (Local0, 0x2E, \_SB.PCI0.LPCB.H_EC.SD1E)
                                                S_DB (Local0, 0x2F, \_SB.PCI0.LPCB.H_EC.SD1F)
                                            }
                                            Else
                                            {
                                                S_DW (Local0, 0x08, 0x80000003)
                                            }
                                        }
                                        Case (Zero)
                                        {
                                            \_SB.PCI0.LPCB.H_EC.SDA0 = G_DB (Local0, 0x10)
                                            \_SB.PCI0.LPCB.H_EC.SDA1 = G_DB (Local0, 0x11)
                                            \_SB.PCI0.LPCB.H_EC.SDA2 = G_DB (Local0, 0x12)
                                            \_SB.PCI0.LPCB.H_EC.SDA3 = G_DB (Local0, 0x13)
                                            \_SB.PCI0.LPCB.H_EC.SDA4 = G_DB (Local0, 0x14)
                                            \_SB.PCI0.LPCB.H_EC.SDA5 = G_DB (Local0, 0x15)
                                            \_SB.PCI0.LPCB.H_EC.SDA6 = G_DB (Local0, 0x16)
                                            \_SB.PCI0.LPCB.H_EC.SDA7 = G_DB (Local0, 0x17)
                                            \_SB.PCI0.LPCB.H_EC.SDA8 = G_DB (Local0, 0x18)
                                            \_SB.PCI0.LPCB.H_EC.SDA9 = G_DB (Local0, 0x19)
                                            \_SB.PCI0.LPCB.H_EC.SD0A = G_DB (Local0, 0x1A)
                                            \_SB.PCI0.LPCB.H_EC.SD0B = G_DB (Local0, 0x1B)
                                            \_SB.PCI0.LPCB.H_EC.SD0C = G_DB (Local0, 0x1C)
                                            \_SB.PCI0.LPCB.H_EC.SD0D = G_DB (Local0, 0x1D)
                                            \_SB.PCI0.LPCB.H_EC.SD0E = G_DB (Local0, 0x1E)
                                            \_SB.PCI0.LPCB.H_EC.SD0F = G_DB (Local0, 0x1F)
                                            \_SB.PCI0.LPCB.H_EC.SD10 = G_DB (Local0, 0x20)
                                            \_SB.PCI0.LPCB.H_EC.SD11 = G_DB (Local0, 0x21)
                                            \_SB.PCI0.LPCB.H_EC.SD12 = G_DB (Local0, 0x22)
                                            \_SB.PCI0.LPCB.H_EC.SD13 = G_DB (Local0, 0x23)
                                            \_SB.PCI0.LPCB.H_EC.SD14 = G_DB (Local0, 0x24)
                                            \_SB.PCI0.LPCB.H_EC.SD15 = G_DB (Local0, 0x25)
                                            \_SB.PCI0.LPCB.H_EC.SD16 = G_DB (Local0, 0x26)
                                            \_SB.PCI0.LPCB.H_EC.SD17 = G_DB (Local0, 0x27)
                                            \_SB.PCI0.LPCB.H_EC.SD18 = G_DB (Local0, 0x28)
                                            \_SB.PCI0.LPCB.H_EC.SD19 = G_DB (Local0, 0x29)
                                            \_SB.PCI0.LPCB.H_EC.SD1A = G_DB (Local0, 0x2A)
                                            \_SB.PCI0.LPCB.H_EC.SD1B = G_DB (Local0, 0x2B)
                                            \_SB.PCI0.LPCB.H_EC.SD1C = G_DB (Local0, 0x2C)
                                            \_SB.PCI0.LPCB.H_EC.SD1D = G_DB (Local0, 0x2D)
                                            \_SB.PCI0.LPCB.H_EC.SD1E = G_DB (Local0, 0x2E)
                                            \_SB.PCI0.LPCB.H_EC.SD1F = G_DB (Local0, 0x2F)
                                            \_SB.PCI0.LPCB.H_EC.SMCT = G_DB (Local0, 0x0F)
                                            \_SB.PCI0.LPCB.H_EC.SMAD = G_DB (Local0, 0x0D)
                                            \_SB.PCI0.LPCB.H_EC.SMCM = G_DB (Local0, 0x0E)
                                            \_SB.PCI0.LPCB.H_EC.SMPR = G_DB (Local0, 0x0C)
                                            While (!Local1 = (\_SB.PCI0.LPCB.H_EC.SMST & 0xBF))
                                            {
                                                Sleep (0x02)
                                            }

                                            If ((Local1 != 0x80))
                                            {
                                                S_DW (Local0, 0x08, 0x80000003)
                                            }
                                        }
                                        Default
                                        {
                                            S_DW (Local0, 0x08, 0x80000002)
                                        }

                                    }
                                }
                                Case (0x0103)
                                {
                                    S_DD (Local0, 0x10, Zero)
                                    S_DD (Local0, 0x14, Zero)
                                    S_DD (Local0, 0x18, Zero)
                                    S_DD (Local0, 0x1C, Zero)
                                    S_DD (Local0, 0x20, Zero)
                                    S_DD (Local0, 0x24, Zero)
                                    S_DD (Local0, 0x28, Zero)
                                    If ((G_DD (Local0, 0x0C) & One))
                                    {
                                        S_DW (Local0, 0x10, \_SB.PCI0.LPCB.H_EC.TMP1)
                                        S_DW (Local0, 0x14, \_SB.PCI0.LPCB.H_EC.TMP2)
                                        S_DW (Local0, 0x18, \_SB.PCI0.LPCB.H_EC.GTMP)
                                        S_DW (Local0, 0x1C, \_SB.PCI0.LPCB.H_EC.GTMP)
                                        P8XH (Zero, \_SB.PCI0.LPCB.H_EC.TMP1)
                                    }

                                    If ((G_DD (Local0, 0x0C) & 0x02))
                                    {
                                        S_DW (Local0, 0x14, \_SB.PCI0.LPCB.H_EC.TMP2)
                                    }

                                    If ((G_DD (Local0, 0x0C) & 0x04))
                                    {
                                        S_DW (Local0, 0x18, \_SB.PCI0.LPCB.H_EC.GTMP)
                                    }

                                    If ((G_DD (Local0, 0x0C) & 0x08))
                                    {
                                        S_DW (Local0, 0x1C, \_SB.PCI0.LPCB.H_EC.GTMP)
                                    }

                                    If ((G_DD (Local0, 0x0C) & 0x10)){}
                                    If ((G_DD (Local0, 0x0C) & 0x20))
                                    {
                                        S_DW (Local0, 0x24, DTS1)
                                    }

                                    If ((G_DD (Local0, 0x0C) & 0x40))
                                    {
                                        S_DW (Local0, 0x28, DTS2)
                                    }

                                    S_DB (Local0, 0x0F, 0x1C)
                                }
                                Default
                                {
                                    S_DW (Local0, 0x08, 0x80000002)
                                }

                            }
                        }
                        Case (0x010B)
                        {
                            If ((N00Y == Zero))
                            {
                                S_DW (Local0, 0x08, 0x80000001)
                                Return (Local0)
                            }

                            Switch (G_DW (Local0, 0x04))
                            {
                                Case (One)
                                {
                                    S_DW (Local0, 0x08, Zero)
                                    S_DD (Local0, 0x10, Zero)
                                    S_DD (Local0, 0x14, Zero)
                                    S_DD (Local0, 0x18, Zero)
                                    S_DD (Local0, 0x1C, Zero)
                                    If (CondRefOf (N02U))
                                    {
                                        S_DB (Local0, 0x10, N02U ())
                                    }

                                    S_DB (Local0, 0x1F, One)
                                    Return (Local0)
                                }
                                Case (0x02)
                                {
                                    S_DW (Local0, 0x08, Zero)
                                    N02T = (G_DB (Local0, 0x10) & One)
                                    If (CondRefOf (N02V))
                                    {
                                        N02V (N02T)
                                    }

                                    Return (Local0)
                                }
                                Default
                                {
                                    S_DW (Local0, 0x08, 0x80000002)
                                    Return (Local0)
                                }

                            }
                        }
                        Case (0x010C)
                        {
                            If ((N01W == Zero))
                            {
                                S_DW (Local0, 0x08, 0x80000001)
                                Return (Local0)
                            }

                            Switch (G_DW (Local0, 0x04))
                            {
                                Case (One)
                                {
                                    S_DW (Local0, 0x08, Zero)
                                    S_DD (Local0, 0x10, Zero)
                                    S_DD (Local0, 0x14, Zero)
                                    S_DD (Local0, 0x18, Zero)
                                    S_DD (Local0, 0x1C, Zero)
                                    If (CondRefOf (N033))
                                    {
                                        S_DB (Local0, 0x10, N033 ())
                                    }

                                    S_DB (Local0, 0x12, One)
                                    S_DB (Local0, 0x13, 0x50)
                                    Return (Local0)
                                }
                                Case (0x02)
                                {
                                    S_DW (Local0, 0x08, Zero)
                                    N032 = G_DB (Local0, 0x10)
                                    If (CondRefOf (N034))
                                    {
                                        N034 (N032)
                                    }

                                    Return (Local0)
                                }
                                Default
                                {
                                    S_DW (Local0, 0x08, 0x80000002)
                                    Return (Local0)
                                }

                            }
                        }
                        Case (0x0114)
                        {
                            If ((N00X == Zero))
                            {
                                S_DW (Local0, 0x08, 0x80000001)
                                Return (Local0)
                            }

                            Switch (G_DW (Local0, 0x04))
                            {
                                Case (One)
                                {
                                    S_DW (Local0, 0x08, Zero)
                                    S_DD (Local0, 0x10, Zero)
                                    S_DD (Local0, 0x14, Zero)
                                    S_DD (Local0, 0x18, Zero)
                                    S_DD (Local0, 0x1C, Zero)
                                    S_DB (Local0, 0x10, N02W)
                                    S_DB (Local0, 0x12, One)
                                    Return (Local0)
                                }
                                Case (0x02)
                                {
                                    S_DW (Local0, 0x08, Zero)
                                    N02W = (G_DB (Local0, 0x10) & One)
                                    Return (Local0)
                                }
                                Default
                                {
                                    S_DW (Local0, 0x08, 0x02)
                                    Return (Local0)
                                }

                            }
                        }
                        Case (0x0115)
                        {
                            Switch (G_DW (Local0, 0x04))
                            {
                                Case (One)
                                {
                                    S_DW (Local0, 0x08, Zero)
                                    S_DD (Local0, 0x10, Zero)
                                    S_DD (Local0, 0x14, Zero)
                                    S_DD (Local0, 0x18, Zero)
                                    S_DD (Local0, 0x1C, Zero)
                                    S_DB (Local0, 0x10, N02X)
                                    Return (Local0)
                                }
                                Case (0x02)
                                {
                                    S_DW (Local0, 0x08, Zero)
                                    N02X = G_DB (Local0, 0x10)
                                    Return (Local0)
                                }
                                Default
                                {
                                    S_DW (Local0, 0x08, 0x02)
                                    Return (Local0)
                                }

                            }
                        }
                        Case (0x0116)
                        {
                            Switch (G_DW (Local0, 0x04))
                            {
                                Case (One)
                                {
                                    S_DW (Local0, 0x08, Zero)
                                    Local1 = G_DB (Local0, 0x10)
                                    S_DD (Local0, 0x10, Zero)
                                    S_DD (Local0, 0x14, Zero)
                                    S_DD (Local0, 0x18, Zero)
                                    S_DD (Local0, 0x1C, Zero)
                                    S_DB (Local0, 0x10, Local1)
                                    If (CondRefOf (N02Y))
                                    {
                                        S_DB (Local0, 0x11, N02Y (Local1))
                                    }

                                    Return (Local0)
                                }
                                Case (0x02)
                                {
                                    S_DW (Local0, 0x08, Zero)
                                    Local1 = G_DB (Local0, 0x10)
                                    Local2 = G_DB (Local0, 0x11)
                                    S_DD (Local0, 0x10, Zero)
                                    S_DD (Local0, 0x14, Zero)
                                    S_DD (Local0, 0x18, Zero)
                                    S_DD (Local0, 0x1C, Zero)
                                    S_DB (Local0, 0x10, Local1)
                                    If (CondRefOf (N02Z))
                                    {
                                        N02Z (Local1, Local2)
                                    }

                                    If (CondRefOf (N02Y))
                                    {
                                        S_DB (Local0, 0x11, N02Y (Local1))
                                    }

                                    Return (Local0)
                                }
                                Default
                                {
                                    S_DW (Local0, 0x08, 0x02)
                                    Return (Local0)
                                }

                            }
                        }
                        Case (0x0118)
                        {
                            If ((N03U != One))
                            {
                                S_DW (Local0, 0x08, 0x02)
                                Return (Local0)
                            }

                            Switch (G_DW (Local0, 0x04))
                            {
                                Case (One)
                                {
                                    S_DW (Local0, 0x08, Zero)
                                    Local1 = G_DB (Local0, 0x10)
                                    S_DD (Local0, 0x10, Zero)
                                    S_DD (Local0, 0x14, Zero)
                                    S_DD (Local0, 0x18, Zero)
                                    S_DD (Local0, 0x1C, Zero)
                                    If (CondRefOf (N03D))
                                    {
                                        S_DB (Local0, 0x10, N03D ())
                                    }

                                    Return (Local0)
                                }
                                Case (0x02)
                                {
                                    S_DW (Local0, 0x08, Zero)
                                    If (CondRefOf (N03E))
                                    {
                                        N03E ((G_DB (Local0, 0x10) & One))
                                    }

                                    Return (Local0)
                                }
                                Default
                                {
                                    S_DW (Local0, 0x08, 0x02)
                                    Return (Local0)
                                }

                            }
                        }
                        Case (0x0119)
                        {
                            Switch (G_DW (Local0, 0x04))
                            {
                                Case (0x02)
                                {
                                    S_DW (Local0, 0x08, Zero)
                                    If ((N00Y == One))
                                    {
                                        If (CondRefOf (N02V))
                                        {
                                            N02V ((N02T & One))
                                        }
                                    }

                                    If (CondRefOf (N034))
                                    {
                                        N034 (N032)
                                    }

                                    N038 = One
                                    Return (Local0)
                                }
                                Default
                                {
                                    S_DW (Local0, 0x08, 0x02)
                                    Return (Local0)
                                }

                            }
                        }
                        Case (0x011A)
                        {
                            If ((N03U != One))
                            {
                                S_DW (Local0, 0x08, 0x02)
                                Return (Local0)
                            }

                            Switch (G_DW (Local0, 0x04))
                            {
                                Case (One)
                                {
                                    S_DW (Local0, 0x08, Zero)
                                    Local1 = G_DB (Local0, 0x10)
                                    S_DD (Local0, 0x10, Zero)
                                    S_DD (Local0, 0x14, Zero)
                                    S_DD (Local0, 0x18, Zero)
                                    S_DD (Local0, 0x1C, Zero)
                                    S_DB (Local0, 0x10, (N02S & One))
                                    Return (Local0)
                                }
                                Case (0x02)
                                {
                                    S_DW (Local0, 0x08, Zero)
                                    Return (Local0)
                                }
                                Default
                                {
                                    S_DW (Local0, 0x08, 0x02)
                                    Return (Local0)
                                }

                            }
                        }
                        Case (0x0200)
                        {
                            Switch (G_DW (Local0, 0x04))
                            {
                                Case (One)
                                {
                                    S_DW (Local0, 0x08, Zero)
                                    Local1 = G_DB (Local0, 0x10)
                                    S_DD (Local0, 0x10, Zero)
                                    S_DD (Local0, 0x14, Zero)
                                    S_DD (Local0, 0x18, Zero)
                                    S_DD (Local0, 0x1C, Zero)
                                    S_DB (Local0, 0x10, N037)
                                    Return (Local0)
                                }
                                Case (0x02)
                                {
                                    S_DW (Local0, 0x08, Zero)
                                    N037 = G_DB (Local0, 0x10)
                                    Return (Local0)
                                }
                                Default
                                {
                                    S_DW (Local0, 0x08, 0x02)
                                    Return (Local0)
                                }

                            }
                        }
                        Default
                        {
                            S_DW (Local0, 0x08, 0x80000001)
                        }

                    }

                    Return (Local0)
                }
            }

            OperationRegion (XTRP, SystemIO, 0xB2, 0x02)
            Field (XTRP, ByteAcc, NoLock, Preserve)
            {
                XTR0,   8, 
                XTR1,   8
            }

            Method (WMAB, 3, Serialized)
            {
                MAR0 = Arg0
                MAR1 = Arg1
                MAR2 = Arg2
                If ((MAR0 >= 0x0100))
                {
                    Local1 = Buffer (0x08)
                        {
                             0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00   // ........
                        }
                    CreateDWordField (Local1, Zero, RVAL)
                    CreateDWordField (Local1, 0x04, SVAL)
                    RVAL = Zero
                    SVAL = 0x80000003
                    If ((MAR0 == 0x0400))
                    {
                        SVAL = 0x80000002
                        If (CondRefOf (N00A))
                        {
                            If ((N00A () == Zero))
                            {
                                Return (Local1)
                            }

                            If ((MAR1 == One))
                            {
                                Local0 = Zero
                                If (CondRefOf (N00B))
                                {
                                    Local0 = N00B ()
                                }

                                RVAL = Local0
                                SVAL = Zero
                                Return (Local1)
                            }
                            ElseIf ((MAR1 == 0x02))
                            {
                                Local0 = (MAR2 & Ones)
                                If (CondRefOf (N00C))
                                {
                                    N00C (Local0)
                                }

                                SVAL = Zero
                                RVAL = Zero
                                Return (Local1)
                            }
                        }

                        Return (Local1)
                    }

                    If ((MAR0 == 0x0401))
                    {
                        SVAL = 0x80000002
                        If (CondRefOf (N00D))
                        {
                            If ((N00D () == Zero))
                            {
                                Return (Local1)
                            }

                            If ((MAR1 == One))
                            {
                                Local0 = Zero
                                If (CondRefOf (N00E))
                                {
                                    Local0 = N00E ()
                                }

                                RVAL = Local0
                                SVAL = Zero
                                Return (Local1)
                            }
                            ElseIf ((MAR1 == 0x02))
                            {
                                Local0 = (MAR2 & Ones)
                                If (CondRefOf (N00F))
                                {
                                    N00F (Local0)
                                }

                                SVAL = Zero
                                RVAL = Zero
                                Return (Local1)
                            }
                        }

                        Return (Local1)
                    }

                    If ((MAR0 == 0x0404))
                    {
                        SVAL = 0x80000002
                        If (CondRefOf (N016))
                        {
                            If ((N016 () == Zero))
                            {
                                Return (Local1)
                            }

                            If ((MAR1 == One))
                            {
                                Local0 = Zero
                                If (CondRefOf (N017))
                                {
                                    Local0 = N017 ()
                                }

                                RVAL = Local0
                                SVAL = Zero
                                Return (Local1)
                            }
                            ElseIf ((MAR1 == 0x02))
                            {
                                Local0 = (MAR2 & Ones)
                                If (CondRefOf (N018))
                                {
                                    N018 (Local0)
                                }

                                SVAL = Zero
                                RVAL = Zero
                                Return (Local1)
                            }
                        }

                        Return (Local1)
                    }

                    If ((MAR0 == 0x0405))
                    {
                        SVAL = 0x80000002
                        If (CondRefOf (N019))
                        {
                            If ((N019 () == Zero))
                            {
                                Return (Local1)
                            }

                            If ((MAR1 == One))
                            {
                                Local0 = Zero
                                If (CondRefOf (N01A))
                                {
                                    Local0 = N01A ()
                                }

                                RVAL = Local0
                                SVAL = Zero
                                Return (Local1)
                            }
                            ElseIf ((MAR1 == 0x02))
                            {
                                Local0 = (MAR2 & Ones)
                                If (CondRefOf (N01B))
                                {
                                    N01B (Local0)
                                }

                                SVAL = Zero
                                RVAL = Zero
                                Return (Local1)
                            }
                        }

                        Return (Local1)
                    }

                    If ((MAR0 == 0x0406))
                    {
                        SVAL = 0x80000002
                        If (CondRefOf (N01C))
                        {
                            If ((N01C () == Zero))
                            {
                                Return (Local1)
                            }

                            If ((MAR1 == One))
                            {
                                Local0 = Zero
                                If (CondRefOf (N01D))
                                {
                                    Local0 = N01D ()
                                }

                                RVAL = Local0
                                SVAL = Zero
                                Return (Local1)
                            }
                            ElseIf ((MAR1 == 0x02))
                            {
                                Local0 = (MAR2 & Ones)
                                If (CondRefOf (N01E))
                                {
                                    N01E (Local0)
                                }

                                SVAL = Zero
                                RVAL = Zero
                                Return (Local1)
                            }
                        }

                        Return (Local1)
                    }

                    If ((MAR0 == 0x0407))
                    {
                        SVAL = 0x80000002
                        If (CondRefOf (N01F))
                        {
                            If ((N01F () == Zero))
                            {
                                Return (Local1)
                            }

                            If ((MAR1 == One))
                            {
                                Local0 = Zero
                                If (CondRefOf (N01G))
                                {
                                    Local0 = N01G ()
                                }

                                RVAL = Local0
                                SVAL = Zero
                                Return (Local1)
                            }
                            ElseIf ((MAR1 == 0x02))
                            {
                                Local0 = (MAR2 & Ones)
                                If (CondRefOf (N01H))
                                {
                                    N01H (Local0)
                                }

                                SVAL = Zero
                                RVAL = Zero
                                Return (Local1)
                            }
                        }

                        Return (Local1)
                    }

                    If ((MAR0 == 0x0408))
                    {
                        SVAL = 0x80000002
                        If (CondRefOf (N01I))
                        {
                            If ((N01I () == Zero))
                            {
                                Return (Local1)
                            }

                            If ((MAR1 == One))
                            {
                                Local0 = Zero
                                If (CondRefOf (N01J))
                                {
                                    Local0 = N01J ()
                                }

                                RVAL = Local0
                                SVAL = Zero
                                Return (Local1)
                            }
                            ElseIf ((MAR1 == 0x02))
                            {
                                Local0 = (MAR2 & Ones)
                                If (CondRefOf (N01K))
                                {
                                    N01K (Local0)
                                }

                                SVAL = Zero
                                RVAL = Zero
                                Return (Local1)
                            }
                        }

                        Return (Local1)
                    }

                    If ((MAR0 == 0x0409))
                    {
                        SVAL = 0x80000002
                        If (CondRefOf (N01L))
                        {
                            If ((N01L () == Zero))
                            {
                                Return (Local1)
                            }

                            If ((MAR1 == One))
                            {
                                Local0 = Zero
                                If (CondRefOf (N01M))
                                {
                                    Local0 = N01M ()
                                }

                                RVAL = Local0
                                SVAL = Zero
                                Return (Local1)
                            }
                            ElseIf ((MAR1 == 0x02))
                            {
                                Local0 = (MAR2 & Ones)
                                If (CondRefOf (N01N))
                                {
                                    N01N (Local0)
                                }

                                SVAL = Zero
                                RVAL = Zero
                                Return (Local1)
                            }
                        }

                        Return (Local1)
                    }

                    If ((MAR0 == 0x040A))
                    {
                        SVAL = 0x80000002
                        If (CondRefOf (N00P))
                        {
                            If ((N00P () == Zero))
                            {
                                Return (Local1)
                            }

                            If ((MAR1 == One))
                            {
                                Local0 = Zero
                                If (CondRefOf (N00Q))
                                {
                                    Local0 = N00Q ()
                                }

                                RVAL = Local0
                                SVAL = Zero
                                Return (Local1)
                            }
                            ElseIf ((MAR1 == 0x02))
                            {
                                Local0 = (MAR2 & Ones)
                                If (CondRefOf (N00R))
                                {
                                    N00R (Local0)
                                }

                                SVAL = Zero
                                RVAL = Zero
                                Return (Local1)
                            }
                        }

                        Return (Local1)
                    }

                    Return (Local1)
                }

                If (((MAR0 >= Zero) && (MAR0 <= 0x2F)))
                {
                    If ((MAR0 == Zero))
                    {
                        If ((MAR1 == One))
                        {
                            Return (0x0303)
                        }

                        Return (0x80000002)
                    }

                    If ((MAR0 == One))
                    {
                        If ((MAR1 == One))
                        {
                            Return (One)
                        }

                        Return (0x80000002)
                    }

                    If ((MAR0 == 0x02))
                    {
                        If ((MAR1 == One))
                        {
                            Return (LGEC) /* External reference */
                        }

                        Return (0x80000002)
                    }

                    If ((MAR0 == 0x03))
                    {
                        If ((MAR1 == One))
                        {
                            Local0 = Zero
                            If (CondRefOf (N01O))
                            {
                                Local0 = N01O ()
                            }

                            Return (Local0)
                        }

                        Return (0x80000002)
                    }

                    If ((MAR0 == 0x04))
                    {
                        If ((MAR1 == One))
                        {
                            Local0 = Zero
                            If (CondRefOf (N01P))
                            {
                                Local0 = N01P ()
                            }

                            Return (Local0)
                        }

                        Return (0x80000002)
                    }

                    If ((MAR0 == 0x05))
                    {
                        If ((MAR1 == One))
                        {
                            Return (APCT) /* \_SB_.PCI0.LPCB.H_EC.MAP1.APCT */
                        }
                        ElseIf ((MAR1 == 0x02))
                        {
                            APCT = MAR2 /* \_SB_.PCI0.LPCB.H_EC.MAP1.MAR2 */
                            Return (Zero)
                        }

                        Return (0x80000002)
                    }

                    If ((MAR0 == 0x06))
                    {
                        If ((MAR1 == One))
                        {
                            Local0 = HINH /* External reference */
                            Return (Local0)
                        }
                        ElseIf ((MAR1 == 0x02))
                        {
                            Local0 = MAR2 /* \_SB_.PCI0.LPCB.H_EC.MAP1.MAR2 */
                            HINH = Local0
                            Return (Zero)
                        }

                        Return (0x80000002)
                    }

                    If ((MAR0 == 0x08))
                    {
                        Return (0x80000002)
                    }

                    If ((MAR0 == 0x09))
                    {
                        Return (0x80000002)
                    }

                    If ((MAR0 == 0x0A))
                    {
                        Return (0x80000002)
                    }

                    If ((MAR0 == 0x0E))
                    {
                        If ((MAR1 == One))
                        {
                            Local0 = 0x04004100
                            If (CondRefOf (N01Q))
                            {
                                Local0 = N01Q ()
                            }

                            Return (Local0)
                        }

                        Return (0x80000002)
                    }

                    If ((MAR0 == 0x0F))
                    {
                        If ((MAR1 == One))
                        {
                            Local0 = 0x09
                            If (CondRefOf (N01R))
                            {
                                Local0 = N01R ()
                            }

                            Return (Local0)
                        }

                        Return (0x80000002)
                    }

                    Return (0x80000001)
                }

                If (((MAR0 >= 0x30) && (MAR0 <= 0x5F)))
                {
                    If ((MAR0 == 0x3A))
                    {
                        If ((MAR1 == 0x02))
                        {
                            If (CondRefOf (N01S))
                            {
                                N01S (MAR2)
                            }

                            Return (Zero)
                        }

                        Return (0x80000002)
                    }

                    If ((MAR0 == 0x30))
                    {
                        If (CondRefOf (TPCT))
                        {
                            Return (TPCT (MAR1, MAR2))
                        }
                        Else
                        {
                            Return (Zero)
                        }
                    }

                    If ((MAR0 == 0x31))
                    {
                        Return (N00O (MAR1, MAR2))
                    }

                    If ((MAR0 == 0x33))
                    {
                        If ((MAR1 == One))
                        {
                            Local0 = Zero
                            If (CondRefOf (N01T))
                            {
                                Local0 = N01T ()
                            }

                            Return (Local0)
                        }
                        ElseIf ((MAR1 == 0x02))
                        {
                            If (CondRefOf (N01U))
                            {
                                N01U (MAR2)
                            }

                            Return (Zero)
                        }

                        Return (0x80000002)
                    }

                    If ((MAR0 == 0x34))
                    {
                        If ((MAR1 == One))
                        {
                            Return (OWNE) /* External reference */
                        }
                        ElseIf ((MAR1 == 0x02))
                        {
                            OWNE = MAR2 /* \_SB_.PCI0.LPCB.H_EC.MAP1.MAR2 */
                            Return (Zero)
                        }

                        Return (0x80000002)
                    }

                    If ((MAR0 == 0x35))
                    {
                        Return (0x80000002)
                    }

                    If ((MAR0 == 0x39))
                    {
                        If ((MAR1 == One))
                        {
                            Return (ARQ0) /* External reference */
                        }
                        ElseIf ((MAR1 == 0x02))
                        {
                            ARQ0 = MAR2 /* \_SB_.PCI0.LPCB.H_EC.MAP1.MAR2 */
                            Return (Zero)
                        }

                        Return (0x80000002)
                    }

                    If ((MAR0 == 0x3B))
                    {
                        If ((MAR1 == One))
                        {
                            Return (0x80000002)
                        }

                        Return (0x80000002)
                    }

                    If ((MAR0 == 0x3C))
                    {
                        If ((MAR1 == One))
                        {
                            Return (N03V ())
                        }

                        Return (0x80000002)
                    }

                    If ((MAR0 == 0x3D))
                    {
                        If ((MAR1 == One))
                        {
                            Return (N03W ())
                        }

                        Return (0x80000002)
                    }

                    If ((MAR0 == 0x3E))
                    {
                        If (CondRefOf (N02M))
                        {
                            Return (N02M (MAR1, MAR2))
                        }
                        Else
                        {
                            Return (0x80000002)
                        }
                    }

                    Return (0x80000001)
                }

                If (((MAR0 >= 0x60) && (MAR0 <= 0x8F)))
                {
                    If ((MAR0 == 0x60))
                    {
                        Return (N00S (MAR1, MAR2))
                    }

                    If ((MAR0 == 0x61))
                    {
                        If (CondRefOf (N02L))
                        {
                            Return (N02L (MAR1, MAR2))
                        }
                        Else
                        {
                            Return (0x80000002)
                        }
                    }

                    If ((MAR0 == 0x62))
                    {
                        Return (BCT1 (MAR1, MAR2))
                    }

                    If ((MAR0 == One))
                    {
                        If ((MAR1 == One))
                        {
                            Return (One)
                        }

                        Return (0x80000002)
                    }

                    If ((N01W == One))
                    {
                        If ((MAR0 == 0x67))
                        {
                            If (CondRefOf (N02K))
                            {
                                Return (N02K (MAR1, MAR2))
                            }
                            Else
                            {
                                Return (0x80000002)
                            }
                        }

                        If ((MAR0 == 0x68))
                        {
                            If (CondRefOf (N02J))
                            {
                                Return (N02J (MAR1, MAR2))
                            }
                            Else
                            {
                                Return (0x80000002)
                            }
                        }

                        If ((MAR0 == 0x69))
                        {
                            If (CondRefOf (N02I))
                            {
                                Return (N02I (MAR1, MAR2))
                            }
                            Else
                            {
                                Return (0x80000002)
                            }
                        }
                    }

                    If ((MAR0 == 0x73))
                    {
                        If (CondRefOf (N028))
                        {
                            Return (N028 (MAR1, MAR2))
                        }
                        Else
                        {
                            Return (0x80000002)
                        }
                    }

                    If ((MAR0 == 0x79))
                    {
                        If (CondRefOf (N029))
                        {
                            Return (N029 (MAR1, MAR2))
                        }
                        Else
                        {
                            Return (0x80000002)
                        }
                    }

                    If ((MAR0 == 0x80))
                    {
                        If (CondRefOf (N02A))
                        {
                            Return (N02A (MAR1, MAR2))
                        }
                        Else
                        {
                            Return (0x80000002)
                        }
                    }

                    If ((MAR0 == 0x81))
                    {
                        If (CondRefOf (N02H))
                        {
                            Return (N02H (MAR1, MAR2))
                        }
                        Else
                        {
                            Return (0x80000002)
                        }
                    }

                    If ((MAR0 == 0x82))
                    {
                        If (CondRefOf (N02B))
                        {
                            Return (N02B (MAR1, MAR2))
                        }
                        Else
                        {
                            Return (0x80000002)
                        }
                    }

                    Return (0x80000001)
                }

                If (((MAR0 >= 0x90) && (MAR0 <= 0xBF)))
                {
                    If ((MAR0 == 0x90))
                    {
                        If (CondRefOf (N04A))
                        {
                            Return (N04A (MAR1, MAR2))
                        }
                        Else
                        {
                            Return (0x80000002)
                        }
                    }

                    If ((MAR0 == 0x91))
                    {
                        If (CondRefOf (N049))
                        {
                            Return (N049 (MAR1, MAR2))
                        }
                        Else
                        {
                            Return (0x80000002)
                        }
                    }

                    If ((MAR0 == 0x92))
                    {
                        If (CondRefOf (N04B))
                        {
                            Return (N04B (MAR1, MAR2))
                        }
                        Else
                        {
                            Return (0x80000002)
                        }
                    }

                    If ((MAR0 == 0xB3))
                    {
                        If (CondRefOf (N02G))
                        {
                            Return (N02G (MAR1, MAR2))
                        }
                        Else
                        {
                            Return (0x80000002)
                        }
                    }

                    If ((MAR0 == 0xBE))
                    {
                        If ((MAR1 == One))
                        {
                            Local0 = One
                            If (CondRefOf (N027))
                            {
                                Local0 = N027 ()
                            }

                            Return (Local0)
                        }

                        Return (0x80000002)
                    }

                    If ((MAR0 == 0xBF))
                    {
                        If ((MAR1 == One))
                        {
                            Local0 = Zero
                            If (CondRefOf (N025))
                            {
                                Local0 = N025 ()
                            }

                            Return (Local0)
                        }
                        ElseIf ((MAR1 == 0x02))
                        {
                            If (CondRefOf (N026))
                            {
                                N026 (MAR2)
                            }

                            Return (Zero)
                        }

                        Return (0x80000002)
                    }

                    Return (0x80000001)
                }

                If (((MAR0 >= 0xC0) && (MAR0 <= 0xFF)))
                {
                    If ((MAR0 == 0xEF))
                    {
                        If (CondRefOf (N01V))
                        {
                            Return (N01V (MAR1, MAR2))
                        }
                        Else
                        {
                            Return (0x80000002)
                        }
                    }

                    Return (0x80000001)
                }

                Return (0x80000003)
            }

            Name (WQAC, Buffer (0x0BCF)
            {
                /* 0000 */  0x46, 0x4F, 0x4D, 0x42, 0x01, 0x00, 0x00, 0x00,  // FOMB....
                /* 0008 */  0xBF, 0x0B, 0x00, 0x00, 0x2E, 0x53, 0x00, 0x00,  // .....S..
                /* 0010 */  0x44, 0x53, 0x00, 0x01, 0x1A, 0x7D, 0xDA, 0x54,  // DS...}.T
                /* 0018 */  0xA8, 0xD2, 0xA8, 0x00, 0x01, 0x06, 0x18, 0x42,  // .......B
                /* 0020 */  0x10, 0x1D, 0x10, 0x22, 0x21, 0x04, 0x12, 0x01,  // ..."!...
                /* 0028 */  0xA1, 0xC8, 0x2C, 0x0C, 0x86, 0x10, 0x38, 0x2E,  // ..,...8.
                /* 0030 */  0x84, 0x1C, 0x40, 0x48, 0x1C, 0x14, 0x4A, 0x08,  // ..@H..J.
                /* 0038 */  0x84, 0xFA, 0x13, 0xC8, 0xAF, 0x00, 0x84, 0x0E,  // ........
                /* 0040 */  0x05, 0xC8, 0x14, 0x60, 0x50, 0x80, 0x53, 0x04,  // ...`P.S.
                /* 0048 */  0x11, 0xF4, 0x2A, 0xC0, 0xA6, 0x00, 0x93, 0x02,  // ..*.....
                /* 0050 */  0x2C, 0x0A, 0xD0, 0x2E, 0xC0, 0xB2, 0x00, 0xDD,  // ,.......
                /* 0058 */  0x02, 0xA4, 0xC3, 0x12, 0x91, 0xE0, 0x28, 0x31,  // ......(1
                /* 0060 */  0xE0, 0x28, 0x9D, 0xD8, 0xC2, 0x0D, 0x1B, 0xBC,  // .(......
                /* 0068 */  0x50, 0x14, 0xCD, 0x20, 0x4A, 0x82, 0x72, 0x11,  // P.. J.r.
                /* 0070 */  0xA4, 0x0B, 0x42, 0xCA, 0x05, 0xF8, 0x46, 0xD0,  // ..B...F.
                /* 0078 */  0x00, 0xA2, 0xF4, 0x2E, 0xC0, 0xB6, 0x00, 0xD3,  // ........
                /* 0080 */  0xF0, 0x44, 0xEA, 0x10, 0x50, 0x72, 0x86, 0x80,  // .D..Pr..
                /* 0088 */  0x1A, 0x40, 0xAB, 0x13, 0x10, 0x7E, 0xA5, 0x53,  // .@...~.S
                /* 0090 */  0x42, 0x12, 0x84, 0x33, 0x56, 0xF1, 0x33, 0xD0,  // B..3V.3.
                /* 0098 */  0x1C, 0x4E, 0xE0, 0x9C, 0x3A, 0xC7, 0x90, 0xE3,  // .N..:...
                /* 00A0 */  0x71, 0xA1, 0x07, 0xC1, 0x25, 0x2D, 0xD4, 0x04,  // q...%-..
                /* 00A8 */  0x12, 0x3B, 0x64, 0x89, 0x80, 0x41, 0x49, 0x18,  // .;d..AI.
                /* 00B0 */  0x0B, 0x75, 0x31, 0x6A, 0xD4, 0x48, 0xD9, 0x80,  // .u1j.H..
                /* 00B8 */  0x0C, 0x51, 0xDA, 0xA8, 0xD1, 0x03, 0x3A, 0xBB,  // .Q....:.
                /* 00C0 */  0x23, 0x69, 0x58, 0x80, 0xEC, 0x91, 0x88, 0xC0,  // #iX.....
                /* 00C8 */  0xA8, 0xC7, 0x74, 0x84, 0x85, 0xCD, 0x48, 0xA8,  // ..t...H.
                /* 00D0 */  0x31, 0x9A, 0x83, 0x22, 0x51, 0x06, 0x8D, 0x96,  // 1.."Q...
                /* 00D8 */  0x08, 0xAB, 0x71, 0xC5, 0x3E, 0x33, 0x0B, 0x1F,  // ..q.>3..
                /* 00E0 */  0x96, 0x30, 0x8E, 0xE0, 0xC0, 0x0E, 0xD6, 0xA2,  // .0......
                /* 00E8 */  0x61, 0x84, 0x56, 0x10, 0x9C, 0x06, 0x71, 0x14,  // a.V...q.
                /* 00F0 */  0x51, 0xC2, 0x30, 0x3C, 0x63, 0x06, 0x3A, 0x4A,  // Q.0<c.:J
                /* 00F8 */  0x86, 0x14, 0x26, 0xE8, 0x09, 0x04, 0x29, 0x19,  // ..&...).
                /* 0100 */  0x43, 0x9A, 0xB1, 0x08, 0xC4, 0x19, 0x70, 0xAC,  // C.....p.
                /* 0108 */  0x18, 0xA1, 0x42, 0x62, 0x34, 0x1E, 0x02, 0xF4,  // ..Bb4...
                /* 0110 */  0xFF, 0x47, 0x3B, 0xF7, 0xF8, 0x87, 0xD0, 0x35,  // .G;....5
                /* 0118 */  0x86, 0x3C, 0x0F, 0x8D, 0x0E, 0xE4, 0xA8, 0x30,  // .<.....0
                /* 0120 */  0x32, 0x20, 0x04, 0xD6, 0x3A, 0xA8, 0x26, 0x91,  // 2 ..:.&.
                /* 0128 */  0xC0, 0xEE, 0x87, 0x27, 0x84, 0xC7, 0x80, 0xDA,  // ...'....
                /* 0130 */  0x10, 0x34, 0xC3, 0x27, 0x81, 0xC6, 0x04, 0xD8,  // .4.'....
                /* 0138 */  0x1A, 0xA3, 0x50, 0x8E, 0x21, 0x4C, 0x94, 0x20,  // ..P.!L. 
                /* 0140 */  0xE1, 0xCE, 0xC1, 0x28, 0x31, 0x6D, 0x6D, 0x8E,  // ...(1mm.
                /* 0148 */  0x42, 0x09, 0xEA, 0x4B, 0x02, 0xC3, 0x88, 0xD4,  // B..K....
                /* 0150 */  0x19, 0xAA, 0xD0, 0xE2, 0xC4, 0x6A, 0x7F, 0x10,  // .....j..
                /* 0158 */  0x24, 0xD8, 0x31, 0x40, 0x1F, 0x01, 0xCB, 0x01,  // $.1@....
                /* 0160 */  0x91, 0x91, 0x4D, 0x25, 0x20, 0x67, 0x04, 0x0F,  // ..M% g..
                /* 0168 */  0xC7, 0x0A, 0x05, 0x98, 0x1F, 0x9B, 0x06, 0x6D,  // .......m
                /* 0170 */  0x82, 0xF1, 0x21, 0xA4, 0x01, 0x42, 0xA2, 0x0E,  // ..!..B..
                /* 0178 */  0x14, 0x94, 0xC0, 0x52, 0x0E, 0x04, 0xE4, 0xD2,  // ...R....
                /* 0180 */  0xE0, 0xA1, 0x9C, 0xCD, 0x19, 0xFB, 0x4A, 0x70,  // ......Jp
                /* 0188 */  0x66, 0xFE, 0x5F, 0x78, 0x0B, 0x3E, 0x1A, 0xF0,  // f._x.>..
                /* 0190 */  0x31, 0xF8, 0x10, 0x70, 0x08, 0x01, 0x8F, 0x90,  // 1..p....
                /* 0198 */  0x9D, 0x0D, 0x0C, 0x88, 0x9F, 0xF2, 0xCB, 0x80,  // ........
                /* 01A0 */  0xE7, 0x62, 0x40, 0x36, 0x89, 0xC7, 0x02, 0xB0,  // .b@6....
                /* 01A8 */  0x28, 0x1E, 0x19, 0xE2, 0x1E, 0xC0, 0x47, 0x72,  // (.....Gr
                /* 01B0 */  0x4C, 0xEC, 0xEC, 0xC0, 0xC6, 0xC6, 0xC7, 0xE0,  // L.......
                /* 01B8 */  0x03, 0xC3, 0x09, 0x17, 0x7B, 0x6E, 0xF0, 0xC2,  // ....{n..
                /* 01C0 */  0x24, 0xEB, 0xEC, 0x80, 0x9E, 0xF4, 0xF1, 0x05,  // $.......
                /* 01C8 */  0x7C, 0x53, 0x68, 0xF6, 0x7E, 0x41, 0x08, 0x5E,  // |Sh.~A.^
                /* 01D0 */  0x06, 0x7C, 0x4D, 0xF0, 0x51, 0xC4, 0x63, 0xC2,  // .|M.Q.c.
                /* 01D8 */  0x9D, 0x45, 0xE0, 0x9D, 0x11, 0xE0, 0xE0, 0x05,  // .E......
                /* 01E0 */  0x39, 0xB8, 0xB7, 0x04, 0x76, 0x1C, 0x81, 0xF7,  // 9...v...
                /* 01E8 */  0xFF, 0x3F, 0x8E, 0x80, 0xEF, 0x34, 0x82, 0x38,  // .?...4.8
                /* 01F0 */  0x76, 0xA0, 0x56, 0xCA, 0x4F, 0x1E, 0x00, 0x13,  // v.V.O...
                /* 01F8 */  0xEE, 0x19, 0xCF, 0x00, 0x95, 0xDD, 0x35, 0x84,  // ......5.
                /* 0200 */  0xF1, 0xB0, 0xF1, 0x82, 0x70, 0x04, 0x6F, 0x1C,  // ....p.o.
                /* 0208 */  0x8F, 0x1E, 0xBD, 0x21, 0xE8, 0xD0, 0xE1, 0x61,  // ...!...a
                /* 0210 */  0x86, 0x09, 0x77, 0x06, 0x51, 0x1E, 0x06, 0x8C,  // ..w.Q...
                /* 0218 */  0x12, 0x21, 0x4A, 0xB4, 0xC8, 0x51, 0xDF, 0x40,  // .!J..Q.@
                /* 0220 */  0x0C, 0x15, 0xF8, 0x89, 0x20, 0x68, 0xC8, 0x38,  // .... h.8
                /* 0228 */  0x3E, 0x79, 0xB0, 0x50, 0x27, 0x0F, 0xA0, 0xF6,  // >y.P'...
                /* 0230 */  0xFF, 0x3F, 0x79, 0x00, 0x5E, 0xC6, 0xE3, 0x93,  // .?y.^...
                /* 0238 */  0x07, 0xB8, 0xE4, 0x9D, 0x3C, 0x40, 0x7B, 0xAA,  // ....<@{.
                /* 0240 */  0x02, 0x2E, 0x23, 0xE0, 0x42, 0x5F, 0x1C, 0x26,  // ..#.B_.&
                /* 0248 */  0x50, 0x84, 0x97, 0x80, 0xA4, 0xC1, 0xA0, 0xCE,  // P.......
                /* 0250 */  0x05, 0x3E, 0x77, 0xC0, 0x95, 0x04, 0x87, 0x1A,  // .>w.....
                /* 0258 */  0xA1, 0x0F, 0x01, 0x87, 0x7F, 0xA0, 0x87, 0x76,  // .......v
                /* 0260 */  0x20, 0x9E, 0xDC, 0x03, 0x08, 0x8C, 0x73, 0x82,  //  .....s.
                /* 0268 */  0xA7, 0x75, 0x4A, 0xBE, 0x61, 0x3D, 0x4F, 0x78,  // .uJ.a=Ox
                /* 0270 */  0x8E, 0x61, 0x12, 0xF8, 0xB0, 0xC0, 0xD0, 0xF8,  // .a......
                /* 0278 */  0x69, 0x04, 0xF6, 0xFF, 0xFF, 0x34, 0x02, 0xEF,  // i....4..
                /* 0280 */  0xBE, 0xF1, 0x9C, 0x00, 0x96, 0x59, 0xBF, 0x8A,  // .....Y..
                /* 0288 */  0x60, 0xB0, 0x42, 0xC5, 0x30, 0xAA, 0x31, 0xA2,  // `.B.0.1.
                /* 0290 */  0xFC, 0xC5, 0xBD, 0x18, 0x1C, 0x95, 0x67, 0xD8,  // ......g.
                /* 0298 */  0xD7, 0x44, 0x84, 0x12, 0xCA, 0xB0, 0x21, 0x5E,  // .D....!^
                /* 02A0 */  0xCC, 0x4E, 0xA8, 0xCF, 0x7B, 0x80, 0x3C, 0x1E,  // .N..{.<.
                /* 02A8 */  0x41, 0x40, 0x70, 0xEA, 0x38, 0x90, 0xE7, 0x8E,  // A@p.8...
                /* 02B0 */  0xB7, 0x28, 0x9F, 0x41, 0x5E, 0x3C, 0x9E, 0xA5,  // .(.A^<..
                /* 02B8 */  0x7C, 0x9D, 0x32, 0xD0, 0xCB, 0xC2, 0x23, 0x08,  // |.2...#.
                /* 02C0 */  0x9B, 0x43, 0x9C, 0x28, 0x4F, 0x1C, 0x31, 0xA3,  // .C.(O.1.
                /* 02C8 */  0x06, 0x8D, 0x12, 0x2C, 0x54, 0x18, 0x5F, 0x0D,  // ...,T._.
                /* 02D0 */  0xDE, 0x42, 0x82, 0x1C, 0x5D, 0x94, 0xE8, 0xF1,  // .B..]...
                /* 02D8 */  0xA2, 0x3D, 0x4B, 0x51, 0x05, 0x10, 0x2D, 0x80,  // .=KQ..-.
                /* 02E0 */  0x28, 0xD2, 0x68, 0x50, 0x67, 0x05, 0x9F, 0x0A,  // (.hPg...
                /* 02E8 */  0x7C, 0x22, 0x78, 0x6E, 0xF1, 0xA9, 0xC2, 0x20,  // |"xn... 
                /* 02F0 */  0x67, 0x7A, 0x6C, 0xE7, 0xF5, 0x38, 0xE0, 0x81,  // gzl..8..
                /* 02F8 */  0xB3, 0x7B, 0x9B, 0x0F, 0x24, 0xE4, 0x7C, 0x80,  // .{..$.|.
                /* 0300 */  0x3E, 0x41, 0x04, 0x3C, 0xCE, 0x67, 0x0F, 0x58,  // >A.<.g.X
                /* 0308 */  0x67, 0x10, 0xFC, 0x31, 0xE0, 0x19, 0x03, 0xF6,  // g..1....
                /* 0310 */  0x78, 0x7C, 0xAD, 0x63, 0x13, 0x4E, 0x60, 0xF9,  // x|.c.N`.
                /* 0318 */  0x83, 0x40, 0x8D, 0xCC, 0xD0, 0x1E, 0xEF, 0x69,  // .@.....i
                /* 0320 */  0xBD, 0x0E, 0xF8, 0x74, 0xE7, 0xC3, 0x10, 0x81,  // ...t....
                /* 0328 */  0xD0, 0x26, 0x35, 0x1E, 0x90, 0xFF, 0xFF, 0xC7,  // .&5.....
                /* 0330 */  0xE3, 0x83, 0xC9, 0x33, 0x86, 0xEF, 0x0C, 0x9E,  // ...3....
                /* 0338 */  0xAF, 0xDF, 0x2D, 0xCC, 0xC9, 0x78, 0x50, 0xA3,  // ..-..xP.
                /* 0340 */  0xF0, 0xE9, 0xC0, 0x97, 0x05, 0xCF, 0xCB, 0x81,  // ........
                /* 0348 */  0x21, 0x74, 0x04, 0xF0, 0x51, 0x06, 0x78, 0x0A,  // !t..Q.x.
                /* 0350 */  0x3C, 0x53, 0x80, 0xE6, 0xC2, 0x61, 0x30, 0x38,  // <S...a08
                /* 0358 */  0x03, 0x86, 0x7F, 0x84, 0xE1, 0x77, 0x87, 0xB7,  // .....w..
                /* 0360 */  0x87, 0x04, 0x1E, 0x0C, 0xEE, 0x0C, 0x03, 0xEF,  // ........
                /* 0368 */  0x9C, 0x11, 0x23, 0xD2, 0x5B, 0x8B, 0x11, 0x82,  // ..#.[...
                /* 0370 */  0x9C, 0x37, 0xEE, 0x10, 0x03, 0xD8, 0xFA, 0xFF,  // .7......
                /* 0378 */  0x1F, 0x62, 0x00, 0xDB, 0x67, 0x32, 0x5F, 0x5E,  // .b..g2_^
                /* 0380 */  0x8E, 0xE7, 0x1D, 0xC6, 0x30, 0x2F, 0x97, 0x1E,  // ....0/..
                /* 0388 */  0x58, 0xA4, 0x10, 0x11, 0x1E, 0x62, 0x7C, 0x5F,  // X....b|_
                /* 0390 */  0x78, 0xE5, 0x38, 0xB7, 0x87, 0x18, 0xA3, 0xC4,  // x.8.....
                /* 0398 */  0x7B, 0x36, 0x33, 0xC6, 0xD3, 0x99, 0x6F, 0x31,  // {63...o1
                /* 03A0 */  0x0C, 0x34, 0x98, 0x8F, 0x07, 0xF1, 0x7D, 0x88,  // .4....}.
                /* 03A8 */  0x01, 0x4C, 0xFE, 0xFF, 0x0F, 0x31, 0x00, 0x0F,  // .L...1..
                /* 03B0 */  0xC1, 0x6B, 0x3D, 0xC4, 0x00, 0xE9, 0xFF, 0xFF,  // .k=.....
                /* 03B8 */  0x21, 0x06, 0x60, 0xCF, 0xB1, 0xE5, 0x69, 0xE0,  // !.`...i.
                /* 03C0 */  0xC5, 0xE5, 0x79, 0x20, 0xC8, 0x7B, 0x9D, 0x6F,  // ..y .{.o
                /* 03C8 */  0x75, 0xBE, 0xC3, 0xF8, 0xB6, 0xF0, 0xEA, 0xF2,  // u.......
                /* 03D0 */  0x10, 0x63, 0xA0, 0x57, 0x8E, 0xD7, 0x18, 0x4F,  // .c.W...O
                /* 03D8 */  0xEE, 0x99, 0xD5, 0x77, 0x19, 0x83, 0x84, 0x09,  // ...w....
                /* 03E0 */  0x1C, 0x32, 0xEC, 0x73, 0xB7, 0x21, 0xDE, 0xEB,  // .2.s.!..
                /* 03E8 */  0x3C, 0x81, 0x67, 0x6E, 0xC4, 0x21, 0x06, 0x28,  // <.gn.!.(
                /* 03F0 */  0xFF, 0xFF, 0x0F, 0x31, 0x00, 0xAF, 0x8F, 0x11,  // ...1....
                /* 03F8 */  0x27, 0xF0, 0x10, 0x03, 0x8E, 0xFF, 0xFF, 0x21,  // '......!
                /* 0400 */  0x06, 0x60, 0xE3, 0x6D, 0xE0, 0x9C, 0xDE, 0x06,  // .`.m....
                /* 0408 */  0xDE, 0x5B, 0x7C, 0x6A, 0x39, 0xAD, 0xE7, 0x5C,  // .[|j9..\
                /* 0410 */  0x76, 0x83, 0x89, 0xF3, 0x60, 0xC7, 0x8E, 0x1C,  // v...`...
                /* 0418 */  0x47, 0xF1, 0xC4, 0x10, 0xCA, 0x77, 0x78, 0x43,  // G....wxC
                /* 0420 */  0x19, 0xF1, 0x05, 0xDE, 0x28, 0x91, 0x22, 0xBC,  // ....(.".
                /* 0428 */  0xC5, 0xBC, 0xDA, 0x31, 0x9C, 0x90, 0x0F, 0x31,  // ...1...1
                /* 0430 */  0x60, 0xFA, 0xFF, 0x1F, 0x62, 0x00, 0xFE, 0xFF,  // `...b...
                /* 0438 */  0xFF, 0x0F, 0x31, 0xE0, 0x19, 0xC0, 0x8B, 0x44,  // ..1....D
                /* 0440 */  0xA4, 0x53, 0x8A, 0xF1, 0x86, 0xF1, 0x10, 0x03,  // .S......
                /* 0448 */  0xFC, 0x54, 0xF8, 0x00, 0x61, 0x61, 0xDE, 0x00,  // .T..aa..
                /* 0450 */  0x12, 0xF9, 0x18, 0xA0, 0x30, 0x3E, 0xC4, 0x00,  // ....0>..
                /* 0458 */  0xAE, 0x0E, 0x19, 0x3E, 0xC4, 0x80, 0xEF, 0x58,  // ...>...X
                /* 0460 */  0x10, 0x23, 0xE6, 0x21, 0xBD, 0xC6, 0x70, 0x88,  // .#.!..p.
                /* 0468 */  0xA8, 0x47, 0xE5, 0x83, 0x84, 0x41, 0x02, 0x3D,  // .G...A.=
                /* 0470 */  0x98, 0x18, 0xE5, 0xD5, 0x26, 0x58, 0xC8, 0xC0,  // ....&X..
                /* 0478 */  0x9E, 0x80, 0x2F, 0x32, 0x98, 0x43, 0x01, 0xE6,  // ../2.C..
                /* 0480 */  0x24, 0x03, 0xFB, 0xE0, 0xEF, 0x3B, 0xC1, 0x03,  // $....;..
                /* 0488 */  0xCC, 0x9B, 0x9D, 0x51, 0xFE, 0xFF, 0x4F, 0x77,  // ...Q..Ow
                /* 0490 */  0x3E, 0xFA, 0xFB, 0x5C, 0xF0, 0x00, 0xF3, 0xC4,  // >..\....
                /* 0498 */  0xCB, 0x40, 0x9F, 0x64, 0x7C, 0xEF, 0xF5, 0x2D,  // .@.d|..-
                /* 04A0 */  0xC6, 0x78, 0x3E, 0xD0, 0x04, 0x0E, 0xF1, 0x32,  // .x>....2
                /* 04A8 */  0x63, 0xC0, 0xF3, 0x7C, 0x01, 0xF6, 0x09, 0xD8,  // c..|....
                /* 04B0 */  0x27, 0x19, 0x7A, 0x2C, 0xD0, 0x67, 0xC9, 0x27,  // '.z,.g.'
                /* 04B8 */  0x19, 0x80, 0x1F, 0x27, 0x11, 0xB0, 0x1C, 0x14,  // ...'....
                /* 04C0 */  0x30, 0x27, 0x11, 0xE0, 0x95, 0x6B, 0x95, 0x3A,  // 0'...k.:
                /* 04C8 */  0x1C, 0x38, 0xCC, 0x4A, 0x65, 0x63, 0xA5, 0xFA,  // .8.Jec..
                /* 04D0 */  0xFF, 0x1F, 0x39, 0xB8, 0xD8, 0x23, 0x82, 0xAE,  // ..9..#..
                /* 04D8 */  0x29, 0x07, 0xE4, 0xE1, 0x60, 0x25, 0x82, 0xE9,  // )...`%..
                /* 04E0 */  0x94, 0x63, 0x08, 0x8B, 0x3B, 0xA8, 0x19, 0x42,  // .c..;..B
                /* 04E8 */  0xE3, 0xF1, 0x90, 0x08, 0x1C, 0x05, 0xF1, 0xE8,  // ........
                /* 04F0 */  0x1D, 0x14, 0x42, 0x47, 0x20, 0xFC, 0xBD, 0x87,  // ..BG ...
                /* 04F8 */  0x9F, 0x1D, 0x08, 0x84, 0xC6, 0xE3, 0xD3, 0x02,  // ........
                /* 0500 */  0x7E, 0x2E, 0x0F, 0x16, 0x0F, 0x0D, 0x3E, 0xEF,  // ~.....>.
                /* 0508 */  0x80, 0x6B, 0x66, 0xCF, 0x01, 0x67, 0xC6, 0x56,  // .kf..g.V
                /* 0510 */  0x78, 0x24, 0xB8, 0x71, 0xF8, 0x64, 0xC4, 0x87,  // x$.q.d..
                /* 0518 */  0xE0, 0x5B, 0x41, 0xBC, 0x04, 0xFC, 0xD8, 0x03,  // .[A.....
                /* 0520 */  0x9C, 0x80, 0x7C, 0x1D, 0xB0, 0xD2, 0x23, 0x01,  // ..|...#.
                /* 0528 */  0x9D, 0x43, 0x88, 0x30, 0xD1, 0x0C, 0x8F, 0x91,  // .C.0....
                /* 0530 */  0x75, 0xBE, 0xA1, 0xB2, 0xC6, 0x85, 0x1A, 0xA7,  // u.......
                /* 0538 */  0x8F, 0x32, 0xEC, 0xB6, 0x80, 0x3B, 0x41, 0x61,  // .2...;Aa
                /* 0540 */  0x60, 0x3D, 0x72, 0x0E, 0x6B, 0xB4, 0xB0, 0x07,  // `=r.k...
                /* 0548 */  0xFC, 0x10, 0xE1, 0x0B, 0x88, 0x67, 0xE6, 0xAB,  // .....g..
                /* 0550 */  0x8B, 0x8F, 0x1E, 0x60, 0x39, 0x4C, 0xC1, 0xFD,  // ...`9L..
                /* 0558 */  0xFF, 0x1F, 0x7F, 0xE0, 0x9C, 0x4E, 0xD8, 0x59,  // .....N.Y
                /* 0560 */  0xC0, 0xB7, 0x1F, 0x43, 0xB2, 0x83, 0x1F, 0x78,  // ...C...x
                /* 0568 */  0xC6, 0x7B, 0x8E, 0xBE, 0x02, 0x04, 0x7B, 0xAE,  // .{....{.
                /* 0570 */  0xF1, 0x30, 0x7D, 0xBD, 0x31, 0x68, 0x3C, 0x4F,  // .0}.1h<O
                /* 0578 */  0xC6, 0x18, 0x3E, 0xDF, 0x30, 0xCD, 0xE7, 0x1B,  // ..>.0...
                /* 0580 */  0x48, 0x41, 0x8E, 0x15, 0x50, 0xCE, 0x80, 0xEC,  // HA..P...
                /* 0588 */  0x58, 0x01, 0x8C, 0xEF, 0x0C, 0x1E, 0x30, 0x3F,  // X.....0?
                /* 0590 */  0x56, 0x00, 0x4E, 0x25, 0x0D, 0x5C, 0xFF, 0xFF,  // V.N%.\..
                /* 0598 */  0x63, 0x05, 0xB8, 0xCE, 0x00, 0x3E, 0x56, 0x00,  // c....>V.
                /* 05A0 */  0x3E, 0x04, 0x1F, 0x0B, 0x40, 0x73, 0x28, 0xE5,  // >...@s(.
                /* 05A8 */  0x97, 0x0A, 0xF0, 0x45, 0x3C, 0x54, 0xA0, 0xA5,  // ...E<T..
                /* 05B0 */  0x8F, 0x5E, 0x17, 0xAE, 0xB3, 0x38, 0x46, 0x83,  // .^...8F.
                /* 05B8 */  0xE2, 0x04, 0x1F, 0x2A, 0x50, 0x52, 0x29, 0x24,  // ...*PR)$
                /* 05C0 */  0xF4, 0x50, 0x81, 0x3A, 0x57, 0x18, 0xCC, 0x20,  // .P.:W.. 
                /* 05C8 */  0x3E, 0x01, 0x38, 0xF6, 0xA1, 0x02, 0xCA, 0x41,  // >.8....A
                /* 05D0 */  0xE9, 0x74, 0x8E, 0xEA, 0x7D, 0x2B, 0x81, 0x63,  // .t..}+.c
                /* 05D8 */  0x1E, 0x2A, 0x40, 0x71, 0x4A, 0x3A, 0x5C, 0xB0,  // .*@qJ:\.
                /* 05E0 */  0x1C, 0xFC, 0xD8, 0x02, 0x0F, 0xCE, 0xC6, 0xAF,  // ........
                /* 05E8 */  0x10, 0x04, 0xC5, 0x83, 0xF5, 0x54, 0x8D, 0xFA,  // .....T..
                /* 05F0 */  0xFF, 0x8F, 0xF1, 0x20, 0xE7, 0x6B, 0x1C, 0x3B,  // ... .k.;
                /* 05F8 */  0xF0, 0xF1, 0xB3, 0x05, 0xE0, 0x44, 0xDE, 0xD9,  // .....D..
                /* 0600 */  0x02, 0x74, 0x90, 0x3E, 0x5B, 0x00, 0x3E, 0x0E,  // .t.>[.>.
                /* 0608 */  0x8E, 0x4F, 0x07, 0x60, 0x39, 0x92, 0x19, 0xE4,  // .O.`9...
                /* 0610 */  0x75, 0x11, 0x77, 0x82, 0x33, 0x46, 0x94, 0x37,  // u.w.3F.7
                /* 0618 */  0x3B, 0x0F, 0xCF, 0x07, 0x0C, 0x0C, 0xDA, 0xC3,  // ;.......
                /* 0620 */  0x80, 0x4F, 0x7A, 0xEC, 0x7A, 0x81, 0x83, 0x39,  // .Oz.z..9
                /* 0628 */  0xBE, 0xF7, 0x19, 0x9E, 0x6E, 0xCD, 0x3A, 0x61,  // ....n.:a
                /* 0630 */  0xF0, 0x71, 0x59, 0xFD, 0x8B, 0x42, 0x63, 0x7E,  // .qY..Bc~
                /* 0638 */  0xA9, 0x8E, 0xEB, 0xFF, 0xFF, 0x01, 0x83, 0xAB,  // ........
                /* 0640 */  0x86, 0xD2, 0xC9, 0xC2, 0x07, 0x0B, 0xEB, 0xA5,  // ........
                /* 0648 */  0x90, 0xA6, 0x03, 0x06, 0x4A, 0xC5, 0x01, 0x83,  // ....J...
                /* 0650 */  0x82, 0x18, 0xD0, 0x11, 0x0F, 0x18, 0x68, 0x15,  // ......h.
                /* 0658 */  0x87, 0x20, 0x64, 0xA6, 0xFB, 0x05, 0x9D, 0xA8,  // . d.....
                /* 0660 */  0x27, 0xCD, 0xAF, 0x07, 0xBE, 0x5F, 0x30, 0xDC,  // '...._0.
                /* 0668 */  0xFA, 0xAE, 0x40, 0x20, 0x57, 0x73, 0x60, 0x40,  // ..@ Ws`@
                /* 0670 */  0xCD, 0xC2, 0xE7, 0x0A, 0xCC, 0x65, 0xEF, 0xB5,  // .....e..
                /* 0678 */  0x02, 0x5C, 0x33, 0xC2, 0x1D, 0x2B, 0xC0, 0x88,  // .\3..+..
                /* 0680 */  0xCE, 0xEF, 0x7C, 0x80, 0xC1, 0xFF, 0xFF, 0x9D,  // ..|.....
                /* 0688 */  0x0F, 0x30, 0x34, 0x72, 0xDF, 0xF9, 0x00, 0xEF,  // .04r....
                /* 0690 */  0xB1, 0xD6, 0x6B, 0x02, 0xC5, 0x19, 0xBD, 0x82,  // ..k.....
                /* 0698 */  0xC0, 0xA0, 0xAE, 0xDC, 0xC0, 0xE4, 0xFF, 0x7F,  // ........
                /* 06A0 */  0xE5, 0x06, 0x5B, 0x80, 0x5B, 0x36, 0x28, 0xAF,  // ..[.[6(.
                /* 06A8 */  0x36, 0xB0, 0xCE, 0x38, 0x38, 0xA0, 0x87, 0x1D,  // 6..88...
                /* 06B0 */  0xEC, 0x85, 0xDB, 0x57, 0x1C, 0x58, 0x57, 0x72,  // ...W.XWr
                /* 06B8 */  0x70, 0xDE, 0xB9, 0x61, 0x1F, 0x2C, 0xA2, 0x3E,  // p..a.,.>
                /* 06C0 */  0xA4, 0x3D, 0x6A, 0x87, 0x0D, 0x62, 0x8C, 0x87,  // .=j..b..
                /* 06C8 */  0xED, 0x47, 0xED, 0x20, 0xCF, 0xDD, 0xBE, 0x73,  // .G. ...s
                /* 06D0 */  0xDB, 0x18, 0x8E, 0xEE, 0xDC, 0xBE, 0x63, 0x9C,  // ......c.
                /* 06D8 */  0x6A, 0x98, 0x18, 0x51, 0x4E, 0x33, 0x8A, 0x21,  // j..QN3.!
                /* 06E0 */  0xA2, 0xBE, 0x74, 0x9F, 0xC8, 0x9B, 0xF7, 0x2B,  // ..t....+
                /* 06E8 */  0x77, 0xD8, 0xA0, 0x41, 0xDE, 0xB9, 0x59, 0xF4,  // w..A..Y.
                /* 06F0 */  0xE7, 0x8A, 0xCE, 0x05, 0xBE, 0x73, 0x03, 0xA6,  // .....s..
                /* 06F8 */  0xFE, 0xFF, 0x77, 0x6E, 0x60, 0xFD, 0xF4, 0xF1,  // ..wn`...
                /* 0700 */  0xB9, 0x07, 0x7F, 0xDD, 0xC0, 0x05, 0x86, 0x90,  // ........
                /* 0708 */  0x05, 0x08, 0x89, 0x3A, 0xB9, 0xA0, 0x4E, 0x16,  // ...:..N.
                /* 0710 */  0x3E, 0x54, 0xB0, 0x8B, 0x0E, 0xBF, 0xFB, 0x62,  // >T.....b
                /* 0718 */  0x4E, 0x2B, 0xE0, 0x3F, 0x0A, 0x81, 0xE9, 0x56,  // N+.?...V
                /* 0720 */  0x81, 0x39, 0x0A, 0xE1, 0xCE, 0x40, 0xC0, 0xE9,  // .9...@..
                /* 0728 */  0xD2, 0xF8, 0x62, 0x76, 0x02, 0xA1, 0xBA, 0x9C,  // ..bv....
                /* 0730 */  0x80, 0x86, 0xF0, 0xD0, 0x8E, 0xBD, 0xB3, 0x03,  // ........
                /* 0738 */  0x8F, 0x11, 0xFE, 0xFF, 0x0F, 0x01, 0x73, 0x9E,  // ......s.
                /* 0740 */  0xF0, 0x10, 0xF8, 0x00, 0xCE, 0xE5, 0xF4, 0x7C,  // .......|
                /* 0748 */  0xC0, 0x39, 0x29, 0xDC, 0x81, 0x80, 0x83, 0x3D,  // .9)....=
                /* 0750 */  0x9F, 0xF0, 0x63, 0x12, 0x2E, 0xE0, 0xC1, 0x06,  // ..c.....
                /* 0758 */  0x15, 0xE9, 0x6C, 0x03, 0x90, 0x0A, 0xF3, 0xFD,  // ..l.....
                /* 0760 */  0xE1, 0x05, 0xE2, 0xB5, 0xE6, 0x81, 0x26, 0x46,  // ......&F
                /* 0768 */  0x84, 0x37, 0x82, 0x17, 0x1B, 0x83, 0x3F, 0xD4,  // .7....?.
                /* 0770 */  0x18, 0xC5, 0xB3, 0x08, 0x12, 0x31, 0x4A, 0xC0,  // .....1J.
                /* 0778 */  0x70, 0x11, 0x8D, 0xF2, 0x5C, 0x13, 0xEF, 0xB5,  // p...\...
                /* 0780 */  0x26, 0x74, 0x84, 0x60, 0x91, 0xCE, 0xC4, 0xB0,  // &t.`....
                /* 0788 */  0xE7, 0x1A, 0xE7, 0xD9, 0x86, 0x89, 0x78, 0x86,  // ......x.
                /* 0790 */  0xE8, 0x5C, 0xF0, 0xFF, 0x7F, 0xB6, 0x01, 0xF8,  // .\......
                /* 0798 */  0xFF, 0xFF, 0x3F, 0xDB, 0x80, 0x01, 0xED, 0xD9,  // ..?.....
                /* 07A0 */  0x06, 0x0C, 0x90, 0x2F, 0x35, 0xCF, 0x2E, 0x67,  // .../5..g
                /* 07A8 */  0xF0, 0x42, 0xE3, 0x93, 0x8C, 0x27, 0xF0, 0x90,  // .B...'..
                /* 07B0 */  0xF7, 0x7E, 0xE2, 0xE3, 0x1F, 0x9B, 0x91, 0x0F,  // .~......
                /* 07B8 */  0x38, 0x00, 0x2F, 0xFF, 0xFF, 0x07, 0x1C, 0xE0,  // 8./.....
                /* 07C0 */  0x7A, 0x89, 0x78, 0x07, 0x7C, 0xAF, 0x79, 0x1F,  // z.x.|.y.
                /* 07C8 */  0x78, 0x05, 0xF4, 0xEC, 0x9E, 0x6D, 0x8C, 0x11,  // x....m..
                /* 07D0 */  0xEA, 0x5D, 0xD0, 0x07, 0x1C, 0x1F, 0x47, 0x82,  // .]....G.
                /* 07D8 */  0xBD, 0x3D, 0x3C, 0xE0, 0xF8, 0x50, 0xE8, 0x7B,  // .=<..P.{
                /* 07E0 */  0x8E, 0xCF, 0x37, 0x51, 0xCE, 0x36, 0x4A, 0xDC,  // ..7Q.6J.
                /* 07E8 */  0x90, 0xC6, 0x79, 0xC2, 0x31, 0xD0, 0x5B, 0xCE,  // ..y.1.[.
                /* 07F0 */  0x03, 0x0E, 0xC0, 0xA5, 0xFF, 0xFF, 0x01, 0x07,  // ........
                /* 07F8 */  0x60, 0xC1, 0x1D, 0xC5, 0x20, 0x91, 0x1E, 0x70,  // `... ..p
                /* 0800 */  0x00, 0x77, 0xA1, 0x4E, 0x37, 0xA8, 0x18, 0x07,  // .w.N7...
                /* 0808 */  0x1C, 0x10, 0xFD, 0xFF, 0x0F, 0x38, 0x00, 0x57,  // .....8.W
                /* 0810 */  0x20, 0x5F, 0x68, 0x22, 0x3C, 0xD7, 0xBC, 0x33,  //  _h"<..3
                /* 0818 */  0x1B, 0x3A, 0xC2, 0xB3, 0xB3, 0x51, 0x9E, 0x6B,  // .:...Q.k
                /* 0820 */  0x5E, 0x6B, 0x1E, 0x70, 0x7C, 0x79, 0x78, 0x1D,  // ^k.p|yx.
                /* 0828 */  0x89, 0x10, 0x25, 0xE6, 0x03, 0xA1, 0xAF, 0xD0,  // ..%.....
                /* 0830 */  0x46, 0x35, 0x84, 0x71, 0x8E, 0x34, 0x60, 0x94,  // F5.q.4`.
                /* 0838 */  0x87, 0x8A, 0x70, 0x06, 0x79, 0xC0, 0x61, 0xC1,  // ..p.y.a.
                /* 0840 */  0xCF, 0xCE, 0x80, 0x84, 0xFF, 0xFF, 0x01, 0x07,  // ........
                /* 0848 */  0x60, 0xA8, 0xBC, 0x03, 0x0E, 0x28, 0xD0, 0x9F,  // `....(..
                /* 0850 */  0x28, 0x0E, 0xE3, 0xAD, 0xE6, 0xCD, 0x06, 0x7B,  // (......{
                /* 0858 */  0xB4, 0x01, 0xC7, 0xFF, 0xFF, 0x68, 0x03, 0x8C,  // .....h..
                /* 0860 */  0x85, 0xBF, 0x03, 0xE8, 0xB9, 0xC6, 0x52, 0x1F,  // ......R.
                /* 0868 */  0x07, 0xF4, 0x68, 0x03, 0xDC, 0x8F, 0x2E, 0xE0,  // ..h.....
                /* 0870 */  0x3C, 0xE7, 0x80, 0xF3, 0x98, 0x10, 0xE3, 0xE1,  // <.......
                /* 0878 */  0x86, 0x01, 0xC6, 0x8B, 0x11, 0x22, 0xEA, 0x23,  // .....".#
                /* 0880 */  0x0E, 0x06, 0xE8, 0x41, 0xC5, 0x28, 0x45, 0x83,  // ...A.(E.
                /* 0888 */  0x09, 0x32, 0xB0, 0x27, 0x60, 0x8C, 0x78, 0x21,  // .2.'`.x!
                /* 0890 */  0x8E, 0x2D, 0xC6, 0x71, 0x3C, 0xA8, 0xC4, 0x78,  // .-.q<..x
                /* 0898 */  0xDF, 0xF1, 0xD1, 0x06, 0x0C, 0x43, 0x7B, 0x1D,  // .....C{.
                /* 08A0 */  0x68, 0xED, 0x34, 0x43, 0x26, 0xE7, 0xA3, 0x8D,  // h.4C&...
                /* 08A8 */  0xCF, 0x10, 0x4F, 0x0A, 0x9E, 0xD9, 0xA3, 0x8D,  // ..O.....
                /* 08B0 */  0x67, 0x10, 0xEE, 0x0C, 0xDE, 0x03, 0x0D, 0xF5,  // g.......
                /* 08B8 */  0x80, 0xF3, 0xFF, 0x7F, 0x3A, 0x88, 0xF2, 0x94,  // ....:...
                /* 08C0 */  0xC3, 0x80, 0xE2, 0x44, 0x0B, 0x19, 0x39, 0x42,  // ...D..9B
                /* 08C8 */  0x9C, 0xA0, 0xA1, 0x1F, 0x6D, 0x58, 0xB8, 0x73,  // ....mX.s
                /* 08D0 */  0x81, 0xFE, 0x50, 0x3E, 0xDA, 0x00, 0xFC, 0x38,  // ..P>...8
                /* 08D8 */  0x8B, 0xE0, 0x8E, 0x72, 0x30, 0x4F, 0x0A, 0x98,  // ...r0O..
                /* 08E0 */  0xE3, 0xD3, 0x83, 0xC8, 0x23, 0x85, 0xCF, 0x09,  // ....#...
                /* 08E8 */  0xF8, 0xD3, 0x09, 0xF0, 0x10, 0xB1, 0x02, 0x0D,  // ........
                /* 08F0 */  0xD5, 0xA9, 0x5F, 0x04, 0xB2, 0xB1, 0x56, 0x0F,  // .._...V.
                /* 08F8 */  0x8B, 0x66, 0xA2, 0xD2, 0x78, 0xD8, 0x04, 0x9E,  // .f..x...
                /* 0900 */  0x32, 0xFE, 0xFF, 0x47, 0xF3, 0xFC, 0xE1, 0x2C,  // 2..G...,
                /* 0908 */  0x50, 0x3A, 0xF7, 0x18, 0xD8, 0x29, 0x28, 0xA4,  // P:...)(.
                /* 0910 */  0x8F, 0x46, 0xC3, 0x31, 0xB4, 0x15, 0xC1, 0x08,  // .F.1....
                /* 0918 */  0xCE, 0x20, 0x06, 0x74, 0x5C, 0x08, 0xD9, 0x38,  // . .t\..8
                /* 0920 */  0x14, 0xA1, 0x8F, 0x42, 0x18, 0x82, 0xF1, 0x20,  // ...B... 
                /* 0928 */  0x74, 0x78, 0xF0, 0xF8, 0x7C, 0x10, 0xE0, 0xE7,  // tx..|...
                /* 0930 */  0x14, 0xDF, 0x0C, 0x8C, 0x6C, 0x7D, 0xE7, 0x0F,  // ....l}..
                /* 0938 */  0xD0, 0x0C, 0x1C, 0x96, 0x9A, 0x9B, 0x12, 0x6A,  // .......j
                /* 0940 */  0x16, 0x3E, 0x15, 0x3C, 0xD7, 0xF8, 0x64, 0x83,  // .>.<..d.
                /* 0948 */  0x3F, 0x1C, 0xC0, 0x99, 0xC5, 0xCB, 0x41, 0xD5,  // ?.....A.
                /* 0950 */  0x83, 0x25, 0x23, 0xA9, 0x6E, 0x1E, 0xD0, 0xC6,  // .%#.n...
                /* 0958 */  0x85, 0x3B, 0x21, 0xC0, 0x03, 0xF2, 0x85, 0xC0,  // .;!.....
                /* 0960 */  0xA7, 0x9D, 0x87, 0x02, 0x36, 0x91, 0x07, 0x1E,  // ....6...
                /* 0968 */  0xA3, 0x19, 0x9D, 0x8B, 0x9C, 0x3F, 0x4A, 0xD6,  // .....?J.
                /* 0970 */  0xFC, 0x29, 0x88, 0xE7, 0xEF, 0xC8, 0xF3, 0x87,  // .)......
                /* 0978 */  0x32, 0xAD, 0xF3, 0xC7, 0x44, 0x9C, 0x3F, 0xBD,  // 2...D.?.
                /* 0980 */  0x7D, 0xE0, 0x21, 0x5F, 0x54, 0x5E, 0x42, 0x7C,  // }.!_T^B|
                /* 0988 */  0xA1, 0x02, 0xD7, 0x45, 0x02, 0xDE, 0x38, 0x7C,  // ...E..8|
                /* 0990 */  0x02, 0xE0, 0xFF, 0xFF, 0x21, 0xF8, 0x04, 0xC0,  // ....!...
                /* 0998 */  0x87, 0xE6, 0x1B, 0x00, 0x70, 0x18, 0x18, 0xEE,  // ....p...
                /* 09A0 */  0x06, 0x00, 0x46, 0x78, 0x8C, 0xB0, 0x5B, 0x13,  // ..Fx..[.
                /* 09A8 */  0x95, 0x35, 0x38, 0xD4, 0x60, 0x7D, 0x41, 0x62,  // .58.`}Ab
                /* 09B0 */  0x67, 0x10, 0xDC, 0x3D, 0x0D, 0x03, 0xEB, 0xE1,  // g..=....
                /* 09B8 */  0x73, 0x58, 0xA3, 0x85, 0x3D, 0xEA, 0x37, 0x13,  // sX..=.7.
                /* 09C0 */  0x1F, 0x6B, 0x7C, 0xA6, 0xF2, 0x89, 0xC8, 0xF7,  // .k|.....
                /* 09C8 */  0x19, 0xB0, 0x5C, 0xD9, 0xE0, 0x5F, 0xAA, 0xF0,  // ..\.._..
                /* 09D0 */  0x57, 0x1E, 0x76, 0x20, 0xF0, 0x29, 0xC4, 0x90,  // W.v .)..
                /* 09D8 */  0xEC, 0x6A, 0x84, 0x3B, 0x1B, 0xC0, 0x1D, 0xEF,  // .j.;....
                /* 09E0 */  0x39, 0xFA, 0xA4, 0x10, 0xEC, 0x6D, 0xC9, 0xC3,  // 9....m..
                /* 09E8 */  0xF4, 0xA9, 0xC9, 0x87, 0x4E, 0x3E, 0x3D, 0x76,  // ....N>=v
                /* 09F0 */  0x6B, 0x62, 0x47, 0xC9, 0x18, 0x8F, 0x03, 0xB0,  // kbG.....
                /* 09F8 */  0xB4, 0x3C, 0x1F, 0x74, 0x55, 0xE1, 0xF7, 0x2D,  // .<.tU..-
                /* 0A00 */  0x27, 0xBD, 0xAA, 0x40, 0x38, 0x10, 0x24, 0x70,  // '..@8.$p
                /* 0A08 */  0xBE, 0xBB, 0x0A, 0xEA, 0xFF, 0x9F, 0x8C, 0x42,  // .......B
                /* 0A10 */  0x4A, 0x0F, 0x17, 0x28, 0x6D, 0x87, 0x0B, 0x0A,  // J..(m...
                /* 0A18 */  0x62, 0x40, 0x07, 0xBF, 0xAB, 0x40, 0x0F, 0x7A,  // b@...@.z
                /* 0A20 */  0x57, 0x81, 0x7E, 0xC7, 0xC1, 0x9F, 0x2D, 0xC0,  // W.~...-.
                /* 0A28 */  0x35, 0xB7, 0x20, 0x41, 0x1F, 0x57, 0xE0, 0x1F,  // 5. A.W..
                /* 0A30 */  0x7B, 0x5E, 0x2E, 0xC0, 0x3F, 0x14, 0xDC, 0x85,  // {^..?...
                /* 0A38 */  0x05, 0x58, 0xC8, 0xBD, 0x04, 0xA0, 0x04, 0x5E,  // .X.....^
                /* 0A40 */  0x02, 0x28, 0x88, 0x2F, 0x01, 0x0E, 0x7F, 0x61,  // .(./...a
                /* 0A48 */  0x81, 0x1E, 0xF6, 0xC2, 0x02, 0x8A, 0x5B, 0x00,  // ......[.
                /* 0A50 */  0xF0, 0x18, 0xC9, 0xFF, 0xFF, 0x95, 0x05, 0x26,  // .......&
                /* 0A58 */  0xF6, 0x63, 0x00, 0x70, 0xB9, 0xB5, 0x00, 0xF3,  // .c.p....
                /* 0A60 */  0xD3, 0x80, 0x6F, 0x2D, 0x80, 0x7B, 0xD1, 0x87,  // ..o-.{..
                /* 0A68 */  0x51, 0x94, 0xCC, 0xC3, 0x28, 0x84, 0xFF, 0xFF,  // Q...(...
                /* 0A70 */  0x61, 0x14, 0xE0, 0xD0, 0xD1, 0xF8, 0x01, 0xF4,  // a.......
                /* 0A78 */  0xD8, 0xDE, 0x07, 0xDE, 0x3F, 0x0F, 0xEE, 0x19,  // ....?...
                /* 0A80 */  0xF4, 0x25, 0xD4, 0x40, 0x27, 0xF6, 0x34, 0xEA,  // .%.@'.4.
                /* 0A88 */  0xC3, 0xA8, 0x41, 0x8E, 0xF0, 0x89, 0xD4, 0x07,  // ..A.....
                /* 0A90 */  0xD1, 0x50, 0x91, 0x62, 0x46, 0x79, 0x11, 0x65,  // .P.bFy.e
                /* 0A98 */  0xE7, 0x77, 0xA3, 0x1B, 0x2A, 0x5A, 0x90, 0xE0,  // .w..*Z..
                /* 0AA0 */  0xA1, 0x1E, 0x46, 0x59, 0xB0, 0xC3, 0x28, 0x90,  // ..FY..(.
                /* 0AA8 */  0xFD, 0xFF, 0x1F, 0x46, 0x01, 0x73, 0x87, 0x18,  // ...F.s..
                /* 0AB0 */  0x70, 0x0C, 0xE0, 0xB1, 0xE3, 0xD4, 0x1E, 0x3B,  // p......;
                /* 0AB8 */  0x60, 0x1D, 0x45, 0x01, 0x16, 0xFC, 0xFF, 0x8F,  // `.E.....
                /* 0AC0 */  0xA2, 0x00, 0xFF, 0xFF, 0xFF, 0x47, 0x51, 0x80,  // .....GQ.
                /* 0AC8 */  0xFF, 0xFF, 0xFF, 0xA3, 0x28, 0xC0, 0xFF, 0xFF,  // ....(...
                /* 0AD0 */  0xFF, 0x51, 0x14, 0x60, 0x92, 0x42, 0x9B, 0x3E,  // .Q.`.B.>
                /* 0AD8 */  0x35, 0x1A, 0xB5, 0x6A, 0x50, 0xA6, 0x46, 0x99,  // 5..jP.F.
                /* 0AE0 */  0x06, 0xB5, 0xFA, 0x54, 0x6A, 0xCC, 0xD8, 0xD9,  // ...Tj...
                /* 0AE8 */  0x20, 0x41, 0xF1, 0xCB, 0xD7, 0xF8, 0x1D, 0xE7,  //  A......
                /* 0AF0 */  0x09, 0x20, 0x10, 0x8B, 0x36, 0x01, 0xC2, 0x22,  // . ..6.."
                /* 0AF8 */  0x83, 0x70, 0x15, 0x20, 0x2C, 0xDC, 0xD3, 0x42,  // .p. ,..B
                /* 0B00 */  0x20, 0x96, 0xA6, 0x03, 0x84, 0xFA, 0x00, 0x61,  //  ......a
                /* 0B08 */  0x22, 0x94, 0x80, 0xB0, 0x08, 0x20, 0xDC, 0x09,  // ".... ..
                /* 0B10 */  0x08, 0x13, 0xAB, 0x05, 0x84, 0x45, 0x05, 0xE1,  // .....E..
                /* 0B18 */  0x5E, 0x40, 0x58, 0xBC, 0xFF, 0x89, 0x40, 0x2C,  // ^@X...@,
                /* 0B20 */  0xCE, 0x0D, 0x08, 0x0B, 0xFA, 0x9C, 0x90, 0x11,  // ........
                /* 0B28 */  0x10, 0xC5, 0x06, 0xD1, 0x80, 0x88, 0x1F, 0x20,  // ....... 
                /* 0B30 */  0x16, 0x01, 0x44, 0x40, 0x96, 0xA2, 0xE8, 0xFF,  // ..D@....
                /* 0B38 */  0x0F, 0xC4, 0x84, 0x81, 0x08, 0xC8, 0xC1, 0x5E,  // .......^
                /* 0B40 */  0x01, 0x02, 0x72, 0x4A, 0x10, 0x01, 0x39, 0xAF,  // ..rJ..9.
                /* 0B48 */  0x25, 0x20, 0x96, 0x1E, 0x44, 0x40, 0x4E, 0x69,  // % ..D@Ni
                /* 0B50 */  0x0A, 0x84, 0x69, 0x54, 0x05, 0x42, 0x5D, 0x81,  // ..iT.B].
                /* 0B58 */  0x30, 0xED, 0xEF, 0xBE, 0x20, 0x24, 0x39, 0x08,  // 0... $9.
                /* 0B60 */  0xF7, 0x05, 0xC2, 0xB4, 0xBD, 0x37, 0x83, 0x90,  // .....7..
                /* 0B68 */  0x64, 0x20, 0xFC, 0xBD, 0x2A, 0x10, 0x67, 0x7F,  // d ..*.g.
                /* 0B70 */  0x6F, 0x06, 0x21, 0xCA, 0xBF, 0x9B, 0x41, 0xD8,  // o.!...A.
                /* 0B78 */  0x4F, 0x55, 0x20, 0xCE, 0x23, 0x0F, 0x84, 0xA9,  // OU .#...
                /* 0B80 */  0xB1, 0x37, 0x28, 0xFA, 0x73, 0xD1, 0xA0, 0x08,  // .7(.s...
                /* 0B88 */  0x88, 0x80, 0x1C, 0xDD, 0x1F, 0x10, 0x13, 0xF2,  // ........
                /* 0B90 */  0xD2, 0x10, 0x90, 0x43, 0xFD, 0x3F, 0x03, 0x91,  // ...C.?..
                /* 0B98 */  0x84, 0x20, 0x02, 0x72, 0xFE, 0x97, 0x46, 0x20,  // . .r..F 
                /* 0BA0 */  0xA2, 0xE6, 0x1F, 0x22, 0x20, 0xEB, 0x78, 0xA0,  // ..." .x.
                /* 0BA8 */  0x08, 0xC4, 0x29, 0x40, 0xA8, 0x18, 0x95, 0x80,  // ..)@....
                /* 0BB0 */  0x4C, 0x19, 0x88, 0x80, 0x2C, 0xD7, 0x25, 0x10,  // L...,.%.
                /* 0BB8 */  0x13, 0x0F, 0x22, 0x20, 0x0B, 0x79, 0xE9, 0x08,  // .." .y..
                /* 0BC0 */  0xC8, 0xAA, 0x40, 0x04, 0x64, 0xCD, 0x3E, 0x81,  // ..@.d.>.
                /* 0BC8 */  0x58, 0x02, 0x10, 0x01, 0xF9, 0xFF, 0x0F         // X......
            })
        }

        Method (_QFF, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
        {
            P8XH (Zero, 0xFF)
            ^MAP1.CAUS = One
            \NTF0 (0x80)
        }
    }
}

