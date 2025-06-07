! ------------------------------------------------------------------------------  
! This file was automatically created by SARAH version 4.15.3 
! SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223,
!           1405.1434, 1411.0675, 1503.03098, 1703.09237, 1706.05372, 1805.07306  
! (c) Florian Staub, Mark Goodsell and Werner Porod 2020  
! ------------------------------------------------------------------------------  
! File created at 16:48 on 7.6.2025   
! ----------------------------------------------------------------------  
 
 
Module LoopMasses_DLRSM 
 
Use Control 
Use Settings 
Use Couplings_DLRSM 
Use LoopFunctions 
Use AddLoopFunctions 
Use Mathematics 
Use MathematicsQP 
Use Model_Data_DLRSM 
Use StandardModel 
Use Tadpoles_DLRSM 
 Use Pole2L_DLRSM 
 Use TreeLevelMasses_DLRSM 
 
Real(dp), Private :: Mhh_1L(4), Mhh2_1L(4)  
Complex(dp), Private :: ZH_1L(4,4)  
Real(dp), Private :: MAh_1L(4), MAh2_1L(4)  
Complex(dp), Private :: UP_1L(4,4)  
Real(dp), Private :: MHpm_1L(4), MHpm2_1L(4)  
Complex(dp), Private :: UC_1L(4,4)  
Real(dp), Private :: MFv_1L(9), MFv2_1L(9)  
Complex(dp), Private :: ZM_1L(9,9)  
Real(dp), Private :: MVZ_1L, MVZ2_1L  
Real(dp), Private :: MVZR_1L, MVZR2_1L  
Real(dp), Private :: MVWLm_1L, MVWLm2_1L  
Real(dp), Private :: MVWRm_1L, MVWRm2_1L  
Real(dp) :: pi2A0  
Real(dp) :: ti_ep2L(4)  
Real(dp) :: pi_ep2L(4,4)
Real(dp) :: Pi2S_EffPot(4,4)
Real(dp) :: PiP2S_EffPot(4,4)
Contains 
 
Subroutine OneLoopMasses(MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,            & 
& Mhh2,MHpm,MHpm2,MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,MVZR2,PhiW,TW,UC,              & 
& ZDR,ZER,UP,ZUR,ZDL,ZEL,ZUL,ZH,ZM,ZW,ZZ,k1,vR,gBL,g2,g3,LAM2,LAM1,ALP1,RHO1,            & 
& RHO2,ALP2,ALP3,LAM5,LAM6,LAM3,LAM4,Y,YQ1,YQ2,Yt,YL,YR,Mux,MU12,MU22,kont)

Implicit None 
Real(dp),Intent(inout) :: gBL,g2,g3,LAM2,LAM1,ALP1,RHO1,RHO2,ALP2,ALP3,LAM5,LAM6,LAM3,LAM4,MU12,MU22

Complex(dp),Intent(inout) :: Y(3,3),YQ1(3,3),YQ2(3,3),Yt(3,3),YL(3,3),YR(3,3),Mux(3,3)

Real(dp),Intent(inout) :: MAh(4),MAh2(4),MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),MFv(9),MFv2(9),           & 
& Mhh(4),Mhh2(4),MHpm(4),MHpm2(4),MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,               & 
& MVZR2,PhiW,TW,UC(4,4),UP(4,4),ZH(4,4)

Complex(dp),Intent(inout) :: ZDR(3,3),ZER(3,3),ZUR(3,3),ZDL(3,3),ZEL(3,3),ZUL(3,3),ZM(9,9),ZW(4,4),ZZ(3,3)

Real(dp),Intent(inout) :: k1,vR

Complex(dp) :: cplAhAhcUHpm(4,4,4),cplAhAhcVWLmVWLm(4,4),cplAhAhcVWRmVWLm(4,4),cplAhAhcVWRmVWRm(4,4),& 
& cplAhAhUhh(4,4,4),cplAhAhUhhUhh(4,4,4,4),cplAhAhUHpmcUHpm(4,4,4,4),cplAhAhVPVP(4,4),   & 
& cplAhAhVPVZ(4,4),cplAhAhVPVZR(4,4),cplAhAhVZRVZR(4,4),cplAhAhVZVZ(4,4),cplAhAhVZVZR(4,4),& 
& cplAhcHpmcVWLm(4,4),cplAhcHpmcVWRm(4,4),cplAhcUHpmcVWLm(4,4),cplAhcUHpmcVWRm(4,4),     & 
& cplAhcVWLmVWRm(4),cplAhcVWRmVWLm(4),cplAhhhcUHpm(4,4,4),cplAhhhVP(4,4),cplAhhhVZ(4,4), & 
& cplAhhhVZR(4,4),cplAhHpmcUHpm(4,4,4),cplAhHpmVWLm(4,4),cplAhUhhcHpm(4,4,4),            & 
& cplAhUhhVP(4,4),cplAhUhhVZ(4,4),cplAhUhhVZR(4,4),cplcFdFdUAhL(3,3,4),cplcFdFdUAhR(3,3,4),& 
& cplcFdFdUhhL(3,3,4),cplcFdFdUhhR(3,3,4),cplcFdFdVGL(3,3),cplcFdFdVGR(3,3),             & 
& cplcFdFdVPL(3,3),cplcFdFdVPR(3,3),cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),cplcFdFdVZRL(3,3), & 
& cplcFdFdVZRR(3,3),cplcFdFucUHpmL(3,3,4),cplcFdFucUHpmR(3,3,4),cplcFdFuVWLmL(3,3),      & 
& cplcFdFuVWLmR(3,3),cplcFeFeUAhL(3,3,4),cplcFeFeUAhR(3,3,4),cplcFeFeUhhL(3,3,4),        & 
& cplcFeFeUhhR(3,3,4),cplcFeFeVPL(3,3),cplcFeFeVPR(3,3),cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),& 
& cplcFeFeVZRL(3,3),cplcFeFeVZRR(3,3),cplcFeFvcUHpmL(3,9,4),cplcFeFvcUHpmR(3,9,4),       & 
& cplcFeFvVWLmL(3,9),cplcFeFvVWLmR(3,9),cplcFeUFvcHpmL(3,9,4),cplcFeUFvcHpmR(3,9,4),     & 
& cplcFeUFvVWLmL(3,9),cplcFeUFvVWLmR(3,9),cplcFeUFvVWRmL(3,9),cplcFeUFvVWRmR(3,9),       & 
& cplcFuFdcVWLmL(3,3),cplcFuFdcVWLmR(3,3),cplcFuFdcVWRmL(3,3),cplcFuFdcVWRmR(3,3),       & 
& cplcFuFuUAhL(3,3,4),cplcFuFuUAhR(3,3,4),cplcFuFuUhhL(3,3,4),cplcFuFuUhhR(3,3,4),       & 
& cplcFuFuVGL(3,3),cplcFuFuVGR(3,3),cplcFuFuVPL(3,3),cplcFuFuVPR(3,3),cplcFuFuVZL(3,3),  & 
& cplcFuFuVZR(3,3),cplcFuFuVZRL(3,3),cplcFuFuVZRR(3,3),cplcgGgGVG,cplcgPgWLmcVWLm,       & 
& cplcgPgWLmcVWRm,cplcgPgWLpVWLm,cplcgPgWRmcVWLm,cplcgPgWRmcVWRm,cplcgPgWRpVWLm,         & 
& cplcgWLmgPVWLm,cplcgWLmgWLmUAh(4),cplcgWLmgWLmUhh(4),cplcgWLmgWLmVP,cplcgWLmgWLmVZ,    & 
& cplcgWLmgWLmVZR,cplcgWLmgWRmUAh(4),cplcgWLmgWRmUhh(4),cplcgWLmgWRmVP,cplcgWLmgWRmVZ,   & 
& cplcgWLmgWRmVZR,cplcgWLmgZcUHpm(4),cplcgWLmgZpcUHpm(4),cplcgWLmgZpVWLm,cplcgWLmgZVWLm, & 
& cplcgWLpgPcVWLm,cplcgWLpgPcVWRm,cplcgWLpgWLpUAh(4),cplcgWLpgWLpUhh(4),cplcgWLpgWLpVP,  & 
& cplcgWLpgWLpVZ,cplcgWLpgWLpVZR,cplcgWLpgWRpUAh(4),cplcgWLpgWRpUhh(4),cplcgWLpgWRpVP,   & 
& cplcgWLpgWRpVZ,cplcgWLpgWRpVZR,cplcgWLpgZcVWLm,cplcgWLpgZcVWRm,cplcgWLpgZpcVWLm,       & 
& cplcgWLpgZpcVWRm,cplcgWLpgZpUHpm(4),cplcgWLpgZUHpm(4),cplcgWRmgPVWLm,cplcgWRmgWLmUAh(4),& 
& cplcgWRmgWLmUhh(4),cplcgWRmgWLmVP,cplcgWRmgWLmVZ,cplcgWRmgWLmVZR,cplcgWRmgWRmUAh(4),   & 
& cplcgWRmgWRmUhh(4),cplcgWRmgWRmVP,cplcgWRmgWRmVZ,cplcgWRmgWRmVZR,cplcgWRmgZcUHpm(4),   & 
& cplcgWRmgZpcUHpm(4),cplcgWRmgZpVWLm,cplcgWRmgZVWLm,cplcgWRpgPcVWLm,cplcgWRpgPcVWRm,    & 
& cplcgWRpgWLpUAh(4),cplcgWRpgWLpUhh(4),cplcgWRpgWLpVP,cplcgWRpgWLpVZ,cplcgWRpgWLpVZR,   & 
& cplcgWRpgWRpUAh(4),cplcgWRpgWRpUhh(4),cplcgWRpgWRpVP,cplcgWRpgWRpVZ,cplcgWRpgWRpVZR,   & 
& cplcgWRpgZcVWLm,cplcgWRpgZcVWRm,cplcgWRpgZpcVWLm,cplcgWRpgZpcVWRm,cplcgWRpgZpUHpm(4),  & 
& cplcgWRpgZUHpm(4),cplcgZgWLmcVWLm,cplcgZgWLmcVWRm,cplcgZgWLmUHpm(4),cplcgZgWLpcUHpm(4),& 
& cplcgZgWLpVWLm,cplcgZgWRmcVWLm,cplcgZgWRmcVWRm,cplcgZgWRmUHpm(4),cplcgZgWRpcUHpm(4),   & 
& cplcgZgWRpVWLm,cplcgZgZpUhh(4),cplcgZgZUhh(4),cplcgZpgWLmcVWLm,cplcgZpgWLmcVWRm,       & 
& cplcgZpgWLmUHpm(4),cplcgZpgWLpcUHpm(4),cplcgZpgWLpVWLm,cplcgZpgWRmcVWLm

Complex(dp) :: cplcgZpgWRmcVWRm,cplcgZpgWRmUHpm(4),cplcgZpgWRpcUHpm(4),cplcgZpgWRpVWLm,               & 
& cplcgZpgZpUhh(4),cplcgZpgZUhh(4),cplcHpmcVWLmVP(4),cplcHpmcVWLmVZ(4),cplcHpmcVWLmVZR(4),& 
& cplcHpmcVWRmVP(4),cplcHpmcVWRmVZ(4),cplcHpmcVWRmVZR(4),cplcUFdFdAhL(3,3,4),            & 
& cplcUFdFdAhR(3,3,4),cplcUFdFdhhL(3,3,4),cplcUFdFdhhR(3,3,4),cplcUFdFdVGL(3,3),         & 
& cplcUFdFdVGR(3,3),cplcUFdFdVPL(3,3),cplcUFdFdVPR(3,3),cplcUFdFdVZL(3,3),               & 
& cplcUFdFdVZR(3,3),cplcUFdFdVZRL(3,3),cplcUFdFdVZRR(3,3),cplcUFdFucHpmL(3,3,4),         & 
& cplcUFdFucHpmR(3,3,4),cplcUFdFuVWLmL(3,3),cplcUFdFuVWLmR(3,3),cplcUFdFuVWRmL(3,3),     & 
& cplcUFdFuVWRmR(3,3),cplcUFeFeAhL(3,3,4),cplcUFeFeAhR(3,3,4),cplcUFeFehhL(3,3,4),       & 
& cplcUFeFehhR(3,3,4),cplcUFeFeVPL(3,3),cplcUFeFeVPR(3,3),cplcUFeFeVZL(3,3),             & 
& cplcUFeFeVZR(3,3),cplcUFeFeVZRL(3,3),cplcUFeFeVZRR(3,3),cplcUFeFvcHpmL(3,9,4),         & 
& cplcUFeFvcHpmR(3,9,4),cplcUFeFvVWLmL(3,9),cplcUFeFvVWLmR(3,9),cplcUFeFvVWRmL(3,9),     & 
& cplcUFeFvVWRmR(3,9),cplcUFuFdcVWLmL(3,3),cplcUFuFdcVWLmR(3,3),cplcUFuFdcVWRmL(3,3),    & 
& cplcUFuFdcVWRmR(3,3),cplcUFuFdHpmL(3,3,4),cplcUFuFdHpmR(3,3,4),cplcUFuFuAhL(3,3,4),    & 
& cplcUFuFuAhR(3,3,4),cplcUFuFuhhL(3,3,4),cplcUFuFuhhR(3,3,4),cplcUFuFuVGL(3,3),         & 
& cplcUFuFuVGR(3,3),cplcUFuFuVPL(3,3),cplcUFuFuVPR(3,3),cplcUFuFuVZL(3,3),               & 
& cplcUFuFuVZR(3,3),cplcUFuFuVZRL(3,3),cplcUFuFuVZRR(3,3),cplcUHpmcVWLmVP(4),            & 
& cplcUHpmcVWLmVZ(4),cplcUHpmcVWLmVZR(4),cplcUHpmcVWRmVP(4),cplcUHpmcVWRmVZ(4),          & 
& cplcUHpmcVWRmVZR(4),cplcVWLmcVWLmVWLmVWLm1,cplcVWLmcVWLmVWLmVWLm2,cplcVWLmcVWLmVWLmVWLm3,& 
& cplcVWLmcVWRmVWLmVWLm1,cplcVWLmcVWRmVWLmVWLm2,cplcVWLmcVWRmVWLmVWLm3,cplcVWLmcVWRmVWLmVWRm1,& 
& cplcVWLmcVWRmVWLmVWRm2,cplcVWLmcVWRmVWLmVWRm3,cplcVWLmVPVPVWLm1,cplcVWLmVPVPVWLm2,     & 
& cplcVWLmVPVPVWLm3,cplcVWLmVPVWLm,cplcVWLmVPVWLmVZ1,cplcVWLmVPVWLmVZ2,cplcVWLmVPVWLmVZ3,& 
& cplcVWLmVPVWLmVZR1,cplcVWLmVPVWLmVZR2,cplcVWLmVPVWLmVZR3,cplcVWLmVPVWRm,               & 
& cplcVWLmVWLmVZ,cplcVWLmVWLmVZR,cplcVWLmVWLmVZRVZR1,cplcVWLmVWLmVZRVZR2,cplcVWLmVWLmVZRVZR3,& 
& cplcVWLmVWLmVZVZ1,cplcVWLmVWLmVZVZ2,cplcVWLmVWLmVZVZ3,cplcVWLmVWLmVZVZR1,              & 
& cplcVWLmVWLmVZVZR2,cplcVWLmVWLmVZVZR3,cplcVWLmVWRmVZ,cplcVWLmVWRmVZR,cplcVWRmcVWRmVWLmVWRm1,& 
& cplcVWRmcVWRmVWLmVWRm2,cplcVWRmcVWRmVWLmVWRm3,cplcVWRmcVWRmVWRmVWRm1,cplcVWRmcVWRmVWRmVWRm2,& 
& cplcVWRmcVWRmVWRmVWRm3,cplcVWRmVPVPVWLm1,cplcVWRmVPVPVWLm2,cplcVWRmVPVPVWLm3,          & 
& cplcVWRmVPVPVWRm1,cplcVWRmVPVPVWRm2,cplcVWRmVPVPVWRm3,cplcVWRmVPVWLm,cplcVWRmVPVWRm,   & 
& cplcVWRmVPVWRmVZ1,cplcVWRmVPVWRmVZ2,cplcVWRmVPVWRmVZ3,cplcVWRmVPVWRmVZR1,              & 
& cplcVWRmVPVWRmVZR2,cplcVWRmVPVWRmVZR3,cplcVWRmVWLmVZ,cplcVWRmVWLmVZR,cplcVWRmVWLmVZRVZR1,& 
& cplcVWRmVWLmVZRVZR2,cplcVWRmVWLmVZRVZR3,cplcVWRmVWLmVZVZ1,cplcVWRmVWLmVZVZ2,           & 
& cplcVWRmVWLmVZVZ3,cplcVWRmVWRmVZ,cplcVWRmVWRmVZR,cplcVWRmVWRmVZRVZR1,cplcVWRmVWRmVZRVZR2,& 
& cplcVWRmVWRmVZRVZR3,cplcVWRmVWRmVZVZ1,cplcVWRmVWRmVZVZ2,cplcVWRmVWRmVZVZ3,             & 
& cplcVWRmVWRmVZVZR1,cplcVWRmVWRmVZVZR2,cplcVWRmVWRmVZVZR3,cplFvFecVWLmL(9,3),           & 
& cplFvFecVWLmR(9,3),cplFvFecVWRmL(9,3),cplFvFecVWRmR(9,3),cplFvFvUAhL(9,9,4),           & 
& cplFvFvUAhR(9,9,4),cplFvFvUhhL(9,9,4),cplFvFvUhhR(9,9,4),cplFvFvVPL(9,9),              & 
& cplFvFvVPR(9,9),cplFvFvVZL(9,9),cplFvFvVZR(9,9),cplFvFvVZRL(9,9),cplFvFvVZRR(9,9)

Complex(dp) :: cplhhcHpmcVWLm(4,4),cplhhcHpmcVWRm(4,4),cplhhcUHpmcVWLm(4,4),cplhhcUHpmcVWRm(4,4),     & 
& cplhhcVWLmVWLm(4),cplhhcVWLmVWRm(4),cplhhcVWRmVWLm(4),cplhhcVWRmVWRm(4),               & 
& cplhhhhcUHpm(4,4,4),cplhhhhcVWLmVWLm(4,4),cplhhhhcVWRmVWLm(4,4),cplhhhhcVWRmVWRm(4,4), & 
& cplhhhhUHpmcUHpm(4,4,4,4),cplhhhhVPVP(4,4),cplhhhhVPVZ(4,4),cplhhhhVPVZR(4,4),         & 
& cplhhhhVZRVZR(4,4),cplhhhhVZVZ(4,4),cplhhhhVZVZR(4,4),cplhhHpmcUHpm(4,4,4),            & 
& cplhhHpmVWLm(4,4),cplhhVPVZ(4),cplhhVPVZR(4),cplhhVZRVZR(4),cplhhVZVZ(4),              & 
& cplhhVZVZR(4),cplHpmcHpmcVWLmVWLm(4,4),cplHpmcHpmcVWRmVWLm(4,4),cplHpmcHpmcVWRmVWRm(4,4),& 
& cplHpmcHpmVP(4,4),cplHpmcHpmVPVP(4,4),cplHpmcHpmVPVZ(4,4),cplHpmcHpmVPVZR(4,4),        & 
& cplHpmcHpmVZ(4,4),cplHpmcHpmVZR(4,4),cplHpmcHpmVZRVZR(4,4),cplHpmcHpmVZVZ(4,4),        & 
& cplHpmcHpmVZVZR(4,4),cplHpmcUHpmcHpm(4,4,4),cplHpmcUHpmVP(4,4),cplHpmcUHpmVZ(4,4),     & 
& cplHpmcUHpmVZR(4,4),cplHpmVPVWLm(4),cplHpmVPVWRm(4),cplHpmVWLmVZ(4),cplHpmVWLmVZR(4),  & 
& cplHpmVWRmVZ(4),cplHpmVWRmVZR(4),cplUAhAhcHpm(4,4,4),cplUAhAhhh(4,4,4),cplUAhcVWRmVWLm(4),& 
& cplUAhhhcHpm(4,4,4),cplUAhhhVP(4,4),cplUAhhhVZ(4,4),cplUAhhhVZR(4,4),cplUAhHpmcHpm(4,4,4),& 
& cplUAhHpmVWLm(4,4),cplUAhHpmVWRm(4,4),cplUAhUAhAhAh(4,4,4,4),cplUAhUAhcVWLmVWLm(4,4),  & 
& cplUAhUAhcVWRmVWRm(4,4),cplUAhUAhhhhh(4,4,4,4),cplUAhUAhHpmcHpm(4,4,4,4),              & 
& cplUAhUAhVPVP(4,4),cplUAhUAhVZRVZR(4,4),cplUAhUAhVZVZ(4,4),cplUFvFecVWLmL(9,3),        & 
& cplUFvFecVWLmR(9,3),cplUFvFecVWRmL(9,3),cplUFvFecVWRmR(9,3),cplUFvFeHpmL(9,3,4),       & 
& cplUFvFeHpmR(9,3,4),cplUFvFvAhL(9,9,4),cplUFvFvAhR(9,9,4),cplUFvFvhhL(9,9,4),          & 
& cplUFvFvhhR(9,9,4),cplUFvFvVPL(9,9),cplUFvFvVPR(9,9),cplUFvFvVZL(9,9),cplUFvFvVZR(9,9),& 
& cplUFvFvVZRL(9,9),cplUFvFvVZRR(9,9),cplUhhcVWLmVWLm(4),cplUhhcVWRmVWLm(4),             & 
& cplUhhcVWRmVWRm(4),cplUhhhhcHpm(4,4,4),cplUhhhhhh(4,4,4),cplUhhHpmcHpm(4,4,4),         & 
& cplUhhHpmVWLm(4,4),cplUhhHpmVWRm(4,4),cplUhhUhhcVWLmVWLm(4,4),cplUhhUhhcVWRmVWRm(4,4), & 
& cplUhhUhhhhhh(4,4,4,4),cplUhhUhhHpmcHpm(4,4,4,4),cplUhhUhhVPVP(4,4),cplUhhUhhVZRVZR(4,4),& 
& cplUhhUhhVZVZ(4,4),cplUhhVPVZ(4),cplUhhVPVZR(4),cplUhhVZRVZR(4),cplUhhVZVZ(4),         & 
& cplUhhVZVZR(4),cplUHpmcUHpmcVWLmVWLm(4,4),cplUHpmcUHpmcVWRmVWRm(4,4),cplUHpmcUHpmVPVP(4,4),& 
& cplUHpmcUHpmVZRVZR(4,4),cplUHpmcUHpmVZVZ(4,4),cplUHpmHpmcUHpmcHpm(4,4,4,4),            & 
& cplVGVGVG,cplVGVGVGVG1,cplVGVGVGVG2,cplVGVGVGVG3

Integer , Intent(inout):: kont 
Integer :: i1,i2,i3,i4,j1, j2, j3, j4, il, i_count, ierr 
Integer :: i2L, iFin 
Logical :: Convergence2L 
Real(dp) :: Pi2S_EffPot_save(4,4), diff(4,4)
Complex(dp) :: Tad1Loop(4), dmz2  
Real(dp) :: comp(2), tanbQ, vev2, vSM
Iname = Iname + 1 
NameOfUnit(Iname) = 'OneLoopMasses' 
 
kont = 0 
 
! Set Gauge fixing parameters 
RXi= RXiNew 
RXiG = RXi 
RXiP = RXi 
RXiWLm = RXi 
RXiWRm = RXi 
RXiZ = RXi 
RXiZR = RXi 

 ! Running angles 

 
Call TreeMasses(MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHpm,           & 
& MHpm2,MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,MVZR2,PhiW,TW,UC,ZDR,ZER,UP,             & 
& ZUR,ZDL,ZEL,ZUL,ZH,ZM,ZW,ZZ,k1,vR,gBL,g2,g3,LAM2,LAM1,ALP1,RHO1,RHO2,ALP2,             & 
& ALP3,LAM5,LAM6,LAM3,LAM4,Y,YQ1,YQ2,Yt,YL,YR,Mux,MU12,MU22,GenerationMixing,kont)

MU12Tree  = MU12
MU22Tree  = MU22

 
 If (CalculateOneLoopMasses) Then 
 
If ((DecoupleAtRenScale).and.(Abs(1._dp-RXiNew).lt.0.01_dp)) Then 
vSM=vSM_Q 
k1=vSM/Sqrt(1 + TanBeta**2) 
Else 
Call CouplingsForVectorBosons(gBL,g2,ZZ,ZH,UP,ZM,PhiW,k1,vR,UC,ZDL,ZDR,               & 
& ZUL,ZUR,ZEL,ZER,cplAhhhVZ,cplcFdFdVZL,cplcFdFdVZR,cplcFeFeVZL,cplcFeFeVZR,             & 
& cplcFuFuVZL,cplcFuFuVZR,cplFvFvVZL,cplFvFvVZR,cplcgWLmgWLmVZ,cplcgWRmgWLmVZ,           & 
& cplcgWLpgWLpVZ,cplcgWRpgWLpVZ,cplcgWRmgWRmVZ,cplcgWRpgWRpVZ,cplhhVPVZ,cplhhVZVZ,       & 
& cplhhVZVZR,cplHpmcHpmVZ,cplHpmVWLmVZ,cplHpmVWRmVZ,cplcVWLmVWLmVZ,cplcVWRmVWLmVZ,       & 
& cplcVWRmVWRmVZ,cplAhAhVZVZ,cplhhhhVZVZ,cplHpmcHpmVZVZ,cplcVWLmVWLmVZVZ1,               & 
& cplcVWLmVWLmVZVZ2,cplcVWLmVWLmVZVZ3,cplcVWRmVWRmVZVZ1,cplcVWRmVWRmVZVZ2,               & 
& cplcVWRmVWRmVZVZ3,cplhhVPVZR,cplHpmVWLmVZR,cplcVWLmVWLmVZR,cplcVWRmVWLmVZR,            & 
& cplcVWLmVWLmVZRVZR1,cplcVWLmVWLmVZRVZR2,cplcVWLmVWLmVZRVZR3,cplAhhhVP,cplcFdFdVPL,     & 
& cplcFdFdVPR,cplcFeFeVPL,cplcFeFeVPR,cplcFuFuVPL,cplcFuFuVPR,cplFvFvVPL,cplFvFvVPR,     & 
& cplcgWLmgWLmVP,cplcgWRmgWLmVP,cplcgWLpgWLpVP,cplcgWRpgWLpVP,cplcgWRmgWRmVP,            & 
& cplcgWRpgWRpVP,cplHpmcHpmVP,cplHpmVPVWLm,cplHpmVPVWRm,cplcVWLmVPVWLm,cplcVWRmVPVWLm,   & 
& cplcVWRmVPVWRm,cplAhAhVPVP,cplhhhhVPVP,cplHpmcHpmVPVP,cplcVWLmVPVPVWLm1,               & 
& cplcVWLmVPVPVWLm2,cplcVWLmVPVPVWLm3,cplcVWRmVPVPVWRm1,cplcVWRmVPVPVWRm2,               & 
& cplcVWRmVPVPVWRm3,cplAhcHpmcVWLm,cplAhcVWLmVWRm,cplcFuFdcVWLmL,cplcFuFdcVWLmR,         & 
& cplFvFecVWLmL,cplFvFecVWLmR,cplcgWLpgPcVWLm,cplcgWRpgPcVWLm,cplcgPgWLmcVWLm,           & 
& cplcgZgWLmcVWLm,cplcgZpgWLmcVWLm,cplcgPgWRmcVWLm,cplcgZgWRmcVWLm,cplcgZpgWRmcVWLm,     & 
& cplcgWLpgZcVWLm,cplcgWRpgZcVWLm,cplcgWLpgZpcVWLm,cplcgWRpgZpcVWLm,cplhhcHpmcVWLm,      & 
& cplhhcVWLmVWLm,cplhhcVWLmVWRm,cplcHpmcVWLmVP,cplcVWLmVPVWRm,cplcVWLmVWRmVZ,            & 
& cplcVWLmVWRmVZR,cplcHpmcVWLmVZ,cplcHpmcVWLmVZR,cplAhAhcVWLmVWLm,cplhhhhcVWLmVWLm,      & 
& cplHpmcHpmcVWLmVWLm,cplcVWLmcVWLmVWLmVWLm1,cplcVWLmcVWLmVWLmVWLm2,cplcVWLmcVWLmVWLmVWLm3,& 
& cplcVWLmcVWRmVWLmVWRm1,cplcVWLmcVWRmVWLmVWRm2,cplcVWLmcVWRmVWLmVWRm3,cplAhcVWRmVWLm,   & 
& cplhhcVWRmVWLm,cplcHpmcVWRmVP,cplcHpmcVWRmVZ,cplcgWLmgWRmVZ,cplcgWLpgWRpVZ,            & 
& cplAhAhVZVZR,cplhhhhVZVZR,cplHpmcHpmVZVZR,cplcVWLmVWLmVZVZR1,cplcVWLmVWLmVZVZR2,       & 
& cplcVWLmVWLmVZVZR3,cplcVWRmVWRmVZVZR1,cplcVWRmVWRmVZVZR2,cplcVWRmVWRmVZVZR3,           & 
& cplcgWLmgWRmVP,cplcgWLpgWRpVP,cplAhAhVPVZ,cplhhhhVPVZ,cplHpmcHpmVPVZ,cplcVWLmVPVWLmVZ1,& 
& cplcVWLmVPVWLmVZ2,cplcVWLmVPVWLmVZ3,cplcVWRmVPVWRmVZ1,cplcVWRmVPVWRmVZ2,               & 
& cplcVWRmVPVWRmVZ3,cplAhAhVPVZR,cplhhhhVPVZR,cplHpmcHpmVPVZR,cplcVWLmVPVWLmVZR1,        & 
& cplcVWLmVPVWLmVZR2,cplcVWLmVPVWLmVZR3,cplcVWRmVPVWRmVZR1,cplcVWRmVPVWRmVZR2,           & 
& cplcVWRmVPVWRmVZR3,cplAhHpmVWLm,cplcFdFuVWLmL,cplcFdFuVWLmR,cplcFeFvVWLmL,             & 
& cplcFeFvVWLmR,cplcgWLmgPVWLm,cplcgWRmgPVWLm,cplcgPgWLpVWLm,cplcgZgWLpVWLm,             & 
& cplcgZpgWLpVWLm,cplcgPgWRpVWLm,cplcgZgWRpVWLm,cplcgZpgWRpVWLm,cplcgWLmgZVWLm,          & 
& cplcgWRmgZVWLm,cplcgWLmgZpVWLm,cplcgWRmgZpVWLm,cplhhHpmVWLm,cplAhAhcVWRmVWLm,          & 
& cplhhhhcVWRmVWLm,cplHpmcHpmcVWRmVWLm,cplcVWRmVPVPVWLm1,cplcVWRmVPVPVWLm2,              & 
& cplcVWRmVPVPVWLm3,cplcVWLmcVWRmVWLmVWLm1,cplcVWLmcVWRmVWLmVWLm2,cplcVWLmcVWRmVWLmVWLm3,& 
& cplcVWRmcVWRmVWLmVWRm1,cplcVWRmcVWRmVWLmVWRm2,cplcVWRmcVWRmVWLmVWRm3,cplcVWRmVWLmVZVZ1,& 
& cplcVWRmVWLmVZVZ2,cplcVWRmVWLmVZVZ3,cplcVWRmVWLmVZRVZR1,cplcVWRmVWLmVZRVZR2,           & 
& cplcVWRmVWLmVZRVZR3)

End if 
Call SolveTadpoleEquations(gBL,g2,g3,LAM2,LAM1,ALP1,RHO1,RHO2,ALP2,ALP3,              & 
& LAM5,LAM6,LAM3,LAM4,Y,YQ1,YQ2,Yt,YL,YR,Mux,MU12,MU22,k1,vR,(/ ZeroC, ZeroC, ZeroC, ZeroC /))

Call TreeMasses(MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHpm,           & 
& MHpm2,MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,MVZR2,PhiW,TW,UC,ZDR,ZER,UP,             & 
& ZUR,ZDL,ZEL,ZUL,ZH,ZM,ZW,ZZ,k1,vR,gBL,g2,g3,LAM2,LAM1,ALP1,RHO1,RHO2,ALP2,             & 
& ALP3,LAM5,LAM6,LAM3,LAM4,Y,YQ1,YQ2,Yt,YL,YR,Mux,MU12,MU22,GenerationMixing,kont)

Call CouplingsForLoopMasses(LAM2,LAM1,ALP1,RHO1,RHO2,ALP2,ALP3,LAM5,LAM6,             & 
& LAM3,LAM4,k1,vR,UP,UC,gBL,g2,ZZ,YQ1,YQ2,ZDL,ZDR,Y,Yt,ZEL,ZER,ZUL,ZUR,YR,               & 
& ZM,PhiW,ZH,g3,cplAhAhUhh,cplAhUhhcHpm,cplAhUhhVP,cplAhUhhVZ,cplAhUhhVZR,               & 
& cplcFdFdUhhL,cplcFdFdUhhR,cplcFeFeUhhL,cplcFeFeUhhR,cplcFuFuUhhL,cplcFuFuUhhR,         & 
& cplFvFvUhhL,cplFvFvUhhR,cplcgWLmgWLmUhh,cplcgWRmgWLmUhh,cplcgWLmgWRmUhh,               & 
& cplcgWLpgWLpUhh,cplcgWRpgWLpUhh,cplcgWLpgWRpUhh,cplcgWRmgWRmUhh,cplcgWRpgWRpUhh,       & 
& cplcgZgZUhh,cplcgZpgZUhh,cplcgZgZpUhh,cplcgZpgZpUhh,cplUhhhhhh,cplUhhhhcHpm,           & 
& cplUhhHpmcHpm,cplUhhHpmVWLm,cplUhhHpmVWRm,cplUhhVPVZ,cplUhhVPVZR,cplUhhcVWLmVWLm,      & 
& cplUhhcVWRmVWLm,cplUhhcVWRmVWRm,cplUhhVZVZ,cplUhhVZVZR,cplUhhVZRVZR,cplAhAhUhhUhh,     & 
& cplUhhUhhhhhh,cplUhhUhhHpmcHpm,cplUhhUhhVPVP,cplUhhUhhcVWLmVWLm,cplUhhUhhcVWRmVWRm,    & 
& cplUhhUhhVZVZ,cplUhhUhhVZRVZR,cplUAhAhhh,cplUAhAhcHpm,cplcFdFdUAhL,cplcFdFdUAhR,       & 
& cplcFeFeUAhL,cplcFeFeUAhR,cplcFuFuUAhL,cplcFuFuUAhR,cplFvFvUAhL,cplFvFvUAhR,           & 
& cplcgWLmgWLmUAh,cplcgWRmgWLmUAh,cplcgWLmgWRmUAh,cplcgWLpgWLpUAh,cplcgWRpgWLpUAh,       & 
& cplcgWLpgWRpUAh,cplcgWRmgWRmUAh,cplcgWRpgWRpUAh,cplUAhhhcHpm,cplUAhhhVP,               & 
& cplUAhhhVZ,cplUAhhhVZR,cplUAhHpmcHpm,cplUAhHpmVWLm,cplUAhHpmVWRm,cplUAhcVWRmVWLm,      & 
& cplUAhUAhAhAh,cplUAhUAhhhhh,cplUAhUAhHpmcHpm,cplUAhUAhVPVP,cplUAhUAhcVWLmVWLm,         & 
& cplUAhUAhcVWRmVWRm,cplUAhUAhVZVZ,cplUAhUAhVZRVZR,cplAhAhcUHpm,cplAhhhcUHpm,            & 
& cplAhcUHpmcVWLm,cplAhcUHpmcVWRm,cplAhHpmcUHpm,cplcFdFucUHpmL,cplcFdFucUHpmR,           & 
& cplcFeFvcUHpmL,cplcFeFvcUHpmR,cplcgZgWLpcUHpm,cplcgWLpgZUHpm,cplcgZpgWLpcUHpm,         & 
& cplcgWLpgZpUHpm,cplcgZgWRpcUHpm,cplcgWRpgZUHpm,cplcgZpgWRpcUHpm,cplcgWRpgZpUHpm,       & 
& cplcgWLmgZcUHpm,cplcgZgWLmUHpm,cplcgWRmgZcUHpm,cplcgZgWRmUHpm,cplcgWLmgZpcUHpm,        & 
& cplcgZpgWLmUHpm,cplcgWRmgZpcUHpm,cplcgZpgWRmUHpm,cplhhhhcUHpm,cplhhcUHpmcVWLm,         & 
& cplhhcUHpmcVWRm,cplhhHpmcUHpm,cplHpmcUHpmcHpm,cplHpmcUHpmVP,cplHpmcUHpmVZ,             & 
& cplHpmcUHpmVZR,cplcUHpmcVWLmVP,cplcUHpmcVWRmVP,cplcUHpmcVWLmVZ,cplcUHpmcVWRmVZ,        & 
& cplcUHpmcVWLmVZR,cplcUHpmcVWRmVZR,cplAhAhUHpmcUHpm,cplhhhhUHpmcUHpm,cplUHpmHpmcUHpmcHpm,& 
& cplUHpmcUHpmVPVP,cplUHpmcUHpmcVWLmVWLm,cplUHpmcUHpmcVWRmVWRm,cplUHpmcUHpmVZVZ,         & 
& cplUHpmcUHpmVZRVZR,cplcUFdFdAhL,cplcUFdFdAhR,cplcUFdFdhhL,cplcUFdFdhhR,cplcUFdFdVGL,   & 
& cplcUFdFdVGR,cplcUFdFdVPL,cplcUFdFdVPR,cplcUFdFdVZL,cplcUFdFdVZR,cplcUFdFdVZRL,        & 
& cplcUFdFdVZRR,cplcUFdFucHpmL,cplcUFdFucHpmR,cplcUFdFuVWLmL,cplcUFdFuVWLmR,             & 
& cplcUFdFuVWRmL,cplcUFdFuVWRmR,cplcUFuFuAhL,cplcUFuFuAhR,cplcUFuFdcVWLmL,               & 
& cplcUFuFdcVWLmR,cplcUFuFdcVWRmL,cplcUFuFdcVWRmR,cplcUFuFdHpmL,cplcUFuFdHpmR,           & 
& cplcUFuFuhhL,cplcUFuFuhhR,cplcUFuFuVGL,cplcUFuFuVGR,cplcUFuFuVPL,cplcUFuFuVPR,         & 
& cplcUFuFuVZL,cplcUFuFuVZR,cplcUFuFuVZRL,cplcUFuFuVZRR,cplcUFeFeAhL,cplcUFeFeAhR,       & 
& cplcUFeFehhL,cplcUFeFehhR,cplcUFeFeVPL,cplcUFeFeVPR,cplcUFeFeVZL,cplcUFeFeVZR,         & 
& cplcUFeFeVZRL,cplcUFeFeVZRR,cplcUFeFvcHpmL,cplcUFeFvcHpmR,cplcUFeFvVWLmL,              & 
& cplcUFeFvVWLmR,cplcUFeFvVWRmL,cplcUFeFvVWRmR,cplUFvFvAhL,cplUFvFvAhR,cplUFvFecVWLmL,   & 
& cplUFvFecVWLmR,cplUFvFecVWRmL,cplUFvFecVWRmR,cplUFvFeHpmL,cplUFvFeHpmR,cplUFvFvhhL,    & 
& cplUFvFvhhR,cplUFvFvVPL,cplUFvFvVPR,cplUFvFvVZL,cplUFvFvVZR,cplUFvFvVZRL,              & 
& cplUFvFvVZRR,cplcFeUFvVWLmL,cplcFeUFvVWLmR,cplcFeUFvVWRmL,cplcFeUFvVWRmR,              & 
& cplcFeUFvcHpmL,cplcFeUFvcHpmR,cplcFdFdVGL,cplcFdFdVGR,cplcFuFuVGL,cplcFuFuVGR,         & 
& cplcgGgGVG,cplVGVGVG,cplVGVGVGVG1,cplVGVGVGVG2,cplVGVGVGVG3,cplAhhhVZ,cplcFdFdVZL,     & 
& cplcFdFdVZR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuVZL,cplcFuFuVZR,cplFvFvVZL,cplFvFvVZR,     & 
& cplcgWLmgWLmVZ,cplcgWRmgWLmVZ,cplcgWLpgWLpVZ,cplcgWRpgWLpVZ,cplcgWRmgWRmVZ,            & 
& cplcgWRpgWRpVZ,cplhhVPVZ,cplhhVZVZ,cplhhVZVZR,cplHpmcHpmVZ,cplHpmVWLmVZ,               & 
& cplHpmVWRmVZ,cplcVWLmVWLmVZ,cplcVWRmVWLmVZ,cplcVWRmVWRmVZ,cplAhAhVZVZ,cplhhhhVZVZ,     & 
& cplHpmcHpmVZVZ,cplcVWLmVWLmVZVZ1,cplcVWLmVWLmVZVZ2,cplcVWLmVWLmVZVZ3,cplcVWRmVWRmVZVZ1,& 
& cplcVWRmVWRmVZVZ2,cplcVWRmVWRmVZVZ3,cplAhhhVZR,cplcFdFdVZRL,cplcFdFdVZRR,              & 
& cplcFeFeVZRL,cplcFeFeVZRR,cplcFuFuVZRL,cplcFuFuVZRR,cplFvFvVZRL,cplFvFvVZRR,           & 
& cplcgWLmgWLmVZR,cplcgWRmgWLmVZR,cplcgWLpgWLpVZR,cplcgWRpgWLpVZR,cplcgWRmgWRmVZR,       & 
& cplcgWRpgWRpVZR,cplhhVPVZR,cplhhVZRVZR,cplHpmcHpmVZR,cplHpmVWLmVZR,cplHpmVWRmVZR,      & 
& cplcVWLmVWLmVZR,cplcVWRmVWLmVZR,cplcVWRmVWRmVZR,cplAhAhVZRVZR,cplhhhhVZRVZR,           & 
& cplHpmcHpmVZRVZR,cplcVWLmVWLmVZRVZR1,cplcVWLmVWLmVZRVZR2,cplcVWLmVWLmVZRVZR3,          & 
& cplcVWRmVWRmVZRVZR1,cplcVWRmVWRmVZRVZR2,cplcVWRmVWRmVZRVZR3,cplAhhhVP,cplcFdFdVPL,     & 
& cplcFdFdVPR,cplcFeFeVPL,cplcFeFeVPR,cplcFuFuVPL,cplcFuFuVPR,cplFvFvVPL,cplFvFvVPR,     & 
& cplcgWLmgWLmVP,cplcgWRmgWLmVP,cplcgWLpgWLpVP,cplcgWRpgWLpVP,cplcgWRmgWRmVP,            & 
& cplcgWRpgWRpVP,cplHpmcHpmVP,cplHpmVPVWLm,cplHpmVPVWRm,cplcVWLmVPVWLm,cplcVWRmVPVWLm,   & 
& cplcVWRmVPVWRm,cplAhAhVPVP,cplhhhhVPVP,cplHpmcHpmVPVP,cplcVWLmVPVPVWLm1,               & 
& cplcVWLmVPVPVWLm2,cplcVWLmVPVPVWLm3,cplcVWRmVPVPVWRm1,cplcVWRmVPVPVWRm2,               & 
& cplcVWRmVPVPVWRm3,cplAhcHpmcVWLm,cplAhcVWLmVWRm,cplcFuFdcVWLmL,cplcFuFdcVWLmR,         & 
& cplFvFecVWLmL,cplFvFecVWLmR,cplcgWLpgPcVWLm,cplcgWRpgPcVWLm,cplcgPgWLmcVWLm,           & 
& cplcgZgWLmcVWLm,cplcgZpgWLmcVWLm,cplcgPgWRmcVWLm,cplcgZgWRmcVWLm,cplcgZpgWRmcVWLm,     & 
& cplcgWLpgZcVWLm,cplcgWRpgZcVWLm,cplcgWLpgZpcVWLm,cplcgWRpgZpcVWLm,cplhhcHpmcVWLm,      & 
& cplhhcVWLmVWLm,cplhhcVWLmVWRm,cplcHpmcVWLmVP,cplcVWLmVPVWRm,cplcVWLmVWRmVZ,            & 
& cplcVWLmVWRmVZR,cplcHpmcVWLmVZ,cplcHpmcVWLmVZR,cplAhAhcVWLmVWLm,cplhhhhcVWLmVWLm,      & 
& cplHpmcHpmcVWLmVWLm,cplcVWLmcVWLmVWLmVWLm1,cplcVWLmcVWLmVWLmVWLm2,cplcVWLmcVWLmVWLmVWLm3,& 
& cplcVWLmcVWRmVWLmVWRm1,cplcVWLmcVWRmVWLmVWRm2,cplcVWLmcVWRmVWLmVWRm3,cplAhcHpmcVWRm,   & 
& cplAhcVWRmVWLm,cplcFuFdcVWRmL,cplcFuFdcVWRmR,cplFvFecVWRmL,cplFvFecVWRmR,              & 
& cplcgWLpgPcVWRm,cplcgWRpgPcVWRm,cplcgPgWLmcVWRm,cplcgZgWLmcVWRm,cplcgZpgWLmcVWRm,      & 
& cplcgPgWRmcVWRm,cplcgZgWRmcVWRm,cplcgZpgWRmcVWRm,cplcgWLpgZcVWRm,cplcgWRpgZcVWRm,      & 
& cplcgWLpgZpcVWRm,cplcgWRpgZpcVWRm,cplhhcHpmcVWRm,cplhhcVWRmVWLm,cplhhcVWRmVWRm,        & 
& cplcHpmcVWRmVP,cplcHpmcVWRmVZ,cplcHpmcVWRmVZR,cplAhAhcVWRmVWRm,cplhhhhcVWRmVWRm,       & 
& cplHpmcHpmcVWRmVWRm,cplcVWRmcVWRmVWRmVWRm1,cplcVWRmcVWRmVWRmVWRm2,cplcVWRmcVWRmVWRmVWRm3,& 
& cplcgWLmgWRmVZR,cplcgWLpgWRpVZR,cplcgWLmgWRmVZ,cplcgWLpgWRpVZ,cplAhAhVZVZR,            & 
& cplhhhhVZVZR,cplHpmcHpmVZVZR,cplcVWLmVWLmVZVZR1,cplcVWLmVWLmVZVZR2,cplcVWLmVWLmVZVZR3, & 
& cplcVWRmVWRmVZVZR1,cplcVWRmVWRmVZVZR2,cplcVWRmVWRmVZVZR3,cplcgWLmgWRmVP,               & 
& cplcgWLpgWRpVP,cplAhAhVPVZ,cplhhhhVPVZ,cplHpmcHpmVPVZ,cplcVWLmVPVWLmVZ1,               & 
& cplcVWLmVPVWLmVZ2,cplcVWLmVPVWLmVZ3,cplcVWRmVPVWRmVZ1,cplcVWRmVPVWRmVZ2,               & 
& cplcVWRmVPVWRmVZ3,cplAhAhVPVZR,cplhhhhVPVZR,cplHpmcHpmVPVZR,cplcVWLmVPVWLmVZR1,        & 
& cplcVWLmVPVWLmVZR2,cplcVWLmVPVWLmVZR3,cplcVWRmVPVWRmVZR1,cplcVWRmVPVWRmVZR2,           & 
& cplcVWRmVPVWRmVZR3,cplAhHpmVWLm,cplcFdFuVWLmL,cplcFdFuVWLmR,cplcFeFvVWLmL,             & 
& cplcFeFvVWLmR,cplcgWLmgPVWLm,cplcgWRmgPVWLm,cplcgPgWLpVWLm,cplcgZgWLpVWLm,             & 
& cplcgZpgWLpVWLm,cplcgPgWRpVWLm,cplcgZgWRpVWLm,cplcgZpgWRpVWLm,cplcgWLmgZVWLm,          & 
& cplcgWRmgZVWLm,cplcgWLmgZpVWLm,cplcgWRmgZpVWLm,cplhhHpmVWLm,cplAhAhcVWRmVWLm,          & 
& cplhhhhcVWRmVWLm,cplHpmcHpmcVWRmVWLm,cplcVWRmVPVPVWLm1,cplcVWRmVPVPVWLm2,              & 
& cplcVWRmVPVPVWLm3,cplcVWLmcVWRmVWLmVWLm1,cplcVWLmcVWRmVWLmVWLm2,cplcVWLmcVWRmVWLmVWLm3,& 
& cplcVWRmcVWRmVWLmVWRm1,cplcVWRmcVWRmVWLmVWRm2,cplcVWRmcVWRmVWLmVWRm3,cplcVWRmVWLmVZVZ1,& 
& cplcVWRmVWLmVZVZ2,cplcVWRmVWLmVZVZ3,cplcVWRmVWLmVZRVZR1,cplcVWRmVWLmVZRVZR2,           & 
& cplcVWRmVWLmVZRVZR3)

Call OneLoopTadpoleshh(0,k1,vR,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,               & 
& MFv2,Mhh,Mhh2,MHpm,MHpm2,MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,MVZR2,cplAhAhUhh,     & 
& cplcFdFdUhhL,cplcFdFdUhhR,cplcFeFeUhhL,cplcFeFeUhhR,cplcFuFuUhhL,cplcFuFuUhhR,         & 
& cplFvFvUhhL,cplFvFvUhhR,cplcgWLmgWLmUhh,cplcgWLpgWLpUhh,cplcgWRmgWRmUhh,               & 
& cplcgWRpgWRpUhh,cplcgZgZUhh,cplcgZpgZpUhh,cplUhhhhhh,cplUhhHpmcHpm,cplUhhcVWLmVWLm,    & 
& cplUhhcVWRmVWRm,cplUhhVZVZ,cplUhhVZRVZR,Tad1Loop(1:4))

MU12Tree  = MU12
MU22Tree  = MU22
If (CalculateTwoLoopHiggsMasses) Then 
    If(GaugelessLimit) Then 
  k1Fix = 0._dp 
  vRFix = 0._dp 
   gBL_saveEP =gBL
   gBL = 0._dp 
   g2_saveEP =g2
   g2 = 0._dp 
   g2_saveEP =g2
   g2 = 0._dp 
     Else 
  k1Fix = k1 
  vRFix = vR 
     End if 

SELECT CASE (TwoLoopMethod) 
CASE ( 1 , 2 ) 


 CASE ( 3 ) ! Diagrammatic method 
  ! Make sure that there are no exactly degenerated masses! 
   Y_saveEP =Y
   where (aint(Abs(Y)).eq.Y) Y=Y*(1 + 1*1.0E-12_dp)
   YQ1_saveEP =YQ1
   where (aint(Abs(YQ1)).eq.YQ1) YQ1=YQ1*(1 + 2*1.0E-12_dp)
   YQ2_saveEP =YQ2
   where (aint(Abs(YQ2)).eq.YQ2) YQ2=YQ2*(1 + 3*1.0E-12_dp)
   Yt_saveEP =Yt
   where (aint(Abs(Yt)).eq.Yt) Yt=Yt*(1 + 4*1.0E-12_dp)
   YL_saveEP =YL
   where (aint(Abs(YL)).eq.YL) YL=YL*(1 + 5*1.0E-12_dp)
   YR_saveEP =YR
   where (aint(Abs(YR)).eq.YR) YR=YR*(1 + 6*1.0E-12_dp)
   Mux_saveEP =Mux
   where (aint(Abs(Mux)).eq.Mux) Mux=Mux*(1 + 7*1.0E-12_dp)

If (NewGBC) Then 
Call CalculatePi2S(125._dp**2,k1,vR,gBL,g2,g3,LAM2,LAM1,ALP1,RHO1,RHO2,               & 
& ALP2,ALP3,LAM5,LAM6,LAM3,LAM4,Y,YQ1,YQ2,Yt,YL,YR,Mux,MU12,MU22,kont,ti_ep2L,           & 
& Pi2S_EffPot,PiP2S_EffPot)

Else 
Call CalculatePi2S(0._dp,k1,vR,gBL,g2,g3,LAM2,LAM1,ALP1,RHO1,RHO2,ALP2,               & 
& ALP3,LAM5,LAM6,LAM3,LAM4,Y,YQ1,YQ2,Yt,YL,YR,Mux,MU12,MU22,kont,ti_ep2L,Pi2S_EffPot,    & 
& PiP2S_EffPot)

End if 
   Y =Y_saveEP 
   YQ1 =YQ1_saveEP 
   YQ2 =YQ2_saveEP 
   Yt =Yt_saveEP 
   YL =YL_saveEP 
   YR =YR_saveEP 
   Mux =Mux_saveEP 


 CASE ( 8 , 9 ) ! Hard-coded routines 
  
 END SELECT
 
   If(GaugelessLimit) Then 
   gBL =gBL_saveEP 
   g2 =g2_saveEP 
   g2 =g2_saveEP 
   End if 

Else ! Two loop turned off 
Pi2S_EffPot = 0._dp 

Pi2A0 = 0._dp 

ti_ep2L = 0._dp 

End if 
Call SolveTadpoleEquations(gBL,g2,g3,LAM2,LAM1,ALP1,RHO1,RHO2,ALP2,ALP3,              & 
& LAM5,LAM6,LAM3,LAM4,Y,YQ1,YQ2,Yt,YL,YR,Mux,MU12,MU22,k1,vR,Tad1Loop)

MU121L = MU12
MU221L = MU22
Tad1Loop(1:4) = Tad1Loop(1:4) - ti_ep2L 
Call SolveTadpoleEquations(gBL,g2,g3,LAM2,LAM1,ALP1,RHO1,RHO2,ALP2,ALP3,              & 
& LAM5,LAM6,LAM3,LAM4,Y,YQ1,YQ2,Yt,YL,YR,Mux,MU12,MU22,k1,vR,Tad1Loop)

MU122L = MU12
MU222L = MU22
Call OneLoophh(MU122L,MU222L,LAM2,LAM1,ALP1,RHO1,RHO2,ALP2,ALP3,LAM5,LAM6,            & 
& LAM3,k1,vR,MAh,MAh2,MHpm,MHpm2,MVZ,MVZ2,MVZR,MVZR2,MFd,MFd2,MFe,MFe2,MFu,              & 
& MFu2,MFv,MFv2,Mhh,Mhh2,MVWLm,MVWLm2,MVWRm,MVWRm2,cplAhAhUhh,cplAhUhhcHpm,              & 
& cplAhUhhVP,cplAhUhhVZ,cplAhUhhVZR,cplcFdFdUhhL,cplcFdFdUhhR,cplcFeFeUhhL,              & 
& cplcFeFeUhhR,cplcFuFuUhhL,cplcFuFuUhhR,cplFvFvUhhL,cplFvFvUhhR,cplcgWLmgWLmUhh,        & 
& cplcgWRmgWLmUhh,cplcgWLmgWRmUhh,cplcgWLpgWLpUhh,cplcgWRpgWLpUhh,cplcgWLpgWRpUhh,       & 
& cplcgWRmgWRmUhh,cplcgWRpgWRpUhh,cplcgZgZUhh,cplcgZpgZUhh,cplcgZgZpUhh,cplcgZpgZpUhh,   & 
& cplUhhhhhh,cplUhhhhcHpm,cplUhhHpmcHpm,cplUhhHpmVWLm,cplUhhHpmVWRm,cplUhhVPVZ,          & 
& cplUhhVPVZR,cplUhhcVWLmVWLm,cplUhhcVWRmVWLm,cplUhhcVWRmVWRm,cplUhhVZVZ,cplUhhVZVZR,    & 
& cplUhhVZRVZR,cplAhAhUhhUhh,cplUhhUhhhhhh,cplUhhUhhHpmcHpm,cplUhhUhhVPVP,               & 
& cplUhhUhhcVWLmVWLm,cplUhhUhhcVWRmVWRm,cplUhhUhhVZVZ,cplUhhUhhVZRVZR,0.1_dp*delta_mass, & 
& Mhh_1L,Mhh2_1L,ZH_1L,kont)

If (TwoLoopMethod.gt.2) Then 
Call OneLoopAh(gBL,g2,MU122L,MU222L,LAM2,LAM1,ALP1,RHO1,RHO2,ALP2,ALP3,               & 
& LAM5,LAM6,LAM4,k1,vR,ZZ,Mhh,Mhh2,MAh,MAh2,MHpm,MHpm2,MFd,MFd2,MFe,MFe2,MFu,            & 
& MFu2,MFv,MFv2,MVZ,MVZ2,MVZR,MVZR2,MVWLm,MVWLm2,MVWRm,MVWRm2,cplUAhAhhh,cplUAhAhcHpm,   & 
& cplcFdFdUAhL,cplcFdFdUAhR,cplcFeFeUAhL,cplcFeFeUAhR,cplcFuFuUAhL,cplcFuFuUAhR,         & 
& cplFvFvUAhL,cplFvFvUAhR,cplcgWLmgWLmUAh,cplcgWRmgWLmUAh,cplcgWLmgWRmUAh,               & 
& cplcgWLpgWLpUAh,cplcgWRpgWLpUAh,cplcgWLpgWRpUAh,cplcgWRmgWRmUAh,cplcgWRpgWRpUAh,       & 
& cplUAhhhcHpm,cplUAhhhVP,cplUAhhhVZ,cplUAhhhVZR,cplUAhHpmcHpm,cplUAhHpmVWLm,            & 
& cplUAhHpmVWRm,cplUAhcVWRmVWLm,cplUAhUAhAhAh,cplUAhUAhhhhh,cplUAhUAhHpmcHpm,            & 
& cplUAhUAhVPVP,cplUAhUAhcVWLmVWLm,cplUAhUAhcVWRmVWRm,cplUAhUAhVZVZ,cplUAhUAhVZRVZR,     & 
& 0.1_dp*delta_mass,MAh_1L,MAh2_1L,UP_1L,kont)

Else 
Call OneLoopAh(gBL,g2,MU121L,MU221L,LAM2,LAM1,ALP1,RHO1,RHO2,ALP2,ALP3,               & 
& LAM5,LAM6,LAM4,k1,vR,ZZ,Mhh,Mhh2,MAh,MAh2,MHpm,MHpm2,MFd,MFd2,MFe,MFe2,MFu,            & 
& MFu2,MFv,MFv2,MVZ,MVZ2,MVZR,MVZR2,MVWLm,MVWLm2,MVWRm,MVWRm2,cplUAhAhhh,cplUAhAhcHpm,   & 
& cplcFdFdUAhL,cplcFdFdUAhR,cplcFeFeUAhL,cplcFeFeUAhR,cplcFuFuUAhL,cplcFuFuUAhR,         & 
& cplFvFvUAhL,cplFvFvUAhR,cplcgWLmgWLmUAh,cplcgWRmgWLmUAh,cplcgWLmgWRmUAh,               & 
& cplcgWLpgWLpUAh,cplcgWRpgWLpUAh,cplcgWLpgWRpUAh,cplcgWRmgWRmUAh,cplcgWRpgWRpUAh,       & 
& cplUAhhhcHpm,cplUAhhhVP,cplUAhhhVZ,cplUAhhhVZR,cplUAhHpmcHpm,cplUAhHpmVWLm,            & 
& cplUAhHpmVWRm,cplUAhcVWRmVWLm,cplUAhUAhAhAh,cplUAhUAhhhhh,cplUAhUAhHpmcHpm,            & 
& cplUAhUAhVPVP,cplUAhUAhcVWLmVWLm,cplUAhUAhcVWRmVWRm,cplUAhUAhVZVZ,cplUAhUAhVZRVZR,     & 
& 0.1_dp*delta_mass,MAh_1L,MAh2_1L,UP_1L,kont)

End if 
Call OneLoopHpm(g2,MU121L,MU221L,LAM2,LAM1,ALP1,RHO1,RHO2,ALP2,ALP3,k1,               & 
& vR,PhiW,MAh,MAh2,Mhh,Mhh2,MVWLm,MVWLm2,MVWRm,MVWRm2,MHpm,MHpm2,MFd,MFd2,               & 
& MFu,MFu2,MFe,MFe2,MFv,MFv2,MVZ,MVZ2,MVZR,MVZR2,cplAhAhcUHpm,cplAhhhcUHpm,              & 
& cplAhcUHpmcVWLm,cplAhcUHpmcVWRm,cplAhHpmcUHpm,cplcFdFucUHpmL,cplcFdFucUHpmR,           & 
& cplcFeFvcUHpmL,cplcFeFvcUHpmR,cplcgZgWLpcUHpm,cplcgWLpgZUHpm,cplcgZpgWLpcUHpm,         & 
& cplcgWLpgZpUHpm,cplcgZgWRpcUHpm,cplcgWRpgZUHpm,cplcgZpgWRpcUHpm,cplcgWRpgZpUHpm,       & 
& cplcgWLmgZcUHpm,cplcgZgWLmUHpm,cplcgWRmgZcUHpm,cplcgZgWRmUHpm,cplcgWLmgZpcUHpm,        & 
& cplcgZpgWLmUHpm,cplcgWRmgZpcUHpm,cplcgZpgWRmUHpm,cplhhhhcUHpm,cplhhcUHpmcVWLm,         & 
& cplhhcUHpmcVWRm,cplhhHpmcUHpm,cplHpmcUHpmcHpm,cplHpmcUHpmVP,cplHpmcUHpmVZ,             & 
& cplHpmcUHpmVZR,cplcUHpmcVWLmVP,cplcUHpmcVWRmVP,cplcUHpmcVWLmVZ,cplcUHpmcVWRmVZ,        & 
& cplcUHpmcVWLmVZR,cplcUHpmcVWRmVZR,cplAhAhUHpmcUHpm,cplhhhhUHpmcUHpm,cplUHpmHpmcUHpmcHpm,& 
& cplUHpmcUHpmVPVP,cplUHpmcUHpmcVWLmVWLm,cplUHpmcUHpmcVWRmVWRm,cplUHpmcUHpmVZVZ,         & 
& cplUHpmcUHpmVZRVZR,0.1_dp*delta_mass,MHpm_1L,MHpm2_1L,UC_1L,kont)

Call OneLoopFv(Mux,Y,YR,k1,vR,MFv,MFv2,MAh,MAh2,MVWLm,MVWLm2,MFe,MFe2,MVWRm,          & 
& MVWRm2,MHpm,MHpm2,Mhh,Mhh2,MVZ,MVZ2,MVZR,MVZR2,cplUFvFvAhL,cplUFvFvAhR,cplUFvFecVWLmL, & 
& cplUFvFecVWLmR,cplUFvFecVWRmL,cplUFvFecVWRmR,cplUFvFeHpmL,cplUFvFeHpmR,cplUFvFvhhL,    & 
& cplUFvFvhhR,cplUFvFvVPL,cplUFvFvVPR,cplUFvFvVZL,cplUFvFvVZR,cplUFvFvVZRL,              & 
& cplUFvFvVZRR,cplcFeUFvVWLmL,cplcFeUFvVWLmR,cplcFeUFvVWRmL,cplcFeUFvVWRmR,              & 
& cplcFeUFvcHpmL,cplcFeUFvcHpmR,0.1_dp*delta_mass,MFv_1L,MFv2_1L,ZM_1L,kont)

Call OneLoopVZR(gBL,g2,k1,vR,ZZ,Mhh,Mhh2,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,              & 
& MFu2,MFv,MFv2,MVZ,MVZ2,MVZR,MVZR2,MHpm,MHpm2,MVWLm,MVWLm2,MVWRm,MVWRm2,cplAhhhVZR,     & 
& cplcFdFdVZRL,cplcFdFdVZRR,cplcFeFeVZRL,cplcFeFeVZRR,cplcFuFuVZRL,cplcFuFuVZRR,         & 
& cplFvFvVZRL,cplFvFvVZRR,cplcgWLmgWLmVZR,cplcgWRmgWLmVZR,cplcgWLpgWLpVZR,               & 
& cplcgWRpgWLpVZR,cplcgWRmgWRmVZR,cplcgWRpgWRpVZR,cplhhVPVZR,cplhhVZVZR,cplhhVZRVZR,     & 
& cplHpmcHpmVZR,cplHpmVWLmVZR,cplHpmVWRmVZR,cplcVWLmVWLmVZR,cplcVWRmVWLmVZR,             & 
& cplcVWRmVWRmVZR,cplAhAhVZRVZR,cplhhhhVZRVZR,cplHpmcHpmVZRVZR,cplcVWLmVWLmVZRVZR1,      & 
& cplcVWLmVWLmVZRVZR2,cplcVWLmVWLmVZRVZR3,cplcVWRmVWRmVZRVZR1,cplcVWRmVWRmVZRVZR2,       & 
& cplcVWRmVWRmVZRVZR3,0.1_dp*delta_mass,MVZR_1L,MVZR2_1L,kont)

Call OneLoopVWRm(g2,k1,vR,PhiW,MHpm,MHpm2,MAh,MAh2,MVWLm,MVWLm2,MFu,MFu2,             & 
& MFd,MFd2,MFv,MFv2,MFe,MFe2,Mhh,Mhh2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,MVZR2,cplAhcHpmcVWRm,   & 
& cplAhcVWRmVWLm,cplcFuFdcVWRmL,cplcFuFdcVWRmR,cplFvFecVWRmL,cplFvFecVWRmR,              & 
& cplcgWLpgPcVWRm,cplcgWRpgPcVWRm,cplcgPgWLmcVWRm,cplcgZgWLmcVWRm,cplcgZpgWLmcVWRm,      & 
& cplcgPgWRmcVWRm,cplcgZgWRmcVWRm,cplcgZpgWRmcVWRm,cplcgWLpgZcVWRm,cplcgWRpgZcVWRm,      & 
& cplcgWLpgZpcVWRm,cplcgWRpgZpcVWRm,cplhhcHpmcVWRm,cplhhcVWRmVWLm,cplhhcVWRmVWRm,        & 
& cplcHpmcVWRmVP,cplcVWRmVPVWLm,cplcVWRmVPVWRm,cplcVWRmVWLmVZ,cplcVWRmVWLmVZR,           & 
& cplcVWRmVWRmVZ,cplcVWRmVWRmVZR,cplcHpmcVWRmVZ,cplcHpmcVWRmVZR,cplAhAhcVWRmVWRm,        & 
& cplhhhhcVWRmVWRm,cplHpmcHpmcVWRmVWRm,cplcVWRmVPVPVWRm3,cplcVWRmVPVPVWRm1,              & 
& cplcVWRmVPVPVWRm2,cplcVWLmcVWRmVWLmVWRm2,cplcVWLmcVWRmVWLmVWRm3,cplcVWLmcVWRmVWLmVWRm1,& 
& cplcVWRmcVWRmVWRmVWRm2,cplcVWRmcVWRmVWRmVWRm3,cplcVWRmcVWRmVWRmVWRm1,cplcVWRmVWRmVZVZ1,& 
& cplcVWRmVWRmVZVZ2,cplcVWRmVWRmVZVZ3,cplcVWRmVWRmVZRVZR1,cplcVWRmVWRmVZRVZR2,           & 
& cplcVWRmVWRmVZRVZR3,0.1_dp*delta_mass,MVWRm_1L,MVWRm2_1L,kont)

Mhh = Mhh_1L 
Mhh2 = Mhh2_1L 
ZH = ZH_1L 
MAh = MAh_1L 
MAh2 = MAh2_1L 
UP = UP_1L 
MHpm = MHpm_1L 
MHpm2 = MHpm2_1L 
UC = UC_1L 
MFv = MFv_1L 
MFv2 = MFv2_1L 
ZM = ZM_1L 
MVZR = MVZR_1L 
MVZR2 = MVZR2_1L 
MVWRm = MVWRm_1L 
MVWRm2 = MVWRm2_1L 
End If 
 
Call SortGoldstones(MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,            & 
& MHpm,MHpm2,MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,MVZR2,PhiW,TW,UC,ZDR,               & 
& ZER,UP,ZUR,ZDL,ZEL,ZUL,ZH,ZM,ZW,ZZ,kont)

! Set pole masses 
MVWLm = mW 
MVWLm2 = mW2 
MVZ = mZ 
MVZ2 = mZ2 
MFe(1:3) = mf_l 
MFe2(1:3) = mf_l**2 
MFu(1:3) = mf_u 
MFu2(1:3) = mf_u**2 
MFd(1:3) = mf_d 
MFd2(1:3) = mf_d**2 
! Shift Everything to t'Hooft Gauge
RXi=  1._dp 
RXiG = 1._dp 
RXiP = 1._dp 
RXiWLm = 1._dp 
RXiWRm = 1._dp 
RXiZ = 1._dp 
RXiZR = 1._dp 
MAh(1)=MVZ
MAh2(1)=MVZ2
MAh(2)=MVZR
MAh2(2)=MVZR2
MHpm(1)=MVWLm
MHpm2(1)=MVWLm2
MHpm(2)=MVWRm
MHpm2(2)=MVWRm2
mf_u2 = mf_u**2 
mf_d2 = mf_d**2 
mf_l2 = mf_l**2 
 

 If (WriteTreeLevelTadpoleSolutions) Then 
! Saving tree-level parameters for output
MU12  = MU12Tree 
MU22  = MU22Tree 
End if 


Iname = Iname -1 
End Subroutine OneLoopMasses 
 
Subroutine OneLoopTadpoleshh(0,k1,vR,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,             & 
& MFv,MFv2,Mhh,Mhh2,MHpm,MHpm2,MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,MVZR2,            & 
& cplAhAhUhh,cplcFdFdUhhL,cplcFdFdUhhR,cplcFeFeUhhL,cplcFeFeUhhR,cplcFuFuUhhL,           & 
& cplcFuFuUhhR,cplFvFvUhhL,cplFvFvUhhR,cplcgWLmgWLmUhh,cplcgWLpgWLpUhh,cplcgWRmgWRmUhh,  & 
& cplcgWRpgWRpUhh,cplcgZgZUhh,cplcgZpgZpUhh,cplUhhhhhh,cplUhhHpmcHpm,cplUhhcVWLmVWLm,    & 
& cplUhhcVWRmVWRm,cplUhhVZVZ,cplUhhVZRVZR,tadpoles)

Implicit None 
Real(dp), Intent(in) :: MAh(4),MAh2(4),MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),MFv(9),MFv2(9),           & 
& Mhh(4),Mhh2(4),MHpm(4),MHpm2(4),MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,MVZR2

Complex(dp), Intent(in) :: cplAhAhUhh(4,4,4),cplcFdFdUhhL(3,3,4),cplcFdFdUhhR(3,3,4),cplcFeFeUhhL(3,3,4),        & 
& cplcFeFeUhhR(3,3,4),cplcFuFuUhhL(3,3,4),cplcFuFuUhhR(3,3,4),cplFvFvUhhL(9,9,4),        & 
& cplFvFvUhhR(9,9,4),cplcgWLmgWLmUhh(4),cplcgWLpgWLpUhh(4),cplcgWRmgWRmUhh(4),           & 
& cplcgWRpgWRpUhh(4),cplcgZgZUhh(4),cplcgZpgZpUhh(4),cplUhhhhhh(4,4,4),cplUhhHpmcHpm(4,4,4),& 
& cplUhhcVWLmVWLm(4),cplUhhcVWRmVWRm(4),cplUhhVZVZ(4),cplUhhVZRVZR(4)

Real(dp), Intent(in) :: 0,k1,vR

Integer :: i1,i2, gO1, gO2 
Complex(dp) :: coupL, coupR, coup, temp, res, A0m, sumI(4)  
Real(dp) :: m1 
Complex(dp), Intent(out) :: tadpoles(4) 
Iname = Iname + 1 
NameOfUnit(Iname) = 'OneLoopTadpoleshh'
 
tadpoles = 0._dp 
 
!------------------------ 
! Ah 
!------------------------ 
Do i1 = 1, 4
 A0m = SA_A0(MAh2(i1)) 
  Do gO1 = 1, 4
   coup = cplAhAhUhh(i1,i1,gO1)
   sumI(gO1) = -coup*A0m 
  End Do 
 
tadpoles =  tadpoles + 1._dp/2._dp*sumI 
End Do 
 !------------------------ 
! bar[Fd] 
!------------------------ 
Do i1 = 1, 3
 A0m = 2._dp*MFd(i1)*SA_A0(MFd2(i1)) 
  Do gO1 = 1, 4
   coupL = cplcFdFdUhhL(i1,i1,gO1)
   coupR = cplcFdFdUhhR(i1,i1,gO1)
   sumI(gO1) = (coupL+coupR)*A0m 
  End Do 
 
tadpoles =  tadpoles + 3._dp*sumI 
End Do 
 !------------------------ 
! bar[Fe] 
!------------------------ 
Do i1 = 1, 3
 A0m = 2._dp*MFe(i1)*SA_A0(MFe2(i1)) 
  Do gO1 = 1, 4
   coupL = cplcFeFeUhhL(i1,i1,gO1)
   coupR = cplcFeFeUhhR(i1,i1,gO1)
   sumI(gO1) = (coupL+coupR)*A0m 
  End Do 
 
tadpoles =  tadpoles + 1._dp*sumI 
End Do 
 !------------------------ 
! bar[Fu] 
!------------------------ 
Do i1 = 1, 3
 A0m = 2._dp*MFu(i1)*SA_A0(MFu2(i1)) 
  Do gO1 = 1, 4
   coupL = cplcFuFuUhhL(i1,i1,gO1)
   coupR = cplcFuFuUhhR(i1,i1,gO1)
   sumI(gO1) = (coupL+coupR)*A0m 
  End Do 
 
tadpoles =  tadpoles + 3._dp*sumI 
End Do 
 !------------------------ 
! Fv 
!------------------------ 
Do i1 = 1, 9
 A0m = 2._dp*MFv(i1)*SA_A0(MFv2(i1)) 
  Do gO1 = 1, 4
   coupL = cplFvFvUhhL(i1,i1,gO1)
   coupR = cplFvFvUhhR(i1,i1,gO1)
   sumI(gO1) = (coupL+coupR)*A0m 
  End Do 
 
tadpoles =  tadpoles + 1._dp/2._dp*sumI 
End Do 
 !------------------------ 
! bar[gWLm] 
!------------------------ 
A0m = 1._dp*SA_A0(MVWLm2*RXi) 
  Do gO1 = 1, 4
    coup = cplcgWLmgWLmUhh(gO1)
    sumI(gO1) = coup*A0m 
  End Do 
 
tadpoles =  tadpoles + 1._dp*sumI 
!------------------------ 
! bar[gWLmC] 
!------------------------ 
A0m = 1._dp*SA_A0(MVWLm2*RXi) 
  Do gO1 = 1, 4
    coup = cplcgWLpgWLpUhh(gO1)
    sumI(gO1) = coup*A0m 
  End Do 
 
tadpoles =  tadpoles + 1._dp*sumI 
!------------------------ 
! bar[gWRm] 
!------------------------ 
A0m = 1._dp*SA_A0(MVWRm2*RXi) 
  Do gO1 = 1, 4
    coup = cplcgWRmgWRmUhh(gO1)
    sumI(gO1) = coup*A0m 
  End Do 
 
tadpoles =  tadpoles + 1._dp*sumI 
!------------------------ 
! bar[gWRmC] 
!------------------------ 
A0m = 1._dp*SA_A0(MVWRm2*RXi) 
  Do gO1 = 1, 4
    coup = cplcgWRpgWRpUhh(gO1)
    sumI(gO1) = coup*A0m 
  End Do 
 
tadpoles =  tadpoles + 1._dp*sumI 
!------------------------ 
! bar[gZ] 
!------------------------ 
A0m = 1._dp*SA_A0(MVZ2*RXi) 
  Do gO1 = 1, 4
    coup = cplcgZgZUhh(gO1)
    sumI(gO1) = coup*A0m 
  End Do 
 
tadpoles =  tadpoles + 1._dp*sumI 
!------------------------ 
! bar[gZR] 
!------------------------ 
A0m = 1._dp*SA_A0(MVZR2*RXi) 
  Do gO1 = 1, 4
    coup = cplcgZpgZpUhh(gO1)
    sumI(gO1) = coup*A0m 
  End Do 
 
tadpoles =  tadpoles + 1._dp*sumI 
!------------------------ 
! hh 
!------------------------ 
Do i1 = 1, 4
 A0m = SA_A0(Mhh2(i1)) 
  Do gO1 = 1, 4
   coup = cplUhhhhhh(gO1,i1,i1)
   sumI(gO1) = -coup*A0m 
  End Do 
 
tadpoles =  tadpoles + 1._dp/2._dp*sumI 
End Do 
 !------------------------ 
! conj[Hpm] 
!------------------------ 
Do i1 = 1, 4
 A0m = SA_A0(MHpm2(i1)) 
  Do gO1 = 1, 4
   coup = cplUhhHpmcHpm(gO1,i1,i1)
   sumI(gO1) = -coup*A0m 
  End Do 
 
tadpoles =  tadpoles + 1._dp*sumI 
End Do 
 !------------------------ 
! conj[VWLm] 
!------------------------ 
A0m = 3._dp*SA_A0(MVWLm2)+RXi*SA_A0(MVWLm2*RXi) - 2._dp*MVWLm2*rMS 
  Do gO1 = 1, 4
    coup = cplUhhcVWLmVWLm(gO1)
    sumI(gO1) = coup*A0m 
  End Do 
 
tadpoles =  tadpoles + 1._dp*sumI 
!------------------------ 
! conj[VWRm] 
!------------------------ 
A0m = 3._dp*SA_A0(MVWRm2)+RXi*SA_A0(MVWRm2*RXi) - 2._dp*MVWRm2*rMS 
  Do gO1 = 1, 4
    coup = cplUhhcVWRmVWRm(gO1)
    sumI(gO1) = coup*A0m 
  End Do 
 
tadpoles =  tadpoles + 1._dp*sumI 
!------------------------ 
! VZ 
!------------------------ 
A0m = 3._dp*SA_A0(MVZ2)+RXi*SA_A0(MVZ2*RXi) - 2._dp*MVZ2*rMS 
  Do gO1 = 1, 4
    coup = cplUhhVZVZ(gO1)
    sumI(gO1) = coup*A0m 
  End Do 
 
tadpoles =  tadpoles + 1._dp/2._dp*sumI 
!------------------------ 
! VZR 
!------------------------ 
A0m = 3._dp*SA_A0(MVZR2)+RXi*SA_A0(MVZR2*RXi) - 2._dp*MVZR2*rMS 
  Do gO1 = 1, 4
    coup = cplUhhVZRVZR(gO1)
    sumI(gO1) = coup*A0m 
  End Do 
 
tadpoles =  tadpoles + 1._dp/2._dp*sumI 



tadpoles = oo16pi2*tadpoles 
Iname = Iname - 1 
End Subroutine OneLoopTadpoleshh 
 
Subroutine OneLoophh(MU12,MU22,LAM2,LAM1,ALP1,RHO1,RHO2,ALP2,ALP3,LAM5,               & 
& LAM6,LAM3,k1,vR,MAh,MAh2,MHpm,MHpm2,MVZ,MVZ2,MVZR,MVZR2,MFd,MFd2,MFe,MFe2,             & 
& MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MVWLm,MVWLm2,MVWRm,MVWRm2,cplAhAhUhh,cplAhUhhcHpm,          & 
& cplAhUhhVP,cplAhUhhVZ,cplAhUhhVZR,cplcFdFdUhhL,cplcFdFdUhhR,cplcFeFeUhhL,              & 
& cplcFeFeUhhR,cplcFuFuUhhL,cplcFuFuUhhR,cplFvFvUhhL,cplFvFvUhhR,cplcgWLmgWLmUhh,        & 
& cplcgWRmgWLmUhh,cplcgWLmgWRmUhh,cplcgWLpgWLpUhh,cplcgWRpgWLpUhh,cplcgWLpgWRpUhh,       & 
& cplcgWRmgWRmUhh,cplcgWRpgWRpUhh,cplcgZgZUhh,cplcgZpgZUhh,cplcgZgZpUhh,cplcgZpgZpUhh,   & 
& cplUhhhhhh,cplUhhhhcHpm,cplUhhHpmcHpm,cplUhhHpmVWLm,cplUhhHpmVWRm,cplUhhVPVZ,          & 
& cplUhhVPVZR,cplUhhcVWLmVWLm,cplUhhcVWRmVWLm,cplUhhcVWRmVWRm,cplUhhVZVZ,cplUhhVZVZR,    & 
& cplUhhVZRVZR,cplAhAhUhhUhh,cplUhhUhhhhhh,cplUhhUhhHpmcHpm,cplUhhUhhVPVP,               & 
& cplUhhUhhcVWLmVWLm,cplUhhUhhcVWRmVWRm,cplUhhUhhVZVZ,cplUhhUhhVZRVZR,delta,             & 
& mass,mass2,RS,kont)

Implicit None 
Real(dp), Intent(in) :: MAh(4),MAh2(4),MHpm(4),MHpm2(4),MVZ,MVZ2,MVZR,MVZR2,MFd(3),MFd2(3),MFe(3),            & 
& MFe2(3),MFu(3),MFu2(3),MFv(9),MFv2(9),Mhh(4),Mhh2(4),MVWLm,MVWLm2,MVWRm,MVWRm2

Real(dp), Intent(in) :: MU12,MU22,LAM2,LAM1,ALP1,RHO1,RHO2,ALP2,ALP3,LAM5,LAM6,LAM3,k1,vR

Complex(dp), Intent(in) :: cplAhAhUhh(4,4,4),cplAhUhhcHpm(4,4,4),cplAhUhhVP(4,4),cplAhUhhVZ(4,4),cplAhUhhVZR(4,4),& 
& cplcFdFdUhhL(3,3,4),cplcFdFdUhhR(3,3,4),cplcFeFeUhhL(3,3,4),cplcFeFeUhhR(3,3,4),       & 
& cplcFuFuUhhL(3,3,4),cplcFuFuUhhR(3,3,4),cplFvFvUhhL(9,9,4),cplFvFvUhhR(9,9,4),         & 
& cplcgWLmgWLmUhh(4),cplcgWRmgWLmUhh(4),cplcgWLmgWRmUhh(4),cplcgWLpgWLpUhh(4),           & 
& cplcgWRpgWLpUhh(4),cplcgWLpgWRpUhh(4),cplcgWRmgWRmUhh(4),cplcgWRpgWRpUhh(4),           & 
& cplcgZgZUhh(4),cplcgZpgZUhh(4),cplcgZgZpUhh(4),cplcgZpgZpUhh(4),cplUhhhhhh(4,4,4),     & 
& cplUhhhhcHpm(4,4,4),cplUhhHpmcHpm(4,4,4),cplUhhHpmVWLm(4,4),cplUhhHpmVWRm(4,4),        & 
& cplUhhVPVZ(4),cplUhhVPVZR(4),cplUhhcVWLmVWLm(4),cplUhhcVWRmVWLm(4),cplUhhcVWRmVWRm(4), & 
& cplUhhVZVZ(4),cplUhhVZVZR(4),cplUhhVZRVZR(4),cplAhAhUhhUhh(4,4,4,4),cplUhhUhhhhhh(4,4,4,4),& 
& cplUhhUhhHpmcHpm(4,4,4,4),cplUhhUhhVPVP(4,4),cplUhhUhhcVWLmVWLm(4,4),cplUhhUhhcVWRmVWRm(4,4),& 
& cplUhhUhhVZVZ(4,4),cplUhhUhhVZRVZR(4,4)

Complex(dp) :: mat2a(4,4), mat2(4,4),  PiSf(4,4,4)
Integer , Intent(inout):: kont 
Integer :: i1,i2,i3,i4,j1,j2,j3,j4,il,i_count, ierr 
Real(dp), Intent(in) :: delta 
Real(dp) :: mi2(4), test_m2(4),p2, test(4) 
Real(dp), Intent(out) :: mass(4), mass2(4) 
Complex(dp), Intent(out) ::  RS(4,4) 
Iname = Iname + 1 
NameOfUnit(Iname) = 'OneLoophh'
 
mat2a(1,1) = 0._dp 
mat2a(1,1) = mat2a(1,1)-(k1**2*LAM1)
mat2a(1,1) = mat2a(1,1)-4*k1**2*LAM3
mat2a(1,1) = mat2a(1,1)-(k1**2*LAM5)
mat2a(1,1) = mat2a(1,1)-(k1**2*LAM6)
mat2a(1,1) = mat2a(1,1)+MU12
mat2a(1,1) = mat2a(1,1)-1._dp/2._dp*(ALP1*vR**2)
mat2a(1,1) = mat2a(1,1)-1._dp/2._dp*(ALP2*vR**2)
mat2a(1,2) = 0._dp 
mat2a(1,3) = 0._dp 
mat2a(1,4) = 0._dp 
mat2a(2,2) = 0._dp 
mat2a(2,2) = mat2a(2,2)-1._dp/2._dp*(ALP1*k1**2)
mat2a(2,2) = mat2a(2,2)-1._dp/2._dp*(ALP3*k1**2)
mat2a(2,2) = mat2a(2,2)+MU22
mat2a(2,2) = mat2a(2,2)-1._dp/2._dp*(RHO2*vR**2)
mat2a(2,3) = 0._dp 
mat2a(2,4) = 0._dp 
mat2a(3,3) = 0._dp 
mat2a(3,3) = mat2a(3,3)-3*k1**2*LAM1
mat2a(3,3) = mat2a(3,3)-3*k1**2*LAM2
mat2a(3,3) = mat2a(3,3)+MU12
mat2a(3,3) = mat2a(3,3)-1._dp/2._dp*(ALP1*vR**2)
mat2a(3,3) = mat2a(3,3)-1._dp/2._dp*(ALP3*vR**2)
mat2a(3,4) = 0._dp 
mat2a(3,4) = mat2a(3,4)-(ALP1*k1*vR)
mat2a(3,4) = mat2a(3,4)-(ALP3*k1*vR)
mat2a(4,4) = 0._dp 
mat2a(4,4) = mat2a(4,4)-1._dp/2._dp*(ALP1*k1**2)
mat2a(4,4) = mat2a(4,4)-1._dp/2._dp*(ALP3*k1**2)
mat2a(4,4) = mat2a(4,4)+MU22
mat2a(4,4) = mat2a(4,4)-3*RHO1*vR**2

 
 Do i1=2,4
  Do i2 = 1, i1-1 
  mat2a(i1,i2) = (mat2a(i2,i1)) 
  End do 
End do 

 
! Rotation matrix for p2=0 
PiSf(1,:,:) = ZeroC 
p2 = 0._dp 
Call Pi1Loophh(p2,MAh,MAh2,MHpm,MHpm2,MVZ,MVZ2,MVZR,MVZR2,MFd,MFd2,MFe,               & 
& MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MVWLm,MVWLm2,MVWRm,MVWRm2,cplAhAhUhh,cplAhUhhcHpm,     & 
& cplAhUhhVP,cplAhUhhVZ,cplAhUhhVZR,cplcFdFdUhhL,cplcFdFdUhhR,cplcFeFeUhhL,              & 
& cplcFeFeUhhR,cplcFuFuUhhL,cplcFuFuUhhR,cplFvFvUhhL,cplFvFvUhhR,cplcgWLmgWLmUhh,        & 
& cplcgWRmgWLmUhh,cplcgWLmgWRmUhh,cplcgWLpgWLpUhh,cplcgWRpgWLpUhh,cplcgWLpgWRpUhh,       & 
& cplcgWRmgWRmUhh,cplcgWRpgWRpUhh,cplcgZgZUhh,cplcgZpgZUhh,cplcgZgZpUhh,cplcgZpgZpUhh,   & 
& cplUhhhhhh,cplUhhhhcHpm,cplUhhHpmcHpm,cplUhhHpmVWLm,cplUhhHpmVWRm,cplUhhVPVZ,          & 
& cplUhhVPVZR,cplUhhcVWLmVWLm,cplUhhcVWRmVWLm,cplUhhcVWRmVWRm,cplUhhVZVZ,cplUhhVZVZR,    & 
& cplUhhVZRVZR,cplAhAhUhhUhh,cplUhhUhhhhhh,cplUhhUhhHpmcHpm,cplUhhUhhVPVP,               & 
& cplUhhUhhcVWLmVWLm,cplUhhUhhcVWRmVWRm,cplUhhUhhVZVZ,cplUhhUhhVZRVZR,kont,              & 
& PiSf(1,:,:))

PiSf(1,:,:) = PiSf(1,:,:) - Pi2S_EffPot 
mat2 = mat2a - Real(PiSf(1,:,:),dp) 
Call Chop(mat2) 
Call Eigensystem(mat2,mi2,RS,kont,test) 
ZHOS_0 = RS 
 
 
! Now with momenta 
Do i1=1,4
PiSf(i1,:,:) = ZeroC 
p2 = Mhh2(i1)
Call Pi1Loophh(p2,MAh,MAh2,MHpm,MHpm2,MVZ,MVZ2,MVZR,MVZR2,MFd,MFd2,MFe,               & 
& MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MVWLm,MVWLm2,MVWRm,MVWRm2,cplAhAhUhh,cplAhUhhcHpm,     & 
& cplAhUhhVP,cplAhUhhVZ,cplAhUhhVZR,cplcFdFdUhhL,cplcFdFdUhhR,cplcFeFeUhhL,              & 
& cplcFeFeUhhR,cplcFuFuUhhL,cplcFuFuUhhR,cplFvFvUhhL,cplFvFvUhhR,cplcgWLmgWLmUhh,        & 
& cplcgWRmgWLmUhh,cplcgWLmgWRmUhh,cplcgWLpgWLpUhh,cplcgWRpgWLpUhh,cplcgWLpgWRpUhh,       & 
& cplcgWRmgWRmUhh,cplcgWRpgWRpUhh,cplcgZgZUhh,cplcgZpgZUhh,cplcgZgZpUhh,cplcgZpgZpUhh,   & 
& cplUhhhhhh,cplUhhhhcHpm,cplUhhHpmcHpm,cplUhhHpmVWLm,cplUhhHpmVWRm,cplUhhVPVZ,          & 
& cplUhhVPVZR,cplUhhcVWLmVWLm,cplUhhcVWRmVWLm,cplUhhcVWRmVWRm,cplUhhVZVZ,cplUhhVZVZR,    & 
& cplUhhVZRVZR,cplAhAhUhhUhh,cplUhhUhhhhhh,cplUhhUhhHpmcHpm,cplUhhUhhVPVP,               & 
& cplUhhUhhcVWLmVWLm,cplUhhUhhcVWRmVWRm,cplUhhUhhVZVZ,cplUhhUhhVZRVZR,kont,              & 
& PiSf(i1,:,:))

End Do 
Do i1=4,1,-1 
PiSf(i1,:,:) = PiSf(i1,:,:) - Pi2S_EffPot 
mat2 = mat2a - Real(PiSf(i1,:,:),dp) 
Call Chop(mat2) 
Call Eigensystem(mat2,mi2,RS,kont,test) 
If ((kont.Eq.-8).Or.(kont.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
  kont = 0 
End If 
If ((kont.Ne.0).And.(ErrorLevel.Ge.0)) Then 
  Write(ErrCan,*) "Diagonalization did not work in routine "//NameOfUnit(Iname) 
  Write(*,*) "Diagonalization did not work in routine "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
End If 
mass2(i1) = mi2(i1) 
End do 
 
Do i1=1,4
  If (Abs(mass2(i1)).Le.MaxMassNumericalZero**2) mass2(i1) = 0._dp 
  If (mass2(i1).Ge.0._dp) Then 
    mass(i1) = Sqrt(mass2(i1)) 
  Else 
   If (ErrorLevel.Ge.0) Then 
     Write(*,*) 'Warning from routine '//NameOfUnit(Iname) 
     Write(*,*) 'in the calculation of the masses' 
     Write(*,*) 'occurred a negative mass squared!' 
   Call TerminateProgram 
   End If 
   kont = -301 
   mass(i1) = 0._dp 
  End If 
End Do 
 
i_count = 0 
Do  
i_count = i_count + 1 
test_m2 = mass2 
Do i1=1,4
PiSf(i1,:,:) = ZeroC 
p2 =  mass2(i1) 
Call Pi1Loophh(p2,MAh,MAh2,MHpm,MHpm2,MVZ,MVZ2,MVZR,MVZR2,MFd,MFd2,MFe,               & 
& MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MVWLm,MVWLm2,MVWRm,MVWRm2,cplAhAhUhh,cplAhUhhcHpm,     & 
& cplAhUhhVP,cplAhUhhVZ,cplAhUhhVZR,cplcFdFdUhhL,cplcFdFdUhhR,cplcFeFeUhhL,              & 
& cplcFeFeUhhR,cplcFuFuUhhL,cplcFuFuUhhR,cplFvFvUhhL,cplFvFvUhhR,cplcgWLmgWLmUhh,        & 
& cplcgWRmgWLmUhh,cplcgWLmgWRmUhh,cplcgWLpgWLpUhh,cplcgWRpgWLpUhh,cplcgWLpgWRpUhh,       & 
& cplcgWRmgWRmUhh,cplcgWRpgWRpUhh,cplcgZgZUhh,cplcgZpgZUhh,cplcgZgZpUhh,cplcgZpgZpUhh,   & 
& cplUhhhhhh,cplUhhhhcHpm,cplUhhHpmcHpm,cplUhhHpmVWLm,cplUhhHpmVWRm,cplUhhVPVZ,          & 
& cplUhhVPVZR,cplUhhcVWLmVWLm,cplUhhcVWRmVWLm,cplUhhcVWRmVWRm,cplUhhVZVZ,cplUhhVZVZR,    & 
& cplUhhVZRVZR,cplAhAhUhhUhh,cplUhhUhhhhhh,cplUhhUhhHpmcHpm,cplUhhUhhVPVP,               & 
& cplUhhUhhcVWLmVWLm,cplUhhUhhcVWRmVWRm,cplUhhUhhVZVZ,cplUhhUhhVZRVZR,kont,              & 
& PiSf(i1,:,:))

End Do 
Do i1=4,1,-1 
PiSf(i1,:,:) = PiSf(i1,:,:) - Pi2S_EffPot 
mat2 = mat2a - Real(PiSf(i1,:,:),dp) 
Call Chop(mat2) 
Call Eigensystem(mat2,mi2,RS,kont,test) 
ZHOS_p2(i1,:) = RS(i1,:) 
 If ((kont.Eq.-8).Or.(kont.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
  kont = 0 
End If 
If ((kont.Ne.0).And.(ErrorLevel.Ge.0)) Then 
  Write(ErrCan,*) "Diagonalization did not work in routine "//NameOfUnit(Iname) 
  Write(*,*) "Diagonalization did not work in routine "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
End If 
mass2(i1) = mi2(i1) 
End do 
Do i1=1,4
 If (Abs(mass2(i1)).Le.MaxMassNumericalZero**2) mass2(i1) = 0._dp 
 If (test_m2(i1).Ne.0._dp) Then 
    test_m2(i1) = Abs(test_m2(i1) - mass2(i1)) / test_m2(i1) 
 Else 
    test_m2(i1) = Abs(mass2(i1)) 
 End If 
 If (Abs(mass2(i1)).lt.1.0E-30_dp) test_m2(i1) = 0._dp 
 If (mass2(i1).Ge.0._dp) Then 
    mass(i1) = sqrt(mass2(i1)) 
  Else 
     Write(*,*) 'Warning from routine '//NameOfUnit(Iname) 
     Write(*,*) 'in the calculation of the masses occurred a negative mass squared!' 
     Write(*,*) 'generation: ',i1 
     Write(*,*) 'mass: ',mass2(i1) 
   SignOfMassChanged = .True. 
   mass(i1) = 0._dp 
  End If 
End Do 
 
If (Maxval(test_m2).LT.0.1_dp*delta) Exit 
If (i_count.Gt.30) Then 
  Write(*,*) "Problem in "//NameOfUnit(Iname), test_m2, mass2 
  kont = -510 
  Call AddError(510) 
 Exit 
End If 
End Do 
 
 
Iname = Iname -1 
End Subroutine OneLoophh
 
 
Subroutine Pi1Loophh(p2,MAh,MAh2,MHpm,MHpm2,MVZ,MVZ2,MVZR,MVZR2,MFd,MFd2,             & 
& MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MVWLm,MVWLm2,MVWRm,MVWRm2,cplAhAhUhh,              & 
& cplAhUhhcHpm,cplAhUhhVP,cplAhUhhVZ,cplAhUhhVZR,cplcFdFdUhhL,cplcFdFdUhhR,              & 
& cplcFeFeUhhL,cplcFeFeUhhR,cplcFuFuUhhL,cplcFuFuUhhR,cplFvFvUhhL,cplFvFvUhhR,           & 
& cplcgWLmgWLmUhh,cplcgWRmgWLmUhh,cplcgWLmgWRmUhh,cplcgWLpgWLpUhh,cplcgWRpgWLpUhh,       & 
& cplcgWLpgWRpUhh,cplcgWRmgWRmUhh,cplcgWRpgWRpUhh,cplcgZgZUhh,cplcgZpgZUhh,              & 
& cplcgZgZpUhh,cplcgZpgZpUhh,cplUhhhhhh,cplUhhhhcHpm,cplUhhHpmcHpm,cplUhhHpmVWLm,        & 
& cplUhhHpmVWRm,cplUhhVPVZ,cplUhhVPVZR,cplUhhcVWLmVWLm,cplUhhcVWRmVWLm,cplUhhcVWRmVWRm,  & 
& cplUhhVZVZ,cplUhhVZVZR,cplUhhVZRVZR,cplAhAhUhhUhh,cplUhhUhhhhhh,cplUhhUhhHpmcHpm,      & 
& cplUhhUhhVPVP,cplUhhUhhcVWLmVWLm,cplUhhUhhcVWRmVWRm,cplUhhUhhVZVZ,cplUhhUhhVZRVZR,kont,res)

Implicit None 
Real(dp), Intent(in) :: MAh(4),MAh2(4),MHpm(4),MHpm2(4),MVZ,MVZ2,MVZR,MVZR2,MFd(3),MFd2(3),MFe(3),            & 
& MFe2(3),MFu(3),MFu2(3),MFv(9),MFv2(9),Mhh(4),Mhh2(4),MVWLm,MVWLm2,MVWRm,MVWRm2

Complex(dp), Intent(in) :: cplAhAhUhh(4,4,4),cplAhUhhcHpm(4,4,4),cplAhUhhVP(4,4),cplAhUhhVZ(4,4),cplAhUhhVZR(4,4),& 
& cplcFdFdUhhL(3,3,4),cplcFdFdUhhR(3,3,4),cplcFeFeUhhL(3,3,4),cplcFeFeUhhR(3,3,4),       & 
& cplcFuFuUhhL(3,3,4),cplcFuFuUhhR(3,3,4),cplFvFvUhhL(9,9,4),cplFvFvUhhR(9,9,4),         & 
& cplcgWLmgWLmUhh(4),cplcgWRmgWLmUhh(4),cplcgWLmgWRmUhh(4),cplcgWLpgWLpUhh(4),           & 
& cplcgWRpgWLpUhh(4),cplcgWLpgWRpUhh(4),cplcgWRmgWRmUhh(4),cplcgWRpgWRpUhh(4),           & 
& cplcgZgZUhh(4),cplcgZpgZUhh(4),cplcgZgZpUhh(4),cplcgZpgZpUhh(4),cplUhhhhhh(4,4,4),     & 
& cplUhhhhcHpm(4,4,4),cplUhhHpmcHpm(4,4,4),cplUhhHpmVWLm(4,4),cplUhhHpmVWRm(4,4),        & 
& cplUhhVPVZ(4),cplUhhVPVZR(4),cplUhhcVWLmVWLm(4),cplUhhcVWRmVWLm(4),cplUhhcVWRmVWRm(4), & 
& cplUhhVZVZ(4),cplUhhVZVZR(4),cplUhhVZRVZR(4),cplAhAhUhhUhh(4,4,4,4),cplUhhUhhhhhh(4,4,4,4),& 
& cplUhhUhhHpmcHpm(4,4,4,4),cplUhhUhhVPVP(4,4),cplUhhUhhcVWLmVWLm(4,4),cplUhhUhhcVWRmVWRm(4,4),& 
& cplUhhUhhVZVZ(4,4),cplUhhUhhVZRVZR(4,4)

Integer, Intent(inout) :: kont 
Real(dp) :: B0m2, F0m2, G0m2,B1m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Complex(dp), Intent(inout) :: res(4,4) 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2,temp, sumI(4,4) 
Integer :: i1,i2,i3,i4,j1,j2,j3,j4, gO1, gO2, ierr 
 
 
res = 0._dp 
 
!------------------------ 
! Ah, Ah 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
       Do i2 = 1, 4
 B0m2 = Real(SA_B0(p2,MAh2(i1),MAh2(i2)),dp) 
Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplAhAhUhh(i1,i2,gO1)
coup2 = Conjg(cplAhAhUhh(i1,i2,gO2))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[Hpm], Ah 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
       Do i2 = 1, 4
 B0m2 = Real(SA_B0(p2,MHpm2(i1),MAh2(i2)),dp) 
Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplAhUhhcHpm(i2,gO1,i1)
coup2 = Conjg(cplAhUhhcHpm(i2,gO2,i1))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +2._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! VP, Ah 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 F0m2 = FloopRXi(p2,MAh2(i2),0._dp) 
Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplAhUhhVP(i2,gO1)
coup2 =  Conjg(cplAhUhhVP(i2,gO2))
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! VZ, Ah 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 F0m2 = FloopRXi(p2,MAh2(i2),MVZ2) 
Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplAhUhhVZ(i2,gO1)
coup2 =  Conjg(cplAhUhhVZ(i2,gO2))
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! VZR, Ah 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 F0m2 = FloopRXi(p2,MAh2(i2),MVZR2) 
Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplAhUhhVZR(i2,gO1)
coup2 =  Conjg(cplAhUhhVZR(i2,gO2))
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! bar[Fd], Fd 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 G0m2 = Real(SA_Gloop(p2,MFd2(i1),MFd2(i2)),dp) 
B0m2 = -2._dp*MFd(i1)*MFd(i2)*Real(SA_B0(p2,MFd2(i1),MFd2(i2)),dp) 
Do gO1 = 1, 4
  Do gO2 = gO1, 4
coupL1 = cplcFdFdUhhL(i1,i2,gO1)
coupR1 = cplcFdFdUhhR(i1,i2,gO1)
coupL2 =  Conjg(cplcFdFdUhhL(i1,i2,gO2))
coupR2 =  Conjg(cplcFdFdUhhR(i1,i2,gO2))
    SumI(gO1,gO2) = (coupL1*coupL2+coupR1*coupR2)*G0m2 & 
                & + (coupL1*coupR2+coupR1*coupL2)*B0m2 
   End Do 
End Do 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fe], Fe 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 G0m2 = Real(SA_Gloop(p2,MFe2(i1),MFe2(i2)),dp) 
B0m2 = -2._dp*MFe(i1)*MFe(i2)*Real(SA_B0(p2,MFe2(i1),MFe2(i2)),dp) 
Do gO1 = 1, 4
  Do gO2 = gO1, 4
coupL1 = cplcFeFeUhhL(i1,i2,gO1)
coupR1 = cplcFeFeUhhR(i1,i2,gO1)
coupL2 =  Conjg(cplcFeFeUhhL(i1,i2,gO2))
coupR2 =  Conjg(cplcFeFeUhhR(i1,i2,gO2))
    SumI(gO1,gO2) = (coupL1*coupL2+coupR1*coupR2)*G0m2 & 
                & + (coupL1*coupR2+coupR1*coupL2)*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fu], Fu 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 G0m2 = Real(SA_Gloop(p2,MFu2(i1),MFu2(i2)),dp) 
B0m2 = -2._dp*MFu(i1)*MFu(i2)*Real(SA_B0(p2,MFu2(i1),MFu2(i2)),dp) 
Do gO1 = 1, 4
  Do gO2 = gO1, 4
coupL1 = cplcFuFuUhhL(i1,i2,gO1)
coupR1 = cplcFuFuUhhR(i1,i2,gO1)
coupL2 =  Conjg(cplcFuFuUhhL(i1,i2,gO2))
coupR2 =  Conjg(cplcFuFuUhhR(i1,i2,gO2))
    SumI(gO1,gO2) = (coupL1*coupL2+coupR1*coupR2)*G0m2 & 
                & + (coupL1*coupR2+coupR1*coupL2)*B0m2 
   End Do 
End Do 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! Fv, Fv 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 9
       Do i2 = 1, 9
 G0m2 = Real(SA_Gloop(p2,MFv2(i1),MFv2(i2)),dp) 
B0m2 = -2._dp*MFv(i1)*MFv(i2)*Real(SA_B0(p2,MFv2(i1),MFv2(i2)),dp) 
Do gO1 = 1, 4
  Do gO2 = gO1, 4
coupL1 = cplFvFvUhhL(i1,i2,gO1)
coupR1 = cplFvFvUhhR(i1,i2,gO1)
coupL2 =  Conjg(cplFvFvUhhL(i1,i2,gO2))
coupR2 =  Conjg(cplFvFvUhhR(i1,i2,gO2))
    SumI(gO1,gO2) = (coupL1*coupL2+coupR1*coupR2)*G0m2 & 
                & + (coupL1*coupR2+coupR1*coupL2)*B0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[gWLm], gWLm 
!------------------------ 
sumI = 0._dp 
 
F0m2 = -Real(SA_B0(p2,MVWLm2*RXi,MVWLm2*RXi),dp) 
 Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplcgWLmgWLmUhh(gO1)
coup2 =  cplcgWLmgWLmUhh(gO2) 
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWRm], gWLm 
!------------------------ 
sumI = 0._dp 
 
F0m2 = -Real(SA_B0(p2,MVWLm2*RXi,MVWRm2*RXi),dp) 
 Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplcgWRmgWLmUhh(gO1)
coup2 =  cplcgWLmgWRmUhh(gO2) 
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +2._dp* SumI  
!------------------------ 
! bar[gWLmC], gWLmC 
!------------------------ 
sumI = 0._dp 
 
F0m2 = -Real(SA_B0(p2,MVWLm2*RXi,MVWLm2*RXi),dp) 
 Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplcgWLpgWLpUhh(gO1)
coup2 =  cplcgWLpgWLpUhh(gO2) 
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWRmC], gWLmC 
!------------------------ 
sumI = 0._dp 
 
F0m2 = -Real(SA_B0(p2,MVWLm2*RXi,MVWRm2*RXi),dp) 
 Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplcgWRpgWLpUhh(gO1)
coup2 =  cplcgWLpgWRpUhh(gO2) 
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +2._dp* SumI  
!------------------------ 
! bar[gWRm], gWRm 
!------------------------ 
sumI = 0._dp 
 
F0m2 = -Real(SA_B0(p2,MVWRm2*RXi,MVWRm2*RXi),dp) 
 Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplcgWRmgWRmUhh(gO1)
coup2 =  cplcgWRmgWRmUhh(gO2) 
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWRmC], gWRmC 
!------------------------ 
sumI = 0._dp 
 
F0m2 = -Real(SA_B0(p2,MVWRm2*RXi,MVWRm2*RXi),dp) 
 Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplcgWRpgWRpUhh(gO1)
coup2 =  cplcgWRpgWRpUhh(gO2) 
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
!------------------------ 
! bar[gZ], gZ 
!------------------------ 
sumI = 0._dp 
 
F0m2 = -Real(SA_B0(p2,MVZ2*RXi,MVZ2*RXi),dp) 
 Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplcgZgZUhh(gO1)
coup2 =  cplcgZgZUhh(gO2) 
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
!------------------------ 
! bar[gZR], gZ 
!------------------------ 
sumI = 0._dp 
 
F0m2 = -Real(SA_B0(p2,MVZ2*RXi,MVZR2*RXi),dp) 
 Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplcgZpgZUhh(gO1)
coup2 =  cplcgZgZpUhh(gO2) 
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +2._dp* SumI  
!------------------------ 
! bar[gZR], gZR 
!------------------------ 
sumI = 0._dp 
 
F0m2 = -Real(SA_B0(p2,MVZR2*RXi,MVZR2*RXi),dp) 
 Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplcgZpgZpUhh(gO1)
coup2 =  cplcgZpgZpUhh(gO2) 
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
!------------------------ 
! hh, hh 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
       Do i2 = 1, 4
 B0m2 = Real(SA_B0(p2,Mhh2(i1),Mhh2(i2)),dp) 
Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplUhhhhhh(gO1,i1,i2)
coup2 = Conjg(cplUhhhhhh(gO2,i1,i2))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[Hpm], hh 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
       Do i2 = 1, 4
 B0m2 = Real(SA_B0(p2,MHpm2(i1),Mhh2(i2)),dp) 
Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplUhhhhcHpm(gO1,i2,i1)
coup2 = Conjg(cplUhhhhcHpm(gO2,i2,i1))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +2._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[Hpm], Hpm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
       Do i2 = 1, 4
 B0m2 = Real(SA_B0(p2,MHpm2(i1),MHpm2(i2)),dp) 
Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplUhhHpmcHpm(gO1,i2,i1)
coup2 = Conjg(cplUhhHpmcHpm(gO2,i2,i1))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! VWLm, Hpm 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 F0m2 = FloopRXi(p2,MHpm2(i2),MVWLm2) 
Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplUhhHpmVWLm(gO1,i2)
coup2 =  Conjg(cplUhhHpmVWLm(gO2,i2))
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +2._dp* SumI  
    End Do 
 !------------------------ 
! VWRm, Hpm 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 F0m2 = FloopRXi(p2,MHpm2(i2),MVWRm2) 
Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplUhhHpmVWRm(gO1,i2)
coup2 =  Conjg(cplUhhHpmVWRm(gO2,i2))
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +2._dp* SumI  
    End Do 
 !------------------------ 
! VZ, VP 
!------------------------ 
sumI = 0._dp 
 
F0m2 = Real(SVVloop(p2,0._dp,MVZ2),dp)   
 Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplUhhVPVZ(gO1)
coup2 =  Conjg(cplUhhVPVZ(gO2)) 
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
!------------------------ 
! VZR, VP 
!------------------------ 
sumI = 0._dp 
 
F0m2 = Real(SVVloop(p2,0._dp,MVZR2),dp)   
 Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplUhhVPVZR(gO1)
coup2 =  Conjg(cplUhhVPVZR(gO2)) 
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
!------------------------ 
! conj[VWLm], VWLm 
!------------------------ 
sumI = 0._dp 
 
F0m2 = Real(SVVloop(p2,MVWLm2,MVWLm2),dp)   
 Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplUhhcVWLmVWLm(gO1)
coup2 =  Conjg(cplUhhcVWLmVWLm(gO2)) 
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
!------------------------ 
! conj[VWRm], VWLm 
!------------------------ 
sumI = 0._dp 
 
F0m2 = Real(SVVloop(p2,MVWLm2,MVWRm2),dp)   
 Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplUhhcVWRmVWLm(gO1)
coup2 =  Conjg(cplUhhcVWRmVWLm(gO2)) 
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +2._dp* SumI  
!------------------------ 
! conj[VWRm], VWRm 
!------------------------ 
sumI = 0._dp 
 
F0m2 = Real(SVVloop(p2,MVWRm2,MVWRm2),dp)   
 Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplUhhcVWRmVWRm(gO1)
coup2 =  Conjg(cplUhhcVWRmVWRm(gO2)) 
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
!------------------------ 
! VZ, VZ 
!------------------------ 
sumI = 0._dp 
 
F0m2 = Real(SVVloop(p2,MVZ2,MVZ2),dp)   
 Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplUhhVZVZ(gO1)
coup2 =  Conjg(cplUhhVZVZ(gO2)) 
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
!------------------------ 
! VZR, VZ 
!------------------------ 
sumI = 0._dp 
 
F0m2 = Real(SVVloop(p2,MVZ2,MVZR2),dp)   
 Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplUhhVZVZR(gO1)
coup2 =  Conjg(cplUhhVZVZR(gO2)) 
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
!------------------------ 
! VZR, VZR 
!------------------------ 
sumI = 0._dp 
 
F0m2 = Real(SVVloop(p2,MVZR2,MVZR2),dp)   
 Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplUhhVZRVZR(gO1)
coup2 =  Conjg(cplUhhVZRVZR(gO2)) 
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
!------------------------ 
! Ah, Ah 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
 A0m2 = SA_A0(MAh2(i1)) 
Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplAhAhUhhUhh(i1,i1,gO1,gO2)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! hh, hh 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
 A0m2 = SA_A0(Mhh2(i1)) 
Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplUhhUhhhhhh(gO1,gO2,i1,i1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! conj[Hpm], Hpm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
 A0m2 = SA_A0(MHpm2(i1)) 
Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplUhhUhhHpmcHpm(gO1,gO2,i1,i1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! VP, VP 
!------------------------ 
sumI = 0._dp 
 
!------------------------ 
! conj[VWLm], VWLm 
!------------------------ 
sumI = 0._dp 
 
A0m2 = 0.75_dp*SA_A0(MVWLm2) + 0.25_dp*RXi*SA_A0(MVWLm2*RXi) - 0.5_dp*MVWLm2*rMS 
Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplUhhUhhcVWLmVWLm(gO1,gO2)
    SumI(gO1,gO2) = coup1*A0m2 
   End Do 
End Do 
res = res +4._dp* SumI  
!------------------------ 
! conj[VWRm], VWRm 
!------------------------ 
sumI = 0._dp 
 
A0m2 = 0.75_dp*SA_A0(MVWRm2) + 0.25_dp*RXi*SA_A0(MVWRm2*RXi) - 0.5_dp*MVWRm2*rMS 
Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplUhhUhhcVWRmVWRm(gO1,gO2)
    SumI(gO1,gO2) = coup1*A0m2 
   End Do 
End Do 
res = res +4._dp* SumI  
!------------------------ 
! VZ, VZ 
!------------------------ 
sumI = 0._dp 
 
A0m2 = 0.75_dp*SA_A0(MVZ2) + 0.25_dp*RXi*SA_A0(MVZ2*RXi) - 0.5_dp*MVZ2*rMS 
Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplUhhUhhVZVZ(gO1,gO2)
    SumI(gO1,gO2) = coup1*A0m2 
   End Do 
End Do 
res = res +2._dp* SumI  
!------------------------ 
! VZR, VZR 
!------------------------ 
sumI = 0._dp 
 
A0m2 = 0.75_dp*SA_A0(MVZR2) + 0.25_dp*RXi*SA_A0(MVZR2*RXi) - 0.5_dp*MVZR2*rMS 
Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplUhhUhhVZRVZR(gO1,gO2)
    SumI(gO1,gO2) = coup1*A0m2 
   End Do 
End Do 
res = res +2._dp* SumI  


Do gO2 = 1, 4
  Do gO1 = gO2+1, 4
     res(gO1,gO2) = (res(gO2,gO1))  
   End Do 
End Do 
 
res = oo16pi2*res 
 
End Subroutine Pi1Loophh 
 
Subroutine OneLoopAh(gBL,g2,MU12,MU22,LAM2,LAM1,ALP1,RHO1,RHO2,ALP2,ALP3,             & 
& LAM5,LAM6,LAM4,k1,vR,ZZ,Mhh,Mhh2,MAh,MAh2,MHpm,MHpm2,MFd,MFd2,MFe,MFe2,MFu,            & 
& MFu2,MFv,MFv2,MVZ,MVZ2,MVZR,MVZR2,MVWLm,MVWLm2,MVWRm,MVWRm2,cplUAhAhhh,cplUAhAhcHpm,   & 
& cplcFdFdUAhL,cplcFdFdUAhR,cplcFeFeUAhL,cplcFeFeUAhR,cplcFuFuUAhL,cplcFuFuUAhR,         & 
& cplFvFvUAhL,cplFvFvUAhR,cplcgWLmgWLmUAh,cplcgWRmgWLmUAh,cplcgWLmgWRmUAh,               & 
& cplcgWLpgWLpUAh,cplcgWRpgWLpUAh,cplcgWLpgWRpUAh,cplcgWRmgWRmUAh,cplcgWRpgWRpUAh,       & 
& cplUAhhhcHpm,cplUAhhhVP,cplUAhhhVZ,cplUAhhhVZR,cplUAhHpmcHpm,cplUAhHpmVWLm,            & 
& cplUAhHpmVWRm,cplUAhcVWRmVWLm,cplUAhUAhAhAh,cplUAhUAhhhhh,cplUAhUAhHpmcHpm,            & 
& cplUAhUAhVPVP,cplUAhUAhcVWLmVWLm,cplUAhUAhcVWRmVWRm,cplUAhUAhVZVZ,cplUAhUAhVZRVZR,     & 
& delta,mass,mass2,RS,kont)

Implicit None 
Real(dp), Intent(in) :: Mhh(4),Mhh2(4),MAh(4),MAh2(4),MHpm(4),MHpm2(4),MFd(3),MFd2(3),MFe(3),MFe2(3),         & 
& MFu(3),MFu2(3),MFv(9),MFv2(9),MVZ,MVZ2,MVZR,MVZR2,MVWLm,MVWLm2,MVWRm,MVWRm2

Real(dp), Intent(in) :: gBL,g2,MU12,MU22,LAM2,LAM1,ALP1,RHO1,RHO2,ALP2,ALP3,LAM5,LAM6,LAM4,k1,vR

Complex(dp), Intent(in) :: ZZ(3,3)

Complex(dp), Intent(in) :: cplUAhAhhh(4,4,4),cplUAhAhcHpm(4,4,4),cplcFdFdUAhL(3,3,4),cplcFdFdUAhR(3,3,4),        & 
& cplcFeFeUAhL(3,3,4),cplcFeFeUAhR(3,3,4),cplcFuFuUAhL(3,3,4),cplcFuFuUAhR(3,3,4),       & 
& cplFvFvUAhL(9,9,4),cplFvFvUAhR(9,9,4),cplcgWLmgWLmUAh(4),cplcgWRmgWLmUAh(4),           & 
& cplcgWLmgWRmUAh(4),cplcgWLpgWLpUAh(4),cplcgWRpgWLpUAh(4),cplcgWLpgWRpUAh(4),           & 
& cplcgWRmgWRmUAh(4),cplcgWRpgWRpUAh(4),cplUAhhhcHpm(4,4,4),cplUAhhhVP(4,4),             & 
& cplUAhhhVZ(4,4),cplUAhhhVZR(4,4),cplUAhHpmcHpm(4,4,4),cplUAhHpmVWLm(4,4),              & 
& cplUAhHpmVWRm(4,4),cplUAhcVWRmVWLm(4),cplUAhUAhAhAh(4,4,4,4),cplUAhUAhhhhh(4,4,4,4),   & 
& cplUAhUAhHpmcHpm(4,4,4,4),cplUAhUAhVPVP(4,4),cplUAhUAhcVWLmVWLm(4,4),cplUAhUAhcVWRmVWRm(4,4),& 
& cplUAhUAhVZVZ(4,4),cplUAhUAhVZRVZR(4,4)

Complex(dp) :: mat2a(4,4), mat2(4,4),  PiSf(4,4,4)
Integer , Intent(inout):: kont 
Integer :: i1,i2,i3,i4,j1,j2,j3,j4,il,i_count, ierr 
Real(dp), Intent(in) :: delta 
Real(dp) :: mi2(4), test_m2(4),p2, test(4) 
Real(dp), Intent(out) :: mass(4), mass2(4) 
Complex(dp), Intent(out) ::  RS(4,4) 
Iname = Iname + 1 
NameOfUnit(Iname) = 'OneLoopAh'
 
mat2a(1,1) = 0._dp 
mat2a(1,1) = mat2a(1,1)-(k1**2*LAM1)
mat2a(1,1) = mat2a(1,1)+4*k1**2*LAM4
mat2a(1,1) = mat2a(1,1)-(k1**2*LAM5)
mat2a(1,1) = mat2a(1,1)+k1**2*LAM6
mat2a(1,1) = mat2a(1,1)+MU12
mat2a(1,1) = mat2a(1,1)-1._dp/2._dp*(ALP1*vR**2)
mat2a(1,1) = mat2a(1,1)-1._dp/2._dp*(ALP2*vR**2)
mat2a(1,2) = 0._dp 
mat2a(1,3) = 0._dp 
mat2a(1,4) = 0._dp 
mat2a(2,2) = 0._dp 
mat2a(2,2) = mat2a(2,2)-1._dp/2._dp*(ALP1*k1**2)
mat2a(2,2) = mat2a(2,2)-1._dp/2._dp*(ALP3*k1**2)
mat2a(2,2) = mat2a(2,2)+MU22
mat2a(2,2) = mat2a(2,2)-1._dp/2._dp*(RHO2*vR**2)
mat2a(2,3) = 0._dp 
mat2a(2,4) = 0._dp 
mat2a(3,3) = 0._dp 
mat2a(3,3) = mat2a(3,3)-(k1**2*LAM1)
mat2a(3,3) = mat2a(3,3)-(k1**2*LAM2)
mat2a(3,3) = mat2a(3,3)+MU12
mat2a(3,3) = mat2a(3,3)-1._dp/2._dp*(ALP1*vR**2)
mat2a(3,3) = mat2a(3,3)-1._dp/2._dp*(ALP3*vR**2)
mat2a(3,3) = mat2a(3,3)+(g2**2*k1**2*Conjg(ZZ(1,1))*RXiZ*ZZ(1,1))/4._dp
mat2a(3,3) = mat2a(3,3)-1._dp/4._dp*(g2**2*k1**2*Conjg(ZZ(2,1))*RXiZ*ZZ(1,1))
mat2a(3,3) = mat2a(3,3)+(g2**2*k1**2*Conjg(ZZ(1,2))*RXiZR*ZZ(1,2))/4._dp
mat2a(3,3) = mat2a(3,3)-1._dp/4._dp*(g2**2*k1**2*Conjg(ZZ(2,2))*RXiZR*ZZ(1,2))
mat2a(3,3) = mat2a(3,3)-1._dp/4._dp*(g2**2*k1**2*Conjg(ZZ(1,1))*RXiZ*ZZ(2,1))
mat2a(3,3) = mat2a(3,3)+(g2**2*k1**2*Conjg(ZZ(2,1))*RXiZ*ZZ(2,1))/4._dp
mat2a(3,3) = mat2a(3,3)-1._dp/4._dp*(g2**2*k1**2*Conjg(ZZ(1,2))*RXiZR*ZZ(2,2))
mat2a(3,3) = mat2a(3,3)+(g2**2*k1**2*Conjg(ZZ(2,2))*RXiZR*ZZ(2,2))/4._dp
mat2a(3,4) = 0._dp 
mat2a(3,4) = mat2a(3,4)-1._dp/8._dp*(g2**2*k1*vR*Conjg(ZZ(2,1))*RXiZ*ZZ(1,1))
mat2a(3,4) = mat2a(3,4)+(g2*gBL*k1*vR*Conjg(ZZ(3,1))*RXiZ*ZZ(1,1))/8._dp
mat2a(3,4) = mat2a(3,4)-1._dp/8._dp*(g2**2*k1*vR*Conjg(ZZ(2,2))*RXiZR*ZZ(1,2))
mat2a(3,4) = mat2a(3,4)+(g2*gBL*k1*vR*Conjg(ZZ(3,2))*RXiZR*ZZ(1,2))/8._dp
mat2a(3,4) = mat2a(3,4)-1._dp/8._dp*(g2**2*k1*vR*Conjg(ZZ(1,1))*RXiZ*ZZ(2,1))
mat2a(3,4) = mat2a(3,4)+(g2**2*k1*vR*Conjg(ZZ(2,1))*RXiZ*ZZ(2,1))/4._dp
mat2a(3,4) = mat2a(3,4)-1._dp/8._dp*(g2*gBL*k1*vR*Conjg(ZZ(3,1))*RXiZ*ZZ(2,1))
mat2a(3,4) = mat2a(3,4)-1._dp/8._dp*(g2**2*k1*vR*Conjg(ZZ(1,2))*RXiZR*ZZ(2,2))
mat2a(3,4) = mat2a(3,4)+(g2**2*k1*vR*Conjg(ZZ(2,2))*RXiZR*ZZ(2,2))/4._dp
mat2a(3,4) = mat2a(3,4)-1._dp/8._dp*(g2*gBL*k1*vR*Conjg(ZZ(3,2))*RXiZR*ZZ(2,2))
mat2a(3,4) = mat2a(3,4)+(g2*gBL*k1*vR*Conjg(ZZ(1,1))*RXiZ*ZZ(3,1))/8._dp
mat2a(3,4) = mat2a(3,4)-1._dp/8._dp*(g2*gBL*k1*vR*Conjg(ZZ(2,1))*RXiZ*ZZ(3,1))
mat2a(3,4) = mat2a(3,4)+(g2*gBL*k1*vR*Conjg(ZZ(1,2))*RXiZR*ZZ(3,2))/8._dp
mat2a(3,4) = mat2a(3,4)-1._dp/8._dp*(g2*gBL*k1*vR*Conjg(ZZ(2,2))*RXiZR*ZZ(3,2))
mat2a(4,4) = 0._dp 
mat2a(4,4) = mat2a(4,4)-1._dp/2._dp*(ALP1*k1**2)
mat2a(4,4) = mat2a(4,4)-1._dp/2._dp*(ALP3*k1**2)
mat2a(4,4) = mat2a(4,4)+MU22
mat2a(4,4) = mat2a(4,4)-(RHO1*vR**2)
mat2a(4,4) = mat2a(4,4)+(g2**2*vR**2*Conjg(ZZ(2,1))*RXiZ*ZZ(2,1))/4._dp
mat2a(4,4) = mat2a(4,4)-1._dp/4._dp*(g2*gBL*vR**2*Conjg(ZZ(3,1))*RXiZ*ZZ(2,1))
mat2a(4,4) = mat2a(4,4)+(g2**2*vR**2*Conjg(ZZ(2,2))*RXiZR*ZZ(2,2))/4._dp
mat2a(4,4) = mat2a(4,4)-1._dp/4._dp*(g2*gBL*vR**2*Conjg(ZZ(3,2))*RXiZR*ZZ(2,2))
mat2a(4,4) = mat2a(4,4)-1._dp/4._dp*(g2*gBL*vR**2*Conjg(ZZ(2,1))*RXiZ*ZZ(3,1))
mat2a(4,4) = mat2a(4,4)+(gBL**2*vR**2*Conjg(ZZ(3,1))*RXiZ*ZZ(3,1))/4._dp
mat2a(4,4) = mat2a(4,4)-1._dp/4._dp*(g2*gBL*vR**2*Conjg(ZZ(2,2))*RXiZR*ZZ(3,2))
mat2a(4,4) = mat2a(4,4)+(gBL**2*vR**2*Conjg(ZZ(3,2))*RXiZR*ZZ(3,2))/4._dp

 
 Do i1=2,4
  Do i2 = 1, i1-1 
  mat2a(i1,i2) = (mat2a(i2,i1)) 
  End do 
End do 

 
! Rotation matrix for p2=0 
PiSf(1,:,:) = ZeroC 
p2 = 0._dp 
If (i1.eq.1) p2 = 0._dp 
If (i1.eq.2) p2 = 0._dp 
Call Pi1LoopAh(p2,Mhh,Mhh2,MAh,MAh2,MHpm,MHpm2,MFd,MFd2,MFe,MFe2,MFu,MFu2,            & 
& MFv,MFv2,MVZ,MVZ2,MVZR,MVZR2,MVWLm,MVWLm2,MVWRm,MVWRm2,cplUAhAhhh,cplUAhAhcHpm,        & 
& cplcFdFdUAhL,cplcFdFdUAhR,cplcFeFeUAhL,cplcFeFeUAhR,cplcFuFuUAhL,cplcFuFuUAhR,         & 
& cplFvFvUAhL,cplFvFvUAhR,cplcgWLmgWLmUAh,cplcgWRmgWLmUAh,cplcgWLmgWRmUAh,               & 
& cplcgWLpgWLpUAh,cplcgWRpgWLpUAh,cplcgWLpgWRpUAh,cplcgWRmgWRmUAh,cplcgWRpgWRpUAh,       & 
& cplUAhhhcHpm,cplUAhhhVP,cplUAhhhVZ,cplUAhhhVZR,cplUAhHpmcHpm,cplUAhHpmVWLm,            & 
& cplUAhHpmVWRm,cplUAhcVWRmVWLm,cplUAhUAhAhAh,cplUAhUAhhhhh,cplUAhUAhHpmcHpm,            & 
& cplUAhUAhVPVP,cplUAhUAhcVWLmVWLm,cplUAhUAhcVWRmVWRm,cplUAhUAhVZVZ,cplUAhUAhVZRVZR,     & 
& kont,PiSf(1,:,:))

PiSf(1,:,:) = PiSf(1,:,:) - PiP2S_EffPot 
mat2 = mat2a - Real(PiSf(1,:,:),dp) 
Call Chop(mat2) 
Call Eigensystem(mat2,mi2,RS,kont,test) 
UPOS_0 = RS 
 
 
! Now with momenta 
Do i1=1,4
PiSf(i1,:,:) = ZeroC 
p2 = MAh2(i1)
If (i1.eq.1) p2 = 0._dp 
If (i1.eq.2) p2 = 0._dp 
Call Pi1LoopAh(p2,Mhh,Mhh2,MAh,MAh2,MHpm,MHpm2,MFd,MFd2,MFe,MFe2,MFu,MFu2,            & 
& MFv,MFv2,MVZ,MVZ2,MVZR,MVZR2,MVWLm,MVWLm2,MVWRm,MVWRm2,cplUAhAhhh,cplUAhAhcHpm,        & 
& cplcFdFdUAhL,cplcFdFdUAhR,cplcFeFeUAhL,cplcFeFeUAhR,cplcFuFuUAhL,cplcFuFuUAhR,         & 
& cplFvFvUAhL,cplFvFvUAhR,cplcgWLmgWLmUAh,cplcgWRmgWLmUAh,cplcgWLmgWRmUAh,               & 
& cplcgWLpgWLpUAh,cplcgWRpgWLpUAh,cplcgWLpgWRpUAh,cplcgWRmgWRmUAh,cplcgWRpgWRpUAh,       & 
& cplUAhhhcHpm,cplUAhhhVP,cplUAhhhVZ,cplUAhhhVZR,cplUAhHpmcHpm,cplUAhHpmVWLm,            & 
& cplUAhHpmVWRm,cplUAhcVWRmVWLm,cplUAhUAhAhAh,cplUAhUAhhhhh,cplUAhUAhHpmcHpm,            & 
& cplUAhUAhVPVP,cplUAhUAhcVWLmVWLm,cplUAhUAhcVWRmVWRm,cplUAhUAhVZVZ,cplUAhUAhVZRVZR,     & 
& kont,PiSf(i1,:,:))

End Do 
Do i1=4,1,-1 
PiSf(i1,:,:) = PiSf(i1,:,:) - PiP2S_EffPot 
mat2 = mat2a - Real(PiSf(i1,:,:),dp) 
Call Chop(mat2) 
Call Eigensystem(mat2,mi2,RS,kont,test) 
If ((kont.Eq.-8).Or.(kont.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
  kont = 0 
End If 
If ((kont.Ne.0).And.(ErrorLevel.Ge.0)) Then 
  Write(ErrCan,*) "Diagonalization did not work in routine "//NameOfUnit(Iname) 
  Write(*,*) "Diagonalization did not work in routine "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
End If 
mass2(i1) = mi2(i1) 
End do 
 
Do i1=1,4
  If (Abs(mass2(i1)).Le.MaxMassNumericalZero**2) mass2(i1) = 0._dp 
  If (mass2(i1).Ge.0._dp) Then 
    mass(i1) = Sqrt(mass2(i1)) 
  Else 
   If (ErrorLevel.Ge.0) Then 
   If ((i1.Gt.1).or.(Abs(mass2(i1)).gt.MaxVal(Abs(mass2)))) Then 
     Write(*,*) 'Warning from routine '//NameOfUnit(Iname) 
     Write(*,*) 'in the calculation of the masses' 
     Write(*,*) 'occurred a negative mass squared!' 
   Call TerminateProgram 
   End If 
   End If 
   kont = -301 
   mass(i1) = 0._dp 
  End If 
End Do 
 
i_count = 0 
Do  
i_count = i_count + 1 
test_m2 = mass2 
Do i1=1,4
PiSf(i1,:,:) = ZeroC 
p2 =  mass2(i1) 
If (i1.eq.1) p2 = 0._dp 
If (i1.eq.2) p2 = 0._dp 
Call Pi1LoopAh(p2,Mhh,Mhh2,MAh,MAh2,MHpm,MHpm2,MFd,MFd2,MFe,MFe2,MFu,MFu2,            & 
& MFv,MFv2,MVZ,MVZ2,MVZR,MVZR2,MVWLm,MVWLm2,MVWRm,MVWRm2,cplUAhAhhh,cplUAhAhcHpm,        & 
& cplcFdFdUAhL,cplcFdFdUAhR,cplcFeFeUAhL,cplcFeFeUAhR,cplcFuFuUAhL,cplcFuFuUAhR,         & 
& cplFvFvUAhL,cplFvFvUAhR,cplcgWLmgWLmUAh,cplcgWRmgWLmUAh,cplcgWLmgWRmUAh,               & 
& cplcgWLpgWLpUAh,cplcgWRpgWLpUAh,cplcgWLpgWRpUAh,cplcgWRmgWRmUAh,cplcgWRpgWRpUAh,       & 
& cplUAhhhcHpm,cplUAhhhVP,cplUAhhhVZ,cplUAhhhVZR,cplUAhHpmcHpm,cplUAhHpmVWLm,            & 
& cplUAhHpmVWRm,cplUAhcVWRmVWLm,cplUAhUAhAhAh,cplUAhUAhhhhh,cplUAhUAhHpmcHpm,            & 
& cplUAhUAhVPVP,cplUAhUAhcVWLmVWLm,cplUAhUAhcVWRmVWRm,cplUAhUAhVZVZ,cplUAhUAhVZRVZR,     & 
& kont,PiSf(i1,:,:))

End Do 
Do i1=4,1,-1 
PiSf(i1,:,:) = PiSf(i1,:,:) - PiP2S_EffPot 
mat2 = mat2a - Real(PiSf(i1,:,:),dp) 
Call Chop(mat2) 
Call Eigensystem(mat2,mi2,RS,kont,test) 
UPOS_p2(i1,:) = RS(i1,:) 
 If ((kont.Eq.-8).Or.(kont.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
  kont = 0 
End If 
If ((kont.Ne.0).And.(ErrorLevel.Ge.0)) Then 
  Write(ErrCan,*) "Diagonalization did not work in routine "//NameOfUnit(Iname) 
  Write(*,*) "Diagonalization did not work in routine "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
End If 
mass2(i1) = mi2(i1) 
End do 
Do i1=1,4
 If (Abs(mass2(i1)).Le.MaxMassNumericalZero**2) mass2(i1) = 0._dp 
 If (test_m2(i1).Ne.0._dp) Then 
    test_m2(i1) = Abs(test_m2(i1) - mass2(i1)) / test_m2(i1) 
 Else 
    test_m2(i1) = Abs(mass2(i1)) 
 End If 
 If (Abs(mass2(i1)).lt.1.0E-30_dp) test_m2(i1) = 0._dp 
 If (mass2(i1).Ge.0._dp) Then 
    mass(i1) = sqrt(mass2(i1)) 
  Else 
     Write(*,*) 'Warning from routine '//NameOfUnit(Iname) 
     Write(*,*) 'in the calculation of the masses occurred a negative mass squared!' 
     Write(*,*) 'generation: ',i1 
     Write(*,*) 'mass: ',mass2(i1) 
   SignOfMassChanged = .True. 
   mass(i1) = 0._dp 
  End If 
End Do 
 
If (Maxval(test_m2).LT.0.1_dp*delta) Exit 
If (i_count.Gt.30) Then 
  Write(*,*) "Problem in "//NameOfUnit(Iname), test_m2, mass2 
  kont = -510 
  Call AddError(510) 
 Exit 
End If 
End Do 
 
 
Iname = Iname -1 
End Subroutine OneLoopAh
 
 
Subroutine Pi1LoopAh(p2,Mhh,Mhh2,MAh,MAh2,MHpm,MHpm2,MFd,MFd2,MFe,MFe2,               & 
& MFu,MFu2,MFv,MFv2,MVZ,MVZ2,MVZR,MVZR2,MVWLm,MVWLm2,MVWRm,MVWRm2,cplUAhAhhh,            & 
& cplUAhAhcHpm,cplcFdFdUAhL,cplcFdFdUAhR,cplcFeFeUAhL,cplcFeFeUAhR,cplcFuFuUAhL,         & 
& cplcFuFuUAhR,cplFvFvUAhL,cplFvFvUAhR,cplcgWLmgWLmUAh,cplcgWRmgWLmUAh,cplcgWLmgWRmUAh,  & 
& cplcgWLpgWLpUAh,cplcgWRpgWLpUAh,cplcgWLpgWRpUAh,cplcgWRmgWRmUAh,cplcgWRpgWRpUAh,       & 
& cplUAhhhcHpm,cplUAhhhVP,cplUAhhhVZ,cplUAhhhVZR,cplUAhHpmcHpm,cplUAhHpmVWLm,            & 
& cplUAhHpmVWRm,cplUAhcVWRmVWLm,cplUAhUAhAhAh,cplUAhUAhhhhh,cplUAhUAhHpmcHpm,            & 
& cplUAhUAhVPVP,cplUAhUAhcVWLmVWLm,cplUAhUAhcVWRmVWRm,cplUAhUAhVZVZ,cplUAhUAhVZRVZR,kont,res)

Implicit None 
Real(dp), Intent(in) :: Mhh(4),Mhh2(4),MAh(4),MAh2(4),MHpm(4),MHpm2(4),MFd(3),MFd2(3),MFe(3),MFe2(3),         & 
& MFu(3),MFu2(3),MFv(9),MFv2(9),MVZ,MVZ2,MVZR,MVZR2,MVWLm,MVWLm2,MVWRm,MVWRm2

Complex(dp), Intent(in) :: cplUAhAhhh(4,4,4),cplUAhAhcHpm(4,4,4),cplcFdFdUAhL(3,3,4),cplcFdFdUAhR(3,3,4),        & 
& cplcFeFeUAhL(3,3,4),cplcFeFeUAhR(3,3,4),cplcFuFuUAhL(3,3,4),cplcFuFuUAhR(3,3,4),       & 
& cplFvFvUAhL(9,9,4),cplFvFvUAhR(9,9,4),cplcgWLmgWLmUAh(4),cplcgWRmgWLmUAh(4),           & 
& cplcgWLmgWRmUAh(4),cplcgWLpgWLpUAh(4),cplcgWRpgWLpUAh(4),cplcgWLpgWRpUAh(4),           & 
& cplcgWRmgWRmUAh(4),cplcgWRpgWRpUAh(4),cplUAhhhcHpm(4,4,4),cplUAhhhVP(4,4),             & 
& cplUAhhhVZ(4,4),cplUAhhhVZR(4,4),cplUAhHpmcHpm(4,4,4),cplUAhHpmVWLm(4,4),              & 
& cplUAhHpmVWRm(4,4),cplUAhcVWRmVWLm(4),cplUAhUAhAhAh(4,4,4,4),cplUAhUAhhhhh(4,4,4,4),   & 
& cplUAhUAhHpmcHpm(4,4,4,4),cplUAhUAhVPVP(4,4),cplUAhUAhcVWLmVWLm(4,4),cplUAhUAhcVWRmVWRm(4,4),& 
& cplUAhUAhVZVZ(4,4),cplUAhUAhVZRVZR(4,4)

Integer, Intent(inout) :: kont 
Real(dp) :: B0m2, F0m2, G0m2,B1m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Complex(dp), Intent(inout) :: res(4,4) 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2,temp, sumI(4,4) 
Integer :: i1,i2,i3,i4,j1,j2,j3,j4, gO1, gO2, ierr 
 
 
res = 0._dp 
 
!------------------------ 
! hh, Ah 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
       Do i2 = 1, 4
 B0m2 = Real(SA_B0(p2,Mhh2(i1),MAh2(i2)),dp) 
Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplUAhAhhh(gO1,i2,i1)
coup2 = Conjg(cplUAhAhhh(gO2,i2,i1))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[Hpm], Ah 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
       Do i2 = 1, 4
 B0m2 = Real(SA_B0(p2,MHpm2(i1),MAh2(i2)),dp) 
Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplUAhAhcHpm(gO1,i2,i1)
coup2 = Conjg(cplUAhAhcHpm(gO2,i2,i1))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +2._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fd], Fd 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 G0m2 = Real(SA_Gloop(p2,MFd2(i1),MFd2(i2)),dp) 
B0m2 = -2._dp*MFd(i1)*MFd(i2)*Real(SA_B0(p2,MFd2(i1),MFd2(i2)),dp) 
Do gO1 = 1, 4
  Do gO2 = gO1, 4
coupL1 = cplcFdFdUAhL(i1,i2,gO1)
coupR1 = cplcFdFdUAhR(i1,i2,gO1)
coupL2 =  Conjg(cplcFdFdUAhL(i1,i2,gO2))
coupR2 =  Conjg(cplcFdFdUAhR(i1,i2,gO2))
    SumI(gO1,gO2) = (coupL1*coupL2+coupR1*coupR2)*G0m2 & 
                & + (coupL1*coupR2+coupR1*coupL2)*B0m2 
   End Do 
End Do 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fe], Fe 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 G0m2 = Real(SA_Gloop(p2,MFe2(i1),MFe2(i2)),dp) 
B0m2 = -2._dp*MFe(i1)*MFe(i2)*Real(SA_B0(p2,MFe2(i1),MFe2(i2)),dp) 
Do gO1 = 1, 4
  Do gO2 = gO1, 4
coupL1 = cplcFeFeUAhL(i1,i2,gO1)
coupR1 = cplcFeFeUAhR(i1,i2,gO1)
coupL2 =  Conjg(cplcFeFeUAhL(i1,i2,gO2))
coupR2 =  Conjg(cplcFeFeUAhR(i1,i2,gO2))
    SumI(gO1,gO2) = (coupL1*coupL2+coupR1*coupR2)*G0m2 & 
                & + (coupL1*coupR2+coupR1*coupL2)*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fu], Fu 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 G0m2 = Real(SA_Gloop(p2,MFu2(i1),MFu2(i2)),dp) 
B0m2 = -2._dp*MFu(i1)*MFu(i2)*Real(SA_B0(p2,MFu2(i1),MFu2(i2)),dp) 
Do gO1 = 1, 4
  Do gO2 = gO1, 4
coupL1 = cplcFuFuUAhL(i1,i2,gO1)
coupR1 = cplcFuFuUAhR(i1,i2,gO1)
coupL2 =  Conjg(cplcFuFuUAhL(i1,i2,gO2))
coupR2 =  Conjg(cplcFuFuUAhR(i1,i2,gO2))
    SumI(gO1,gO2) = (coupL1*coupL2+coupR1*coupR2)*G0m2 & 
                & + (coupL1*coupR2+coupR1*coupL2)*B0m2 
   End Do 
End Do 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! Fv, Fv 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 9
       Do i2 = 1, 9
 G0m2 = Real(SA_Gloop(p2,MFv2(i1),MFv2(i2)),dp) 
B0m2 = -2._dp*MFv(i1)*MFv(i2)*Real(SA_B0(p2,MFv2(i1),MFv2(i2)),dp) 
Do gO1 = 1, 4
  Do gO2 = gO1, 4
coupL1 = cplFvFvUAhL(i1,i2,gO1)
coupR1 = cplFvFvUAhR(i1,i2,gO1)
coupL2 =  Conjg(cplFvFvUAhL(i1,i2,gO2))
coupR2 =  Conjg(cplFvFvUAhR(i1,i2,gO2))
    SumI(gO1,gO2) = (coupL1*coupL2+coupR1*coupR2)*G0m2 & 
                & + (coupL1*coupR2+coupR1*coupL2)*B0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[gWLm], gWLm 
!------------------------ 
sumI = 0._dp 
 
F0m2 = -Real(SA_B0(p2,MVWLm2*RXi,MVWLm2*RXi),dp) 
 Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplcgWLmgWLmUAh(gO1)
coup2 =  cplcgWLmgWLmUAh(gO2) 
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWRm], gWLm 
!------------------------ 
sumI = 0._dp 
 
F0m2 = -Real(SA_B0(p2,MVWLm2*RXi,MVWRm2*RXi),dp) 
 Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplcgWRmgWLmUAh(gO1)
coup2 =  cplcgWLmgWRmUAh(gO2) 
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +2._dp* SumI  
!------------------------ 
! bar[gWLmC], gWLmC 
!------------------------ 
sumI = 0._dp 
 
F0m2 = -Real(SA_B0(p2,MVWLm2*RXi,MVWLm2*RXi),dp) 
 Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplcgWLpgWLpUAh(gO1)
coup2 =  cplcgWLpgWLpUAh(gO2) 
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWRmC], gWLmC 
!------------------------ 
sumI = 0._dp 
 
F0m2 = -Real(SA_B0(p2,MVWLm2*RXi,MVWRm2*RXi),dp) 
 Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplcgWRpgWLpUAh(gO1)
coup2 =  cplcgWLpgWRpUAh(gO2) 
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +2._dp* SumI  
!------------------------ 
! bar[gWRm], gWRm 
!------------------------ 
sumI = 0._dp 
 
F0m2 = -Real(SA_B0(p2,MVWRm2*RXi,MVWRm2*RXi),dp) 
 Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplcgWRmgWRmUAh(gO1)
coup2 =  cplcgWRmgWRmUAh(gO2) 
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWRmC], gWRmC 
!------------------------ 
sumI = 0._dp 
 
F0m2 = -Real(SA_B0(p2,MVWRm2*RXi,MVWRm2*RXi),dp) 
 Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplcgWRpgWRpUAh(gO1)
coup2 =  cplcgWRpgWRpUAh(gO2) 
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
!------------------------ 
! conj[Hpm], hh 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
       Do i2 = 1, 4
 B0m2 = Real(SA_B0(p2,MHpm2(i1),Mhh2(i2)),dp) 
Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplUAhhhcHpm(gO1,i2,i1)
coup2 = Conjg(cplUAhhhcHpm(gO2,i2,i1))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +2._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! VP, hh 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 F0m2 = FloopRXi(p2,Mhh2(i2),0._dp) 
Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplUAhhhVP(gO1,i2)
coup2 =  Conjg(cplUAhhhVP(gO2,i2))
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! VZ, hh 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 F0m2 = FloopRXi(p2,Mhh2(i2),MVZ2) 
Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplUAhhhVZ(gO1,i2)
coup2 =  Conjg(cplUAhhhVZ(gO2,i2))
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! VZR, hh 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 F0m2 = FloopRXi(p2,Mhh2(i2),MVZR2) 
Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplUAhhhVZR(gO1,i2)
coup2 =  Conjg(cplUAhhhVZR(gO2,i2))
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! conj[Hpm], Hpm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
       Do i2 = 1, 4
 B0m2 = Real(SA_B0(p2,MHpm2(i1),MHpm2(i2)),dp) 
Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplUAhHpmcHpm(gO1,i2,i1)
coup2 = Conjg(cplUAhHpmcHpm(gO2,i2,i1))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! VWLm, Hpm 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 F0m2 = FloopRXi(p2,MHpm2(i2),MVWLm2) 
Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplUAhHpmVWLm(gO1,i2)
coup2 =  Conjg(cplUAhHpmVWLm(gO2,i2))
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +2._dp* SumI  
    End Do 
 !------------------------ 
! VWRm, Hpm 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 F0m2 = FloopRXi(p2,MHpm2(i2),MVWRm2) 
Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplUAhHpmVWRm(gO1,i2)
coup2 =  Conjg(cplUAhHpmVWRm(gO2,i2))
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +2._dp* SumI  
    End Do 
 !------------------------ 
! conj[VWRm], VWLm 
!------------------------ 
sumI = 0._dp 
 
F0m2 = Real(SVVloop(p2,MVWLm2,MVWRm2),dp)   
 Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplUAhcVWRmVWLm(gO1)
coup2 =  Conjg(cplUAhcVWRmVWLm(gO2)) 
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +2._dp* SumI  
!------------------------ 
! Ah, Ah 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
 A0m2 = SA_A0(MAh2(i1)) 
Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplUAhUAhAhAh(gO1,gO2,i1,i1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! hh, hh 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
 A0m2 = SA_A0(Mhh2(i1)) 
Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplUAhUAhhhhh(gO1,gO2,i1,i1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! conj[Hpm], Hpm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
 A0m2 = SA_A0(MHpm2(i1)) 
Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplUAhUAhHpmcHpm(gO1,gO2,i1,i1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! VP, VP 
!------------------------ 
sumI = 0._dp 
 
!------------------------ 
! conj[VWLm], VWLm 
!------------------------ 
sumI = 0._dp 
 
A0m2 = 0.75_dp*SA_A0(MVWLm2) + 0.25_dp*RXi*SA_A0(MVWLm2*RXi) - 0.5_dp*MVWLm2*rMS 
Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplUAhUAhcVWLmVWLm(gO1,gO2)
    SumI(gO1,gO2) = coup1*A0m2 
   End Do 
End Do 
res = res +4._dp* SumI  
!------------------------ 
! conj[VWRm], VWRm 
!------------------------ 
sumI = 0._dp 
 
A0m2 = 0.75_dp*SA_A0(MVWRm2) + 0.25_dp*RXi*SA_A0(MVWRm2*RXi) - 0.5_dp*MVWRm2*rMS 
Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplUAhUAhcVWRmVWRm(gO1,gO2)
    SumI(gO1,gO2) = coup1*A0m2 
   End Do 
End Do 
res = res +4._dp* SumI  
!------------------------ 
! VZ, VZ 
!------------------------ 
sumI = 0._dp 
 
A0m2 = 0.75_dp*SA_A0(MVZ2) + 0.25_dp*RXi*SA_A0(MVZ2*RXi) - 0.5_dp*MVZ2*rMS 
Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplUAhUAhVZVZ(gO1,gO2)
    SumI(gO1,gO2) = coup1*A0m2 
   End Do 
End Do 
res = res +2._dp* SumI  
!------------------------ 
! VZR, VZR 
!------------------------ 
sumI = 0._dp 
 
A0m2 = 0.75_dp*SA_A0(MVZR2) + 0.25_dp*RXi*SA_A0(MVZR2*RXi) - 0.5_dp*MVZR2*rMS 
Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplUAhUAhVZRVZR(gO1,gO2)
    SumI(gO1,gO2) = coup1*A0m2 
   End Do 
End Do 
res = res +2._dp* SumI  


Do gO2 = 1, 4
  Do gO1 = gO2+1, 4
     res(gO1,gO2) = (res(gO2,gO1))  
   End Do 
End Do 
 
res = oo16pi2*res 
 
End Subroutine Pi1LoopAh 
 
Subroutine OneLoopHpm(g2,MU12,MU22,LAM2,LAM1,ALP1,RHO1,RHO2,ALP2,ALP3,k1,             & 
& vR,PhiW,MAh,MAh2,Mhh,Mhh2,MVWLm,MVWLm2,MVWRm,MVWRm2,MHpm,MHpm2,MFd,MFd2,               & 
& MFu,MFu2,MFe,MFe2,MFv,MFv2,MVZ,MVZ2,MVZR,MVZR2,cplAhAhcUHpm,cplAhhhcUHpm,              & 
& cplAhcUHpmcVWLm,cplAhcUHpmcVWRm,cplAhHpmcUHpm,cplcFdFucUHpmL,cplcFdFucUHpmR,           & 
& cplcFeFvcUHpmL,cplcFeFvcUHpmR,cplcgZgWLpcUHpm,cplcgWLpgZUHpm,cplcgZpgWLpcUHpm,         & 
& cplcgWLpgZpUHpm,cplcgZgWRpcUHpm,cplcgWRpgZUHpm,cplcgZpgWRpcUHpm,cplcgWRpgZpUHpm,       & 
& cplcgWLmgZcUHpm,cplcgZgWLmUHpm,cplcgWRmgZcUHpm,cplcgZgWRmUHpm,cplcgWLmgZpcUHpm,        & 
& cplcgZpgWLmUHpm,cplcgWRmgZpcUHpm,cplcgZpgWRmUHpm,cplhhhhcUHpm,cplhhcUHpmcVWLm,         & 
& cplhhcUHpmcVWRm,cplhhHpmcUHpm,cplHpmcUHpmcHpm,cplHpmcUHpmVP,cplHpmcUHpmVZ,             & 
& cplHpmcUHpmVZR,cplcUHpmcVWLmVP,cplcUHpmcVWRmVP,cplcUHpmcVWLmVZ,cplcUHpmcVWRmVZ,        & 
& cplcUHpmcVWLmVZR,cplcUHpmcVWRmVZR,cplAhAhUHpmcUHpm,cplhhhhUHpmcUHpm,cplUHpmHpmcUHpmcHpm,& 
& cplUHpmcUHpmVPVP,cplUHpmcUHpmcVWLmVWLm,cplUHpmcUHpmcVWRmVWRm,cplUHpmcUHpmVZVZ,         & 
& cplUHpmcUHpmVZRVZR,delta,mass,mass2,RS,kont)

Implicit None 
Real(dp), Intent(in) :: MAh(4),MAh2(4),Mhh(4),Mhh2(4),MVWLm,MVWLm2,MVWRm,MVWRm2,MHpm(4),MHpm2(4),             & 
& MFd(3),MFd2(3),MFu(3),MFu2(3),MFe(3),MFe2(3),MFv(9),MFv2(9),MVZ,MVZ2,MVZR,MVZR2

Real(dp), Intent(in) :: g2,MU12,MU22,LAM2,LAM1,ALP1,RHO1,RHO2,ALP2,ALP3,k1,vR,PhiW

Complex(dp), Intent(in) :: cplAhAhcUHpm(4,4,4),cplAhhhcUHpm(4,4,4),cplAhcUHpmcVWLm(4,4),cplAhcUHpmcVWRm(4,4),    & 
& cplAhHpmcUHpm(4,4,4),cplcFdFucUHpmL(3,3,4),cplcFdFucUHpmR(3,3,4),cplcFeFvcUHpmL(3,9,4),& 
& cplcFeFvcUHpmR(3,9,4),cplcgZgWLpcUHpm(4),cplcgWLpgZUHpm(4),cplcgZpgWLpcUHpm(4),        & 
& cplcgWLpgZpUHpm(4),cplcgZgWRpcUHpm(4),cplcgWRpgZUHpm(4),cplcgZpgWRpcUHpm(4),           & 
& cplcgWRpgZpUHpm(4),cplcgWLmgZcUHpm(4),cplcgZgWLmUHpm(4),cplcgWRmgZcUHpm(4),            & 
& cplcgZgWRmUHpm(4),cplcgWLmgZpcUHpm(4),cplcgZpgWLmUHpm(4),cplcgWRmgZpcUHpm(4),          & 
& cplcgZpgWRmUHpm(4),cplhhhhcUHpm(4,4,4),cplhhcUHpmcVWLm(4,4),cplhhcUHpmcVWRm(4,4),      & 
& cplhhHpmcUHpm(4,4,4),cplHpmcUHpmcHpm(4,4,4),cplHpmcUHpmVP(4,4),cplHpmcUHpmVZ(4,4),     & 
& cplHpmcUHpmVZR(4,4),cplcUHpmcVWLmVP(4),cplcUHpmcVWRmVP(4),cplcUHpmcVWLmVZ(4),          & 
& cplcUHpmcVWRmVZ(4),cplcUHpmcVWLmVZR(4),cplcUHpmcVWRmVZR(4),cplAhAhUHpmcUHpm(4,4,4,4),  & 
& cplhhhhUHpmcUHpm(4,4,4,4),cplUHpmHpmcUHpmcHpm(4,4,4,4),cplUHpmcUHpmVPVP(4,4),          & 
& cplUHpmcUHpmcVWLmVWLm(4,4),cplUHpmcUHpmcVWRmVWRm(4,4),cplUHpmcUHpmVZVZ(4,4),           & 
& cplUHpmcUHpmVZRVZR(4,4)

Complex(dp) :: mat2a(4,4), mat2(4,4),  PiSf(4,4,4)
Integer , Intent(inout):: kont 
Integer :: i1,i2,i3,i4,j1,j2,j3,j4,il,i_count, ierr 
Real(dp), Intent(in) :: delta 
Real(dp) :: mi2(4), test_m2(4),p2, test(4) 
Real(dp), Intent(out) :: mass(4), mass2(4) 
Complex(dp), Intent(out) ::  RS(4,4) 
Iname = Iname + 1 
NameOfUnit(Iname) = 'OneLoopHpm'
 
mat2a(1,1) = 0._dp 
mat2a(1,1) = mat2a(1,1)-(k1**2*LAM1)
mat2a(1,1) = mat2a(1,1)-(k1**2*LAM2)
mat2a(1,1) = mat2a(1,1)+MU12
mat2a(1,1) = mat2a(1,1)-1._dp/2._dp*(ALP1*vR**2)
mat2a(1,1) = mat2a(1,1)-1._dp/2._dp*(ALP3*vR**2)
mat2a(1,1) = mat2a(1,1)+(g2**2*k1**2*Cos(PhiW)**2*RXiWLm)/4._dp
mat2a(1,1) = mat2a(1,1)+(g2**2*k1**2*RXiWRm*Sin(PhiW)**2)/4._dp
mat2a(1,2) = 0._dp 
mat2a(1,3) = 0._dp 
mat2a(1,3) = mat2a(1,3)+(g2**2*k1**2*Cos(PhiW)*RXiWLm*Sin(PhiW))/4._dp
mat2a(1,3) = mat2a(1,3)-1._dp/4._dp*(g2**2*k1**2*Cos(PhiW)*RXiWRm*Sin(PhiW))
mat2a(1,4) = 0._dp 
mat2a(1,4) = mat2a(1,4)-1._dp/4._dp*(g2**2*k1*vR*Cos(PhiW)*RXiWLm*Sin(PhiW))
mat2a(1,4) = mat2a(1,4)+(g2**2*k1*vR*Cos(PhiW)*RXiWRm*Sin(PhiW))/4._dp
mat2a(2,2) = 0._dp 
mat2a(2,2) = mat2a(2,2)-1._dp/2._dp*(ALP1*k1**2)
mat2a(2,2) = mat2a(2,2)-1._dp/2._dp*(ALP2*k1**2)
mat2a(2,2) = mat2a(2,2)+MU22
mat2a(2,2) = mat2a(2,2)-1._dp/2._dp*(RHO2*vR**2)
mat2a(2,3) = 0._dp 
mat2a(2,4) = 0._dp 
mat2a(3,3) = 0._dp 
mat2a(3,3) = mat2a(3,3)-(k1**2*LAM1)
mat2a(3,3) = mat2a(3,3)-(k1**2*LAM2)
mat2a(3,3) = mat2a(3,3)+MU12
mat2a(3,3) = mat2a(3,3)-1._dp/2._dp*(ALP1*vR**2)
mat2a(3,3) = mat2a(3,3)-1._dp/2._dp*(ALP2*vR**2)
mat2a(3,3) = mat2a(3,3)+(g2**2*k1**2*Cos(PhiW)**2*RXiWRm)/4._dp
mat2a(3,3) = mat2a(3,3)+(g2**2*k1**2*RXiWLm*Sin(PhiW)**2)/4._dp
mat2a(3,4) = 0._dp 
mat2a(3,4) = mat2a(3,4)-1._dp/2._dp*(ALP2*k1*vR)
mat2a(3,4) = mat2a(3,4)+(ALP3*k1*vR)/2._dp
mat2a(3,4) = mat2a(3,4)-1._dp/4._dp*(g2**2*k1*vR*Cos(PhiW)**2*RXiWRm)
mat2a(3,4) = mat2a(3,4)-1._dp/4._dp*(g2**2*k1*vR*RXiWLm*Sin(PhiW)**2)
mat2a(4,4) = 0._dp 
mat2a(4,4) = mat2a(4,4)-1._dp/2._dp*(ALP1*k1**2)
mat2a(4,4) = mat2a(4,4)-1._dp/2._dp*(ALP2*k1**2)
mat2a(4,4) = mat2a(4,4)+MU22
mat2a(4,4) = mat2a(4,4)-(RHO1*vR**2)
mat2a(4,4) = mat2a(4,4)+(g2**2*vR**2*Cos(PhiW)**2*RXiWRm)/4._dp
mat2a(4,4) = mat2a(4,4)+(g2**2*vR**2*RXiWLm*Sin(PhiW)**2)/4._dp

 
 Do i1=2,4
  Do i2 = 1, i1-1 
  mat2a(i1,i2) = Conjg(mat2a(i2,i1)) 
  End do 
End do 

 
! Rotation matrix for p2=0 
PiSf(1,:,:) = ZeroC 
p2 = 0._dp 
If (i1.eq.1) p2 = 0._dp 
If (i1.eq.2) p2 = 0._dp 
Call Pi1LoopHpm(p2,MAh,MAh2,Mhh,Mhh2,MVWLm,MVWLm2,MVWRm,MVWRm2,MHpm,MHpm2,            & 
& MFd,MFd2,MFu,MFu2,MFe,MFe2,MFv,MFv2,MVZ,MVZ2,MVZR,MVZR2,cplAhAhcUHpm,cplAhhhcUHpm,     & 
& cplAhcUHpmcVWLm,cplAhcUHpmcVWRm,cplAhHpmcUHpm,cplcFdFucUHpmL,cplcFdFucUHpmR,           & 
& cplcFeFvcUHpmL,cplcFeFvcUHpmR,cplcgZgWLpcUHpm,cplcgWLpgZUHpm,cplcgZpgWLpcUHpm,         & 
& cplcgWLpgZpUHpm,cplcgZgWRpcUHpm,cplcgWRpgZUHpm,cplcgZpgWRpcUHpm,cplcgWRpgZpUHpm,       & 
& cplcgWLmgZcUHpm,cplcgZgWLmUHpm,cplcgWRmgZcUHpm,cplcgZgWRmUHpm,cplcgWLmgZpcUHpm,        & 
& cplcgZpgWLmUHpm,cplcgWRmgZpcUHpm,cplcgZpgWRmUHpm,cplhhhhcUHpm,cplhhcUHpmcVWLm,         & 
& cplhhcUHpmcVWRm,cplhhHpmcUHpm,cplHpmcUHpmcHpm,cplHpmcUHpmVP,cplHpmcUHpmVZ,             & 
& cplHpmcUHpmVZR,cplcUHpmcVWLmVP,cplcUHpmcVWRmVP,cplcUHpmcVWLmVZ,cplcUHpmcVWRmVZ,        & 
& cplcUHpmcVWLmVZR,cplcUHpmcVWRmVZR,cplAhAhUHpmcUHpm,cplhhhhUHpmcUHpm,cplUHpmHpmcUHpmcHpm,& 
& cplUHpmcUHpmVPVP,cplUHpmcUHpmcVWLmVWLm,cplUHpmcUHpmcVWRmVWRm,cplUHpmcUHpmVZVZ,         & 
& cplUHpmcUHpmVZRVZR,kont,PiSf(1,:,:))

mat2 = mat2a - Real(PiSf(1,:,:),dp) 
Call Chop(mat2) 
Call Eigensystem(mat2,mi2,RS,kont,test) 
UCOS_0 = RS 
 
 
! Now with momenta 
Do i1=1,4
PiSf(i1,:,:) = ZeroC 
p2 = MHpm2(i1)
If (i1.eq.1) p2 = 0._dp 
If (i1.eq.2) p2 = 0._dp 
Call Pi1LoopHpm(p2,MAh,MAh2,Mhh,Mhh2,MVWLm,MVWLm2,MVWRm,MVWRm2,MHpm,MHpm2,            & 
& MFd,MFd2,MFu,MFu2,MFe,MFe2,MFv,MFv2,MVZ,MVZ2,MVZR,MVZR2,cplAhAhcUHpm,cplAhhhcUHpm,     & 
& cplAhcUHpmcVWLm,cplAhcUHpmcVWRm,cplAhHpmcUHpm,cplcFdFucUHpmL,cplcFdFucUHpmR,           & 
& cplcFeFvcUHpmL,cplcFeFvcUHpmR,cplcgZgWLpcUHpm,cplcgWLpgZUHpm,cplcgZpgWLpcUHpm,         & 
& cplcgWLpgZpUHpm,cplcgZgWRpcUHpm,cplcgWRpgZUHpm,cplcgZpgWRpcUHpm,cplcgWRpgZpUHpm,       & 
& cplcgWLmgZcUHpm,cplcgZgWLmUHpm,cplcgWRmgZcUHpm,cplcgZgWRmUHpm,cplcgWLmgZpcUHpm,        & 
& cplcgZpgWLmUHpm,cplcgWRmgZpcUHpm,cplcgZpgWRmUHpm,cplhhhhcUHpm,cplhhcUHpmcVWLm,         & 
& cplhhcUHpmcVWRm,cplhhHpmcUHpm,cplHpmcUHpmcHpm,cplHpmcUHpmVP,cplHpmcUHpmVZ,             & 
& cplHpmcUHpmVZR,cplcUHpmcVWLmVP,cplcUHpmcVWRmVP,cplcUHpmcVWLmVZ,cplcUHpmcVWRmVZ,        & 
& cplcUHpmcVWLmVZR,cplcUHpmcVWRmVZR,cplAhAhUHpmcUHpm,cplhhhhUHpmcUHpm,cplUHpmHpmcUHpmcHpm,& 
& cplUHpmcUHpmVPVP,cplUHpmcUHpmcVWLmVWLm,cplUHpmcUHpmcVWRmVWRm,cplUHpmcUHpmVZVZ,         & 
& cplUHpmcUHpmVZRVZR,kont,PiSf(i1,:,:))

End Do 
Do i1=4,1,-1 
mat2 = mat2a - Real(PiSf(i1,:,:),dp) 
Call Chop(mat2) 
Call Eigensystem(mat2,mi2,RS,kont,test) 
If ((kont.Eq.-8).Or.(kont.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
  kont = 0 
End If 
If ((kont.Ne.0).And.(ErrorLevel.Ge.0)) Then 
  Write(ErrCan,*) "Diagonalization did not work in routine "//NameOfUnit(Iname) 
  Write(*,*) "Diagonalization did not work in routine "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
End If 
mass2(i1) = mi2(i1) 
End do 
 
Do i1=1,4
  If (Abs(mass2(i1)).Le.MaxMassNumericalZero**2) mass2(i1) = 0._dp 
  If (mass2(i1).Ge.0._dp) Then 
    mass(i1) = Sqrt(mass2(i1)) 
  Else 
   If (ErrorLevel.Ge.0) Then 
   If ((i1.Gt.1).or.(Abs(mass2(i1)).gt.MaxVal(Abs(mass2)))) Then 
     Write(*,*) 'Warning from routine '//NameOfUnit(Iname) 
     Write(*,*) 'in the calculation of the masses' 
     Write(*,*) 'occurred a negative mass squared!' 
   Call TerminateProgram 
   End If 
   End If 
   kont = -301 
   mass(i1) = 0._dp 
  End If 
End Do 
 
i_count = 0 
Do  
i_count = i_count + 1 
test_m2 = mass2 
Do i1=1,4
PiSf(i1,:,:) = ZeroC 
p2 =  mass2(i1) 
If (i1.eq.1) p2 = 0._dp 
If (i1.eq.2) p2 = 0._dp 
Call Pi1LoopHpm(p2,MAh,MAh2,Mhh,Mhh2,MVWLm,MVWLm2,MVWRm,MVWRm2,MHpm,MHpm2,            & 
& MFd,MFd2,MFu,MFu2,MFe,MFe2,MFv,MFv2,MVZ,MVZ2,MVZR,MVZR2,cplAhAhcUHpm,cplAhhhcUHpm,     & 
& cplAhcUHpmcVWLm,cplAhcUHpmcVWRm,cplAhHpmcUHpm,cplcFdFucUHpmL,cplcFdFucUHpmR,           & 
& cplcFeFvcUHpmL,cplcFeFvcUHpmR,cplcgZgWLpcUHpm,cplcgWLpgZUHpm,cplcgZpgWLpcUHpm,         & 
& cplcgWLpgZpUHpm,cplcgZgWRpcUHpm,cplcgWRpgZUHpm,cplcgZpgWRpcUHpm,cplcgWRpgZpUHpm,       & 
& cplcgWLmgZcUHpm,cplcgZgWLmUHpm,cplcgWRmgZcUHpm,cplcgZgWRmUHpm,cplcgWLmgZpcUHpm,        & 
& cplcgZpgWLmUHpm,cplcgWRmgZpcUHpm,cplcgZpgWRmUHpm,cplhhhhcUHpm,cplhhcUHpmcVWLm,         & 
& cplhhcUHpmcVWRm,cplhhHpmcUHpm,cplHpmcUHpmcHpm,cplHpmcUHpmVP,cplHpmcUHpmVZ,             & 
& cplHpmcUHpmVZR,cplcUHpmcVWLmVP,cplcUHpmcVWRmVP,cplcUHpmcVWLmVZ,cplcUHpmcVWRmVZ,        & 
& cplcUHpmcVWLmVZR,cplcUHpmcVWRmVZR,cplAhAhUHpmcUHpm,cplhhhhUHpmcUHpm,cplUHpmHpmcUHpmcHpm,& 
& cplUHpmcUHpmVPVP,cplUHpmcUHpmcVWLmVWLm,cplUHpmcUHpmcVWRmVWRm,cplUHpmcUHpmVZVZ,         & 
& cplUHpmcUHpmVZRVZR,kont,PiSf(i1,:,:))

End Do 
Do i1=4,1,-1 
mat2 = mat2a - Real(PiSf(i1,:,:),dp) 
Call Chop(mat2) 
Call Eigensystem(mat2,mi2,RS,kont,test) 
UCOS_p2(i1,:) = RS(i1,:) 
 If ((kont.Eq.-8).Or.(kont.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
  kont = 0 
End If 
If ((kont.Ne.0).And.(ErrorLevel.Ge.0)) Then 
  Write(ErrCan,*) "Diagonalization did not work in routine "//NameOfUnit(Iname) 
  Write(*,*) "Diagonalization did not work in routine "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
End If 
mass2(i1) = mi2(i1) 
End do 
Do i1=1,4
 If (Abs(mass2(i1)).Le.MaxMassNumericalZero**2) mass2(i1) = 0._dp 
 If (test_m2(i1).Ne.0._dp) Then 
    test_m2(i1) = Abs(test_m2(i1) - mass2(i1)) / test_m2(i1) 
 Else 
    test_m2(i1) = Abs(mass2(i1)) 
 End If 
 If (Abs(mass2(i1)).lt.1.0E-30_dp) test_m2(i1) = 0._dp 
 If (mass2(i1).Ge.0._dp) Then 
    mass(i1) = sqrt(mass2(i1)) 
  Else 
     Write(*,*) 'Warning from routine '//NameOfUnit(Iname) 
     Write(*,*) 'in the calculation of the masses occurred a negative mass squared!' 
     Write(*,*) 'generation: ',i1 
     Write(*,*) 'mass: ',mass2(i1) 
   SignOfMassChanged = .True. 
   mass(i1) = 0._dp 
  End If 
End Do 
 
If (Maxval(test_m2).LT.0.1_dp*delta) Exit 
If (i_count.Gt.30) Then 
  Write(*,*) "Problem in "//NameOfUnit(Iname), test_m2, mass2 
  kont = -510 
  Call AddError(510) 
 Exit 
End If 
End Do 
 
 
Iname = Iname -1 
End Subroutine OneLoopHpm
 
 
Subroutine Pi1LoopHpm(p2,MAh,MAh2,Mhh,Mhh2,MVWLm,MVWLm2,MVWRm,MVWRm2,MHpm,            & 
& MHpm2,MFd,MFd2,MFu,MFu2,MFe,MFe2,MFv,MFv2,MVZ,MVZ2,MVZR,MVZR2,cplAhAhcUHpm,            & 
& cplAhhhcUHpm,cplAhcUHpmcVWLm,cplAhcUHpmcVWRm,cplAhHpmcUHpm,cplcFdFucUHpmL,             & 
& cplcFdFucUHpmR,cplcFeFvcUHpmL,cplcFeFvcUHpmR,cplcgZgWLpcUHpm,cplcgWLpgZUHpm,           & 
& cplcgZpgWLpcUHpm,cplcgWLpgZpUHpm,cplcgZgWRpcUHpm,cplcgWRpgZUHpm,cplcgZpgWRpcUHpm,      & 
& cplcgWRpgZpUHpm,cplcgWLmgZcUHpm,cplcgZgWLmUHpm,cplcgWRmgZcUHpm,cplcgZgWRmUHpm,         & 
& cplcgWLmgZpcUHpm,cplcgZpgWLmUHpm,cplcgWRmgZpcUHpm,cplcgZpgWRmUHpm,cplhhhhcUHpm,        & 
& cplhhcUHpmcVWLm,cplhhcUHpmcVWRm,cplhhHpmcUHpm,cplHpmcUHpmcHpm,cplHpmcUHpmVP,           & 
& cplHpmcUHpmVZ,cplHpmcUHpmVZR,cplcUHpmcVWLmVP,cplcUHpmcVWRmVP,cplcUHpmcVWLmVZ,          & 
& cplcUHpmcVWRmVZ,cplcUHpmcVWLmVZR,cplcUHpmcVWRmVZR,cplAhAhUHpmcUHpm,cplhhhhUHpmcUHpm,   & 
& cplUHpmHpmcUHpmcHpm,cplUHpmcUHpmVPVP,cplUHpmcUHpmcVWLmVWLm,cplUHpmcUHpmcVWRmVWRm,      & 
& cplUHpmcUHpmVZVZ,cplUHpmcUHpmVZRVZR,kont,res)

Implicit None 
Real(dp), Intent(in) :: MAh(4),MAh2(4),Mhh(4),Mhh2(4),MVWLm,MVWLm2,MVWRm,MVWRm2,MHpm(4),MHpm2(4),             & 
& MFd(3),MFd2(3),MFu(3),MFu2(3),MFe(3),MFe2(3),MFv(9),MFv2(9),MVZ,MVZ2,MVZR,MVZR2

Complex(dp), Intent(in) :: cplAhAhcUHpm(4,4,4),cplAhhhcUHpm(4,4,4),cplAhcUHpmcVWLm(4,4),cplAhcUHpmcVWRm(4,4),    & 
& cplAhHpmcUHpm(4,4,4),cplcFdFucUHpmL(3,3,4),cplcFdFucUHpmR(3,3,4),cplcFeFvcUHpmL(3,9,4),& 
& cplcFeFvcUHpmR(3,9,4),cplcgZgWLpcUHpm(4),cplcgWLpgZUHpm(4),cplcgZpgWLpcUHpm(4),        & 
& cplcgWLpgZpUHpm(4),cplcgZgWRpcUHpm(4),cplcgWRpgZUHpm(4),cplcgZpgWRpcUHpm(4),           & 
& cplcgWRpgZpUHpm(4),cplcgWLmgZcUHpm(4),cplcgZgWLmUHpm(4),cplcgWRmgZcUHpm(4),            & 
& cplcgZgWRmUHpm(4),cplcgWLmgZpcUHpm(4),cplcgZpgWLmUHpm(4),cplcgWRmgZpcUHpm(4),          & 
& cplcgZpgWRmUHpm(4),cplhhhhcUHpm(4,4,4),cplhhcUHpmcVWLm(4,4),cplhhcUHpmcVWRm(4,4),      & 
& cplhhHpmcUHpm(4,4,4),cplHpmcUHpmcHpm(4,4,4),cplHpmcUHpmVP(4,4),cplHpmcUHpmVZ(4,4),     & 
& cplHpmcUHpmVZR(4,4),cplcUHpmcVWLmVP(4),cplcUHpmcVWRmVP(4),cplcUHpmcVWLmVZ(4),          & 
& cplcUHpmcVWRmVZ(4),cplcUHpmcVWLmVZR(4),cplcUHpmcVWRmVZR(4),cplAhAhUHpmcUHpm(4,4,4,4),  & 
& cplhhhhUHpmcUHpm(4,4,4,4),cplUHpmHpmcUHpmcHpm(4,4,4,4),cplUHpmcUHpmVPVP(4,4),          & 
& cplUHpmcUHpmcVWLmVWLm(4,4),cplUHpmcUHpmcVWRmVWRm(4,4),cplUHpmcUHpmVZVZ(4,4),           & 
& cplUHpmcUHpmVZRVZR(4,4)

Integer, Intent(inout) :: kont 
Real(dp) :: B0m2, F0m2, G0m2,B1m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Complex(dp), Intent(inout) :: res(4,4) 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2,temp, sumI(4,4) 
Integer :: i1,i2,i3,i4,j1,j2,j3,j4, gO1, gO2, ierr 
 
 
res = 0._dp 
 
!------------------------ 
! Ah, Ah 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
       Do i2 = 1, 4
 B0m2 = Real(SA_B0(p2,MAh2(i1),MAh2(i2)),dp) 
Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplAhAhcUHpm(i1,i2,gO1)
coup2 = Conjg(cplAhAhcUHpm(i1,i2,gO2))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +1._dp/4._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! hh, Ah 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
       Do i2 = 1, 4
 B0m2 = Real(SA_B0(p2,Mhh2(i1),MAh2(i2)),dp) 
Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplAhhhcUHpm(i2,i1,gO1)
coup2 = Conjg(cplAhhhcUHpm(i2,i1,gO2))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[VWLm], Ah 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 F0m2 = FloopRXi(p2,MAh2(i2),MVWLm2) 
Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplAhcUHpmcVWLm(i2,gO1)
coup2 =  Conjg(cplAhcUHpmcVWLm(i2,gO2))
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! conj[VWRm], Ah 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 F0m2 = FloopRXi(p2,MAh2(i2),MVWRm2) 
Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplAhcUHpmcVWRm(i2,gO1)
coup2 =  Conjg(cplAhcUHpmcVWRm(i2,gO2))
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! Hpm, Ah 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
       Do i2 = 1, 4
 B0m2 = Real(SA_B0(p2,MHpm2(i1),MAh2(i2)),dp) 
Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplAhHpmcUHpm(i2,i1,gO1)
coup2 = Conjg(cplAhHpmcUHpm(i2,i1,gO2))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fd], Fu 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 G0m2 = Real(SA_Gloop(p2,MFd2(i1),MFu2(i2)),dp) 
B0m2 = -2._dp*MFd(i1)*MFu(i2)*Real(SA_B0(p2,MFd2(i1),MFu2(i2)),dp) 
Do gO1 = 1, 4
  Do gO2 = gO1, 4
coupL1 = cplcFdFucUHpmL(i1,i2,gO1)
coupR1 = cplcFdFucUHpmR(i1,i2,gO1)
coupL2 =  Conjg(cplcFdFucUHpmL(i1,i2,gO2))
coupR2 =  Conjg(cplcFdFucUHpmR(i1,i2,gO2))
    SumI(gO1,gO2) = (coupL1*coupL2+coupR1*coupR2)*G0m2 & 
                & + (coupL1*coupR2+coupR1*coupL2)*B0m2 
   End Do 
End Do 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fe], Fv 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 9
 G0m2 = Real(SA_Gloop(p2,MFe2(i1),MFv2(i2)),dp) 
B0m2 = -2._dp*MFe(i1)*MFv(i2)*Real(SA_B0(p2,MFe2(i1),MFv2(i2)),dp) 
Do gO1 = 1, 4
  Do gO2 = gO1, 4
coupL1 = cplcFeFvcUHpmL(i1,i2,gO1)
coupR1 = cplcFeFvcUHpmR(i1,i2,gO1)
coupL2 =  Conjg(cplcFeFvcUHpmL(i1,i2,gO2))
coupR2 =  Conjg(cplcFeFvcUHpmR(i1,i2,gO2))
    SumI(gO1,gO2) = (coupL1*coupL2+coupR1*coupR2)*G0m2 & 
                & + (coupL1*coupR2+coupR1*coupL2)*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[gZ], gWLmC 
!------------------------ 
sumI = 0._dp 
 
F0m2 = -Real(SA_B0(p2,MVWLm2*RXi,MVZ2*RXi),dp) 
 Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplcgZgWLpcUHpm(gO1)
coup2 =  cplcgWLpgZUHpm(gO2) 
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
!------------------------ 
! bar[gZR], gWLmC 
!------------------------ 
sumI = 0._dp 
 
F0m2 = -Real(SA_B0(p2,MVWLm2*RXi,MVZR2*RXi),dp) 
 Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplcgZpgWLpcUHpm(gO1)
coup2 =  cplcgWLpgZpUHpm(gO2) 
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
!------------------------ 
! bar[gZ], gWRmC 
!------------------------ 
sumI = 0._dp 
 
F0m2 = -Real(SA_B0(p2,MVWRm2*RXi,MVZ2*RXi),dp) 
 Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplcgZgWRpcUHpm(gO1)
coup2 =  cplcgWRpgZUHpm(gO2) 
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
!------------------------ 
! bar[gZR], gWRmC 
!------------------------ 
sumI = 0._dp 
 
F0m2 = -Real(SA_B0(p2,MVWRm2*RXi,MVZR2*RXi),dp) 
 Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplcgZpgWRpcUHpm(gO1)
coup2 =  cplcgWRpgZpUHpm(gO2) 
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWLm], gZ 
!------------------------ 
sumI = 0._dp 
 
F0m2 = -Real(SA_B0(p2,MVZ2*RXi,MVWLm2*RXi),dp) 
 Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplcgWLmgZcUHpm(gO1)
coup2 =  cplcgZgWLmUHpm(gO2) 
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWRm], gZ 
!------------------------ 
sumI = 0._dp 
 
F0m2 = -Real(SA_B0(p2,MVZ2*RXi,MVWRm2*RXi),dp) 
 Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplcgWRmgZcUHpm(gO1)
coup2 =  cplcgZgWRmUHpm(gO2) 
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWLm], gZR 
!------------------------ 
sumI = 0._dp 
 
F0m2 = -Real(SA_B0(p2,MVZR2*RXi,MVWLm2*RXi),dp) 
 Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplcgWLmgZpcUHpm(gO1)
coup2 =  cplcgZpgWLmUHpm(gO2) 
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWRm], gZR 
!------------------------ 
sumI = 0._dp 
 
F0m2 = -Real(SA_B0(p2,MVZR2*RXi,MVWRm2*RXi),dp) 
 Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplcgWRmgZpcUHpm(gO1)
coup2 =  cplcgZpgWRmUHpm(gO2) 
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
!------------------------ 
! hh, hh 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
       Do i2 = 1, 4
 B0m2 = Real(SA_B0(p2,Mhh2(i1),Mhh2(i2)),dp) 
Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplhhhhcUHpm(i1,i2,gO1)
coup2 = Conjg(cplhhhhcUHpm(i1,i2,gO2))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +1._dp/4._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[VWLm], hh 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 F0m2 = FloopRXi(p2,Mhh2(i2),MVWLm2) 
Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplhhcUHpmcVWLm(i2,gO1)
coup2 =  Conjg(cplhhcUHpmcVWLm(i2,gO2))
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! conj[VWRm], hh 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 F0m2 = FloopRXi(p2,Mhh2(i2),MVWRm2) 
Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplhhcUHpmcVWRm(i2,gO1)
coup2 =  Conjg(cplhhcUHpmcVWRm(i2,gO2))
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! Hpm, hh 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
       Do i2 = 1, 4
 B0m2 = Real(SA_B0(p2,MHpm2(i1),Mhh2(i2)),dp) 
Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplhhHpmcUHpm(i2,i1,gO1)
coup2 = Conjg(cplhhHpmcUHpm(i2,i1,gO2))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[Hpm], Hpm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
       Do i2 = 1, 4
 B0m2 = Real(SA_B0(p2,MHpm2(i1),MHpm2(i2)),dp) 
Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplHpmcUHpmcHpm(i2,gO1,i1)
coup2 = Conjg(cplHpmcUHpmcHpm(i2,gO2,i1))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! VP, Hpm 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 F0m2 = FloopRXi(p2,MHpm2(i2),0._dp) 
Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplHpmcUHpmVP(i2,gO1)
coup2 =  Conjg(cplHpmcUHpmVP(i2,gO2))
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! VZ, Hpm 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 F0m2 = FloopRXi(p2,MHpm2(i2),MVZ2) 
Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplHpmcUHpmVZ(i2,gO1)
coup2 =  Conjg(cplHpmcUHpmVZ(i2,gO2))
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! VZR, Hpm 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 F0m2 = FloopRXi(p2,MHpm2(i2),MVZR2) 
Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplHpmcUHpmVZR(i2,gO1)
coup2 =  Conjg(cplHpmcUHpmVZR(i2,gO2))
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! conj[VWLm], VP 
!------------------------ 
sumI = 0._dp 
 
F0m2 = Real(SVVloop(p2,0._dp,MVWLm2),dp)   
 Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplcUHpmcVWLmVP(gO1)
coup2 =  Conjg(cplcUHpmcVWLmVP(gO2)) 
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
!------------------------ 
! conj[VWRm], VP 
!------------------------ 
sumI = 0._dp 
 
F0m2 = Real(SVVloop(p2,0._dp,MVWRm2),dp)   
 Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplcUHpmcVWRmVP(gO1)
coup2 =  Conjg(cplcUHpmcVWRmVP(gO2)) 
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
!------------------------ 
! conj[VWLm], VZ 
!------------------------ 
sumI = 0._dp 
 
F0m2 = Real(SVVloop(p2,MVZ2,MVWLm2),dp)   
 Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplcUHpmcVWLmVZ(gO1)
coup2 =  Conjg(cplcUHpmcVWLmVZ(gO2)) 
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
!------------------------ 
! conj[VWRm], VZ 
!------------------------ 
sumI = 0._dp 
 
F0m2 = Real(SVVloop(p2,MVZ2,MVWRm2),dp)   
 Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplcUHpmcVWRmVZ(gO1)
coup2 =  Conjg(cplcUHpmcVWRmVZ(gO2)) 
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
!------------------------ 
! conj[VWLm], VZR 
!------------------------ 
sumI = 0._dp 
 
F0m2 = Real(SVVloop(p2,MVZR2,MVWLm2),dp)   
 Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplcUHpmcVWLmVZR(gO1)
coup2 =  Conjg(cplcUHpmcVWLmVZR(gO2)) 
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
!------------------------ 
! conj[VWRm], VZR 
!------------------------ 
sumI = 0._dp 
 
F0m2 = Real(SVVloop(p2,MVZR2,MVWRm2),dp)   
 Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplcUHpmcVWRmVZR(gO1)
coup2 =  Conjg(cplcUHpmcVWRmVZR(gO2)) 
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
!------------------------ 
! Ah, Ah 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
 A0m2 = SA_A0(MAh2(i1)) 
Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplAhAhUHpmcUHpm(i1,i1,gO2,gO1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! hh, hh 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
 A0m2 = SA_A0(Mhh2(i1)) 
Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplhhhhUHpmcUHpm(i1,i1,gO2,gO1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! conj[Hpm], Hpm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
 A0m2 = SA_A0(MHpm2(i1)) 
Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplUHpmHpmcUHpmcHpm(gO2,i1,gO1,i1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! VP, VP 
!------------------------ 
sumI = 0._dp 
 
!------------------------ 
! conj[VWLm], VWLm 
!------------------------ 
sumI = 0._dp 
 
A0m2 = 0.75_dp*SA_A0(MVWLm2) + 0.25_dp*RXi*SA_A0(MVWLm2*RXi) - 0.5_dp*MVWLm2*rMS 
Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplUHpmcUHpmcVWLmVWLm(gO2,gO1)
    SumI(gO1,gO2) = coup1*A0m2 
   End Do 
End Do 
res = res +4._dp* SumI  
!------------------------ 
! conj[VWRm], VWRm 
!------------------------ 
sumI = 0._dp 
 
A0m2 = 0.75_dp*SA_A0(MVWRm2) + 0.25_dp*RXi*SA_A0(MVWRm2*RXi) - 0.5_dp*MVWRm2*rMS 
Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplUHpmcUHpmcVWRmVWRm(gO2,gO1)
    SumI(gO1,gO2) = coup1*A0m2 
   End Do 
End Do 
res = res +4._dp* SumI  
!------------------------ 
! VZ, VZ 
!------------------------ 
sumI = 0._dp 
 
A0m2 = 0.75_dp*SA_A0(MVZ2) + 0.25_dp*RXi*SA_A0(MVZ2*RXi) - 0.5_dp*MVZ2*rMS 
Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplUHpmcUHpmVZVZ(gO2,gO1)
    SumI(gO1,gO2) = coup1*A0m2 
   End Do 
End Do 
res = res +2._dp* SumI  
!------------------------ 
! VZR, VZR 
!------------------------ 
sumI = 0._dp 
 
A0m2 = 0.75_dp*SA_A0(MVZR2) + 0.25_dp*RXi*SA_A0(MVZR2*RXi) - 0.5_dp*MVZR2*rMS 
Do gO1 = 1, 4
  Do gO2 = gO1, 4
coup1 = cplUHpmcUHpmVZRVZR(gO2,gO1)
    SumI(gO1,gO2) = coup1*A0m2 
   End Do 
End Do 
res = res +2._dp* SumI  


Do gO2 = 1, 4
  Do gO1 = gO2+1, 4
     res(gO1,gO2) = Conjg(res(gO2,gO1))  
   End Do 
End Do 
 
res = oo16pi2*res 
 
End Subroutine Pi1LoopHpm 
 
Subroutine OneLoopFd(YQ2,k1,MFd,MFd2,MAh,MAh2,Mhh,Mhh2,MVZ,MVZ2,MVZR,MVZR2,           & 
& MHpm,MHpm2,MFu,MFu2,MVWLm,MVWLm2,MVWRm,MVWRm2,cplcUFdFdAhL,cplcUFdFdAhR,               & 
& cplcUFdFdhhL,cplcUFdFdhhR,cplcUFdFdVGL,cplcUFdFdVGR,cplcUFdFdVPL,cplcUFdFdVPR,         & 
& cplcUFdFdVZL,cplcUFdFdVZR,cplcUFdFdVZRL,cplcUFdFdVZRR,cplcUFdFucHpmL,cplcUFdFucHpmR,   & 
& cplcUFdFuVWLmL,cplcUFdFuVWLmR,cplcUFdFuVWRmL,cplcUFdFuVWRmR,delta,MFd_1L,              & 
& MFd2_1L,ZDL_1L,ZDR_1L,ierr)

Implicit None 
Real(dp), Intent(in) :: MFd(3),MFd2(3),MAh(4),MAh2(4),Mhh(4),Mhh2(4),MVZ,MVZ2,MVZR,MVZR2,MHpm(4),             & 
& MHpm2(4),MFu(3),MFu2(3),MVWLm,MVWLm2,MVWRm,MVWRm2

Real(dp), Intent(in) :: k1

Complex(dp), Intent(in) :: YQ2(3,3)

Complex(dp), Intent(in) :: cplcUFdFdAhL(3,3,4),cplcUFdFdAhR(3,3,4),cplcUFdFdhhL(3,3,4),cplcUFdFdhhR(3,3,4),      & 
& cplcUFdFdVGL(3,3),cplcUFdFdVGR(3,3),cplcUFdFdVPL(3,3),cplcUFdFdVPR(3,3),               & 
& cplcUFdFdVZL(3,3),cplcUFdFdVZR(3,3),cplcUFdFdVZRL(3,3),cplcUFdFdVZRR(3,3),             & 
& cplcUFdFucHpmL(3,3,4),cplcUFdFucHpmR(3,3,4),cplcUFdFuVWLmL(3,3),cplcUFdFuVWLmR(3,3),   & 
& cplcUFdFuVWRmL(3,3),cplcUFdFuVWRmR(3,3)

Complex(dp) :: mat1a(3,3), mat1(3,3) 
Integer , Intent(inout):: ierr 
Integer :: i1,i2,i3,i4,j1,j2,j3,j4,il,i_count 
Real(dp), Intent(in) :: delta 
Real(dp) :: mi2(3), test_m2(3), p2 
Real(dp), Intent(out) :: MFd_1L(3),MFd2_1L(3) 
 Complex(dp), Intent(out) :: ZDL_1L(3,3), ZDR_1L(3,3) 
 
 Real(dp) :: MFd_t(3),MFd2_t(3) 
 Complex(dp) :: ZDL_t(3,3), ZDR_t(3,3), sigL(3,3), sigR(3,3), sigSL(3,3), sigSR(3,3) 
 
 Complex(dp) :: mat(3,3)=0._dp, mat2(3,3)=0._dp, phaseM 

Complex(dp) :: ZDL2(3,3), ZDR2(3,3) 
 
 Real(dp) :: ZDL1(3,3), ZDR1(3,3), test(2) 
 
 Iname = Iname + 1 
NameOfUnit(Iname) = 'OneLoopMFd'
 
mat1a(1,1) = 0._dp 
mat1a(1,1) = mat1a(1,1)-((k1*Conjg(YQ2(1,1)))/sqrt(2._dp))
mat1a(1,2) = 0._dp 
mat1a(1,2) = mat1a(1,2)-((k1*Conjg(YQ2(1,2)))/sqrt(2._dp))
mat1a(1,3) = 0._dp 
mat1a(1,3) = mat1a(1,3)-((k1*Conjg(YQ2(1,3)))/sqrt(2._dp))
mat1a(2,1) = 0._dp 
mat1a(2,1) = mat1a(2,1)-((k1*Conjg(YQ2(2,1)))/sqrt(2._dp))
mat1a(2,2) = 0._dp 
mat1a(2,2) = mat1a(2,2)-((k1*Conjg(YQ2(2,2)))/sqrt(2._dp))
mat1a(2,3) = 0._dp 
mat1a(2,3) = mat1a(2,3)-((k1*Conjg(YQ2(2,3)))/sqrt(2._dp))
mat1a(3,1) = 0._dp 
mat1a(3,1) = mat1a(3,1)-((k1*Conjg(YQ2(3,1)))/sqrt(2._dp))
mat1a(3,2) = 0._dp 
mat1a(3,2) = mat1a(3,2)-((k1*Conjg(YQ2(3,2)))/sqrt(2._dp))
mat1a(3,3) = 0._dp 
mat1a(3,3) = mat1a(3,3)-((k1*Conjg(YQ2(3,3)))/sqrt(2._dp))

 
 !---------------------------------------- 
! Rotation matrix for p2=0 
!----------------------------------------- 
 
sigL=0._dp 
sigR=0._dp 
sigSL=0._dp 
sigSR=0._dp 
p2 = 0._dp 
Call Sigma1LoopFd(p2,MFd,MFd2,MAh,MAh2,Mhh,Mhh2,MVZ,MVZ2,MVZR,MVZR2,MHpm,             & 
& MHpm2,MFu,MFu2,MVWLm,MVWLm2,MVWRm,MVWRm2,cplcUFdFdAhL,cplcUFdFdAhR,cplcUFdFdhhL,       & 
& cplcUFdFdhhR,cplcUFdFdVGL,cplcUFdFdVGR,cplcUFdFdVPL,cplcUFdFdVPR,cplcUFdFdVZL,         & 
& cplcUFdFdVZR,cplcUFdFdVZRL,cplcUFdFdVZRR,cplcUFdFucHpmL,cplcUFdFucHpmR,cplcUFdFuVWLmL, & 
& cplcUFdFuVWLmR,cplcUFdFuVWRmL,cplcUFdFuVWRmR,sigL,sigR,sigSL,sigSR)

mat1 = mat1a - SigSL - 0.5_dp*(MatMul(SigR,mat1a) + MatMul(mat1a,SigL)) 
 
mat2 = Matmul(Transpose(Conjg(mat1)),mat1) 
If (ForceRealMatrices) mat2 = Real(mat2,dp) 
If (Maxval(Abs(Aimag(mat2))).Eq.0._dp) Then 
Call EigenSystem(Real(mat2,dp),MFd2_t,ZDR1,ierr,test) 
ZDR2 = ZDR1 
Else 
Call EigenSystem(mat2,MFd2_t,ZDR2,ierr,test) 
 End If 
 
ZDROS_0 = ZDR2 
 mat2 = Matmul(mat1,Transpose(Conjg(mat1))) 
If (ForceRealMatrices) mat2 = Real(mat2,dp) 
If (Maxval(Abs(Aimag(mat2))).Eq.0._dp) Then 
Call EigenSystem(Real(mat2,dp),MFd2_t,ZDL1,ierr,test) 
 
 
ZDL2 = ZDL1 
Else 
Call EigenSystem(mat2,MFd2_t,ZDL2,ierr,test) 
 
 
End If 
ZDL2 = Conjg(ZDL2) 
ZDLOS_0 = ZDL2 
 
!---------------------------------------- 
! Now, with momenta
!----------------------------------------- 
 
Do il=3,1,-1
sigL=0._dp 
sigR=0._dp 
sigSL=0._dp 
sigSR=0._dp 
p2 = MFd2(il) 
Call Sigma1LoopFd(p2,MFd,MFd2,MAh,MAh2,Mhh,Mhh2,MVZ,MVZ2,MVZR,MVZR2,MHpm,             & 
& MHpm2,MFu,MFu2,MVWLm,MVWLm2,MVWRm,MVWRm2,cplcUFdFdAhL,cplcUFdFdAhR,cplcUFdFdhhL,       & 
& cplcUFdFdhhR,cplcUFdFdVGL,cplcUFdFdVGR,cplcUFdFdVPL,cplcUFdFdVPR,cplcUFdFdVZL,         & 
& cplcUFdFdVZR,cplcUFdFdVZRL,cplcUFdFdVZRR,cplcUFdFucHpmL,cplcUFdFucHpmR,cplcUFdFuVWLmL, & 
& cplcUFdFuVWLmR,cplcUFdFuVWRmL,cplcUFdFuVWRmR,sigL,sigR,sigSL,sigSR)

mat1 = mat1a - SigSL - 0.5_dp*(MatMul(SigR,mat1a) + MatMul(mat1a,SigL)) 
 
mat2 = Matmul(Transpose(Conjg(mat1)),mat1) 
If (ForceRealMatrices) mat2 = Real(mat2,dp) 
If (Maxval(Abs(Aimag(mat2))).Eq.0._dp) Then 
Call EigenSystem(Real(mat2,dp),MFd2_t,ZDR1,ierr,test) 
ZDR2 = ZDR1 
Else 
Call EigenSystem(mat2,MFd2_t,ZDR2,ierr,test) 
 End If 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
  ierr = 0 
End If 
 
!---------------------------------------- 
! Redoing Calculation using redefined p2 
!----------------------------------------- 
 
i_count = 0 
p2_loop: Do  
i_count = i_count + 1 
sigL=0._dp 
sigR=0._dp 
sigSL=0._dp 
sigSR=0._dp 
p2 = MFd2_t(iL)
Call Sigma1LoopFd(p2,MFd,MFd2,MAh,MAh2,Mhh,Mhh2,MVZ,MVZ2,MVZR,MVZR2,MHpm,             & 
& MHpm2,MFu,MFu2,MVWLm,MVWLm2,MVWRm,MVWRm2,cplcUFdFdAhL,cplcUFdFdAhR,cplcUFdFdhhL,       & 
& cplcUFdFdhhR,cplcUFdFdVGL,cplcUFdFdVGR,cplcUFdFdVPL,cplcUFdFdVPR,cplcUFdFdVZL,         & 
& cplcUFdFdVZR,cplcUFdFdVZRL,cplcUFdFdVZRR,cplcUFdFucHpmL,cplcUFdFucHpmR,cplcUFdFuVWLmL, & 
& cplcUFdFuVWLmR,cplcUFdFuVWRmL,cplcUFdFuVWRmR,sigL,sigR,sigSL,sigSR)

mat1 = mat1a - SigSL - 0.5_dp*(MatMul(SigR,mat1a) + MatMul(mat1a,SigL)) 
 
mat2 = Matmul(Transpose(Conjg(mat1)),mat1) 
If (ForceRealMatrices) mat2 = Real(mat2,dp) 
If (Maxval(Abs(Aimag(mat2))).Eq.0._dp) Then 
Call EigenSystem(Real(mat2,dp),MFd2_t,ZDR1,ierr,test) 
ZDR2 = ZDR1 
Else 
Call EigenSystem(mat2,MFd2_t,ZDR2,ierr,test) 
 End If 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
  ierr = 0 
End If 
 
MFd2_1L(il) = MFd2_t(il) 
MFd_1L(il) = Sqrt(MFd2_1L(il)) 
 
If (p2.Ne.0._dp) Then 
  test(1) = Abs(MFd2_1L(il)-p2)/p2
Else 
  test(2) = Abs(MFd2_1L(il))
End If 
If (Abs(MFd2_1L(il)).lt.1.0E-30_dp) Exit p2_loop 
If (test(1).lt.0.1_dp*delta) Exit p2_loop 
If(i_count.gt.30) then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  Exit p2_loop 
End if
End Do p2_loop 
mat2 = Matmul(mat1,Transpose(Conjg(mat1))) 
If (ForceRealMatrices) mat2 = Real(mat2,dp) 
If (Maxval(Abs(Aimag(mat2))).Eq.0._dp) Then 
Call EigenSystem(Real(mat2,dp),MFd2_t,ZDL1,ierr,test) 
 
 
ZDL2 = ZDL1 
Else 
Call EigenSystem(mat2,MFd2_t,ZDL2,ierr,test) 
 
 
End If 
ZDL2 = Conjg(ZDL2) 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
  ierr = 0 
End If 
 
mat2 = Matmul(Matmul( Conjg(ZDL2),mat1),Transpose( Conjg(ZDR2))) 
Do i1=1,3
If (Abs(mat2(i1,i1)).gt.0._dp) Then 
phaseM = mat2(i1,i1) / Abs(mat2(i1,i1)) 
ZDR2(i1,:) = phaseM *ZDR2(i1,:) 
 End if 
End Do 
 
ZDLOS_p2(il,:) = ZDL2(il,:) 
 ZDROS_p2(il,:) = ZDR2(il,:) 
 ZDL_1L = ZDL2 
 ZDR_1L = ZDR2 
 End Do  
 
Iname = Iname -1 
End Subroutine OneLoopFd
 
 
Subroutine Sigma1LoopFd(p2,MFd,MFd2,MAh,MAh2,Mhh,Mhh2,MVZ,MVZ2,MVZR,MVZR2,            & 
& MHpm,MHpm2,MFu,MFu2,MVWLm,MVWLm2,MVWRm,MVWRm2,cplcUFdFdAhL,cplcUFdFdAhR,               & 
& cplcUFdFdhhL,cplcUFdFdhhR,cplcUFdFdVGL,cplcUFdFdVGR,cplcUFdFdVPL,cplcUFdFdVPR,         & 
& cplcUFdFdVZL,cplcUFdFdVZR,cplcUFdFdVZRL,cplcUFdFdVZRR,cplcUFdFucHpmL,cplcUFdFucHpmR,   & 
& cplcUFdFuVWLmL,cplcUFdFuVWLmR,cplcUFdFuVWRmL,cplcUFdFuVWRmR,sigL,sigR,sigSL,sigSR)

Implicit None 
Real(dp), Intent(in) :: MFd(3),MFd2(3),MAh(4),MAh2(4),Mhh(4),Mhh2(4),MVZ,MVZ2,MVZR,MVZR2,MHpm(4),             & 
& MHpm2(4),MFu(3),MFu2(3),MVWLm,MVWLm2,MVWRm,MVWRm2

Complex(dp), Intent(in) :: cplcUFdFdAhL(3,3,4),cplcUFdFdAhR(3,3,4),cplcUFdFdhhL(3,3,4),cplcUFdFdhhR(3,3,4),      & 
& cplcUFdFdVGL(3,3),cplcUFdFdVGR(3,3),cplcUFdFdVPL(3,3),cplcUFdFdVPR(3,3),               & 
& cplcUFdFdVZL(3,3),cplcUFdFdVZR(3,3),cplcUFdFdVZRL(3,3),cplcUFdFdVZRR(3,3),             & 
& cplcUFdFucHpmL(3,3,4),cplcUFdFucHpmR(3,3,4),cplcUFdFuVWLmL(3,3),cplcUFdFuVWLmR(3,3),   & 
& cplcUFdFuVWRmL(3,3),cplcUFdFuVWRmR(3,3)

Complex(dp), Intent(out) :: SigL(3,3),SigR(3,3), SigSL(3,3), SigSR(3,3) 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2,temp, sumL(3,3), sumR(3,3), sumSL(3,3), sumSR(3,3) 
Real(dp) :: B0m2, F0m2, G0m2,B1m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
SigL = Cmplx(0._dp,0._dp,dp) 
SigR = Cmplx(0._dp,0._dp,dp) 
SigSL = Cmplx(0._dp,0._dp,dp) 
 SigSR = Cmplx(0._dp,0._dp,dp) 
 
!------------------------ 
! Fd, Ah 
!------------------------ 
    Do i1 = 1, 3
       Do i2 = 1, 4
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -Real(SA_B1(p2,MFd2(i1),MAh2(i2)),dp) 
B0m2 = MFd(i1)*Real(SA_B0(p2,MFd2(i1),MAh2(i2)),dp) 
coupL1 = cplcUFdFdAhL(gO1,i1,i2)
coupR1 = cplcUFdFdAhR(gO1,i1,i2)
coupL2 =  Conjg(cplcUFdFdAhL(gO2,i1,i2))
coupR2 =  Conjg(cplcUFdFdAhR(gO2,i1,i2))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! hh, Fd 
!------------------------ 
    Do i1 = 1, 4
       Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -Real(SA_B1(p2,MFd2(i2),Mhh2(i1)),dp) 
B0m2 = MFd(i2)*Real(SA_B0(p2,MFd2(i2),Mhh2(i1)),dp) 
coupL1 = cplcUFdFdhhL(gO1,i2,i1)
coupR1 = cplcUFdFdhhR(gO1,i2,i1)
coupL2 =  Conjg(cplcUFdFdhhL(gO2,i2,i1))
coupR2 =  Conjg(cplcUFdFdhhR(gO2,i2,i1))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! VG, Fd 
!------------------------ 
      Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -2._dp*Real(SA_B1(p2,MFd2(i2),0._dp)+ 0.5_dp*rMS,dp) 
B0m2 = -4._dp*MFd(i2)*Real(SA_B0(p2,MFd2(i2),0._dp)-0.5_dp*rMS,dp) 
coupL1 = cplcUFdFdVGL(gO1,i2)
coupR1 = cplcUFdFdVGR(gO1,i2)
coupL2 =  Conjg(cplcUFdFdVGL(gO2,i2))
coupR2 =  Conjg(cplcUFdFdVGR(gO2,i2))
SumSL(gO1,gO2) = coupL1*coupR2*B0m2 
SumSR(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +4._dp/3._dp* sumL
SigR = SigR +4._dp/3._dp* sumR 
SigSL = SigSL +4._dp/3._dp* sumSL 
SigSR = SigSR +4._dp/3._dp* sumSR 
    End Do 
 !------------------------ 
! VP, Fd 
!------------------------ 
      Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -2._dp*Real(SA_B1(p2,MFd2(i2),0._dp)+ 0.5_dp*rMS,dp) 
B0m2 = -4._dp*MFd(i2)*Real(SA_B0(p2,MFd2(i2),0._dp)-0.5_dp*rMS,dp) 
coupL1 = cplcUFdFdVPL(gO1,i2)
coupR1 = cplcUFdFdVPR(gO1,i2)
coupL2 =  Conjg(cplcUFdFdVPL(gO2,i2))
coupR2 =  Conjg(cplcUFdFdVPR(gO2,i2))
SumSL(gO1,gO2) = coupL1*coupR2*B0m2 
SumSR(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
    End Do 
 !------------------------ 
! VZ, Fd 
!------------------------ 
      Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -2._dp*Real(SA_B1(p2,MFd2(i2),MVZ2)+ 0.5_dp*rMS,dp) 
B0m2 = -4._dp*MFd(i2)*Real(SA_B0(p2,MFd2(i2),MVZ2)-0.5_dp*rMS,dp) 
coupL1 = cplcUFdFdVZL(gO1,i2)
coupR1 = cplcUFdFdVZR(gO1,i2)
coupL2 =  Conjg(cplcUFdFdVZL(gO2,i2))
coupR2 =  Conjg(cplcUFdFdVZR(gO2,i2))
SumSL(gO1,gO2) = coupL1*coupR2*B0m2 
SumSR(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
    End Do 
 !------------------------ 
! VZR, Fd 
!------------------------ 
      Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -2._dp*Real(SA_B1(p2,MFd2(i2),MVZR2)+ 0.5_dp*rMS,dp) 
B0m2 = -4._dp*MFd(i2)*Real(SA_B0(p2,MFd2(i2),MVZR2)-0.5_dp*rMS,dp) 
coupL1 = cplcUFdFdVZRL(gO1,i2)
coupR1 = cplcUFdFdVZRR(gO1,i2)
coupL2 =  Conjg(cplcUFdFdVZRL(gO2,i2))
coupR2 =  Conjg(cplcUFdFdVZRR(gO2,i2))
SumSL(gO1,gO2) = coupL1*coupR2*B0m2 
SumSR(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
    End Do 
 !------------------------ 
! conj[Hpm], Fu 
!------------------------ 
    Do i1 = 1, 4
       Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -Real(SA_B1(p2,MFu2(i2),MHpm2(i1)),dp) 
B0m2 = MFu(i2)*Real(SA_B0(p2,MFu2(i2),MHpm2(i1)),dp) 
coupL1 = cplcUFdFucHpmL(gO1,i2,i1)
coupR1 = cplcUFdFucHpmR(gO1,i2,i1)
coupL2 =  Conjg(cplcUFdFucHpmL(gO2,i2,i1))
coupR2 =  Conjg(cplcUFdFucHpmR(gO2,i2,i1))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! VWLm, Fu 
!------------------------ 
      Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -2._dp*Real(SA_B1(p2,MFu2(i2),MVWLm2)+ 0.5_dp*rMS,dp) 
B0m2 = -4._dp*MFu(i2)*Real(SA_B0(p2,MFu2(i2),MVWLm2)-0.5_dp*rMS,dp) 
coupL1 = cplcUFdFuVWLmL(gO1,i2)
coupR1 = cplcUFdFuVWLmR(gO1,i2)
coupL2 =  Conjg(cplcUFdFuVWLmL(gO2,i2))
coupR2 =  Conjg(cplcUFdFuVWLmR(gO2,i2))
SumSL(gO1,gO2) = coupL1*coupR2*B0m2 
SumSR(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
    End Do 
 !------------------------ 
! VWRm, Fu 
!------------------------ 
      Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -2._dp*Real(SA_B1(p2,MFu2(i2),MVWRm2)+ 0.5_dp*rMS,dp) 
B0m2 = -4._dp*MFu(i2)*Real(SA_B0(p2,MFu2(i2),MVWRm2)-0.5_dp*rMS,dp) 
coupL1 = cplcUFdFuVWRmL(gO1,i2)
coupR1 = cplcUFdFuVWRmR(gO1,i2)
coupL2 =  Conjg(cplcUFdFuVWRmL(gO2,i2))
coupR2 =  Conjg(cplcUFdFuVWRmR(gO2,i2))
SumSL(gO1,gO2) = coupL1*coupR2*B0m2 
SumSR(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
    End Do 
 SigL = oo16pi2*SigL 
SigR = oo16pi2*SigR 
SigSL = oo16pi2*SigSL 
SigSR = oo16pi2*SigSR 
 
End Subroutine Sigma1LoopFd 
 
Subroutine OneLoopFu(YQ1,k1,MFu,MFu2,MAh,MAh2,MVWLm,MVWLm2,MFd,MFd2,MVWRm,            & 
& MVWRm2,MHpm,MHpm2,Mhh,Mhh2,MVZ,MVZ2,MVZR,MVZR2,cplcUFuFuAhL,cplcUFuFuAhR,              & 
& cplcUFuFdcVWLmL,cplcUFuFdcVWLmR,cplcUFuFdcVWRmL,cplcUFuFdcVWRmR,cplcUFuFdHpmL,         & 
& cplcUFuFdHpmR,cplcUFuFuhhL,cplcUFuFuhhR,cplcUFuFuVGL,cplcUFuFuVGR,cplcUFuFuVPL,        & 
& cplcUFuFuVPR,cplcUFuFuVZL,cplcUFuFuVZR,cplcUFuFuVZRL,cplcUFuFuVZRR,delta,              & 
& MFu_1L,MFu2_1L,ZUL_1L,ZUR_1L,ierr)

Implicit None 
Real(dp), Intent(in) :: MFu(3),MFu2(3),MAh(4),MAh2(4),MVWLm,MVWLm2,MFd(3),MFd2(3),MVWRm,MVWRm2,               & 
& MHpm(4),MHpm2(4),Mhh(4),Mhh2(4),MVZ,MVZ2,MVZR,MVZR2

Real(dp), Intent(in) :: k1

Complex(dp), Intent(in) :: YQ1(3,3)

Complex(dp), Intent(in) :: cplcUFuFuAhL(3,3,4),cplcUFuFuAhR(3,3,4),cplcUFuFdcVWLmL(3,3),cplcUFuFdcVWLmR(3,3),    & 
& cplcUFuFdcVWRmL(3,3),cplcUFuFdcVWRmR(3,3),cplcUFuFdHpmL(3,3,4),cplcUFuFdHpmR(3,3,4),   & 
& cplcUFuFuhhL(3,3,4),cplcUFuFuhhR(3,3,4),cplcUFuFuVGL(3,3),cplcUFuFuVGR(3,3),           & 
& cplcUFuFuVPL(3,3),cplcUFuFuVPR(3,3),cplcUFuFuVZL(3,3),cplcUFuFuVZR(3,3),               & 
& cplcUFuFuVZRL(3,3),cplcUFuFuVZRR(3,3)

Complex(dp) :: mat1a(3,3), mat1(3,3) 
Integer , Intent(inout):: ierr 
Integer :: i1,i2,i3,i4,j1,j2,j3,j4,il,i_count 
Real(dp), Intent(in) :: delta 
Real(dp) :: mi2(3), test_m2(3), p2 
Real(dp), Intent(out) :: MFu_1L(3),MFu2_1L(3) 
 Complex(dp), Intent(out) :: ZUL_1L(3,3), ZUR_1L(3,3) 
 
 Real(dp) :: MFu_t(3),MFu2_t(3) 
 Complex(dp) :: ZUL_t(3,3), ZUR_t(3,3), sigL(3,3), sigR(3,3), sigSL(3,3), sigSR(3,3) 
 
 Complex(dp) :: mat(3,3)=0._dp, mat2(3,3)=0._dp, phaseM 

Complex(dp) :: ZUL2(3,3), ZUR2(3,3) 
 
 Real(dp) :: ZUL1(3,3), ZUR1(3,3), test(2) 
 
 Iname = Iname + 1 
NameOfUnit(Iname) = 'OneLoopMFu'
 
mat1a(1,1) = 0._dp 
mat1a(1,1) = mat1a(1,1)+(k1*Conjg(YQ1(1,1)))/sqrt(2._dp)
mat1a(1,2) = 0._dp 
mat1a(1,2) = mat1a(1,2)+(k1*Conjg(YQ1(1,2)))/sqrt(2._dp)
mat1a(1,3) = 0._dp 
mat1a(1,3) = mat1a(1,3)+(k1*Conjg(YQ1(1,3)))/sqrt(2._dp)
mat1a(2,1) = 0._dp 
mat1a(2,1) = mat1a(2,1)+(k1*Conjg(YQ1(2,1)))/sqrt(2._dp)
mat1a(2,2) = 0._dp 
mat1a(2,2) = mat1a(2,2)+(k1*Conjg(YQ1(2,2)))/sqrt(2._dp)
mat1a(2,3) = 0._dp 
mat1a(2,3) = mat1a(2,3)+(k1*Conjg(YQ1(2,3)))/sqrt(2._dp)
mat1a(3,1) = 0._dp 
mat1a(3,1) = mat1a(3,1)+(k1*Conjg(YQ1(3,1)))/sqrt(2._dp)
mat1a(3,2) = 0._dp 
mat1a(3,2) = mat1a(3,2)+(k1*Conjg(YQ1(3,2)))/sqrt(2._dp)
mat1a(3,3) = 0._dp 
mat1a(3,3) = mat1a(3,3)+(k1*Conjg(YQ1(3,3)))/sqrt(2._dp)

 
 !---------------------------------------- 
! Rotation matrix for p2=0 
!----------------------------------------- 
 
sigL=0._dp 
sigR=0._dp 
sigSL=0._dp 
sigSR=0._dp 
p2 = 0._dp 
Call Sigma1LoopFu(p2,MFu,MFu2,MAh,MAh2,MVWLm,MVWLm2,MFd,MFd2,MVWRm,MVWRm2,            & 
& MHpm,MHpm2,Mhh,Mhh2,MVZ,MVZ2,MVZR,MVZR2,cplcUFuFuAhL,cplcUFuFuAhR,cplcUFuFdcVWLmL,     & 
& cplcUFuFdcVWLmR,cplcUFuFdcVWRmL,cplcUFuFdcVWRmR,cplcUFuFdHpmL,cplcUFuFdHpmR,           & 
& cplcUFuFuhhL,cplcUFuFuhhR,cplcUFuFuVGL,cplcUFuFuVGR,cplcUFuFuVPL,cplcUFuFuVPR,         & 
& cplcUFuFuVZL,cplcUFuFuVZR,cplcUFuFuVZRL,cplcUFuFuVZRR,sigL,sigR,sigSL,sigSR)

mat1 = mat1a - SigSL - 0.5_dp*(MatMul(SigR,mat1a) + MatMul(mat1a,SigL)) 
 
mat2 = Matmul(Transpose(Conjg(mat1)),mat1) 
If (ForceRealMatrices) mat2 = Real(mat2,dp) 
If (Maxval(Abs(Aimag(mat2))).Eq.0._dp) Then 
Call EigenSystem(Real(mat2,dp),MFu2_t,ZUR1,ierr,test) 
ZUR2 = ZUR1 
Else 
Call EigenSystem(mat2,MFu2_t,ZUR2,ierr,test) 
 End If 
 
ZUROS_0 = ZUR2 
 mat2 = Matmul(mat1,Transpose(Conjg(mat1))) 
If (ForceRealMatrices) mat2 = Real(mat2,dp) 
If (Maxval(Abs(Aimag(mat2))).Eq.0._dp) Then 
Call EigenSystem(Real(mat2,dp),MFu2_t,ZUL1,ierr,test) 
 
 
ZUL2 = ZUL1 
Else 
Call EigenSystem(mat2,MFu2_t,ZUL2,ierr,test) 
 
 
End If 
ZUL2 = Conjg(ZUL2) 
ZULOS_0 = ZUL2 
 
!---------------------------------------- 
! Now, with momenta
!----------------------------------------- 
 
Do il=3,1,-1
sigL=0._dp 
sigR=0._dp 
sigSL=0._dp 
sigSR=0._dp 
p2 = MFu2(il) 
Call Sigma1LoopFu(p2,MFu,MFu2,MAh,MAh2,MVWLm,MVWLm2,MFd,MFd2,MVWRm,MVWRm2,            & 
& MHpm,MHpm2,Mhh,Mhh2,MVZ,MVZ2,MVZR,MVZR2,cplcUFuFuAhL,cplcUFuFuAhR,cplcUFuFdcVWLmL,     & 
& cplcUFuFdcVWLmR,cplcUFuFdcVWRmL,cplcUFuFdcVWRmR,cplcUFuFdHpmL,cplcUFuFdHpmR,           & 
& cplcUFuFuhhL,cplcUFuFuhhR,cplcUFuFuVGL,cplcUFuFuVGR,cplcUFuFuVPL,cplcUFuFuVPR,         & 
& cplcUFuFuVZL,cplcUFuFuVZR,cplcUFuFuVZRL,cplcUFuFuVZRR,sigL,sigR,sigSL,sigSR)

mat1 = mat1a - SigSL - 0.5_dp*(MatMul(SigR,mat1a) + MatMul(mat1a,SigL)) 
 
mat2 = Matmul(Transpose(Conjg(mat1)),mat1) 
If (ForceRealMatrices) mat2 = Real(mat2,dp) 
If (Maxval(Abs(Aimag(mat2))).Eq.0._dp) Then 
Call EigenSystem(Real(mat2,dp),MFu2_t,ZUR1,ierr,test) 
ZUR2 = ZUR1 
Else 
Call EigenSystem(mat2,MFu2_t,ZUR2,ierr,test) 
 End If 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
  ierr = 0 
End If 
 
!---------------------------------------- 
! Redoing Calculation using redefined p2 
!----------------------------------------- 
 
i_count = 0 
p2_loop: Do  
i_count = i_count + 1 
sigL=0._dp 
sigR=0._dp 
sigSL=0._dp 
sigSR=0._dp 
p2 = MFu2_t(iL)
Call Sigma1LoopFu(p2,MFu,MFu2,MAh,MAh2,MVWLm,MVWLm2,MFd,MFd2,MVWRm,MVWRm2,            & 
& MHpm,MHpm2,Mhh,Mhh2,MVZ,MVZ2,MVZR,MVZR2,cplcUFuFuAhL,cplcUFuFuAhR,cplcUFuFdcVWLmL,     & 
& cplcUFuFdcVWLmR,cplcUFuFdcVWRmL,cplcUFuFdcVWRmR,cplcUFuFdHpmL,cplcUFuFdHpmR,           & 
& cplcUFuFuhhL,cplcUFuFuhhR,cplcUFuFuVGL,cplcUFuFuVGR,cplcUFuFuVPL,cplcUFuFuVPR,         & 
& cplcUFuFuVZL,cplcUFuFuVZR,cplcUFuFuVZRL,cplcUFuFuVZRR,sigL,sigR,sigSL,sigSR)

mat1 = mat1a - SigSL - 0.5_dp*(MatMul(SigR,mat1a) + MatMul(mat1a,SigL)) 
 
mat2 = Matmul(Transpose(Conjg(mat1)),mat1) 
If (ForceRealMatrices) mat2 = Real(mat2,dp) 
If (Maxval(Abs(Aimag(mat2))).Eq.0._dp) Then 
Call EigenSystem(Real(mat2,dp),MFu2_t,ZUR1,ierr,test) 
ZUR2 = ZUR1 
Else 
Call EigenSystem(mat2,MFu2_t,ZUR2,ierr,test) 
 End If 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
  ierr = 0 
End If 
 
MFu2_1L(il) = MFu2_t(il) 
MFu_1L(il) = Sqrt(MFu2_1L(il)) 
 
If (p2.Ne.0._dp) Then 
  test(1) = Abs(MFu2_1L(il)-p2)/p2
Else 
  test(2) = Abs(MFu2_1L(il))
End If 
If (Abs(MFu2_1L(il)).lt.1.0E-30_dp) Exit p2_loop 
If (test(1).lt.0.1_dp*delta) Exit p2_loop 
If(i_count.gt.30) then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  Exit p2_loop 
End if
End Do p2_loop 
mat2 = Matmul(mat1,Transpose(Conjg(mat1))) 
If (ForceRealMatrices) mat2 = Real(mat2,dp) 
If (Maxval(Abs(Aimag(mat2))).Eq.0._dp) Then 
Call EigenSystem(Real(mat2,dp),MFu2_t,ZUL1,ierr,test) 
 
 
ZUL2 = ZUL1 
Else 
Call EigenSystem(mat2,MFu2_t,ZUL2,ierr,test) 
 
 
End If 
ZUL2 = Conjg(ZUL2) 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
  ierr = 0 
End If 
 
mat2 = Matmul(Matmul( Conjg(ZUL2),mat1),Transpose( Conjg(ZUR2))) 
Do i1=1,3
If (Abs(mat2(i1,i1)).gt.0._dp) Then 
phaseM = mat2(i1,i1) / Abs(mat2(i1,i1)) 
ZUR2(i1,:) = phaseM *ZUR2(i1,:) 
 End if 
End Do 
 
ZULOS_p2(il,:) = ZUL2(il,:) 
 ZUROS_p2(il,:) = ZUR2(il,:) 
 ZUL_1L = ZUL2 
 ZUR_1L = ZUR2 
 End Do  
 
Iname = Iname -1 
End Subroutine OneLoopFu
 
 
Subroutine Sigma1LoopFu(p2,MFu,MFu2,MAh,MAh2,MVWLm,MVWLm2,MFd,MFd2,MVWRm,             & 
& MVWRm2,MHpm,MHpm2,Mhh,Mhh2,MVZ,MVZ2,MVZR,MVZR2,cplcUFuFuAhL,cplcUFuFuAhR,              & 
& cplcUFuFdcVWLmL,cplcUFuFdcVWLmR,cplcUFuFdcVWRmL,cplcUFuFdcVWRmR,cplcUFuFdHpmL,         & 
& cplcUFuFdHpmR,cplcUFuFuhhL,cplcUFuFuhhR,cplcUFuFuVGL,cplcUFuFuVGR,cplcUFuFuVPL,        & 
& cplcUFuFuVPR,cplcUFuFuVZL,cplcUFuFuVZR,cplcUFuFuVZRL,cplcUFuFuVZRR,sigL,               & 
& sigR,sigSL,sigSR)

Implicit None 
Real(dp), Intent(in) :: MFu(3),MFu2(3),MAh(4),MAh2(4),MVWLm,MVWLm2,MFd(3),MFd2(3),MVWRm,MVWRm2,               & 
& MHpm(4),MHpm2(4),Mhh(4),Mhh2(4),MVZ,MVZ2,MVZR,MVZR2

Complex(dp), Intent(in) :: cplcUFuFuAhL(3,3,4),cplcUFuFuAhR(3,3,4),cplcUFuFdcVWLmL(3,3),cplcUFuFdcVWLmR(3,3),    & 
& cplcUFuFdcVWRmL(3,3),cplcUFuFdcVWRmR(3,3),cplcUFuFdHpmL(3,3,4),cplcUFuFdHpmR(3,3,4),   & 
& cplcUFuFuhhL(3,3,4),cplcUFuFuhhR(3,3,4),cplcUFuFuVGL(3,3),cplcUFuFuVGR(3,3),           & 
& cplcUFuFuVPL(3,3),cplcUFuFuVPR(3,3),cplcUFuFuVZL(3,3),cplcUFuFuVZR(3,3),               & 
& cplcUFuFuVZRL(3,3),cplcUFuFuVZRR(3,3)

Complex(dp), Intent(out) :: SigL(3,3),SigR(3,3), SigSL(3,3), SigSR(3,3) 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2,temp, sumL(3,3), sumR(3,3), sumSL(3,3), sumSR(3,3) 
Real(dp) :: B0m2, F0m2, G0m2,B1m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
SigL = Cmplx(0._dp,0._dp,dp) 
SigR = Cmplx(0._dp,0._dp,dp) 
SigSL = Cmplx(0._dp,0._dp,dp) 
 SigSR = Cmplx(0._dp,0._dp,dp) 
 
!------------------------ 
! Fu, Ah 
!------------------------ 
    Do i1 = 1, 3
       Do i2 = 1, 4
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -Real(SA_B1(p2,MFu2(i1),MAh2(i2)),dp) 
B0m2 = MFu(i1)*Real(SA_B0(p2,MFu2(i1),MAh2(i2)),dp) 
coupL1 = cplcUFuFuAhL(gO1,i1,i2)
coupR1 = cplcUFuFuAhR(gO1,i1,i2)
coupL2 =  Conjg(cplcUFuFuAhL(gO2,i1,i2))
coupR2 =  Conjg(cplcUFuFuAhR(gO2,i1,i2))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! conj[VWLm], Fd 
!------------------------ 
      Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -2._dp*Real(SA_B1(p2,MFd2(i2),MVWLm2)+ 0.5_dp*rMS,dp) 
B0m2 = -4._dp*MFd(i2)*Real(SA_B0(p2,MFd2(i2),MVWLm2)-0.5_dp*rMS,dp) 
coupL1 = cplcUFuFdcVWLmL(gO1,i2)
coupR1 = cplcUFuFdcVWLmR(gO1,i2)
coupL2 =  Conjg(cplcUFuFdcVWLmL(gO2,i2))
coupR2 =  Conjg(cplcUFuFdcVWLmR(gO2,i2))
SumSL(gO1,gO2) = coupL1*coupR2*B0m2 
SumSR(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
    End Do 
 !------------------------ 
! conj[VWRm], Fd 
!------------------------ 
      Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -2._dp*Real(SA_B1(p2,MFd2(i2),MVWRm2)+ 0.5_dp*rMS,dp) 
B0m2 = -4._dp*MFd(i2)*Real(SA_B0(p2,MFd2(i2),MVWRm2)-0.5_dp*rMS,dp) 
coupL1 = cplcUFuFdcVWRmL(gO1,i2)
coupR1 = cplcUFuFdcVWRmR(gO1,i2)
coupL2 =  Conjg(cplcUFuFdcVWRmL(gO2,i2))
coupR2 =  Conjg(cplcUFuFdcVWRmR(gO2,i2))
SumSL(gO1,gO2) = coupL1*coupR2*B0m2 
SumSR(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
    End Do 
 !------------------------ 
! Hpm, Fd 
!------------------------ 
    Do i1 = 1, 4
       Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -Real(SA_B1(p2,MFd2(i2),MHpm2(i1)),dp) 
B0m2 = MFd(i2)*Real(SA_B0(p2,MFd2(i2),MHpm2(i1)),dp) 
coupL1 = cplcUFuFdHpmL(gO1,i2,i1)
coupR1 = cplcUFuFdHpmR(gO1,i2,i1)
coupL2 =  Conjg(cplcUFuFdHpmL(gO2,i2,i1))
coupR2 =  Conjg(cplcUFuFdHpmR(gO2,i2,i1))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! hh, Fu 
!------------------------ 
    Do i1 = 1, 4
       Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -Real(SA_B1(p2,MFu2(i2),Mhh2(i1)),dp) 
B0m2 = MFu(i2)*Real(SA_B0(p2,MFu2(i2),Mhh2(i1)),dp) 
coupL1 = cplcUFuFuhhL(gO1,i2,i1)
coupR1 = cplcUFuFuhhR(gO1,i2,i1)
coupL2 =  Conjg(cplcUFuFuhhL(gO2,i2,i1))
coupR2 =  Conjg(cplcUFuFuhhR(gO2,i2,i1))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! VG, Fu 
!------------------------ 
      Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -2._dp*Real(SA_B1(p2,MFu2(i2),0._dp)+ 0.5_dp*rMS,dp) 
B0m2 = -4._dp*MFu(i2)*Real(SA_B0(p2,MFu2(i2),0._dp)-0.5_dp*rMS,dp) 
coupL1 = cplcUFuFuVGL(gO1,i2)
coupR1 = cplcUFuFuVGR(gO1,i2)
coupL2 =  Conjg(cplcUFuFuVGL(gO2,i2))
coupR2 =  Conjg(cplcUFuFuVGR(gO2,i2))
SumSL(gO1,gO2) = coupL1*coupR2*B0m2 
SumSR(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +4._dp/3._dp* sumL
SigR = SigR +4._dp/3._dp* sumR 
SigSL = SigSL +4._dp/3._dp* sumSL 
SigSR = SigSR +4._dp/3._dp* sumSR 
    End Do 
 !------------------------ 
! VP, Fu 
!------------------------ 
      Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -2._dp*Real(SA_B1(p2,MFu2(i2),0._dp)+ 0.5_dp*rMS,dp) 
B0m2 = -4._dp*MFu(i2)*Real(SA_B0(p2,MFu2(i2),0._dp)-0.5_dp*rMS,dp) 
coupL1 = cplcUFuFuVPL(gO1,i2)
coupR1 = cplcUFuFuVPR(gO1,i2)
coupL2 =  Conjg(cplcUFuFuVPL(gO2,i2))
coupR2 =  Conjg(cplcUFuFuVPR(gO2,i2))
SumSL(gO1,gO2) = coupL1*coupR2*B0m2 
SumSR(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
    End Do 
 !------------------------ 
! VZ, Fu 
!------------------------ 
      Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -2._dp*Real(SA_B1(p2,MFu2(i2),MVZ2)+ 0.5_dp*rMS,dp) 
B0m2 = -4._dp*MFu(i2)*Real(SA_B0(p2,MFu2(i2),MVZ2)-0.5_dp*rMS,dp) 
coupL1 = cplcUFuFuVZL(gO1,i2)
coupR1 = cplcUFuFuVZR(gO1,i2)
coupL2 =  Conjg(cplcUFuFuVZL(gO2,i2))
coupR2 =  Conjg(cplcUFuFuVZR(gO2,i2))
SumSL(gO1,gO2) = coupL1*coupR2*B0m2 
SumSR(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
    End Do 
 !------------------------ 
! VZR, Fu 
!------------------------ 
      Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -2._dp*Real(SA_B1(p2,MFu2(i2),MVZR2)+ 0.5_dp*rMS,dp) 
B0m2 = -4._dp*MFu(i2)*Real(SA_B0(p2,MFu2(i2),MVZR2)-0.5_dp*rMS,dp) 
coupL1 = cplcUFuFuVZRL(gO1,i2)
coupR1 = cplcUFuFuVZRR(gO1,i2)
coupL2 =  Conjg(cplcUFuFuVZRL(gO2,i2))
coupR2 =  Conjg(cplcUFuFuVZRR(gO2,i2))
SumSL(gO1,gO2) = coupL1*coupR2*B0m2 
SumSR(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
    End Do 
 SigL = oo16pi2*SigL 
SigR = oo16pi2*SigR 
SigSL = oo16pi2*SigSL 
SigSR = oo16pi2*SigSR 
 
End Subroutine Sigma1LoopFu 
 
Subroutine OneLoopFe(Yt,k1,MFe,MFe2,MAh,MAh2,Mhh,Mhh2,MVZ,MVZ2,MVZR,MVZR2,            & 
& MHpm,MHpm2,MFv,MFv2,MVWLm,MVWLm2,MVWRm,MVWRm2,cplcUFeFeAhL,cplcUFeFeAhR,               & 
& cplcUFeFehhL,cplcUFeFehhR,cplcUFeFeVPL,cplcUFeFeVPR,cplcUFeFeVZL,cplcUFeFeVZR,         & 
& cplcUFeFeVZRL,cplcUFeFeVZRR,cplcUFeFvcHpmL,cplcUFeFvcHpmR,cplcUFeFvVWLmL,              & 
& cplcUFeFvVWLmR,cplcUFeFvVWRmL,cplcUFeFvVWRmR,delta,MFe_1L,MFe2_1L,ZEL_1L,              & 
& ZER_1L,ierr)

Implicit None 
Real(dp), Intent(in) :: MFe(3),MFe2(3),MAh(4),MAh2(4),Mhh(4),Mhh2(4),MVZ,MVZ2,MVZR,MVZR2,MHpm(4),             & 
& MHpm2(4),MFv(9),MFv2(9),MVWLm,MVWLm2,MVWRm,MVWRm2

Real(dp), Intent(in) :: k1

Complex(dp), Intent(in) :: Yt(3,3)

Complex(dp), Intent(in) :: cplcUFeFeAhL(3,3,4),cplcUFeFeAhR(3,3,4),cplcUFeFehhL(3,3,4),cplcUFeFehhR(3,3,4),      & 
& cplcUFeFeVPL(3,3),cplcUFeFeVPR(3,3),cplcUFeFeVZL(3,3),cplcUFeFeVZR(3,3),               & 
& cplcUFeFeVZRL(3,3),cplcUFeFeVZRR(3,3),cplcUFeFvcHpmL(3,9,4),cplcUFeFvcHpmR(3,9,4),     & 
& cplcUFeFvVWLmL(3,9),cplcUFeFvVWLmR(3,9),cplcUFeFvVWRmL(3,9),cplcUFeFvVWRmR(3,9)

Complex(dp) :: mat1a(3,3), mat1(3,3) 
Integer , Intent(inout):: ierr 
Integer :: i1,i2,i3,i4,j1,j2,j3,j4,il,i_count 
Real(dp), Intent(in) :: delta 
Real(dp) :: mi2(3), test_m2(3), p2 
Real(dp), Intent(out) :: MFe_1L(3),MFe2_1L(3) 
 Complex(dp), Intent(out) :: ZEL_1L(3,3), ZER_1L(3,3) 
 
 Real(dp) :: MFe_t(3),MFe2_t(3) 
 Complex(dp) :: ZEL_t(3,3), ZER_t(3,3), sigL(3,3), sigR(3,3), sigSL(3,3), sigSR(3,3) 
 
 Complex(dp) :: mat(3,3)=0._dp, mat2(3,3)=0._dp, phaseM 

Complex(dp) :: ZEL2(3,3), ZER2(3,3) 
 
 Real(dp) :: ZEL1(3,3), ZER1(3,3), test(2) 
 
 Iname = Iname + 1 
NameOfUnit(Iname) = 'OneLoopMFe'
 
mat1a(1,1) = 0._dp 
mat1a(1,1) = mat1a(1,1)+(k1*Conjg(Yt(1,1)))/sqrt(2._dp)
mat1a(1,2) = 0._dp 
mat1a(1,2) = mat1a(1,2)+(k1*Conjg(Yt(1,2)))/sqrt(2._dp)
mat1a(1,3) = 0._dp 
mat1a(1,3) = mat1a(1,3)+(k1*Conjg(Yt(1,3)))/sqrt(2._dp)
mat1a(2,1) = 0._dp 
mat1a(2,1) = mat1a(2,1)+(k1*Conjg(Yt(2,1)))/sqrt(2._dp)
mat1a(2,2) = 0._dp 
mat1a(2,2) = mat1a(2,2)+(k1*Conjg(Yt(2,2)))/sqrt(2._dp)
mat1a(2,3) = 0._dp 
mat1a(2,3) = mat1a(2,3)+(k1*Conjg(Yt(2,3)))/sqrt(2._dp)
mat1a(3,1) = 0._dp 
mat1a(3,1) = mat1a(3,1)+(k1*Conjg(Yt(3,1)))/sqrt(2._dp)
mat1a(3,2) = 0._dp 
mat1a(3,2) = mat1a(3,2)+(k1*Conjg(Yt(3,2)))/sqrt(2._dp)
mat1a(3,3) = 0._dp 
mat1a(3,3) = mat1a(3,3)+(k1*Conjg(Yt(3,3)))/sqrt(2._dp)

 
 !---------------------------------------- 
! Rotation matrix for p2=0 
!----------------------------------------- 
 
sigL=0._dp 
sigR=0._dp 
sigSL=0._dp 
sigSR=0._dp 
p2 = 0._dp 
Call Sigma1LoopFe(p2,MFe,MFe2,MAh,MAh2,Mhh,Mhh2,MVZ,MVZ2,MVZR,MVZR2,MHpm,             & 
& MHpm2,MFv,MFv2,MVWLm,MVWLm2,MVWRm,MVWRm2,cplcUFeFeAhL,cplcUFeFeAhR,cplcUFeFehhL,       & 
& cplcUFeFehhR,cplcUFeFeVPL,cplcUFeFeVPR,cplcUFeFeVZL,cplcUFeFeVZR,cplcUFeFeVZRL,        & 
& cplcUFeFeVZRR,cplcUFeFvcHpmL,cplcUFeFvcHpmR,cplcUFeFvVWLmL,cplcUFeFvVWLmR,             & 
& cplcUFeFvVWRmL,cplcUFeFvVWRmR,sigL,sigR,sigSL,sigSR)

mat1 = mat1a - SigSL - 0.5_dp*(MatMul(SigR,mat1a) + MatMul(mat1a,SigL)) 
 
mat2 = Matmul(Transpose(Conjg(mat1)),mat1) 
If (ForceRealMatrices) mat2 = Real(mat2,dp) 
If (Maxval(Abs(Aimag(mat2))).Eq.0._dp) Then 
Call EigenSystem(Real(mat2,dp),MFe2_t,ZER1,ierr,test) 
ZER2 = ZER1 
Else 
Call EigenSystem(mat2,MFe2_t,ZER2,ierr,test) 
 End If 
 
ZEROS_0 = ZER2 
 mat2 = Matmul(mat1,Transpose(Conjg(mat1))) 
If (ForceRealMatrices) mat2 = Real(mat2,dp) 
If (Maxval(Abs(Aimag(mat2))).Eq.0._dp) Then 
Call EigenSystem(Real(mat2,dp),MFe2_t,ZEL1,ierr,test) 
 
 
ZEL2 = ZEL1 
Else 
Call EigenSystem(mat2,MFe2_t,ZEL2,ierr,test) 
 
 
End If 
ZEL2 = Conjg(ZEL2) 
ZELOS_0 = ZEL2 
 
!---------------------------------------- 
! Now, with momenta
!----------------------------------------- 
 
Do il=3,1,-1
sigL=0._dp 
sigR=0._dp 
sigSL=0._dp 
sigSR=0._dp 
p2 = MFe2(il) 
Call Sigma1LoopFe(p2,MFe,MFe2,MAh,MAh2,Mhh,Mhh2,MVZ,MVZ2,MVZR,MVZR2,MHpm,             & 
& MHpm2,MFv,MFv2,MVWLm,MVWLm2,MVWRm,MVWRm2,cplcUFeFeAhL,cplcUFeFeAhR,cplcUFeFehhL,       & 
& cplcUFeFehhR,cplcUFeFeVPL,cplcUFeFeVPR,cplcUFeFeVZL,cplcUFeFeVZR,cplcUFeFeVZRL,        & 
& cplcUFeFeVZRR,cplcUFeFvcHpmL,cplcUFeFvcHpmR,cplcUFeFvVWLmL,cplcUFeFvVWLmR,             & 
& cplcUFeFvVWRmL,cplcUFeFvVWRmR,sigL,sigR,sigSL,sigSR)

mat1 = mat1a - SigSL - 0.5_dp*(MatMul(SigR,mat1a) + MatMul(mat1a,SigL)) 
 
mat2 = Matmul(Transpose(Conjg(mat1)),mat1) 
If (ForceRealMatrices) mat2 = Real(mat2,dp) 
If (Maxval(Abs(Aimag(mat2))).Eq.0._dp) Then 
Call EigenSystem(Real(mat2,dp),MFe2_t,ZER1,ierr,test) 
ZER2 = ZER1 
Else 
Call EigenSystem(mat2,MFe2_t,ZER2,ierr,test) 
 End If 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
  ierr = 0 
End If 
 
!---------------------------------------- 
! Redoing Calculation using redefined p2 
!----------------------------------------- 
 
i_count = 0 
p2_loop: Do  
i_count = i_count + 1 
sigL=0._dp 
sigR=0._dp 
sigSL=0._dp 
sigSR=0._dp 
p2 = MFe2_t(iL)
Call Sigma1LoopFe(p2,MFe,MFe2,MAh,MAh2,Mhh,Mhh2,MVZ,MVZ2,MVZR,MVZR2,MHpm,             & 
& MHpm2,MFv,MFv2,MVWLm,MVWLm2,MVWRm,MVWRm2,cplcUFeFeAhL,cplcUFeFeAhR,cplcUFeFehhL,       & 
& cplcUFeFehhR,cplcUFeFeVPL,cplcUFeFeVPR,cplcUFeFeVZL,cplcUFeFeVZR,cplcUFeFeVZRL,        & 
& cplcUFeFeVZRR,cplcUFeFvcHpmL,cplcUFeFvcHpmR,cplcUFeFvVWLmL,cplcUFeFvVWLmR,             & 
& cplcUFeFvVWRmL,cplcUFeFvVWRmR,sigL,sigR,sigSL,sigSR)

mat1 = mat1a - SigSL - 0.5_dp*(MatMul(SigR,mat1a) + MatMul(mat1a,SigL)) 
 
mat2 = Matmul(Transpose(Conjg(mat1)),mat1) 
If (ForceRealMatrices) mat2 = Real(mat2,dp) 
If (Maxval(Abs(Aimag(mat2))).Eq.0._dp) Then 
Call EigenSystem(Real(mat2,dp),MFe2_t,ZER1,ierr,test) 
ZER2 = ZER1 
Else 
Call EigenSystem(mat2,MFe2_t,ZER2,ierr,test) 
 End If 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
  ierr = 0 
End If 
 
MFe2_1L(il) = MFe2_t(il) 
MFe_1L(il) = Sqrt(MFe2_1L(il)) 
 
If (p2.Ne.0._dp) Then 
  test(1) = Abs(MFe2_1L(il)-p2)/p2
Else 
  test(2) = Abs(MFe2_1L(il))
End If 
If (Abs(MFe2_1L(il)).lt.1.0E-30_dp) Exit p2_loop 
If (test(1).lt.0.1_dp*delta) Exit p2_loop 
If(i_count.gt.30) then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  Exit p2_loop 
End if
End Do p2_loop 
mat2 = Matmul(mat1,Transpose(Conjg(mat1))) 
If (ForceRealMatrices) mat2 = Real(mat2,dp) 
If (Maxval(Abs(Aimag(mat2))).Eq.0._dp) Then 
Call EigenSystem(Real(mat2,dp),MFe2_t,ZEL1,ierr,test) 
 
 
ZEL2 = ZEL1 
Else 
Call EigenSystem(mat2,MFe2_t,ZEL2,ierr,test) 
 
 
End If 
ZEL2 = Conjg(ZEL2) 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
  ierr = 0 
End If 
 
mat2 = Matmul(Matmul( Conjg(ZEL2),mat1),Transpose( Conjg(ZER2))) 
Do i1=1,3
If (Abs(mat2(i1,i1)).gt.0._dp) Then 
phaseM = mat2(i1,i1) / Abs(mat2(i1,i1)) 
ZER2(i1,:) = phaseM *ZER2(i1,:) 
 End if 
End Do 
 
ZELOS_p2(il,:) = ZEL2(il,:) 
 ZEROS_p2(il,:) = ZER2(il,:) 
 ZEL_1L = ZEL2 
 ZER_1L = ZER2 
 End Do  
 
Iname = Iname -1 
End Subroutine OneLoopFe
 
 
Subroutine Sigma1LoopFe(p2,MFe,MFe2,MAh,MAh2,Mhh,Mhh2,MVZ,MVZ2,MVZR,MVZR2,            & 
& MHpm,MHpm2,MFv,MFv2,MVWLm,MVWLm2,MVWRm,MVWRm2,cplcUFeFeAhL,cplcUFeFeAhR,               & 
& cplcUFeFehhL,cplcUFeFehhR,cplcUFeFeVPL,cplcUFeFeVPR,cplcUFeFeVZL,cplcUFeFeVZR,         & 
& cplcUFeFeVZRL,cplcUFeFeVZRR,cplcUFeFvcHpmL,cplcUFeFvcHpmR,cplcUFeFvVWLmL,              & 
& cplcUFeFvVWLmR,cplcUFeFvVWRmL,cplcUFeFvVWRmR,sigL,sigR,sigSL,sigSR)

Implicit None 
Real(dp), Intent(in) :: MFe(3),MFe2(3),MAh(4),MAh2(4),Mhh(4),Mhh2(4),MVZ,MVZ2,MVZR,MVZR2,MHpm(4),             & 
& MHpm2(4),MFv(9),MFv2(9),MVWLm,MVWLm2,MVWRm,MVWRm2

Complex(dp), Intent(in) :: cplcUFeFeAhL(3,3,4),cplcUFeFeAhR(3,3,4),cplcUFeFehhL(3,3,4),cplcUFeFehhR(3,3,4),      & 
& cplcUFeFeVPL(3,3),cplcUFeFeVPR(3,3),cplcUFeFeVZL(3,3),cplcUFeFeVZR(3,3),               & 
& cplcUFeFeVZRL(3,3),cplcUFeFeVZRR(3,3),cplcUFeFvcHpmL(3,9,4),cplcUFeFvcHpmR(3,9,4),     & 
& cplcUFeFvVWLmL(3,9),cplcUFeFvVWLmR(3,9),cplcUFeFvVWRmL(3,9),cplcUFeFvVWRmR(3,9)

Complex(dp), Intent(out) :: SigL(3,3),SigR(3,3), SigSL(3,3), SigSR(3,3) 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2,temp, sumL(3,3), sumR(3,3), sumSL(3,3), sumSR(3,3) 
Real(dp) :: B0m2, F0m2, G0m2,B1m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
SigL = Cmplx(0._dp,0._dp,dp) 
SigR = Cmplx(0._dp,0._dp,dp) 
SigSL = Cmplx(0._dp,0._dp,dp) 
 SigSR = Cmplx(0._dp,0._dp,dp) 
 
!------------------------ 
! Fe, Ah 
!------------------------ 
    Do i1 = 1, 3
       Do i2 = 1, 4
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -Real(SA_B1(p2,MFe2(i1),MAh2(i2)),dp) 
B0m2 = MFe(i1)*Real(SA_B0(p2,MFe2(i1),MAh2(i2)),dp) 
coupL1 = cplcUFeFeAhL(gO1,i1,i2)
coupR1 = cplcUFeFeAhR(gO1,i1,i2)
coupL2 =  Conjg(cplcUFeFeAhL(gO2,i1,i2))
coupR2 =  Conjg(cplcUFeFeAhR(gO2,i1,i2))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! hh, Fe 
!------------------------ 
    Do i1 = 1, 4
       Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -Real(SA_B1(p2,MFe2(i2),Mhh2(i1)),dp) 
B0m2 = MFe(i2)*Real(SA_B0(p2,MFe2(i2),Mhh2(i1)),dp) 
coupL1 = cplcUFeFehhL(gO1,i2,i1)
coupR1 = cplcUFeFehhR(gO1,i2,i1)
coupL2 =  Conjg(cplcUFeFehhL(gO2,i2,i1))
coupR2 =  Conjg(cplcUFeFehhR(gO2,i2,i1))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! VP, Fe 
!------------------------ 
      Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -2._dp*Real(SA_B1(p2,MFe2(i2),0._dp)+ 0.5_dp*rMS,dp) 
B0m2 = -4._dp*MFe(i2)*Real(SA_B0(p2,MFe2(i2),0._dp)-0.5_dp*rMS,dp) 
coupL1 = cplcUFeFeVPL(gO1,i2)
coupR1 = cplcUFeFeVPR(gO1,i2)
coupL2 =  Conjg(cplcUFeFeVPL(gO2,i2))
coupR2 =  Conjg(cplcUFeFeVPR(gO2,i2))
SumSL(gO1,gO2) = coupL1*coupR2*B0m2 
SumSR(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
    End Do 
 !------------------------ 
! VZ, Fe 
!------------------------ 
      Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -2._dp*Real(SA_B1(p2,MFe2(i2),MVZ2)+ 0.5_dp*rMS,dp) 
B0m2 = -4._dp*MFe(i2)*Real(SA_B0(p2,MFe2(i2),MVZ2)-0.5_dp*rMS,dp) 
coupL1 = cplcUFeFeVZL(gO1,i2)
coupR1 = cplcUFeFeVZR(gO1,i2)
coupL2 =  Conjg(cplcUFeFeVZL(gO2,i2))
coupR2 =  Conjg(cplcUFeFeVZR(gO2,i2))
SumSL(gO1,gO2) = coupL1*coupR2*B0m2 
SumSR(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
    End Do 
 !------------------------ 
! VZR, Fe 
!------------------------ 
      Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -2._dp*Real(SA_B1(p2,MFe2(i2),MVZR2)+ 0.5_dp*rMS,dp) 
B0m2 = -4._dp*MFe(i2)*Real(SA_B0(p2,MFe2(i2),MVZR2)-0.5_dp*rMS,dp) 
coupL1 = cplcUFeFeVZRL(gO1,i2)
coupR1 = cplcUFeFeVZRR(gO1,i2)
coupL2 =  Conjg(cplcUFeFeVZRL(gO2,i2))
coupR2 =  Conjg(cplcUFeFeVZRR(gO2,i2))
SumSL(gO1,gO2) = coupL1*coupR2*B0m2 
SumSR(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
    End Do 
 !------------------------ 
! conj[Hpm], Fv 
!------------------------ 
    Do i1 = 1, 4
       Do i2 = 1, 9
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -Real(SA_B1(p2,MFv2(i2),MHpm2(i1)),dp) 
B0m2 = MFv(i2)*Real(SA_B0(p2,MFv2(i2),MHpm2(i1)),dp) 
coupL1 = cplcUFeFvcHpmL(gO1,i2,i1)
coupR1 = cplcUFeFvcHpmR(gO1,i2,i1)
coupL2 =  Conjg(cplcUFeFvcHpmL(gO2,i2,i1))
coupR2 =  Conjg(cplcUFeFvcHpmR(gO2,i2,i1))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! VWLm, Fv 
!------------------------ 
      Do i2 = 1, 9
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -2._dp*Real(SA_B1(p2,MFv2(i2),MVWLm2)+ 0.5_dp*rMS,dp) 
B0m2 = -4._dp*MFv(i2)*Real(SA_B0(p2,MFv2(i2),MVWLm2)-0.5_dp*rMS,dp) 
coupL1 = cplcUFeFvVWLmL(gO1,i2)
coupR1 = cplcUFeFvVWLmR(gO1,i2)
coupL2 =  Conjg(cplcUFeFvVWLmL(gO2,i2))
coupR2 =  Conjg(cplcUFeFvVWLmR(gO2,i2))
SumSL(gO1,gO2) = coupL1*coupR2*B0m2 
SumSR(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
    End Do 
 !------------------------ 
! VWRm, Fv 
!------------------------ 
      Do i2 = 1, 9
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -2._dp*Real(SA_B1(p2,MFv2(i2),MVWRm2)+ 0.5_dp*rMS,dp) 
B0m2 = -4._dp*MFv(i2)*Real(SA_B0(p2,MFv2(i2),MVWRm2)-0.5_dp*rMS,dp) 
coupL1 = cplcUFeFvVWRmL(gO1,i2)
coupR1 = cplcUFeFvVWRmR(gO1,i2)
coupL2 =  Conjg(cplcUFeFvVWRmL(gO2,i2))
coupR2 =  Conjg(cplcUFeFvVWRmR(gO2,i2))
SumSL(gO1,gO2) = coupL1*coupR2*B0m2 
SumSR(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
    End Do 
 SigL = oo16pi2*SigL 
SigR = oo16pi2*SigR 
SigSL = oo16pi2*SigSL 
SigSR = oo16pi2*SigSR 
 
End Subroutine Sigma1LoopFe 
 
Subroutine OneLoopFv(Mux,Y,YR,k1,vR,MFv,MFv2,MAh,MAh2,MVWLm,MVWLm2,MFe,               & 
& MFe2,MVWRm,MVWRm2,MHpm,MHpm2,Mhh,Mhh2,MVZ,MVZ2,MVZR,MVZR2,cplUFvFvAhL,cplUFvFvAhR,     & 
& cplUFvFecVWLmL,cplUFvFecVWLmR,cplUFvFecVWRmL,cplUFvFecVWRmR,cplUFvFeHpmL,              & 
& cplUFvFeHpmR,cplUFvFvhhL,cplUFvFvhhR,cplUFvFvVPL,cplUFvFvVPR,cplUFvFvVZL,              & 
& cplUFvFvVZR,cplUFvFvVZRL,cplUFvFvVZRR,cplcFeUFvVWLmL,cplcFeUFvVWLmR,cplcFeUFvVWRmL,    & 
& cplcFeUFvVWRmR,cplcFeUFvcHpmL,cplcFeUFvcHpmR,delta,MFv_1L,MFv2_1L,ZM_1L,ierr)

Implicit None 
Real(dp), Intent(in) :: MFv(9),MFv2(9),MAh(4),MAh2(4),MVWLm,MVWLm2,MFe(3),MFe2(3),MVWRm,MVWRm2,               & 
& MHpm(4),MHpm2(4),Mhh(4),Mhh2(4),MVZ,MVZ2,MVZR,MVZR2

Real(dp), Intent(in) :: k1,vR

Complex(dp), Intent(in) :: Mux(3,3),Y(3,3),YR(3,3)

Complex(dp), Intent(in) :: cplUFvFvAhL(9,9,4),cplUFvFvAhR(9,9,4),cplUFvFecVWLmL(9,3),cplUFvFecVWLmR(9,3),        & 
& cplUFvFecVWRmL(9,3),cplUFvFecVWRmR(9,3),cplUFvFeHpmL(9,3,4),cplUFvFeHpmR(9,3,4),       & 
& cplUFvFvhhL(9,9,4),cplUFvFvhhR(9,9,4),cplUFvFvVPL(9,9),cplUFvFvVPR(9,9),               & 
& cplUFvFvVZL(9,9),cplUFvFvVZR(9,9),cplUFvFvVZRL(9,9),cplUFvFvVZRR(9,9),cplcFeUFvVWLmL(3,9),& 
& cplcFeUFvVWLmR(3,9),cplcFeUFvVWRmL(3,9),cplcFeUFvVWRmR(3,9),cplcFeUFvcHpmL(3,9,4),     & 
& cplcFeUFvcHpmR(3,9,4)

Complex(dp) :: mat1a(9,9), mat1(9,9), mat2(9,9) 
Integer , Intent(inout):: ierr 
Integer :: i1,i2,i3,i4,j1, j2,j3,j4,il,i_count 
Real(dp), Intent(in) :: delta 
Real(dp) :: mi2(9), test_m2(9),p2 
Real(dp), Intent(out) :: MFv_1L(9),MFv2_1L(9) 
Complex(dp), Intent(out) ::  ZM_1L(9,9) 
Real(dp) :: MFv_t(9),MFv2_t(9) 
Complex(dp) ::  ZM_t(9,9) 
Complex(dp) ::  phaseM, E9(9), sigL(9,9), sigR(9,9), sigSL(9,9), sigSR(9,9) 
Real(dp) :: ZMa(9,9), test(2), eig(9) 

Iname = Iname + 1 
NameOfUnit(Iname) = 'OneLoopMFv'
 
mat1a(1,1) = 0._dp 
mat1a(1,2) = 0._dp 
mat1a(1,3) = 0._dp 
mat1a(1,4) = 0._dp 
mat1a(1,4) = mat1a(1,4)+(k1*Conjg(Y(1,1)))/sqrt(2._dp)
mat1a(1,5) = 0._dp 
mat1a(1,5) = mat1a(1,5)+(k1*Conjg(Y(1,2)))/sqrt(2._dp)
mat1a(1,6) = 0._dp 
mat1a(1,6) = mat1a(1,6)+(k1*Conjg(Y(1,3)))/sqrt(2._dp)
mat1a(1,7) = 0._dp 
mat1a(1,8) = 0._dp 
mat1a(1,9) = 0._dp 
mat1a(2,1) = 0._dp 
mat1a(2,2) = 0._dp 
mat1a(2,3) = 0._dp 
mat1a(2,4) = 0._dp 
mat1a(2,4) = mat1a(2,4)+(k1*Conjg(Y(2,1)))/sqrt(2._dp)
mat1a(2,5) = 0._dp 
mat1a(2,5) = mat1a(2,5)+(k1*Conjg(Y(2,2)))/sqrt(2._dp)
mat1a(2,6) = 0._dp 
mat1a(2,6) = mat1a(2,6)+(k1*Conjg(Y(2,3)))/sqrt(2._dp)
mat1a(2,7) = 0._dp 
mat1a(2,8) = 0._dp 
mat1a(2,9) = 0._dp 
mat1a(3,1) = 0._dp 
mat1a(3,2) = 0._dp 
mat1a(3,3) = 0._dp 
mat1a(3,4) = 0._dp 
mat1a(3,4) = mat1a(3,4)+(k1*Conjg(Y(3,1)))/sqrt(2._dp)
mat1a(3,5) = 0._dp 
mat1a(3,5) = mat1a(3,5)+(k1*Conjg(Y(3,2)))/sqrt(2._dp)
mat1a(3,6) = 0._dp 
mat1a(3,6) = mat1a(3,6)+(k1*Conjg(Y(3,3)))/sqrt(2._dp)
mat1a(3,7) = 0._dp 
mat1a(3,8) = 0._dp 
mat1a(3,9) = 0._dp 
mat1a(4,1) = 0._dp 
mat1a(4,1) = mat1a(4,1)+(k1*Conjg(Y(1,1)))/sqrt(2._dp)
mat1a(4,2) = 0._dp 
mat1a(4,2) = mat1a(4,2)+(k1*Conjg(Y(2,1)))/sqrt(2._dp)
mat1a(4,3) = 0._dp 
mat1a(4,3) = mat1a(4,3)+(k1*Conjg(Y(3,1)))/sqrt(2._dp)
mat1a(4,4) = 0._dp 
mat1a(4,5) = 0._dp 
mat1a(4,6) = 0._dp 
mat1a(4,7) = 0._dp 
mat1a(4,7) = mat1a(4,7)+(vR*YR(1,1))/sqrt(2._dp)
mat1a(4,8) = 0._dp 
mat1a(4,8) = mat1a(4,8)+(vR*YR(1,2))/sqrt(2._dp)
mat1a(4,9) = 0._dp 
mat1a(4,9) = mat1a(4,9)+(vR*YR(1,3))/sqrt(2._dp)
mat1a(5,1) = 0._dp 
mat1a(5,1) = mat1a(5,1)+(k1*Conjg(Y(1,2)))/sqrt(2._dp)
mat1a(5,2) = 0._dp 
mat1a(5,2) = mat1a(5,2)+(k1*Conjg(Y(2,2)))/sqrt(2._dp)
mat1a(5,3) = 0._dp 
mat1a(5,3) = mat1a(5,3)+(k1*Conjg(Y(3,2)))/sqrt(2._dp)
mat1a(5,4) = 0._dp 
mat1a(5,5) = 0._dp 
mat1a(5,6) = 0._dp 
mat1a(5,7) = 0._dp 
mat1a(5,7) = mat1a(5,7)+(vR*YR(2,1))/sqrt(2._dp)
mat1a(5,8) = 0._dp 
mat1a(5,8) = mat1a(5,8)+(vR*YR(2,2))/sqrt(2._dp)
mat1a(5,9) = 0._dp 
mat1a(5,9) = mat1a(5,9)+(vR*YR(2,3))/sqrt(2._dp)
mat1a(6,1) = 0._dp 
mat1a(6,1) = mat1a(6,1)+(k1*Conjg(Y(1,3)))/sqrt(2._dp)
mat1a(6,2) = 0._dp 
mat1a(6,2) = mat1a(6,2)+(k1*Conjg(Y(2,3)))/sqrt(2._dp)
mat1a(6,3) = 0._dp 
mat1a(6,3) = mat1a(6,3)+(k1*Conjg(Y(3,3)))/sqrt(2._dp)
mat1a(6,4) = 0._dp 
mat1a(6,5) = 0._dp 
mat1a(6,6) = 0._dp 
mat1a(6,7) = 0._dp 
mat1a(6,7) = mat1a(6,7)+(vR*YR(3,1))/sqrt(2._dp)
mat1a(6,8) = 0._dp 
mat1a(6,8) = mat1a(6,8)+(vR*YR(3,2))/sqrt(2._dp)
mat1a(6,9) = 0._dp 
mat1a(6,9) = mat1a(6,9)+(vR*YR(3,3))/sqrt(2._dp)
mat1a(7,1) = 0._dp 
mat1a(7,2) = 0._dp 
mat1a(7,3) = 0._dp 
mat1a(7,4) = 0._dp 
mat1a(7,4) = mat1a(7,4)+(vR*YR(1,1))/sqrt(2._dp)
mat1a(7,5) = 0._dp 
mat1a(7,5) = mat1a(7,5)+(vR*YR(2,1))/sqrt(2._dp)
mat1a(7,6) = 0._dp 
mat1a(7,6) = mat1a(7,6)+(vR*YR(3,1))/sqrt(2._dp)
mat1a(7,7) = 0._dp 
mat1a(7,7) = mat1a(7,7)+Mux(1,1)
mat1a(7,8) = 0._dp 
mat1a(7,8) = mat1a(7,8)+Mux(1,2)/2._dp
mat1a(7,8) = mat1a(7,8)+Mux(2,1)/2._dp
mat1a(7,9) = 0._dp 
mat1a(7,9) = mat1a(7,9)+Mux(1,3)/2._dp
mat1a(7,9) = mat1a(7,9)+Mux(3,1)/2._dp
mat1a(8,1) = 0._dp 
mat1a(8,2) = 0._dp 
mat1a(8,3) = 0._dp 
mat1a(8,4) = 0._dp 
mat1a(8,4) = mat1a(8,4)+(vR*YR(1,2))/sqrt(2._dp)
mat1a(8,5) = 0._dp 
mat1a(8,5) = mat1a(8,5)+(vR*YR(2,2))/sqrt(2._dp)
mat1a(8,6) = 0._dp 
mat1a(8,6) = mat1a(8,6)+(vR*YR(3,2))/sqrt(2._dp)
mat1a(8,7) = 0._dp 
mat1a(8,7) = mat1a(8,7)+Mux(1,2)/2._dp
mat1a(8,7) = mat1a(8,7)+Mux(2,1)/2._dp
mat1a(8,8) = 0._dp 
mat1a(8,8) = mat1a(8,8)+Mux(2,2)
mat1a(8,9) = 0._dp 
mat1a(8,9) = mat1a(8,9)+Mux(2,3)/2._dp
mat1a(8,9) = mat1a(8,9)+Mux(3,2)/2._dp
mat1a(9,1) = 0._dp 
mat1a(9,2) = 0._dp 
mat1a(9,3) = 0._dp 
mat1a(9,4) = 0._dp 
mat1a(9,4) = mat1a(9,4)+(vR*YR(1,3))/sqrt(2._dp)
mat1a(9,5) = 0._dp 
mat1a(9,5) = mat1a(9,5)+(vR*YR(2,3))/sqrt(2._dp)
mat1a(9,6) = 0._dp 
mat1a(9,6) = mat1a(9,6)+(vR*YR(3,3))/sqrt(2._dp)
mat1a(9,7) = 0._dp 
mat1a(9,7) = mat1a(9,7)+Mux(1,3)/2._dp
mat1a(9,7) = mat1a(9,7)+Mux(3,1)/2._dp
mat1a(9,8) = 0._dp 
mat1a(9,8) = mat1a(9,8)+Mux(2,3)/2._dp
mat1a(9,8) = mat1a(9,8)+Mux(3,2)/2._dp
mat1a(9,9) = 0._dp 
mat1a(9,9) = mat1a(9,9)+Mux(3,3)

 
 !---------------------------------------- 
! Rotation matrix for p2=0 
!----------------------------------------- 
 
sigL=0._dp 
sigR=0._dp 
sigSL=0._dp 
sigSR=0._dp 
p2 = 0._dp 
Call Sigma1LoopFv(p2,MFv,MFv2,MAh,MAh2,MVWLm,MVWLm2,MFe,MFe2,MVWRm,MVWRm2,            & 
& MHpm,MHpm2,Mhh,Mhh2,MVZ,MVZ2,MVZR,MVZR2,cplUFvFvAhL,cplUFvFvAhR,cplUFvFecVWLmL,        & 
& cplUFvFecVWLmR,cplUFvFecVWRmL,cplUFvFecVWRmR,cplUFvFeHpmL,cplUFvFeHpmR,cplUFvFvhhL,    & 
& cplUFvFvhhR,cplUFvFvVPL,cplUFvFvVPR,cplUFvFvVZL,cplUFvFvVZR,cplUFvFvVZRL,              & 
& cplUFvFvVZRR,cplcFeUFvVWLmL,cplcFeUFvVWLmR,cplcFeUFvVWRmL,cplcFeUFvVWRmR,              & 
& cplcFeUFvcHpmL,cplcFeUFvcHpmR,sigL,sigR,sigSL,sigSR)

mat1 = mat1a - 0.5_dp*(Conjg(SigSL) + SigSR + & 
      & 0.5_dp*(MatMul(Transpose(SigL),mat1a) + MatMul(SigR,mat1a) + & 
      & MatMul(mat1a,Transpose(SigR)) + MatMul(mat1a,SigL))) 
 
If (ForceRealMatrices) mat1 = Real(mat1,dp) 
If (Maxval(Abs(Aimag(mat1))).Eq.0._dp) Then 
Call EigenSystemQP(Real(mat1,dp),Eig,ZMa,ierr,test) 
 
   Do i1=1,9
   If (Eig(i1).Lt.0._dp) Then 
    MFv_t(i1) = - Eig(i1) 
    ZM_1L(i1,:) = (0._dp,1._dp)*ZMa(i1,:) 
   Else 
    MFv_t(i1) = Eig(i1) 
    ZM_1L(i1,:) = ZMa(i1,:)
    End If 
   End Do 
 
Do i1=1,8
  Do i2=i1+1,9
    If (Abs(MFv_t(i1)).Gt.Abs(MFv_t(i2))) Then 
      Eig(1) = MFv_t(i1) 
      MFv_t(i1) = MFv_t(i2) 
      MFv_t(i2) = Eig(1) 
      E9 = ZM_1L(i1,:) 
      ZM_1L(i1,:) = ZM_1L(i2,:) 
      ZM_1L(i2,:) = E9
    End If 
   End Do 
End Do 
 
ZMOS_0 = ZM_1L 
 Else 
 
mat2 = Matmul( Transpose(Conjg( mat1) ), mat1 ) 
Call EigensystemQP(mat2, Eig, ZM_1L, ierr, test) 
mat2 = Matmul( Conjg(ZM_1L), Matmul( mat1, Transpose( Conjg(ZM_1L)))) 
Do i1=1,9
If (Abs(mat2(i1,i1)).gt.0._dp) Then 
  phaseM = Sqrt( mat2(i1,i1) / Abs(mat2(i1,i1))) 
  ZM_1L(i1,:)= phaseM * ZM_1L(i1,:) 
End if 
ZMOS_0 = ZM_1L 
 End Do 
End If 
 
!---------------------------------------- 
! Now, with momenta
!----------------------------------------- 
 
Do il=9,1,-1
sigL=0._dp 
sigR=0._dp 
sigSL=0._dp 
sigSR=0._dp 
p2 = MFv2(il)
Call Sigma1LoopFv(p2,MFv,MFv2,MAh,MAh2,MVWLm,MVWLm2,MFe,MFe2,MVWRm,MVWRm2,            & 
& MHpm,MHpm2,Mhh,Mhh2,MVZ,MVZ2,MVZR,MVZR2,cplUFvFvAhL,cplUFvFvAhR,cplUFvFecVWLmL,        & 
& cplUFvFecVWLmR,cplUFvFecVWRmL,cplUFvFecVWRmR,cplUFvFeHpmL,cplUFvFeHpmR,cplUFvFvhhL,    & 
& cplUFvFvhhR,cplUFvFvVPL,cplUFvFvVPR,cplUFvFvVZL,cplUFvFvVZR,cplUFvFvVZRL,              & 
& cplUFvFvVZRR,cplcFeUFvVWLmL,cplcFeUFvVWLmR,cplcFeUFvVWRmL,cplcFeUFvVWRmR,              & 
& cplcFeUFvcHpmL,cplcFeUFvcHpmR,sigL,sigR,sigSL,sigSR)

mat1 = mat1a - 0.5_dp*(Conjg(SigSL) + SigSR + & 
      & 0.5_dp*(MatMul(Transpose(SigL),mat1a) + MatMul(SigR,mat1a) + & 
      & MatMul(mat1a,Transpose(SigR)) + MatMul(mat1a,SigL))) 
 
If (ForceRealMatrices) mat1 = Real(mat1,dp) 
If (Maxval(Abs(Aimag(mat1))).Eq.0._dp) Then 
Call EigenSystemQP(Real(mat1,dp),Eig,ZMa,ierr,test) 
 
   Do i1=1,9
   If (Eig(i1).Lt.0._dp) Then 
    MFv_t(i1) = - Eig(i1) 
    ZM_1L(i1,:) = (0._dp,1._dp)*ZMa(i1,:) 
   Else 
    MFv_t(i1) = Eig(i1) 
    ZM_1L(i1,:) = ZMa(i1,:)
    End If 
   End Do 
 
Do i1=1,8
  Do i2=i1+1,9
    If (Abs(MFv_t(i1)).Gt.Abs(MFv_t(i2))) Then 
      Eig(1) = MFv_t(i1) 
      MFv_t(i1) = MFv_t(i2) 
      MFv_t(i2) = Eig(1) 
      E9 = ZM_1L(i1,:) 
      ZM_1L(i1,:) = ZM_1L(i2,:) 
      ZM_1L(i2,:) = E9
    End If 
   End Do 
End Do 
 
MFv_1L(iL) = MFv_t(iL) 
MFv2_1L(iL) = MFv_t(iL)**2 
ZMOS_p2(il,:) = ZM_1L(il,:) 
 Else 
 
mat2 = Matmul( Transpose(Conjg( mat1) ), mat1 ) 
Call EigensystemQP(mat2, Eig, ZM_1L, ierr, test) 
mat2 = Matmul( Conjg(ZM_1L), Matmul( mat1, Transpose( Conjg(ZM_1L)))) 
Do i1=1,9
If (Abs(mat2(i1,i1)).gt.0._dp) Then 
  phaseM = Sqrt( mat2(i1,i1) / Abs(mat2(i1,i1))) 
  ZM_1L(i1,:)= phaseM * ZM_1L(i1,:) 
End if 
ZMOS_p2(il,:) = ZM_1L(il,:) 
   If ((Abs(Eig(i1)).Le.MaxMassNumericalZero).and.(Eig(i1).lt.0._dp)) Eig(i1) = Abs(Eig(i1))+1.E-10_dp 
  If (Eig(i1).Le.0._dp) Then 
    If (ErrorLevel.Ge.0) Then 
      Write(10,*) 'Warning from Subroutine '//NameOfUnit(Iname) 
      Write(10,*) 'a mass squarred is negative: ',i1,Eig(i1) 
      Write(*,*) 'Warning from Subroutine '//NameOfUnit(Iname) 
      Write(*,*) 'a mass squarred is negative: ',i1,Eig(i1) 
      Call TerminateProgram 
    End If 
     Write(ErrCan,*) 'Warning from routine '//NameOfUnit(Iname) 
     Write(ErrCan,*) 'in the calculation of the masses' 
     Write(ErrCan,*) 'occurred a negative mass squared!' 
     Write(ErrCan,*) i1,Eig(i1) 
  Eig(i1) = 1._dp 
   SignOfMassChanged = .True. 
 End if 
End Do 
MFv_1L = Sqrt( Eig ) 
 
MFv2_1L = Eig 
 
End If 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
  ierr = 0 
End If 
 
!---------------------------------------- 
! Redoing Calculation using redefined p2 
!----------------------------------------- 
 
i_count = 0 
p2_loop: Do  
i_count = i_count + 1 
sigL=0._dp 
sigR=0._dp 
sigSL=0._dp 
sigSR=0._dp 
p2 = MFv2_1L(iL)
Call Sigma1LoopFv(p2,MFv,MFv2,MAh,MAh2,MVWLm,MVWLm2,MFe,MFe2,MVWRm,MVWRm2,            & 
& MHpm,MHpm2,Mhh,Mhh2,MVZ,MVZ2,MVZR,MVZR2,cplUFvFvAhL,cplUFvFvAhR,cplUFvFecVWLmL,        & 
& cplUFvFecVWLmR,cplUFvFecVWRmL,cplUFvFecVWRmR,cplUFvFeHpmL,cplUFvFeHpmR,cplUFvFvhhL,    & 
& cplUFvFvhhR,cplUFvFvVPL,cplUFvFvVPR,cplUFvFvVZL,cplUFvFvVZR,cplUFvFvVZRL,              & 
& cplUFvFvVZRR,cplcFeUFvVWLmL,cplcFeUFvVWLmR,cplcFeUFvVWRmL,cplcFeUFvVWRmR,              & 
& cplcFeUFvcHpmL,cplcFeUFvcHpmR,sigL,sigR,sigSL,sigSR)

mat1 = mat1a - 0.5_dp*(Conjg(SigSL) + SigSR + & 
      & 0.5_dp*(MatMul(Transpose(SigL),mat1a) + MatMul(SigR,mat1a) + & 
      & MatMul(mat1a,Transpose(SigR)) + MatMul(mat1a,SigL))) 
 
If (ForceRealMatrices) mat1 = Real(mat1,dp) 
If (Maxval(Abs(Aimag(mat1))).Eq.0._dp) Then 
Call EigenSystemQP(Real(mat1,dp),Eig,ZMa,ierr,test) 
 
   Do i1=1,9
   If (Eig(i1).Lt.0._dp) Then 
    MFv_t(i1) = - Eig(i1) 
    ZM_1L(i1,:) = (0._dp,1._dp)*ZMa(i1,:) 
   Else 
    MFv_t(i1) = Eig(i1) 
    ZM_1L(i1,:) = ZMa(i1,:)
    End If 
   End Do 
 
Do i1=1,8
  Do i2=i1+1,9
    If (Abs(MFv_t(i1)).Gt.Abs(MFv_t(i2))) Then 
      Eig(1) = MFv_t(i1) 
      MFv_t(i1) = MFv_t(i2) 
      MFv_t(i2) = Eig(1) 
      E9 = ZM_1L(i1,:) 
      ZM_1L(i1,:) = ZM_1L(i2,:) 
      ZM_1L(i2,:) = E9
    End If 
   End Do 
End Do 
 
MFv_1L(iL) = MFv_t(iL) 
MFv2_1L(iL) = MFv_t(iL)**2 
ZMOS_p2(il,:) = ZM_1L(il,:) 
 Else 
 
mat2 = Matmul( Transpose(Conjg( mat1) ), mat1 ) 
Call EigensystemQP(mat2, Eig, ZM_1L, ierr, test) 
mat2 = Matmul( Conjg(ZM_1L), Matmul( mat1, Transpose( Conjg(ZM_1L)))) 
Do i1=1,9
If (Abs(mat2(i1,i1)).gt.0._dp) Then 
  phaseM = Sqrt( mat2(i1,i1) / Abs(mat2(i1,i1))) 
  ZM_1L(i1,:)= phaseM * ZM_1L(i1,:) 
End if 
ZMOS_p2(il,:) = ZM_1L(il,:) 
   If ((Abs(Eig(i1)).Le.MaxMassNumericalZero).and.(Eig(i1).lt.0._dp)) Eig(i1) = Abs(Eig(i1))+1.E-10_dp 
  If (Eig(i1).Le.0._dp) Then 
    If (ErrorLevel.Ge.0) Then 
      Write(10,*) 'Warning from Subroutine '//NameOfUnit(Iname) 
      Write(10,*) 'a mass squarred is negative: ',i1,Eig(i1) 
      Write(*,*) 'Warning from Subroutine '//NameOfUnit(Iname) 
      Write(*,*) 'a mass squarred is negative: ',i1,Eig(i1) 
      Call TerminateProgram 
    End If 
     Write(ErrCan,*) 'Warning from routine '//NameOfUnit(Iname) 
     Write(ErrCan,*) 'in the calculation of the masses' 
     Write(ErrCan,*) 'occurred a negative mass squared!' 
     Write(ErrCan,*) i1,Eig(i1) 
  Eig(i1) = 1._dp 
   SignOfMassChanged = .True. 
 End if 
End Do 
MFv_1L = Sqrt( Eig ) 
 
MFv2_1L = Eig 
 
End If 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
  ierr = 0 
End If 
 
If (p2.Ne.0._dp) Then 
  test(1) = Abs(MFv2_1L(il)-p2)/p2
Else 
  test(2) = Abs(MFv2_1L(il))
End If 
If (Abs(MFv2_1L(il)).lt.1.0E-30_dp) Exit p2_loop 
If (test(1).lt.0.1_dp*delta) Exit p2_loop 
If(i_count.gt.30) then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  Exit p2_loop 
End if
End Do p2_loop 
End Do 
 
Iname = Iname -1 
End Subroutine OneLoopFv
 
 
Subroutine Sigma1LoopFv(p2,MFv,MFv2,MAh,MAh2,MVWLm,MVWLm2,MFe,MFe2,MVWRm,             & 
& MVWRm2,MHpm,MHpm2,Mhh,Mhh2,MVZ,MVZ2,MVZR,MVZR2,cplUFvFvAhL,cplUFvFvAhR,cplUFvFecVWLmL, & 
& cplUFvFecVWLmR,cplUFvFecVWRmL,cplUFvFecVWRmR,cplUFvFeHpmL,cplUFvFeHpmR,cplUFvFvhhL,    & 
& cplUFvFvhhR,cplUFvFvVPL,cplUFvFvVPR,cplUFvFvVZL,cplUFvFvVZR,cplUFvFvVZRL,              & 
& cplUFvFvVZRR,cplcFeUFvVWLmL,cplcFeUFvVWLmR,cplcFeUFvVWRmL,cplcFeUFvVWRmR,              & 
& cplcFeUFvcHpmL,cplcFeUFvcHpmR,sigL,sigR,sigSL,sigSR)

Implicit None 
Real(dp), Intent(in) :: MFv(9),MFv2(9),MAh(4),MAh2(4),MVWLm,MVWLm2,MFe(3),MFe2(3),MVWRm,MVWRm2,               & 
& MHpm(4),MHpm2(4),Mhh(4),Mhh2(4),MVZ,MVZ2,MVZR,MVZR2

Complex(dp), Intent(in) :: cplUFvFvAhL(9,9,4),cplUFvFvAhR(9,9,4),cplUFvFecVWLmL(9,3),cplUFvFecVWLmR(9,3),        & 
& cplUFvFecVWRmL(9,3),cplUFvFecVWRmR(9,3),cplUFvFeHpmL(9,3,4),cplUFvFeHpmR(9,3,4),       & 
& cplUFvFvhhL(9,9,4),cplUFvFvhhR(9,9,4),cplUFvFvVPL(9,9),cplUFvFvVPR(9,9),               & 
& cplUFvFvVZL(9,9),cplUFvFvVZR(9,9),cplUFvFvVZRL(9,9),cplUFvFvVZRR(9,9),cplcFeUFvVWLmL(3,9),& 
& cplcFeUFvVWLmR(3,9),cplcFeUFvVWRmL(3,9),cplcFeUFvVWRmR(3,9),cplcFeUFvcHpmL(3,9,4),     & 
& cplcFeUFvcHpmR(3,9,4)

Complex(dp), Intent(out) :: SigL(9,9),SigR(9,9), SigSL(9,9), SigSR(9,9) 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2,temp, sumL(9,9), sumR(9,9), sumSL(9,9), sumSR(9,9) 
Real(dp) :: B0m2, F0m2, G0m2,B1m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
SigL = Cmplx(0._dp,0._dp,dp) 
SigR = Cmplx(0._dp,0._dp,dp) 
SigSL = Cmplx(0._dp,0._dp,dp) 
SigSR = Cmplx(0._dp,0._dp,dp) 
 
!------------------------ 
! Fv, Ah 
!------------------------ 
    Do i1 = 1, 9
       Do i2 = 1, 4
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 9
  Do gO2 = 1, 9
B1m2 = -2._dp*Real(SA_B1(p2,MFv2(i1),MAh2(i2)),dp) 
B0m2 = 2._dp*MFv(i1)*Real(SA_B0(p2,MFv2(i1),MAh2(i2)),dp) 
coupL1 = cplUFvFvAhL(gO1,i1,i2)
coupR1 = cplUFvFvAhR(gO1,i1,i2)
coupL2 =  Conjg(cplUFvFvAhL(gO2,i1,i2))
coupR2 =  Conjg(cplUFvFvAhR(gO2,i1,i2))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp/2._dp* sumL
SigR = SigR +1._dp/2._dp* sumR 
SigSL = SigSL +1._dp/2._dp* sumSL 
SigSR = SigSR +1._dp/2._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! conj[VWLm], Fe 
!------------------------ 
      Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 9
  Do gO2 = 1, 9
B1m2 = -4._dp*(Real(SA_B1(p2,MFe2(i2),MVWLm2),dp) + 0.5_dp*rMS) 
B0m2 = -8._dp*MFe(i2)*(Real(SA_B0(p2,MFe2(i2),MVWLm2),dp) - 0.5_dp*rMS) 
coupL1 = cplUFvFecVWLmL(gO1,i2)
coupR1 = cplUFvFecVWLmR(gO1,i2)
coupL2 =  Conjg(cplUFvFecVWLmL(gO2,i2))
coupR2 =  Conjg(cplUFvFecVWLmR(gO2,i2))
SumSR(gO1,gO2) = coupL2*coupR1*B0m2 
SumSL(gO1,gO2) = coupR2*coupL1*B0m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp/2._dp* sumL
SigR = SigR +1._dp/2._dp* sumR 
SigSL = SigSL +1._dp/2._dp* sumSL 
SigSR = SigSR +1._dp/2._dp* sumSR 
    End Do 
 !------------------------ 
! conj[VWRm], Fe 
!------------------------ 
      Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 9
  Do gO2 = 1, 9
B1m2 = -4._dp*(Real(SA_B1(p2,MFe2(i2),MVWRm2),dp) + 0.5_dp*rMS) 
B0m2 = -8._dp*MFe(i2)*(Real(SA_B0(p2,MFe2(i2),MVWRm2),dp) - 0.5_dp*rMS) 
coupL1 = cplUFvFecVWRmL(gO1,i2)
coupR1 = cplUFvFecVWRmR(gO1,i2)
coupL2 =  Conjg(cplUFvFecVWRmL(gO2,i2))
coupR2 =  Conjg(cplUFvFecVWRmR(gO2,i2))
SumSR(gO1,gO2) = coupL2*coupR1*B0m2 
SumSL(gO1,gO2) = coupR2*coupL1*B0m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp/2._dp* sumL
SigR = SigR +1._dp/2._dp* sumR 
SigSL = SigSL +1._dp/2._dp* sumSL 
SigSR = SigSR +1._dp/2._dp* sumSR 
    End Do 
 !------------------------ 
! Hpm, Fe 
!------------------------ 
    Do i1 = 1, 4
       Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 9
  Do gO2 = 1, 9
B1m2 = -2._dp*Real(SA_B1(p2,MFe2(i2),MHpm2(i1)),dp) 
B0m2 = 2._dp*MFe(i2)*Real(SA_B0(p2,MFe2(i2),MHpm2(i1)),dp) 
coupL1 = cplUFvFeHpmL(gO1,i2,i1)
coupR1 = cplUFvFeHpmR(gO1,i2,i1)
coupL2 =  Conjg(cplUFvFeHpmL(gO2,i2,i1))
coupR2 =  Conjg(cplUFvFeHpmR(gO2,i2,i1))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp/2._dp* sumL
SigR = SigR +1._dp/2._dp* sumR 
SigSL = SigSL +1._dp/2._dp* sumSL 
SigSR = SigSR +1._dp/2._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! hh, Fv 
!------------------------ 
    Do i1 = 1, 4
       Do i2 = 1, 9
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 9
  Do gO2 = 1, 9
B1m2 = -2._dp*Real(SA_B1(p2,MFv2(i2),Mhh2(i1)),dp) 
B0m2 = 2._dp*MFv(i2)*Real(SA_B0(p2,MFv2(i2),Mhh2(i1)),dp) 
coupL1 = cplUFvFvhhL(gO1,i2,i1)
coupR1 = cplUFvFvhhR(gO1,i2,i1)
coupL2 =  Conjg(cplUFvFvhhL(gO2,i2,i1))
coupR2 =  Conjg(cplUFvFvhhR(gO2,i2,i1))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp/2._dp* sumL
SigR = SigR +1._dp/2._dp* sumR 
SigSL = SigSL +1._dp/2._dp* sumSL 
SigSR = SigSR +1._dp/2._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! VP, Fv 
!------------------------ 
      Do i2 = 1, 9
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 9
  Do gO2 = 1, 9
B1m2 = -4._dp*(Real(SA_B1(p2,MFv2(i2),0._dp),dp) + 0.5_dp*rMS) 
B0m2 = -8._dp*MFv(i2)*(Real(SA_B0(p2,MFv2(i2),0._dp),dp) - 0.5_dp*rMS) 
coupL1 = cplUFvFvVPL(gO1,i2)
coupR1 = cplUFvFvVPR(gO1,i2)
coupL2 =  Conjg(cplUFvFvVPL(gO2,i2))
coupR2 =  Conjg(cplUFvFvVPR(gO2,i2))
SumSR(gO1,gO2) = coupL2*coupR1*B0m2 
SumSL(gO1,gO2) = coupR2*coupL1*B0m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp/2._dp* sumL
SigR = SigR +1._dp/2._dp* sumR 
SigSL = SigSL +1._dp/2._dp* sumSL 
SigSR = SigSR +1._dp/2._dp* sumSR 
    End Do 
 !------------------------ 
! VZ, Fv 
!------------------------ 
      Do i2 = 1, 9
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 9
  Do gO2 = 1, 9
B1m2 = -4._dp*(Real(SA_B1(p2,MFv2(i2),MVZ2),dp) + 0.5_dp*rMS) 
B0m2 = -8._dp*MFv(i2)*(Real(SA_B0(p2,MFv2(i2),MVZ2),dp) - 0.5_dp*rMS) 
coupL1 = cplUFvFvVZL(gO1,i2)
coupR1 = cplUFvFvVZR(gO1,i2)
coupL2 =  Conjg(cplUFvFvVZL(gO2,i2))
coupR2 =  Conjg(cplUFvFvVZR(gO2,i2))
SumSR(gO1,gO2) = coupL2*coupR1*B0m2 
SumSL(gO1,gO2) = coupR2*coupL1*B0m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp/2._dp* sumL
SigR = SigR +1._dp/2._dp* sumR 
SigSL = SigSL +1._dp/2._dp* sumSL 
SigSR = SigSR +1._dp/2._dp* sumSR 
    End Do 
 !------------------------ 
! VZR, Fv 
!------------------------ 
      Do i2 = 1, 9
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 9
  Do gO2 = 1, 9
B1m2 = -4._dp*(Real(SA_B1(p2,MFv2(i2),MVZR2),dp) + 0.5_dp*rMS) 
B0m2 = -8._dp*MFv(i2)*(Real(SA_B0(p2,MFv2(i2),MVZR2),dp) - 0.5_dp*rMS) 
coupL1 = cplUFvFvVZRL(gO1,i2)
coupR1 = cplUFvFvVZRR(gO1,i2)
coupL2 =  Conjg(cplUFvFvVZRL(gO2,i2))
coupR2 =  Conjg(cplUFvFvVZRR(gO2,i2))
SumSR(gO1,gO2) = coupL2*coupR1*B0m2 
SumSL(gO1,gO2) = coupR2*coupL1*B0m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp/2._dp* sumL
SigR = SigR +1._dp/2._dp* sumR 
SigSL = SigSL +1._dp/2._dp* sumSL 
SigSR = SigSR +1._dp/2._dp* sumSR 
    End Do 
 !------------------------ 
! bar[Fe], VWLm 
!------------------------ 
    Do i1 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 9
  Do gO2 = 1, 9
B1m2 = -4._dp*(Real(SA_B1(p2,MFe2(i1),MVWLm2),dp) + 0.5_dp*rMS) 
B0m2 = -8._dp*MFe(i1)*(Real(SA_B0(p2,MFe2(i1),MVWLm2),dp) - 0.5_dp*rMS) 
coupL1 = cplcFeUFvVWLmL(i1,gO1)
coupR1 = cplcFeUFvVWLmR(i1,gO1)
coupL2 =  Conjg(cplcFeUFvVWLmL(i1,gO2))
coupR2 =  Conjg(cplcFeUFvVWLmR(i1,gO2))
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp/2._dp* sumL
SigR = SigR +1._dp/2._dp* sumR 
SigSL = SigSL +1._dp/2._dp* sumSL 
SigSR = SigSR +1._dp/2._dp* sumSR 
      End Do 
 !------------------------ 
! bar[Fe], VWRm 
!------------------------ 
    Do i1 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 9
  Do gO2 = 1, 9
B1m2 = -4._dp*(Real(SA_B1(p2,MFe2(i1),MVWRm2),dp) + 0.5_dp*rMS) 
B0m2 = -8._dp*MFe(i1)*(Real(SA_B0(p2,MFe2(i1),MVWRm2),dp) - 0.5_dp*rMS) 
coupL1 = cplcFeUFvVWRmL(i1,gO1)
coupR1 = cplcFeUFvVWRmR(i1,gO1)
coupL2 =  Conjg(cplcFeUFvVWRmL(i1,gO2))
coupR2 =  Conjg(cplcFeUFvVWRmR(i1,gO2))
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp/2._dp* sumL
SigR = SigR +1._dp/2._dp* sumR 
SigSL = SigSL +1._dp/2._dp* sumSL 
SigSR = SigSR +1._dp/2._dp* sumSR 
      End Do 
 !------------------------ 
! conj[Hpm], bar[Fe] 
!------------------------ 
    Do i1 = 1, 4
       Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 9
  Do gO2 = 1, 9
B1m2 = -2._dp*Real(SA_B1(p2,MFe2(i2),MHpm2(i1)),dp) 
B0m2 = 2._dp*MFe(i2)*Real(SA_B0(p2,MFe2(i2),MHpm2(i1)),dp) 
coupL1 = cplcFeUFvcHpmL(i2,gO1,i1)
coupR1 = cplcFeUFvcHpmR(i2,gO1,i1)
coupL2 =  Conjg(cplcFeUFvcHpmL(i2,gO2,i1))
coupR2 =  Conjg(cplcFeUFvcHpmR(i2,gO2,i1))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp/2._dp* sumL
SigR = SigR +1._dp/2._dp* sumR 
SigSL = SigSL +1._dp/2._dp* sumSL 
SigSR = SigSR +1._dp/2._dp* sumSR 
      End Do 
     End Do 
 

SigL = oo16pi2*SigL 
SigR = oo16pi2*SigR 
SigSL = oo16pi2*SigSL 
SigSR = oo16pi2*SigSR 
 
End Subroutine Sigma1LoopFv 
 
Subroutine Pi1LoopVG(p2,MFd,MFd2,MFu,MFu2,cplcFdFdVGL,cplcFdFdVGR,cplcFuFuVGL,        & 
& cplcFuFuVGR,cplcgGgGVG,cplVGVGVG,cplVGVGVGVG1,cplVGVGVGVG2,cplVGVGVGVG3,kont,res)

Implicit None 
Real(dp), Intent(in) :: MFd(3),MFd2(3),MFu(3),MFu2(3)

Complex(dp), Intent(in) :: cplcFdFdVGL(3,3),cplcFdFdVGR(3,3),cplcFuFuVGL(3,3),cplcFuFuVGR(3,3),cplcgGgGVG,       & 
& cplVGVGVG,cplVGVGVGVG1,cplVGVGVGVG2,cplVGVGVGVG3

Integer, Intent(inout) :: kont 
Real(dp) :: B0m2, F0m2, G0m2, B1m2, H0m2, B22m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2, A0m12, A0m22 
Complex(dp), Intent(inout) :: res 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2, coup3, temp, sumI 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
res = 0._dp 
 
!------------------------ 
! bar[Fd], Fd 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 H0m2 = Real(SA_Hloop(p2,MFd2(i1),MFd2(i2)),dp) 
B0m2 = 4._dp*MFd(i1)*MFd(i2)*Real(SA_B0(p2,MFd2(i1),MFd2(i2)),dp) 
coupL1 = cplcFdFdVGL(i1,i2)
coupR1 = cplcFdFdVGR(i1,i2)
    SumI = (Abs(coupL1)**2+Abs(coupR1)**2)*H0m2 & 
                & + (Real(Conjg(coupL1)*coupR1,dp))*B0m2 
res = res +0.5_dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fu], Fu 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 H0m2 = Real(SA_Hloop(p2,MFu2(i1),MFu2(i2)),dp) 
B0m2 = 4._dp*MFu(i1)*MFu(i2)*Real(SA_B0(p2,MFu2(i1),MFu2(i2)),dp) 
coupL1 = cplcFuFuVGL(i1,i2)
coupR1 = cplcFuFuVGR(i1,i2)
    SumI = (Abs(coupL1)**2+Abs(coupR1)**2)*H0m2 & 
                & + (Real(Conjg(coupL1)*coupR1,dp))*B0m2 
res = res +0.5_dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[gG], gG 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = Real(VGGloop(p2,0._dp,0._dp),dp)
coup1 = cplcgGgGVG
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +3._dp* SumI  
!------------------------ 
! VG, VG 
!------------------------ 
sumI = 0._dp 
 
coup1 = cplVGVGVG
coup2 = Conjg(coup1) 
    SumI = -VVVloop(p2,0._dp,0._dp)*coup1*coup2 
res = res +1.5_dp* SumI  
!------------------------ 
! VG 
!------------------------ 
SumI = 0._dp 
A0m2 = 3._dp/4._dp*SA_A0(0._dp) +RXi/4._dp*SA_A0(0._dp*RXi) 
coup1 = cplVGVGVGVG1
coup2 = cplVGVGVGVG2
coup3 = cplVGVGVGVG3
SumI = ((2._dp*rMS*coup1+(1-RXi**2)/8._dp*(coup2+coup3))*0._dp-(4._dp*coup1+coup2+coup3)*A0m2)
res = res +1._dp/2._dp* SumI  
res = oo16pi2*res 
 
End Subroutine Pi1LoopVG 
 
Subroutine DerPi1LoopVG(p2,MFd,MFd2,MFu,MFu2,cplcFdFdVGL,cplcFdFdVGR,cplcFuFuVGL,     & 
& cplcFuFuVGR,cplcgGgGVG,cplVGVGVG,cplVGVGVGVG1,cplVGVGVGVG2,cplVGVGVGVG3,kont,res)

Implicit None 
Real(dp), Intent(in) :: MFd(3),MFd2(3),MFu(3),MFu2(3)

Complex(dp), Intent(in) :: cplcFdFdVGL(3,3),cplcFdFdVGR(3,3),cplcFuFuVGL(3,3),cplcFuFuVGR(3,3),cplcgGgGVG,       & 
& cplVGVGVG,cplVGVGVGVG1,cplVGVGVGVG2,cplVGVGVGVG3

Integer, Intent(inout) :: kont 
Real(dp) :: B0m2, F0m2, G0m2, B1m2, H0m2, B22m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2, A0m12, A0m22 
Complex(dp), Intent(inout) :: res 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2, coup3, temp, sumI 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
Real(dp) ::MVG,MVP,MVG2,MVP2
MVG = Mass_Regulator_PhotonGluon 
MVP = Mass_Regulator_PhotonGluon 
MVG2 = Mass_Regulator_PhotonGluon**2 
MVP2 = Mass_Regulator_PhotonGluon**2 

res = 0._dp 
 
!------------------------ 
! bar[Fd], Fd 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 H0m2 = Real(SA_DerHloop(p2,MFd2(i1),MFd2(i2)),dp) 
B0m2 = 4._dp*MFd(i1)*MFd(i2)*Real(SA_DerB0(p2,MFd2(i1),MFd2(i2)),dp) 
coupL1 = cplcFdFdVGL(i1,i2)
coupR1 = cplcFdFdVGR(i1,i2)
    SumI = (Abs(coupL1)**2+Abs(coupR1)**2)*H0m2 & 
                & + (Real(Conjg(coupL1)*coupR1,dp))*B0m2 
res = res +0.5_dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fu], Fu 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 H0m2 = Real(SA_DerHloop(p2,MFu2(i1),MFu2(i2)),dp) 
B0m2 = 4._dp*MFu(i1)*MFu(i2)*Real(SA_DerB0(p2,MFu2(i1),MFu2(i2)),dp) 
coupL1 = cplcFuFuVGL(i1,i2)
coupR1 = cplcFuFuVGR(i1,i2)
    SumI = (Abs(coupL1)**2+Abs(coupR1)**2)*H0m2 & 
                & + (Real(Conjg(coupL1)*coupR1,dp))*B0m2 
res = res +0.5_dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[gG], gG 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = Real(DerVGGloop(p2,MVG2,MVG2),dp)
coup1 = cplcgGgGVG
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +3._dp* SumI  
!------------------------ 
! VG, VG 
!------------------------ 
sumI = 0._dp 
 
coup1 = cplVGVGVG
coup2 = Conjg(coup1) 
    SumI = -DerVVVloop(p2,MVG2,MVG2)*coup1*coup2 
res = res +1.5_dp* SumI  
!------------------------ 
! VG 
!------------------------ 
SumI = 0._dp 
A0m2 = 3._dp/4._dp*SA_DerA0(MVG2) +RXi/4._dp*SA_DerA0(MVG2*RXi) 
coup1 = cplVGVGVGVG1
coup2 = cplVGVGVGVG2
coup3 = cplVGVGVGVG3
SumI = ((2._dp*DerrMS*coup1+(1-RXi**2)/8._dp*(coup2+coup3))*MVG2-(4._dp*coup1+coup2+coup3)*A0m2)
res = res +1._dp/2._dp* SumI  
res = oo16pi2*res 
 
End Subroutine DerPi1LoopVG 
 
Subroutine OneLoopVZ(gBL,g2,k1,vR,ZZ,Mhh,Mhh2,MAh,MAh2,MFd,MFd2,MFe,MFe2,             & 
& MFu,MFu2,MFv,MFv2,MVZ,MVZ2,MVZR,MVZR2,MHpm,MHpm2,MVWLm,MVWLm2,MVWRm,MVWRm2,            & 
& cplAhhhVZ,cplcFdFdVZL,cplcFdFdVZR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuVZL,cplcFuFuVZR,     & 
& cplFvFvVZL,cplFvFvVZR,cplcgWLmgWLmVZ,cplcgWRmgWLmVZ,cplcgWLpgWLpVZ,cplcgWRpgWLpVZ,     & 
& cplcgWRmgWRmVZ,cplcgWRpgWRpVZ,cplhhVPVZ,cplhhVZVZ,cplhhVZVZR,cplHpmcHpmVZ,             & 
& cplHpmVWLmVZ,cplHpmVWRmVZ,cplcVWLmVWLmVZ,cplcVWRmVWLmVZ,cplcVWRmVWRmVZ,cplAhAhVZVZ,    & 
& cplhhhhVZVZ,cplHpmcHpmVZVZ,cplcVWLmVWLmVZVZ1,cplcVWLmVWLmVZVZ2,cplcVWLmVWLmVZVZ3,      & 
& cplcVWRmVWRmVZVZ1,cplcVWRmVWRmVZVZ2,cplcVWRmVWRmVZVZ3,delta,mass,mass2,kont)

Real(dp), Intent(in) :: Mhh(4),Mhh2(4),MAh(4),MAh2(4),MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),           & 
& MFv(9),MFv2(9),MVZ,MVZ2,MVZR,MVZR2,MHpm(4),MHpm2(4),MVWLm,MVWLm2,MVWRm,MVWRm2

Real(dp), Intent(in) :: gBL,g2,k1,vR

Complex(dp), Intent(in) :: ZZ(3,3)

Complex(dp), Intent(in) :: cplAhhhVZ(4,4),cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),   & 
& cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),cplFvFvVZL(9,9),cplFvFvVZR(9,9),cplcgWLmgWLmVZ,      & 
& cplcgWRmgWLmVZ,cplcgWLpgWLpVZ,cplcgWRpgWLpVZ,cplcgWRmgWRmVZ,cplcgWRpgWRpVZ,            & 
& cplhhVPVZ(4),cplhhVZVZ(4),cplhhVZVZR(4),cplHpmcHpmVZ(4,4),cplHpmVWLmVZ(4),             & 
& cplHpmVWRmVZ(4),cplcVWLmVWLmVZ,cplcVWRmVWLmVZ,cplcVWRmVWRmVZ,cplAhAhVZVZ(4,4),         & 
& cplhhhhVZVZ(4,4),cplHpmcHpmVZVZ(4,4),cplcVWLmVWLmVZVZ1,cplcVWLmVWLmVZVZ2,              & 
& cplcVWLmVWLmVZVZ3,cplcVWRmVWRmVZVZ1,cplcVWRmVWRmVZVZ2,cplcVWRmVWRmVZVZ3

Integer , Intent(inout):: kont 
Integer :: i1,i2,i3,i4,j1,j2,j3,j4,il,i_count, ierr 
Real(dp), Intent(in) :: delta 
Real(dp) :: mi, mi2, p2, test_m2 
Complex(dp) :: PiSf, SigL, SigR, SigSL, SigSR 
Real(dp), Intent(out) :: mass, mass2 
Iname = Iname + 1 
NameOfUnit(Iname) = 'OneLoopVZ'
 
mi2 = MVZ2 

 
p2 = MVZ2
PiSf = ZeroC 
Call Pi1LoopVZ(p2,Mhh,Mhh2,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,              & 
& MVZ,MVZ2,MVZR,MVZR2,MHpm,MHpm2,MVWLm,MVWLm2,MVWRm,MVWRm2,cplAhhhVZ,cplcFdFdVZL,        & 
& cplcFdFdVZR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuVZL,cplcFuFuVZR,cplFvFvVZL,cplFvFvVZR,     & 
& cplcgWLmgWLmVZ,cplcgWRmgWLmVZ,cplcgWLpgWLpVZ,cplcgWRpgWLpVZ,cplcgWRmgWRmVZ,            & 
& cplcgWRpgWRpVZ,cplhhVPVZ,cplhhVZVZ,cplhhVZVZR,cplHpmcHpmVZ,cplHpmVWLmVZ,               & 
& cplHpmVWRmVZ,cplcVWLmVWLmVZ,cplcVWRmVWLmVZ,cplcVWRmVWRmVZ,cplAhAhVZVZ,cplhhhhVZVZ,     & 
& cplHpmcHpmVZVZ,cplcVWLmVWLmVZVZ1,cplcVWLmVWLmVZVZ2,cplcVWLmVWLmVZVZ3,cplcVWRmVWRmVZVZ1,& 
& cplcVWRmVWRmVZVZ2,cplcVWRmVWRmVZVZ3,kont,PiSf)

mass2 = mi2 + Real(PiSf,dp) 
mass = sqrt(mass2) 
i_count = 0 
Do  
i_count = i_count + 1 
test_m2 = mass2 
p2 =  mass2 
PiSf = ZeroC 
Call Pi1LoopVZ(p2,Mhh,Mhh2,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,              & 
& MVZ,MVZ2,MVZR,MVZR2,MHpm,MHpm2,MVWLm,MVWLm2,MVWRm,MVWRm2,cplAhhhVZ,cplcFdFdVZL,        & 
& cplcFdFdVZR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuVZL,cplcFuFuVZR,cplFvFvVZL,cplFvFvVZR,     & 
& cplcgWLmgWLmVZ,cplcgWRmgWLmVZ,cplcgWLpgWLpVZ,cplcgWRpgWLpVZ,cplcgWRmgWRmVZ,            & 
& cplcgWRpgWRpVZ,cplhhVPVZ,cplhhVZVZ,cplhhVZVZR,cplHpmcHpmVZ,cplHpmVWLmVZ,               & 
& cplHpmVWRmVZ,cplcVWLmVWLmVZ,cplcVWRmVWLmVZ,cplcVWRmVWRmVZ,cplAhAhVZVZ,cplhhhhVZVZ,     & 
& cplHpmcHpmVZVZ,cplcVWLmVWLmVZVZ1,cplcVWLmVWLmVZVZ2,cplcVWLmVWLmVZVZ3,cplcVWRmVWRmVZVZ1,& 
& cplcVWRmVWRmVZVZ2,cplcVWRmVWRmVZVZ3,kont,PiSf)

mass2 = mi2 + Real(PiSf,dp) 
mass = sqrt(mass2) 
 If (test_m2.Ne.0._dp) Then 
    test_m2 = Abs(test_m2 - mass2) / test_m2 
 Else 
    test_m2 = Abs(mass2) 
 End If 
 If (mass2.Ge.0._dp) Then 
   If (RotateNegativeFermionMasses) Then 
    mass = sqrt(mass2) 
   End if 
  Else 
 If (Abs(mass2).lt.1.0E-30_dp) test_m2 = 0._dp 
     Write(ErrCan,*) 'Warning from routine'//NameOfUnit(Iname) 
     Write(ErrCan,*) 'in the calculation of the masses' 
     Write(ErrCan,*) 'occurred a negative mass squared!' 
   SignOfMassChanged = .True. 
   mass = 0._dp 
  End If 
If (test_m2.LT.0.1_dp*delta) Exit 
If (i_count.Gt.30) Then 
  Write(*,*) "Problem in "//NameOfUnit(Iname), test_m2, mass2 
  kont = -510 
  Call AddError(510) 
 Exit 
End If 
End Do 
 
 
Iname = Iname -1 
End Subroutine OneLoopVZ
 
 
Subroutine Pi1LoopVZ(p2,Mhh,Mhh2,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,             & 
& MFv2,MVZ,MVZ2,MVZR,MVZR2,MHpm,MHpm2,MVWLm,MVWLm2,MVWRm,MVWRm2,cplAhhhVZ,               & 
& cplcFdFdVZL,cplcFdFdVZR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuVZL,cplcFuFuVZR,               & 
& cplFvFvVZL,cplFvFvVZR,cplcgWLmgWLmVZ,cplcgWRmgWLmVZ,cplcgWLpgWLpVZ,cplcgWRpgWLpVZ,     & 
& cplcgWRmgWRmVZ,cplcgWRpgWRpVZ,cplhhVPVZ,cplhhVZVZ,cplhhVZVZR,cplHpmcHpmVZ,             & 
& cplHpmVWLmVZ,cplHpmVWRmVZ,cplcVWLmVWLmVZ,cplcVWRmVWLmVZ,cplcVWRmVWRmVZ,cplAhAhVZVZ,    & 
& cplhhhhVZVZ,cplHpmcHpmVZVZ,cplcVWLmVWLmVZVZ1,cplcVWLmVWLmVZVZ2,cplcVWLmVWLmVZVZ3,      & 
& cplcVWRmVWRmVZVZ1,cplcVWRmVWRmVZVZ2,cplcVWRmVWRmVZVZ3,kont,res)

Implicit None 
Real(dp), Intent(in) :: Mhh(4),Mhh2(4),MAh(4),MAh2(4),MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),           & 
& MFv(9),MFv2(9),MVZ,MVZ2,MVZR,MVZR2,MHpm(4),MHpm2(4),MVWLm,MVWLm2,MVWRm,MVWRm2

Complex(dp), Intent(in) :: cplAhhhVZ(4,4),cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),   & 
& cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),cplFvFvVZL(9,9),cplFvFvVZR(9,9),cplcgWLmgWLmVZ,      & 
& cplcgWRmgWLmVZ,cplcgWLpgWLpVZ,cplcgWRpgWLpVZ,cplcgWRmgWRmVZ,cplcgWRpgWRpVZ,            & 
& cplhhVPVZ(4),cplhhVZVZ(4),cplhhVZVZR(4),cplHpmcHpmVZ(4,4),cplHpmVWLmVZ(4),             & 
& cplHpmVWRmVZ(4),cplcVWLmVWLmVZ,cplcVWRmVWLmVZ,cplcVWRmVWRmVZ,cplAhAhVZVZ(4,4),         & 
& cplhhhhVZVZ(4,4),cplHpmcHpmVZVZ(4,4),cplcVWLmVWLmVZVZ1,cplcVWLmVWLmVZVZ2,              & 
& cplcVWLmVWLmVZVZ3,cplcVWRmVWRmVZVZ1,cplcVWRmVWRmVZVZ2,cplcVWRmVWRmVZVZ3

Integer, Intent(inout) :: kont 
Real(dp) :: B0m2, F0m2, G0m2, B1m2, H0m2, B22m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2, A0m12, A0m22 
Complex(dp), Intent(inout) :: res 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2, coup3, temp, sumI 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
res = 0._dp 
 
!------------------------ 
! hh, Ah 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
       Do i2 = 1, 4
 B22m2 = Real(VSSloop(p2,MAh2(i2),Mhh2(i1)),dp)  
coup1 = cplAhhhVZ(i2,i1)
    SumI = Abs(coup1)**2*B22m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fd], Fd 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 H0m2 = Real(SA_Hloop(p2,MFd2(i1),MFd2(i2)),dp) 
B0m2 = 4._dp*MFd(i1)*MFd(i2)*Real(SA_B0(p2,MFd2(i1),MFd2(i2)),dp) 
coupL1 = cplcFdFdVZL(i1,i2)
coupR1 = cplcFdFdVZR(i1,i2)
    SumI = (Abs(coupL1)**2+Abs(coupR1)**2)*H0m2 & 
                & + (Real(Conjg(coupL1)*coupR1,dp))*B0m2 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fe], Fe 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 H0m2 = Real(SA_Hloop(p2,MFe2(i1),MFe2(i2)),dp) 
B0m2 = 4._dp*MFe(i1)*MFe(i2)*Real(SA_B0(p2,MFe2(i1),MFe2(i2)),dp) 
coupL1 = cplcFeFeVZL(i1,i2)
coupR1 = cplcFeFeVZR(i1,i2)
    SumI = (Abs(coupL1)**2+Abs(coupR1)**2)*H0m2 & 
                & + (Real(Conjg(coupL1)*coupR1,dp))*B0m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fu], Fu 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 H0m2 = Real(SA_Hloop(p2,MFu2(i1),MFu2(i2)),dp) 
B0m2 = 4._dp*MFu(i1)*MFu(i2)*Real(SA_B0(p2,MFu2(i1),MFu2(i2)),dp) 
coupL1 = cplcFuFuVZL(i1,i2)
coupR1 = cplcFuFuVZR(i1,i2)
    SumI = (Abs(coupL1)**2+Abs(coupR1)**2)*H0m2 & 
                & + (Real(Conjg(coupL1)*coupR1,dp))*B0m2 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! Fv, Fv 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 9
       Do i2 = 1, 9
 H0m2 = Real(SA_Hloop(p2,MFv2(i1),MFv2(i2)),dp) 
B0m2 = 4._dp*MFv(i1)*MFv(i2)*Real(SA_B0(p2,MFv2(i1),MFv2(i2)),dp) 
coupL1 = cplFvFvVZL(i1,i2)
coupR1 = cplFvFvVZR(i1,i2)
    SumI = (Abs(coupL1)**2+Abs(coupR1)**2)*H0m2 & 
                & + (Real(Conjg(coupL1)*coupR1,dp))*B0m2 
res = res +0.5_dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[gWLm], gWLm 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = Real(VGGloop(p2,MVWLm2,MVWLm2),dp)
coup1 = cplcgWLmgWLmVZ
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWRm], gWLm 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = Real(VGGloop(p2,MVWLm2,MVWRm2),dp)
coup1 = cplcgWRmgWLmVZ
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +2._dp* SumI  
!------------------------ 
! bar[gWLmC], gWLmC 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = Real(VGGloop(p2,MVWLm2,MVWLm2),dp)
coup1 = cplcgWLpgWLpVZ
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWRmC], gWLmC 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = Real(VGGloop(p2,MVWLm2,MVWRm2),dp)
coup1 = cplcgWRpgWLpVZ
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +2._dp* SumI  
!------------------------ 
! bar[gWRm], gWRm 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = Real(VGGloop(p2,MVWRm2,MVWRm2),dp)
coup1 = cplcgWRmgWRmVZ
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWRmC], gWRmC 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = Real(VGGloop(p2,MVWRm2,MVWRm2),dp)
coup1 = cplcgWRpgWRpVZ
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! VP, hh 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 B0m2 = Real(VVSloop(p2,0._dp,Mhh2(i2)),dp)
coup1 = cplhhVPVZ(i2)
    SumI = Abs(coup1)**2*B0m2 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! VZ, hh 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 B0m2 = Real(VVSloop(p2,MVZ2,Mhh2(i2)),dp)
coup1 = cplhhVZVZ(i2)
    SumI = Abs(coup1)**2*B0m2 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! VZR, hh 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 B0m2 = Real(VVSloop(p2,MVZR2,Mhh2(i2)),dp)
coup1 = cplhhVZVZR(i2)
    SumI = Abs(coup1)**2*B0m2 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! conj[Hpm], Hpm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
       Do i2 = 1, 4
 B22m2 = Real(VSSloop(p2,MHpm2(i2),MHpm2(i1)),dp)  
coup1 = cplHpmcHpmVZ(i2,i1)
    SumI = Abs(coup1)**2*B22m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! VWLm, Hpm 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 B0m2 = Real(VVSloop(p2,MVWLm2,MHpm2(i2)),dp)
coup1 = cplHpmVWLmVZ(i2)
    SumI = Abs(coup1)**2*B0m2 
res = res +2._dp* SumI  
    End Do 
 !------------------------ 
! VWRm, Hpm 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 B0m2 = Real(VVSloop(p2,MVWRm2,MHpm2(i2)),dp)
coup1 = cplHpmVWRmVZ(i2)
    SumI = Abs(coup1)**2*B0m2 
res = res +2._dp* SumI  
    End Do 
 !------------------------ 
! conj[VWLm], VWLm 
!------------------------ 
sumI = 0._dp 
 
coup1 = cplcVWLmVWLmVZ
coup2 = Conjg(coup1) 
    SumI = -VVVloop(p2,MVWLm2,MVWLm2)*coup1*coup2 
res = res +1._dp* SumI  
!------------------------ 
! conj[VWRm], VWLm 
!------------------------ 
sumI = 0._dp 
 
coup1 = cplcVWRmVWLmVZ
coup2 = Conjg(coup1) 
    SumI = -VVVloop(p2,MVWRm2,MVWLm2)*coup1*coup2 
res = res +2._dp* SumI  
!------------------------ 
! conj[VWRm], VWRm 
!------------------------ 
sumI = 0._dp 
 
coup1 = cplcVWRmVWRmVZ
coup2 = Conjg(coup1) 
    SumI = -VVVloop(p2,MVWRm2,MVWRm2)*coup1*coup2 
res = res +1._dp* SumI  
!------------------------ 
! Ah 
!------------------------ 
    Do i1 = 1, 4
 SumI = 0._dp 
 A0m2 = SA_A0(MAh2(i1))
 coup1 = cplAhAhVZVZ(i1,i1)
 SumI = coup1*A0m2 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! hh 
!------------------------ 
    Do i1 = 1, 4
 SumI = 0._dp 
 A0m2 = SA_A0(Mhh2(i1))
 coup1 = cplhhhhVZVZ(i1,i1)
 SumI = coup1*A0m2 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! conj[Hpm] 
!------------------------ 
    Do i1 = 1, 4
 SumI = 0._dp 
 A0m2 = SA_A0(MHpm2(i1))
 coup1 = cplHpmcHpmVZVZ(i1,i1)
 SumI = coup1*A0m2 
res = res +1* SumI  
      End Do 
 !------------------------ 
! conj[VWLm] 
!------------------------ 
SumI = 0._dp 
A0m2 = 3._dp/4._dp*SA_A0(MVWLm2) +RXi/4._dp*SA_A0(MVWLm2*RXi) 
coup1 = cplcVWLmVWLmVZVZ1
coup2 = cplcVWLmVWLmVZVZ2
coup3 = cplcVWLmVWLmVZVZ3
SumI = ((2._dp*rMS*coup1+(1-RXi**2)/8._dp*(coup2+coup3))*MVWLm2-(4._dp*coup1+coup2+coup3)*A0m2)
res = res +1* SumI  
!------------------------ 
! conj[VWRm] 
!------------------------ 
SumI = 0._dp 
A0m2 = 3._dp/4._dp*SA_A0(MVWRm2) +RXi/4._dp*SA_A0(MVWRm2*RXi) 
coup1 = cplcVWRmVWRmVZVZ1
coup2 = cplcVWRmVWRmVZVZ2
coup3 = cplcVWRmVWRmVZVZ3
SumI = ((2._dp*rMS*coup1+(1-RXi**2)/8._dp*(coup2+coup3))*MVWRm2-(4._dp*coup1+coup2+coup3)*A0m2)
res = res +1* SumI  
res = oo16pi2*res 
 
End Subroutine Pi1LoopVZ 
 
Subroutine DerPi1LoopVZ(p2,Mhh,Mhh2,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,              & 
& MFv,MFv2,MVZ,MVZ2,MVZR,MVZR2,MHpm,MHpm2,MVWLm,MVWLm2,MVWRm,MVWRm2,cplAhhhVZ,           & 
& cplcFdFdVZL,cplcFdFdVZR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuVZL,cplcFuFuVZR,               & 
& cplFvFvVZL,cplFvFvVZR,cplcgWLmgWLmVZ,cplcgWRmgWLmVZ,cplcgWLpgWLpVZ,cplcgWRpgWLpVZ,     & 
& cplcgWRmgWRmVZ,cplcgWRpgWRpVZ,cplhhVPVZ,cplhhVZVZ,cplhhVZVZR,cplHpmcHpmVZ,             & 
& cplHpmVWLmVZ,cplHpmVWRmVZ,cplcVWLmVWLmVZ,cplcVWRmVWLmVZ,cplcVWRmVWRmVZ,cplAhAhVZVZ,    & 
& cplhhhhVZVZ,cplHpmcHpmVZVZ,cplcVWLmVWLmVZVZ1,cplcVWLmVWLmVZVZ2,cplcVWLmVWLmVZVZ3,      & 
& cplcVWRmVWRmVZVZ1,cplcVWRmVWRmVZVZ2,cplcVWRmVWRmVZVZ3,kont,res)

Implicit None 
Real(dp), Intent(in) :: Mhh(4),Mhh2(4),MAh(4),MAh2(4),MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),           & 
& MFv(9),MFv2(9),MVZ,MVZ2,MVZR,MVZR2,MHpm(4),MHpm2(4),MVWLm,MVWLm2,MVWRm,MVWRm2

Complex(dp), Intent(in) :: cplAhhhVZ(4,4),cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),   & 
& cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),cplFvFvVZL(9,9),cplFvFvVZR(9,9),cplcgWLmgWLmVZ,      & 
& cplcgWRmgWLmVZ,cplcgWLpgWLpVZ,cplcgWRpgWLpVZ,cplcgWRmgWRmVZ,cplcgWRpgWRpVZ,            & 
& cplhhVPVZ(4),cplhhVZVZ(4),cplhhVZVZR(4),cplHpmcHpmVZ(4,4),cplHpmVWLmVZ(4),             & 
& cplHpmVWRmVZ(4),cplcVWLmVWLmVZ,cplcVWRmVWLmVZ,cplcVWRmVWRmVZ,cplAhAhVZVZ(4,4),         & 
& cplhhhhVZVZ(4,4),cplHpmcHpmVZVZ(4,4),cplcVWLmVWLmVZVZ1,cplcVWLmVWLmVZVZ2,              & 
& cplcVWLmVWLmVZVZ3,cplcVWRmVWRmVZVZ1,cplcVWRmVWRmVZVZ2,cplcVWRmVWRmVZVZ3

Integer, Intent(inout) :: kont 
Real(dp) :: B0m2, F0m2, G0m2, B1m2, H0m2, B22m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2, A0m12, A0m22 
Complex(dp), Intent(inout) :: res 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2, coup3, temp, sumI 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
Real(dp) ::MVG,MVP,MVG2,MVP2
MVG = Mass_Regulator_PhotonGluon 
MVP = Mass_Regulator_PhotonGluon 
MVG2 = Mass_Regulator_PhotonGluon**2 
MVP2 = Mass_Regulator_PhotonGluon**2 

res = 0._dp 
 
!------------------------ 
! hh, Ah 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
       Do i2 = 1, 4
 B22m2 = Real(DerVSSloop(p2,MAh2(i2),Mhh2(i1)),dp)  
coup1 = cplAhhhVZ(i2,i1)
    SumI = Abs(coup1)**2*B22m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fd], Fd 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 H0m2 = Real(SA_DerHloop(p2,MFd2(i1),MFd2(i2)),dp) 
B0m2 = 4._dp*MFd(i1)*MFd(i2)*Real(SA_DerB0(p2,MFd2(i1),MFd2(i2)),dp) 
coupL1 = cplcFdFdVZL(i1,i2)
coupR1 = cplcFdFdVZR(i1,i2)
    SumI = (Abs(coupL1)**2+Abs(coupR1)**2)*H0m2 & 
                & + (Real(Conjg(coupL1)*coupR1,dp))*B0m2 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fe], Fe 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 H0m2 = Real(SA_DerHloop(p2,MFe2(i1),MFe2(i2)),dp) 
B0m2 = 4._dp*MFe(i1)*MFe(i2)*Real(SA_DerB0(p2,MFe2(i1),MFe2(i2)),dp) 
coupL1 = cplcFeFeVZL(i1,i2)
coupR1 = cplcFeFeVZR(i1,i2)
    SumI = (Abs(coupL1)**2+Abs(coupR1)**2)*H0m2 & 
                & + (Real(Conjg(coupL1)*coupR1,dp))*B0m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fu], Fu 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 H0m2 = Real(SA_DerHloop(p2,MFu2(i1),MFu2(i2)),dp) 
B0m2 = 4._dp*MFu(i1)*MFu(i2)*Real(SA_DerB0(p2,MFu2(i1),MFu2(i2)),dp) 
coupL1 = cplcFuFuVZL(i1,i2)
coupR1 = cplcFuFuVZR(i1,i2)
    SumI = (Abs(coupL1)**2+Abs(coupR1)**2)*H0m2 & 
                & + (Real(Conjg(coupL1)*coupR1,dp))*B0m2 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! Fv, Fv 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 9
       Do i2 = 1, 9
 H0m2 = Real(SA_DerHloop(p2,MFv2(i1),MFv2(i2)),dp) 
B0m2 = 4._dp*MFv(i1)*MFv(i2)*Real(SA_DerB0(p2,MFv2(i1),MFv2(i2)),dp) 
coupL1 = cplFvFvVZL(i1,i2)
coupR1 = cplFvFvVZR(i1,i2)
    SumI = (Abs(coupL1)**2+Abs(coupR1)**2)*H0m2 & 
                & + (Real(Conjg(coupL1)*coupR1,dp))*B0m2 
res = res +0.5_dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[gWLm], gWLm 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = Real(DerVGGloop(p2,MVWLm2,MVWLm2),dp)
coup1 = cplcgWLmgWLmVZ
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWRm], gWLm 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = Real(DerVGGloop(p2,MVWLm2,MVWRm2),dp)
coup1 = cplcgWRmgWLmVZ
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +2._dp* SumI  
!------------------------ 
! bar[gWLmC], gWLmC 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = Real(DerVGGloop(p2,MVWLm2,MVWLm2),dp)
coup1 = cplcgWLpgWLpVZ
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWRmC], gWLmC 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = Real(DerVGGloop(p2,MVWLm2,MVWRm2),dp)
coup1 = cplcgWRpgWLpVZ
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +2._dp* SumI  
!------------------------ 
! bar[gWRm], gWRm 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = Real(DerVGGloop(p2,MVWRm2,MVWRm2),dp)
coup1 = cplcgWRmgWRmVZ
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWRmC], gWRmC 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = Real(DerVGGloop(p2,MVWRm2,MVWRm2),dp)
coup1 = cplcgWRpgWRpVZ
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! VP, hh 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 B0m2 = Real(DerVVSloop(p2,MVP2,Mhh2(i2)),dp)
coup1 = cplhhVPVZ(i2)
    SumI = Abs(coup1)**2*B0m2 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! VZ, hh 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 B0m2 = Real(DerVVSloop(p2,MVZ2,Mhh2(i2)),dp)
coup1 = cplhhVZVZ(i2)
    SumI = Abs(coup1)**2*B0m2 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! VZR, hh 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 B0m2 = Real(DerVVSloop(p2,MVZR2,Mhh2(i2)),dp)
coup1 = cplhhVZVZR(i2)
    SumI = Abs(coup1)**2*B0m2 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! conj[Hpm], Hpm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
       Do i2 = 1, 4
 B22m2 = Real(DerVSSloop(p2,MHpm2(i2),MHpm2(i1)),dp)  
coup1 = cplHpmcHpmVZ(i2,i1)
    SumI = Abs(coup1)**2*B22m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! VWLm, Hpm 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 B0m2 = Real(DerVVSloop(p2,MVWLm2,MHpm2(i2)),dp)
coup1 = cplHpmVWLmVZ(i2)
    SumI = Abs(coup1)**2*B0m2 
res = res +2._dp* SumI  
    End Do 
 !------------------------ 
! VWRm, Hpm 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 B0m2 = Real(DerVVSloop(p2,MVWRm2,MHpm2(i2)),dp)
coup1 = cplHpmVWRmVZ(i2)
    SumI = Abs(coup1)**2*B0m2 
res = res +2._dp* SumI  
    End Do 
 !------------------------ 
! conj[VWLm], VWLm 
!------------------------ 
sumI = 0._dp 
 
coup1 = cplcVWLmVWLmVZ
coup2 = Conjg(coup1) 
    SumI = -DerVVVloop(p2,MVWLm2,MVWLm2)*coup1*coup2 
res = res +1._dp* SumI  
!------------------------ 
! conj[VWRm], VWLm 
!------------------------ 
sumI = 0._dp 
 
coup1 = cplcVWRmVWLmVZ
coup2 = Conjg(coup1) 
    SumI = -DerVVVloop(p2,MVWRm2,MVWLm2)*coup1*coup2 
res = res +2._dp* SumI  
!------------------------ 
! conj[VWRm], VWRm 
!------------------------ 
sumI = 0._dp 
 
coup1 = cplcVWRmVWRmVZ
coup2 = Conjg(coup1) 
    SumI = -DerVVVloop(p2,MVWRm2,MVWRm2)*coup1*coup2 
res = res +1._dp* SumI  
!------------------------ 
! Ah 
!------------------------ 
    Do i1 = 1, 4
 SumI = 0._dp 
 A0m2 = SA_DerA0(MAh2(i1))
 coup1 = cplAhAhVZVZ(i1,i1)
 SumI = coup1*A0m2 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! hh 
!------------------------ 
    Do i1 = 1, 4
 SumI = 0._dp 
 A0m2 = SA_DerA0(Mhh2(i1))
 coup1 = cplhhhhVZVZ(i1,i1)
 SumI = coup1*A0m2 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! conj[Hpm] 
!------------------------ 
    Do i1 = 1, 4
 SumI = 0._dp 
 A0m2 = SA_DerA0(MHpm2(i1))
 coup1 = cplHpmcHpmVZVZ(i1,i1)
 SumI = coup1*A0m2 
res = res +1* SumI  
      End Do 
 !------------------------ 
! conj[VWLm] 
!------------------------ 
SumI = 0._dp 
A0m2 = 3._dp/4._dp*SA_DerA0(MVWLm2) +RXi/4._dp*SA_DerA0(MVWLm2*RXi) 
coup1 = cplcVWLmVWLmVZVZ1
coup2 = cplcVWLmVWLmVZVZ2
coup3 = cplcVWLmVWLmVZVZ3
SumI = ((2._dp*DerrMS*coup1+(1-RXi**2)/8._dp*(coup2+coup3))*MVWLm2-(4._dp*coup1+coup2+coup3)*A0m2)
res = res +1* SumI  
!------------------------ 
! conj[VWRm] 
!------------------------ 
SumI = 0._dp 
A0m2 = 3._dp/4._dp*SA_DerA0(MVWRm2) +RXi/4._dp*SA_DerA0(MVWRm2*RXi) 
coup1 = cplcVWRmVWRmVZVZ1
coup2 = cplcVWRmVWRmVZVZ2
coup3 = cplcVWRmVWRmVZVZ3
SumI = ((2._dp*DerrMS*coup1+(1-RXi**2)/8._dp*(coup2+coup3))*MVWRm2-(4._dp*coup1+coup2+coup3)*A0m2)
res = res +1* SumI  
res = oo16pi2*res 
 
End Subroutine DerPi1LoopVZ 
 
Subroutine OneLoopVZR(gBL,g2,k1,vR,ZZ,Mhh,Mhh2,MAh,MAh2,MFd,MFd2,MFe,MFe2,            & 
& MFu,MFu2,MFv,MFv2,MVZ,MVZ2,MVZR,MVZR2,MHpm,MHpm2,MVWLm,MVWLm2,MVWRm,MVWRm2,            & 
& cplAhhhVZR,cplcFdFdVZRL,cplcFdFdVZRR,cplcFeFeVZRL,cplcFeFeVZRR,cplcFuFuVZRL,           & 
& cplcFuFuVZRR,cplFvFvVZRL,cplFvFvVZRR,cplcgWLmgWLmVZR,cplcgWRmgWLmVZR,cplcgWLpgWLpVZR,  & 
& cplcgWRpgWLpVZR,cplcgWRmgWRmVZR,cplcgWRpgWRpVZR,cplhhVPVZR,cplhhVZVZR,cplhhVZRVZR,     & 
& cplHpmcHpmVZR,cplHpmVWLmVZR,cplHpmVWRmVZR,cplcVWLmVWLmVZR,cplcVWRmVWLmVZR,             & 
& cplcVWRmVWRmVZR,cplAhAhVZRVZR,cplhhhhVZRVZR,cplHpmcHpmVZRVZR,cplcVWLmVWLmVZRVZR1,      & 
& cplcVWLmVWLmVZRVZR2,cplcVWLmVWLmVZRVZR3,cplcVWRmVWRmVZRVZR1,cplcVWRmVWRmVZRVZR2,       & 
& cplcVWRmVWRmVZRVZR3,delta,mass,mass2,kont)

Real(dp), Intent(in) :: Mhh(4),Mhh2(4),MAh(4),MAh2(4),MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),           & 
& MFv(9),MFv2(9),MVZ,MVZ2,MVZR,MVZR2,MHpm(4),MHpm2(4),MVWLm,MVWLm2,MVWRm,MVWRm2

Real(dp), Intent(in) :: gBL,g2,k1,vR

Complex(dp), Intent(in) :: ZZ(3,3)

Complex(dp), Intent(in) :: cplAhhhVZR(4,4),cplcFdFdVZRL(3,3),cplcFdFdVZRR(3,3),cplcFeFeVZRL(3,3),cplcFeFeVZRR(3,3),& 
& cplcFuFuVZRL(3,3),cplcFuFuVZRR(3,3),cplFvFvVZRL(9,9),cplFvFvVZRR(9,9),cplcgWLmgWLmVZR, & 
& cplcgWRmgWLmVZR,cplcgWLpgWLpVZR,cplcgWRpgWLpVZR,cplcgWRmgWRmVZR,cplcgWRpgWRpVZR,       & 
& cplhhVPVZR(4),cplhhVZVZR(4),cplhhVZRVZR(4),cplHpmcHpmVZR(4,4),cplHpmVWLmVZR(4),        & 
& cplHpmVWRmVZR(4),cplcVWLmVWLmVZR,cplcVWRmVWLmVZR,cplcVWRmVWRmVZR,cplAhAhVZRVZR(4,4),   & 
& cplhhhhVZRVZR(4,4),cplHpmcHpmVZRVZR(4,4),cplcVWLmVWLmVZRVZR1,cplcVWLmVWLmVZRVZR2,      & 
& cplcVWLmVWLmVZRVZR3,cplcVWRmVWRmVZRVZR1,cplcVWRmVWRmVZRVZR2,cplcVWRmVWRmVZRVZR3

Integer , Intent(inout):: kont 
Integer :: i1,i2,i3,i4,j1,j2,j3,j4,il,i_count, ierr 
Real(dp), Intent(in) :: delta 
Real(dp) :: mi, mi2, p2, test_m2 
Complex(dp) :: PiSf, SigL, SigR, SigSL, SigSR 
Real(dp), Intent(out) :: mass, mass2 
Iname = Iname + 1 
NameOfUnit(Iname) = 'OneLoopVZR'
 
mi2 = MVZR2 

 
p2 = MVZR2
PiSf = ZeroC 
Call Pi1LoopVZR(p2,Mhh,Mhh2,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,             & 
& MVZ,MVZ2,MVZR,MVZR2,MHpm,MHpm2,MVWLm,MVWLm2,MVWRm,MVWRm2,cplAhhhVZR,cplcFdFdVZRL,      & 
& cplcFdFdVZRR,cplcFeFeVZRL,cplcFeFeVZRR,cplcFuFuVZRL,cplcFuFuVZRR,cplFvFvVZRL,          & 
& cplFvFvVZRR,cplcgWLmgWLmVZR,cplcgWRmgWLmVZR,cplcgWLpgWLpVZR,cplcgWRpgWLpVZR,           & 
& cplcgWRmgWRmVZR,cplcgWRpgWRpVZR,cplhhVPVZR,cplhhVZVZR,cplhhVZRVZR,cplHpmcHpmVZR,       & 
& cplHpmVWLmVZR,cplHpmVWRmVZR,cplcVWLmVWLmVZR,cplcVWRmVWLmVZR,cplcVWRmVWRmVZR,           & 
& cplAhAhVZRVZR,cplhhhhVZRVZR,cplHpmcHpmVZRVZR,cplcVWLmVWLmVZRVZR1,cplcVWLmVWLmVZRVZR2,  & 
& cplcVWLmVWLmVZRVZR3,cplcVWRmVWRmVZRVZR1,cplcVWRmVWRmVZRVZR2,cplcVWRmVWRmVZRVZR3,       & 
& kont,PiSf)

mass2 = mi2 + Real(PiSf,dp) 
mass = sqrt(mass2) 
i_count = 0 
Do  
i_count = i_count + 1 
test_m2 = mass2 
p2 =  mass2 
PiSf = ZeroC 
Call Pi1LoopVZR(p2,Mhh,Mhh2,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,             & 
& MVZ,MVZ2,MVZR,MVZR2,MHpm,MHpm2,MVWLm,MVWLm2,MVWRm,MVWRm2,cplAhhhVZR,cplcFdFdVZRL,      & 
& cplcFdFdVZRR,cplcFeFeVZRL,cplcFeFeVZRR,cplcFuFuVZRL,cplcFuFuVZRR,cplFvFvVZRL,          & 
& cplFvFvVZRR,cplcgWLmgWLmVZR,cplcgWRmgWLmVZR,cplcgWLpgWLpVZR,cplcgWRpgWLpVZR,           & 
& cplcgWRmgWRmVZR,cplcgWRpgWRpVZR,cplhhVPVZR,cplhhVZVZR,cplhhVZRVZR,cplHpmcHpmVZR,       & 
& cplHpmVWLmVZR,cplHpmVWRmVZR,cplcVWLmVWLmVZR,cplcVWRmVWLmVZR,cplcVWRmVWRmVZR,           & 
& cplAhAhVZRVZR,cplhhhhVZRVZR,cplHpmcHpmVZRVZR,cplcVWLmVWLmVZRVZR1,cplcVWLmVWLmVZRVZR2,  & 
& cplcVWLmVWLmVZRVZR3,cplcVWRmVWRmVZRVZR1,cplcVWRmVWRmVZRVZR2,cplcVWRmVWRmVZRVZR3,       & 
& kont,PiSf)

mass2 = mi2 + Real(PiSf,dp) 
mass = sqrt(mass2) 
 If (test_m2.Ne.0._dp) Then 
    test_m2 = Abs(test_m2 - mass2) / test_m2 
 Else 
    test_m2 = Abs(mass2) 
 End If 
 If (mass2.Ge.0._dp) Then 
   If (RotateNegativeFermionMasses) Then 
    mass = sqrt(mass2) 
   End if 
  Else 
 If (Abs(mass2).lt.1.0E-30_dp) test_m2 = 0._dp 
     Write(ErrCan,*) 'Warning from routine'//NameOfUnit(Iname) 
     Write(ErrCan,*) 'in the calculation of the masses' 
     Write(ErrCan,*) 'occurred a negative mass squared!' 
   SignOfMassChanged = .True. 
   mass = 0._dp 
  End If 
If (test_m2.LT.0.1_dp*delta) Exit 
If (i_count.Gt.30) Then 
  Write(*,*) "Problem in "//NameOfUnit(Iname), test_m2, mass2 
  kont = -510 
  Call AddError(510) 
 Exit 
End If 
End Do 
 
 
Iname = Iname -1 
End Subroutine OneLoopVZR
 
 
Subroutine Pi1LoopVZR(p2,Mhh,Mhh2,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,            & 
& MFv2,MVZ,MVZ2,MVZR,MVZR2,MHpm,MHpm2,MVWLm,MVWLm2,MVWRm,MVWRm2,cplAhhhVZR,              & 
& cplcFdFdVZRL,cplcFdFdVZRR,cplcFeFeVZRL,cplcFeFeVZRR,cplcFuFuVZRL,cplcFuFuVZRR,         & 
& cplFvFvVZRL,cplFvFvVZRR,cplcgWLmgWLmVZR,cplcgWRmgWLmVZR,cplcgWLpgWLpVZR,               & 
& cplcgWRpgWLpVZR,cplcgWRmgWRmVZR,cplcgWRpgWRpVZR,cplhhVPVZR,cplhhVZVZR,cplhhVZRVZR,     & 
& cplHpmcHpmVZR,cplHpmVWLmVZR,cplHpmVWRmVZR,cplcVWLmVWLmVZR,cplcVWRmVWLmVZR,             & 
& cplcVWRmVWRmVZR,cplAhAhVZRVZR,cplhhhhVZRVZR,cplHpmcHpmVZRVZR,cplcVWLmVWLmVZRVZR1,      & 
& cplcVWLmVWLmVZRVZR2,cplcVWLmVWLmVZRVZR3,cplcVWRmVWRmVZRVZR1,cplcVWRmVWRmVZRVZR2,       & 
& cplcVWRmVWRmVZRVZR3,kont,res)

Implicit None 
Real(dp), Intent(in) :: Mhh(4),Mhh2(4),MAh(4),MAh2(4),MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),           & 
& MFv(9),MFv2(9),MVZ,MVZ2,MVZR,MVZR2,MHpm(4),MHpm2(4),MVWLm,MVWLm2,MVWRm,MVWRm2

Complex(dp), Intent(in) :: cplAhhhVZR(4,4),cplcFdFdVZRL(3,3),cplcFdFdVZRR(3,3),cplcFeFeVZRL(3,3),cplcFeFeVZRR(3,3),& 
& cplcFuFuVZRL(3,3),cplcFuFuVZRR(3,3),cplFvFvVZRL(9,9),cplFvFvVZRR(9,9),cplcgWLmgWLmVZR, & 
& cplcgWRmgWLmVZR,cplcgWLpgWLpVZR,cplcgWRpgWLpVZR,cplcgWRmgWRmVZR,cplcgWRpgWRpVZR,       & 
& cplhhVPVZR(4),cplhhVZVZR(4),cplhhVZRVZR(4),cplHpmcHpmVZR(4,4),cplHpmVWLmVZR(4),        & 
& cplHpmVWRmVZR(4),cplcVWLmVWLmVZR,cplcVWRmVWLmVZR,cplcVWRmVWRmVZR,cplAhAhVZRVZR(4,4),   & 
& cplhhhhVZRVZR(4,4),cplHpmcHpmVZRVZR(4,4),cplcVWLmVWLmVZRVZR1,cplcVWLmVWLmVZRVZR2,      & 
& cplcVWLmVWLmVZRVZR3,cplcVWRmVWRmVZRVZR1,cplcVWRmVWRmVZRVZR2,cplcVWRmVWRmVZRVZR3

Integer, Intent(inout) :: kont 
Real(dp) :: B0m2, F0m2, G0m2, B1m2, H0m2, B22m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2, A0m12, A0m22 
Complex(dp), Intent(inout) :: res 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2, coup3, temp, sumI 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
res = 0._dp 
 
!------------------------ 
! hh, Ah 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
       Do i2 = 1, 4
 B22m2 = Real(VSSloop(p2,MAh2(i2),Mhh2(i1)),dp)  
coup1 = cplAhhhVZR(i2,i1)
    SumI = Abs(coup1)**2*B22m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fd], Fd 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 H0m2 = Real(SA_Hloop(p2,MFd2(i1),MFd2(i2)),dp) 
B0m2 = 4._dp*MFd(i1)*MFd(i2)*Real(SA_B0(p2,MFd2(i1),MFd2(i2)),dp) 
coupL1 = cplcFdFdVZRL(i1,i2)
coupR1 = cplcFdFdVZRR(i1,i2)
    SumI = (Abs(coupL1)**2+Abs(coupR1)**2)*H0m2 & 
                & + (Real(Conjg(coupL1)*coupR1,dp))*B0m2 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fe], Fe 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 H0m2 = Real(SA_Hloop(p2,MFe2(i1),MFe2(i2)),dp) 
B0m2 = 4._dp*MFe(i1)*MFe(i2)*Real(SA_B0(p2,MFe2(i1),MFe2(i2)),dp) 
coupL1 = cplcFeFeVZRL(i1,i2)
coupR1 = cplcFeFeVZRR(i1,i2)
    SumI = (Abs(coupL1)**2+Abs(coupR1)**2)*H0m2 & 
                & + (Real(Conjg(coupL1)*coupR1,dp))*B0m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fu], Fu 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 H0m2 = Real(SA_Hloop(p2,MFu2(i1),MFu2(i2)),dp) 
B0m2 = 4._dp*MFu(i1)*MFu(i2)*Real(SA_B0(p2,MFu2(i1),MFu2(i2)),dp) 
coupL1 = cplcFuFuVZRL(i1,i2)
coupR1 = cplcFuFuVZRR(i1,i2)
    SumI = (Abs(coupL1)**2+Abs(coupR1)**2)*H0m2 & 
                & + (Real(Conjg(coupL1)*coupR1,dp))*B0m2 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! Fv, Fv 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 9
       Do i2 = 1, 9
 H0m2 = Real(SA_Hloop(p2,MFv2(i1),MFv2(i2)),dp) 
B0m2 = 4._dp*MFv(i1)*MFv(i2)*Real(SA_B0(p2,MFv2(i1),MFv2(i2)),dp) 
coupL1 = cplFvFvVZRL(i1,i2)
coupR1 = cplFvFvVZRR(i1,i2)
    SumI = (Abs(coupL1)**2+Abs(coupR1)**2)*H0m2 & 
                & + (Real(Conjg(coupL1)*coupR1,dp))*B0m2 
res = res +0.5_dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[gWLm], gWLm 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = Real(VGGloop(p2,MVWLm2,MVWLm2),dp)
coup1 = cplcgWLmgWLmVZR
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWRm], gWLm 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = Real(VGGloop(p2,MVWLm2,MVWRm2),dp)
coup1 = cplcgWRmgWLmVZR
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +2._dp* SumI  
!------------------------ 
! bar[gWLmC], gWLmC 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = Real(VGGloop(p2,MVWLm2,MVWLm2),dp)
coup1 = cplcgWLpgWLpVZR
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWRmC], gWLmC 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = Real(VGGloop(p2,MVWLm2,MVWRm2),dp)
coup1 = cplcgWRpgWLpVZR
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +2._dp* SumI  
!------------------------ 
! bar[gWRm], gWRm 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = Real(VGGloop(p2,MVWRm2,MVWRm2),dp)
coup1 = cplcgWRmgWRmVZR
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWRmC], gWRmC 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = Real(VGGloop(p2,MVWRm2,MVWRm2),dp)
coup1 = cplcgWRpgWRpVZR
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! VP, hh 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 B0m2 = Real(VVSloop(p2,0._dp,Mhh2(i2)),dp)
coup1 = cplhhVPVZR(i2)
    SumI = Abs(coup1)**2*B0m2 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! VZ, hh 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 B0m2 = Real(VVSloop(p2,MVZ2,Mhh2(i2)),dp)
coup1 = cplhhVZVZR(i2)
    SumI = Abs(coup1)**2*B0m2 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! VZR, hh 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 B0m2 = Real(VVSloop(p2,MVZR2,Mhh2(i2)),dp)
coup1 = cplhhVZRVZR(i2)
    SumI = Abs(coup1)**2*B0m2 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! conj[Hpm], Hpm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
       Do i2 = 1, 4
 B22m2 = Real(VSSloop(p2,MHpm2(i2),MHpm2(i1)),dp)  
coup1 = cplHpmcHpmVZR(i2,i1)
    SumI = Abs(coup1)**2*B22m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! VWLm, Hpm 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 B0m2 = Real(VVSloop(p2,MVWLm2,MHpm2(i2)),dp)
coup1 = cplHpmVWLmVZR(i2)
    SumI = Abs(coup1)**2*B0m2 
res = res +2._dp* SumI  
    End Do 
 !------------------------ 
! VWRm, Hpm 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 B0m2 = Real(VVSloop(p2,MVWRm2,MHpm2(i2)),dp)
coup1 = cplHpmVWRmVZR(i2)
    SumI = Abs(coup1)**2*B0m2 
res = res +2._dp* SumI  
    End Do 
 !------------------------ 
! conj[VWLm], VWLm 
!------------------------ 
sumI = 0._dp 
 
coup1 = cplcVWLmVWLmVZR
coup2 = Conjg(coup1) 
    SumI = -VVVloop(p2,MVWLm2,MVWLm2)*coup1*coup2 
res = res +1._dp* SumI  
!------------------------ 
! conj[VWRm], VWLm 
!------------------------ 
sumI = 0._dp 
 
coup1 = cplcVWRmVWLmVZR
coup2 = Conjg(coup1) 
    SumI = -VVVloop(p2,MVWRm2,MVWLm2)*coup1*coup2 
res = res +2._dp* SumI  
!------------------------ 
! conj[VWRm], VWRm 
!------------------------ 
sumI = 0._dp 
 
coup1 = cplcVWRmVWRmVZR
coup2 = Conjg(coup1) 
    SumI = -VVVloop(p2,MVWRm2,MVWRm2)*coup1*coup2 
res = res +1._dp* SumI  
!------------------------ 
! Ah 
!------------------------ 
    Do i1 = 1, 4
 SumI = 0._dp 
 A0m2 = SA_A0(MAh2(i1))
 coup1 = cplAhAhVZRVZR(i1,i1)
 SumI = coup1*A0m2 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! hh 
!------------------------ 
    Do i1 = 1, 4
 SumI = 0._dp 
 A0m2 = SA_A0(Mhh2(i1))
 coup1 = cplhhhhVZRVZR(i1,i1)
 SumI = coup1*A0m2 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! conj[Hpm] 
!------------------------ 
    Do i1 = 1, 4
 SumI = 0._dp 
 A0m2 = SA_A0(MHpm2(i1))
 coup1 = cplHpmcHpmVZRVZR(i1,i1)
 SumI = coup1*A0m2 
res = res +1* SumI  
      End Do 
 !------------------------ 
! conj[VWLm] 
!------------------------ 
SumI = 0._dp 
A0m2 = 3._dp/4._dp*SA_A0(MVWLm2) +RXi/4._dp*SA_A0(MVWLm2*RXi) 
coup1 = cplcVWLmVWLmVZRVZR1
coup2 = cplcVWLmVWLmVZRVZR2
coup3 = cplcVWLmVWLmVZRVZR3
SumI = ((2._dp*rMS*coup1+(1-RXi**2)/8._dp*(coup2+coup3))*MVWLm2-(4._dp*coup1+coup2+coup3)*A0m2)
res = res +1* SumI  
!------------------------ 
! conj[VWRm] 
!------------------------ 
SumI = 0._dp 
A0m2 = 3._dp/4._dp*SA_A0(MVWRm2) +RXi/4._dp*SA_A0(MVWRm2*RXi) 
coup1 = cplcVWRmVWRmVZRVZR1
coup2 = cplcVWRmVWRmVZRVZR2
coup3 = cplcVWRmVWRmVZRVZR3
SumI = ((2._dp*rMS*coup1+(1-RXi**2)/8._dp*(coup2+coup3))*MVWRm2-(4._dp*coup1+coup2+coup3)*A0m2)
res = res +1* SumI  
res = oo16pi2*res 
 
End Subroutine Pi1LoopVZR 
 
Subroutine DerPi1LoopVZR(p2,Mhh,Mhh2,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,             & 
& MFv,MFv2,MVZ,MVZ2,MVZR,MVZR2,MHpm,MHpm2,MVWLm,MVWLm2,MVWRm,MVWRm2,cplAhhhVZR,          & 
& cplcFdFdVZRL,cplcFdFdVZRR,cplcFeFeVZRL,cplcFeFeVZRR,cplcFuFuVZRL,cplcFuFuVZRR,         & 
& cplFvFvVZRL,cplFvFvVZRR,cplcgWLmgWLmVZR,cplcgWRmgWLmVZR,cplcgWLpgWLpVZR,               & 
& cplcgWRpgWLpVZR,cplcgWRmgWRmVZR,cplcgWRpgWRpVZR,cplhhVPVZR,cplhhVZVZR,cplhhVZRVZR,     & 
& cplHpmcHpmVZR,cplHpmVWLmVZR,cplHpmVWRmVZR,cplcVWLmVWLmVZR,cplcVWRmVWLmVZR,             & 
& cplcVWRmVWRmVZR,cplAhAhVZRVZR,cplhhhhVZRVZR,cplHpmcHpmVZRVZR,cplcVWLmVWLmVZRVZR1,      & 
& cplcVWLmVWLmVZRVZR2,cplcVWLmVWLmVZRVZR3,cplcVWRmVWRmVZRVZR1,cplcVWRmVWRmVZRVZR2,       & 
& cplcVWRmVWRmVZRVZR3,kont,res)

Implicit None 
Real(dp), Intent(in) :: Mhh(4),Mhh2(4),MAh(4),MAh2(4),MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),           & 
& MFv(9),MFv2(9),MVZ,MVZ2,MVZR,MVZR2,MHpm(4),MHpm2(4),MVWLm,MVWLm2,MVWRm,MVWRm2

Complex(dp), Intent(in) :: cplAhhhVZR(4,4),cplcFdFdVZRL(3,3),cplcFdFdVZRR(3,3),cplcFeFeVZRL(3,3),cplcFeFeVZRR(3,3),& 
& cplcFuFuVZRL(3,3),cplcFuFuVZRR(3,3),cplFvFvVZRL(9,9),cplFvFvVZRR(9,9),cplcgWLmgWLmVZR, & 
& cplcgWRmgWLmVZR,cplcgWLpgWLpVZR,cplcgWRpgWLpVZR,cplcgWRmgWRmVZR,cplcgWRpgWRpVZR,       & 
& cplhhVPVZR(4),cplhhVZVZR(4),cplhhVZRVZR(4),cplHpmcHpmVZR(4,4),cplHpmVWLmVZR(4),        & 
& cplHpmVWRmVZR(4),cplcVWLmVWLmVZR,cplcVWRmVWLmVZR,cplcVWRmVWRmVZR,cplAhAhVZRVZR(4,4),   & 
& cplhhhhVZRVZR(4,4),cplHpmcHpmVZRVZR(4,4),cplcVWLmVWLmVZRVZR1,cplcVWLmVWLmVZRVZR2,      & 
& cplcVWLmVWLmVZRVZR3,cplcVWRmVWRmVZRVZR1,cplcVWRmVWRmVZRVZR2,cplcVWRmVWRmVZRVZR3

Integer, Intent(inout) :: kont 
Real(dp) :: B0m2, F0m2, G0m2, B1m2, H0m2, B22m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2, A0m12, A0m22 
Complex(dp), Intent(inout) :: res 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2, coup3, temp, sumI 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
Real(dp) ::MVG,MVP,MVG2,MVP2
MVG = Mass_Regulator_PhotonGluon 
MVP = Mass_Regulator_PhotonGluon 
MVG2 = Mass_Regulator_PhotonGluon**2 
MVP2 = Mass_Regulator_PhotonGluon**2 

res = 0._dp 
 
!------------------------ 
! hh, Ah 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
       Do i2 = 1, 4
 B22m2 = Real(DerVSSloop(p2,MAh2(i2),Mhh2(i1)),dp)  
coup1 = cplAhhhVZR(i2,i1)
    SumI = Abs(coup1)**2*B22m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fd], Fd 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 H0m2 = Real(SA_DerHloop(p2,MFd2(i1),MFd2(i2)),dp) 
B0m2 = 4._dp*MFd(i1)*MFd(i2)*Real(SA_DerB0(p2,MFd2(i1),MFd2(i2)),dp) 
coupL1 = cplcFdFdVZRL(i1,i2)
coupR1 = cplcFdFdVZRR(i1,i2)
    SumI = (Abs(coupL1)**2+Abs(coupR1)**2)*H0m2 & 
                & + (Real(Conjg(coupL1)*coupR1,dp))*B0m2 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fe], Fe 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 H0m2 = Real(SA_DerHloop(p2,MFe2(i1),MFe2(i2)),dp) 
B0m2 = 4._dp*MFe(i1)*MFe(i2)*Real(SA_DerB0(p2,MFe2(i1),MFe2(i2)),dp) 
coupL1 = cplcFeFeVZRL(i1,i2)
coupR1 = cplcFeFeVZRR(i1,i2)
    SumI = (Abs(coupL1)**2+Abs(coupR1)**2)*H0m2 & 
                & + (Real(Conjg(coupL1)*coupR1,dp))*B0m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fu], Fu 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 H0m2 = Real(SA_DerHloop(p2,MFu2(i1),MFu2(i2)),dp) 
B0m2 = 4._dp*MFu(i1)*MFu(i2)*Real(SA_DerB0(p2,MFu2(i1),MFu2(i2)),dp) 
coupL1 = cplcFuFuVZRL(i1,i2)
coupR1 = cplcFuFuVZRR(i1,i2)
    SumI = (Abs(coupL1)**2+Abs(coupR1)**2)*H0m2 & 
                & + (Real(Conjg(coupL1)*coupR1,dp))*B0m2 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! Fv, Fv 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 9
       Do i2 = 1, 9
 H0m2 = Real(SA_DerHloop(p2,MFv2(i1),MFv2(i2)),dp) 
B0m2 = 4._dp*MFv(i1)*MFv(i2)*Real(SA_DerB0(p2,MFv2(i1),MFv2(i2)),dp) 
coupL1 = cplFvFvVZRL(i1,i2)
coupR1 = cplFvFvVZRR(i1,i2)
    SumI = (Abs(coupL1)**2+Abs(coupR1)**2)*H0m2 & 
                & + (Real(Conjg(coupL1)*coupR1,dp))*B0m2 
res = res +0.5_dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[gWLm], gWLm 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = Real(DerVGGloop(p2,MVWLm2,MVWLm2),dp)
coup1 = cplcgWLmgWLmVZR
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWRm], gWLm 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = Real(DerVGGloop(p2,MVWLm2,MVWRm2),dp)
coup1 = cplcgWRmgWLmVZR
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +2._dp* SumI  
!------------------------ 
! bar[gWLmC], gWLmC 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = Real(DerVGGloop(p2,MVWLm2,MVWLm2),dp)
coup1 = cplcgWLpgWLpVZR
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWRmC], gWLmC 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = Real(DerVGGloop(p2,MVWLm2,MVWRm2),dp)
coup1 = cplcgWRpgWLpVZR
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +2._dp* SumI  
!------------------------ 
! bar[gWRm], gWRm 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = Real(DerVGGloop(p2,MVWRm2,MVWRm2),dp)
coup1 = cplcgWRmgWRmVZR
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWRmC], gWRmC 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = Real(DerVGGloop(p2,MVWRm2,MVWRm2),dp)
coup1 = cplcgWRpgWRpVZR
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! VP, hh 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 B0m2 = Real(DerVVSloop(p2,MVP2,Mhh2(i2)),dp)
coup1 = cplhhVPVZR(i2)
    SumI = Abs(coup1)**2*B0m2 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! VZ, hh 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 B0m2 = Real(DerVVSloop(p2,MVZ2,Mhh2(i2)),dp)
coup1 = cplhhVZVZR(i2)
    SumI = Abs(coup1)**2*B0m2 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! VZR, hh 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 B0m2 = Real(DerVVSloop(p2,MVZR2,Mhh2(i2)),dp)
coup1 = cplhhVZRVZR(i2)
    SumI = Abs(coup1)**2*B0m2 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! conj[Hpm], Hpm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
       Do i2 = 1, 4
 B22m2 = Real(DerVSSloop(p2,MHpm2(i2),MHpm2(i1)),dp)  
coup1 = cplHpmcHpmVZR(i2,i1)
    SumI = Abs(coup1)**2*B22m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! VWLm, Hpm 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 B0m2 = Real(DerVVSloop(p2,MVWLm2,MHpm2(i2)),dp)
coup1 = cplHpmVWLmVZR(i2)
    SumI = Abs(coup1)**2*B0m2 
res = res +2._dp* SumI  
    End Do 
 !------------------------ 
! VWRm, Hpm 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 B0m2 = Real(DerVVSloop(p2,MVWRm2,MHpm2(i2)),dp)
coup1 = cplHpmVWRmVZR(i2)
    SumI = Abs(coup1)**2*B0m2 
res = res +2._dp* SumI  
    End Do 
 !------------------------ 
! conj[VWLm], VWLm 
!------------------------ 
sumI = 0._dp 
 
coup1 = cplcVWLmVWLmVZR
coup2 = Conjg(coup1) 
    SumI = -DerVVVloop(p2,MVWLm2,MVWLm2)*coup1*coup2 
res = res +1._dp* SumI  
!------------------------ 
! conj[VWRm], VWLm 
!------------------------ 
sumI = 0._dp 
 
coup1 = cplcVWRmVWLmVZR
coup2 = Conjg(coup1) 
    SumI = -DerVVVloop(p2,MVWRm2,MVWLm2)*coup1*coup2 
res = res +2._dp* SumI  
!------------------------ 
! conj[VWRm], VWRm 
!------------------------ 
sumI = 0._dp 
 
coup1 = cplcVWRmVWRmVZR
coup2 = Conjg(coup1) 
    SumI = -DerVVVloop(p2,MVWRm2,MVWRm2)*coup1*coup2 
res = res +1._dp* SumI  
!------------------------ 
! Ah 
!------------------------ 
    Do i1 = 1, 4
 SumI = 0._dp 
 A0m2 = SA_DerA0(MAh2(i1))
 coup1 = cplAhAhVZRVZR(i1,i1)
 SumI = coup1*A0m2 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! hh 
!------------------------ 
    Do i1 = 1, 4
 SumI = 0._dp 
 A0m2 = SA_DerA0(Mhh2(i1))
 coup1 = cplhhhhVZRVZR(i1,i1)
 SumI = coup1*A0m2 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! conj[Hpm] 
!------------------------ 
    Do i1 = 1, 4
 SumI = 0._dp 
 A0m2 = SA_DerA0(MHpm2(i1))
 coup1 = cplHpmcHpmVZRVZR(i1,i1)
 SumI = coup1*A0m2 
res = res +1* SumI  
      End Do 
 !------------------------ 
! conj[VWLm] 
!------------------------ 
SumI = 0._dp 
A0m2 = 3._dp/4._dp*SA_DerA0(MVWLm2) +RXi/4._dp*SA_DerA0(MVWLm2*RXi) 
coup1 = cplcVWLmVWLmVZRVZR1
coup2 = cplcVWLmVWLmVZRVZR2
coup3 = cplcVWLmVWLmVZRVZR3
SumI = ((2._dp*DerrMS*coup1+(1-RXi**2)/8._dp*(coup2+coup3))*MVWLm2-(4._dp*coup1+coup2+coup3)*A0m2)
res = res +1* SumI  
!------------------------ 
! conj[VWRm] 
!------------------------ 
SumI = 0._dp 
A0m2 = 3._dp/4._dp*SA_DerA0(MVWRm2) +RXi/4._dp*SA_DerA0(MVWRm2*RXi) 
coup1 = cplcVWRmVWRmVZRVZR1
coup2 = cplcVWRmVWRmVZRVZR2
coup3 = cplcVWRmVWRmVZRVZR3
SumI = ((2._dp*DerrMS*coup1+(1-RXi**2)/8._dp*(coup2+coup3))*MVWRm2-(4._dp*coup1+coup2+coup3)*A0m2)
res = res +1* SumI  
res = oo16pi2*res 
 
End Subroutine DerPi1LoopVZR 
 
Subroutine Pi1LoopVP(p2,Mhh,Mhh2,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,             & 
& MFv2,MVZ,MVZ2,MVZR,MVZR2,MHpm,MHpm2,MVWLm,MVWLm2,MVWRm,MVWRm2,cplAhhhVP,               & 
& cplcFdFdVPL,cplcFdFdVPR,cplcFeFeVPL,cplcFeFeVPR,cplcFuFuVPL,cplcFuFuVPR,               & 
& cplFvFvVPL,cplFvFvVPR,cplcgWLmgWLmVP,cplcgWRmgWLmVP,cplcgWLpgWLpVP,cplcgWRpgWLpVP,     & 
& cplcgWRmgWRmVP,cplcgWRpgWRpVP,cplhhVPVZ,cplhhVPVZR,cplHpmcHpmVP,cplHpmVPVWLm,          & 
& cplHpmVPVWRm,cplcVWLmVPVWLm,cplcVWRmVPVWLm,cplcVWRmVPVWRm,cplAhAhVPVP,cplhhhhVPVP,     & 
& cplHpmcHpmVPVP,cplcVWLmVPVPVWLm3,cplcVWLmVPVPVWLm1,cplcVWLmVPVPVWLm2,cplcVWRmVPVPVWRm3,& 
& cplcVWRmVPVPVWRm1,cplcVWRmVPVPVWRm2,kont,res)

Implicit None 
Real(dp), Intent(in) :: Mhh(4),Mhh2(4),MAh(4),MAh2(4),MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),           & 
& MFv(9),MFv2(9),MVZ,MVZ2,MVZR,MVZR2,MHpm(4),MHpm2(4),MVWLm,MVWLm2,MVWRm,MVWRm2

Complex(dp), Intent(in) :: cplAhhhVP(4,4),cplcFdFdVPL(3,3),cplcFdFdVPR(3,3),cplcFeFeVPL(3,3),cplcFeFeVPR(3,3),   & 
& cplcFuFuVPL(3,3),cplcFuFuVPR(3,3),cplFvFvVPL(9,9),cplFvFvVPR(9,9),cplcgWLmgWLmVP,      & 
& cplcgWRmgWLmVP,cplcgWLpgWLpVP,cplcgWRpgWLpVP,cplcgWRmgWRmVP,cplcgWRpgWRpVP,            & 
& cplhhVPVZ(4),cplhhVPVZR(4),cplHpmcHpmVP(4,4),cplHpmVPVWLm(4),cplHpmVPVWRm(4),          & 
& cplcVWLmVPVWLm,cplcVWRmVPVWLm,cplcVWRmVPVWRm,cplAhAhVPVP(4,4),cplhhhhVPVP(4,4),        & 
& cplHpmcHpmVPVP(4,4),cplcVWLmVPVPVWLm3,cplcVWLmVPVPVWLm1,cplcVWLmVPVPVWLm2,             & 
& cplcVWRmVPVPVWRm3,cplcVWRmVPVPVWRm1,cplcVWRmVPVPVWRm2

Integer, Intent(inout) :: kont 
Real(dp) :: B0m2, F0m2, G0m2, B1m2, H0m2, B22m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2, A0m12, A0m22 
Complex(dp), Intent(inout) :: res 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2, coup3, temp, sumI 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
res = 0._dp 
 
!------------------------ 
! hh, Ah 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
       Do i2 = 1, 4
 If (((.not.OnlyHeavyStates).and.(.not.OnlyLightStates)) & 
  & .or.((OnlyHeavyStates).and.(MAh2(i2).gt.50._dp**2).and.(Mhh2(i1).gt.50._dp**2))   & 
  & .or.((OnlyLightStates).and.(MAh2(i2).lt.50._dp**2).and.(Mhh2(i1).lt.50._dp**2)) )   Then 
B22m2 = Real(VSSloop(p2,MAh2(i2),Mhh2(i1)),dp)  
coup1 = cplAhhhVP(i2,i1)
    SumI = Abs(coup1)**2*B22m2 
res = res +1._dp* SumI  
End If 
      End Do 
     End Do 
 !------------------------ 
! bar[Fd], Fd 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 If (((.not.OnlyHeavyStates).and.(.not.OnlyLightStates)) & 
  & .or.((OnlyHeavyStates).and.(MFd2(i1).gt.50._dp**2).and.(MFd2(i2).gt.50._dp**2))   & 
  & .or.((OnlyLightStates).and.(MFd2(i1).lt.50._dp**2).and.(MFd2(i2).lt.50._dp**2)) )   Then 
H0m2 = Real(SA_Hloop(p2,MFd2(i1),MFd2(i2)),dp) 
B0m2 = 4._dp*MFd(i1)*MFd(i2)*Real(SA_B0(p2,MFd2(i1),MFd2(i2)),dp) 
coupL1 = cplcFdFdVPL(i1,i2)
coupR1 = cplcFdFdVPR(i1,i2)
    SumI = (Abs(coupL1)**2+Abs(coupR1)**2)*H0m2 & 
                & + (Real(Conjg(coupL1)*coupR1,dp))*B0m2 
res = res +3._dp* SumI  
End If 
      End Do 
     End Do 
 !------------------------ 
! bar[Fe], Fe 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 If (((.not.OnlyHeavyStates).and.(.not.OnlyLightStates)) & 
  & .or.((OnlyHeavyStates).and.(MFe2(i1).gt.50._dp**2).and.(MFe2(i2).gt.50._dp**2))   & 
  & .or.((OnlyLightStates).and.(MFe2(i1).lt.50._dp**2).and.(MFe2(i2).lt.50._dp**2)) )   Then 
H0m2 = Real(SA_Hloop(p2,MFe2(i1),MFe2(i2)),dp) 
B0m2 = 4._dp*MFe(i1)*MFe(i2)*Real(SA_B0(p2,MFe2(i1),MFe2(i2)),dp) 
coupL1 = cplcFeFeVPL(i1,i2)
coupR1 = cplcFeFeVPR(i1,i2)
    SumI = (Abs(coupL1)**2+Abs(coupR1)**2)*H0m2 & 
                & + (Real(Conjg(coupL1)*coupR1,dp))*B0m2 
res = res +1._dp* SumI  
End If 
      End Do 
     End Do 
 !------------------------ 
! bar[Fu], Fu 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 If (((.not.OnlyHeavyStates).and.(.not.OnlyLightStates)) & 
  & .or.((OnlyHeavyStates).and.(MFu2(i1).gt.50._dp**2).and.(MFu2(i2).gt.50._dp**2))   & 
  & .or.((OnlyLightStates).and.(MFu2(i1).lt.50._dp**2).and.(MFu2(i2).lt.50._dp**2)) )   Then 
H0m2 = Real(SA_Hloop(p2,MFu2(i1),MFu2(i2)),dp) 
B0m2 = 4._dp*MFu(i1)*MFu(i2)*Real(SA_B0(p2,MFu2(i1),MFu2(i2)),dp) 
coupL1 = cplcFuFuVPL(i1,i2)
coupR1 = cplcFuFuVPR(i1,i2)
    SumI = (Abs(coupL1)**2+Abs(coupR1)**2)*H0m2 & 
                & + (Real(Conjg(coupL1)*coupR1,dp))*B0m2 
res = res +3._dp* SumI  
End If 
      End Do 
     End Do 
 !------------------------ 
! Fv, Fv 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 9
       Do i2 = 1, 9
 If (((.not.OnlyHeavyStates).and.(.not.OnlyLightStates)) & 
  & .or.((OnlyHeavyStates).and.(MFv2(i1).gt.50._dp**2).and.(MFv2(i2).gt.50._dp**2))   & 
  & .or.((OnlyLightStates).and.(MFv2(i1).lt.50._dp**2).and.(MFv2(i2).lt.50._dp**2)) )   Then 
H0m2 = Real(SA_Hloop(p2,MFv2(i1),MFv2(i2)),dp) 
B0m2 = 4._dp*MFv(i1)*MFv(i2)*Real(SA_B0(p2,MFv2(i1),MFv2(i2)),dp) 
coupL1 = cplFvFvVPL(i1,i2)
coupR1 = cplFvFvVPR(i1,i2)
    SumI = (Abs(coupL1)**2+Abs(coupR1)**2)*H0m2 & 
                & + (Real(Conjg(coupL1)*coupR1,dp))*B0m2 
res = res +0.5_dp* SumI  
End If 
      End Do 
     End Do 
 !------------------------ 
! bar[gWLm], gWLm 
!------------------------ 
sumI = 0._dp 
 
If (((.not.OnlyHeavyStates).and.(.not.OnlyLightStates)) & 
  & .or.((OnlyHeavyStates).and.(MVWLm2.gt.50._dp**2).and.(MVWLm2.gt.50._dp**2))   & 
  & .or.((OnlyLightStates).and.(MVWLm2.lt.50._dp**2).and.(MVWLm2.lt.50._dp**2)) )   Then 
SumI = 0._dp 
B0m2 = Real(VGGloop(p2,MVWLm2,MVWLm2),dp)
coup1 = cplcgWLmgWLmVP
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
End If 
!------------------------ 
! bar[gWRm], gWLm 
!------------------------ 
sumI = 0._dp 
 
If (((.not.OnlyHeavyStates).and.(.not.OnlyLightStates)) & 
  & .or.((OnlyHeavyStates).and.(MVWLm2.gt.50._dp**2).and.(MVWRm2.gt.50._dp**2))   & 
  & .or.((OnlyLightStates).and.(MVWLm2.lt.50._dp**2).and.(MVWRm2.lt.50._dp**2)) )   Then 
SumI = 0._dp 
B0m2 = Real(VGGloop(p2,MVWLm2,MVWRm2),dp)
coup1 = cplcgWRmgWLmVP
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +2._dp* SumI  
End If 
!------------------------ 
! bar[gWLmC], gWLmC 
!------------------------ 
sumI = 0._dp 
 
If (((.not.OnlyHeavyStates).and.(.not.OnlyLightStates)) & 
  & .or.((OnlyHeavyStates).and.(MVWLm2.gt.50._dp**2).and.(MVWLm2.gt.50._dp**2))   & 
  & .or.((OnlyLightStates).and.(MVWLm2.lt.50._dp**2).and.(MVWLm2.lt.50._dp**2)) )   Then 
SumI = 0._dp 
B0m2 = Real(VGGloop(p2,MVWLm2,MVWLm2),dp)
coup1 = cplcgWLpgWLpVP
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
End If 
!------------------------ 
! bar[gWRmC], gWLmC 
!------------------------ 
sumI = 0._dp 
 
If (((.not.OnlyHeavyStates).and.(.not.OnlyLightStates)) & 
  & .or.((OnlyHeavyStates).and.(MVWLm2.gt.50._dp**2).and.(MVWRm2.gt.50._dp**2))   & 
  & .or.((OnlyLightStates).and.(MVWLm2.lt.50._dp**2).and.(MVWRm2.lt.50._dp**2)) )   Then 
SumI = 0._dp 
B0m2 = Real(VGGloop(p2,MVWLm2,MVWRm2),dp)
coup1 = cplcgWRpgWLpVP
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +2._dp* SumI  
End If 
!------------------------ 
! bar[gWRm], gWRm 
!------------------------ 
sumI = 0._dp 
 
If (((.not.OnlyHeavyStates).and.(.not.OnlyLightStates)) & 
  & .or.((OnlyHeavyStates).and.(MVWRm2.gt.50._dp**2).and.(MVWRm2.gt.50._dp**2))   & 
  & .or.((OnlyLightStates).and.(MVWRm2.lt.50._dp**2).and.(MVWRm2.lt.50._dp**2)) )   Then 
SumI = 0._dp 
B0m2 = Real(VGGloop(p2,MVWRm2,MVWRm2),dp)
coup1 = cplcgWRmgWRmVP
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
End If 
!------------------------ 
! bar[gWRmC], gWRmC 
!------------------------ 
sumI = 0._dp 
 
If (((.not.OnlyHeavyStates).and.(.not.OnlyLightStates)) & 
  & .or.((OnlyHeavyStates).and.(MVWRm2.gt.50._dp**2).and.(MVWRm2.gt.50._dp**2))   & 
  & .or.((OnlyLightStates).and.(MVWRm2.lt.50._dp**2).and.(MVWRm2.lt.50._dp**2)) )   Then 
SumI = 0._dp 
B0m2 = Real(VGGloop(p2,MVWRm2,MVWRm2),dp)
coup1 = cplcgWRpgWRpVP
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
End If 
!------------------------ 
! VZ, hh 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 If (((.not.OnlyHeavyStates).and.(.not.OnlyLightStates)) & 
  & .or.((OnlyHeavyStates).and.(MVZ2.gt.50._dp**2).and.(Mhh2(i2).gt.50._dp**2))   & 
  & .or.((OnlyLightStates).and.(MVZ2.lt.50._dp**2).and.(Mhh2(i2).lt.50._dp**2)) )   Then 
B0m2 = Real(VVSloop(p2,MVZ2,Mhh2(i2)),dp)
coup1 = cplhhVPVZ(i2)
    SumI = Abs(coup1)**2*B0m2 
res = res +1._dp* SumI  
End If 
    End Do 
 !------------------------ 
! VZR, hh 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 If (((.not.OnlyHeavyStates).and.(.not.OnlyLightStates)) & 
  & .or.((OnlyHeavyStates).and.(MVZR2.gt.50._dp**2).and.(Mhh2(i2).gt.50._dp**2))   & 
  & .or.((OnlyLightStates).and.(MVZR2.lt.50._dp**2).and.(Mhh2(i2).lt.50._dp**2)) )   Then 
B0m2 = Real(VVSloop(p2,MVZR2,Mhh2(i2)),dp)
coup1 = cplhhVPVZR(i2)
    SumI = Abs(coup1)**2*B0m2 
res = res +1._dp* SumI  
End If 
    End Do 
 !------------------------ 
! conj[Hpm], Hpm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
       Do i2 = 1, 4
 If (((.not.OnlyHeavyStates).and.(.not.OnlyLightStates)) & 
  & .or.((OnlyHeavyStates).and.(MHpm2(i2).gt.50._dp**2).and.(MHpm2(i1).gt.50._dp**2))   & 
  & .or.((OnlyLightStates).and.(MHpm2(i2).lt.50._dp**2).and.(MHpm2(i1).lt.50._dp**2)) )   Then 
B22m2 = Real(VSSloop(p2,MHpm2(i2),MHpm2(i1)),dp)  
coup1 = cplHpmcHpmVP(i2,i1)
    SumI = Abs(coup1)**2*B22m2 
res = res +1._dp* SumI  
End If 
      End Do 
     End Do 
 !------------------------ 
! VWLm, Hpm 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 If (((.not.OnlyHeavyStates).and.(.not.OnlyLightStates)) & 
  & .or.((OnlyHeavyStates).and.(MVWLm2.gt.50._dp**2).and.(MHpm2(i2).gt.50._dp**2))   & 
  & .or.((OnlyLightStates).and.(MVWLm2.lt.50._dp**2).and.(MHpm2(i2).lt.50._dp**2)) )   Then 
B0m2 = Real(VVSloop(p2,MVWLm2,MHpm2(i2)),dp)
coup1 = cplHpmVPVWLm(i2)
    SumI = Abs(coup1)**2*B0m2 
res = res +2._dp* SumI  
End If 
    End Do 
 !------------------------ 
! VWRm, Hpm 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 If (((.not.OnlyHeavyStates).and.(.not.OnlyLightStates)) & 
  & .or.((OnlyHeavyStates).and.(MVWRm2.gt.50._dp**2).and.(MHpm2(i2).gt.50._dp**2))   & 
  & .or.((OnlyLightStates).and.(MVWRm2.lt.50._dp**2).and.(MHpm2(i2).lt.50._dp**2)) )   Then 
B0m2 = Real(VVSloop(p2,MVWRm2,MHpm2(i2)),dp)
coup1 = cplHpmVPVWRm(i2)
    SumI = Abs(coup1)**2*B0m2 
res = res +2._dp* SumI  
End If 
    End Do 
 !------------------------ 
! conj[VWLm], VWLm 
!------------------------ 
sumI = 0._dp 
 
If (((.not.OnlyHeavyStates).and.(.not.OnlyLightStates)) & 
  & .or.((OnlyHeavyStates).and.(MVWLm2.gt.50._dp**2).and.(MVWLm2.gt.50._dp**2))   & 
  & .or.((OnlyLightStates).and.(MVWLm2.lt.50._dp**2).and.(MVWLm2.lt.50._dp**2)) )   Then 
coup1 = cplcVWLmVPVWLm
coup2 = Conjg(coup1) 
    SumI = -VVVloop(p2,MVWLm2,MVWLm2)*coup1*coup2 
res = res +1._dp* SumI  
End If 
!------------------------ 
! conj[VWRm], VWLm 
!------------------------ 
sumI = 0._dp 
 
If (((.not.OnlyHeavyStates).and.(.not.OnlyLightStates)) & 
  & .or.((OnlyHeavyStates).and.(MVWRm2.gt.50._dp**2).and.(MVWLm2.gt.50._dp**2))   & 
  & .or.((OnlyLightStates).and.(MVWRm2.lt.50._dp**2).and.(MVWLm2.lt.50._dp**2)) )   Then 
coup1 = cplcVWRmVPVWLm
coup2 = Conjg(coup1) 
    SumI = -VVVloop(p2,MVWRm2,MVWLm2)*coup1*coup2 
res = res +2._dp* SumI  
End If 
!------------------------ 
! conj[VWRm], VWRm 
!------------------------ 
sumI = 0._dp 
 
If (((.not.OnlyHeavyStates).and.(.not.OnlyLightStates)) & 
  & .or.((OnlyHeavyStates).and.(MVWRm2.gt.50._dp**2).and.(MVWRm2.gt.50._dp**2))   & 
  & .or.((OnlyLightStates).and.(MVWRm2.lt.50._dp**2).and.(MVWRm2.lt.50._dp**2)) )   Then 
coup1 = cplcVWRmVPVWRm
coup2 = Conjg(coup1) 
    SumI = -VVVloop(p2,MVWRm2,MVWRm2)*coup1*coup2 
res = res +1._dp* SumI  
End If 
!------------------------ 
! Ah 
!------------------------ 
    Do i1 = 1, 4
 If (((.not.OnlyHeavyStates).and.(.not.OnlyLightStates)) & 
  & .or.((OnlyHeavyStates).and.(MAh2(i1).gt.50._dp**2))   & 
  & .or.((OnlyLightStates).and.(MAh2(i1).lt.50._dp**2)) )   Then 
SumI = 0._dp 
 A0m2 = SA_A0(MAh2(i1))
 coup1 = cplAhAhVPVP(i1,i1)
 SumI = coup1*A0m2 
res = res +1._dp/2._dp* SumI  
End If 
      End Do 
 !------------------------ 
! hh 
!------------------------ 
    Do i1 = 1, 4
 If (((.not.OnlyHeavyStates).and.(.not.OnlyLightStates)) & 
  & .or.((OnlyHeavyStates).and.(Mhh2(i1).gt.50._dp**2))   & 
  & .or.((OnlyLightStates).and.(Mhh2(i1).lt.50._dp**2)) )   Then 
SumI = 0._dp 
 A0m2 = SA_A0(Mhh2(i1))
 coup1 = cplhhhhVPVP(i1,i1)
 SumI = coup1*A0m2 
res = res +1._dp/2._dp* SumI  
End If 
      End Do 
 !------------------------ 
! conj[Hpm] 
!------------------------ 
    Do i1 = 1, 4
 If (((.not.OnlyHeavyStates).and.(.not.OnlyLightStates)) & 
  & .or.((OnlyHeavyStates).and.(MHpm2(i1).gt.50._dp**2))   & 
  & .or.((OnlyLightStates).and.(MHpm2(i1).lt.50._dp**2)) )   Then 
SumI = 0._dp 
 A0m2 = SA_A0(MHpm2(i1))
 coup1 = cplHpmcHpmVPVP(i1,i1)
 SumI = coup1*A0m2 
res = res +1* SumI  
End If 
      End Do 
 !------------------------ 
! conj[VWLm] 
!------------------------ 
If (((.not.OnlyHeavyStates).and.(.not.OnlyLightStates)) & 
  & .or.((OnlyHeavyStates).and.(MVWLm2.gt.50._dp**2))   & 
  & .or.((OnlyLightStates).and.(MVWLm2.lt.50._dp**2)) )   Then 
SumI = 0._dp 
A0m2 = 3._dp/4._dp*SA_A0(MVWLm2) +RXi/4._dp*SA_A0(MVWLm2*RXi) 
coup1 = cplcVWLmVPVPVWLm3
coup2 = cplcVWLmVPVPVWLm1
coup3 = cplcVWLmVPVPVWLm2
SumI = ((2._dp*rMS*coup1+(1-RXi**2)/8._dp*(coup2+coup3))*MVWLm2-(4._dp*coup1+coup2+coup3)*A0m2)
res = res +1* SumI  
End If 
!------------------------ 
! conj[VWRm] 
!------------------------ 
If (((.not.OnlyHeavyStates).and.(.not.OnlyLightStates)) & 
  & .or.((OnlyHeavyStates).and.(MVWRm2.gt.50._dp**2))   & 
  & .or.((OnlyLightStates).and.(MVWRm2.lt.50._dp**2)) )   Then 
SumI = 0._dp 
A0m2 = 3._dp/4._dp*SA_A0(MVWRm2) +RXi/4._dp*SA_A0(MVWRm2*RXi) 
coup1 = cplcVWRmVPVPVWRm3
coup2 = cplcVWRmVPVPVWRm1
coup3 = cplcVWRmVPVPVWRm2
SumI = ((2._dp*rMS*coup1+(1-RXi**2)/8._dp*(coup2+coup3))*MVWRm2-(4._dp*coup1+coup2+coup3)*A0m2)
res = res +1* SumI  
End If 
res = oo16pi2*res 
 
End Subroutine Pi1LoopVP 
 
Subroutine DerPi1LoopVP(p2,Mhh,Mhh2,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,              & 
& MFv,MFv2,MVZ,MVZ2,MVZR,MVZR2,MHpm,MHpm2,MVWLm,MVWLm2,MVWRm,MVWRm2,cplAhhhVP,           & 
& cplcFdFdVPL,cplcFdFdVPR,cplcFeFeVPL,cplcFeFeVPR,cplcFuFuVPL,cplcFuFuVPR,               & 
& cplFvFvVPL,cplFvFvVPR,cplcgWLmgWLmVP,cplcgWRmgWLmVP,cplcgWLpgWLpVP,cplcgWRpgWLpVP,     & 
& cplcgWRmgWRmVP,cplcgWRpgWRpVP,cplhhVPVZ,cplhhVPVZR,cplHpmcHpmVP,cplHpmVPVWLm,          & 
& cplHpmVPVWRm,cplcVWLmVPVWLm,cplcVWRmVPVWLm,cplcVWRmVPVWRm,cplAhAhVPVP,cplhhhhVPVP,     & 
& cplHpmcHpmVPVP,cplcVWLmVPVPVWLm3,cplcVWLmVPVPVWLm1,cplcVWLmVPVPVWLm2,cplcVWRmVPVPVWRm3,& 
& cplcVWRmVPVPVWRm1,cplcVWRmVPVPVWRm2,kont,res)

Implicit None 
Real(dp), Intent(in) :: Mhh(4),Mhh2(4),MAh(4),MAh2(4),MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),           & 
& MFv(9),MFv2(9),MVZ,MVZ2,MVZR,MVZR2,MHpm(4),MHpm2(4),MVWLm,MVWLm2,MVWRm,MVWRm2

Complex(dp), Intent(in) :: cplAhhhVP(4,4),cplcFdFdVPL(3,3),cplcFdFdVPR(3,3),cplcFeFeVPL(3,3),cplcFeFeVPR(3,3),   & 
& cplcFuFuVPL(3,3),cplcFuFuVPR(3,3),cplFvFvVPL(9,9),cplFvFvVPR(9,9),cplcgWLmgWLmVP,      & 
& cplcgWRmgWLmVP,cplcgWLpgWLpVP,cplcgWRpgWLpVP,cplcgWRmgWRmVP,cplcgWRpgWRpVP,            & 
& cplhhVPVZ(4),cplhhVPVZR(4),cplHpmcHpmVP(4,4),cplHpmVPVWLm(4),cplHpmVPVWRm(4),          & 
& cplcVWLmVPVWLm,cplcVWRmVPVWLm,cplcVWRmVPVWRm,cplAhAhVPVP(4,4),cplhhhhVPVP(4,4),        & 
& cplHpmcHpmVPVP(4,4),cplcVWLmVPVPVWLm3,cplcVWLmVPVPVWLm1,cplcVWLmVPVPVWLm2,             & 
& cplcVWRmVPVPVWRm3,cplcVWRmVPVPVWRm1,cplcVWRmVPVPVWRm2

Integer, Intent(inout) :: kont 
Real(dp) :: B0m2, F0m2, G0m2, B1m2, H0m2, B22m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2, A0m12, A0m22 
Complex(dp), Intent(inout) :: res 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2, coup3, temp, sumI 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
Real(dp) ::MVG,MVP,MVG2,MVP2
MVG = Mass_Regulator_PhotonGluon 
MVP = Mass_Regulator_PhotonGluon 
MVG2 = Mass_Regulator_PhotonGluon**2 
MVP2 = Mass_Regulator_PhotonGluon**2 

res = 0._dp 
 
!------------------------ 
! hh, Ah 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
       Do i2 = 1, 4
 If (((.not.OnlyHeavyStates).and.(.not.OnlyLightStates)) & 
  & .or.((OnlyHeavyStates).and.(MAh2(i2).gt.50._dp**2).and.(Mhh2(i1).gt.50._dp**2))   & 
  & .or.((OnlyLightStates).and.(MAh2(i2).lt.50._dp**2).and.(Mhh2(i1).lt.50._dp**2)) )   Then 
B22m2 = Real(DerVSSloop(p2,MAh2(i2),Mhh2(i1)),dp)  
coup1 = cplAhhhVP(i2,i1)
    SumI = Abs(coup1)**2*B22m2 
res = res +1._dp* SumI  
End If 
      End Do 
     End Do 
 !------------------------ 
! bar[Fd], Fd 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 If (((.not.OnlyHeavyStates).and.(.not.OnlyLightStates)) & 
  & .or.((OnlyHeavyStates).and.(MFd2(i1).gt.50._dp**2).and.(MFd2(i2).gt.50._dp**2))   & 
  & .or.((OnlyLightStates).and.(MFd2(i1).lt.50._dp**2).and.(MFd2(i2).lt.50._dp**2)) )   Then 
H0m2 = Real(SA_DerHloop(p2,MFd2(i1),MFd2(i2)),dp) 
B0m2 = 4._dp*MFd(i1)*MFd(i2)*Real(SA_DerB0(p2,MFd2(i1),MFd2(i2)),dp) 
coupL1 = cplcFdFdVPL(i1,i2)
coupR1 = cplcFdFdVPR(i1,i2)
    SumI = (Abs(coupL1)**2+Abs(coupR1)**2)*H0m2 & 
                & + (Real(Conjg(coupL1)*coupR1,dp))*B0m2 
res = res +3._dp* SumI  
End If 
      End Do 
     End Do 
 !------------------------ 
! bar[Fe], Fe 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 If (((.not.OnlyHeavyStates).and.(.not.OnlyLightStates)) & 
  & .or.((OnlyHeavyStates).and.(MFe2(i1).gt.50._dp**2).and.(MFe2(i2).gt.50._dp**2))   & 
  & .or.((OnlyLightStates).and.(MFe2(i1).lt.50._dp**2).and.(MFe2(i2).lt.50._dp**2)) )   Then 
H0m2 = Real(SA_DerHloop(p2,MFe2(i1),MFe2(i2)),dp) 
B0m2 = 4._dp*MFe(i1)*MFe(i2)*Real(SA_DerB0(p2,MFe2(i1),MFe2(i2)),dp) 
coupL1 = cplcFeFeVPL(i1,i2)
coupR1 = cplcFeFeVPR(i1,i2)
    SumI = (Abs(coupL1)**2+Abs(coupR1)**2)*H0m2 & 
                & + (Real(Conjg(coupL1)*coupR1,dp))*B0m2 
res = res +1._dp* SumI  
End If 
      End Do 
     End Do 
 !------------------------ 
! bar[Fu], Fu 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 If (((.not.OnlyHeavyStates).and.(.not.OnlyLightStates)) & 
  & .or.((OnlyHeavyStates).and.(MFu2(i1).gt.50._dp**2).and.(MFu2(i2).gt.50._dp**2))   & 
  & .or.((OnlyLightStates).and.(MFu2(i1).lt.50._dp**2).and.(MFu2(i2).lt.50._dp**2)) )   Then 
H0m2 = Real(SA_DerHloop(p2,MFu2(i1),MFu2(i2)),dp) 
B0m2 = 4._dp*MFu(i1)*MFu(i2)*Real(SA_DerB0(p2,MFu2(i1),MFu2(i2)),dp) 
coupL1 = cplcFuFuVPL(i1,i2)
coupR1 = cplcFuFuVPR(i1,i2)
    SumI = (Abs(coupL1)**2+Abs(coupR1)**2)*H0m2 & 
                & + (Real(Conjg(coupL1)*coupR1,dp))*B0m2 
res = res +3._dp* SumI  
End If 
      End Do 
     End Do 
 !------------------------ 
! Fv, Fv 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 9
       Do i2 = 1, 9
 If (((.not.OnlyHeavyStates).and.(.not.OnlyLightStates)) & 
  & .or.((OnlyHeavyStates).and.(MFv2(i1).gt.50._dp**2).and.(MFv2(i2).gt.50._dp**2))   & 
  & .or.((OnlyLightStates).and.(MFv2(i1).lt.50._dp**2).and.(MFv2(i2).lt.50._dp**2)) )   Then 
H0m2 = Real(SA_DerHloop(p2,MFv2(i1),MFv2(i2)),dp) 
B0m2 = 4._dp*MFv(i1)*MFv(i2)*Real(SA_DerB0(p2,MFv2(i1),MFv2(i2)),dp) 
coupL1 = cplFvFvVPL(i1,i2)
coupR1 = cplFvFvVPR(i1,i2)
    SumI = (Abs(coupL1)**2+Abs(coupR1)**2)*H0m2 & 
                & + (Real(Conjg(coupL1)*coupR1,dp))*B0m2 
res = res +0.5_dp* SumI  
End If 
      End Do 
     End Do 
 !------------------------ 
! bar[gWLm], gWLm 
!------------------------ 
sumI = 0._dp 
 
If (((.not.OnlyHeavyStates).and.(.not.OnlyLightStates)) & 
  & .or.((OnlyHeavyStates).and.(MVWLm2.gt.50._dp**2).and.(MVWLm2.gt.50._dp**2))   & 
  & .or.((OnlyLightStates).and.(MVWLm2.lt.50._dp**2).and.(MVWLm2.lt.50._dp**2)) )   Then 
SumI = 0._dp 
B0m2 = Real(DerVGGloop(p2,MVWLm2,MVWLm2),dp)
coup1 = cplcgWLmgWLmVP
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
End If 
!------------------------ 
! bar[gWRm], gWLm 
!------------------------ 
sumI = 0._dp 
 
If (((.not.OnlyHeavyStates).and.(.not.OnlyLightStates)) & 
  & .or.((OnlyHeavyStates).and.(MVWLm2.gt.50._dp**2).and.(MVWRm2.gt.50._dp**2))   & 
  & .or.((OnlyLightStates).and.(MVWLm2.lt.50._dp**2).and.(MVWRm2.lt.50._dp**2)) )   Then 
SumI = 0._dp 
B0m2 = Real(DerVGGloop(p2,MVWLm2,MVWRm2),dp)
coup1 = cplcgWRmgWLmVP
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +2._dp* SumI  
End If 
!------------------------ 
! bar[gWLmC], gWLmC 
!------------------------ 
sumI = 0._dp 
 
If (((.not.OnlyHeavyStates).and.(.not.OnlyLightStates)) & 
  & .or.((OnlyHeavyStates).and.(MVWLm2.gt.50._dp**2).and.(MVWLm2.gt.50._dp**2))   & 
  & .or.((OnlyLightStates).and.(MVWLm2.lt.50._dp**2).and.(MVWLm2.lt.50._dp**2)) )   Then 
SumI = 0._dp 
B0m2 = Real(DerVGGloop(p2,MVWLm2,MVWLm2),dp)
coup1 = cplcgWLpgWLpVP
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
End If 
!------------------------ 
! bar[gWRmC], gWLmC 
!------------------------ 
sumI = 0._dp 
 
If (((.not.OnlyHeavyStates).and.(.not.OnlyLightStates)) & 
  & .or.((OnlyHeavyStates).and.(MVWLm2.gt.50._dp**2).and.(MVWRm2.gt.50._dp**2))   & 
  & .or.((OnlyLightStates).and.(MVWLm2.lt.50._dp**2).and.(MVWRm2.lt.50._dp**2)) )   Then 
SumI = 0._dp 
B0m2 = Real(DerVGGloop(p2,MVWLm2,MVWRm2),dp)
coup1 = cplcgWRpgWLpVP
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +2._dp* SumI  
End If 
!------------------------ 
! bar[gWRm], gWRm 
!------------------------ 
sumI = 0._dp 
 
If (((.not.OnlyHeavyStates).and.(.not.OnlyLightStates)) & 
  & .or.((OnlyHeavyStates).and.(MVWRm2.gt.50._dp**2).and.(MVWRm2.gt.50._dp**2))   & 
  & .or.((OnlyLightStates).and.(MVWRm2.lt.50._dp**2).and.(MVWRm2.lt.50._dp**2)) )   Then 
SumI = 0._dp 
B0m2 = Real(DerVGGloop(p2,MVWRm2,MVWRm2),dp)
coup1 = cplcgWRmgWRmVP
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
End If 
!------------------------ 
! bar[gWRmC], gWRmC 
!------------------------ 
sumI = 0._dp 
 
If (((.not.OnlyHeavyStates).and.(.not.OnlyLightStates)) & 
  & .or.((OnlyHeavyStates).and.(MVWRm2.gt.50._dp**2).and.(MVWRm2.gt.50._dp**2))   & 
  & .or.((OnlyLightStates).and.(MVWRm2.lt.50._dp**2).and.(MVWRm2.lt.50._dp**2)) )   Then 
SumI = 0._dp 
B0m2 = Real(DerVGGloop(p2,MVWRm2,MVWRm2),dp)
coup1 = cplcgWRpgWRpVP
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
End If 
!------------------------ 
! VZ, hh 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 If (((.not.OnlyHeavyStates).and.(.not.OnlyLightStates)) & 
  & .or.((OnlyHeavyStates).and.(MVZ2.gt.50._dp**2).and.(Mhh2(i2).gt.50._dp**2))   & 
  & .or.((OnlyLightStates).and.(MVZ2.lt.50._dp**2).and.(Mhh2(i2).lt.50._dp**2)) )   Then 
B0m2 = Real(DerVVSloop(p2,MVZ2,Mhh2(i2)),dp)
coup1 = cplhhVPVZ(i2)
    SumI = Abs(coup1)**2*B0m2 
res = res +1._dp* SumI  
End If 
    End Do 
 !------------------------ 
! VZR, hh 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 If (((.not.OnlyHeavyStates).and.(.not.OnlyLightStates)) & 
  & .or.((OnlyHeavyStates).and.(MVZR2.gt.50._dp**2).and.(Mhh2(i2).gt.50._dp**2))   & 
  & .or.((OnlyLightStates).and.(MVZR2.lt.50._dp**2).and.(Mhh2(i2).lt.50._dp**2)) )   Then 
B0m2 = Real(DerVVSloop(p2,MVZR2,Mhh2(i2)),dp)
coup1 = cplhhVPVZR(i2)
    SumI = Abs(coup1)**2*B0m2 
res = res +1._dp* SumI  
End If 
    End Do 
 !------------------------ 
! conj[Hpm], Hpm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
       Do i2 = 1, 4
 If (((.not.OnlyHeavyStates).and.(.not.OnlyLightStates)) & 
  & .or.((OnlyHeavyStates).and.(MHpm2(i2).gt.50._dp**2).and.(MHpm2(i1).gt.50._dp**2))   & 
  & .or.((OnlyLightStates).and.(MHpm2(i2).lt.50._dp**2).and.(MHpm2(i1).lt.50._dp**2)) )   Then 
B22m2 = Real(DerVSSloop(p2,MHpm2(i2),MHpm2(i1)),dp)  
coup1 = cplHpmcHpmVP(i2,i1)
    SumI = Abs(coup1)**2*B22m2 
res = res +1._dp* SumI  
End If 
      End Do 
     End Do 
 !------------------------ 
! VWLm, Hpm 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 If (((.not.OnlyHeavyStates).and.(.not.OnlyLightStates)) & 
  & .or.((OnlyHeavyStates).and.(MVWLm2.gt.50._dp**2).and.(MHpm2(i2).gt.50._dp**2))   & 
  & .or.((OnlyLightStates).and.(MVWLm2.lt.50._dp**2).and.(MHpm2(i2).lt.50._dp**2)) )   Then 
B0m2 = Real(DerVVSloop(p2,MVWLm2,MHpm2(i2)),dp)
coup1 = cplHpmVPVWLm(i2)
    SumI = Abs(coup1)**2*B0m2 
res = res +2._dp* SumI  
End If 
    End Do 
 !------------------------ 
! VWRm, Hpm 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 If (((.not.OnlyHeavyStates).and.(.not.OnlyLightStates)) & 
  & .or.((OnlyHeavyStates).and.(MVWRm2.gt.50._dp**2).and.(MHpm2(i2).gt.50._dp**2))   & 
  & .or.((OnlyLightStates).and.(MVWRm2.lt.50._dp**2).and.(MHpm2(i2).lt.50._dp**2)) )   Then 
B0m2 = Real(DerVVSloop(p2,MVWRm2,MHpm2(i2)),dp)
coup1 = cplHpmVPVWRm(i2)
    SumI = Abs(coup1)**2*B0m2 
res = res +2._dp* SumI  
End If 
    End Do 
 !------------------------ 
! conj[VWLm], VWLm 
!------------------------ 
sumI = 0._dp 
 
If (((.not.OnlyHeavyStates).and.(.not.OnlyLightStates)) & 
  & .or.((OnlyHeavyStates).and.(MVWLm2.gt.50._dp**2).and.(MVWLm2.gt.50._dp**2))   & 
  & .or.((OnlyLightStates).and.(MVWLm2.lt.50._dp**2).and.(MVWLm2.lt.50._dp**2)) )   Then 
coup1 = cplcVWLmVPVWLm
coup2 = Conjg(coup1) 
    SumI = -DerVVVloop(p2,MVWLm2,MVWLm2)*coup1*coup2 
res = res +1._dp* SumI  
End If 
!------------------------ 
! conj[VWRm], VWLm 
!------------------------ 
sumI = 0._dp 
 
If (((.not.OnlyHeavyStates).and.(.not.OnlyLightStates)) & 
  & .or.((OnlyHeavyStates).and.(MVWRm2.gt.50._dp**2).and.(MVWLm2.gt.50._dp**2))   & 
  & .or.((OnlyLightStates).and.(MVWRm2.lt.50._dp**2).and.(MVWLm2.lt.50._dp**2)) )   Then 
coup1 = cplcVWRmVPVWLm
coup2 = Conjg(coup1) 
    SumI = -DerVVVloop(p2,MVWRm2,MVWLm2)*coup1*coup2 
res = res +2._dp* SumI  
End If 
!------------------------ 
! conj[VWRm], VWRm 
!------------------------ 
sumI = 0._dp 
 
If (((.not.OnlyHeavyStates).and.(.not.OnlyLightStates)) & 
  & .or.((OnlyHeavyStates).and.(MVWRm2.gt.50._dp**2).and.(MVWRm2.gt.50._dp**2))   & 
  & .or.((OnlyLightStates).and.(MVWRm2.lt.50._dp**2).and.(MVWRm2.lt.50._dp**2)) )   Then 
coup1 = cplcVWRmVPVWRm
coup2 = Conjg(coup1) 
    SumI = -DerVVVloop(p2,MVWRm2,MVWRm2)*coup1*coup2 
res = res +1._dp* SumI  
End If 
!------------------------ 
! Ah 
!------------------------ 
    Do i1 = 1, 4
 If (((.not.OnlyHeavyStates).and.(.not.OnlyLightStates)) & 
  & .or.((OnlyHeavyStates).and.(MAh2(i1).gt.50._dp**2))   & 
  & .or.((OnlyLightStates).and.(MAh2(i1).lt.50._dp**2)) )   Then 
SumI = 0._dp 
 A0m2 = SA_DerA0(MAh2(i1))
 coup1 = cplAhAhVPVP(i1,i1)
 SumI = coup1*A0m2 
res = res +1._dp/2._dp* SumI  
End If 
      End Do 
 !------------------------ 
! hh 
!------------------------ 
    Do i1 = 1, 4
 If (((.not.OnlyHeavyStates).and.(.not.OnlyLightStates)) & 
  & .or.((OnlyHeavyStates).and.(Mhh2(i1).gt.50._dp**2))   & 
  & .or.((OnlyLightStates).and.(Mhh2(i1).lt.50._dp**2)) )   Then 
SumI = 0._dp 
 A0m2 = SA_DerA0(Mhh2(i1))
 coup1 = cplhhhhVPVP(i1,i1)
 SumI = coup1*A0m2 
res = res +1._dp/2._dp* SumI  
End If 
      End Do 
 !------------------------ 
! conj[Hpm] 
!------------------------ 
    Do i1 = 1, 4
 If (((.not.OnlyHeavyStates).and.(.not.OnlyLightStates)) & 
  & .or.((OnlyHeavyStates).and.(MHpm2(i1).gt.50._dp**2))   & 
  & .or.((OnlyLightStates).and.(MHpm2(i1).lt.50._dp**2)) )   Then 
SumI = 0._dp 
 A0m2 = SA_DerA0(MHpm2(i1))
 coup1 = cplHpmcHpmVPVP(i1,i1)
 SumI = coup1*A0m2 
res = res +1* SumI  
End If 
      End Do 
 !------------------------ 
! conj[VWLm] 
!------------------------ 
If (((.not.OnlyHeavyStates).and.(.not.OnlyLightStates)) & 
  & .or.((OnlyHeavyStates).and.(MVWLm2.gt.50._dp**2))   & 
  & .or.((OnlyLightStates).and.(MVWLm2.lt.50._dp**2)) )   Then 
SumI = 0._dp 
A0m2 = 3._dp/4._dp*SA_DerA0(MVWLm2) +RXi/4._dp*SA_DerA0(MVWLm2*RXi) 
coup1 = cplcVWLmVPVPVWLm3
coup2 = cplcVWLmVPVPVWLm1
coup3 = cplcVWLmVPVPVWLm2
SumI = ((2._dp*DerrMS*coup1+(1-RXi**2)/8._dp*(coup2+coup3))*MVWLm2-(4._dp*coup1+coup2+coup3)*A0m2)
res = res +1* SumI  
End If 
!------------------------ 
! conj[VWRm] 
!------------------------ 
If (((.not.OnlyHeavyStates).and.(.not.OnlyLightStates)) & 
  & .or.((OnlyHeavyStates).and.(MVWRm2.gt.50._dp**2))   & 
  & .or.((OnlyLightStates).and.(MVWRm2.lt.50._dp**2)) )   Then 
SumI = 0._dp 
A0m2 = 3._dp/4._dp*SA_DerA0(MVWRm2) +RXi/4._dp*SA_DerA0(MVWRm2*RXi) 
coup1 = cplcVWRmVPVPVWRm3
coup2 = cplcVWRmVPVPVWRm1
coup3 = cplcVWRmVPVPVWRm2
SumI = ((2._dp*DerrMS*coup1+(1-RXi**2)/8._dp*(coup2+coup3))*MVWRm2-(4._dp*coup1+coup2+coup3)*A0m2)
res = res +1* SumI  
End If 
res = oo16pi2*res 
 
End Subroutine DerPi1LoopVP 
 
Subroutine OneLoopVWLm(g2,k1,vR,PhiW,MHpm,MHpm2,MAh,MAh2,MVWRm,MVWRm2,MFu,            & 
& MFu2,MFd,MFd2,MFv,MFv2,MFe,MFe2,Mhh,Mhh2,MVWLm,MVWLm2,MVZ,MVZ2,MVZR,MVZR2,             & 
& cplAhcHpmcVWLm,cplAhcVWLmVWRm,cplcFuFdcVWLmL,cplcFuFdcVWLmR,cplFvFecVWLmL,             & 
& cplFvFecVWLmR,cplcgWLpgPcVWLm,cplcgWRpgPcVWLm,cplcgPgWLmcVWLm,cplcgZgWLmcVWLm,         & 
& cplcgZpgWLmcVWLm,cplcgPgWRmcVWLm,cplcgZgWRmcVWLm,cplcgZpgWRmcVWLm,cplcgWLpgZcVWLm,     & 
& cplcgWRpgZcVWLm,cplcgWLpgZpcVWLm,cplcgWRpgZpcVWLm,cplhhcHpmcVWLm,cplhhcVWLmVWLm,       & 
& cplhhcVWLmVWRm,cplcHpmcVWLmVP,cplcVWLmVPVWLm,cplcVWLmVPVWRm,cplcVWLmVWLmVZ,            & 
& cplcVWLmVWLmVZR,cplcVWLmVWRmVZ,cplcVWLmVWRmVZR,cplcHpmcVWLmVZ,cplcHpmcVWLmVZR,         & 
& cplAhAhcVWLmVWLm,cplhhhhcVWLmVWLm,cplHpmcHpmcVWLmVWLm,cplcVWLmVPVPVWLm3,               & 
& cplcVWLmVPVPVWLm1,cplcVWLmVPVPVWLm2,cplcVWLmcVWLmVWLmVWLm2,cplcVWLmcVWLmVWLmVWLm3,     & 
& cplcVWLmcVWLmVWLmVWLm1,cplcVWLmcVWRmVWLmVWRm2,cplcVWLmcVWRmVWLmVWRm3,cplcVWLmcVWRmVWLmVWRm1,& 
& cplcVWLmVWLmVZVZ1,cplcVWLmVWLmVZVZ2,cplcVWLmVWLmVZVZ3,cplcVWLmVWLmVZRVZR1,             & 
& cplcVWLmVWLmVZRVZR2,cplcVWLmVWLmVZRVZR3,delta,mass,mass2,kont)

Real(dp), Intent(in) :: MHpm(4),MHpm2(4),MAh(4),MAh2(4),MVWRm,MVWRm2,MFu(3),MFu2(3),MFd(3),MFd2(3),           & 
& MFv(9),MFv2(9),MFe(3),MFe2(3),Mhh(4),Mhh2(4),MVWLm,MVWLm2,MVZ,MVZ2,MVZR,MVZR2

Real(dp), Intent(in) :: g2,k1,vR,PhiW

Complex(dp), Intent(in) :: cplAhcHpmcVWLm(4,4),cplAhcVWLmVWRm(4),cplcFuFdcVWLmL(3,3),cplcFuFdcVWLmR(3,3),        & 
& cplFvFecVWLmL(9,3),cplFvFecVWLmR(9,3),cplcgWLpgPcVWLm,cplcgWRpgPcVWLm,cplcgPgWLmcVWLm, & 
& cplcgZgWLmcVWLm,cplcgZpgWLmcVWLm,cplcgPgWRmcVWLm,cplcgZgWRmcVWLm,cplcgZpgWRmcVWLm,     & 
& cplcgWLpgZcVWLm,cplcgWRpgZcVWLm,cplcgWLpgZpcVWLm,cplcgWRpgZpcVWLm,cplhhcHpmcVWLm(4,4), & 
& cplhhcVWLmVWLm(4),cplhhcVWLmVWRm(4),cplcHpmcVWLmVP(4),cplcVWLmVPVWLm,cplcVWLmVPVWRm,   & 
& cplcVWLmVWLmVZ,cplcVWLmVWLmVZR,cplcVWLmVWRmVZ,cplcVWLmVWRmVZR,cplcHpmcVWLmVZ(4),       & 
& cplcHpmcVWLmVZR(4),cplAhAhcVWLmVWLm(4,4),cplhhhhcVWLmVWLm(4,4),cplHpmcHpmcVWLmVWLm(4,4),& 
& cplcVWLmVPVPVWLm3,cplcVWLmVPVPVWLm1,cplcVWLmVPVPVWLm2,cplcVWLmcVWLmVWLmVWLm2,          & 
& cplcVWLmcVWLmVWLmVWLm3,cplcVWLmcVWLmVWLmVWLm1,cplcVWLmcVWRmVWLmVWRm2,cplcVWLmcVWRmVWLmVWRm3,& 
& cplcVWLmcVWRmVWLmVWRm1,cplcVWLmVWLmVZVZ1,cplcVWLmVWLmVZVZ2,cplcVWLmVWLmVZVZ3,          & 
& cplcVWLmVWLmVZRVZR1,cplcVWLmVWLmVZRVZR2,cplcVWLmVWLmVZRVZR3

Integer , Intent(inout):: kont 
Integer :: i1,i2,i3,i4,j1,j2,j3,j4,il,i_count, ierr 
Real(dp), Intent(in) :: delta 
Real(dp) :: mi, mi2, p2, test_m2 
Complex(dp) :: PiSf, SigL, SigR, SigSL, SigSR 
Real(dp), Intent(out) :: mass, mass2 
Iname = Iname + 1 
NameOfUnit(Iname) = 'OneLoopVWLm'
 
mi2 = MVWLm2 

 
p2 = MVWLm2
PiSf = ZeroC 
Call Pi1LoopVWLm(p2,MHpm,MHpm2,MAh,MAh2,MVWRm,MVWRm2,MFu,MFu2,MFd,MFd2,               & 
& MFv,MFv2,MFe,MFe2,Mhh,Mhh2,MVWLm,MVWLm2,MVZ,MVZ2,MVZR,MVZR2,cplAhcHpmcVWLm,            & 
& cplAhcVWLmVWRm,cplcFuFdcVWLmL,cplcFuFdcVWLmR,cplFvFecVWLmL,cplFvFecVWLmR,              & 
& cplcgWLpgPcVWLm,cplcgWRpgPcVWLm,cplcgPgWLmcVWLm,cplcgZgWLmcVWLm,cplcgZpgWLmcVWLm,      & 
& cplcgPgWRmcVWLm,cplcgZgWRmcVWLm,cplcgZpgWRmcVWLm,cplcgWLpgZcVWLm,cplcgWRpgZcVWLm,      & 
& cplcgWLpgZpcVWLm,cplcgWRpgZpcVWLm,cplhhcHpmcVWLm,cplhhcVWLmVWLm,cplhhcVWLmVWRm,        & 
& cplcHpmcVWLmVP,cplcVWLmVPVWLm,cplcVWLmVPVWRm,cplcVWLmVWLmVZ,cplcVWLmVWLmVZR,           & 
& cplcVWLmVWRmVZ,cplcVWLmVWRmVZR,cplcHpmcVWLmVZ,cplcHpmcVWLmVZR,cplAhAhcVWLmVWLm,        & 
& cplhhhhcVWLmVWLm,cplHpmcHpmcVWLmVWLm,cplcVWLmVPVPVWLm3,cplcVWLmVPVPVWLm1,              & 
& cplcVWLmVPVPVWLm2,cplcVWLmcVWLmVWLmVWLm2,cplcVWLmcVWLmVWLmVWLm3,cplcVWLmcVWLmVWLmVWLm1,& 
& cplcVWLmcVWRmVWLmVWRm2,cplcVWLmcVWRmVWLmVWRm3,cplcVWLmcVWRmVWLmVWRm1,cplcVWLmVWLmVZVZ1,& 
& cplcVWLmVWLmVZVZ2,cplcVWLmVWLmVZVZ3,cplcVWLmVWLmVZRVZR1,cplcVWLmVWLmVZRVZR2,           & 
& cplcVWLmVWLmVZRVZR3,kont,PiSf)

mass2 = mi2 + Real(PiSf,dp) 
mass = sqrt(mass2) 
i_count = 0 
Do  
i_count = i_count + 1 
test_m2 = mass2 
p2 =  mass2 
PiSf = ZeroC 
Call Pi1LoopVWLm(p2,MHpm,MHpm2,MAh,MAh2,MVWRm,MVWRm2,MFu,MFu2,MFd,MFd2,               & 
& MFv,MFv2,MFe,MFe2,Mhh,Mhh2,MVWLm,MVWLm2,MVZ,MVZ2,MVZR,MVZR2,cplAhcHpmcVWLm,            & 
& cplAhcVWLmVWRm,cplcFuFdcVWLmL,cplcFuFdcVWLmR,cplFvFecVWLmL,cplFvFecVWLmR,              & 
& cplcgWLpgPcVWLm,cplcgWRpgPcVWLm,cplcgPgWLmcVWLm,cplcgZgWLmcVWLm,cplcgZpgWLmcVWLm,      & 
& cplcgPgWRmcVWLm,cplcgZgWRmcVWLm,cplcgZpgWRmcVWLm,cplcgWLpgZcVWLm,cplcgWRpgZcVWLm,      & 
& cplcgWLpgZpcVWLm,cplcgWRpgZpcVWLm,cplhhcHpmcVWLm,cplhhcVWLmVWLm,cplhhcVWLmVWRm,        & 
& cplcHpmcVWLmVP,cplcVWLmVPVWLm,cplcVWLmVPVWRm,cplcVWLmVWLmVZ,cplcVWLmVWLmVZR,           & 
& cplcVWLmVWRmVZ,cplcVWLmVWRmVZR,cplcHpmcVWLmVZ,cplcHpmcVWLmVZR,cplAhAhcVWLmVWLm,        & 
& cplhhhhcVWLmVWLm,cplHpmcHpmcVWLmVWLm,cplcVWLmVPVPVWLm3,cplcVWLmVPVPVWLm1,              & 
& cplcVWLmVPVPVWLm2,cplcVWLmcVWLmVWLmVWLm2,cplcVWLmcVWLmVWLmVWLm3,cplcVWLmcVWLmVWLmVWLm1,& 
& cplcVWLmcVWRmVWLmVWRm2,cplcVWLmcVWRmVWLmVWRm3,cplcVWLmcVWRmVWLmVWRm1,cplcVWLmVWLmVZVZ1,& 
& cplcVWLmVWLmVZVZ2,cplcVWLmVWLmVZVZ3,cplcVWLmVWLmVZRVZR1,cplcVWLmVWLmVZRVZR2,           & 
& cplcVWLmVWLmVZRVZR3,kont,PiSf)

mass2 = mi2 + Real(PiSf,dp) 
mass = sqrt(mass2) 
 If (test_m2.Ne.0._dp) Then 
    test_m2 = Abs(test_m2 - mass2) / test_m2 
 Else 
    test_m2 = Abs(mass2) 
 End If 
 If (mass2.Ge.0._dp) Then 
   If (RotateNegativeFermionMasses) Then 
    mass = sqrt(mass2) 
   End if 
  Else 
 If (Abs(mass2).lt.1.0E-30_dp) test_m2 = 0._dp 
     Write(ErrCan,*) 'Warning from routine'//NameOfUnit(Iname) 
     Write(ErrCan,*) 'in the calculation of the masses' 
     Write(ErrCan,*) 'occurred a negative mass squared!' 
   SignOfMassChanged = .True. 
   mass = 0._dp 
  End If 
If (test_m2.LT.0.1_dp*delta) Exit 
If (i_count.Gt.30) Then 
  Write(*,*) "Problem in "//NameOfUnit(Iname), test_m2, mass2 
  kont = -510 
  Call AddError(510) 
 Exit 
End If 
End Do 
 
 
Iname = Iname -1 
End Subroutine OneLoopVWLm
 
 
Subroutine Pi1LoopVWLm(p2,MHpm,MHpm2,MAh,MAh2,MVWRm,MVWRm2,MFu,MFu2,MFd,              & 
& MFd2,MFv,MFv2,MFe,MFe2,Mhh,Mhh2,MVWLm,MVWLm2,MVZ,MVZ2,MVZR,MVZR2,cplAhcHpmcVWLm,       & 
& cplAhcVWLmVWRm,cplcFuFdcVWLmL,cplcFuFdcVWLmR,cplFvFecVWLmL,cplFvFecVWLmR,              & 
& cplcgWLpgPcVWLm,cplcgWRpgPcVWLm,cplcgPgWLmcVWLm,cplcgZgWLmcVWLm,cplcgZpgWLmcVWLm,      & 
& cplcgPgWRmcVWLm,cplcgZgWRmcVWLm,cplcgZpgWRmcVWLm,cplcgWLpgZcVWLm,cplcgWRpgZcVWLm,      & 
& cplcgWLpgZpcVWLm,cplcgWRpgZpcVWLm,cplhhcHpmcVWLm,cplhhcVWLmVWLm,cplhhcVWLmVWRm,        & 
& cplcHpmcVWLmVP,cplcVWLmVPVWLm,cplcVWLmVPVWRm,cplcVWLmVWLmVZ,cplcVWLmVWLmVZR,           & 
& cplcVWLmVWRmVZ,cplcVWLmVWRmVZR,cplcHpmcVWLmVZ,cplcHpmcVWLmVZR,cplAhAhcVWLmVWLm,        & 
& cplhhhhcVWLmVWLm,cplHpmcHpmcVWLmVWLm,cplcVWLmVPVPVWLm3,cplcVWLmVPVPVWLm1,              & 
& cplcVWLmVPVPVWLm2,cplcVWLmcVWLmVWLmVWLm2,cplcVWLmcVWLmVWLmVWLm3,cplcVWLmcVWLmVWLmVWLm1,& 
& cplcVWLmcVWRmVWLmVWRm2,cplcVWLmcVWRmVWLmVWRm3,cplcVWLmcVWRmVWLmVWRm1,cplcVWLmVWLmVZVZ1,& 
& cplcVWLmVWLmVZVZ2,cplcVWLmVWLmVZVZ3,cplcVWLmVWLmVZRVZR1,cplcVWLmVWLmVZRVZR2,           & 
& cplcVWLmVWLmVZRVZR3,kont,res)

Implicit None 
Real(dp), Intent(in) :: MHpm(4),MHpm2(4),MAh(4),MAh2(4),MVWRm,MVWRm2,MFu(3),MFu2(3),MFd(3),MFd2(3),           & 
& MFv(9),MFv2(9),MFe(3),MFe2(3),Mhh(4),Mhh2(4),MVWLm,MVWLm2,MVZ,MVZ2,MVZR,MVZR2

Complex(dp), Intent(in) :: cplAhcHpmcVWLm(4,4),cplAhcVWLmVWRm(4),cplcFuFdcVWLmL(3,3),cplcFuFdcVWLmR(3,3),        & 
& cplFvFecVWLmL(9,3),cplFvFecVWLmR(9,3),cplcgWLpgPcVWLm,cplcgWRpgPcVWLm,cplcgPgWLmcVWLm, & 
& cplcgZgWLmcVWLm,cplcgZpgWLmcVWLm,cplcgPgWRmcVWLm,cplcgZgWRmcVWLm,cplcgZpgWRmcVWLm,     & 
& cplcgWLpgZcVWLm,cplcgWRpgZcVWLm,cplcgWLpgZpcVWLm,cplcgWRpgZpcVWLm,cplhhcHpmcVWLm(4,4), & 
& cplhhcVWLmVWLm(4),cplhhcVWLmVWRm(4),cplcHpmcVWLmVP(4),cplcVWLmVPVWLm,cplcVWLmVPVWRm,   & 
& cplcVWLmVWLmVZ,cplcVWLmVWLmVZR,cplcVWLmVWRmVZ,cplcVWLmVWRmVZR,cplcHpmcVWLmVZ(4),       & 
& cplcHpmcVWLmVZR(4),cplAhAhcVWLmVWLm(4,4),cplhhhhcVWLmVWLm(4,4),cplHpmcHpmcVWLmVWLm(4,4),& 
& cplcVWLmVPVPVWLm3,cplcVWLmVPVPVWLm1,cplcVWLmVPVPVWLm2,cplcVWLmcVWLmVWLmVWLm2,          & 
& cplcVWLmcVWLmVWLmVWLm3,cplcVWLmcVWLmVWLmVWLm1,cplcVWLmcVWRmVWLmVWRm2,cplcVWLmcVWRmVWLmVWRm3,& 
& cplcVWLmcVWRmVWLmVWRm1,cplcVWLmVWLmVZVZ1,cplcVWLmVWLmVZVZ2,cplcVWLmVWLmVZVZ3,          & 
& cplcVWLmVWLmVZRVZR1,cplcVWLmVWLmVZRVZR2,cplcVWLmVWLmVZRVZR3

Integer, Intent(inout) :: kont 
Real(dp) :: B0m2, F0m2, G0m2, B1m2, H0m2, B22m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2, A0m12, A0m22 
Complex(dp), Intent(inout) :: res 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2, coup3, temp, sumI 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
res = 0._dp 
 
!------------------------ 
! conj[Hpm], Ah 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
       Do i2 = 1, 4
 B22m2 = Real(VSSloop(p2,MAh2(i2),MHpm2(i1)),dp)  
coup1 = cplAhcHpmcVWLm(i2,i1)
    SumI = Abs(coup1)**2*B22m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! VWRm, Ah 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 B0m2 = Real(VVSloop(p2,MVWRm2,MAh2(i2)),dp)
coup1 = cplAhcVWLmVWRm(i2)
    SumI = Abs(coup1)**2*B0m2 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! bar[Fu], Fd 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 H0m2 = Real(SA_Hloop(p2,MFu2(i1),MFd2(i2)),dp) 
B0m2 = 4._dp*MFu(i1)*MFd(i2)*Real(SA_B0(p2,MFu2(i1),MFd2(i2)),dp) 
coupL1 = cplcFuFdcVWLmL(i1,i2)
coupR1 = cplcFuFdcVWLmR(i1,i2)
    SumI = (Abs(coupL1)**2+Abs(coupR1)**2)*H0m2 & 
                & + (Real(Conjg(coupL1)*coupR1,dp))*B0m2 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! Fv, Fe 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 9
       Do i2 = 1, 3
 H0m2 = Real(SA_Hloop(p2,MFv2(i1),MFe2(i2)),dp) 
B0m2 = 4._dp*MFv(i1)*MFe(i2)*Real(SA_B0(p2,MFv2(i1),MFe2(i2)),dp) 
coupL1 = cplFvFecVWLmL(i1,i2)
coupR1 = cplFvFecVWLmR(i1,i2)
    SumI = (Abs(coupL1)**2+Abs(coupR1)**2)*H0m2 & 
                & + (Real(Conjg(coupL1)*coupR1,dp))*B0m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[gWLmC], gP 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = Real(VGGloop(p2,0._dp,MVWLm2),dp)
coup1 = cplcgWLpgPcVWLm
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWRmC], gP 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = Real(VGGloop(p2,0._dp,MVWRm2),dp)
coup1 = cplcgWRpgPcVWLm
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gP], gWLm 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = Real(VGGloop(p2,MVWLm2,0._dp),dp)
coup1 = cplcgPgWLmcVWLm
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gZ], gWLm 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = Real(VGGloop(p2,MVWLm2,MVZ2),dp)
coup1 = cplcgZgWLmcVWLm
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gZR], gWLm 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = Real(VGGloop(p2,MVWLm2,MVZR2),dp)
coup1 = cplcgZpgWLmcVWLm
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gP], gWRm 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = Real(VGGloop(p2,MVWRm2,0._dp),dp)
coup1 = cplcgPgWRmcVWLm
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gZ], gWRm 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = Real(VGGloop(p2,MVWRm2,MVZ2),dp)
coup1 = cplcgZgWRmcVWLm
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gZR], gWRm 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = Real(VGGloop(p2,MVWRm2,MVZR2),dp)
coup1 = cplcgZpgWRmcVWLm
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWLmC], gZ 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = Real(VGGloop(p2,MVZ2,MVWLm2),dp)
coup1 = cplcgWLpgZcVWLm
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWRmC], gZ 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = Real(VGGloop(p2,MVZ2,MVWRm2),dp)
coup1 = cplcgWRpgZcVWLm
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWLmC], gZR 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = Real(VGGloop(p2,MVZR2,MVWLm2),dp)
coup1 = cplcgWLpgZpcVWLm
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWRmC], gZR 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = Real(VGGloop(p2,MVZR2,MVWRm2),dp)
coup1 = cplcgWRpgZpcVWLm
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! conj[Hpm], hh 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
       Do i2 = 1, 4
 B22m2 = Real(VSSloop(p2,Mhh2(i2),MHpm2(i1)),dp)  
coup1 = cplhhcHpmcVWLm(i2,i1)
    SumI = Abs(coup1)**2*B22m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! VWLm, hh 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 B0m2 = Real(VVSloop(p2,MVWLm2,Mhh2(i2)),dp)
coup1 = cplhhcVWLmVWLm(i2)
    SumI = Abs(coup1)**2*B0m2 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! VWRm, hh 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 B0m2 = Real(VVSloop(p2,MVWRm2,Mhh2(i2)),dp)
coup1 = cplhhcVWLmVWRm(i2)
    SumI = Abs(coup1)**2*B0m2 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! conj[Hpm], VP 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
 B0m2 = Real(VVSloop(p2,0._dp,MHpm2(i1)),dp)
coup1 = cplcHpmcVWLmVP(i1)
    SumI = Abs(coup1)**2*B0m2 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! VWLm, VP 
!------------------------ 
sumI = 0._dp 
 
coup1 = cplcVWLmVPVWLm
coup2 = Conjg(coup1) 
    SumI = -VVVloop(p2,MVWLm2,0._dp)*coup1*coup2 
res = res +1._dp* SumI  
!------------------------ 
! VWRm, VP 
!------------------------ 
sumI = 0._dp 
 
coup1 = cplcVWLmVPVWRm
coup2 = Conjg(coup1) 
    SumI = -VVVloop(p2,MVWRm2,0._dp)*coup1*coup2 
res = res +1._dp* SumI  
!------------------------ 
! VZ, VWLm 
!------------------------ 
sumI = 0._dp 
 
coup1 = cplcVWLmVWLmVZ
coup2 = Conjg(coup1) 
    SumI = -VVVloop(p2,MVZ2,MVWLm2)*coup1*coup2 
res = res +1._dp* SumI  
!------------------------ 
! VZR, VWLm 
!------------------------ 
sumI = 0._dp 
 
coup1 = cplcVWLmVWLmVZR
coup2 = Conjg(coup1) 
    SumI = -VVVloop(p2,MVZR2,MVWLm2)*coup1*coup2 
res = res +1._dp* SumI  
!------------------------ 
! VZ, VWRm 
!------------------------ 
sumI = 0._dp 
 
coup1 = cplcVWLmVWRmVZ
coup2 = Conjg(coup1) 
    SumI = -VVVloop(p2,MVZ2,MVWRm2)*coup1*coup2 
res = res +1._dp* SumI  
!------------------------ 
! VZR, VWRm 
!------------------------ 
sumI = 0._dp 
 
coup1 = cplcVWLmVWRmVZR
coup2 = Conjg(coup1) 
    SumI = -VVVloop(p2,MVZR2,MVWRm2)*coup1*coup2 
res = res +1._dp* SumI  
!------------------------ 
! conj[Hpm], VZ 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
 B0m2 = Real(VVSloop(p2,MVZ2,MHpm2(i1)),dp)
coup1 = cplcHpmcVWLmVZ(i1)
    SumI = Abs(coup1)**2*B0m2 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! conj[Hpm], VZR 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
 B0m2 = Real(VVSloop(p2,MVZR2,MHpm2(i1)),dp)
coup1 = cplcHpmcVWLmVZR(i1)
    SumI = Abs(coup1)**2*B0m2 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! Ah 
!------------------------ 
    Do i1 = 1, 4
 SumI = 0._dp 
 A0m2 = SA_A0(MAh2(i1))
 coup1 = cplAhAhcVWLmVWLm(i1,i1)
 SumI = coup1*A0m2 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! hh 
!------------------------ 
    Do i1 = 1, 4
 SumI = 0._dp 
 A0m2 = SA_A0(Mhh2(i1))
 coup1 = cplhhhhcVWLmVWLm(i1,i1)
 SumI = coup1*A0m2 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! conj[Hpm] 
!------------------------ 
    Do i1 = 1, 4
 SumI = 0._dp 
 A0m2 = SA_A0(MHpm2(i1))
 coup1 = cplHpmcHpmcVWLmVWLm(i1,i1)
 SumI = coup1*A0m2 
res = res +1* SumI  
      End Do 
 !------------------------ 
! VP 
!------------------------ 
SumI = 0._dp 
A0m2 = 3._dp/4._dp*SA_A0(0._dp) +RXi/4._dp*SA_A0(0._dp*RXi) 
coup1 = cplcVWLmVPVPVWLm3
coup2 = cplcVWLmVPVPVWLm1
coup3 = cplcVWLmVPVPVWLm2
SumI = ((2._dp*rMS*coup1+(1-RXi**2)/8._dp*(coup2+coup3))*0._dp-(4._dp*coup1+coup2+coup3)*A0m2)
res = res +1._dp/2._dp* SumI  
!------------------------ 
! conj[VWLm] 
!------------------------ 
SumI = 0._dp 
A0m2 = 3._dp/4._dp*SA_A0(MVWLm2) +RXi/4._dp*SA_A0(MVWLm2*RXi) 
coup1 = cplcVWLmcVWLmVWLmVWLm2
coup2 = cplcVWLmcVWLmVWLmVWLm3
coup3 = cplcVWLmcVWLmVWLmVWLm1
SumI = ((2._dp*rMS*coup1+(1-RXi**2)/8._dp*(coup2+coup3))*MVWLm2-(4._dp*coup1+coup2+coup3)*A0m2)
res = res +1* SumI  
!------------------------ 
! conj[VWRm] 
!------------------------ 
SumI = 0._dp 
A0m2 = 3._dp/4._dp*SA_A0(MVWRm2) +RXi/4._dp*SA_A0(MVWRm2*RXi) 
coup1 = cplcVWLmcVWRmVWLmVWRm2
coup2 = cplcVWLmcVWRmVWLmVWRm3
coup3 = cplcVWLmcVWRmVWLmVWRm1
SumI = ((2._dp*rMS*coup1+(1-RXi**2)/8._dp*(coup2+coup3))*MVWRm2-(4._dp*coup1+coup2+coup3)*A0m2)
res = res +1* SumI  
!------------------------ 
! VZ 
!------------------------ 
SumI = 0._dp 
A0m2 = 3._dp/4._dp*SA_A0(MVZ2) +RXi/4._dp*SA_A0(MVZ2*RXi) 
coup1 = cplcVWLmVWLmVZVZ1
coup2 = cplcVWLmVWLmVZVZ2
coup3 = cplcVWLmVWLmVZVZ3
SumI = ((2._dp*rMS*coup1+(1-RXi**2)/8._dp*(coup2+coup3))*MVZ2-(4._dp*coup1+coup2+coup3)*A0m2)
res = res +1._dp/2._dp* SumI  
!------------------------ 
! VZR 
!------------------------ 
SumI = 0._dp 
A0m2 = 3._dp/4._dp*SA_A0(MVZR2) +RXi/4._dp*SA_A0(MVZR2*RXi) 
coup1 = cplcVWLmVWLmVZRVZR1
coup2 = cplcVWLmVWLmVZRVZR2
coup3 = cplcVWLmVWLmVZRVZR3
SumI = ((2._dp*rMS*coup1+(1-RXi**2)/8._dp*(coup2+coup3))*MVZR2-(4._dp*coup1+coup2+coup3)*A0m2)
res = res +1._dp/2._dp* SumI  
res = oo16pi2*res 
 
End Subroutine Pi1LoopVWLm 
 
Subroutine DerPi1LoopVWLm(p2,MHpm,MHpm2,MAh,MAh2,MVWRm,MVWRm2,MFu,MFu2,               & 
& MFd,MFd2,MFv,MFv2,MFe,MFe2,Mhh,Mhh2,MVWLm,MVWLm2,MVZ,MVZ2,MVZR,MVZR2,cplAhcHpmcVWLm,   & 
& cplAhcVWLmVWRm,cplcFuFdcVWLmL,cplcFuFdcVWLmR,cplFvFecVWLmL,cplFvFecVWLmR,              & 
& cplcgWLpgPcVWLm,cplcgWRpgPcVWLm,cplcgPgWLmcVWLm,cplcgZgWLmcVWLm,cplcgZpgWLmcVWLm,      & 
& cplcgPgWRmcVWLm,cplcgZgWRmcVWLm,cplcgZpgWRmcVWLm,cplcgWLpgZcVWLm,cplcgWRpgZcVWLm,      & 
& cplcgWLpgZpcVWLm,cplcgWRpgZpcVWLm,cplhhcHpmcVWLm,cplhhcVWLmVWLm,cplhhcVWLmVWRm,        & 
& cplcHpmcVWLmVP,cplcVWLmVPVWLm,cplcVWLmVPVWRm,cplcVWLmVWLmVZ,cplcVWLmVWLmVZR,           & 
& cplcVWLmVWRmVZ,cplcVWLmVWRmVZR,cplcHpmcVWLmVZ,cplcHpmcVWLmVZR,cplAhAhcVWLmVWLm,        & 
& cplhhhhcVWLmVWLm,cplHpmcHpmcVWLmVWLm,cplcVWLmVPVPVWLm3,cplcVWLmVPVPVWLm1,              & 
& cplcVWLmVPVPVWLm2,cplcVWLmcVWLmVWLmVWLm2,cplcVWLmcVWLmVWLmVWLm3,cplcVWLmcVWLmVWLmVWLm1,& 
& cplcVWLmcVWRmVWLmVWRm2,cplcVWLmcVWRmVWLmVWRm3,cplcVWLmcVWRmVWLmVWRm1,cplcVWLmVWLmVZVZ1,& 
& cplcVWLmVWLmVZVZ2,cplcVWLmVWLmVZVZ3,cplcVWLmVWLmVZRVZR1,cplcVWLmVWLmVZRVZR2,           & 
& cplcVWLmVWLmVZRVZR3,kont,res)

Implicit None 
Real(dp), Intent(in) :: MHpm(4),MHpm2(4),MAh(4),MAh2(4),MVWRm,MVWRm2,MFu(3),MFu2(3),MFd(3),MFd2(3),           & 
& MFv(9),MFv2(9),MFe(3),MFe2(3),Mhh(4),Mhh2(4),MVWLm,MVWLm2,MVZ,MVZ2,MVZR,MVZR2

Complex(dp), Intent(in) :: cplAhcHpmcVWLm(4,4),cplAhcVWLmVWRm(4),cplcFuFdcVWLmL(3,3),cplcFuFdcVWLmR(3,3),        & 
& cplFvFecVWLmL(9,3),cplFvFecVWLmR(9,3),cplcgWLpgPcVWLm,cplcgWRpgPcVWLm,cplcgPgWLmcVWLm, & 
& cplcgZgWLmcVWLm,cplcgZpgWLmcVWLm,cplcgPgWRmcVWLm,cplcgZgWRmcVWLm,cplcgZpgWRmcVWLm,     & 
& cplcgWLpgZcVWLm,cplcgWRpgZcVWLm,cplcgWLpgZpcVWLm,cplcgWRpgZpcVWLm,cplhhcHpmcVWLm(4,4), & 
& cplhhcVWLmVWLm(4),cplhhcVWLmVWRm(4),cplcHpmcVWLmVP(4),cplcVWLmVPVWLm,cplcVWLmVPVWRm,   & 
& cplcVWLmVWLmVZ,cplcVWLmVWLmVZR,cplcVWLmVWRmVZ,cplcVWLmVWRmVZR,cplcHpmcVWLmVZ(4),       & 
& cplcHpmcVWLmVZR(4),cplAhAhcVWLmVWLm(4,4),cplhhhhcVWLmVWLm(4,4),cplHpmcHpmcVWLmVWLm(4,4),& 
& cplcVWLmVPVPVWLm3,cplcVWLmVPVPVWLm1,cplcVWLmVPVPVWLm2,cplcVWLmcVWLmVWLmVWLm2,          & 
& cplcVWLmcVWLmVWLmVWLm3,cplcVWLmcVWLmVWLmVWLm1,cplcVWLmcVWRmVWLmVWRm2,cplcVWLmcVWRmVWLmVWRm3,& 
& cplcVWLmcVWRmVWLmVWRm1,cplcVWLmVWLmVZVZ1,cplcVWLmVWLmVZVZ2,cplcVWLmVWLmVZVZ3,          & 
& cplcVWLmVWLmVZRVZR1,cplcVWLmVWLmVZRVZR2,cplcVWLmVWLmVZRVZR3

Integer, Intent(inout) :: kont 
Real(dp) :: B0m2, F0m2, G0m2, B1m2, H0m2, B22m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2, A0m12, A0m22 
Complex(dp), Intent(inout) :: res 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2, coup3, temp, sumI 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
Real(dp) ::MVG,MVP,MVG2,MVP2
MVG = Mass_Regulator_PhotonGluon 
MVP = Mass_Regulator_PhotonGluon 
MVG2 = Mass_Regulator_PhotonGluon**2 
MVP2 = Mass_Regulator_PhotonGluon**2 

res = 0._dp 
 
!------------------------ 
! conj[Hpm], Ah 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
       Do i2 = 1, 4
 B22m2 = Real(DerVSSloop(p2,MAh2(i2),MHpm2(i1)),dp)  
coup1 = cplAhcHpmcVWLm(i2,i1)
    SumI = Abs(coup1)**2*B22m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! VWRm, Ah 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 B0m2 = Real(DerVVSloop(p2,MVWRm2,MAh2(i2)),dp)
coup1 = cplAhcVWLmVWRm(i2)
    SumI = Abs(coup1)**2*B0m2 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! bar[Fu], Fd 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 H0m2 = Real(SA_DerHloop(p2,MFu2(i1),MFd2(i2)),dp) 
B0m2 = 4._dp*MFu(i1)*MFd(i2)*Real(SA_DerB0(p2,MFu2(i1),MFd2(i2)),dp) 
coupL1 = cplcFuFdcVWLmL(i1,i2)
coupR1 = cplcFuFdcVWLmR(i1,i2)
    SumI = (Abs(coupL1)**2+Abs(coupR1)**2)*H0m2 & 
                & + (Real(Conjg(coupL1)*coupR1,dp))*B0m2 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! Fv, Fe 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 9
       Do i2 = 1, 3
 H0m2 = Real(SA_DerHloop(p2,MFv2(i1),MFe2(i2)),dp) 
B0m2 = 4._dp*MFv(i1)*MFe(i2)*Real(SA_DerB0(p2,MFv2(i1),MFe2(i2)),dp) 
coupL1 = cplFvFecVWLmL(i1,i2)
coupR1 = cplFvFecVWLmR(i1,i2)
    SumI = (Abs(coupL1)**2+Abs(coupR1)**2)*H0m2 & 
                & + (Real(Conjg(coupL1)*coupR1,dp))*B0m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[gWLmC], gP 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = Real(DerVGGloop(p2,MVP2,MVWLm2),dp)
coup1 = cplcgWLpgPcVWLm
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWRmC], gP 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = Real(DerVGGloop(p2,MVP2,MVWRm2),dp)
coup1 = cplcgWRpgPcVWLm
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gP], gWLm 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = Real(DerVGGloop(p2,MVWLm2,MVP2),dp)
coup1 = cplcgPgWLmcVWLm
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gZ], gWLm 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = Real(DerVGGloop(p2,MVWLm2,MVZ2),dp)
coup1 = cplcgZgWLmcVWLm
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gZR], gWLm 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = Real(DerVGGloop(p2,MVWLm2,MVZR2),dp)
coup1 = cplcgZpgWLmcVWLm
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gP], gWRm 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = Real(DerVGGloop(p2,MVWRm2,MVP2),dp)
coup1 = cplcgPgWRmcVWLm
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gZ], gWRm 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = Real(DerVGGloop(p2,MVWRm2,MVZ2),dp)
coup1 = cplcgZgWRmcVWLm
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gZR], gWRm 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = Real(DerVGGloop(p2,MVWRm2,MVZR2),dp)
coup1 = cplcgZpgWRmcVWLm
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWLmC], gZ 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = Real(DerVGGloop(p2,MVZ2,MVWLm2),dp)
coup1 = cplcgWLpgZcVWLm
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWRmC], gZ 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = Real(DerVGGloop(p2,MVZ2,MVWRm2),dp)
coup1 = cplcgWRpgZcVWLm
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWLmC], gZR 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = Real(DerVGGloop(p2,MVZR2,MVWLm2),dp)
coup1 = cplcgWLpgZpcVWLm
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWRmC], gZR 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = Real(DerVGGloop(p2,MVZR2,MVWRm2),dp)
coup1 = cplcgWRpgZpcVWLm
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! conj[Hpm], hh 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
       Do i2 = 1, 4
 B22m2 = Real(DerVSSloop(p2,Mhh2(i2),MHpm2(i1)),dp)  
coup1 = cplhhcHpmcVWLm(i2,i1)
    SumI = Abs(coup1)**2*B22m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! VWLm, hh 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 B0m2 = Real(DerVVSloop(p2,MVWLm2,Mhh2(i2)),dp)
coup1 = cplhhcVWLmVWLm(i2)
    SumI = Abs(coup1)**2*B0m2 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! VWRm, hh 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 B0m2 = Real(DerVVSloop(p2,MVWRm2,Mhh2(i2)),dp)
coup1 = cplhhcVWLmVWRm(i2)
    SumI = Abs(coup1)**2*B0m2 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! conj[Hpm], VP 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
 B0m2 = Real(DerVVSloop(p2,MVP2,MHpm2(i1)),dp)
coup1 = cplcHpmcVWLmVP(i1)
    SumI = Abs(coup1)**2*B0m2 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! VWLm, VP 
!------------------------ 
sumI = 0._dp 
 
coup1 = cplcVWLmVPVWLm
coup2 = Conjg(coup1) 
    SumI = -DerVVVloop(p2,MVWLm2,MVP2)*coup1*coup2 
res = res +1._dp* SumI  
!------------------------ 
! VWRm, VP 
!------------------------ 
sumI = 0._dp 
 
coup1 = cplcVWLmVPVWRm
coup2 = Conjg(coup1) 
    SumI = -DerVVVloop(p2,MVWRm2,MVP2)*coup1*coup2 
res = res +1._dp* SumI  
!------------------------ 
! VZ, VWLm 
!------------------------ 
sumI = 0._dp 
 
coup1 = cplcVWLmVWLmVZ
coup2 = Conjg(coup1) 
    SumI = -DerVVVloop(p2,MVZ2,MVWLm2)*coup1*coup2 
res = res +1._dp* SumI  
!------------------------ 
! VZR, VWLm 
!------------------------ 
sumI = 0._dp 
 
coup1 = cplcVWLmVWLmVZR
coup2 = Conjg(coup1) 
    SumI = -DerVVVloop(p2,MVZR2,MVWLm2)*coup1*coup2 
res = res +1._dp* SumI  
!------------------------ 
! VZ, VWRm 
!------------------------ 
sumI = 0._dp 
 
coup1 = cplcVWLmVWRmVZ
coup2 = Conjg(coup1) 
    SumI = -DerVVVloop(p2,MVZ2,MVWRm2)*coup1*coup2 
res = res +1._dp* SumI  
!------------------------ 
! VZR, VWRm 
!------------------------ 
sumI = 0._dp 
 
coup1 = cplcVWLmVWRmVZR
coup2 = Conjg(coup1) 
    SumI = -DerVVVloop(p2,MVZR2,MVWRm2)*coup1*coup2 
res = res +1._dp* SumI  
!------------------------ 
! conj[Hpm], VZ 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
 B0m2 = Real(DerVVSloop(p2,MVZ2,MHpm2(i1)),dp)
coup1 = cplcHpmcVWLmVZ(i1)
    SumI = Abs(coup1)**2*B0m2 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! conj[Hpm], VZR 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
 B0m2 = Real(DerVVSloop(p2,MVZR2,MHpm2(i1)),dp)
coup1 = cplcHpmcVWLmVZR(i1)
    SumI = Abs(coup1)**2*B0m2 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! Ah 
!------------------------ 
    Do i1 = 1, 4
 SumI = 0._dp 
 A0m2 = SA_DerA0(MAh2(i1))
 coup1 = cplAhAhcVWLmVWLm(i1,i1)
 SumI = coup1*A0m2 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! hh 
!------------------------ 
    Do i1 = 1, 4
 SumI = 0._dp 
 A0m2 = SA_DerA0(Mhh2(i1))
 coup1 = cplhhhhcVWLmVWLm(i1,i1)
 SumI = coup1*A0m2 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! conj[Hpm] 
!------------------------ 
    Do i1 = 1, 4
 SumI = 0._dp 
 A0m2 = SA_DerA0(MHpm2(i1))
 coup1 = cplHpmcHpmcVWLmVWLm(i1,i1)
 SumI = coup1*A0m2 
res = res +1* SumI  
      End Do 
 !------------------------ 
! VP 
!------------------------ 
SumI = 0._dp 
A0m2 = 3._dp/4._dp*SA_DerA0(MVP2) +RXi/4._dp*SA_DerA0(MVP2*RXi) 
coup1 = cplcVWLmVPVPVWLm3
coup2 = cplcVWLmVPVPVWLm1
coup3 = cplcVWLmVPVPVWLm2
SumI = ((2._dp*DerrMS*coup1+(1-RXi**2)/8._dp*(coup2+coup3))*MVP2-(4._dp*coup1+coup2+coup3)*A0m2)
res = res +1._dp/2._dp* SumI  
!------------------------ 
! conj[VWLm] 
!------------------------ 
SumI = 0._dp 
A0m2 = 3._dp/4._dp*SA_DerA0(MVWLm2) +RXi/4._dp*SA_DerA0(MVWLm2*RXi) 
coup1 = cplcVWLmcVWLmVWLmVWLm2
coup2 = cplcVWLmcVWLmVWLmVWLm3
coup3 = cplcVWLmcVWLmVWLmVWLm1
SumI = ((2._dp*DerrMS*coup1+(1-RXi**2)/8._dp*(coup2+coup3))*MVWLm2-(4._dp*coup1+coup2+coup3)*A0m2)
res = res +1* SumI  
!------------------------ 
! conj[VWRm] 
!------------------------ 
SumI = 0._dp 
A0m2 = 3._dp/4._dp*SA_DerA0(MVWRm2) +RXi/4._dp*SA_DerA0(MVWRm2*RXi) 
coup1 = cplcVWLmcVWRmVWLmVWRm2
coup2 = cplcVWLmcVWRmVWLmVWRm3
coup3 = cplcVWLmcVWRmVWLmVWRm1
SumI = ((2._dp*DerrMS*coup1+(1-RXi**2)/8._dp*(coup2+coup3))*MVWRm2-(4._dp*coup1+coup2+coup3)*A0m2)
res = res +1* SumI  
!------------------------ 
! VZ 
!------------------------ 
SumI = 0._dp 
A0m2 = 3._dp/4._dp*SA_DerA0(MVZ2) +RXi/4._dp*SA_DerA0(MVZ2*RXi) 
coup1 = cplcVWLmVWLmVZVZ1
coup2 = cplcVWLmVWLmVZVZ2
coup3 = cplcVWLmVWLmVZVZ3
SumI = ((2._dp*DerrMS*coup1+(1-RXi**2)/8._dp*(coup2+coup3))*MVZ2-(4._dp*coup1+coup2+coup3)*A0m2)
res = res +1._dp/2._dp* SumI  
!------------------------ 
! VZR 
!------------------------ 
SumI = 0._dp 
A0m2 = 3._dp/4._dp*SA_DerA0(MVZR2) +RXi/4._dp*SA_DerA0(MVZR2*RXi) 
coup1 = cplcVWLmVWLmVZRVZR1
coup2 = cplcVWLmVWLmVZRVZR2
coup3 = cplcVWLmVWLmVZRVZR3
SumI = ((2._dp*DerrMS*coup1+(1-RXi**2)/8._dp*(coup2+coup3))*MVZR2-(4._dp*coup1+coup2+coup3)*A0m2)
res = res +1._dp/2._dp* SumI  
res = oo16pi2*res 
 
End Subroutine DerPi1LoopVWLm 
 
Subroutine OneLoopVWRm(g2,k1,vR,PhiW,MHpm,MHpm2,MAh,MAh2,MVWLm,MVWLm2,MFu,            & 
& MFu2,MFd,MFd2,MFv,MFv2,MFe,MFe2,Mhh,Mhh2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,MVZR2,             & 
& cplAhcHpmcVWRm,cplAhcVWRmVWLm,cplcFuFdcVWRmL,cplcFuFdcVWRmR,cplFvFecVWRmL,             & 
& cplFvFecVWRmR,cplcgWLpgPcVWRm,cplcgWRpgPcVWRm,cplcgPgWLmcVWRm,cplcgZgWLmcVWRm,         & 
& cplcgZpgWLmcVWRm,cplcgPgWRmcVWRm,cplcgZgWRmcVWRm,cplcgZpgWRmcVWRm,cplcgWLpgZcVWRm,     & 
& cplcgWRpgZcVWRm,cplcgWLpgZpcVWRm,cplcgWRpgZpcVWRm,cplhhcHpmcVWRm,cplhhcVWRmVWLm,       & 
& cplhhcVWRmVWRm,cplcHpmcVWRmVP,cplcVWRmVPVWLm,cplcVWRmVPVWRm,cplcVWRmVWLmVZ,            & 
& cplcVWRmVWLmVZR,cplcVWRmVWRmVZ,cplcVWRmVWRmVZR,cplcHpmcVWRmVZ,cplcHpmcVWRmVZR,         & 
& cplAhAhcVWRmVWRm,cplhhhhcVWRmVWRm,cplHpmcHpmcVWRmVWRm,cplcVWRmVPVPVWRm3,               & 
& cplcVWRmVPVPVWRm1,cplcVWRmVPVPVWRm2,cplcVWLmcVWRmVWLmVWRm2,cplcVWLmcVWRmVWLmVWRm3,     & 
& cplcVWLmcVWRmVWLmVWRm1,cplcVWRmcVWRmVWRmVWRm2,cplcVWRmcVWRmVWRmVWRm3,cplcVWRmcVWRmVWRmVWRm1,& 
& cplcVWRmVWRmVZVZ1,cplcVWRmVWRmVZVZ2,cplcVWRmVWRmVZVZ3,cplcVWRmVWRmVZRVZR1,             & 
& cplcVWRmVWRmVZRVZR2,cplcVWRmVWRmVZRVZR3,delta,mass,mass2,kont)

Real(dp), Intent(in) :: MHpm(4),MHpm2(4),MAh(4),MAh2(4),MVWLm,MVWLm2,MFu(3),MFu2(3),MFd(3),MFd2(3),           & 
& MFv(9),MFv2(9),MFe(3),MFe2(3),Mhh(4),Mhh2(4),MVWRm,MVWRm2,MVZ,MVZ2,MVZR,MVZR2

Real(dp), Intent(in) :: g2,k1,vR,PhiW

Complex(dp), Intent(in) :: cplAhcHpmcVWRm(4,4),cplAhcVWRmVWLm(4),cplcFuFdcVWRmL(3,3),cplcFuFdcVWRmR(3,3),        & 
& cplFvFecVWRmL(9,3),cplFvFecVWRmR(9,3),cplcgWLpgPcVWRm,cplcgWRpgPcVWRm,cplcgPgWLmcVWRm, & 
& cplcgZgWLmcVWRm,cplcgZpgWLmcVWRm,cplcgPgWRmcVWRm,cplcgZgWRmcVWRm,cplcgZpgWRmcVWRm,     & 
& cplcgWLpgZcVWRm,cplcgWRpgZcVWRm,cplcgWLpgZpcVWRm,cplcgWRpgZpcVWRm,cplhhcHpmcVWRm(4,4), & 
& cplhhcVWRmVWLm(4),cplhhcVWRmVWRm(4),cplcHpmcVWRmVP(4),cplcVWRmVPVWLm,cplcVWRmVPVWRm,   & 
& cplcVWRmVWLmVZ,cplcVWRmVWLmVZR,cplcVWRmVWRmVZ,cplcVWRmVWRmVZR,cplcHpmcVWRmVZ(4),       & 
& cplcHpmcVWRmVZR(4),cplAhAhcVWRmVWRm(4,4),cplhhhhcVWRmVWRm(4,4),cplHpmcHpmcVWRmVWRm(4,4),& 
& cplcVWRmVPVPVWRm3,cplcVWRmVPVPVWRm1,cplcVWRmVPVPVWRm2,cplcVWLmcVWRmVWLmVWRm2,          & 
& cplcVWLmcVWRmVWLmVWRm3,cplcVWLmcVWRmVWLmVWRm1,cplcVWRmcVWRmVWRmVWRm2,cplcVWRmcVWRmVWRmVWRm3,& 
& cplcVWRmcVWRmVWRmVWRm1,cplcVWRmVWRmVZVZ1,cplcVWRmVWRmVZVZ2,cplcVWRmVWRmVZVZ3,          & 
& cplcVWRmVWRmVZRVZR1,cplcVWRmVWRmVZRVZR2,cplcVWRmVWRmVZRVZR3

Integer , Intent(inout):: kont 
Integer :: i1,i2,i3,i4,j1,j2,j3,j4,il,i_count, ierr 
Real(dp), Intent(in) :: delta 
Real(dp) :: mi, mi2, p2, test_m2 
Complex(dp) :: PiSf, SigL, SigR, SigSL, SigSR 
Real(dp), Intent(out) :: mass, mass2 
Iname = Iname + 1 
NameOfUnit(Iname) = 'OneLoopVWRm'
 
mi2 = MVWRm2 

 
p2 = MVWRm2
PiSf = ZeroC 
Call Pi1LoopVWRm(p2,MHpm,MHpm2,MAh,MAh2,MVWLm,MVWLm2,MFu,MFu2,MFd,MFd2,               & 
& MFv,MFv2,MFe,MFe2,Mhh,Mhh2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,MVZR2,cplAhcHpmcVWRm,            & 
& cplAhcVWRmVWLm,cplcFuFdcVWRmL,cplcFuFdcVWRmR,cplFvFecVWRmL,cplFvFecVWRmR,              & 
& cplcgWLpgPcVWRm,cplcgWRpgPcVWRm,cplcgPgWLmcVWRm,cplcgZgWLmcVWRm,cplcgZpgWLmcVWRm,      & 
& cplcgPgWRmcVWRm,cplcgZgWRmcVWRm,cplcgZpgWRmcVWRm,cplcgWLpgZcVWRm,cplcgWRpgZcVWRm,      & 
& cplcgWLpgZpcVWRm,cplcgWRpgZpcVWRm,cplhhcHpmcVWRm,cplhhcVWRmVWLm,cplhhcVWRmVWRm,        & 
& cplcHpmcVWRmVP,cplcVWRmVPVWLm,cplcVWRmVPVWRm,cplcVWRmVWLmVZ,cplcVWRmVWLmVZR,           & 
& cplcVWRmVWRmVZ,cplcVWRmVWRmVZR,cplcHpmcVWRmVZ,cplcHpmcVWRmVZR,cplAhAhcVWRmVWRm,        & 
& cplhhhhcVWRmVWRm,cplHpmcHpmcVWRmVWRm,cplcVWRmVPVPVWRm3,cplcVWRmVPVPVWRm1,              & 
& cplcVWRmVPVPVWRm2,cplcVWLmcVWRmVWLmVWRm2,cplcVWLmcVWRmVWLmVWRm3,cplcVWLmcVWRmVWLmVWRm1,& 
& cplcVWRmcVWRmVWRmVWRm2,cplcVWRmcVWRmVWRmVWRm3,cplcVWRmcVWRmVWRmVWRm1,cplcVWRmVWRmVZVZ1,& 
& cplcVWRmVWRmVZVZ2,cplcVWRmVWRmVZVZ3,cplcVWRmVWRmVZRVZR1,cplcVWRmVWRmVZRVZR2,           & 
& cplcVWRmVWRmVZRVZR3,kont,PiSf)

mass2 = mi2 + Real(PiSf,dp) 
mass = sqrt(mass2) 
i_count = 0 
Do  
i_count = i_count + 1 
test_m2 = mass2 
p2 =  mass2 
PiSf = ZeroC 
Call Pi1LoopVWRm(p2,MHpm,MHpm2,MAh,MAh2,MVWLm,MVWLm2,MFu,MFu2,MFd,MFd2,               & 
& MFv,MFv2,MFe,MFe2,Mhh,Mhh2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,MVZR2,cplAhcHpmcVWRm,            & 
& cplAhcVWRmVWLm,cplcFuFdcVWRmL,cplcFuFdcVWRmR,cplFvFecVWRmL,cplFvFecVWRmR,              & 
& cplcgWLpgPcVWRm,cplcgWRpgPcVWRm,cplcgPgWLmcVWRm,cplcgZgWLmcVWRm,cplcgZpgWLmcVWRm,      & 
& cplcgPgWRmcVWRm,cplcgZgWRmcVWRm,cplcgZpgWRmcVWRm,cplcgWLpgZcVWRm,cplcgWRpgZcVWRm,      & 
& cplcgWLpgZpcVWRm,cplcgWRpgZpcVWRm,cplhhcHpmcVWRm,cplhhcVWRmVWLm,cplhhcVWRmVWRm,        & 
& cplcHpmcVWRmVP,cplcVWRmVPVWLm,cplcVWRmVPVWRm,cplcVWRmVWLmVZ,cplcVWRmVWLmVZR,           & 
& cplcVWRmVWRmVZ,cplcVWRmVWRmVZR,cplcHpmcVWRmVZ,cplcHpmcVWRmVZR,cplAhAhcVWRmVWRm,        & 
& cplhhhhcVWRmVWRm,cplHpmcHpmcVWRmVWRm,cplcVWRmVPVPVWRm3,cplcVWRmVPVPVWRm1,              & 
& cplcVWRmVPVPVWRm2,cplcVWLmcVWRmVWLmVWRm2,cplcVWLmcVWRmVWLmVWRm3,cplcVWLmcVWRmVWLmVWRm1,& 
& cplcVWRmcVWRmVWRmVWRm2,cplcVWRmcVWRmVWRmVWRm3,cplcVWRmcVWRmVWRmVWRm1,cplcVWRmVWRmVZVZ1,& 
& cplcVWRmVWRmVZVZ2,cplcVWRmVWRmVZVZ3,cplcVWRmVWRmVZRVZR1,cplcVWRmVWRmVZRVZR2,           & 
& cplcVWRmVWRmVZRVZR3,kont,PiSf)

mass2 = mi2 + Real(PiSf,dp) 
mass = sqrt(mass2) 
 If (test_m2.Ne.0._dp) Then 
    test_m2 = Abs(test_m2 - mass2) / test_m2 
 Else 
    test_m2 = Abs(mass2) 
 End If 
 If (mass2.Ge.0._dp) Then 
   If (RotateNegativeFermionMasses) Then 
    mass = sqrt(mass2) 
   End if 
  Else 
 If (Abs(mass2).lt.1.0E-30_dp) test_m2 = 0._dp 
     Write(ErrCan,*) 'Warning from routine'//NameOfUnit(Iname) 
     Write(ErrCan,*) 'in the calculation of the masses' 
     Write(ErrCan,*) 'occurred a negative mass squared!' 
   SignOfMassChanged = .True. 
   mass = 0._dp 
  End If 
If (test_m2.LT.0.1_dp*delta) Exit 
If (i_count.Gt.30) Then 
  Write(*,*) "Problem in "//NameOfUnit(Iname), test_m2, mass2 
  kont = -510 
  Call AddError(510) 
 Exit 
End If 
End Do 
 
 
Iname = Iname -1 
End Subroutine OneLoopVWRm
 
 
Subroutine Pi1LoopVWRm(p2,MHpm,MHpm2,MAh,MAh2,MVWLm,MVWLm2,MFu,MFu2,MFd,              & 
& MFd2,MFv,MFv2,MFe,MFe2,Mhh,Mhh2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,MVZR2,cplAhcHpmcVWRm,       & 
& cplAhcVWRmVWLm,cplcFuFdcVWRmL,cplcFuFdcVWRmR,cplFvFecVWRmL,cplFvFecVWRmR,              & 
& cplcgWLpgPcVWRm,cplcgWRpgPcVWRm,cplcgPgWLmcVWRm,cplcgZgWLmcVWRm,cplcgZpgWLmcVWRm,      & 
& cplcgPgWRmcVWRm,cplcgZgWRmcVWRm,cplcgZpgWRmcVWRm,cplcgWLpgZcVWRm,cplcgWRpgZcVWRm,      & 
& cplcgWLpgZpcVWRm,cplcgWRpgZpcVWRm,cplhhcHpmcVWRm,cplhhcVWRmVWLm,cplhhcVWRmVWRm,        & 
& cplcHpmcVWRmVP,cplcVWRmVPVWLm,cplcVWRmVPVWRm,cplcVWRmVWLmVZ,cplcVWRmVWLmVZR,           & 
& cplcVWRmVWRmVZ,cplcVWRmVWRmVZR,cplcHpmcVWRmVZ,cplcHpmcVWRmVZR,cplAhAhcVWRmVWRm,        & 
& cplhhhhcVWRmVWRm,cplHpmcHpmcVWRmVWRm,cplcVWRmVPVPVWRm3,cplcVWRmVPVPVWRm1,              & 
& cplcVWRmVPVPVWRm2,cplcVWLmcVWRmVWLmVWRm2,cplcVWLmcVWRmVWLmVWRm3,cplcVWLmcVWRmVWLmVWRm1,& 
& cplcVWRmcVWRmVWRmVWRm2,cplcVWRmcVWRmVWRmVWRm3,cplcVWRmcVWRmVWRmVWRm1,cplcVWRmVWRmVZVZ1,& 
& cplcVWRmVWRmVZVZ2,cplcVWRmVWRmVZVZ3,cplcVWRmVWRmVZRVZR1,cplcVWRmVWRmVZRVZR2,           & 
& cplcVWRmVWRmVZRVZR3,kont,res)

Implicit None 
Real(dp), Intent(in) :: MHpm(4),MHpm2(4),MAh(4),MAh2(4),MVWLm,MVWLm2,MFu(3),MFu2(3),MFd(3),MFd2(3),           & 
& MFv(9),MFv2(9),MFe(3),MFe2(3),Mhh(4),Mhh2(4),MVWRm,MVWRm2,MVZ,MVZ2,MVZR,MVZR2

Complex(dp), Intent(in) :: cplAhcHpmcVWRm(4,4),cplAhcVWRmVWLm(4),cplcFuFdcVWRmL(3,3),cplcFuFdcVWRmR(3,3),        & 
& cplFvFecVWRmL(9,3),cplFvFecVWRmR(9,3),cplcgWLpgPcVWRm,cplcgWRpgPcVWRm,cplcgPgWLmcVWRm, & 
& cplcgZgWLmcVWRm,cplcgZpgWLmcVWRm,cplcgPgWRmcVWRm,cplcgZgWRmcVWRm,cplcgZpgWRmcVWRm,     & 
& cplcgWLpgZcVWRm,cplcgWRpgZcVWRm,cplcgWLpgZpcVWRm,cplcgWRpgZpcVWRm,cplhhcHpmcVWRm(4,4), & 
& cplhhcVWRmVWLm(4),cplhhcVWRmVWRm(4),cplcHpmcVWRmVP(4),cplcVWRmVPVWLm,cplcVWRmVPVWRm,   & 
& cplcVWRmVWLmVZ,cplcVWRmVWLmVZR,cplcVWRmVWRmVZ,cplcVWRmVWRmVZR,cplcHpmcVWRmVZ(4),       & 
& cplcHpmcVWRmVZR(4),cplAhAhcVWRmVWRm(4,4),cplhhhhcVWRmVWRm(4,4),cplHpmcHpmcVWRmVWRm(4,4),& 
& cplcVWRmVPVPVWRm3,cplcVWRmVPVPVWRm1,cplcVWRmVPVPVWRm2,cplcVWLmcVWRmVWLmVWRm2,          & 
& cplcVWLmcVWRmVWLmVWRm3,cplcVWLmcVWRmVWLmVWRm1,cplcVWRmcVWRmVWRmVWRm2,cplcVWRmcVWRmVWRmVWRm3,& 
& cplcVWRmcVWRmVWRmVWRm1,cplcVWRmVWRmVZVZ1,cplcVWRmVWRmVZVZ2,cplcVWRmVWRmVZVZ3,          & 
& cplcVWRmVWRmVZRVZR1,cplcVWRmVWRmVZRVZR2,cplcVWRmVWRmVZRVZR3

Integer, Intent(inout) :: kont 
Real(dp) :: B0m2, F0m2, G0m2, B1m2, H0m2, B22m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2, A0m12, A0m22 
Complex(dp), Intent(inout) :: res 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2, coup3, temp, sumI 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
res = 0._dp 
 
!------------------------ 
! conj[Hpm], Ah 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
       Do i2 = 1, 4
 B22m2 = Real(VSSloop(p2,MAh2(i2),MHpm2(i1)),dp)  
coup1 = cplAhcHpmcVWRm(i2,i1)
    SumI = Abs(coup1)**2*B22m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! VWLm, Ah 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 B0m2 = Real(VVSloop(p2,MVWLm2,MAh2(i2)),dp)
coup1 = cplAhcVWRmVWLm(i2)
    SumI = Abs(coup1)**2*B0m2 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! bar[Fu], Fd 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 H0m2 = Real(SA_Hloop(p2,MFu2(i1),MFd2(i2)),dp) 
B0m2 = 4._dp*MFu(i1)*MFd(i2)*Real(SA_B0(p2,MFu2(i1),MFd2(i2)),dp) 
coupL1 = cplcFuFdcVWRmL(i1,i2)
coupR1 = cplcFuFdcVWRmR(i1,i2)
    SumI = (Abs(coupL1)**2+Abs(coupR1)**2)*H0m2 & 
                & + (Real(Conjg(coupL1)*coupR1,dp))*B0m2 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! Fv, Fe 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 9
       Do i2 = 1, 3
 H0m2 = Real(SA_Hloop(p2,MFv2(i1),MFe2(i2)),dp) 
B0m2 = 4._dp*MFv(i1)*MFe(i2)*Real(SA_B0(p2,MFv2(i1),MFe2(i2)),dp) 
coupL1 = cplFvFecVWRmL(i1,i2)
coupR1 = cplFvFecVWRmR(i1,i2)
    SumI = (Abs(coupL1)**2+Abs(coupR1)**2)*H0m2 & 
                & + (Real(Conjg(coupL1)*coupR1,dp))*B0m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[gWLmC], gP 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = Real(VGGloop(p2,0._dp,MVWLm2),dp)
coup1 = cplcgWLpgPcVWRm
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWRmC], gP 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = Real(VGGloop(p2,0._dp,MVWRm2),dp)
coup1 = cplcgWRpgPcVWRm
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gP], gWLm 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = Real(VGGloop(p2,MVWLm2,0._dp),dp)
coup1 = cplcgPgWLmcVWRm
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gZ], gWLm 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = Real(VGGloop(p2,MVWLm2,MVZ2),dp)
coup1 = cplcgZgWLmcVWRm
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gZR], gWLm 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = Real(VGGloop(p2,MVWLm2,MVZR2),dp)
coup1 = cplcgZpgWLmcVWRm
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gP], gWRm 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = Real(VGGloop(p2,MVWRm2,0._dp),dp)
coup1 = cplcgPgWRmcVWRm
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gZ], gWRm 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = Real(VGGloop(p2,MVWRm2,MVZ2),dp)
coup1 = cplcgZgWRmcVWRm
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gZR], gWRm 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = Real(VGGloop(p2,MVWRm2,MVZR2),dp)
coup1 = cplcgZpgWRmcVWRm
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWLmC], gZ 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = Real(VGGloop(p2,MVZ2,MVWLm2),dp)
coup1 = cplcgWLpgZcVWRm
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWRmC], gZ 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = Real(VGGloop(p2,MVZ2,MVWRm2),dp)
coup1 = cplcgWRpgZcVWRm
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWLmC], gZR 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = Real(VGGloop(p2,MVZR2,MVWLm2),dp)
coup1 = cplcgWLpgZpcVWRm
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWRmC], gZR 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = Real(VGGloop(p2,MVZR2,MVWRm2),dp)
coup1 = cplcgWRpgZpcVWRm
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! conj[Hpm], hh 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
       Do i2 = 1, 4
 B22m2 = Real(VSSloop(p2,Mhh2(i2),MHpm2(i1)),dp)  
coup1 = cplhhcHpmcVWRm(i2,i1)
    SumI = Abs(coup1)**2*B22m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! VWLm, hh 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 B0m2 = Real(VVSloop(p2,MVWLm2,Mhh2(i2)),dp)
coup1 = cplhhcVWRmVWLm(i2)
    SumI = Abs(coup1)**2*B0m2 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! VWRm, hh 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 B0m2 = Real(VVSloop(p2,MVWRm2,Mhh2(i2)),dp)
coup1 = cplhhcVWRmVWRm(i2)
    SumI = Abs(coup1)**2*B0m2 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! conj[Hpm], VP 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
 B0m2 = Real(VVSloop(p2,0._dp,MHpm2(i1)),dp)
coup1 = cplcHpmcVWRmVP(i1)
    SumI = Abs(coup1)**2*B0m2 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! VWLm, VP 
!------------------------ 
sumI = 0._dp 
 
coup1 = cplcVWRmVPVWLm
coup2 = Conjg(coup1) 
    SumI = -VVVloop(p2,MVWLm2,0._dp)*coup1*coup2 
res = res +1._dp* SumI  
!------------------------ 
! VWRm, VP 
!------------------------ 
sumI = 0._dp 
 
coup1 = cplcVWRmVPVWRm
coup2 = Conjg(coup1) 
    SumI = -VVVloop(p2,MVWRm2,0._dp)*coup1*coup2 
res = res +1._dp* SumI  
!------------------------ 
! VZ, VWLm 
!------------------------ 
sumI = 0._dp 
 
coup1 = cplcVWRmVWLmVZ
coup2 = Conjg(coup1) 
    SumI = -VVVloop(p2,MVZ2,MVWLm2)*coup1*coup2 
res = res +1._dp* SumI  
!------------------------ 
! VZR, VWLm 
!------------------------ 
sumI = 0._dp 
 
coup1 = cplcVWRmVWLmVZR
coup2 = Conjg(coup1) 
    SumI = -VVVloop(p2,MVZR2,MVWLm2)*coup1*coup2 
res = res +1._dp* SumI  
!------------------------ 
! VZ, VWRm 
!------------------------ 
sumI = 0._dp 
 
coup1 = cplcVWRmVWRmVZ
coup2 = Conjg(coup1) 
    SumI = -VVVloop(p2,MVZ2,MVWRm2)*coup1*coup2 
res = res +1._dp* SumI  
!------------------------ 
! VZR, VWRm 
!------------------------ 
sumI = 0._dp 
 
coup1 = cplcVWRmVWRmVZR
coup2 = Conjg(coup1) 
    SumI = -VVVloop(p2,MVZR2,MVWRm2)*coup1*coup2 
res = res +1._dp* SumI  
!------------------------ 
! conj[Hpm], VZ 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
 B0m2 = Real(VVSloop(p2,MVZ2,MHpm2(i1)),dp)
coup1 = cplcHpmcVWRmVZ(i1)
    SumI = Abs(coup1)**2*B0m2 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! conj[Hpm], VZR 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
 B0m2 = Real(VVSloop(p2,MVZR2,MHpm2(i1)),dp)
coup1 = cplcHpmcVWRmVZR(i1)
    SumI = Abs(coup1)**2*B0m2 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! Ah 
!------------------------ 
    Do i1 = 1, 4
 SumI = 0._dp 
 A0m2 = SA_A0(MAh2(i1))
 coup1 = cplAhAhcVWRmVWRm(i1,i1)
 SumI = coup1*A0m2 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! hh 
!------------------------ 
    Do i1 = 1, 4
 SumI = 0._dp 
 A0m2 = SA_A0(Mhh2(i1))
 coup1 = cplhhhhcVWRmVWRm(i1,i1)
 SumI = coup1*A0m2 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! conj[Hpm] 
!------------------------ 
    Do i1 = 1, 4
 SumI = 0._dp 
 A0m2 = SA_A0(MHpm2(i1))
 coup1 = cplHpmcHpmcVWRmVWRm(i1,i1)
 SumI = coup1*A0m2 
res = res +1* SumI  
      End Do 
 !------------------------ 
! VP 
!------------------------ 
SumI = 0._dp 
A0m2 = 3._dp/4._dp*SA_A0(0._dp) +RXi/4._dp*SA_A0(0._dp*RXi) 
coup1 = cplcVWRmVPVPVWRm3
coup2 = cplcVWRmVPVPVWRm1
coup3 = cplcVWRmVPVPVWRm2
SumI = ((2._dp*rMS*coup1+(1-RXi**2)/8._dp*(coup2+coup3))*0._dp-(4._dp*coup1+coup2+coup3)*A0m2)
res = res +1._dp/2._dp* SumI  
!------------------------ 
! conj[VWLm] 
!------------------------ 
SumI = 0._dp 
A0m2 = 3._dp/4._dp*SA_A0(MVWLm2) +RXi/4._dp*SA_A0(MVWLm2*RXi) 
coup1 = cplcVWLmcVWRmVWLmVWRm2
coup2 = cplcVWLmcVWRmVWLmVWRm3
coup3 = cplcVWLmcVWRmVWLmVWRm1
SumI = ((2._dp*rMS*coup1+(1-RXi**2)/8._dp*(coup2+coup3))*MVWLm2-(4._dp*coup1+coup2+coup3)*A0m2)
res = res +1* SumI  
!------------------------ 
! conj[VWRm] 
!------------------------ 
SumI = 0._dp 
A0m2 = 3._dp/4._dp*SA_A0(MVWRm2) +RXi/4._dp*SA_A0(MVWRm2*RXi) 
coup1 = cplcVWRmcVWRmVWRmVWRm2
coup2 = cplcVWRmcVWRmVWRmVWRm3
coup3 = cplcVWRmcVWRmVWRmVWRm1
SumI = ((2._dp*rMS*coup1+(1-RXi**2)/8._dp*(coup2+coup3))*MVWRm2-(4._dp*coup1+coup2+coup3)*A0m2)
res = res +1* SumI  
!------------------------ 
! VZ 
!------------------------ 
SumI = 0._dp 
A0m2 = 3._dp/4._dp*SA_A0(MVZ2) +RXi/4._dp*SA_A0(MVZ2*RXi) 
coup1 = cplcVWRmVWRmVZVZ1
coup2 = cplcVWRmVWRmVZVZ2
coup3 = cplcVWRmVWRmVZVZ3
SumI = ((2._dp*rMS*coup1+(1-RXi**2)/8._dp*(coup2+coup3))*MVZ2-(4._dp*coup1+coup2+coup3)*A0m2)
res = res +1._dp/2._dp* SumI  
!------------------------ 
! VZR 
!------------------------ 
SumI = 0._dp 
A0m2 = 3._dp/4._dp*SA_A0(MVZR2) +RXi/4._dp*SA_A0(MVZR2*RXi) 
coup1 = cplcVWRmVWRmVZRVZR1
coup2 = cplcVWRmVWRmVZRVZR2
coup3 = cplcVWRmVWRmVZRVZR3
SumI = ((2._dp*rMS*coup1+(1-RXi**2)/8._dp*(coup2+coup3))*MVZR2-(4._dp*coup1+coup2+coup3)*A0m2)
res = res +1._dp/2._dp* SumI  
res = oo16pi2*res 
 
End Subroutine Pi1LoopVWRm 
 
Subroutine DerPi1LoopVWRm(p2,MHpm,MHpm2,MAh,MAh2,MVWLm,MVWLm2,MFu,MFu2,               & 
& MFd,MFd2,MFv,MFv2,MFe,MFe2,Mhh,Mhh2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,MVZR2,cplAhcHpmcVWRm,   & 
& cplAhcVWRmVWLm,cplcFuFdcVWRmL,cplcFuFdcVWRmR,cplFvFecVWRmL,cplFvFecVWRmR,              & 
& cplcgWLpgPcVWRm,cplcgWRpgPcVWRm,cplcgPgWLmcVWRm,cplcgZgWLmcVWRm,cplcgZpgWLmcVWRm,      & 
& cplcgPgWRmcVWRm,cplcgZgWRmcVWRm,cplcgZpgWRmcVWRm,cplcgWLpgZcVWRm,cplcgWRpgZcVWRm,      & 
& cplcgWLpgZpcVWRm,cplcgWRpgZpcVWRm,cplhhcHpmcVWRm,cplhhcVWRmVWLm,cplhhcVWRmVWRm,        & 
& cplcHpmcVWRmVP,cplcVWRmVPVWLm,cplcVWRmVPVWRm,cplcVWRmVWLmVZ,cplcVWRmVWLmVZR,           & 
& cplcVWRmVWRmVZ,cplcVWRmVWRmVZR,cplcHpmcVWRmVZ,cplcHpmcVWRmVZR,cplAhAhcVWRmVWRm,        & 
& cplhhhhcVWRmVWRm,cplHpmcHpmcVWRmVWRm,cplcVWRmVPVPVWRm3,cplcVWRmVPVPVWRm1,              & 
& cplcVWRmVPVPVWRm2,cplcVWLmcVWRmVWLmVWRm2,cplcVWLmcVWRmVWLmVWRm3,cplcVWLmcVWRmVWLmVWRm1,& 
& cplcVWRmcVWRmVWRmVWRm2,cplcVWRmcVWRmVWRmVWRm3,cplcVWRmcVWRmVWRmVWRm1,cplcVWRmVWRmVZVZ1,& 
& cplcVWRmVWRmVZVZ2,cplcVWRmVWRmVZVZ3,cplcVWRmVWRmVZRVZR1,cplcVWRmVWRmVZRVZR2,           & 
& cplcVWRmVWRmVZRVZR3,kont,res)

Implicit None 
Real(dp), Intent(in) :: MHpm(4),MHpm2(4),MAh(4),MAh2(4),MVWLm,MVWLm2,MFu(3),MFu2(3),MFd(3),MFd2(3),           & 
& MFv(9),MFv2(9),MFe(3),MFe2(3),Mhh(4),Mhh2(4),MVWRm,MVWRm2,MVZ,MVZ2,MVZR,MVZR2

Complex(dp), Intent(in) :: cplAhcHpmcVWRm(4,4),cplAhcVWRmVWLm(4),cplcFuFdcVWRmL(3,3),cplcFuFdcVWRmR(3,3),        & 
& cplFvFecVWRmL(9,3),cplFvFecVWRmR(9,3),cplcgWLpgPcVWRm,cplcgWRpgPcVWRm,cplcgPgWLmcVWRm, & 
& cplcgZgWLmcVWRm,cplcgZpgWLmcVWRm,cplcgPgWRmcVWRm,cplcgZgWRmcVWRm,cplcgZpgWRmcVWRm,     & 
& cplcgWLpgZcVWRm,cplcgWRpgZcVWRm,cplcgWLpgZpcVWRm,cplcgWRpgZpcVWRm,cplhhcHpmcVWRm(4,4), & 
& cplhhcVWRmVWLm(4),cplhhcVWRmVWRm(4),cplcHpmcVWRmVP(4),cplcVWRmVPVWLm,cplcVWRmVPVWRm,   & 
& cplcVWRmVWLmVZ,cplcVWRmVWLmVZR,cplcVWRmVWRmVZ,cplcVWRmVWRmVZR,cplcHpmcVWRmVZ(4),       & 
& cplcHpmcVWRmVZR(4),cplAhAhcVWRmVWRm(4,4),cplhhhhcVWRmVWRm(4,4),cplHpmcHpmcVWRmVWRm(4,4),& 
& cplcVWRmVPVPVWRm3,cplcVWRmVPVPVWRm1,cplcVWRmVPVPVWRm2,cplcVWLmcVWRmVWLmVWRm2,          & 
& cplcVWLmcVWRmVWLmVWRm3,cplcVWLmcVWRmVWLmVWRm1,cplcVWRmcVWRmVWRmVWRm2,cplcVWRmcVWRmVWRmVWRm3,& 
& cplcVWRmcVWRmVWRmVWRm1,cplcVWRmVWRmVZVZ1,cplcVWRmVWRmVZVZ2,cplcVWRmVWRmVZVZ3,          & 
& cplcVWRmVWRmVZRVZR1,cplcVWRmVWRmVZRVZR2,cplcVWRmVWRmVZRVZR3

Integer, Intent(inout) :: kont 
Real(dp) :: B0m2, F0m2, G0m2, B1m2, H0m2, B22m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2, A0m12, A0m22 
Complex(dp), Intent(inout) :: res 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2, coup3, temp, sumI 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
Real(dp) ::MVG,MVP,MVG2,MVP2
MVG = Mass_Regulator_PhotonGluon 
MVP = Mass_Regulator_PhotonGluon 
MVG2 = Mass_Regulator_PhotonGluon**2 
MVP2 = Mass_Regulator_PhotonGluon**2 

res = 0._dp 
 
!------------------------ 
! conj[Hpm], Ah 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
       Do i2 = 1, 4
 B22m2 = Real(DerVSSloop(p2,MAh2(i2),MHpm2(i1)),dp)  
coup1 = cplAhcHpmcVWRm(i2,i1)
    SumI = Abs(coup1)**2*B22m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! VWLm, Ah 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 B0m2 = Real(DerVVSloop(p2,MVWLm2,MAh2(i2)),dp)
coup1 = cplAhcVWRmVWLm(i2)
    SumI = Abs(coup1)**2*B0m2 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! bar[Fu], Fd 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 H0m2 = Real(SA_DerHloop(p2,MFu2(i1),MFd2(i2)),dp) 
B0m2 = 4._dp*MFu(i1)*MFd(i2)*Real(SA_DerB0(p2,MFu2(i1),MFd2(i2)),dp) 
coupL1 = cplcFuFdcVWRmL(i1,i2)
coupR1 = cplcFuFdcVWRmR(i1,i2)
    SumI = (Abs(coupL1)**2+Abs(coupR1)**2)*H0m2 & 
                & + (Real(Conjg(coupL1)*coupR1,dp))*B0m2 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! Fv, Fe 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 9
       Do i2 = 1, 3
 H0m2 = Real(SA_DerHloop(p2,MFv2(i1),MFe2(i2)),dp) 
B0m2 = 4._dp*MFv(i1)*MFe(i2)*Real(SA_DerB0(p2,MFv2(i1),MFe2(i2)),dp) 
coupL1 = cplFvFecVWRmL(i1,i2)
coupR1 = cplFvFecVWRmR(i1,i2)
    SumI = (Abs(coupL1)**2+Abs(coupR1)**2)*H0m2 & 
                & + (Real(Conjg(coupL1)*coupR1,dp))*B0m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[gWLmC], gP 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = Real(DerVGGloop(p2,MVP2,MVWLm2),dp)
coup1 = cplcgWLpgPcVWRm
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWRmC], gP 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = Real(DerVGGloop(p2,MVP2,MVWRm2),dp)
coup1 = cplcgWRpgPcVWRm
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gP], gWLm 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = Real(DerVGGloop(p2,MVWLm2,MVP2),dp)
coup1 = cplcgPgWLmcVWRm
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gZ], gWLm 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = Real(DerVGGloop(p2,MVWLm2,MVZ2),dp)
coup1 = cplcgZgWLmcVWRm
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gZR], gWLm 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = Real(DerVGGloop(p2,MVWLm2,MVZR2),dp)
coup1 = cplcgZpgWLmcVWRm
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gP], gWRm 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = Real(DerVGGloop(p2,MVWRm2,MVP2),dp)
coup1 = cplcgPgWRmcVWRm
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gZ], gWRm 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = Real(DerVGGloop(p2,MVWRm2,MVZ2),dp)
coup1 = cplcgZgWRmcVWRm
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gZR], gWRm 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = Real(DerVGGloop(p2,MVWRm2,MVZR2),dp)
coup1 = cplcgZpgWRmcVWRm
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWLmC], gZ 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = Real(DerVGGloop(p2,MVZ2,MVWLm2),dp)
coup1 = cplcgWLpgZcVWRm
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWRmC], gZ 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = Real(DerVGGloop(p2,MVZ2,MVWRm2),dp)
coup1 = cplcgWRpgZcVWRm
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWLmC], gZR 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = Real(DerVGGloop(p2,MVZR2,MVWLm2),dp)
coup1 = cplcgWLpgZpcVWRm
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWRmC], gZR 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = Real(DerVGGloop(p2,MVZR2,MVWRm2),dp)
coup1 = cplcgWRpgZpcVWRm
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! conj[Hpm], hh 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
       Do i2 = 1, 4
 B22m2 = Real(DerVSSloop(p2,Mhh2(i2),MHpm2(i1)),dp)  
coup1 = cplhhcHpmcVWRm(i2,i1)
    SumI = Abs(coup1)**2*B22m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! VWLm, hh 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 B0m2 = Real(DerVVSloop(p2,MVWLm2,Mhh2(i2)),dp)
coup1 = cplhhcVWRmVWLm(i2)
    SumI = Abs(coup1)**2*B0m2 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! VWRm, hh 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 B0m2 = Real(DerVVSloop(p2,MVWRm2,Mhh2(i2)),dp)
coup1 = cplhhcVWRmVWRm(i2)
    SumI = Abs(coup1)**2*B0m2 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! conj[Hpm], VP 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
 B0m2 = Real(DerVVSloop(p2,MVP2,MHpm2(i1)),dp)
coup1 = cplcHpmcVWRmVP(i1)
    SumI = Abs(coup1)**2*B0m2 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! VWLm, VP 
!------------------------ 
sumI = 0._dp 
 
coup1 = cplcVWRmVPVWLm
coup2 = Conjg(coup1) 
    SumI = -DerVVVloop(p2,MVWLm2,MVP2)*coup1*coup2 
res = res +1._dp* SumI  
!------------------------ 
! VWRm, VP 
!------------------------ 
sumI = 0._dp 
 
coup1 = cplcVWRmVPVWRm
coup2 = Conjg(coup1) 
    SumI = -DerVVVloop(p2,MVWRm2,MVP2)*coup1*coup2 
res = res +1._dp* SumI  
!------------------------ 
! VZ, VWLm 
!------------------------ 
sumI = 0._dp 
 
coup1 = cplcVWRmVWLmVZ
coup2 = Conjg(coup1) 
    SumI = -DerVVVloop(p2,MVZ2,MVWLm2)*coup1*coup2 
res = res +1._dp* SumI  
!------------------------ 
! VZR, VWLm 
!------------------------ 
sumI = 0._dp 
 
coup1 = cplcVWRmVWLmVZR
coup2 = Conjg(coup1) 
    SumI = -DerVVVloop(p2,MVZR2,MVWLm2)*coup1*coup2 
res = res +1._dp* SumI  
!------------------------ 
! VZ, VWRm 
!------------------------ 
sumI = 0._dp 
 
coup1 = cplcVWRmVWRmVZ
coup2 = Conjg(coup1) 
    SumI = -DerVVVloop(p2,MVZ2,MVWRm2)*coup1*coup2 
res = res +1._dp* SumI  
!------------------------ 
! VZR, VWRm 
!------------------------ 
sumI = 0._dp 
 
coup1 = cplcVWRmVWRmVZR
coup2 = Conjg(coup1) 
    SumI = -DerVVVloop(p2,MVZR2,MVWRm2)*coup1*coup2 
res = res +1._dp* SumI  
!------------------------ 
! conj[Hpm], VZ 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
 B0m2 = Real(DerVVSloop(p2,MVZ2,MHpm2(i1)),dp)
coup1 = cplcHpmcVWRmVZ(i1)
    SumI = Abs(coup1)**2*B0m2 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! conj[Hpm], VZR 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
 B0m2 = Real(DerVVSloop(p2,MVZR2,MHpm2(i1)),dp)
coup1 = cplcHpmcVWRmVZR(i1)
    SumI = Abs(coup1)**2*B0m2 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! Ah 
!------------------------ 
    Do i1 = 1, 4
 SumI = 0._dp 
 A0m2 = SA_DerA0(MAh2(i1))
 coup1 = cplAhAhcVWRmVWRm(i1,i1)
 SumI = coup1*A0m2 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! hh 
!------------------------ 
    Do i1 = 1, 4
 SumI = 0._dp 
 A0m2 = SA_DerA0(Mhh2(i1))
 coup1 = cplhhhhcVWRmVWRm(i1,i1)
 SumI = coup1*A0m2 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! conj[Hpm] 
!------------------------ 
    Do i1 = 1, 4
 SumI = 0._dp 
 A0m2 = SA_DerA0(MHpm2(i1))
 coup1 = cplHpmcHpmcVWRmVWRm(i1,i1)
 SumI = coup1*A0m2 
res = res +1* SumI  
      End Do 
 !------------------------ 
! VP 
!------------------------ 
SumI = 0._dp 
A0m2 = 3._dp/4._dp*SA_DerA0(MVP2) +RXi/4._dp*SA_DerA0(MVP2*RXi) 
coup1 = cplcVWRmVPVPVWRm3
coup2 = cplcVWRmVPVPVWRm1
coup3 = cplcVWRmVPVPVWRm2
SumI = ((2._dp*DerrMS*coup1+(1-RXi**2)/8._dp*(coup2+coup3))*MVP2-(4._dp*coup1+coup2+coup3)*A0m2)
res = res +1._dp/2._dp* SumI  
!------------------------ 
! conj[VWLm] 
!------------------------ 
SumI = 0._dp 
A0m2 = 3._dp/4._dp*SA_DerA0(MVWLm2) +RXi/4._dp*SA_DerA0(MVWLm2*RXi) 
coup1 = cplcVWLmcVWRmVWLmVWRm2
coup2 = cplcVWLmcVWRmVWLmVWRm3
coup3 = cplcVWLmcVWRmVWLmVWRm1
SumI = ((2._dp*DerrMS*coup1+(1-RXi**2)/8._dp*(coup2+coup3))*MVWLm2-(4._dp*coup1+coup2+coup3)*A0m2)
res = res +1* SumI  
!------------------------ 
! conj[VWRm] 
!------------------------ 
SumI = 0._dp 
A0m2 = 3._dp/4._dp*SA_DerA0(MVWRm2) +RXi/4._dp*SA_DerA0(MVWRm2*RXi) 
coup1 = cplcVWRmcVWRmVWRmVWRm2
coup2 = cplcVWRmcVWRmVWRmVWRm3
coup3 = cplcVWRmcVWRmVWRmVWRm1
SumI = ((2._dp*DerrMS*coup1+(1-RXi**2)/8._dp*(coup2+coup3))*MVWRm2-(4._dp*coup1+coup2+coup3)*A0m2)
res = res +1* SumI  
!------------------------ 
! VZ 
!------------------------ 
SumI = 0._dp 
A0m2 = 3._dp/4._dp*SA_DerA0(MVZ2) +RXi/4._dp*SA_DerA0(MVZ2*RXi) 
coup1 = cplcVWRmVWRmVZVZ1
coup2 = cplcVWRmVWRmVZVZ2
coup3 = cplcVWRmVWRmVZVZ3
SumI = ((2._dp*DerrMS*coup1+(1-RXi**2)/8._dp*(coup2+coup3))*MVZ2-(4._dp*coup1+coup2+coup3)*A0m2)
res = res +1._dp/2._dp* SumI  
!------------------------ 
! VZR 
!------------------------ 
SumI = 0._dp 
A0m2 = 3._dp/4._dp*SA_DerA0(MVZR2) +RXi/4._dp*SA_DerA0(MVZR2*RXi) 
coup1 = cplcVWRmVWRmVZRVZR1
coup2 = cplcVWRmVWRmVZRVZR2
coup3 = cplcVWRmVWRmVZRVZR3
SumI = ((2._dp*DerrMS*coup1+(1-RXi**2)/8._dp*(coup2+coup3))*MVZR2-(4._dp*coup1+coup2+coup3)*A0m2)
res = res +1._dp/2._dp* SumI  
res = oo16pi2*res 
 
End Subroutine DerPi1LoopVWRm 
 
Subroutine Sigma1LoopFeMZ(p2,MFe,MFe2,MAh,MAh2,Mhh,Mhh2,MVZ,MVZ2,MVZR,MVZR2,          & 
& MHpm,MHpm2,MFv,MFv2,MVWLm,MVWLm2,MVWRm,MVWRm2,cplcUFeFeAhL,cplcUFeFeAhR,               & 
& cplcUFeFehhL,cplcUFeFehhR,cplcUFeFeVPL,cplcUFeFeVPR,cplcUFeFeVZL,cplcUFeFeVZR,         & 
& cplcUFeFeVZRL,cplcUFeFeVZRR,cplcUFeFvcHpmL,cplcUFeFvcHpmR,cplcUFeFvVWLmL,              & 
& cplcUFeFvVWLmR,cplcUFeFvVWRmL,cplcUFeFvVWRmR,sigL,sigR,sigSL,sigSR)

Implicit None 
Real(dp), Intent(in) :: MFe(3),MFe2(3),MAh(4),MAh2(4),Mhh(4),Mhh2(4),MVZ,MVZ2,MVZR,MVZR2,MHpm(4),             & 
& MHpm2(4),MFv(9),MFv2(9),MVWLm,MVWLm2,MVWRm,MVWRm2

Complex(dp), Intent(in) :: cplcUFeFeAhL(3,3,4),cplcUFeFeAhR(3,3,4),cplcUFeFehhL(3,3,4),cplcUFeFehhR(3,3,4),      & 
& cplcUFeFeVPL(3,3),cplcUFeFeVPR(3,3),cplcUFeFeVZL(3,3),cplcUFeFeVZR(3,3),               & 
& cplcUFeFeVZRL(3,3),cplcUFeFeVZRR(3,3),cplcUFeFvcHpmL(3,9,4),cplcUFeFvcHpmR(3,9,4),     & 
& cplcUFeFvVWLmL(3,9),cplcUFeFvVWLmR(3,9),cplcUFeFvVWRmL(3,9),cplcUFeFvVWRmR(3,9)

Complex(dp), Intent(out) :: SigL(3,3),SigR(3,3), SigSL(3,3), SigSR(3,3) 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2,temp, sumL(3,3), sumR(3,3), sumSL(3,3), sumSR(3,3) 
Real(dp) :: B0m2, F0m2, G0m2,B1m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
SigL = Cmplx(0._dp,0._dp,dp) 
SigR = Cmplx(0._dp,0._dp,dp) 
SigSL = Cmplx(0._dp,0._dp,dp) 
 SigSR = Cmplx(0._dp,0._dp,dp) 
 
!------------------------ 
! Fe, Ah 
!------------------------ 
    Do i1 = 1, 3
       Do i2 = 1, 4
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
If(gO1.eq.gO2) Then 
B1m2 = -Real(SA_B1(MFe2(gO1),MFe2(i1),MAh2(i2)),dp) 
B0m2 = MFe(i1)*Real(SA_B0(MFe2(gO1),MFe2(i1),MAh2(i2)),dp) 
Else 
B1m2 = -Real(SA_B1(p2,MFe2(i1),MAh2(i2)),dp) 
B0m2 = MFe(i1)*Real(SA_B0(p2,MFe2(i1),MAh2(i2)),dp) 
End If 
coupL1 = cplcUFeFeAhL(gO1,i1,i2)
coupR1 = cplcUFeFeAhR(gO1,i1,i2)
coupL2 =  Conjg(cplcUFeFeAhL(gO2,i1,i2))
coupR2 =  Conjg(cplcUFeFeAhR(gO2,i1,i2))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! hh, Fe 
!------------------------ 
    Do i1 = 1, 4
       Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
If(gO1.eq.gO2) Then 
B1m2 = -Real(SA_B1(MFe2(gO1),MFe2(i2),Mhh2(i1)),dp) 
B0m2 = MFe(i2)*Real(SA_B0(MFe2(gO1),MFe2(i2),Mhh2(i1)),dp) 
Else 
B1m2 = -Real(SA_B1(p2,MFe2(i2),Mhh2(i1)),dp) 
B0m2 = MFe(i2)*Real(SA_B0(p2,MFe2(i2),Mhh2(i1)),dp) 
End If 
coupL1 = cplcUFeFehhL(gO1,i2,i1)
coupR1 = cplcUFeFehhR(gO1,i2,i1)
coupL2 =  Conjg(cplcUFeFehhL(gO2,i2,i1))
coupR2 =  Conjg(cplcUFeFehhR(gO2,i2,i1))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! VZ, Fe 
!------------------------ 
      Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
If(gO1.eq.gO2) Then 
B1m2 = -2._dp*Real(SA_B1(MFe2(gO1),MFe2(i2),MVZ2),dp) 
B0m2 = -4._dp*MFe(i2)*Real(SA_B0(MFe2(gO1),MFe2(i2),MVZ2)-0.5_dp*rMS,dp) 
Else 
B1m2 = -2._dp*Real(SA_B1(p2,MFe2(i2),MVZ2)+ 0.5_dp*rMS,dp) 
B0m2 = -4._dp*MFe(i2)*Real(SA_B0(p2,MFe2(i2),MVZ2)-0.5_dp*rMS,dp) 
End If 
coupL1 = cplcUFeFeVZL(gO1,i2)
coupR1 = cplcUFeFeVZR(gO1,i2)
coupL2 =  Conjg(cplcUFeFeVZL(gO2,i2))
coupR2 =  Conjg(cplcUFeFeVZR(gO2,i2))
SumSL(gO1,gO2) = coupL1*coupR2*B0m2 
SumSR(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
    End Do 
 !------------------------ 
! VZR, Fe 
!------------------------ 
      Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
If(gO1.eq.gO2) Then 
B1m2 = -2._dp*Real(SA_B1(MFe2(gO1),MFe2(i2),MVZR2),dp) 
B0m2 = -4._dp*MFe(i2)*Real(SA_B0(MFe2(gO1),MFe2(i2),MVZR2)-0.5_dp*rMS,dp) 
Else 
B1m2 = -2._dp*Real(SA_B1(p2,MFe2(i2),MVZR2)+ 0.5_dp*rMS,dp) 
B0m2 = -4._dp*MFe(i2)*Real(SA_B0(p2,MFe2(i2),MVZR2)-0.5_dp*rMS,dp) 
End If 
coupL1 = cplcUFeFeVZRL(gO1,i2)
coupR1 = cplcUFeFeVZRR(gO1,i2)
coupL2 =  Conjg(cplcUFeFeVZRL(gO2,i2))
coupR2 =  Conjg(cplcUFeFeVZRR(gO2,i2))
SumSL(gO1,gO2) = coupL1*coupR2*B0m2 
SumSR(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
    End Do 
 !------------------------ 
! conj[Hpm], Fv 
!------------------------ 
    Do i1 = 1, 4
       Do i2 = 1, 9
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
If(gO1.eq.gO2) Then 
B1m2 = -Real(SA_B1(MFe2(gO1),MFv2(i2),MHpm2(i1)),dp) 
B0m2 = MFv(i2)*Real(SA_B0(MFe2(gO1),MFv2(i2),MHpm2(i1)),dp) 
Else 
B1m2 = -Real(SA_B1(p2,MFv2(i2),MHpm2(i1)),dp) 
B0m2 = MFv(i2)*Real(SA_B0(p2,MFv2(i2),MHpm2(i1)),dp) 
End If 
coupL1 = cplcUFeFvcHpmL(gO1,i2,i1)
coupR1 = cplcUFeFvcHpmR(gO1,i2,i1)
coupL2 =  Conjg(cplcUFeFvcHpmL(gO2,i2,i1))
coupR2 =  Conjg(cplcUFeFvcHpmR(gO2,i2,i1))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! VWLm, Fv 
!------------------------ 
      Do i2 = 1, 9
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
If(gO1.eq.gO2) Then 
B1m2 = -2._dp*Real(SA_B1(MFe2(gO1),MFv2(i2),MVWLm2),dp) 
B0m2 = -4._dp*MFv(i2)*Real(SA_B0(MFe2(gO1),MFv2(i2),MVWLm2)-0.5_dp*rMS,dp) 
Else 
B1m2 = -2._dp*Real(SA_B1(p2,MFv2(i2),MVWLm2)+ 0.5_dp*rMS,dp) 
B0m2 = -4._dp*MFv(i2)*Real(SA_B0(p2,MFv2(i2),MVWLm2)-0.5_dp*rMS,dp) 
End If 
coupL1 = cplcUFeFvVWLmL(gO1,i2)
coupR1 = cplcUFeFvVWLmR(gO1,i2)
coupL2 =  Conjg(cplcUFeFvVWLmL(gO2,i2))
coupR2 =  Conjg(cplcUFeFvVWLmR(gO2,i2))
SumSL(gO1,gO2) = coupL1*coupR2*B0m2 
SumSR(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
    End Do 
 !------------------------ 
! VWRm, Fv 
!------------------------ 
      Do i2 = 1, 9
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
If(gO1.eq.gO2) Then 
B1m2 = -2._dp*Real(SA_B1(MFe2(gO1),MFv2(i2),MVWRm2),dp) 
B0m2 = -4._dp*MFv(i2)*Real(SA_B0(MFe2(gO1),MFv2(i2),MVWRm2)-0.5_dp*rMS,dp) 
Else 
B1m2 = -2._dp*Real(SA_B1(p2,MFv2(i2),MVWRm2)+ 0.5_dp*rMS,dp) 
B0m2 = -4._dp*MFv(i2)*Real(SA_B0(p2,MFv2(i2),MVWRm2)-0.5_dp*rMS,dp) 
End If 
coupL1 = cplcUFeFvVWRmL(gO1,i2)
coupR1 = cplcUFeFvVWRmR(gO1,i2)
coupL2 =  Conjg(cplcUFeFvVWRmL(gO2,i2))
coupR2 =  Conjg(cplcUFeFvVWRmR(gO2,i2))
SumSL(gO1,gO2) = coupL1*coupR2*B0m2 
SumSR(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
    End Do 
 SigL = oo16pi2*SigL 
SigR = oo16pi2*SigR 
SigSL = oo16pi2*SigSL 
SigSR = oo16pi2*SigSR 
 
End Subroutine Sigma1LoopFeMZ 
 
Subroutine Sigma1LoopFdMZ(p2,MFd,MFd2,MAh,MAh2,Mhh,Mhh2,MVZ,MVZ2,MVZR,MVZR2,          & 
& MHpm,MHpm2,MFu,MFu2,MVWLm,MVWLm2,MVWRm,MVWRm2,cplcUFdFdAhL,cplcUFdFdAhR,               & 
& cplcUFdFdhhL,cplcUFdFdhhR,cplcUFdFdVGL,cplcUFdFdVGR,cplcUFdFdVPL,cplcUFdFdVPR,         & 
& cplcUFdFdVZL,cplcUFdFdVZR,cplcUFdFdVZRL,cplcUFdFdVZRR,cplcUFdFucHpmL,cplcUFdFucHpmR,   & 
& cplcUFdFuVWLmL,cplcUFdFuVWLmR,cplcUFdFuVWRmL,cplcUFdFuVWRmR,sigL,sigR,sigSL,sigSR)

Implicit None 
Real(dp), Intent(in) :: MFd(3),MFd2(3),MAh(4),MAh2(4),Mhh(4),Mhh2(4),MVZ,MVZ2,MVZR,MVZR2,MHpm(4),             & 
& MHpm2(4),MFu(3),MFu2(3),MVWLm,MVWLm2,MVWRm,MVWRm2

Complex(dp), Intent(in) :: cplcUFdFdAhL(3,3,4),cplcUFdFdAhR(3,3,4),cplcUFdFdhhL(3,3,4),cplcUFdFdhhR(3,3,4),      & 
& cplcUFdFdVGL(3,3),cplcUFdFdVGR(3,3),cplcUFdFdVPL(3,3),cplcUFdFdVPR(3,3),               & 
& cplcUFdFdVZL(3,3),cplcUFdFdVZR(3,3),cplcUFdFdVZRL(3,3),cplcUFdFdVZRR(3,3),             & 
& cplcUFdFucHpmL(3,3,4),cplcUFdFucHpmR(3,3,4),cplcUFdFuVWLmL(3,3),cplcUFdFuVWLmR(3,3),   & 
& cplcUFdFuVWRmL(3,3),cplcUFdFuVWRmR(3,3)

Complex(dp), Intent(out) :: SigL(3,3),SigR(3,3), SigSL(3,3), SigSR(3,3) 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2,temp, sumL(3,3), sumR(3,3), sumSL(3,3), sumSR(3,3) 
Real(dp) :: B0m2, F0m2, G0m2,B1m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
SigL = Cmplx(0._dp,0._dp,dp) 
SigR = Cmplx(0._dp,0._dp,dp) 
SigSL = Cmplx(0._dp,0._dp,dp) 
 SigSR = Cmplx(0._dp,0._dp,dp) 
 
!------------------------ 
! Fd, Ah 
!------------------------ 
    Do i1 = 1, 3
       Do i2 = 1, 4
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
If(gO1.eq.gO2) Then 
B1m2 = -Real(SA_B1(MFd2(gO1),MFd2(i1),MAh2(i2)),dp) 
B0m2 = MFd(i1)*Real(SA_B0(MFd2(gO1),MFd2(i1),MAh2(i2)),dp) 
Else 
B1m2 = -Real(SA_B1(p2,MFd2(i1),MAh2(i2)),dp) 
B0m2 = MFd(i1)*Real(SA_B0(p2,MFd2(i1),MAh2(i2)),dp) 
End If 
coupL1 = cplcUFdFdAhL(gO1,i1,i2)
coupR1 = cplcUFdFdAhR(gO1,i1,i2)
coupL2 =  Conjg(cplcUFdFdAhL(gO2,i1,i2))
coupR2 =  Conjg(cplcUFdFdAhR(gO2,i1,i2))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! hh, Fd 
!------------------------ 
    Do i1 = 1, 4
       Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
If(gO1.eq.gO2) Then 
B1m2 = -Real(SA_B1(MFd2(gO1),MFd2(i2),Mhh2(i1)),dp) 
B0m2 = MFd(i2)*Real(SA_B0(MFd2(gO1),MFd2(i2),Mhh2(i1)),dp) 
Else 
B1m2 = -Real(SA_B1(p2,MFd2(i2),Mhh2(i1)),dp) 
B0m2 = MFd(i2)*Real(SA_B0(p2,MFd2(i2),Mhh2(i1)),dp) 
End If 
coupL1 = cplcUFdFdhhL(gO1,i2,i1)
coupR1 = cplcUFdFdhhR(gO1,i2,i1)
coupL2 =  Conjg(cplcUFdFdhhL(gO2,i2,i1))
coupR2 =  Conjg(cplcUFdFdhhR(gO2,i2,i1))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! VZ, Fd 
!------------------------ 
      Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
If(gO1.eq.gO2) Then 
B1m2 = -2._dp*Real(SA_B1(MFd2(gO1),MFd2(i2),MVZ2),dp) 
B0m2 = -4._dp*MFd(i2)*Real(SA_B0(MFd2(gO1),MFd2(i2),MVZ2)-0.5_dp*rMS,dp) 
Else 
B1m2 = -2._dp*Real(SA_B1(p2,MFd2(i2),MVZ2)+ 0.5_dp*rMS,dp) 
B0m2 = -4._dp*MFd(i2)*Real(SA_B0(p2,MFd2(i2),MVZ2)-0.5_dp*rMS,dp) 
End If 
coupL1 = cplcUFdFdVZL(gO1,i2)
coupR1 = cplcUFdFdVZR(gO1,i2)
coupL2 =  Conjg(cplcUFdFdVZL(gO2,i2))
coupR2 =  Conjg(cplcUFdFdVZR(gO2,i2))
SumSL(gO1,gO2) = coupL1*coupR2*B0m2 
SumSR(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
    End Do 
 !------------------------ 
! VZR, Fd 
!------------------------ 
      Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
If(gO1.eq.gO2) Then 
B1m2 = -2._dp*Real(SA_B1(MFd2(gO1),MFd2(i2),MVZR2),dp) 
B0m2 = -4._dp*MFd(i2)*Real(SA_B0(MFd2(gO1),MFd2(i2),MVZR2)-0.5_dp*rMS,dp) 
Else 
B1m2 = -2._dp*Real(SA_B1(p2,MFd2(i2),MVZR2)+ 0.5_dp*rMS,dp) 
B0m2 = -4._dp*MFd(i2)*Real(SA_B0(p2,MFd2(i2),MVZR2)-0.5_dp*rMS,dp) 
End If 
coupL1 = cplcUFdFdVZRL(gO1,i2)
coupR1 = cplcUFdFdVZRR(gO1,i2)
coupL2 =  Conjg(cplcUFdFdVZRL(gO2,i2))
coupR2 =  Conjg(cplcUFdFdVZRR(gO2,i2))
SumSL(gO1,gO2) = coupL1*coupR2*B0m2 
SumSR(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
    End Do 
 !------------------------ 
! conj[Hpm], Fu 
!------------------------ 
    Do i1 = 1, 4
       Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
If(gO1.eq.gO2) Then 
B1m2 = -Real(SA_B1(MFd2(gO1),MFu2(i2),MHpm2(i1)),dp) 
B0m2 = MFu(i2)*Real(SA_B0(MFd2(gO1),MFu2(i2),MHpm2(i1)),dp) 
Else 
B1m2 = -Real(SA_B1(p2,MFu2(i2),MHpm2(i1)),dp) 
B0m2 = MFu(i2)*Real(SA_B0(p2,MFu2(i2),MHpm2(i1)),dp) 
End If 
coupL1 = cplcUFdFucHpmL(gO1,i2,i1)
coupR1 = cplcUFdFucHpmR(gO1,i2,i1)
coupL2 =  Conjg(cplcUFdFucHpmL(gO2,i2,i1))
coupR2 =  Conjg(cplcUFdFucHpmR(gO2,i2,i1))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! VWLm, Fu 
!------------------------ 
      Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
If(gO1.eq.gO2) Then 
B1m2 = -2._dp*Real(SA_B1(MFd2(gO1),MFu2(i2),MVWLm2),dp) 
B0m2 = -4._dp*MFu(i2)*Real(SA_B0(MFd2(gO1),MFu2(i2),MVWLm2)-0.5_dp*rMS,dp) 
Else 
B1m2 = -2._dp*Real(SA_B1(p2,MFu2(i2),MVWLm2)+ 0.5_dp*rMS,dp) 
B0m2 = -4._dp*MFu(i2)*Real(SA_B0(p2,MFu2(i2),MVWLm2)-0.5_dp*rMS,dp) 
End If 
coupL1 = cplcUFdFuVWLmL(gO1,i2)
coupR1 = cplcUFdFuVWLmR(gO1,i2)
coupL2 =  Conjg(cplcUFdFuVWLmL(gO2,i2))
coupR2 =  Conjg(cplcUFdFuVWLmR(gO2,i2))
SumSL(gO1,gO2) = coupL1*coupR2*B0m2 
SumSR(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
    End Do 
 !------------------------ 
! VWRm, Fu 
!------------------------ 
      Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
If(gO1.eq.gO2) Then 
B1m2 = -2._dp*Real(SA_B1(MFd2(gO1),MFu2(i2),MVWRm2),dp) 
B0m2 = -4._dp*MFu(i2)*Real(SA_B0(MFd2(gO1),MFu2(i2),MVWRm2)-0.5_dp*rMS,dp) 
Else 
B1m2 = -2._dp*Real(SA_B1(p2,MFu2(i2),MVWRm2)+ 0.5_dp*rMS,dp) 
B0m2 = -4._dp*MFu(i2)*Real(SA_B0(p2,MFu2(i2),MVWRm2)-0.5_dp*rMS,dp) 
End If 
coupL1 = cplcUFdFuVWRmL(gO1,i2)
coupR1 = cplcUFdFuVWRmR(gO1,i2)
coupL2 =  Conjg(cplcUFdFuVWRmL(gO2,i2))
coupR2 =  Conjg(cplcUFdFuVWRmR(gO2,i2))
SumSL(gO1,gO2) = coupL1*coupR2*B0m2 
SumSR(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
    End Do 
 SigL = oo16pi2*SigL 
SigR = oo16pi2*SigR 
SigSL = oo16pi2*SigSL 
SigSR = oo16pi2*SigSR 
 
End Subroutine Sigma1LoopFdMZ 
 
Subroutine Sigma1LoopFuMZ(p2,MFu,MFu2,MAh,MAh2,MVWLm,MVWLm2,MFd,MFd2,MVWRm,           & 
& MVWRm2,MHpm,MHpm2,Mhh,Mhh2,MVZ,MVZ2,MVZR,MVZR2,cplcUFuFuAhL,cplcUFuFuAhR,              & 
& cplcUFuFdcVWLmL,cplcUFuFdcVWLmR,cplcUFuFdcVWRmL,cplcUFuFdcVWRmR,cplcUFuFdHpmL,         & 
& cplcUFuFdHpmR,cplcUFuFuhhL,cplcUFuFuhhR,cplcUFuFuVGL,cplcUFuFuVGR,cplcUFuFuVPL,        & 
& cplcUFuFuVPR,cplcUFuFuVZL,cplcUFuFuVZR,cplcUFuFuVZRL,cplcUFuFuVZRR,sigL,               & 
& sigR,sigSL,sigSR)

Implicit None 
Real(dp), Intent(in) :: MFu(3),MFu2(3),MAh(4),MAh2(4),MVWLm,MVWLm2,MFd(3),MFd2(3),MVWRm,MVWRm2,               & 
& MHpm(4),MHpm2(4),Mhh(4),Mhh2(4),MVZ,MVZ2,MVZR,MVZR2

Complex(dp), Intent(in) :: cplcUFuFuAhL(3,3,4),cplcUFuFuAhR(3,3,4),cplcUFuFdcVWLmL(3,3),cplcUFuFdcVWLmR(3,3),    & 
& cplcUFuFdcVWRmL(3,3),cplcUFuFdcVWRmR(3,3),cplcUFuFdHpmL(3,3,4),cplcUFuFdHpmR(3,3,4),   & 
& cplcUFuFuhhL(3,3,4),cplcUFuFuhhR(3,3,4),cplcUFuFuVGL(3,3),cplcUFuFuVGR(3,3),           & 
& cplcUFuFuVPL(3,3),cplcUFuFuVPR(3,3),cplcUFuFuVZL(3,3),cplcUFuFuVZR(3,3),               & 
& cplcUFuFuVZRL(3,3),cplcUFuFuVZRR(3,3)

Complex(dp), Intent(out) :: SigL(3,3),SigR(3,3), SigSL(3,3), SigSR(3,3) 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2,temp, sumL(3,3), sumR(3,3), sumSL(3,3), sumSR(3,3) 
Real(dp) :: B0m2, F0m2, G0m2,B1m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
SigL = Cmplx(0._dp,0._dp,dp) 
SigR = Cmplx(0._dp,0._dp,dp) 
SigSL = Cmplx(0._dp,0._dp,dp) 
 SigSR = Cmplx(0._dp,0._dp,dp) 
 
!------------------------ 
! Fu, Ah 
!------------------------ 
    Do i1 = 1, 3
       Do i2 = 1, 4
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
If(gO1.eq.gO2) Then 
B1m2 = -Real(SA_B1(MFu2(gO1),MFu2(i1),MAh2(i2)),dp) 
B0m2 = MFu(i1)*Real(SA_B0(MFu2(gO1),MFu2(i1),MAh2(i2)),dp) 
Else 
B1m2 = -Real(SA_B1(p2,MFu2(i1),MAh2(i2)),dp) 
B0m2 = MFu(i1)*Real(SA_B0(p2,MFu2(i1),MAh2(i2)),dp) 
End If 
coupL1 = cplcUFuFuAhL(gO1,i1,i2)
coupR1 = cplcUFuFuAhR(gO1,i1,i2)
coupL2 =  Conjg(cplcUFuFuAhL(gO2,i1,i2))
coupR2 =  Conjg(cplcUFuFuAhR(gO2,i1,i2))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! conj[VWLm], Fd 
!------------------------ 
      Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
If(gO1.eq.gO2) Then 
B1m2 = -2._dp*Real(SA_B1(MFu2(gO1),MFd2(i2),MVWLm2),dp) 
B0m2 = -4._dp*MFd(i2)*Real(SA_B0(MFu2(gO1),MFd2(i2),MVWLm2)-0.5_dp*rMS,dp) 
Else 
B1m2 = -2._dp*Real(SA_B1(p2,MFd2(i2),MVWLm2)+ 0.5_dp*rMS,dp) 
B0m2 = -4._dp*MFd(i2)*Real(SA_B0(p2,MFd2(i2),MVWLm2)-0.5_dp*rMS,dp) 
End If 
coupL1 = cplcUFuFdcVWLmL(gO1,i2)
coupR1 = cplcUFuFdcVWLmR(gO1,i2)
coupL2 =  Conjg(cplcUFuFdcVWLmL(gO2,i2))
coupR2 =  Conjg(cplcUFuFdcVWLmR(gO2,i2))
SumSL(gO1,gO2) = coupL1*coupR2*B0m2 
SumSR(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
    End Do 
 !------------------------ 
! conj[VWRm], Fd 
!------------------------ 
      Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
If(gO1.eq.gO2) Then 
B1m2 = -2._dp*Real(SA_B1(MFu2(gO1),MFd2(i2),MVWRm2),dp) 
B0m2 = -4._dp*MFd(i2)*Real(SA_B0(MFu2(gO1),MFd2(i2),MVWRm2)-0.5_dp*rMS,dp) 
Else 
B1m2 = -2._dp*Real(SA_B1(p2,MFd2(i2),MVWRm2)+ 0.5_dp*rMS,dp) 
B0m2 = -4._dp*MFd(i2)*Real(SA_B0(p2,MFd2(i2),MVWRm2)-0.5_dp*rMS,dp) 
End If 
coupL1 = cplcUFuFdcVWRmL(gO1,i2)
coupR1 = cplcUFuFdcVWRmR(gO1,i2)
coupL2 =  Conjg(cplcUFuFdcVWRmL(gO2,i2))
coupR2 =  Conjg(cplcUFuFdcVWRmR(gO2,i2))
SumSL(gO1,gO2) = coupL1*coupR2*B0m2 
SumSR(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
    End Do 
 !------------------------ 
! Hpm, Fd 
!------------------------ 
    Do i1 = 1, 4
       Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
If(gO1.eq.gO2) Then 
B1m2 = -Real(SA_B1(MFu2(gO1),MFd2(i2),MHpm2(i1)),dp) 
B0m2 = MFd(i2)*Real(SA_B0(MFu2(gO1),MFd2(i2),MHpm2(i1)),dp) 
Else 
B1m2 = -Real(SA_B1(p2,MFd2(i2),MHpm2(i1)),dp) 
B0m2 = MFd(i2)*Real(SA_B0(p2,MFd2(i2),MHpm2(i1)),dp) 
End If 
coupL1 = cplcUFuFdHpmL(gO1,i2,i1)
coupR1 = cplcUFuFdHpmR(gO1,i2,i1)
coupL2 =  Conjg(cplcUFuFdHpmL(gO2,i2,i1))
coupR2 =  Conjg(cplcUFuFdHpmR(gO2,i2,i1))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! hh, Fu 
!------------------------ 
    Do i1 = 1, 4
       Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
If(gO1.eq.gO2) Then 
B1m2 = -Real(SA_B1(MFu2(gO1),MFu2(i2),Mhh2(i1)),dp) 
B0m2 = MFu(i2)*Real(SA_B0(MFu2(gO1),MFu2(i2),Mhh2(i1)),dp) 
Else 
B1m2 = -Real(SA_B1(p2,MFu2(i2),Mhh2(i1)),dp) 
B0m2 = MFu(i2)*Real(SA_B0(p2,MFu2(i2),Mhh2(i1)),dp) 
End If 
coupL1 = cplcUFuFuhhL(gO1,i2,i1)
coupR1 = cplcUFuFuhhR(gO1,i2,i1)
coupL2 =  Conjg(cplcUFuFuhhL(gO2,i2,i1))
coupR2 =  Conjg(cplcUFuFuhhR(gO2,i2,i1))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! VZ, Fu 
!------------------------ 
      Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
If(gO1.eq.gO2) Then 
B1m2 = -2._dp*Real(SA_B1(MFu2(gO1),MFu2(i2),MVZ2),dp) 
B0m2 = -4._dp*MFu(i2)*Real(SA_B0(MFu2(gO1),MFu2(i2),MVZ2)-0.5_dp*rMS,dp) 
Else 
B1m2 = -2._dp*Real(SA_B1(p2,MFu2(i2),MVZ2)+ 0.5_dp*rMS,dp) 
B0m2 = -4._dp*MFu(i2)*Real(SA_B0(p2,MFu2(i2),MVZ2)-0.5_dp*rMS,dp) 
End If 
coupL1 = cplcUFuFuVZL(gO1,i2)
coupR1 = cplcUFuFuVZR(gO1,i2)
coupL2 =  Conjg(cplcUFuFuVZL(gO2,i2))
coupR2 =  Conjg(cplcUFuFuVZR(gO2,i2))
SumSL(gO1,gO2) = coupL1*coupR2*B0m2 
SumSR(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
    End Do 
 !------------------------ 
! VZR, Fu 
!------------------------ 
      Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
If(gO1.eq.gO2) Then 
B1m2 = -2._dp*Real(SA_B1(MFu2(gO1),MFu2(i2),MVZR2),dp) 
B0m2 = -4._dp*MFu(i2)*Real(SA_B0(MFu2(gO1),MFu2(i2),MVZR2)-0.5_dp*rMS,dp) 
Else 
B1m2 = -2._dp*Real(SA_B1(p2,MFu2(i2),MVZR2)+ 0.5_dp*rMS,dp) 
B0m2 = -4._dp*MFu(i2)*Real(SA_B0(p2,MFu2(i2),MVZR2)-0.5_dp*rMS,dp) 
End If 
coupL1 = cplcUFuFuVZRL(gO1,i2)
coupR1 = cplcUFuFuVZRR(gO1,i2)
coupL2 =  Conjg(cplcUFuFuVZRL(gO2,i2))
coupR2 =  Conjg(cplcUFuFuVZRR(gO2,i2))
SumSL(gO1,gO2) = coupL1*coupR2*B0m2 
SumSR(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
    End Do 
 SigL = oo16pi2*SigL 
SigR = oo16pi2*SigR 
SigSL = oo16pi2*SigSL 
SigSR = oo16pi2*SigSR 
 
End Subroutine Sigma1LoopFuMZ 
 
Subroutine Pi1LoopVZVZR(p2,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,              & 
& Mhh,Mhh2,MHpm,MHpm2,MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,MVZR2,cplAhAhVZVZR,        & 
& cplAhhhVZ,cplAhhhVZR,cplcFdFdVZL,cplcFdFdVZR,cplcFdFdVZRL,cplcFdFdVZRR,cplcFeFeVZL,    & 
& cplcFeFeVZR,cplcFeFeVZRL,cplcFeFeVZRR,cplcFuFuVZL,cplcFuFuVZR,cplcFuFuVZRL,            & 
& cplcFuFuVZRR,cplcgWLmgWLmVZ,cplcgWLmgWLmVZR,cplcgWLmgWRmVZ,cplcgWLmgWRmVZR,            & 
& cplcgWLpgWLpVZ,cplcgWLpgWLpVZR,cplcgWLpgWRpVZ,cplcgWLpgWRpVZR,cplcgWRmgWLmVZ,          & 
& cplcgWRmgWLmVZR,cplcgWRmgWRmVZ,cplcgWRmgWRmVZR,cplcgWRpgWLpVZ,cplcgWRpgWLpVZR,         & 
& cplcgWRpgWRpVZ,cplcgWRpgWRpVZR,cplcHpmcVWLmVZ,cplcHpmcVWLmVZR,cplcHpmcVWRmVZ,          & 
& cplcHpmcVWRmVZR,cplcVWLmVWLmVZ,cplcVWLmVWLmVZR,cplcVWLmVWLmVZVZR1,cplcVWLmVWLmVZVZR2,  & 
& cplcVWLmVWLmVZVZR3,cplcVWLmVWRmVZ,cplcVWLmVWRmVZR,cplcVWRmVWLmVZ,cplcVWRmVWLmVZR,      & 
& cplcVWRmVWRmVZ,cplcVWRmVWRmVZR,cplcVWRmVWRmVZVZR1,cplcVWRmVWRmVZVZR2,cplcVWRmVWRmVZVZR3,& 
& cplFvFvVZL,cplFvFvVZR,cplFvFvVZRL,cplFvFvVZRR,cplhhhhVZVZR,cplhhVPVZ,cplhhVPVZR,       & 
& cplhhVZRVZR,cplhhVZVZ,cplhhVZVZR,cplHpmcHpmVZ,cplHpmcHpmVZR,cplHpmcHpmVZVZR,           & 
& cplHpmVWLmVZ,cplHpmVWLmVZR,cplHpmVWRmVZ,cplHpmVWRmVZR,kont,res)

Implicit None 
Real(dp), Intent(in) :: MAh(4),MAh2(4),MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),MFv(9),MFv2(9),           & 
& Mhh(4),Mhh2(4),MHpm(4),MHpm2(4),MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,MVZR2

Complex(dp), Intent(in) :: cplAhAhVZVZR(4,4),cplAhhhVZ(4,4),cplAhhhVZR(4,4),cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),   & 
& cplcFdFdVZRL(3,3),cplcFdFdVZRR(3,3),cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),cplcFeFeVZRL(3,3),& 
& cplcFeFeVZRR(3,3),cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),cplcFuFuVZRL(3,3),cplcFuFuVZRR(3,3),& 
& cplcgWLmgWLmVZ,cplcgWLmgWLmVZR,cplcgWLmgWRmVZ,cplcgWLmgWRmVZR,cplcgWLpgWLpVZ,          & 
& cplcgWLpgWLpVZR,cplcgWLpgWRpVZ,cplcgWLpgWRpVZR,cplcgWRmgWLmVZ,cplcgWRmgWLmVZR,         & 
& cplcgWRmgWRmVZ,cplcgWRmgWRmVZR,cplcgWRpgWLpVZ,cplcgWRpgWLpVZR,cplcgWRpgWRpVZ,          & 
& cplcgWRpgWRpVZR,cplcHpmcVWLmVZ(4),cplcHpmcVWLmVZR(4),cplcHpmcVWRmVZ(4),cplcHpmcVWRmVZR(4),& 
& cplcVWLmVWLmVZ,cplcVWLmVWLmVZR,cplcVWLmVWLmVZVZR1,cplcVWLmVWLmVZVZR2,cplcVWLmVWLmVZVZR3,& 
& cplcVWLmVWRmVZ,cplcVWLmVWRmVZR,cplcVWRmVWLmVZ,cplcVWRmVWLmVZR,cplcVWRmVWRmVZ,          & 
& cplcVWRmVWRmVZR,cplcVWRmVWRmVZVZR1,cplcVWRmVWRmVZVZR2,cplcVWRmVWRmVZVZR3,              & 
& cplFvFvVZL(9,9),cplFvFvVZR(9,9),cplFvFvVZRL(9,9),cplFvFvVZRR(9,9),cplhhhhVZVZR(4,4),   & 
& cplhhVPVZ(4),cplhhVPVZR(4),cplhhVZRVZR(4),cplhhVZVZ(4),cplhhVZVZR(4),cplHpmcHpmVZ(4,4),& 
& cplHpmcHpmVZR(4,4),cplHpmcHpmVZVZR(4,4),cplHpmVWLmVZ(4),cplHpmVWLmVZR(4),              & 
& cplHpmVWRmVZ(4),cplHpmVWRmVZR(4)

Integer, Intent(inout) :: kont 
Real(dp) :: B0m2, F0m2, G0m2, B1m2, H0m2, B22m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Complex(dp), Intent(inout) :: res 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2, coup3, temp, sumI 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
res = 0._dp 
 
!------------------------ 
! hh, Ah 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
       Do i2 = 1, 4
 B22m2 = Real(VSSloop(p2,MAh2(i2),Mhh2(i1)),dp) 
coup1 = cplAhhhVZ(i2,i1)
coup2 = cplAhhhVZR(i2,i1)
    SumI = coup1*coup2*B22m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fd], Fd 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 H0m2 = Real(SA_Hloop(p2,MFd2(i1),MFd2(i2)),dp) 
B0m2 = 4._dp*MFd(i1)*MFd(i2)*Real(SA_B0(p2,MFd2(i1),MFd2(i2)),dp) 
coupL1 = cplcFdFdVZL(i1,i2)
coupR1 = cplcFdFdVZR(i1,i2)
coupL2 = cplcFdFdVZRL(i2,i1)
coupR2 = cplcFdFdVZRR(i2,i1)
    SumI = (coupL1*coupL2+coupR1*coupR2)*H0m2 & 
                & + 0.5_dp*(coupL1*coupR2 + coupL2*coupR1)*B0m2 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fe], Fe 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 H0m2 = Real(SA_Hloop(p2,MFe2(i1),MFe2(i2)),dp) 
B0m2 = 4._dp*MFe(i1)*MFe(i2)*Real(SA_B0(p2,MFe2(i1),MFe2(i2)),dp) 
coupL1 = cplcFeFeVZL(i1,i2)
coupR1 = cplcFeFeVZR(i1,i2)
coupL2 = cplcFeFeVZRL(i2,i1)
coupR2 = cplcFeFeVZRR(i2,i1)
    SumI = (coupL1*coupL2+coupR1*coupR2)*H0m2 & 
                & + 0.5_dp*(coupL1*coupR2 + coupL2*coupR1)*B0m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fu], Fu 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 H0m2 = Real(SA_Hloop(p2,MFu2(i1),MFu2(i2)),dp) 
B0m2 = 4._dp*MFu(i1)*MFu(i2)*Real(SA_B0(p2,MFu2(i1),MFu2(i2)),dp) 
coupL1 = cplcFuFuVZL(i1,i2)
coupR1 = cplcFuFuVZR(i1,i2)
coupL2 = cplcFuFuVZRL(i2,i1)
coupR2 = cplcFuFuVZRR(i2,i1)
    SumI = (coupL1*coupL2+coupR1*coupR2)*H0m2 & 
                & + 0.5_dp*(coupL1*coupR2 + coupL2*coupR1)*B0m2 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! Fv, Fv 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 9
       Do i2 = 1, 9
 H0m2 = Real(SA_Hloop(p2,MFv2(i1),MFv2(i2)),dp) 
B0m2 = 4._dp*MFv(i1)*MFv(i2)*Real(SA_B0(p2,MFv2(i1),MFv2(i2)),dp) 
coupL1 = cplFvFvVZL(i1,i2)
coupR1 = cplFvFvVZR(i1,i2)
coupL2 = cplFvFvVZRL(i1,i2)
coupR2 = cplFvFvVZRR(i1,i2)
    SumI = (coupL1*coupL2+coupR1*coupR2)*H0m2 & 
                & + 0.5_dp*(coupL1*coupR2 + coupL2*coupR1)*B0m2 
res = res +0.5_dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[gWLm], gWLm 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(VGGloop(p2,MVWLm2,MVWLm2),dp)
coup1 = cplcgWLmgWLmVZ
coup2 = cplcgWLmgWLmVZR 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWRm], gWLm 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(VGGloop(p2,MVWLm2,MVWRm2),dp)
coup1 = cplcgWRmgWLmVZ
coup2 = cplcgWLmgWRmVZR 
   SumI = coup1*coup2*B0m2 
res = res +2._dp* SumI  
!------------------------ 
! bar[gWLmC], gWLmC 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(VGGloop(p2,MVWLm2,MVWLm2),dp)
coup1 = cplcgWLpgWLpVZ
coup2 = cplcgWLpgWLpVZR 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWRmC], gWLmC 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(VGGloop(p2,MVWLm2,MVWRm2),dp)
coup1 = cplcgWRpgWLpVZ
coup2 = cplcgWLpgWRpVZR 
   SumI = coup1*coup2*B0m2 
res = res +2._dp* SumI  
!------------------------ 
! bar[gWLm], gWRm 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(VGGloop(p2,MVWRm2,MVWLm2),dp)
coup1 = cplcgWLmgWRmVZ
coup2 = cplcgWRmgWLmVZR 
   SumI = coup1*coup2*B0m2 
res = res +2._dp* SumI  
!------------------------ 
! bar[gWRm], gWRm 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(VGGloop(p2,MVWRm2,MVWRm2),dp)
coup1 = cplcgWRmgWRmVZ
coup2 = cplcgWRmgWRmVZR 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWLmC], gWRmC 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(VGGloop(p2,MVWRm2,MVWLm2),dp)
coup1 = cplcgWLpgWRpVZ
coup2 = cplcgWRpgWLpVZR 
   SumI = coup1*coup2*B0m2 
res = res +2._dp* SumI  
!------------------------ 
! bar[gWRmC], gWRmC 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(VGGloop(p2,MVWRm2,MVWRm2),dp)
coup1 = cplcgWRpgWRpVZ
coup2 = cplcgWRpgWRpVZR 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! VP, hh 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! VZ, hh 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 B0m2 = Real(VVSloop(p2,MVZ2,Mhh2(i2)),dp) 
coup1 = cplhhVZVZ(i2)
coup2 = cplhhVZVZR(i2)
    SumI = coup1*coup2*B0m2 
res = res +0.5_dp* SumI  
    End Do 
 !------------------------ 
! VZR, hh 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 B0m2 = Real(VVSloop(p2,MVZR2,Mhh2(i2)),dp) 
coup1 = cplhhVZVZR(i2)
coup2 = cplhhVZRVZR(i2)
    SumI = coup1*coup2*B0m2 
res = res +0.5_dp* SumI  
    End Do 
 !------------------------ 
! conj[Hpm], Hpm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
       Do i2 = 1, 4
 B22m2 = Real(VSSloop(p2,MHpm2(i2),MHpm2(i1)),dp) 
coup1 = cplHpmcHpmVZ(i2,i1)
coup2 = cplHpmcHpmVZR(i1,i2)
    SumI = coup1*coup2*B22m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! VWLm, Hpm 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 B0m2 = Real(VVSloop(p2,MVWLm2,MHpm2(i2)),dp) 
coup1 = cplHpmVWLmVZ(i2)
coup2 = cplcHpmcVWLmVZR(i2)
    SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! VWRm, Hpm 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 B0m2 = Real(VVSloop(p2,MVWRm2,MHpm2(i2)),dp) 
coup1 = cplHpmVWRmVZ(i2)
coup2 = cplcHpmcVWRmVZR(i2)
    SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! conj[VWLm], VWLm 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(VVVloop(p2,MVWLm2,MVWLm2),dp) 
coup1 = cplcVWLmVWLmVZ
coup2 = cplcVWLmVWLmVZR
    SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! conj[VWRm], VWLm 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(VVVloop(p2,MVWRm2,MVWLm2),dp) 
coup1 = cplcVWRmVWLmVZ
coup2 = cplcVWLmVWRmVZR
    SumI = coup1*coup2*B0m2 
res = res +2._dp* SumI  
!------------------------ 
! conj[VWLm], VWRm 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(VVVloop(p2,MVWLm2,MVWRm2),dp) 
coup1 = cplcVWLmVWRmVZ
coup2 = cplcVWRmVWLmVZR
    SumI = coup1*coup2*B0m2 
res = res +2._dp* SumI  
!------------------------ 
! conj[VWRm], VWRm 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(VVVloop(p2,MVWRm2,MVWRm2),dp) 
coup1 = cplcVWRmVWRmVZ
coup2 = cplcVWRmVWRmVZR
    SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! conj[VWLm], conj[Hpm] 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 B0m2 = Real(VVSloop(p2,MVWLm2,MHpm2(i2)),dp) 
coup1 = cplcHpmcVWLmVZ(i2)
coup2 = cplHpmVWLmVZR(i2)
    SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! conj[VWRm], conj[Hpm] 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 B0m2 = Real(VVSloop(p2,MVWRm2,MHpm2(i2)),dp) 
coup1 = cplcHpmcVWRmVZ(i2)
coup2 = cplHpmVWRmVZR(i2)
    SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! Ah 
!------------------------ 
    Do i1 = 1, 4
 SumI = 0._dp 
 A0m2 = SA_A0(MAh2(i1))
 coup1 = cplAhAhVZVZR(i1,i1)
 SumI = coup1*A0m2 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! hh 
!------------------------ 
    Do i1 = 1, 4
 SumI = 0._dp 
 A0m2 = SA_A0(Mhh2(i1))
 coup1 = cplhhhhVZVZR(i1,i1)
 SumI = coup1*A0m2 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! conj[Hpm] 
!------------------------ 
    Do i1 = 1, 4
 SumI = 0._dp 
 A0m2 = SA_A0(MHpm2(i1))
 coup1 = cplHpmcHpmVZVZR(i1,i1)
 SumI = coup1*A0m2 
res = res +1* SumI  
      End Do 
 !------------------------ 
! conj[VWLm] 
!------------------------ 
SumI = 0._dp 
A0m2 = 3._dp/4._dp*SA_A0(MVWLm2) +RXi/4._dp*SA_A0(MVWLm2*RXi) 
coup1 = cplcVWLmVWLmVZVZR1
coup2 = cplcVWLmVWLmVZVZR2
coup3 = cplcVWLmVWLmVZVZR3
SumI = ((2._dp*rMS*coup1+(1-RXi**2)/8._dp*(coup2+coup3))*MVWLm2-(4._dp*coup1+coup2+coup3)*A0m2)
res = res +1* SumI  
!------------------------ 
! conj[VWRm] 
!------------------------ 
SumI = 0._dp 
A0m2 = 3._dp/4._dp*SA_A0(MVWRm2) +RXi/4._dp*SA_A0(MVWRm2*RXi) 
coup1 = cplcVWRmVWRmVZVZR1
coup2 = cplcVWRmVWRmVZVZR2
coup3 = cplcVWRmVWRmVZVZR3
SumI = ((2._dp*rMS*coup1+(1-RXi**2)/8._dp*(coup2+coup3))*MVWRm2-(4._dp*coup1+coup2+coup3)*A0m2)
res = res +1* SumI  
res = oo16pi2*res 
 
End Subroutine Pi1LoopVZVZR 
 
Subroutine DerPi1LoopVZVZR(p2,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,           & 
& Mhh,Mhh2,MHpm,MHpm2,MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,MVZR2,cplAhAhVZVZR,        & 
& cplAhhhVZ,cplAhhhVZR,cplcFdFdVZL,cplcFdFdVZR,cplcFdFdVZRL,cplcFdFdVZRR,cplcFeFeVZL,    & 
& cplcFeFeVZR,cplcFeFeVZRL,cplcFeFeVZRR,cplcFuFuVZL,cplcFuFuVZR,cplcFuFuVZRL,            & 
& cplcFuFuVZRR,cplcgWLmgWLmVZ,cplcgWLmgWLmVZR,cplcgWLmgWRmVZ,cplcgWLmgWRmVZR,            & 
& cplcgWLpgWLpVZ,cplcgWLpgWLpVZR,cplcgWLpgWRpVZ,cplcgWLpgWRpVZR,cplcgWRmgWLmVZ,          & 
& cplcgWRmgWLmVZR,cplcgWRmgWRmVZ,cplcgWRmgWRmVZR,cplcgWRpgWLpVZ,cplcgWRpgWLpVZR,         & 
& cplcgWRpgWRpVZ,cplcgWRpgWRpVZR,cplcHpmcVWLmVZ,cplcHpmcVWLmVZR,cplcHpmcVWRmVZ,          & 
& cplcHpmcVWRmVZR,cplcVWLmVWLmVZ,cplcVWLmVWLmVZR,cplcVWLmVWLmVZVZR1,cplcVWLmVWLmVZVZR2,  & 
& cplcVWLmVWLmVZVZR3,cplcVWLmVWRmVZ,cplcVWLmVWRmVZR,cplcVWRmVWLmVZ,cplcVWRmVWLmVZR,      & 
& cplcVWRmVWRmVZ,cplcVWRmVWRmVZR,cplcVWRmVWRmVZVZR1,cplcVWRmVWRmVZVZR2,cplcVWRmVWRmVZVZR3,& 
& cplFvFvVZL,cplFvFvVZR,cplFvFvVZRL,cplFvFvVZRR,cplhhhhVZVZR,cplhhVPVZ,cplhhVPVZR,       & 
& cplhhVZRVZR,cplhhVZVZ,cplhhVZVZR,cplHpmcHpmVZ,cplHpmcHpmVZR,cplHpmcHpmVZVZR,           & 
& cplHpmVWLmVZ,cplHpmVWLmVZR,cplHpmVWRmVZ,cplHpmVWRmVZR,kont,res)

Implicit None 
Real(dp), Intent(in) :: MAh(4),MAh2(4),MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),MFv(9),MFv2(9),           & 
& Mhh(4),Mhh2(4),MHpm(4),MHpm2(4),MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,MVZR2

Complex(dp), Intent(in) :: cplAhAhVZVZR(4,4),cplAhhhVZ(4,4),cplAhhhVZR(4,4),cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),   & 
& cplcFdFdVZRL(3,3),cplcFdFdVZRR(3,3),cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),cplcFeFeVZRL(3,3),& 
& cplcFeFeVZRR(3,3),cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),cplcFuFuVZRL(3,3),cplcFuFuVZRR(3,3),& 
& cplcgWLmgWLmVZ,cplcgWLmgWLmVZR,cplcgWLmgWRmVZ,cplcgWLmgWRmVZR,cplcgWLpgWLpVZ,          & 
& cplcgWLpgWLpVZR,cplcgWLpgWRpVZ,cplcgWLpgWRpVZR,cplcgWRmgWLmVZ,cplcgWRmgWLmVZR,         & 
& cplcgWRmgWRmVZ,cplcgWRmgWRmVZR,cplcgWRpgWLpVZ,cplcgWRpgWLpVZR,cplcgWRpgWRpVZ,          & 
& cplcgWRpgWRpVZR,cplcHpmcVWLmVZ(4),cplcHpmcVWLmVZR(4),cplcHpmcVWRmVZ(4),cplcHpmcVWRmVZR(4),& 
& cplcVWLmVWLmVZ,cplcVWLmVWLmVZR,cplcVWLmVWLmVZVZR1,cplcVWLmVWLmVZVZR2,cplcVWLmVWLmVZVZR3,& 
& cplcVWLmVWRmVZ,cplcVWLmVWRmVZR,cplcVWRmVWLmVZ,cplcVWRmVWLmVZR,cplcVWRmVWRmVZ,          & 
& cplcVWRmVWRmVZR,cplcVWRmVWRmVZVZR1,cplcVWRmVWRmVZVZR2,cplcVWRmVWRmVZVZR3,              & 
& cplFvFvVZL(9,9),cplFvFvVZR(9,9),cplFvFvVZRL(9,9),cplFvFvVZRR(9,9),cplhhhhVZVZR(4,4),   & 
& cplhhVPVZ(4),cplhhVPVZR(4),cplhhVZRVZR(4),cplhhVZVZ(4),cplhhVZVZR(4),cplHpmcHpmVZ(4,4),& 
& cplHpmcHpmVZR(4,4),cplHpmcHpmVZVZR(4,4),cplHpmVWLmVZ(4),cplHpmVWLmVZR(4),              & 
& cplHpmVWRmVZ(4),cplHpmVWRmVZR(4)

Integer, Intent(inout) :: kont 
Real(dp) :: B0m2, F0m2, G0m2, B1m2, H0m2, B22m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Complex(dp), Intent(inout) :: res 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2, coup3, temp, sumI 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
Real(dp) ::MVG,MVP,MVG2,MVP2
MVG = Mass_Regulator_PhotonGluon 
MVP = Mass_Regulator_PhotonGluon 
MVG2 = Mass_Regulator_PhotonGluon**2 
MVP2 = Mass_Regulator_PhotonGluon**2 

res = 0._dp 
 
!------------------------ 
! hh, Ah 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
       Do i2 = 1, 4
 B22m2 = Real(DerVSSloop(p2,MAh2(i2),Mhh2(i1)),dp) 
coup1 = cplAhhhVZ(i2,i1)
coup2 = cplAhhhVZR(i2,i1)
    SumI = coup1*coup2*B22m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fd], Fd 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 H0m2 = Real(SA_DerHloop(p2,MFd2(i1),MFd2(i2)),dp) 
B0m2 = 2._dp*MFd(i1)*MFd(i2)*Real(SA_DerB0(p2,MFd2(i1),MFd2(i2)),dp) 
coupL1 = cplcFdFdVZL(i1,i2)
coupR1 = cplcFdFdVZR(i1,i2)
coupL2 = cplcFdFdVZRL(i2,i1)
coupR2 = cplcFdFdVZRR(i2,i1)
    SumI = (coupL1*coupL2+coupR1*coupR2)*H0m2 & 
                & + 0.5_dp*(coupL1*coupR2 + coupL2*coupR1)*B0m2 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fe], Fe 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 H0m2 = Real(SA_DerHloop(p2,MFe2(i1),MFe2(i2)),dp) 
B0m2 = 2._dp*MFe(i1)*MFe(i2)*Real(SA_DerB0(p2,MFe2(i1),MFe2(i2)),dp) 
coupL1 = cplcFeFeVZL(i1,i2)
coupR1 = cplcFeFeVZR(i1,i2)
coupL2 = cplcFeFeVZRL(i2,i1)
coupR2 = cplcFeFeVZRR(i2,i1)
    SumI = (coupL1*coupL2+coupR1*coupR2)*H0m2 & 
                & + 0.5_dp*(coupL1*coupR2 + coupL2*coupR1)*B0m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fu], Fu 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 H0m2 = Real(SA_DerHloop(p2,MFu2(i1),MFu2(i2)),dp) 
B0m2 = 2._dp*MFu(i1)*MFu(i2)*Real(SA_DerB0(p2,MFu2(i1),MFu2(i2)),dp) 
coupL1 = cplcFuFuVZL(i1,i2)
coupR1 = cplcFuFuVZR(i1,i2)
coupL2 = cplcFuFuVZRL(i2,i1)
coupR2 = cplcFuFuVZRR(i2,i1)
    SumI = (coupL1*coupL2+coupR1*coupR2)*H0m2 & 
                & + 0.5_dp*(coupL1*coupR2 + coupL2*coupR1)*B0m2 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! Fv, Fv 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 9
       Do i2 = 1, 9
 H0m2 = Real(SA_DerHloop(p2,MFv2(i1),MFv2(i2)),dp) 
B0m2 = 2._dp*MFv(i1)*MFv(i2)*Real(SA_DerB0(p2,MFv2(i1),MFv2(i2)),dp) 
coupL1 = cplFvFvVZL(i1,i2)
coupR1 = cplFvFvVZR(i1,i2)
coupL2 = cplFvFvVZRL(i1,i2)
coupR2 = cplFvFvVZRR(i1,i2)
    SumI = (coupL1*coupL2+coupR1*coupR2)*H0m2 & 
                & + 0.5_dp*(coupL1*coupR2 + coupL2*coupR1)*B0m2 
res = res +0.5_dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[gWLm], gWLm 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(DerVGGloop(p2,MVWLm2,MVWLm2),dp)
coup1 = cplcgWLmgWLmVZ
coup2 = cplcgWLmgWLmVZR 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWRm], gWLm 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(DerVGGloop(p2,MVWLm2,MVWRm2),dp)
coup1 = cplcgWRmgWLmVZ
coup2 = cplcgWLmgWRmVZR 
   SumI = coup1*coup2*B0m2 
res = res +2._dp* SumI  
!------------------------ 
! bar[gWLmC], gWLmC 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(DerVGGloop(p2,MVWLm2,MVWLm2),dp)
coup1 = cplcgWLpgWLpVZ
coup2 = cplcgWLpgWLpVZR 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWRmC], gWLmC 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(DerVGGloop(p2,MVWLm2,MVWRm2),dp)
coup1 = cplcgWRpgWLpVZ
coup2 = cplcgWLpgWRpVZR 
   SumI = coup1*coup2*B0m2 
res = res +2._dp* SumI  
!------------------------ 
! bar[gWLm], gWRm 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(DerVGGloop(p2,MVWRm2,MVWLm2),dp)
coup1 = cplcgWLmgWRmVZ
coup2 = cplcgWRmgWLmVZR 
   SumI = coup1*coup2*B0m2 
res = res +2._dp* SumI  
!------------------------ 
! bar[gWRm], gWRm 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(DerVGGloop(p2,MVWRm2,MVWRm2),dp)
coup1 = cplcgWRmgWRmVZ
coup2 = cplcgWRmgWRmVZR 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWLmC], gWRmC 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(DerVGGloop(p2,MVWRm2,MVWLm2),dp)
coup1 = cplcgWLpgWRpVZ
coup2 = cplcgWRpgWLpVZR 
   SumI = coup1*coup2*B0m2 
res = res +2._dp* SumI  
!------------------------ 
! bar[gWRmC], gWRmC 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(DerVGGloop(p2,MVWRm2,MVWRm2),dp)
coup1 = cplcgWRpgWRpVZ
coup2 = cplcgWRpgWRpVZR 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! VP, hh 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 B0m2 = Real(DerVVSloop(p2,MVP2,Mhh2(i2)),dp) 
coup1 = cplhhVPVZ(i2)
coup2 = cplhhVPVZR(i2)
    SumI = coup1*coup2*B0m2 
res = res +0.5_dp* SumI  
    End Do 
 !------------------------ 
! VZ, hh 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 B0m2 = Real(DerVVSloop(p2,MVZ2,Mhh2(i2)),dp) 
coup1 = cplhhVZVZ(i2)
coup2 = cplhhVZVZR(i2)
    SumI = coup1*coup2*B0m2 
res = res +0.5_dp* SumI  
    End Do 
 !------------------------ 
! VZR, hh 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 B0m2 = Real(DerVVSloop(p2,MVZR2,Mhh2(i2)),dp) 
coup1 = cplhhVZVZR(i2)
coup2 = cplhhVZRVZR(i2)
    SumI = coup1*coup2*B0m2 
res = res +0.5_dp* SumI  
    End Do 
 !------------------------ 
! conj[Hpm], Hpm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
       Do i2 = 1, 4
 B22m2 = Real(DerVSSloop(p2,MHpm2(i2),MHpm2(i1)),dp) 
coup1 = cplHpmcHpmVZ(i2,i1)
coup2 = cplHpmcHpmVZR(i1,i2)
    SumI = coup1*coup2*B22m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! VWLm, Hpm 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 B0m2 = Real(DerVVSloop(p2,MVWLm2,MHpm2(i2)),dp) 
coup1 = cplHpmVWLmVZ(i2)
coup2 = cplcHpmcVWLmVZR(i2)
    SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! VWRm, Hpm 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 B0m2 = Real(DerVVSloop(p2,MVWRm2,MHpm2(i2)),dp) 
coup1 = cplHpmVWRmVZ(i2)
coup2 = cplcHpmcVWRmVZR(i2)
    SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! conj[VWLm], VWLm 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(DerVVVloop(p2,MVWLm2,MVWLm2),dp) 
coup1 = cplcVWLmVWLmVZ
coup2 = cplcVWLmVWLmVZR
    SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! conj[VWRm], VWLm 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(DerVVVloop(p2,MVWRm2,MVWLm2),dp) 
coup1 = cplcVWRmVWLmVZ
coup2 = cplcVWLmVWRmVZR
    SumI = coup1*coup2*B0m2 
res = res +2._dp* SumI  
!------------------------ 
! conj[VWLm], VWRm 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(DerVVVloop(p2,MVWLm2,MVWRm2),dp) 
coup1 = cplcVWLmVWRmVZ
coup2 = cplcVWRmVWLmVZR
    SumI = coup1*coup2*B0m2 
res = res +2._dp* SumI  
!------------------------ 
! conj[VWRm], VWRm 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(DerVVVloop(p2,MVWRm2,MVWRm2),dp) 
coup1 = cplcVWRmVWRmVZ
coup2 = cplcVWRmVWRmVZR
    SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! conj[VWLm], conj[Hpm] 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 B0m2 = Real(DerVVSloop(p2,MVWLm2,MHpm2(i2)),dp) 
coup1 = cplcHpmcVWLmVZ(i2)
coup2 = cplHpmVWLmVZR(i2)
    SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! conj[VWRm], conj[Hpm] 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 B0m2 = Real(DerVVSloop(p2,MVWRm2,MHpm2(i2)),dp) 
coup1 = cplcHpmcVWRmVZ(i2)
coup2 = cplHpmVWRmVZR(i2)
    SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! Ah 
!------------------------ 
    Do i1 = 1, 4
 SumI = 0._dp 
 A0m2 = SA_DerA0(MAh2(i1))
 coup1 = cplAhAhVZVZR(i1,i1)
 SumI = coup1*A0m2 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! hh 
!------------------------ 
    Do i1 = 1, 4
 SumI = 0._dp 
 A0m2 = SA_DerA0(Mhh2(i1))
 coup1 = cplhhhhVZVZR(i1,i1)
 SumI = coup1*A0m2 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! conj[Hpm] 
!------------------------ 
    Do i1 = 1, 4
 SumI = 0._dp 
 A0m2 = SA_DerA0(MHpm2(i1))
 coup1 = cplHpmcHpmVZVZR(i1,i1)
 SumI = coup1*A0m2 
res = res +1* SumI  
      End Do 
 !------------------------ 
! conj[VWLm] 
!------------------------ 
SumI = 0._dp 
A0m2 = 3._dp/4._dp*SA_DerA0(MVWLm2) +RXi/4._dp*SA_DerA0(MVWLm2*RXi) 
coup1 = cplcVWLmVWLmVZVZR1
coup2 = cplcVWLmVWLmVZVZR2
coup3 = cplcVWLmVWLmVZVZR3
SumI = ((2._dp*DerrMS*coup1+(1-RXi**2)/8._dp*(coup2+coup3))*MVWLm2-(4._dp*coup1+coup2+coup3)*A0m2)
res = res +1* SumI  
!------------------------ 
! conj[VWRm] 
!------------------------ 
SumI = 0._dp 
A0m2 = 3._dp/4._dp*SA_DerA0(MVWRm2) +RXi/4._dp*SA_DerA0(MVWRm2*RXi) 
coup1 = cplcVWRmVWRmVZVZR1
coup2 = cplcVWRmVWRmVZVZR2
coup3 = cplcVWRmVWRmVZVZR3
SumI = ((2._dp*DerrMS*coup1+(1-RXi**2)/8._dp*(coup2+coup3))*MVWRm2-(4._dp*coup1+coup2+coup3)*A0m2)
res = res +1* SumI  
res = oo16pi2*res 
 
End Subroutine DerPi1LoopVZVZR 
 
Subroutine Pi1LoopVZVP(p2,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,               & 
& Mhh,Mhh2,MHpm,MHpm2,MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,MVZR2,cplAhAhVPVZ,         & 
& cplAhhhVP,cplAhhhVZ,cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,cplcFeFeVPL,       & 
& cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZL,               & 
& cplcFuFuVZR,cplcgWLmgWLmVP,cplcgWLmgWLmVZ,cplcgWLmgWRmVP,cplcgWLmgWRmVZ,               & 
& cplcgWLpgWLpVP,cplcgWLpgWLpVZ,cplcgWLpgWRpVP,cplcgWLpgWRpVZ,cplcgWRmgWLmVP,            & 
& cplcgWRmgWLmVZ,cplcgWRmgWRmVP,cplcgWRmgWRmVZ,cplcgWRpgWLpVP,cplcgWRpgWLpVZ,            & 
& cplcgWRpgWRpVP,cplcgWRpgWRpVZ,cplcHpmcVWLmVP,cplcHpmcVWLmVZ,cplcHpmcVWRmVP,            & 
& cplcHpmcVWRmVZ,cplcVWLmVPVWLm,cplcVWLmVPVWLmVZ1,cplcVWLmVPVWLmVZ2,cplcVWLmVPVWLmVZ3,   & 
& cplcVWLmVPVWRm,cplcVWLmVWLmVZ,cplcVWLmVWRmVZ,cplcVWRmVPVWLm,cplcVWRmVPVWRm,            & 
& cplcVWRmVPVWRmVZ1,cplcVWRmVPVWRmVZ2,cplcVWRmVPVWRmVZ3,cplcVWRmVWLmVZ,cplcVWRmVWRmVZ,   & 
& cplFvFvVPL,cplFvFvVPR,cplFvFvVZL,cplFvFvVZR,cplhhhhVPVZ,cplhhVPVZ,cplhhVPVZR,          & 
& cplhhVZVZ,cplhhVZVZR,cplHpmcHpmVP,cplHpmcHpmVPVZ,cplHpmcHpmVZ,cplHpmVPVWLm,            & 
& cplHpmVPVWRm,cplHpmVWLmVZ,cplHpmVWRmVZ,kont,res)

Implicit None 
Real(dp), Intent(in) :: MAh(4),MAh2(4),MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),MFv(9),MFv2(9),           & 
& Mhh(4),Mhh2(4),MHpm(4),MHpm2(4),MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,MVZR2

Complex(dp), Intent(in) :: cplAhAhVPVZ(4,4),cplAhhhVP(4,4),cplAhhhVZ(4,4),cplcFdFdVPL(3,3),cplcFdFdVPR(3,3),     & 
& cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),cplcFeFeVPL(3,3),cplcFeFeVPR(3,3),cplcFeFeVZL(3,3),  & 
& cplcFeFeVZR(3,3),cplcFuFuVPL(3,3),cplcFuFuVPR(3,3),cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),  & 
& cplcgWLmgWLmVP,cplcgWLmgWLmVZ,cplcgWLmgWRmVP,cplcgWLmgWRmVZ,cplcgWLpgWLpVP,            & 
& cplcgWLpgWLpVZ,cplcgWLpgWRpVP,cplcgWLpgWRpVZ,cplcgWRmgWLmVP,cplcgWRmgWLmVZ,            & 
& cplcgWRmgWRmVP,cplcgWRmgWRmVZ,cplcgWRpgWLpVP,cplcgWRpgWLpVZ,cplcgWRpgWRpVP,            & 
& cplcgWRpgWRpVZ,cplcHpmcVWLmVP(4),cplcHpmcVWLmVZ(4),cplcHpmcVWRmVP(4),cplcHpmcVWRmVZ(4),& 
& cplcVWLmVPVWLm,cplcVWLmVPVWLmVZ1,cplcVWLmVPVWLmVZ2,cplcVWLmVPVWLmVZ3,cplcVWLmVPVWRm,   & 
& cplcVWLmVWLmVZ,cplcVWLmVWRmVZ,cplcVWRmVPVWLm,cplcVWRmVPVWRm,cplcVWRmVPVWRmVZ1,         & 
& cplcVWRmVPVWRmVZ2,cplcVWRmVPVWRmVZ3,cplcVWRmVWLmVZ,cplcVWRmVWRmVZ,cplFvFvVPL(9,9),     & 
& cplFvFvVPR(9,9),cplFvFvVZL(9,9),cplFvFvVZR(9,9),cplhhhhVPVZ(4,4),cplhhVPVZ(4),         & 
& cplhhVPVZR(4),cplhhVZVZ(4),cplhhVZVZR(4),cplHpmcHpmVP(4,4),cplHpmcHpmVPVZ(4,4),        & 
& cplHpmcHpmVZ(4,4),cplHpmVPVWLm(4),cplHpmVPVWRm(4),cplHpmVWLmVZ(4),cplHpmVWRmVZ(4)

Integer, Intent(inout) :: kont 
Real(dp) :: B0m2, F0m2, G0m2, B1m2, H0m2, B22m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Complex(dp), Intent(inout) :: res 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2, coup3, temp, sumI 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
res = 0._dp 
 
!------------------------ 
! hh, Ah 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
       Do i2 = 1, 4
 B22m2 = Real(VSSloop(p2,MAh2(i2),Mhh2(i1)),dp) 
coup1 = cplAhhhVZ(i2,i1)
coup2 = cplAhhhVP(i2,i1)
    SumI = coup1*coup2*B22m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fd], Fd 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 H0m2 = Real(SA_Hloop(p2,MFd2(i1),MFd2(i2)),dp) 
B0m2 = 4._dp*MFd(i1)*MFd(i2)*Real(SA_B0(p2,MFd2(i1),MFd2(i2)),dp) 
coupL1 = cplcFdFdVZL(i1,i2)
coupR1 = cplcFdFdVZR(i1,i2)
coupL2 = cplcFdFdVPL(i2,i1)
coupR2 = cplcFdFdVPR(i2,i1)
    SumI = (coupL1*coupL2+coupR1*coupR2)*H0m2 & 
                & + 0.5_dp*(coupL1*coupR2 + coupL2*coupR1)*B0m2 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fe], Fe 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 H0m2 = Real(SA_Hloop(p2,MFe2(i1),MFe2(i2)),dp) 
B0m2 = 4._dp*MFe(i1)*MFe(i2)*Real(SA_B0(p2,MFe2(i1),MFe2(i2)),dp) 
coupL1 = cplcFeFeVZL(i1,i2)
coupR1 = cplcFeFeVZR(i1,i2)
coupL2 = cplcFeFeVPL(i2,i1)
coupR2 = cplcFeFeVPR(i2,i1)
    SumI = (coupL1*coupL2+coupR1*coupR2)*H0m2 & 
                & + 0.5_dp*(coupL1*coupR2 + coupL2*coupR1)*B0m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fu], Fu 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 H0m2 = Real(SA_Hloop(p2,MFu2(i1),MFu2(i2)),dp) 
B0m2 = 4._dp*MFu(i1)*MFu(i2)*Real(SA_B0(p2,MFu2(i1),MFu2(i2)),dp) 
coupL1 = cplcFuFuVZL(i1,i2)
coupR1 = cplcFuFuVZR(i1,i2)
coupL2 = cplcFuFuVPL(i2,i1)
coupR2 = cplcFuFuVPR(i2,i1)
    SumI = (coupL1*coupL2+coupR1*coupR2)*H0m2 & 
                & + 0.5_dp*(coupL1*coupR2 + coupL2*coupR1)*B0m2 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! Fv, Fv 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 9
       Do i2 = 1, 9
 H0m2 = Real(SA_Hloop(p2,MFv2(i1),MFv2(i2)),dp) 
B0m2 = 4._dp*MFv(i1)*MFv(i2)*Real(SA_B0(p2,MFv2(i1),MFv2(i2)),dp) 
coupL1 = cplFvFvVZL(i1,i2)
coupR1 = cplFvFvVZR(i1,i2)
coupL2 = cplFvFvVPL(i1,i2)
coupR2 = cplFvFvVPR(i1,i2)
    SumI = (coupL1*coupL2+coupR1*coupR2)*H0m2 & 
                & + 0.5_dp*(coupL1*coupR2 + coupL2*coupR1)*B0m2 
res = res +0.5_dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[gWLm], gWLm 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(VGGloop(p2,MVWLm2,MVWLm2),dp)
coup1 = cplcgWLmgWLmVZ
coup2 = cplcgWLmgWLmVP 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWRm], gWLm 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(VGGloop(p2,MVWLm2,MVWRm2),dp)
coup1 = cplcgWRmgWLmVZ
coup2 = cplcgWLmgWRmVP 
   SumI = coup1*coup2*B0m2 
res = res +2._dp* SumI  
!------------------------ 
! bar[gWLmC], gWLmC 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(VGGloop(p2,MVWLm2,MVWLm2),dp)
coup1 = cplcgWLpgWLpVZ
coup2 = cplcgWLpgWLpVP 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWRmC], gWLmC 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(VGGloop(p2,MVWLm2,MVWRm2),dp)
coup1 = cplcgWRpgWLpVZ
coup2 = cplcgWLpgWRpVP 
   SumI = coup1*coup2*B0m2 
res = res +2._dp* SumI  
!------------------------ 
! bar[gWLm], gWRm 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(VGGloop(p2,MVWRm2,MVWLm2),dp)
coup1 = cplcgWLmgWRmVZ
coup2 = cplcgWRmgWLmVP 
   SumI = coup1*coup2*B0m2 
res = res +2._dp* SumI  
!------------------------ 
! bar[gWRm], gWRm 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(VGGloop(p2,MVWRm2,MVWRm2),dp)
coup1 = cplcgWRmgWRmVZ
coup2 = cplcgWRmgWRmVP 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWLmC], gWRmC 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(VGGloop(p2,MVWRm2,MVWLm2),dp)
coup1 = cplcgWLpgWRpVZ
coup2 = cplcgWRpgWLpVP 
   SumI = coup1*coup2*B0m2 
res = res +2._dp* SumI  
!------------------------ 
! bar[gWRmC], gWRmC 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(VGGloop(p2,MVWRm2,MVWRm2),dp)
coup1 = cplcgWRpgWRpVZ
coup2 = cplcgWRpgWRpVP 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! VZ, hh 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 B0m2 = Real(VVSloop(p2,MVZ2,Mhh2(i2)),dp) 
coup1 = cplhhVZVZ(i2)
coup2 = cplhhVPVZ(i2)
    SumI = coup1*coup2*B0m2 
res = res +0.5_dp* SumI  
    End Do 
 !------------------------ 
! VZR, hh 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 B0m2 = Real(VVSloop(p2,MVZR2,Mhh2(i2)),dp) 
coup1 = cplhhVZVZR(i2)
coup2 = cplhhVPVZR(i2)
    SumI = coup1*coup2*B0m2 
res = res +0.5_dp* SumI  
    End Do 
 !------------------------ 
! conj[Hpm], Hpm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
       Do i2 = 1, 4
 B22m2 = Real(VSSloop(p2,MHpm2(i2),MHpm2(i1)),dp) 
coup1 = cplHpmcHpmVZ(i2,i1)
coup2 = cplHpmcHpmVP(i1,i2)
    SumI = coup1*coup2*B22m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! VWLm, Hpm 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 B0m2 = Real(VVSloop(p2,MVWLm2,MHpm2(i2)),dp) 
coup1 = cplHpmVWLmVZ(i2)
coup2 = cplcHpmcVWLmVP(i2)
    SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! VWRm, Hpm 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 B0m2 = Real(VVSloop(p2,MVWRm2,MHpm2(i2)),dp) 
coup1 = cplHpmVWRmVZ(i2)
coup2 = cplcHpmcVWRmVP(i2)
    SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! conj[VWLm], VWLm 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(VVVloop(p2,MVWLm2,MVWLm2),dp) 
coup1 = cplcVWLmVWLmVZ
coup2 = cplcVWLmVPVWLm
    SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! conj[VWRm], VWLm 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(VVVloop(p2,MVWRm2,MVWLm2),dp) 
coup1 = cplcVWRmVWLmVZ
coup2 = cplcVWLmVPVWRm
    SumI = coup1*coup2*B0m2 
res = res +2._dp* SumI  
!------------------------ 
! conj[VWLm], VWRm 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(VVVloop(p2,MVWLm2,MVWRm2),dp) 
coup1 = cplcVWLmVWRmVZ
coup2 = cplcVWRmVPVWLm
    SumI = coup1*coup2*B0m2 
res = res +2._dp* SumI  
!------------------------ 
! conj[VWRm], VWRm 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(VVVloop(p2,MVWRm2,MVWRm2),dp) 
coup1 = cplcVWRmVWRmVZ
coup2 = cplcVWRmVPVWRm
    SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! conj[VWLm], conj[Hpm] 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 B0m2 = Real(VVSloop(p2,MVWLm2,MHpm2(i2)),dp) 
coup1 = cplcHpmcVWLmVZ(i2)
coup2 = cplHpmVPVWLm(i2)
    SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! conj[VWRm], conj[Hpm] 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 B0m2 = Real(VVSloop(p2,MVWRm2,MHpm2(i2)),dp) 
coup1 = cplcHpmcVWRmVZ(i2)
coup2 = cplHpmVPVWRm(i2)
    SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! Ah 
!------------------------ 
    Do i1 = 1, 4
 SumI = 0._dp 
 A0m2 = SA_A0(MAh2(i1))
 coup1 = cplAhAhVPVZ(i1,i1)
 SumI = coup1*A0m2 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! hh 
!------------------------ 
    Do i1 = 1, 4
 SumI = 0._dp 
 A0m2 = SA_A0(Mhh2(i1))
 coup1 = cplhhhhVPVZ(i1,i1)
 SumI = coup1*A0m2 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! conj[Hpm] 
!------------------------ 
    Do i1 = 1, 4
 SumI = 0._dp 
 A0m2 = SA_A0(MHpm2(i1))
 coup1 = cplHpmcHpmVPVZ(i1,i1)
 SumI = coup1*A0m2 
res = res +1* SumI  
      End Do 
 !------------------------ 
! conj[VWLm] 
!------------------------ 
SumI = 0._dp 
A0m2 = 3._dp/4._dp*SA_A0(MVWLm2) +RXi/4._dp*SA_A0(MVWLm2*RXi) 
coup1 = cplcVWLmVPVWLmVZ2
coup2 = cplcVWLmVPVWLmVZ3
coup3 = cplcVWLmVPVWLmVZ1
SumI = ((2._dp*rMS*coup1+(1-RXi**2)/8._dp*(coup2+coup3))*MVWLm2-(4._dp*coup1+coup2+coup3)*A0m2)
res = res +1* SumI  
!------------------------ 
! conj[VWRm] 
!------------------------ 
SumI = 0._dp 
A0m2 = 3._dp/4._dp*SA_A0(MVWRm2) +RXi/4._dp*SA_A0(MVWRm2*RXi) 
coup1 = cplcVWRmVPVWRmVZ2
coup2 = cplcVWRmVPVWRmVZ3
coup3 = cplcVWRmVPVWRmVZ1
SumI = ((2._dp*rMS*coup1+(1-RXi**2)/8._dp*(coup2+coup3))*MVWRm2-(4._dp*coup1+coup2+coup3)*A0m2)
res = res +1* SumI  
res = oo16pi2*res 
 
End Subroutine Pi1LoopVZVP 
 
Subroutine DerPi1LoopVZVP(p2,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,            & 
& Mhh,Mhh2,MHpm,MHpm2,MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,MVZR2,cplAhAhVPVZ,         & 
& cplAhhhVP,cplAhhhVZ,cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,cplcFeFeVPL,       & 
& cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZL,               & 
& cplcFuFuVZR,cplcgWLmgWLmVP,cplcgWLmgWLmVZ,cplcgWLmgWRmVP,cplcgWLmgWRmVZ,               & 
& cplcgWLpgWLpVP,cplcgWLpgWLpVZ,cplcgWLpgWRpVP,cplcgWLpgWRpVZ,cplcgWRmgWLmVP,            & 
& cplcgWRmgWLmVZ,cplcgWRmgWRmVP,cplcgWRmgWRmVZ,cplcgWRpgWLpVP,cplcgWRpgWLpVZ,            & 
& cplcgWRpgWRpVP,cplcgWRpgWRpVZ,cplcHpmcVWLmVP,cplcHpmcVWLmVZ,cplcHpmcVWRmVP,            & 
& cplcHpmcVWRmVZ,cplcVWLmVPVWLm,cplcVWLmVPVWLmVZ1,cplcVWLmVPVWLmVZ2,cplcVWLmVPVWLmVZ3,   & 
& cplcVWLmVPVWRm,cplcVWLmVWLmVZ,cplcVWLmVWRmVZ,cplcVWRmVPVWLm,cplcVWRmVPVWRm,            & 
& cplcVWRmVPVWRmVZ1,cplcVWRmVPVWRmVZ2,cplcVWRmVPVWRmVZ3,cplcVWRmVWLmVZ,cplcVWRmVWRmVZ,   & 
& cplFvFvVPL,cplFvFvVPR,cplFvFvVZL,cplFvFvVZR,cplhhhhVPVZ,cplhhVPVZ,cplhhVPVZR,          & 
& cplhhVZVZ,cplhhVZVZR,cplHpmcHpmVP,cplHpmcHpmVPVZ,cplHpmcHpmVZ,cplHpmVPVWLm,            & 
& cplHpmVPVWRm,cplHpmVWLmVZ,cplHpmVWRmVZ,kont,res)

Implicit None 
Real(dp), Intent(in) :: MAh(4),MAh2(4),MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),MFv(9),MFv2(9),           & 
& Mhh(4),Mhh2(4),MHpm(4),MHpm2(4),MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,MVZR2

Complex(dp), Intent(in) :: cplAhAhVPVZ(4,4),cplAhhhVP(4,4),cplAhhhVZ(4,4),cplcFdFdVPL(3,3),cplcFdFdVPR(3,3),     & 
& cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),cplcFeFeVPL(3,3),cplcFeFeVPR(3,3),cplcFeFeVZL(3,3),  & 
& cplcFeFeVZR(3,3),cplcFuFuVPL(3,3),cplcFuFuVPR(3,3),cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),  & 
& cplcgWLmgWLmVP,cplcgWLmgWLmVZ,cplcgWLmgWRmVP,cplcgWLmgWRmVZ,cplcgWLpgWLpVP,            & 
& cplcgWLpgWLpVZ,cplcgWLpgWRpVP,cplcgWLpgWRpVZ,cplcgWRmgWLmVP,cplcgWRmgWLmVZ,            & 
& cplcgWRmgWRmVP,cplcgWRmgWRmVZ,cplcgWRpgWLpVP,cplcgWRpgWLpVZ,cplcgWRpgWRpVP,            & 
& cplcgWRpgWRpVZ,cplcHpmcVWLmVP(4),cplcHpmcVWLmVZ(4),cplcHpmcVWRmVP(4),cplcHpmcVWRmVZ(4),& 
& cplcVWLmVPVWLm,cplcVWLmVPVWLmVZ1,cplcVWLmVPVWLmVZ2,cplcVWLmVPVWLmVZ3,cplcVWLmVPVWRm,   & 
& cplcVWLmVWLmVZ,cplcVWLmVWRmVZ,cplcVWRmVPVWLm,cplcVWRmVPVWRm,cplcVWRmVPVWRmVZ1,         & 
& cplcVWRmVPVWRmVZ2,cplcVWRmVPVWRmVZ3,cplcVWRmVWLmVZ,cplcVWRmVWRmVZ,cplFvFvVPL(9,9),     & 
& cplFvFvVPR(9,9),cplFvFvVZL(9,9),cplFvFvVZR(9,9),cplhhhhVPVZ(4,4),cplhhVPVZ(4),         & 
& cplhhVPVZR(4),cplhhVZVZ(4),cplhhVZVZR(4),cplHpmcHpmVP(4,4),cplHpmcHpmVPVZ(4,4),        & 
& cplHpmcHpmVZ(4,4),cplHpmVPVWLm(4),cplHpmVPVWRm(4),cplHpmVWLmVZ(4),cplHpmVWRmVZ(4)

Integer, Intent(inout) :: kont 
Real(dp) :: B0m2, F0m2, G0m2, B1m2, H0m2, B22m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Complex(dp), Intent(inout) :: res 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2, coup3, temp, sumI 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
Real(dp) ::MVG,MVP,MVG2,MVP2
MVG = Mass_Regulator_PhotonGluon 
MVP = Mass_Regulator_PhotonGluon 
MVG2 = Mass_Regulator_PhotonGluon**2 
MVP2 = Mass_Regulator_PhotonGluon**2 

res = 0._dp 
 
!------------------------ 
! hh, Ah 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
       Do i2 = 1, 4
 B22m2 = Real(DerVSSloop(p2,MAh2(i2),Mhh2(i1)),dp) 
coup1 = cplAhhhVZ(i2,i1)
coup2 = cplAhhhVP(i2,i1)
    SumI = coup1*coup2*B22m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fd], Fd 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 H0m2 = Real(SA_DerHloop(p2,MFd2(i1),MFd2(i2)),dp) 
B0m2 = 2._dp*MFd(i1)*MFd(i2)*Real(SA_DerB0(p2,MFd2(i1),MFd2(i2)),dp) 
coupL1 = cplcFdFdVZL(i1,i2)
coupR1 = cplcFdFdVZR(i1,i2)
coupL2 = cplcFdFdVPL(i2,i1)
coupR2 = cplcFdFdVPR(i2,i1)
    SumI = (coupL1*coupL2+coupR1*coupR2)*H0m2 & 
                & + 0.5_dp*(coupL1*coupR2 + coupL2*coupR1)*B0m2 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fe], Fe 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 H0m2 = Real(SA_DerHloop(p2,MFe2(i1),MFe2(i2)),dp) 
B0m2 = 2._dp*MFe(i1)*MFe(i2)*Real(SA_DerB0(p2,MFe2(i1),MFe2(i2)),dp) 
coupL1 = cplcFeFeVZL(i1,i2)
coupR1 = cplcFeFeVZR(i1,i2)
coupL2 = cplcFeFeVPL(i2,i1)
coupR2 = cplcFeFeVPR(i2,i1)
    SumI = (coupL1*coupL2+coupR1*coupR2)*H0m2 & 
                & + 0.5_dp*(coupL1*coupR2 + coupL2*coupR1)*B0m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fu], Fu 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 H0m2 = Real(SA_DerHloop(p2,MFu2(i1),MFu2(i2)),dp) 
B0m2 = 2._dp*MFu(i1)*MFu(i2)*Real(SA_DerB0(p2,MFu2(i1),MFu2(i2)),dp) 
coupL1 = cplcFuFuVZL(i1,i2)
coupR1 = cplcFuFuVZR(i1,i2)
coupL2 = cplcFuFuVPL(i2,i1)
coupR2 = cplcFuFuVPR(i2,i1)
    SumI = (coupL1*coupL2+coupR1*coupR2)*H0m2 & 
                & + 0.5_dp*(coupL1*coupR2 + coupL2*coupR1)*B0m2 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! Fv, Fv 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 9
       Do i2 = 1, 9
 H0m2 = Real(SA_DerHloop(p2,MFv2(i1),MFv2(i2)),dp) 
B0m2 = 2._dp*MFv(i1)*MFv(i2)*Real(SA_DerB0(p2,MFv2(i1),MFv2(i2)),dp) 
coupL1 = cplFvFvVZL(i1,i2)
coupR1 = cplFvFvVZR(i1,i2)
coupL2 = cplFvFvVPL(i1,i2)
coupR2 = cplFvFvVPR(i1,i2)
    SumI = (coupL1*coupL2+coupR1*coupR2)*H0m2 & 
                & + 0.5_dp*(coupL1*coupR2 + coupL2*coupR1)*B0m2 
res = res +0.5_dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[gWLm], gWLm 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(DerVGGloop(p2,MVWLm2,MVWLm2),dp)
coup1 = cplcgWLmgWLmVZ
coup2 = cplcgWLmgWLmVP 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWRm], gWLm 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(DerVGGloop(p2,MVWLm2,MVWRm2),dp)
coup1 = cplcgWRmgWLmVZ
coup2 = cplcgWLmgWRmVP 
   SumI = coup1*coup2*B0m2 
res = res +2._dp* SumI  
!------------------------ 
! bar[gWLmC], gWLmC 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(DerVGGloop(p2,MVWLm2,MVWLm2),dp)
coup1 = cplcgWLpgWLpVZ
coup2 = cplcgWLpgWLpVP 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWRmC], gWLmC 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(DerVGGloop(p2,MVWLm2,MVWRm2),dp)
coup1 = cplcgWRpgWLpVZ
coup2 = cplcgWLpgWRpVP 
   SumI = coup1*coup2*B0m2 
res = res +2._dp* SumI  
!------------------------ 
! bar[gWLm], gWRm 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(DerVGGloop(p2,MVWRm2,MVWLm2),dp)
coup1 = cplcgWLmgWRmVZ
coup2 = cplcgWRmgWLmVP 
   SumI = coup1*coup2*B0m2 
res = res +2._dp* SumI  
!------------------------ 
! bar[gWRm], gWRm 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(DerVGGloop(p2,MVWRm2,MVWRm2),dp)
coup1 = cplcgWRmgWRmVZ
coup2 = cplcgWRmgWRmVP 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWLmC], gWRmC 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(DerVGGloop(p2,MVWRm2,MVWLm2),dp)
coup1 = cplcgWLpgWRpVZ
coup2 = cplcgWRpgWLpVP 
   SumI = coup1*coup2*B0m2 
res = res +2._dp* SumI  
!------------------------ 
! bar[gWRmC], gWRmC 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(DerVGGloop(p2,MVWRm2,MVWRm2),dp)
coup1 = cplcgWRpgWRpVZ
coup2 = cplcgWRpgWRpVP 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! VZ, hh 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 B0m2 = Real(DerVVSloop(p2,MVZ2,Mhh2(i2)),dp) 
coup1 = cplhhVZVZ(i2)
coup2 = cplhhVPVZ(i2)
    SumI = coup1*coup2*B0m2 
res = res +0.5_dp* SumI  
    End Do 
 !------------------------ 
! VZR, hh 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 B0m2 = Real(DerVVSloop(p2,MVZR2,Mhh2(i2)),dp) 
coup1 = cplhhVZVZR(i2)
coup2 = cplhhVPVZR(i2)
    SumI = coup1*coup2*B0m2 
res = res +0.5_dp* SumI  
    End Do 
 !------------------------ 
! conj[Hpm], Hpm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
       Do i2 = 1, 4
 B22m2 = Real(DerVSSloop(p2,MHpm2(i2),MHpm2(i1)),dp) 
coup1 = cplHpmcHpmVZ(i2,i1)
coup2 = cplHpmcHpmVP(i1,i2)
    SumI = coup1*coup2*B22m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! VWLm, Hpm 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 B0m2 = Real(DerVVSloop(p2,MVWLm2,MHpm2(i2)),dp) 
coup1 = cplHpmVWLmVZ(i2)
coup2 = cplcHpmcVWLmVP(i2)
    SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! VWRm, Hpm 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 B0m2 = Real(DerVVSloop(p2,MVWRm2,MHpm2(i2)),dp) 
coup1 = cplHpmVWRmVZ(i2)
coup2 = cplcHpmcVWRmVP(i2)
    SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! conj[VWLm], VWLm 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(DerVVVloop(p2,MVWLm2,MVWLm2),dp) 
coup1 = cplcVWLmVWLmVZ
coup2 = cplcVWLmVPVWLm
    SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! conj[VWRm], VWLm 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(DerVVVloop(p2,MVWRm2,MVWLm2),dp) 
coup1 = cplcVWRmVWLmVZ
coup2 = cplcVWLmVPVWRm
    SumI = coup1*coup2*B0m2 
res = res +2._dp* SumI  
!------------------------ 
! conj[VWLm], VWRm 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(DerVVVloop(p2,MVWLm2,MVWRm2),dp) 
coup1 = cplcVWLmVWRmVZ
coup2 = cplcVWRmVPVWLm
    SumI = coup1*coup2*B0m2 
res = res +2._dp* SumI  
!------------------------ 
! conj[VWRm], VWRm 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(DerVVVloop(p2,MVWRm2,MVWRm2),dp) 
coup1 = cplcVWRmVWRmVZ
coup2 = cplcVWRmVPVWRm
    SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! conj[VWLm], conj[Hpm] 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 B0m2 = Real(DerVVSloop(p2,MVWLm2,MHpm2(i2)),dp) 
coup1 = cplcHpmcVWLmVZ(i2)
coup2 = cplHpmVPVWLm(i2)
    SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! conj[VWRm], conj[Hpm] 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 B0m2 = Real(DerVVSloop(p2,MVWRm2,MHpm2(i2)),dp) 
coup1 = cplcHpmcVWRmVZ(i2)
coup2 = cplHpmVPVWRm(i2)
    SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! Ah 
!------------------------ 
    Do i1 = 1, 4
 SumI = 0._dp 
 A0m2 = SA_DerA0(MAh2(i1))
 coup1 = cplAhAhVPVZ(i1,i1)
 SumI = coup1*A0m2 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! hh 
!------------------------ 
    Do i1 = 1, 4
 SumI = 0._dp 
 A0m2 = SA_DerA0(Mhh2(i1))
 coup1 = cplhhhhVPVZ(i1,i1)
 SumI = coup1*A0m2 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! conj[Hpm] 
!------------------------ 
    Do i1 = 1, 4
 SumI = 0._dp 
 A0m2 = SA_DerA0(MHpm2(i1))
 coup1 = cplHpmcHpmVPVZ(i1,i1)
 SumI = coup1*A0m2 
res = res +1* SumI  
      End Do 
 !------------------------ 
! conj[VWLm] 
!------------------------ 
SumI = 0._dp 
A0m2 = 3._dp/4._dp*SA_DerA0(MVWLm2) +RXi/4._dp*SA_DerA0(MVWLm2*RXi) 
coup1 = cplcVWLmVPVWLmVZ2
coup2 = cplcVWLmVPVWLmVZ3
coup3 = cplcVWLmVPVWLmVZ1
SumI = ((2._dp*DerrMS*coup1+(1-RXi**2)/8._dp*(coup2+coup3))*MVWLm2-(4._dp*coup1+coup2+coup3)*A0m2)
res = res +1* SumI  
!------------------------ 
! conj[VWRm] 
!------------------------ 
SumI = 0._dp 
A0m2 = 3._dp/4._dp*SA_DerA0(MVWRm2) +RXi/4._dp*SA_DerA0(MVWRm2*RXi) 
coup1 = cplcVWRmVPVWRmVZ2
coup2 = cplcVWRmVPVWRmVZ3
coup3 = cplcVWRmVPVWRmVZ1
SumI = ((2._dp*DerrMS*coup1+(1-RXi**2)/8._dp*(coup2+coup3))*MVWRm2-(4._dp*coup1+coup2+coup3)*A0m2)
res = res +1* SumI  
res = oo16pi2*res 
 
End Subroutine DerPi1LoopVZVP 
 
Subroutine Pi1LoopVZRVP(p2,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,              & 
& Mhh,Mhh2,MHpm,MHpm2,MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,MVZR2,cplAhAhVPVZR,        & 
& cplAhhhVP,cplAhhhVZR,cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZRL,cplcFdFdVZRR,cplcFeFeVPL,    & 
& cplcFeFeVPR,cplcFeFeVZRL,cplcFeFeVZRR,cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZRL,            & 
& cplcFuFuVZRR,cplcgWLmgWLmVP,cplcgWLmgWLmVZR,cplcgWLmgWRmVP,cplcgWLmgWRmVZR,            & 
& cplcgWLpgWLpVP,cplcgWLpgWLpVZR,cplcgWLpgWRpVP,cplcgWLpgWRpVZR,cplcgWRmgWLmVP,          & 
& cplcgWRmgWLmVZR,cplcgWRmgWRmVP,cplcgWRmgWRmVZR,cplcgWRpgWLpVP,cplcgWRpgWLpVZR,         & 
& cplcgWRpgWRpVP,cplcgWRpgWRpVZR,cplcHpmcVWLmVP,cplcHpmcVWLmVZR,cplcHpmcVWRmVP,          & 
& cplcHpmcVWRmVZR,cplcVWLmVPVWLm,cplcVWLmVPVWLmVZR1,cplcVWLmVPVWLmVZR2,cplcVWLmVPVWLmVZR3,& 
& cplcVWLmVPVWRm,cplcVWLmVWLmVZR,cplcVWLmVWRmVZR,cplcVWRmVPVWLm,cplcVWRmVPVWRm,          & 
& cplcVWRmVPVWRmVZR1,cplcVWRmVPVWRmVZR2,cplcVWRmVPVWRmVZR3,cplcVWRmVWLmVZR,              & 
& cplcVWRmVWRmVZR,cplFvFvVPL,cplFvFvVPR,cplFvFvVZRL,cplFvFvVZRR,cplhhhhVPVZR,            & 
& cplhhVPVZ,cplhhVPVZR,cplhhVZRVZR,cplhhVZVZR,cplHpmcHpmVP,cplHpmcHpmVPVZR,              & 
& cplHpmcHpmVZR,cplHpmVPVWLm,cplHpmVPVWRm,cplHpmVWLmVZR,cplHpmVWRmVZR,kont,res)

Implicit None 
Real(dp), Intent(in) :: MAh(4),MAh2(4),MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),MFv(9),MFv2(9),           & 
& Mhh(4),Mhh2(4),MHpm(4),MHpm2(4),MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,MVZR2

Complex(dp), Intent(in) :: cplAhAhVPVZR(4,4),cplAhhhVP(4,4),cplAhhhVZR(4,4),cplcFdFdVPL(3,3),cplcFdFdVPR(3,3),   & 
& cplcFdFdVZRL(3,3),cplcFdFdVZRR(3,3),cplcFeFeVPL(3,3),cplcFeFeVPR(3,3),cplcFeFeVZRL(3,3),& 
& cplcFeFeVZRR(3,3),cplcFuFuVPL(3,3),cplcFuFuVPR(3,3),cplcFuFuVZRL(3,3),cplcFuFuVZRR(3,3),& 
& cplcgWLmgWLmVP,cplcgWLmgWLmVZR,cplcgWLmgWRmVP,cplcgWLmgWRmVZR,cplcgWLpgWLpVP,          & 
& cplcgWLpgWLpVZR,cplcgWLpgWRpVP,cplcgWLpgWRpVZR,cplcgWRmgWLmVP,cplcgWRmgWLmVZR,         & 
& cplcgWRmgWRmVP,cplcgWRmgWRmVZR,cplcgWRpgWLpVP,cplcgWRpgWLpVZR,cplcgWRpgWRpVP,          & 
& cplcgWRpgWRpVZR,cplcHpmcVWLmVP(4),cplcHpmcVWLmVZR(4),cplcHpmcVWRmVP(4),cplcHpmcVWRmVZR(4),& 
& cplcVWLmVPVWLm,cplcVWLmVPVWLmVZR1,cplcVWLmVPVWLmVZR2,cplcVWLmVPVWLmVZR3,               & 
& cplcVWLmVPVWRm,cplcVWLmVWLmVZR,cplcVWLmVWRmVZR,cplcVWRmVPVWLm,cplcVWRmVPVWRm,          & 
& cplcVWRmVPVWRmVZR1,cplcVWRmVPVWRmVZR2,cplcVWRmVPVWRmVZR3,cplcVWRmVWLmVZR,              & 
& cplcVWRmVWRmVZR,cplFvFvVPL(9,9),cplFvFvVPR(9,9),cplFvFvVZRL(9,9),cplFvFvVZRR(9,9),     & 
& cplhhhhVPVZR(4,4),cplhhVPVZ(4),cplhhVPVZR(4),cplhhVZRVZR(4),cplhhVZVZR(4),             & 
& cplHpmcHpmVP(4,4),cplHpmcHpmVPVZR(4,4),cplHpmcHpmVZR(4,4),cplHpmVPVWLm(4),             & 
& cplHpmVPVWRm(4),cplHpmVWLmVZR(4),cplHpmVWRmVZR(4)

Integer, Intent(inout) :: kont 
Real(dp) :: B0m2, F0m2, G0m2, B1m2, H0m2, B22m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Complex(dp), Intent(inout) :: res 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2, coup3, temp, sumI 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
res = 0._dp 
 
!------------------------ 
! hh, Ah 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
       Do i2 = 1, 4
 B22m2 = Real(VSSloop(p2,MAh2(i2),Mhh2(i1)),dp) 
coup1 = cplAhhhVZR(i2,i1)
coup2 = cplAhhhVP(i2,i1)
    SumI = coup1*coup2*B22m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fd], Fd 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 H0m2 = Real(SA_Hloop(p2,MFd2(i1),MFd2(i2)),dp) 
B0m2 = 4._dp*MFd(i1)*MFd(i2)*Real(SA_B0(p2,MFd2(i1),MFd2(i2)),dp) 
coupL1 = cplcFdFdVZRL(i1,i2)
coupR1 = cplcFdFdVZRR(i1,i2)
coupL2 = cplcFdFdVPL(i2,i1)
coupR2 = cplcFdFdVPR(i2,i1)
    SumI = (coupL1*coupL2+coupR1*coupR2)*H0m2 & 
                & + 0.5_dp*(coupL1*coupR2 + coupL2*coupR1)*B0m2 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fe], Fe 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 H0m2 = Real(SA_Hloop(p2,MFe2(i1),MFe2(i2)),dp) 
B0m2 = 4._dp*MFe(i1)*MFe(i2)*Real(SA_B0(p2,MFe2(i1),MFe2(i2)),dp) 
coupL1 = cplcFeFeVZRL(i1,i2)
coupR1 = cplcFeFeVZRR(i1,i2)
coupL2 = cplcFeFeVPL(i2,i1)
coupR2 = cplcFeFeVPR(i2,i1)
    SumI = (coupL1*coupL2+coupR1*coupR2)*H0m2 & 
                & + 0.5_dp*(coupL1*coupR2 + coupL2*coupR1)*B0m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fu], Fu 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 H0m2 = Real(SA_Hloop(p2,MFu2(i1),MFu2(i2)),dp) 
B0m2 = 4._dp*MFu(i1)*MFu(i2)*Real(SA_B0(p2,MFu2(i1),MFu2(i2)),dp) 
coupL1 = cplcFuFuVZRL(i1,i2)
coupR1 = cplcFuFuVZRR(i1,i2)
coupL2 = cplcFuFuVPL(i2,i1)
coupR2 = cplcFuFuVPR(i2,i1)
    SumI = (coupL1*coupL2+coupR1*coupR2)*H0m2 & 
                & + 0.5_dp*(coupL1*coupR2 + coupL2*coupR1)*B0m2 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! Fv, Fv 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 9
       Do i2 = 1, 9
 H0m2 = Real(SA_Hloop(p2,MFv2(i1),MFv2(i2)),dp) 
B0m2 = 4._dp*MFv(i1)*MFv(i2)*Real(SA_B0(p2,MFv2(i1),MFv2(i2)),dp) 
coupL1 = cplFvFvVZRL(i1,i2)
coupR1 = cplFvFvVZRR(i1,i2)
coupL2 = cplFvFvVPL(i1,i2)
coupR2 = cplFvFvVPR(i1,i2)
    SumI = (coupL1*coupL2+coupR1*coupR2)*H0m2 & 
                & + 0.5_dp*(coupL1*coupR2 + coupL2*coupR1)*B0m2 
res = res +0.5_dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[gWLm], gWLm 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(VGGloop(p2,MVWLm2,MVWLm2),dp)
coup1 = cplcgWLmgWLmVZR
coup2 = cplcgWLmgWLmVP 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWRm], gWLm 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(VGGloop(p2,MVWLm2,MVWRm2),dp)
coup1 = cplcgWRmgWLmVZR
coup2 = cplcgWLmgWRmVP 
   SumI = coup1*coup2*B0m2 
res = res +2._dp* SumI  
!------------------------ 
! bar[gWLmC], gWLmC 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(VGGloop(p2,MVWLm2,MVWLm2),dp)
coup1 = cplcgWLpgWLpVZR
coup2 = cplcgWLpgWLpVP 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWRmC], gWLmC 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(VGGloop(p2,MVWLm2,MVWRm2),dp)
coup1 = cplcgWRpgWLpVZR
coup2 = cplcgWLpgWRpVP 
   SumI = coup1*coup2*B0m2 
res = res +2._dp* SumI  
!------------------------ 
! bar[gWLm], gWRm 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(VGGloop(p2,MVWRm2,MVWLm2),dp)
coup1 = cplcgWLmgWRmVZR
coup2 = cplcgWRmgWLmVP 
   SumI = coup1*coup2*B0m2 
res = res +2._dp* SumI  
!------------------------ 
! bar[gWRm], gWRm 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(VGGloop(p2,MVWRm2,MVWRm2),dp)
coup1 = cplcgWRmgWRmVZR
coup2 = cplcgWRmgWRmVP 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWLmC], gWRmC 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(VGGloop(p2,MVWRm2,MVWLm2),dp)
coup1 = cplcgWLpgWRpVZR
coup2 = cplcgWRpgWLpVP 
   SumI = coup1*coup2*B0m2 
res = res +2._dp* SumI  
!------------------------ 
! bar[gWRmC], gWRmC 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(VGGloop(p2,MVWRm2,MVWRm2),dp)
coup1 = cplcgWRpgWRpVZR
coup2 = cplcgWRpgWRpVP 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! VZ, hh 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 B0m2 = Real(VVSloop(p2,MVZ2,Mhh2(i2)),dp) 
coup1 = cplhhVZVZR(i2)
coup2 = cplhhVPVZ(i2)
    SumI = coup1*coup2*B0m2 
res = res +0.5_dp* SumI  
    End Do 
 !------------------------ 
! VZR, hh 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 B0m2 = Real(VVSloop(p2,MVZR2,Mhh2(i2)),dp) 
coup1 = cplhhVZRVZR(i2)
coup2 = cplhhVPVZR(i2)
    SumI = coup1*coup2*B0m2 
res = res +0.5_dp* SumI  
    End Do 
 !------------------------ 
! conj[Hpm], Hpm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
       Do i2 = 1, 4
 B22m2 = Real(VSSloop(p2,MHpm2(i2),MHpm2(i1)),dp) 
coup1 = cplHpmcHpmVZR(i2,i1)
coup2 = cplHpmcHpmVP(i1,i2)
    SumI = coup1*coup2*B22m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! VWLm, Hpm 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 B0m2 = Real(VVSloop(p2,MVWLm2,MHpm2(i2)),dp) 
coup1 = cplHpmVWLmVZR(i2)
coup2 = cplcHpmcVWLmVP(i2)
    SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! VWRm, Hpm 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 B0m2 = Real(VVSloop(p2,MVWRm2,MHpm2(i2)),dp) 
coup1 = cplHpmVWRmVZR(i2)
coup2 = cplcHpmcVWRmVP(i2)
    SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! conj[VWLm], VWLm 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(VVVloop(p2,MVWLm2,MVWLm2),dp) 
coup1 = cplcVWLmVWLmVZR
coup2 = cplcVWLmVPVWLm
    SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! conj[VWRm], VWLm 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(VVVloop(p2,MVWRm2,MVWLm2),dp) 
coup1 = cplcVWRmVWLmVZR
coup2 = cplcVWLmVPVWRm
    SumI = coup1*coup2*B0m2 
res = res +2._dp* SumI  
!------------------------ 
! conj[VWLm], VWRm 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(VVVloop(p2,MVWLm2,MVWRm2),dp) 
coup1 = cplcVWLmVWRmVZR
coup2 = cplcVWRmVPVWLm
    SumI = coup1*coup2*B0m2 
res = res +2._dp* SumI  
!------------------------ 
! conj[VWRm], VWRm 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(VVVloop(p2,MVWRm2,MVWRm2),dp) 
coup1 = cplcVWRmVWRmVZR
coup2 = cplcVWRmVPVWRm
    SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! conj[VWLm], conj[Hpm] 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 B0m2 = Real(VVSloop(p2,MVWLm2,MHpm2(i2)),dp) 
coup1 = cplcHpmcVWLmVZR(i2)
coup2 = cplHpmVPVWLm(i2)
    SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! conj[VWRm], conj[Hpm] 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 B0m2 = Real(VVSloop(p2,MVWRm2,MHpm2(i2)),dp) 
coup1 = cplcHpmcVWRmVZR(i2)
coup2 = cplHpmVPVWRm(i2)
    SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! Ah 
!------------------------ 
    Do i1 = 1, 4
 SumI = 0._dp 
 A0m2 = SA_A0(MAh2(i1))
 coup1 = cplAhAhVPVZR(i1,i1)
 SumI = coup1*A0m2 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! hh 
!------------------------ 
    Do i1 = 1, 4
 SumI = 0._dp 
 A0m2 = SA_A0(Mhh2(i1))
 coup1 = cplhhhhVPVZR(i1,i1)
 SumI = coup1*A0m2 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! conj[Hpm] 
!------------------------ 
    Do i1 = 1, 4
 SumI = 0._dp 
 A0m2 = SA_A0(MHpm2(i1))
 coup1 = cplHpmcHpmVPVZR(i1,i1)
 SumI = coup1*A0m2 
res = res +1* SumI  
      End Do 
 !------------------------ 
! conj[VWLm] 
!------------------------ 
SumI = 0._dp 
A0m2 = 3._dp/4._dp*SA_A0(MVWLm2) +RXi/4._dp*SA_A0(MVWLm2*RXi) 
coup1 = cplcVWLmVPVWLmVZR2
coup2 = cplcVWLmVPVWLmVZR3
coup3 = cplcVWLmVPVWLmVZR1
SumI = ((2._dp*rMS*coup1+(1-RXi**2)/8._dp*(coup2+coup3))*MVWLm2-(4._dp*coup1+coup2+coup3)*A0m2)
res = res +1* SumI  
!------------------------ 
! conj[VWRm] 
!------------------------ 
SumI = 0._dp 
A0m2 = 3._dp/4._dp*SA_A0(MVWRm2) +RXi/4._dp*SA_A0(MVWRm2*RXi) 
coup1 = cplcVWRmVPVWRmVZR2
coup2 = cplcVWRmVPVWRmVZR3
coup3 = cplcVWRmVPVWRmVZR1
SumI = ((2._dp*rMS*coup1+(1-RXi**2)/8._dp*(coup2+coup3))*MVWRm2-(4._dp*coup1+coup2+coup3)*A0m2)
res = res +1* SumI  
res = oo16pi2*res 
 
End Subroutine Pi1LoopVZRVP 
 
Subroutine DerPi1LoopVZRVP(p2,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,           & 
& Mhh,Mhh2,MHpm,MHpm2,MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,MVZR2,cplAhAhVPVZR,        & 
& cplAhhhVP,cplAhhhVZR,cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZRL,cplcFdFdVZRR,cplcFeFeVPL,    & 
& cplcFeFeVPR,cplcFeFeVZRL,cplcFeFeVZRR,cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZRL,            & 
& cplcFuFuVZRR,cplcgWLmgWLmVP,cplcgWLmgWLmVZR,cplcgWLmgWRmVP,cplcgWLmgWRmVZR,            & 
& cplcgWLpgWLpVP,cplcgWLpgWLpVZR,cplcgWLpgWRpVP,cplcgWLpgWRpVZR,cplcgWRmgWLmVP,          & 
& cplcgWRmgWLmVZR,cplcgWRmgWRmVP,cplcgWRmgWRmVZR,cplcgWRpgWLpVP,cplcgWRpgWLpVZR,         & 
& cplcgWRpgWRpVP,cplcgWRpgWRpVZR,cplcHpmcVWLmVP,cplcHpmcVWLmVZR,cplcHpmcVWRmVP,          & 
& cplcHpmcVWRmVZR,cplcVWLmVPVWLm,cplcVWLmVPVWLmVZR1,cplcVWLmVPVWLmVZR2,cplcVWLmVPVWLmVZR3,& 
& cplcVWLmVPVWRm,cplcVWLmVWLmVZR,cplcVWLmVWRmVZR,cplcVWRmVPVWLm,cplcVWRmVPVWRm,          & 
& cplcVWRmVPVWRmVZR1,cplcVWRmVPVWRmVZR2,cplcVWRmVPVWRmVZR3,cplcVWRmVWLmVZR,              & 
& cplcVWRmVWRmVZR,cplFvFvVPL,cplFvFvVPR,cplFvFvVZRL,cplFvFvVZRR,cplhhhhVPVZR,            & 
& cplhhVPVZ,cplhhVPVZR,cplhhVZRVZR,cplhhVZVZR,cplHpmcHpmVP,cplHpmcHpmVPVZR,              & 
& cplHpmcHpmVZR,cplHpmVPVWLm,cplHpmVPVWRm,cplHpmVWLmVZR,cplHpmVWRmVZR,kont,res)

Implicit None 
Real(dp), Intent(in) :: MAh(4),MAh2(4),MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),MFv(9),MFv2(9),           & 
& Mhh(4),Mhh2(4),MHpm(4),MHpm2(4),MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,MVZR2

Complex(dp), Intent(in) :: cplAhAhVPVZR(4,4),cplAhhhVP(4,4),cplAhhhVZR(4,4),cplcFdFdVPL(3,3),cplcFdFdVPR(3,3),   & 
& cplcFdFdVZRL(3,3),cplcFdFdVZRR(3,3),cplcFeFeVPL(3,3),cplcFeFeVPR(3,3),cplcFeFeVZRL(3,3),& 
& cplcFeFeVZRR(3,3),cplcFuFuVPL(3,3),cplcFuFuVPR(3,3),cplcFuFuVZRL(3,3),cplcFuFuVZRR(3,3),& 
& cplcgWLmgWLmVP,cplcgWLmgWLmVZR,cplcgWLmgWRmVP,cplcgWLmgWRmVZR,cplcgWLpgWLpVP,          & 
& cplcgWLpgWLpVZR,cplcgWLpgWRpVP,cplcgWLpgWRpVZR,cplcgWRmgWLmVP,cplcgWRmgWLmVZR,         & 
& cplcgWRmgWRmVP,cplcgWRmgWRmVZR,cplcgWRpgWLpVP,cplcgWRpgWLpVZR,cplcgWRpgWRpVP,          & 
& cplcgWRpgWRpVZR,cplcHpmcVWLmVP(4),cplcHpmcVWLmVZR(4),cplcHpmcVWRmVP(4),cplcHpmcVWRmVZR(4),& 
& cplcVWLmVPVWLm,cplcVWLmVPVWLmVZR1,cplcVWLmVPVWLmVZR2,cplcVWLmVPVWLmVZR3,               & 
& cplcVWLmVPVWRm,cplcVWLmVWLmVZR,cplcVWLmVWRmVZR,cplcVWRmVPVWLm,cplcVWRmVPVWRm,          & 
& cplcVWRmVPVWRmVZR1,cplcVWRmVPVWRmVZR2,cplcVWRmVPVWRmVZR3,cplcVWRmVWLmVZR,              & 
& cplcVWRmVWRmVZR,cplFvFvVPL(9,9),cplFvFvVPR(9,9),cplFvFvVZRL(9,9),cplFvFvVZRR(9,9),     & 
& cplhhhhVPVZR(4,4),cplhhVPVZ(4),cplhhVPVZR(4),cplhhVZRVZR(4),cplhhVZVZR(4),             & 
& cplHpmcHpmVP(4,4),cplHpmcHpmVPVZR(4,4),cplHpmcHpmVZR(4,4),cplHpmVPVWLm(4),             & 
& cplHpmVPVWRm(4),cplHpmVWLmVZR(4),cplHpmVWRmVZR(4)

Integer, Intent(inout) :: kont 
Real(dp) :: B0m2, F0m2, G0m2, B1m2, H0m2, B22m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Complex(dp), Intent(inout) :: res 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2, coup3, temp, sumI 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
Real(dp) ::MVG,MVP,MVG2,MVP2
MVG = Mass_Regulator_PhotonGluon 
MVP = Mass_Regulator_PhotonGluon 
MVG2 = Mass_Regulator_PhotonGluon**2 
MVP2 = Mass_Regulator_PhotonGluon**2 

res = 0._dp 
 
!------------------------ 
! hh, Ah 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
       Do i2 = 1, 4
 B22m2 = Real(DerVSSloop(p2,MAh2(i2),Mhh2(i1)),dp) 
coup1 = cplAhhhVZR(i2,i1)
coup2 = cplAhhhVP(i2,i1)
    SumI = coup1*coup2*B22m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fd], Fd 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 H0m2 = Real(SA_DerHloop(p2,MFd2(i1),MFd2(i2)),dp) 
B0m2 = 2._dp*MFd(i1)*MFd(i2)*Real(SA_DerB0(p2,MFd2(i1),MFd2(i2)),dp) 
coupL1 = cplcFdFdVZRL(i1,i2)
coupR1 = cplcFdFdVZRR(i1,i2)
coupL2 = cplcFdFdVPL(i2,i1)
coupR2 = cplcFdFdVPR(i2,i1)
    SumI = (coupL1*coupL2+coupR1*coupR2)*H0m2 & 
                & + 0.5_dp*(coupL1*coupR2 + coupL2*coupR1)*B0m2 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fe], Fe 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 H0m2 = Real(SA_DerHloop(p2,MFe2(i1),MFe2(i2)),dp) 
B0m2 = 2._dp*MFe(i1)*MFe(i2)*Real(SA_DerB0(p2,MFe2(i1),MFe2(i2)),dp) 
coupL1 = cplcFeFeVZRL(i1,i2)
coupR1 = cplcFeFeVZRR(i1,i2)
coupL2 = cplcFeFeVPL(i2,i1)
coupR2 = cplcFeFeVPR(i2,i1)
    SumI = (coupL1*coupL2+coupR1*coupR2)*H0m2 & 
                & + 0.5_dp*(coupL1*coupR2 + coupL2*coupR1)*B0m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fu], Fu 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 H0m2 = Real(SA_DerHloop(p2,MFu2(i1),MFu2(i2)),dp) 
B0m2 = 2._dp*MFu(i1)*MFu(i2)*Real(SA_DerB0(p2,MFu2(i1),MFu2(i2)),dp) 
coupL1 = cplcFuFuVZRL(i1,i2)
coupR1 = cplcFuFuVZRR(i1,i2)
coupL2 = cplcFuFuVPL(i2,i1)
coupR2 = cplcFuFuVPR(i2,i1)
    SumI = (coupL1*coupL2+coupR1*coupR2)*H0m2 & 
                & + 0.5_dp*(coupL1*coupR2 + coupL2*coupR1)*B0m2 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! Fv, Fv 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 9
       Do i2 = 1, 9
 H0m2 = Real(SA_DerHloop(p2,MFv2(i1),MFv2(i2)),dp) 
B0m2 = 2._dp*MFv(i1)*MFv(i2)*Real(SA_DerB0(p2,MFv2(i1),MFv2(i2)),dp) 
coupL1 = cplFvFvVZRL(i1,i2)
coupR1 = cplFvFvVZRR(i1,i2)
coupL2 = cplFvFvVPL(i1,i2)
coupR2 = cplFvFvVPR(i1,i2)
    SumI = (coupL1*coupL2+coupR1*coupR2)*H0m2 & 
                & + 0.5_dp*(coupL1*coupR2 + coupL2*coupR1)*B0m2 
res = res +0.5_dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[gWLm], gWLm 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(DerVGGloop(p2,MVWLm2,MVWLm2),dp)
coup1 = cplcgWLmgWLmVZR
coup2 = cplcgWLmgWLmVP 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWRm], gWLm 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(DerVGGloop(p2,MVWLm2,MVWRm2),dp)
coup1 = cplcgWRmgWLmVZR
coup2 = cplcgWLmgWRmVP 
   SumI = coup1*coup2*B0m2 
res = res +2._dp* SumI  
!------------------------ 
! bar[gWLmC], gWLmC 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(DerVGGloop(p2,MVWLm2,MVWLm2),dp)
coup1 = cplcgWLpgWLpVZR
coup2 = cplcgWLpgWLpVP 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWRmC], gWLmC 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(DerVGGloop(p2,MVWLm2,MVWRm2),dp)
coup1 = cplcgWRpgWLpVZR
coup2 = cplcgWLpgWRpVP 
   SumI = coup1*coup2*B0m2 
res = res +2._dp* SumI  
!------------------------ 
! bar[gWLm], gWRm 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(DerVGGloop(p2,MVWRm2,MVWLm2),dp)
coup1 = cplcgWLmgWRmVZR
coup2 = cplcgWRmgWLmVP 
   SumI = coup1*coup2*B0m2 
res = res +2._dp* SumI  
!------------------------ 
! bar[gWRm], gWRm 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(DerVGGloop(p2,MVWRm2,MVWRm2),dp)
coup1 = cplcgWRmgWRmVZR
coup2 = cplcgWRmgWRmVP 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWLmC], gWRmC 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(DerVGGloop(p2,MVWRm2,MVWLm2),dp)
coup1 = cplcgWLpgWRpVZR
coup2 = cplcgWRpgWLpVP 
   SumI = coup1*coup2*B0m2 
res = res +2._dp* SumI  
!------------------------ 
! bar[gWRmC], gWRmC 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(DerVGGloop(p2,MVWRm2,MVWRm2),dp)
coup1 = cplcgWRpgWRpVZR
coup2 = cplcgWRpgWRpVP 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! VZ, hh 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 B0m2 = Real(DerVVSloop(p2,MVZ2,Mhh2(i2)),dp) 
coup1 = cplhhVZVZR(i2)
coup2 = cplhhVPVZ(i2)
    SumI = coup1*coup2*B0m2 
res = res +0.5_dp* SumI  
    End Do 
 !------------------------ 
! VZR, hh 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 B0m2 = Real(DerVVSloop(p2,MVZR2,Mhh2(i2)),dp) 
coup1 = cplhhVZRVZR(i2)
coup2 = cplhhVPVZR(i2)
    SumI = coup1*coup2*B0m2 
res = res +0.5_dp* SumI  
    End Do 
 !------------------------ 
! conj[Hpm], Hpm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
       Do i2 = 1, 4
 B22m2 = Real(DerVSSloop(p2,MHpm2(i2),MHpm2(i1)),dp) 
coup1 = cplHpmcHpmVZR(i2,i1)
coup2 = cplHpmcHpmVP(i1,i2)
    SumI = coup1*coup2*B22m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! VWLm, Hpm 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 B0m2 = Real(DerVVSloop(p2,MVWLm2,MHpm2(i2)),dp) 
coup1 = cplHpmVWLmVZR(i2)
coup2 = cplcHpmcVWLmVP(i2)
    SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! VWRm, Hpm 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 B0m2 = Real(DerVVSloop(p2,MVWRm2,MHpm2(i2)),dp) 
coup1 = cplHpmVWRmVZR(i2)
coup2 = cplcHpmcVWRmVP(i2)
    SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! conj[VWLm], VWLm 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(DerVVVloop(p2,MVWLm2,MVWLm2),dp) 
coup1 = cplcVWLmVWLmVZR
coup2 = cplcVWLmVPVWLm
    SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! conj[VWRm], VWLm 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(DerVVVloop(p2,MVWRm2,MVWLm2),dp) 
coup1 = cplcVWRmVWLmVZR
coup2 = cplcVWLmVPVWRm
    SumI = coup1*coup2*B0m2 
res = res +2._dp* SumI  
!------------------------ 
! conj[VWLm], VWRm 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(DerVVVloop(p2,MVWLm2,MVWRm2),dp) 
coup1 = cplcVWLmVWRmVZR
coup2 = cplcVWRmVPVWLm
    SumI = coup1*coup2*B0m2 
res = res +2._dp* SumI  
!------------------------ 
! conj[VWRm], VWRm 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(DerVVVloop(p2,MVWRm2,MVWRm2),dp) 
coup1 = cplcVWRmVWRmVZR
coup2 = cplcVWRmVPVWRm
    SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! conj[VWLm], conj[Hpm] 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 B0m2 = Real(DerVVSloop(p2,MVWLm2,MHpm2(i2)),dp) 
coup1 = cplcHpmcVWLmVZR(i2)
coup2 = cplHpmVPVWLm(i2)
    SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! conj[VWRm], conj[Hpm] 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 B0m2 = Real(DerVVSloop(p2,MVWRm2,MHpm2(i2)),dp) 
coup1 = cplcHpmcVWRmVZR(i2)
coup2 = cplHpmVPVWRm(i2)
    SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! Ah 
!------------------------ 
    Do i1 = 1, 4
 SumI = 0._dp 
 A0m2 = SA_DerA0(MAh2(i1))
 coup1 = cplAhAhVPVZR(i1,i1)
 SumI = coup1*A0m2 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! hh 
!------------------------ 
    Do i1 = 1, 4
 SumI = 0._dp 
 A0m2 = SA_DerA0(Mhh2(i1))
 coup1 = cplhhhhVPVZR(i1,i1)
 SumI = coup1*A0m2 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! conj[Hpm] 
!------------------------ 
    Do i1 = 1, 4
 SumI = 0._dp 
 A0m2 = SA_DerA0(MHpm2(i1))
 coup1 = cplHpmcHpmVPVZR(i1,i1)
 SumI = coup1*A0m2 
res = res +1* SumI  
      End Do 
 !------------------------ 
! conj[VWLm] 
!------------------------ 
SumI = 0._dp 
A0m2 = 3._dp/4._dp*SA_DerA0(MVWLm2) +RXi/4._dp*SA_DerA0(MVWLm2*RXi) 
coup1 = cplcVWLmVPVWLmVZR2
coup2 = cplcVWLmVPVWLmVZR3
coup3 = cplcVWLmVPVWLmVZR1
SumI = ((2._dp*DerrMS*coup1+(1-RXi**2)/8._dp*(coup2+coup3))*MVWLm2-(4._dp*coup1+coup2+coup3)*A0m2)
res = res +1* SumI  
!------------------------ 
! conj[VWRm] 
!------------------------ 
SumI = 0._dp 
A0m2 = 3._dp/4._dp*SA_DerA0(MVWRm2) +RXi/4._dp*SA_DerA0(MVWRm2*RXi) 
coup1 = cplcVWRmVPVWRmVZR2
coup2 = cplcVWRmVPVWRmVZR3
coup3 = cplcVWRmVPVWRmVZR1
SumI = ((2._dp*DerrMS*coup1+(1-RXi**2)/8._dp*(coup2+coup3))*MVWRm2-(4._dp*coup1+coup2+coup3)*A0m2)
res = res +1* SumI  
res = oo16pi2*res 
 
End Subroutine DerPi1LoopVZRVP 
 
Subroutine Pi1LoopVWLmVWRm(p2,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,           & 
& Mhh,Mhh2,MHpm,MHpm2,MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,MVZR2,cplAhAhcVWRmVWLm,    & 
& cplAhcHpmcVWRm,cplAhHpmVWLm,cplcFdFuVWLmL,cplcFdFuVWLmR,cplcFeFvVWLmL,cplcFeFvVWLmR,   & 
& cplcFuFdcVWRmL,cplcFuFdcVWRmR,cplcgPgWLmcVWRm,cplcgPgWLpVWLm,cplcgPgWRmcVWRm,          & 
& cplcgPgWRpVWLm,cplcgWLmgPVWLm,cplcgWLmgZpVWLm,cplcgWLmgZVWLm,cplcgWLpgPcVWRm,          & 
& cplcgWLpgZcVWRm,cplcgWLpgZpcVWRm,cplcgWRmgPVWLm,cplcgWRmgZpVWLm,cplcgWRmgZVWLm,        & 
& cplcgWRpgPcVWRm,cplcgWRpgZcVWRm,cplcgWRpgZpcVWRm,cplcgZgWLmcVWRm,cplcgZgWLpVWLm,       & 
& cplcgZgWRmcVWRm,cplcgZgWRpVWLm,cplcgZpgWLmcVWRm,cplcgZpgWLpVWLm,cplcgZpgWRmcVWRm,      & 
& cplcgZpgWRpVWLm,cplcHpmcVWRmVP,cplcHpmcVWRmVZ,cplcHpmcVWRmVZR,cplcVWLmcVWRmVWLmVWLm1,  & 
& cplcVWLmcVWRmVWLmVWLm2,cplcVWLmcVWRmVWLmVWLm3,cplcVWLmVPVWLm,cplcVWLmVWLmVZ,           & 
& cplcVWLmVWLmVZR,cplcVWRmcVWRmVWLmVWRm1,cplcVWRmcVWRmVWLmVWRm2,cplcVWRmcVWRmVWLmVWRm3,  & 
& cplcVWRmVPVPVWLm1,cplcVWRmVPVPVWLm2,cplcVWRmVPVPVWLm3,cplcVWRmVPVWLm,cplcVWRmVPVWRm,   & 
& cplcVWRmVWLmVZ,cplcVWRmVWLmVZR,cplcVWRmVWLmVZRVZR1,cplcVWRmVWLmVZRVZR2,cplcVWRmVWLmVZRVZR3,& 
& cplcVWRmVWLmVZVZ1,cplcVWRmVWLmVZVZ2,cplcVWRmVWLmVZVZ3,cplcVWRmVWRmVZ,cplcVWRmVWRmVZR,  & 
& cplFvFecVWRmL,cplFvFecVWRmR,cplhhcHpmcVWRm,cplhhcVWLmVWLm,cplhhcVWRmVWLm,              & 
& cplhhcVWRmVWRm,cplhhhhcVWRmVWLm,cplhhHpmVWLm,cplHpmcHpmcVWRmVWLm,cplHpmVPVWLm,         & 
& cplHpmVWLmVZ,cplHpmVWLmVZR,kont,res)

Implicit None 
Real(dp), Intent(in) :: MAh(4),MAh2(4),MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),MFv(9),MFv2(9),           & 
& Mhh(4),Mhh2(4),MHpm(4),MHpm2(4),MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,MVZR2

Complex(dp), Intent(in) :: cplAhAhcVWRmVWLm(4,4),cplAhcHpmcVWRm(4,4),cplAhHpmVWLm(4,4),cplcFdFuVWLmL(3,3),       & 
& cplcFdFuVWLmR(3,3),cplcFeFvVWLmL(3,9),cplcFeFvVWLmR(3,9),cplcFuFdcVWRmL(3,3),          & 
& cplcFuFdcVWRmR(3,3),cplcgPgWLmcVWRm,cplcgPgWLpVWLm,cplcgPgWRmcVWRm,cplcgPgWRpVWLm,     & 
& cplcgWLmgPVWLm,cplcgWLmgZpVWLm,cplcgWLmgZVWLm,cplcgWLpgPcVWRm,cplcgWLpgZcVWRm,         & 
& cplcgWLpgZpcVWRm,cplcgWRmgPVWLm,cplcgWRmgZpVWLm,cplcgWRmgZVWLm,cplcgWRpgPcVWRm,        & 
& cplcgWRpgZcVWRm,cplcgWRpgZpcVWRm,cplcgZgWLmcVWRm,cplcgZgWLpVWLm,cplcgZgWRmcVWRm,       & 
& cplcgZgWRpVWLm,cplcgZpgWLmcVWRm,cplcgZpgWLpVWLm,cplcgZpgWRmcVWRm,cplcgZpgWRpVWLm,      & 
& cplcHpmcVWRmVP(4),cplcHpmcVWRmVZ(4),cplcHpmcVWRmVZR(4),cplcVWLmcVWRmVWLmVWLm1,         & 
& cplcVWLmcVWRmVWLmVWLm2,cplcVWLmcVWRmVWLmVWLm3,cplcVWLmVPVWLm,cplcVWLmVWLmVZ,           & 
& cplcVWLmVWLmVZR,cplcVWRmcVWRmVWLmVWRm1,cplcVWRmcVWRmVWLmVWRm2,cplcVWRmcVWRmVWLmVWRm3,  & 
& cplcVWRmVPVPVWLm1,cplcVWRmVPVPVWLm2,cplcVWRmVPVPVWLm3,cplcVWRmVPVWLm,cplcVWRmVPVWRm,   & 
& cplcVWRmVWLmVZ,cplcVWRmVWLmVZR,cplcVWRmVWLmVZRVZR1,cplcVWRmVWLmVZRVZR2,cplcVWRmVWLmVZRVZR3,& 
& cplcVWRmVWLmVZVZ1,cplcVWRmVWLmVZVZ2,cplcVWRmVWLmVZVZ3,cplcVWRmVWRmVZ,cplcVWRmVWRmVZR,  & 
& cplFvFecVWRmL(9,3),cplFvFecVWRmR(9,3),cplhhcHpmcVWRm(4,4),cplhhcVWLmVWLm(4),           & 
& cplhhcVWRmVWLm(4),cplhhcVWRmVWRm(4),cplhhhhcVWRmVWLm(4,4),cplhhHpmVWLm(4,4),           & 
& cplHpmcHpmcVWRmVWLm(4,4),cplHpmVPVWLm(4),cplHpmVWLmVZ(4),cplHpmVWLmVZR(4)

Integer, Intent(inout) :: kont 
Real(dp) :: B0m2, F0m2, G0m2, B1m2, H0m2, B22m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Complex(dp), Intent(inout) :: res 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2, coup3, temp, sumI 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
res = 0._dp 
 
!------------------------ 
! Hpm, Ah 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
       Do i2 = 1, 4
 B22m2 = Real(VSSloop(p2,MAh2(i2),MHpm2(i1)),dp) 
coup1 = cplAhHpmVWLm(i2,i1)
coup2 = cplAhcHpmcVWRm(i2,i1)
    SumI = coup1*coup2*B22m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fd], Fu 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 H0m2 = Real(SA_Hloop(p2,MFd2(i1),MFu2(i2)),dp) 
B0m2 = 4._dp*MFd(i1)*MFu(i2)*Real(SA_B0(p2,MFd2(i1),MFu2(i2)),dp) 
coupL1 = cplcFdFuVWLmL(i1,i2)
coupR1 = cplcFdFuVWLmR(i1,i2)
coupL2 = cplcFuFdcVWRmL(i2,i1)
coupR2 = cplcFuFdcVWRmR(i2,i1)
    SumI = (coupL1*coupL2+coupR1*coupR2)*H0m2 & 
                & + 0.5_dp*(coupL1*coupR2 + coupL2*coupR1)*B0m2 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fe], Fv 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 9
 H0m2 = Real(SA_Hloop(p2,MFe2(i1),MFv2(i2)),dp) 
B0m2 = 4._dp*MFe(i1)*MFv(i2)*Real(SA_B0(p2,MFe2(i1),MFv2(i2)),dp) 
coupL1 = cplcFeFvVWLmL(i1,i2)
coupR1 = cplcFeFvVWLmR(i1,i2)
coupL2 = cplFvFecVWRmL(i2,i1)
coupR2 = cplFvFecVWRmR(i2,i1)
    SumI = (coupL1*coupL2+coupR1*coupR2)*H0m2 & 
                & + 0.5_dp*(coupL1*coupR2 + coupL2*coupR1)*B0m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[gWLm], gP 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(VGGloop(p2,0._dp,MVWLm2),dp)
coup1 = cplcgWLmgPVWLm
coup2 = cplcgPgWLmcVWRm 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWRm], gP 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(VGGloop(p2,0._dp,MVWRm2),dp)
coup1 = cplcgWRmgPVWLm
coup2 = cplcgPgWRmcVWRm 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gP], gWLmC 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(VGGloop(p2,MVWLm2,0._dp),dp)
coup1 = cplcgPgWLpVWLm
coup2 = cplcgWLpgPcVWRm 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gZ], gWLmC 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(VGGloop(p2,MVWLm2,MVZ2),dp)
coup1 = cplcgZgWLpVWLm
coup2 = cplcgWLpgZcVWRm 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gZR], gWLmC 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(VGGloop(p2,MVWLm2,MVZR2),dp)
coup1 = cplcgZpgWLpVWLm
coup2 = cplcgWLpgZpcVWRm 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gP], gWRmC 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(VGGloop(p2,MVWRm2,0._dp),dp)
coup1 = cplcgPgWRpVWLm
coup2 = cplcgWRpgPcVWRm 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gZ], gWRmC 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(VGGloop(p2,MVWRm2,MVZ2),dp)
coup1 = cplcgZgWRpVWLm
coup2 = cplcgWRpgZcVWRm 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gZR], gWRmC 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(VGGloop(p2,MVWRm2,MVZR2),dp)
coup1 = cplcgZpgWRpVWLm
coup2 = cplcgWRpgZpcVWRm 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWLm], gZ 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(VGGloop(p2,MVZ2,MVWLm2),dp)
coup1 = cplcgWLmgZVWLm
coup2 = cplcgZgWLmcVWRm 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWRm], gZ 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(VGGloop(p2,MVZ2,MVWRm2),dp)
coup1 = cplcgWRmgZVWLm
coup2 = cplcgZgWRmcVWRm 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWLm], gZR 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(VGGloop(p2,MVZR2,MVWLm2),dp)
coup1 = cplcgWLmgZpVWLm
coup2 = cplcgZpgWLmcVWRm 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWRm], gZR 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(VGGloop(p2,MVZR2,MVWRm2),dp)
coup1 = cplcgWRmgZpVWLm
coup2 = cplcgZpgWRmcVWRm 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! conj[VWLm], hh 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 B0m2 = Real(VVSloop(p2,MVWLm2,Mhh2(i2)),dp) 
coup1 = cplhhcVWLmVWLm(i2)
coup2 = cplhhcVWRmVWLm(i2)
    SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! conj[VWRm], hh 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 B0m2 = Real(VVSloop(p2,MVWRm2,Mhh2(i2)),dp) 
coup1 = cplhhcVWRmVWLm(i2)
coup2 = cplhhcVWRmVWRm(i2)
    SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! Hpm, hh 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
       Do i2 = 1, 4
 B22m2 = Real(VSSloop(p2,Mhh2(i2),MHpm2(i1)),dp) 
coup1 = cplhhHpmVWLm(i2,i1)
coup2 = cplhhcHpmcVWRm(i2,i1)
    SumI = coup1*coup2*B22m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! VP, Hpm 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! VZ, Hpm 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 B0m2 = Real(VVSloop(p2,MVZ2,MHpm2(i2)),dp) 
coup1 = cplHpmVWLmVZ(i2)
coup2 = cplcHpmcVWRmVZ(i2)
    SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! VZR, Hpm 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 B0m2 = Real(VVSloop(p2,MVZR2,MHpm2(i2)),dp) 
coup1 = cplHpmVWLmVZR(i2)
coup2 = cplcHpmcVWRmVZR(i2)
    SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! conj[VWLm], VP 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(VVVloop(p2,MVWLm2,0._dp),dp) 
coup1 = cplcVWLmVPVWLm
coup2 = cplcVWRmVPVWLm
    SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! conj[VWRm], VP 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(VVVloop(p2,MVWRm2,0._dp),dp) 
coup1 = cplcVWRmVPVWLm
coup2 = cplcVWRmVPVWRm
    SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! conj[VWLm], VZ 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(VVVloop(p2,MVWLm2,MVZ2),dp) 
coup1 = cplcVWLmVWLmVZ
coup2 = cplcVWRmVWLmVZ
    SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! conj[VWRm], VZ 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(VVVloop(p2,MVWRm2,MVZ2),dp) 
coup1 = cplcVWRmVWLmVZ
coup2 = cplcVWRmVWRmVZ
    SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! conj[VWLm], VZR 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(VVVloop(p2,MVWLm2,MVZR2),dp) 
coup1 = cplcVWLmVWLmVZR
coup2 = cplcVWRmVWLmVZR
    SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! conj[VWRm], VZR 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(VVVloop(p2,MVWRm2,MVZR2),dp) 
coup1 = cplcVWRmVWLmVZR
coup2 = cplcVWRmVWRmVZR
    SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! Ah 
!------------------------ 
    Do i1 = 1, 4
 SumI = 0._dp 
 A0m2 = SA_A0(MAh2(i1))
 coup1 = cplAhAhcVWRmVWLm(i1,i1)
 SumI = coup1*A0m2 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! hh 
!------------------------ 
    Do i1 = 1, 4
 SumI = 0._dp 
 A0m2 = SA_A0(Mhh2(i1))
 coup1 = cplhhhhcVWRmVWLm(i1,i1)
 SumI = coup1*A0m2 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! conj[Hpm] 
!------------------------ 
    Do i1 = 1, 4
 SumI = 0._dp 
 A0m2 = SA_A0(MHpm2(i1))
 coup1 = cplHpmcHpmcVWRmVWLm(i1,i1)
 SumI = coup1*A0m2 
res = res +1* SumI  
      End Do 
 !------------------------ 
! VP 
!------------------------ 
SumI = 0._dp 
A0m2 = 3._dp/4._dp*SA_A0(0._dp) +RXi/4._dp*SA_A0(0._dp*RXi) 
coup1 = cplcVWRmVPVPVWLm3
coup2 = cplcVWRmVPVPVWLm1
coup3 = cplcVWRmVPVPVWLm2
SumI = ((2._dp*rMS*coup1+(1-RXi**2)/8._dp*(coup2+coup3))*0._dp-(4._dp*coup1+coup2+coup3)*A0m2)
res = res +1._dp/2._dp* SumI  
!------------------------ 
! conj[VWLm] 
!------------------------ 
SumI = 0._dp 
A0m2 = 3._dp/4._dp*SA_A0(MVWLm2) +RXi/4._dp*SA_A0(MVWLm2*RXi) 
coup1 = cplcVWLmcVWRmVWLmVWLm2
coup2 = cplcVWLmcVWRmVWLmVWLm3
coup3 = cplcVWLmcVWRmVWLmVWLm1
SumI = ((2._dp*rMS*coup1+(1-RXi**2)/8._dp*(coup2+coup3))*MVWLm2-(4._dp*coup1+coup2+coup3)*A0m2)
res = res +1* SumI  
!------------------------ 
! conj[VWRm] 
!------------------------ 
SumI = 0._dp 
A0m2 = 3._dp/4._dp*SA_A0(MVWRm2) +RXi/4._dp*SA_A0(MVWRm2*RXi) 
coup1 = cplcVWRmcVWRmVWLmVWRm2
coup2 = cplcVWRmcVWRmVWLmVWRm3
coup3 = cplcVWRmcVWRmVWLmVWRm1
SumI = ((2._dp*rMS*coup1+(1-RXi**2)/8._dp*(coup2+coup3))*MVWRm2-(4._dp*coup1+coup2+coup3)*A0m2)
res = res +1* SumI  
!------------------------ 
! VZ 
!------------------------ 
SumI = 0._dp 
A0m2 = 3._dp/4._dp*SA_A0(MVZ2) +RXi/4._dp*SA_A0(MVZ2*RXi) 
coup1 = cplcVWRmVWLmVZVZ1
coup2 = cplcVWRmVWLmVZVZ2
coup3 = cplcVWRmVWLmVZVZ3
SumI = ((2._dp*rMS*coup1+(1-RXi**2)/8._dp*(coup2+coup3))*MVZ2-(4._dp*coup1+coup2+coup3)*A0m2)
res = res +1._dp/2._dp* SumI  
!------------------------ 
! VZR 
!------------------------ 
SumI = 0._dp 
A0m2 = 3._dp/4._dp*SA_A0(MVZR2) +RXi/4._dp*SA_A0(MVZR2*RXi) 
coup1 = cplcVWRmVWLmVZRVZR1
coup2 = cplcVWRmVWLmVZRVZR2
coup3 = cplcVWRmVWLmVZRVZR3
SumI = ((2._dp*rMS*coup1+(1-RXi**2)/8._dp*(coup2+coup3))*MVZR2-(4._dp*coup1+coup2+coup3)*A0m2)
res = res +1._dp/2._dp* SumI  
res = oo16pi2*res 
 
End Subroutine Pi1LoopVWLmVWRm 
 
Subroutine DerPi1LoopVWLmVWRm(p2,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,             & 
& MFv2,Mhh,Mhh2,MHpm,MHpm2,MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,MVZR2,cplAhAhcVWRmVWLm,& 
& cplAhcHpmcVWRm,cplAhHpmVWLm,cplcFdFuVWLmL,cplcFdFuVWLmR,cplcFeFvVWLmL,cplcFeFvVWLmR,   & 
& cplcFuFdcVWRmL,cplcFuFdcVWRmR,cplcgPgWLmcVWRm,cplcgPgWLpVWLm,cplcgPgWRmcVWRm,          & 
& cplcgPgWRpVWLm,cplcgWLmgPVWLm,cplcgWLmgZpVWLm,cplcgWLmgZVWLm,cplcgWLpgPcVWRm,          & 
& cplcgWLpgZcVWRm,cplcgWLpgZpcVWRm,cplcgWRmgPVWLm,cplcgWRmgZpVWLm,cplcgWRmgZVWLm,        & 
& cplcgWRpgPcVWRm,cplcgWRpgZcVWRm,cplcgWRpgZpcVWRm,cplcgZgWLmcVWRm,cplcgZgWLpVWLm,       & 
& cplcgZgWRmcVWRm,cplcgZgWRpVWLm,cplcgZpgWLmcVWRm,cplcgZpgWLpVWLm,cplcgZpgWRmcVWRm,      & 
& cplcgZpgWRpVWLm,cplcHpmcVWRmVP,cplcHpmcVWRmVZ,cplcHpmcVWRmVZR,cplcVWLmcVWRmVWLmVWLm1,  & 
& cplcVWLmcVWRmVWLmVWLm2,cplcVWLmcVWRmVWLmVWLm3,cplcVWLmVPVWLm,cplcVWLmVWLmVZ,           & 
& cplcVWLmVWLmVZR,cplcVWRmcVWRmVWLmVWRm1,cplcVWRmcVWRmVWLmVWRm2,cplcVWRmcVWRmVWLmVWRm3,  & 
& cplcVWRmVPVPVWLm1,cplcVWRmVPVPVWLm2,cplcVWRmVPVPVWLm3,cplcVWRmVPVWLm,cplcVWRmVPVWRm,   & 
& cplcVWRmVWLmVZ,cplcVWRmVWLmVZR,cplcVWRmVWLmVZRVZR1,cplcVWRmVWLmVZRVZR2,cplcVWRmVWLmVZRVZR3,& 
& cplcVWRmVWLmVZVZ1,cplcVWRmVWLmVZVZ2,cplcVWRmVWLmVZVZ3,cplcVWRmVWRmVZ,cplcVWRmVWRmVZR,  & 
& cplFvFecVWRmL,cplFvFecVWRmR,cplhhcHpmcVWRm,cplhhcVWLmVWLm,cplhhcVWRmVWLm,              & 
& cplhhcVWRmVWRm,cplhhhhcVWRmVWLm,cplhhHpmVWLm,cplHpmcHpmcVWRmVWLm,cplHpmVPVWLm,         & 
& cplHpmVWLmVZ,cplHpmVWLmVZR,kont,res)

Implicit None 
Real(dp), Intent(in) :: MAh(4),MAh2(4),MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),MFv(9),MFv2(9),           & 
& Mhh(4),Mhh2(4),MHpm(4),MHpm2(4),MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,MVZR2

Complex(dp), Intent(in) :: cplAhAhcVWRmVWLm(4,4),cplAhcHpmcVWRm(4,4),cplAhHpmVWLm(4,4),cplcFdFuVWLmL(3,3),       & 
& cplcFdFuVWLmR(3,3),cplcFeFvVWLmL(3,9),cplcFeFvVWLmR(3,9),cplcFuFdcVWRmL(3,3),          & 
& cplcFuFdcVWRmR(3,3),cplcgPgWLmcVWRm,cplcgPgWLpVWLm,cplcgPgWRmcVWRm,cplcgPgWRpVWLm,     & 
& cplcgWLmgPVWLm,cplcgWLmgZpVWLm,cplcgWLmgZVWLm,cplcgWLpgPcVWRm,cplcgWLpgZcVWRm,         & 
& cplcgWLpgZpcVWRm,cplcgWRmgPVWLm,cplcgWRmgZpVWLm,cplcgWRmgZVWLm,cplcgWRpgPcVWRm,        & 
& cplcgWRpgZcVWRm,cplcgWRpgZpcVWRm,cplcgZgWLmcVWRm,cplcgZgWLpVWLm,cplcgZgWRmcVWRm,       & 
& cplcgZgWRpVWLm,cplcgZpgWLmcVWRm,cplcgZpgWLpVWLm,cplcgZpgWRmcVWRm,cplcgZpgWRpVWLm,      & 
& cplcHpmcVWRmVP(4),cplcHpmcVWRmVZ(4),cplcHpmcVWRmVZR(4),cplcVWLmcVWRmVWLmVWLm1,         & 
& cplcVWLmcVWRmVWLmVWLm2,cplcVWLmcVWRmVWLmVWLm3,cplcVWLmVPVWLm,cplcVWLmVWLmVZ,           & 
& cplcVWLmVWLmVZR,cplcVWRmcVWRmVWLmVWRm1,cplcVWRmcVWRmVWLmVWRm2,cplcVWRmcVWRmVWLmVWRm3,  & 
& cplcVWRmVPVPVWLm1,cplcVWRmVPVPVWLm2,cplcVWRmVPVPVWLm3,cplcVWRmVPVWLm,cplcVWRmVPVWRm,   & 
& cplcVWRmVWLmVZ,cplcVWRmVWLmVZR,cplcVWRmVWLmVZRVZR1,cplcVWRmVWLmVZRVZR2,cplcVWRmVWLmVZRVZR3,& 
& cplcVWRmVWLmVZVZ1,cplcVWRmVWLmVZVZ2,cplcVWRmVWLmVZVZ3,cplcVWRmVWRmVZ,cplcVWRmVWRmVZR,  & 
& cplFvFecVWRmL(9,3),cplFvFecVWRmR(9,3),cplhhcHpmcVWRm(4,4),cplhhcVWLmVWLm(4),           & 
& cplhhcVWRmVWLm(4),cplhhcVWRmVWRm(4),cplhhhhcVWRmVWLm(4,4),cplhhHpmVWLm(4,4),           & 
& cplHpmcHpmcVWRmVWLm(4,4),cplHpmVPVWLm(4),cplHpmVWLmVZ(4),cplHpmVWLmVZR(4)

Integer, Intent(inout) :: kont 
Real(dp) :: B0m2, F0m2, G0m2, B1m2, H0m2, B22m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Complex(dp), Intent(inout) :: res 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2, coup3, temp, sumI 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
Real(dp) ::MVG,MVP,MVG2,MVP2
MVG = Mass_Regulator_PhotonGluon 
MVP = Mass_Regulator_PhotonGluon 
MVG2 = Mass_Regulator_PhotonGluon**2 
MVP2 = Mass_Regulator_PhotonGluon**2 

res = 0._dp 
 
!------------------------ 
! Hpm, Ah 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
       Do i2 = 1, 4
 B22m2 = Real(DerVSSloop(p2,MAh2(i2),MHpm2(i1)),dp) 
coup1 = cplAhHpmVWLm(i2,i1)
coup2 = cplAhcHpmcVWRm(i2,i1)
    SumI = coup1*coup2*B22m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fd], Fu 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 H0m2 = Real(SA_DerHloop(p2,MFd2(i1),MFu2(i2)),dp) 
B0m2 = 2._dp*MFd(i1)*MFu(i2)*Real(SA_DerB0(p2,MFd2(i1),MFu2(i2)),dp) 
coupL1 = cplcFdFuVWLmL(i1,i2)
coupR1 = cplcFdFuVWLmR(i1,i2)
coupL2 = cplcFuFdcVWRmL(i2,i1)
coupR2 = cplcFuFdcVWRmR(i2,i1)
    SumI = (coupL1*coupL2+coupR1*coupR2)*H0m2 & 
                & + 0.5_dp*(coupL1*coupR2 + coupL2*coupR1)*B0m2 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fe], Fv 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 9
 H0m2 = Real(SA_DerHloop(p2,MFe2(i1),MFv2(i2)),dp) 
B0m2 = 2._dp*MFe(i1)*MFv(i2)*Real(SA_DerB0(p2,MFe2(i1),MFv2(i2)),dp) 
coupL1 = cplcFeFvVWLmL(i1,i2)
coupR1 = cplcFeFvVWLmR(i1,i2)
coupL2 = cplFvFecVWRmL(i2,i1)
coupR2 = cplFvFecVWRmR(i2,i1)
    SumI = (coupL1*coupL2+coupR1*coupR2)*H0m2 & 
                & + 0.5_dp*(coupL1*coupR2 + coupL2*coupR1)*B0m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[gWLm], gP 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(DerVGGloop(p2,MVP2,MVWLm2),dp)
coup1 = cplcgWLmgPVWLm
coup2 = cplcgPgWLmcVWRm 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWRm], gP 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(DerVGGloop(p2,MVP2,MVWRm2),dp)
coup1 = cplcgWRmgPVWLm
coup2 = cplcgPgWRmcVWRm 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gP], gWLmC 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(DerVGGloop(p2,MVWLm2,MVP2),dp)
coup1 = cplcgPgWLpVWLm
coup2 = cplcgWLpgPcVWRm 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gZ], gWLmC 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(DerVGGloop(p2,MVWLm2,MVZ2),dp)
coup1 = cplcgZgWLpVWLm
coup2 = cplcgWLpgZcVWRm 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gZR], gWLmC 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(DerVGGloop(p2,MVWLm2,MVZR2),dp)
coup1 = cplcgZpgWLpVWLm
coup2 = cplcgWLpgZpcVWRm 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gP], gWRmC 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(DerVGGloop(p2,MVWRm2,MVP2),dp)
coup1 = cplcgPgWRpVWLm
coup2 = cplcgWRpgPcVWRm 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gZ], gWRmC 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(DerVGGloop(p2,MVWRm2,MVZ2),dp)
coup1 = cplcgZgWRpVWLm
coup2 = cplcgWRpgZcVWRm 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gZR], gWRmC 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(DerVGGloop(p2,MVWRm2,MVZR2),dp)
coup1 = cplcgZpgWRpVWLm
coup2 = cplcgWRpgZpcVWRm 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWLm], gZ 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(DerVGGloop(p2,MVZ2,MVWLm2),dp)
coup1 = cplcgWLmgZVWLm
coup2 = cplcgZgWLmcVWRm 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWRm], gZ 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(DerVGGloop(p2,MVZ2,MVWRm2),dp)
coup1 = cplcgWRmgZVWLm
coup2 = cplcgZgWRmcVWRm 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWLm], gZR 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(DerVGGloop(p2,MVZR2,MVWLm2),dp)
coup1 = cplcgWLmgZpVWLm
coup2 = cplcgZpgWLmcVWRm 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWRm], gZR 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(DerVGGloop(p2,MVZR2,MVWRm2),dp)
coup1 = cplcgWRmgZpVWLm
coup2 = cplcgZpgWRmcVWRm 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! conj[VWLm], hh 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 B0m2 = Real(DerVVSloop(p2,MVWLm2,Mhh2(i2)),dp) 
coup1 = cplhhcVWLmVWLm(i2)
coup2 = cplhhcVWRmVWLm(i2)
    SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! conj[VWRm], hh 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 B0m2 = Real(DerVVSloop(p2,MVWRm2,Mhh2(i2)),dp) 
coup1 = cplhhcVWRmVWLm(i2)
coup2 = cplhhcVWRmVWRm(i2)
    SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! Hpm, hh 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
       Do i2 = 1, 4
 B22m2 = Real(DerVSSloop(p2,Mhh2(i2),MHpm2(i1)),dp) 
coup1 = cplhhHpmVWLm(i2,i1)
coup2 = cplhhcHpmcVWRm(i2,i1)
    SumI = coup1*coup2*B22m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! VP, Hpm 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 B0m2 = Real(DerVVSloop(p2,MVP2,MHpm2(i2)),dp) 
coup1 = cplHpmVPVWLm(i2)
coup2 = cplcHpmcVWRmVP(i2)
    SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! VZ, Hpm 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 B0m2 = Real(DerVVSloop(p2,MVZ2,MHpm2(i2)),dp) 
coup1 = cplHpmVWLmVZ(i2)
coup2 = cplcHpmcVWRmVZ(i2)
    SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! VZR, Hpm 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 B0m2 = Real(DerVVSloop(p2,MVZR2,MHpm2(i2)),dp) 
coup1 = cplHpmVWLmVZR(i2)
coup2 = cplcHpmcVWRmVZR(i2)
    SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! conj[VWLm], VP 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(DerVVVloop(p2,MVWLm2,MVP2),dp) 
coup1 = cplcVWLmVPVWLm
coup2 = cplcVWRmVPVWLm
    SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! conj[VWRm], VP 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(DerVVVloop(p2,MVWRm2,MVP2),dp) 
coup1 = cplcVWRmVPVWLm
coup2 = cplcVWRmVPVWRm
    SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! conj[VWLm], VZ 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(DerVVVloop(p2,MVWLm2,MVZ2),dp) 
coup1 = cplcVWLmVWLmVZ
coup2 = cplcVWRmVWLmVZ
    SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! conj[VWRm], VZ 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(DerVVVloop(p2,MVWRm2,MVZ2),dp) 
coup1 = cplcVWRmVWLmVZ
coup2 = cplcVWRmVWRmVZ
    SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! conj[VWLm], VZR 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(DerVVVloop(p2,MVWLm2,MVZR2),dp) 
coup1 = cplcVWLmVWLmVZR
coup2 = cplcVWRmVWLmVZR
    SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! conj[VWRm], VZR 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(DerVVVloop(p2,MVWRm2,MVZR2),dp) 
coup1 = cplcVWRmVWLmVZR
coup2 = cplcVWRmVWRmVZR
    SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! Ah 
!------------------------ 
    Do i1 = 1, 4
 SumI = 0._dp 
 A0m2 = SA_DerA0(MAh2(i1))
 coup1 = cplAhAhcVWRmVWLm(i1,i1)
 SumI = coup1*A0m2 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! hh 
!------------------------ 
    Do i1 = 1, 4
 SumI = 0._dp 
 A0m2 = SA_DerA0(Mhh2(i1))
 coup1 = cplhhhhcVWRmVWLm(i1,i1)
 SumI = coup1*A0m2 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! conj[Hpm] 
!------------------------ 
    Do i1 = 1, 4
 SumI = 0._dp 
 A0m2 = SA_DerA0(MHpm2(i1))
 coup1 = cplHpmcHpmcVWRmVWLm(i1,i1)
 SumI = coup1*A0m2 
res = res +1* SumI  
      End Do 
 !------------------------ 
! VP 
!------------------------ 
SumI = 0._dp 
A0m2 = 3._dp/4._dp*SA_DerA0(MVP2) +RXi/4._dp*SA_DerA0(MVP2*RXi) 
coup1 = cplcVWRmVPVPVWLm3
coup2 = cplcVWRmVPVPVWLm1
coup3 = cplcVWRmVPVPVWLm2
SumI = ((2._dp*DerrMS*coup1+(1-RXi**2)/8._dp*(coup2+coup3))*MVP2-(4._dp*coup1+coup2+coup3)*A0m2)
res = res +1._dp/2._dp* SumI  
!------------------------ 
! conj[VWLm] 
!------------------------ 
SumI = 0._dp 
A0m2 = 3._dp/4._dp*SA_DerA0(MVWLm2) +RXi/4._dp*SA_DerA0(MVWLm2*RXi) 
coup1 = cplcVWLmcVWRmVWLmVWLm2
coup2 = cplcVWLmcVWRmVWLmVWLm3
coup3 = cplcVWLmcVWRmVWLmVWLm1
SumI = ((2._dp*DerrMS*coup1+(1-RXi**2)/8._dp*(coup2+coup3))*MVWLm2-(4._dp*coup1+coup2+coup3)*A0m2)
res = res +1* SumI  
!------------------------ 
! conj[VWRm] 
!------------------------ 
SumI = 0._dp 
A0m2 = 3._dp/4._dp*SA_DerA0(MVWRm2) +RXi/4._dp*SA_DerA0(MVWRm2*RXi) 
coup1 = cplcVWRmcVWRmVWLmVWRm2
coup2 = cplcVWRmcVWRmVWLmVWRm3
coup3 = cplcVWRmcVWRmVWLmVWRm1
SumI = ((2._dp*DerrMS*coup1+(1-RXi**2)/8._dp*(coup2+coup3))*MVWRm2-(4._dp*coup1+coup2+coup3)*A0m2)
res = res +1* SumI  
!------------------------ 
! VZ 
!------------------------ 
SumI = 0._dp 
A0m2 = 3._dp/4._dp*SA_DerA0(MVZ2) +RXi/4._dp*SA_DerA0(MVZ2*RXi) 
coup1 = cplcVWRmVWLmVZVZ1
coup2 = cplcVWRmVWLmVZVZ2
coup3 = cplcVWRmVWLmVZVZ3
SumI = ((2._dp*DerrMS*coup1+(1-RXi**2)/8._dp*(coup2+coup3))*MVZ2-(4._dp*coup1+coup2+coup3)*A0m2)
res = res +1._dp/2._dp* SumI  
!------------------------ 
! VZR 
!------------------------ 
SumI = 0._dp 
A0m2 = 3._dp/4._dp*SA_DerA0(MVZR2) +RXi/4._dp*SA_DerA0(MVZR2*RXi) 
coup1 = cplcVWRmVWLmVZRVZR1
coup2 = cplcVWRmVWLmVZRVZR2
coup3 = cplcVWRmVWLmVZRVZR3
SumI = ((2._dp*DerrMS*coup1+(1-RXi**2)/8._dp*(coup2+coup3))*MVZR2-(4._dp*coup1+coup2+coup3)*A0m2)
res = res +1._dp/2._dp* SumI  
res = oo16pi2*res 
 
End Subroutine DerPi1LoopVWLmVWRm 
 
Subroutine Pi1LoopVZhh(p2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,MHpm,MHpm2,             & 
& MVWLm,MVWLm2,MVWRm,MVWRm2,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZR,             & 
& cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuhhL,cplcFuFuhhR,               & 
& cplcFuFuVZL,cplcFuFuVZR,cplcgWLmgWLmhh,cplcgWLmgWLmVZ,cplcgWLmgWRmhh,cplcgWLmgWRmVZ,   & 
& cplcgWLpgWLphh,cplcgWLpgWLpVZ,cplcgWLpgWRphh,cplcgWLpgWRpVZ,cplcgWRmgWLmhh,            & 
& cplcgWRmgWLmVZ,cplcgWRmgWRmhh,cplcgWRmgWRmVZ,cplcgWRpgWLphh,cplcgWRpgWLpVZ,            & 
& cplcgWRpgWRphh,cplcgWRpgWRpVZ,cplcHpmcVWLmVZ,cplcHpmcVWRmVZ,cplcVWLmVWLmVZ,            & 
& cplcVWLmVWRmVZ,cplcVWRmVWLmVZ,cplcVWRmVWRmVZ,cplFvFvhhL,cplFvFvhhR,cplFvFvVZL,         & 
& cplFvFvVZR,cplhhcHpmcVWLm,cplhhcHpmcVWRm,cplhhcVWLmVWLm,cplhhcVWLmVWRm,cplhhcVWRmVWLm, & 
& cplhhcVWRmVWRm,cplhhHpmcHpm,cplhhHpmVWLm,cplhhHpmVWRm,cplHpmcHpmVZ,cplHpmVWLmVZ,       & 
& cplHpmVWRmVZ,kont,res)

Implicit None 
Real(dp), Intent(in) :: MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),MFv(9),MFv2(9),MHpm(4),MHpm2(4),         & 
& MVWLm,MVWLm2,MVWRm,MVWRm2

Complex(dp), Intent(in) :: cplcFdFdhhL(3,3,4),cplcFdFdhhR(3,3,4),cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),              & 
& cplcFeFehhL(3,3,4),cplcFeFehhR(3,3,4),cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),               & 
& cplcFuFuhhL(3,3,4),cplcFuFuhhR(3,3,4),cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),               & 
& cplcgWLmgWLmhh(4),cplcgWLmgWLmVZ,cplcgWLmgWRmhh(4),cplcgWLmgWRmVZ,cplcgWLpgWLphh(4),   & 
& cplcgWLpgWLpVZ,cplcgWLpgWRphh(4),cplcgWLpgWRpVZ,cplcgWRmgWLmhh(4),cplcgWRmgWLmVZ,      & 
& cplcgWRmgWRmhh(4),cplcgWRmgWRmVZ,cplcgWRpgWLphh(4),cplcgWRpgWLpVZ,cplcgWRpgWRphh(4),   & 
& cplcgWRpgWRpVZ,cplcHpmcVWLmVZ(4),cplcHpmcVWRmVZ(4),cplcVWLmVWLmVZ,cplcVWLmVWRmVZ,      & 
& cplcVWRmVWLmVZ,cplcVWRmVWRmVZ,cplFvFvhhL(9,9,4),cplFvFvhhR(9,9,4),cplFvFvVZL(9,9),     & 
& cplFvFvVZR(9,9),cplhhcHpmcVWLm(4,4),cplhhcHpmcVWRm(4,4),cplhhcVWLmVWLm(4),             & 
& cplhhcVWLmVWRm(4),cplhhcVWRmVWLm(4),cplhhcVWRmVWRm(4),cplhhHpmcHpm(4,4,4),             & 
& cplhhHpmVWLm(4,4),cplhhHpmVWRm(4,4),cplHpmcHpmVZ(4,4),cplHpmVWLmVZ(4),cplHpmVWRmVZ(4)

Integer, Intent(inout) :: kont 
Real(dp) :: B0m2, F0m2, G0m2, B1m2, H0m2, B22m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Complex(dp), Intent(inout) :: res(4) 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2, coup3, temp, sumI 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
res = 0._dp 
 
!------------------------ 
! bar[Fd], Fd 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MFd2(i1),MFd2(i2)),dp) 
B1m2 = Real(SA_B1(p2,MFd2(i1),MFd2(i2)),dp) 
coupL1 = cplcFdFdVZL(i1,i2)
coupR1 = cplcFdFdVZR(i1,i2)
coupL2 = cplcFdFdhhL(i2,i1,gO2)
coupR2 = cplcFdFdhhR(i2,i1,gO2)
    SumI = (coupL1*coupL2+coupR1*coupR2)*MFd(i1)*(B0m2+B1m2) & 
  & + (coupL1*coupR2+coupR1*coupL2)*MFd(i2)*B1m2  
End do 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fe], Fe 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MFe2(i1),MFe2(i2)),dp) 
B1m2 = Real(SA_B1(p2,MFe2(i1),MFe2(i2)),dp) 
coupL1 = cplcFeFeVZL(i1,i2)
coupR1 = cplcFeFeVZR(i1,i2)
coupL2 = cplcFeFehhL(i2,i1,gO2)
coupR2 = cplcFeFehhR(i2,i1,gO2)
    SumI = (coupL1*coupL2+coupR1*coupR2)*MFe(i1)*(B0m2+B1m2) & 
  & + (coupL1*coupR2+coupR1*coupL2)*MFe(i2)*B1m2  
End do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fu], Fu 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MFu2(i1),MFu2(i2)),dp) 
B1m2 = Real(SA_B1(p2,MFu2(i1),MFu2(i2)),dp) 
coupL1 = cplcFuFuVZL(i1,i2)
coupR1 = cplcFuFuVZR(i1,i2)
coupL2 = cplcFuFuhhL(i2,i1,gO2)
coupR2 = cplcFuFuhhR(i2,i1,gO2)
    SumI = (coupL1*coupL2+coupR1*coupR2)*MFu(i1)*(B0m2+B1m2) & 
  & + (coupL1*coupR2+coupR1*coupL2)*MFu(i2)*B1m2  
End do 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! Fv, Fv 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 9
       Do i2 = 1, 9
 Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MFv2(i1),MFv2(i2)),dp) 
B1m2 = Real(SA_B1(p2,MFv2(i1),MFv2(i2)),dp) 
coupL1 = cplFvFvVZL(i1,i2)
coupR1 = cplFvFvVZR(i1,i2)
coupL2 = cplFvFvhhL(i1,i2,gO2)
coupR2 = cplFvFvhhR(i1,i2,gO2)
    SumI = (coupL1*coupL2+coupR1*coupR2)*MFv(i1)*(B0m2+B1m2) & 
  & + (coupL1*coupR2+coupR1*coupL2)*MFv(i2)*B1m2  
End do 
res = res +0.5_dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[gWLm], gWLm 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MVWLm2,MVWLm2),dp) 
B1m2 = Real(SA_B1(p2,MVWLm2,MVWLm2),dp) 
coup1 = cplcgWLmgWLmVZ
coup2 = cplcgWLmgWLmhh(gO2) 
   SumI = -0.5_dp*coup1*coup2*(B0m2+B1m2) 
End do 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWRm], gWLm 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MVWLm2,MVWRm2),dp) 
B1m2 = Real(SA_B1(p2,MVWLm2,MVWRm2),dp) 
coup1 = cplcgWRmgWLmVZ
coup2 = cplcgWLmgWRmhh(gO2) 
   SumI = -0.5_dp*coup1*coup2*(B0m2+B1m2) 
End do 
res = res +2._dp* SumI  
!------------------------ 
! bar[gWLmC], gWLmC 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MVWLm2,MVWLm2),dp) 
B1m2 = Real(SA_B1(p2,MVWLm2,MVWLm2),dp) 
coup1 = cplcgWLpgWLpVZ
coup2 = cplcgWLpgWLphh(gO2) 
   SumI = -0.5_dp*coup1*coup2*(B0m2+B1m2) 
End do 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWRmC], gWLmC 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MVWLm2,MVWRm2),dp) 
B1m2 = Real(SA_B1(p2,MVWLm2,MVWRm2),dp) 
coup1 = cplcgWRpgWLpVZ
coup2 = cplcgWLpgWRphh(gO2) 
   SumI = -0.5_dp*coup1*coup2*(B0m2+B1m2) 
End do 
res = res +2._dp* SumI  
!------------------------ 
! bar[gWLm], gWRm 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MVWRm2,MVWLm2),dp) 
B1m2 = Real(SA_B1(p2,MVWRm2,MVWLm2),dp) 
coup1 = cplcgWLmgWRmVZ
coup2 = cplcgWRmgWLmhh(gO2) 
   SumI = -0.5_dp*coup1*coup2*(B0m2+B1m2) 
End do 
res = res +2._dp* SumI  
!------------------------ 
! bar[gWRm], gWRm 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MVWRm2,MVWRm2),dp) 
B1m2 = Real(SA_B1(p2,MVWRm2,MVWRm2),dp) 
coup1 = cplcgWRmgWRmVZ
coup2 = cplcgWRmgWRmhh(gO2) 
   SumI = -0.5_dp*coup1*coup2*(B0m2+B1m2) 
End do 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWLmC], gWRmC 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MVWRm2,MVWLm2),dp) 
B1m2 = Real(SA_B1(p2,MVWRm2,MVWLm2),dp) 
coup1 = cplcgWLpgWRpVZ
coup2 = cplcgWRpgWLphh(gO2) 
   SumI = -0.5_dp*coup1*coup2*(B0m2+B1m2) 
End do 
res = res +2._dp* SumI  
!------------------------ 
! bar[gWRmC], gWRmC 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MVWRm2,MVWRm2),dp) 
B1m2 = Real(SA_B1(p2,MVWRm2,MVWRm2),dp) 
coup1 = cplcgWRpgWRpVZ
coup2 = cplcgWRpgWRphh(gO2) 
   SumI = -0.5_dp*coup1*coup2*(B0m2+B1m2) 
End do 
res = res +1._dp* SumI  
!------------------------ 
! conj[Hpm], Hpm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
       Do i2 = 1, 4
 Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MHpm2(i2),MHpm2(i1)),dp) 
B1m2 = Real(SA_B1(p2,MHpm2(i2),MHpm2(i1)),dp) 
coup1 = cplHpmcHpmVZ(i2,i1)
coup2 = cplhhHpmcHpm(gO2,i1,i2)
    SumI = -coup1*coup2*(B1m2+0.5_dp*B0m2)
End do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! VWLm, Hpm 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MVWLm2,MHpm2(i2)),dp) 
B1m2 = Real(SA_B1(p2,MVWLm2,MHpm2(i2)),dp) 
coup1 = cplHpmVWLmVZ(i2)
coup2 = cplhhcHpmcVWLm(gO2,i2)
    SumI = coup1*coup2*(B1m2-B0m2) 
End do 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! VWRm, Hpm 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MVWRm2,MHpm2(i2)),dp) 
B1m2 = Real(SA_B1(p2,MVWRm2,MHpm2(i2)),dp) 
coup1 = cplHpmVWRmVZ(i2)
coup2 = cplhhcHpmcVWRm(gO2,i2)
    SumI = coup1*coup2*(B1m2-B0m2) 
End do 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! conj[VWLm], VWLm 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MVWLm2,MVWLm2),dp)
B1m2 = Real(SA_B1(p2,MVWLm2,MVWLm2),dp) 
coup1 = cplcVWLmVWLmVZ
coup2 = cplhhcVWLmVWLm(gO2)
    SumI = coup1*coup2*(3._dp/2._dp*B0m2+3._dp*B1m2) 
End do 
res = res +1._dp* SumI  
!------------------------ 
! conj[VWRm], VWLm 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MVWRm2,MVWLm2),dp)
B1m2 = Real(SA_B1(p2,MVWRm2,MVWLm2),dp) 
coup1 = cplcVWRmVWLmVZ
coup2 = cplhhcVWLmVWRm(gO2)
    SumI = coup1*coup2*(3._dp/2._dp*B0m2+3._dp*B1m2) 
End do 
res = res +2._dp* SumI  
!------------------------ 
! conj[VWLm], VWRm 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MVWLm2,MVWRm2),dp)
B1m2 = Real(SA_B1(p2,MVWLm2,MVWRm2),dp) 
coup1 = cplcVWLmVWRmVZ
coup2 = cplhhcVWRmVWLm(gO2)
    SumI = coup1*coup2*(3._dp/2._dp*B0m2+3._dp*B1m2) 
End do 
res = res +2._dp* SumI  
!------------------------ 
! conj[VWRm], VWRm 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MVWRm2,MVWRm2),dp)
B1m2 = Real(SA_B1(p2,MVWRm2,MVWRm2),dp) 
coup1 = cplcVWRmVWRmVZ
coup2 = cplhhcVWRmVWRm(gO2)
    SumI = coup1*coup2*(3._dp/2._dp*B0m2+3._dp*B1m2) 
End do 
res = res +1._dp* SumI  
!------------------------ 
! conj[VWLm], conj[Hpm] 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MVWLm2,MHpm2(i2)),dp) 
B1m2 = Real(SA_B1(p2,MVWLm2,MHpm2(i2)),dp) 
coup1 = cplcHpmcVWLmVZ(i2)
coup2 = cplhhHpmVWLm(gO2,i2)
    SumI = coup1*coup2*(B1m2-B0m2) 
End do 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! conj[VWRm], conj[Hpm] 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MVWRm2,MHpm2(i2)),dp) 
B1m2 = Real(SA_B1(p2,MVWRm2,MHpm2(i2)),dp) 
coup1 = cplcHpmcVWRmVZ(i2)
coup2 = cplhhHpmVWRm(gO2,i2)
    SumI = coup1*coup2*(B1m2-B0m2) 
End do 
res = res +1._dp* SumI  
    End Do 
 res = oo16pi2*res 
 
End Subroutine Pi1LoopVZhh 
 
Subroutine DerPi1LoopVZhh(p2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,MHpm,MHpm2,          & 
& MVWLm,MVWLm2,MVWRm,MVWRm2,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZR,             & 
& cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuhhL,cplcFuFuhhR,               & 
& cplcFuFuVZL,cplcFuFuVZR,cplcgWLmgWLmhh,cplcgWLmgWLmVZ,cplcgWLmgWRmhh,cplcgWLmgWRmVZ,   & 
& cplcgWLpgWLphh,cplcgWLpgWLpVZ,cplcgWLpgWRphh,cplcgWLpgWRpVZ,cplcgWRmgWLmhh,            & 
& cplcgWRmgWLmVZ,cplcgWRmgWRmhh,cplcgWRmgWRmVZ,cplcgWRpgWLphh,cplcgWRpgWLpVZ,            & 
& cplcgWRpgWRphh,cplcgWRpgWRpVZ,cplcHpmcVWLmVZ,cplcHpmcVWRmVZ,cplcVWLmVWLmVZ,            & 
& cplcVWLmVWRmVZ,cplcVWRmVWLmVZ,cplcVWRmVWRmVZ,cplFvFvhhL,cplFvFvhhR,cplFvFvVZL,         & 
& cplFvFvVZR,cplhhcHpmcVWLm,cplhhcHpmcVWRm,cplhhcVWLmVWLm,cplhhcVWLmVWRm,cplhhcVWRmVWLm, & 
& cplhhcVWRmVWRm,cplhhHpmcHpm,cplhhHpmVWLm,cplhhHpmVWRm,cplHpmcHpmVZ,cplHpmVWLmVZ,       & 
& cplHpmVWRmVZ,kont,res)

Implicit None 
Real(dp), Intent(in) :: MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),MFv(9),MFv2(9),MHpm(4),MHpm2(4),         & 
& MVWLm,MVWLm2,MVWRm,MVWRm2

Complex(dp), Intent(in) :: cplcFdFdhhL(3,3,4),cplcFdFdhhR(3,3,4),cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),              & 
& cplcFeFehhL(3,3,4),cplcFeFehhR(3,3,4),cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),               & 
& cplcFuFuhhL(3,3,4),cplcFuFuhhR(3,3,4),cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),               & 
& cplcgWLmgWLmhh(4),cplcgWLmgWLmVZ,cplcgWLmgWRmhh(4),cplcgWLmgWRmVZ,cplcgWLpgWLphh(4),   & 
& cplcgWLpgWLpVZ,cplcgWLpgWRphh(4),cplcgWLpgWRpVZ,cplcgWRmgWLmhh(4),cplcgWRmgWLmVZ,      & 
& cplcgWRmgWRmhh(4),cplcgWRmgWRmVZ,cplcgWRpgWLphh(4),cplcgWRpgWLpVZ,cplcgWRpgWRphh(4),   & 
& cplcgWRpgWRpVZ,cplcHpmcVWLmVZ(4),cplcHpmcVWRmVZ(4),cplcVWLmVWLmVZ,cplcVWLmVWRmVZ,      & 
& cplcVWRmVWLmVZ,cplcVWRmVWRmVZ,cplFvFvhhL(9,9,4),cplFvFvhhR(9,9,4),cplFvFvVZL(9,9),     & 
& cplFvFvVZR(9,9),cplhhcHpmcVWLm(4,4),cplhhcHpmcVWRm(4,4),cplhhcVWLmVWLm(4),             & 
& cplhhcVWLmVWRm(4),cplhhcVWRmVWLm(4),cplhhcVWRmVWRm(4),cplhhHpmcHpm(4,4,4),             & 
& cplhhHpmVWLm(4,4),cplhhHpmVWRm(4,4),cplHpmcHpmVZ(4,4),cplHpmVWLmVZ(4),cplHpmVWRmVZ(4)

Integer, Intent(inout) :: kont 
Real(dp) :: B0m2, F0m2, G0m2, B1m2, H0m2, B22m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Complex(dp), Intent(inout) :: res(4) 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2, coup3, temp, sumI 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
Real(dp) ::MVG,MVP,MVG2,MVP2
MVG = Mass_Regulator_PhotonGluon 
MVP = Mass_Regulator_PhotonGluon 
MVG2 = Mass_Regulator_PhotonGluon**2 
MVP2 = Mass_Regulator_PhotonGluon**2 

res = 0._dp 
 
!------------------------ 
! bar[Fd], Fd 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MFd2(i1),MFd2(i2)),dp) 
B1m2 = Real(SA_DerB1(p2,MFd2(i1),MFd2(i2)),dp) 
coupL1 = cplcFdFdVZL(i1,i2)
coupR1 = cplcFdFdVZR(i1,i2)
coupL2 = cplcFdFdhhL(i2,i1,gO2)
coupR2 = cplcFdFdhhR(i2,i1,gO2)
    SumI = (coupL1*coupL2+coupR1*coupR2)*MFd(i1)*(B0m2+B1m2) & 
  & + (coupL1*coupR2+coupR1*coupL2)*MFd(i2)*B1m2  
End do 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fe], Fe 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MFe2(i1),MFe2(i2)),dp) 
B1m2 = Real(SA_DerB1(p2,MFe2(i1),MFe2(i2)),dp) 
coupL1 = cplcFeFeVZL(i1,i2)
coupR1 = cplcFeFeVZR(i1,i2)
coupL2 = cplcFeFehhL(i2,i1,gO2)
coupR2 = cplcFeFehhR(i2,i1,gO2)
    SumI = (coupL1*coupL2+coupR1*coupR2)*MFe(i1)*(B0m2+B1m2) & 
  & + (coupL1*coupR2+coupR1*coupL2)*MFe(i2)*B1m2  
End do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fu], Fu 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MFu2(i1),MFu2(i2)),dp) 
B1m2 = Real(SA_DerB1(p2,MFu2(i1),MFu2(i2)),dp) 
coupL1 = cplcFuFuVZL(i1,i2)
coupR1 = cplcFuFuVZR(i1,i2)
coupL2 = cplcFuFuhhL(i2,i1,gO2)
coupR2 = cplcFuFuhhR(i2,i1,gO2)
    SumI = (coupL1*coupL2+coupR1*coupR2)*MFu(i1)*(B0m2+B1m2) & 
  & + (coupL1*coupR2+coupR1*coupL2)*MFu(i2)*B1m2  
End do 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! Fv, Fv 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 9
       Do i2 = 1, 9
 Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MFv2(i1),MFv2(i2)),dp) 
B1m2 = Real(SA_DerB1(p2,MFv2(i1),MFv2(i2)),dp) 
coupL1 = cplFvFvVZL(i1,i2)
coupR1 = cplFvFvVZR(i1,i2)
coupL2 = cplFvFvhhL(i1,i2,gO2)
coupR2 = cplFvFvhhR(i1,i2,gO2)
    SumI = (coupL1*coupL2+coupR1*coupR2)*MFv(i1)*(B0m2+B1m2) & 
  & + (coupL1*coupR2+coupR1*coupL2)*MFv(i2)*B1m2  
End do 
res = res +0.5_dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[gWLm], gWLm 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MVWLm2,MVWLm2),dp) 
B1m2 = Real(SA_DerB1(p2,MVWLm2,MVWLm2),dp) 
coup1 = cplcgWLmgWLmVZ
coup2 = cplcgWLmgWLmhh(gO2) 
   SumI = -0.5_dp*coup1*coup2*(B0m2+B1m2) 
End do 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWRm], gWLm 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MVWLm2,MVWRm2),dp) 
B1m2 = Real(SA_DerB1(p2,MVWLm2,MVWRm2),dp) 
coup1 = cplcgWRmgWLmVZ
coup2 = cplcgWLmgWRmhh(gO2) 
   SumI = -0.5_dp*coup1*coup2*(B0m2+B1m2) 
End do 
res = res +2._dp* SumI  
!------------------------ 
! bar[gWLmC], gWLmC 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MVWLm2,MVWLm2),dp) 
B1m2 = Real(SA_DerB1(p2,MVWLm2,MVWLm2),dp) 
coup1 = cplcgWLpgWLpVZ
coup2 = cplcgWLpgWLphh(gO2) 
   SumI = -0.5_dp*coup1*coup2*(B0m2+B1m2) 
End do 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWRmC], gWLmC 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MVWLm2,MVWRm2),dp) 
B1m2 = Real(SA_DerB1(p2,MVWLm2,MVWRm2),dp) 
coup1 = cplcgWRpgWLpVZ
coup2 = cplcgWLpgWRphh(gO2) 
   SumI = -0.5_dp*coup1*coup2*(B0m2+B1m2) 
End do 
res = res +2._dp* SumI  
!------------------------ 
! bar[gWLm], gWRm 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MVWRm2,MVWLm2),dp) 
B1m2 = Real(SA_DerB1(p2,MVWRm2,MVWLm2),dp) 
coup1 = cplcgWLmgWRmVZ
coup2 = cplcgWRmgWLmhh(gO2) 
   SumI = -0.5_dp*coup1*coup2*(B0m2+B1m2) 
End do 
res = res +2._dp* SumI  
!------------------------ 
! bar[gWRm], gWRm 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MVWRm2,MVWRm2),dp) 
B1m2 = Real(SA_DerB1(p2,MVWRm2,MVWRm2),dp) 
coup1 = cplcgWRmgWRmVZ
coup2 = cplcgWRmgWRmhh(gO2) 
   SumI = -0.5_dp*coup1*coup2*(B0m2+B1m2) 
End do 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWLmC], gWRmC 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MVWRm2,MVWLm2),dp) 
B1m2 = Real(SA_DerB1(p2,MVWRm2,MVWLm2),dp) 
coup1 = cplcgWLpgWRpVZ
coup2 = cplcgWRpgWLphh(gO2) 
   SumI = -0.5_dp*coup1*coup2*(B0m2+B1m2) 
End do 
res = res +2._dp* SumI  
!------------------------ 
! bar[gWRmC], gWRmC 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MVWRm2,MVWRm2),dp) 
B1m2 = Real(SA_DerB1(p2,MVWRm2,MVWRm2),dp) 
coup1 = cplcgWRpgWRpVZ
coup2 = cplcgWRpgWRphh(gO2) 
   SumI = -0.5_dp*coup1*coup2*(B0m2+B1m2) 
End do 
res = res +1._dp* SumI  
!------------------------ 
! conj[Hpm], Hpm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
       Do i2 = 1, 4
 Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MHpm2(i2),MHpm2(i1)),dp) 
B1m2 = Real(SA_DerB1(p2,MHpm2(i2),MHpm2(i1)),dp) 
coup1 = cplHpmcHpmVZ(i2,i1)
coup2 = cplhhHpmcHpm(gO2,i1,i2)
    SumI = -coup1*coup2*(B1m2+0.5_dp*B0m2)
End do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! VWLm, Hpm 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MVWLm2,MHpm2(i2)),dp) 
B1m2 = Real(SA_DerB1(p2,MVWLm2,MHpm2(i2)),dp) 
coup1 = cplHpmVWLmVZ(i2)
coup2 = cplhhcHpmcVWLm(gO2,i2)
    SumI = coup1*coup2*(B1m2-B0m2) 
End do 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! VWRm, Hpm 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MVWRm2,MHpm2(i2)),dp) 
B1m2 = Real(SA_DerB1(p2,MVWRm2,MHpm2(i2)),dp) 
coup1 = cplHpmVWRmVZ(i2)
coup2 = cplhhcHpmcVWRm(gO2,i2)
    SumI = coup1*coup2*(B1m2-B0m2) 
End do 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! conj[VWLm], VWLm 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MVWLm2,MVWLm2),dp)
B1m2 = Real(SA_DerB1(p2,MVWLm2,MVWLm2),dp) 
coup1 = cplcVWLmVWLmVZ
coup2 = cplhhcVWLmVWLm(gO2)
    SumI = coup1*coup2*(3._dp/2._dp*B0m2+3._dp*B1m2) 
End do 
res = res +1._dp* SumI  
!------------------------ 
! conj[VWRm], VWLm 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MVWRm2,MVWLm2),dp)
B1m2 = Real(SA_DerB1(p2,MVWRm2,MVWLm2),dp) 
coup1 = cplcVWRmVWLmVZ
coup2 = cplhhcVWLmVWRm(gO2)
    SumI = coup1*coup2*(3._dp/2._dp*B0m2+3._dp*B1m2) 
End do 
res = res +2._dp* SumI  
!------------------------ 
! conj[VWLm], VWRm 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MVWLm2,MVWRm2),dp)
B1m2 = Real(SA_DerB1(p2,MVWLm2,MVWRm2),dp) 
coup1 = cplcVWLmVWRmVZ
coup2 = cplhhcVWRmVWLm(gO2)
    SumI = coup1*coup2*(3._dp/2._dp*B0m2+3._dp*B1m2) 
End do 
res = res +2._dp* SumI  
!------------------------ 
! conj[VWRm], VWRm 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MVWRm2,MVWRm2),dp)
B1m2 = Real(SA_DerB1(p2,MVWRm2,MVWRm2),dp) 
coup1 = cplcVWRmVWRmVZ
coup2 = cplhhcVWRmVWRm(gO2)
    SumI = coup1*coup2*(3._dp/2._dp*B0m2+3._dp*B1m2) 
End do 
res = res +1._dp* SumI  
!------------------------ 
! conj[VWLm], conj[Hpm] 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MVWLm2,MHpm2(i2)),dp) 
B1m2 = Real(SA_DerB1(p2,MVWLm2,MHpm2(i2)),dp) 
coup1 = cplcHpmcVWLmVZ(i2)
coup2 = cplhhHpmVWLm(gO2,i2)
    SumI = coup1*coup2*(B1m2-B0m2) 
End do 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! conj[VWRm], conj[Hpm] 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MVWRm2,MHpm2(i2)),dp) 
B1m2 = Real(SA_DerB1(p2,MVWRm2,MHpm2(i2)),dp) 
coup1 = cplcHpmcVWRmVZ(i2)
coup2 = cplhhHpmVWRm(gO2,i2)
    SumI = coup1*coup2*(B1m2-B0m2) 
End do 
res = res +1._dp* SumI  
    End Do 
 res = oo16pi2*res 
 
End Subroutine DerPi1LoopVZhh 
 
Subroutine Pi1LoopVZAh(p2,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,               & 
& Mhh,Mhh2,MHpm,MHpm2,MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,MVZR2,cplAhAhhh,           & 
& cplAhcHpmcVWLm,cplAhcHpmcVWRm,cplAhcVWLmVWRm,cplAhcVWRmVWLm,cplAhhhVP,cplAhhhVZ,       & 
& cplAhhhVZR,cplAhHpmcHpm,cplAhHpmVWLm,cplAhHpmVWRm,cplcFdFdAhL,cplcFdFdAhR,             & 
& cplcFdFdVZL,cplcFdFdVZR,cplcFeFeAhL,cplcFeFeAhR,cplcFeFeVZL,cplcFeFeVZR,               & 
& cplcFuFuAhL,cplcFuFuAhR,cplcFuFuVZL,cplcFuFuVZR,cplcgWLmgWLmAh,cplcgWLmgWLmVZ,         & 
& cplcgWLmgWRmAh,cplcgWLmgWRmVZ,cplcgWLpgWLpAh,cplcgWLpgWLpVZ,cplcgWLpgWRpAh,            & 
& cplcgWLpgWRpVZ,cplcgWRmgWLmAh,cplcgWRmgWLmVZ,cplcgWRmgWRmAh,cplcgWRmgWRmVZ,            & 
& cplcgWRpgWLpAh,cplcgWRpgWLpVZ,cplcgWRpgWRpAh,cplcgWRpgWRpVZ,cplcHpmcVWLmVZ,            & 
& cplcHpmcVWRmVZ,cplcVWLmVWRmVZ,cplcVWRmVWLmVZ,cplFvFvAhL,cplFvFvAhR,cplFvFvVZL,         & 
& cplFvFvVZR,cplhhVPVZ,cplhhVZVZ,cplhhVZVZR,cplHpmcHpmVZ,cplHpmVWLmVZ,cplHpmVWRmVZ,kont,res)

Implicit None 
Real(dp), Intent(in) :: MAh(4),MAh2(4),MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),MFv(9),MFv2(9),           & 
& Mhh(4),Mhh2(4),MHpm(4),MHpm2(4),MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,MVZR2

Complex(dp), Intent(in) :: cplAhAhhh(4,4,4),cplAhcHpmcVWLm(4,4),cplAhcHpmcVWRm(4,4),cplAhcVWLmVWRm(4),           & 
& cplAhcVWRmVWLm(4),cplAhhhVP(4,4),cplAhhhVZ(4,4),cplAhhhVZR(4,4),cplAhHpmcHpm(4,4,4),   & 
& cplAhHpmVWLm(4,4),cplAhHpmVWRm(4,4),cplcFdFdAhL(3,3,4),cplcFdFdAhR(3,3,4),             & 
& cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),cplcFeFeAhL(3,3,4),cplcFeFeAhR(3,3,4),               & 
& cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),cplcFuFuAhL(3,3,4),cplcFuFuAhR(3,3,4),               & 
& cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),cplcgWLmgWLmAh(4),cplcgWLmgWLmVZ,cplcgWLmgWRmAh(4),  & 
& cplcgWLmgWRmVZ,cplcgWLpgWLpAh(4),cplcgWLpgWLpVZ,cplcgWLpgWRpAh(4),cplcgWLpgWRpVZ,      & 
& cplcgWRmgWLmAh(4),cplcgWRmgWLmVZ,cplcgWRmgWRmAh(4),cplcgWRmgWRmVZ,cplcgWRpgWLpAh(4),   & 
& cplcgWRpgWLpVZ,cplcgWRpgWRpAh(4),cplcgWRpgWRpVZ,cplcHpmcVWLmVZ(4),cplcHpmcVWRmVZ(4),   & 
& cplcVWLmVWRmVZ,cplcVWRmVWLmVZ,cplFvFvAhL(9,9,4),cplFvFvAhR(9,9,4),cplFvFvVZL(9,9),     & 
& cplFvFvVZR(9,9),cplhhVPVZ(4),cplhhVZVZ(4),cplhhVZVZR(4),cplHpmcHpmVZ(4,4),             & 
& cplHpmVWLmVZ(4),cplHpmVWRmVZ(4)

Integer, Intent(inout) :: kont 
Real(dp) :: B0m2, F0m2, G0m2, B1m2, H0m2, B22m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Complex(dp), Intent(inout) :: res(4) 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2, coup3, temp, sumI 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
res = 0._dp 
 
!------------------------ 
! hh, Ah 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
       Do i2 = 1, 4
 Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MAh2(i2),Mhh2(i1)),dp) 
B1m2 = Real(SA_B1(p2,MAh2(i2),Mhh2(i1)),dp) 
coup1 = cplAhhhVZ(i2,i1)
coup2 = cplAhAhhh(gO2,i2,i1)
    SumI = -coup1*coup2*(B1m2+0.5_dp*B0m2)
End do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fd], Fd 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MFd2(i1),MFd2(i2)),dp) 
B1m2 = Real(SA_B1(p2,MFd2(i1),MFd2(i2)),dp) 
coupL1 = cplcFdFdVZL(i1,i2)
coupR1 = cplcFdFdVZR(i1,i2)
coupL2 = cplcFdFdAhL(i2,i1,gO2)
coupR2 = cplcFdFdAhR(i2,i1,gO2)
    SumI = (coupL1*coupL2+coupR1*coupR2)*MFd(i1)*(B0m2+B1m2) & 
  & + (coupL1*coupR2+coupR1*coupL2)*MFd(i2)*B1m2  
End do 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fe], Fe 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MFe2(i1),MFe2(i2)),dp) 
B1m2 = Real(SA_B1(p2,MFe2(i1),MFe2(i2)),dp) 
coupL1 = cplcFeFeVZL(i1,i2)
coupR1 = cplcFeFeVZR(i1,i2)
coupL2 = cplcFeFeAhL(i2,i1,gO2)
coupR2 = cplcFeFeAhR(i2,i1,gO2)
    SumI = (coupL1*coupL2+coupR1*coupR2)*MFe(i1)*(B0m2+B1m2) & 
  & + (coupL1*coupR2+coupR1*coupL2)*MFe(i2)*B1m2  
End do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fu], Fu 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MFu2(i1),MFu2(i2)),dp) 
B1m2 = Real(SA_B1(p2,MFu2(i1),MFu2(i2)),dp) 
coupL1 = cplcFuFuVZL(i1,i2)
coupR1 = cplcFuFuVZR(i1,i2)
coupL2 = cplcFuFuAhL(i2,i1,gO2)
coupR2 = cplcFuFuAhR(i2,i1,gO2)
    SumI = (coupL1*coupL2+coupR1*coupR2)*MFu(i1)*(B0m2+B1m2) & 
  & + (coupL1*coupR2+coupR1*coupL2)*MFu(i2)*B1m2  
End do 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! Fv, Fv 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 9
       Do i2 = 1, 9
 Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MFv2(i1),MFv2(i2)),dp) 
B1m2 = Real(SA_B1(p2,MFv2(i1),MFv2(i2)),dp) 
coupL1 = cplFvFvVZL(i1,i2)
coupR1 = cplFvFvVZR(i1,i2)
coupL2 = cplFvFvAhL(i1,i2,gO2)
coupR2 = cplFvFvAhR(i1,i2,gO2)
    SumI = (coupL1*coupL2+coupR1*coupR2)*MFv(i1)*(B0m2+B1m2) & 
  & + (coupL1*coupR2+coupR1*coupL2)*MFv(i2)*B1m2  
End do 
res = res +0.5_dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[gWLm], gWLm 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MVWLm2,MVWLm2),dp) 
B1m2 = Real(SA_B1(p2,MVWLm2,MVWLm2),dp) 
coup1 = cplcgWLmgWLmVZ
coup2 = cplcgWLmgWLmAh(gO2) 
   SumI = -0.5_dp*coup1*coup2*(B0m2+B1m2) 
End do 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWRm], gWLm 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MVWLm2,MVWRm2),dp) 
B1m2 = Real(SA_B1(p2,MVWLm2,MVWRm2),dp) 
coup1 = cplcgWRmgWLmVZ
coup2 = cplcgWLmgWRmAh(gO2) 
   SumI = -0.5_dp*coup1*coup2*(B0m2+B1m2) 
End do 
res = res +2._dp* SumI  
!------------------------ 
! bar[gWLmC], gWLmC 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MVWLm2,MVWLm2),dp) 
B1m2 = Real(SA_B1(p2,MVWLm2,MVWLm2),dp) 
coup1 = cplcgWLpgWLpVZ
coup2 = cplcgWLpgWLpAh(gO2) 
   SumI = -0.5_dp*coup1*coup2*(B0m2+B1m2) 
End do 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWRmC], gWLmC 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MVWLm2,MVWRm2),dp) 
B1m2 = Real(SA_B1(p2,MVWLm2,MVWRm2),dp) 
coup1 = cplcgWRpgWLpVZ
coup2 = cplcgWLpgWRpAh(gO2) 
   SumI = -0.5_dp*coup1*coup2*(B0m2+B1m2) 
End do 
res = res +2._dp* SumI  
!------------------------ 
! bar[gWLm], gWRm 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MVWRm2,MVWLm2),dp) 
B1m2 = Real(SA_B1(p2,MVWRm2,MVWLm2),dp) 
coup1 = cplcgWLmgWRmVZ
coup2 = cplcgWRmgWLmAh(gO2) 
   SumI = -0.5_dp*coup1*coup2*(B0m2+B1m2) 
End do 
res = res +2._dp* SumI  
!------------------------ 
! bar[gWRm], gWRm 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MVWRm2,MVWRm2),dp) 
B1m2 = Real(SA_B1(p2,MVWRm2,MVWRm2),dp) 
coup1 = cplcgWRmgWRmVZ
coup2 = cplcgWRmgWRmAh(gO2) 
   SumI = -0.5_dp*coup1*coup2*(B0m2+B1m2) 
End do 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWLmC], gWRmC 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MVWRm2,MVWLm2),dp) 
B1m2 = Real(SA_B1(p2,MVWRm2,MVWLm2),dp) 
coup1 = cplcgWLpgWRpVZ
coup2 = cplcgWRpgWLpAh(gO2) 
   SumI = -0.5_dp*coup1*coup2*(B0m2+B1m2) 
End do 
res = res +2._dp* SumI  
!------------------------ 
! bar[gWRmC], gWRmC 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MVWRm2,MVWRm2),dp) 
B1m2 = Real(SA_B1(p2,MVWRm2,MVWRm2),dp) 
coup1 = cplcgWRpgWRpVZ
coup2 = cplcgWRpgWRpAh(gO2) 
   SumI = -0.5_dp*coup1*coup2*(B0m2+B1m2) 
End do 
res = res +1._dp* SumI  
!------------------------ 
! VP, hh 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 Do gO2=1,4 
B0m2 = Real(SA_B0(p2,0._dp,Mhh2(i2)),dp) 
B1m2 = Real(SA_B1(p2,0._dp,Mhh2(i2)),dp) 
coup1 = cplhhVPVZ(i2)
coup2 = cplAhhhVP(gO2,i2)
    SumI = coup1*coup2*(B1m2-B0m2) 
End do 
res = res +0.5_dp* SumI  
    End Do 
 !------------------------ 
! VZ, hh 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MVZ2,Mhh2(i2)),dp) 
B1m2 = Real(SA_B1(p2,MVZ2,Mhh2(i2)),dp) 
coup1 = cplhhVZVZ(i2)
coup2 = cplAhhhVZ(gO2,i2)
    SumI = coup1*coup2*(B1m2-B0m2) 
End do 
res = res +0.5_dp* SumI  
    End Do 
 !------------------------ 
! VZR, hh 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MVZR2,Mhh2(i2)),dp) 
B1m2 = Real(SA_B1(p2,MVZR2,Mhh2(i2)),dp) 
coup1 = cplhhVZVZR(i2)
coup2 = cplAhhhVZR(gO2,i2)
    SumI = coup1*coup2*(B1m2-B0m2) 
End do 
res = res +0.5_dp* SumI  
    End Do 
 !------------------------ 
! conj[Hpm], Hpm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
       Do i2 = 1, 4
 Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MHpm2(i2),MHpm2(i1)),dp) 
B1m2 = Real(SA_B1(p2,MHpm2(i2),MHpm2(i1)),dp) 
coup1 = cplHpmcHpmVZ(i2,i1)
coup2 = cplAhHpmcHpm(gO2,i1,i2)
    SumI = -coup1*coup2*(B1m2+0.5_dp*B0m2)
End do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! VWLm, Hpm 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MVWLm2,MHpm2(i2)),dp) 
B1m2 = Real(SA_B1(p2,MVWLm2,MHpm2(i2)),dp) 
coup1 = cplHpmVWLmVZ(i2)
coup2 = cplAhcHpmcVWLm(gO2,i2)
    SumI = coup1*coup2*(B1m2-B0m2) 
End do 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! VWRm, Hpm 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MVWRm2,MHpm2(i2)),dp) 
B1m2 = Real(SA_B1(p2,MVWRm2,MHpm2(i2)),dp) 
coup1 = cplHpmVWRmVZ(i2)
coup2 = cplAhcHpmcVWRm(gO2,i2)
    SumI = coup1*coup2*(B1m2-B0m2) 
End do 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! conj[VWRm], VWLm 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MVWRm2,MVWLm2),dp)
B1m2 = Real(SA_B1(p2,MVWRm2,MVWLm2),dp) 
coup1 = cplcVWRmVWLmVZ
coup2 = cplAhcVWLmVWRm(gO2)
    SumI = coup1*coup2*(3._dp/2._dp*B0m2+3._dp*B1m2) 
End do 
res = res +2._dp* SumI  
!------------------------ 
! conj[VWLm], VWRm 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MVWLm2,MVWRm2),dp)
B1m2 = Real(SA_B1(p2,MVWLm2,MVWRm2),dp) 
coup1 = cplcVWLmVWRmVZ
coup2 = cplAhcVWRmVWLm(gO2)
    SumI = coup1*coup2*(3._dp/2._dp*B0m2+3._dp*B1m2) 
End do 
res = res +2._dp* SumI  
!------------------------ 
! conj[VWLm], conj[Hpm] 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MVWLm2,MHpm2(i2)),dp) 
B1m2 = Real(SA_B1(p2,MVWLm2,MHpm2(i2)),dp) 
coup1 = cplcHpmcVWLmVZ(i2)
coup2 = cplAhHpmVWLm(gO2,i2)
    SumI = coup1*coup2*(B1m2-B0m2) 
End do 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! conj[VWRm], conj[Hpm] 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MVWRm2,MHpm2(i2)),dp) 
B1m2 = Real(SA_B1(p2,MVWRm2,MHpm2(i2)),dp) 
coup1 = cplcHpmcVWRmVZ(i2)
coup2 = cplAhHpmVWRm(gO2,i2)
    SumI = coup1*coup2*(B1m2-B0m2) 
End do 
res = res +1._dp* SumI  
    End Do 
 res = oo16pi2*res 
 
End Subroutine Pi1LoopVZAh 
 
Subroutine DerPi1LoopVZAh(p2,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,            & 
& Mhh,Mhh2,MHpm,MHpm2,MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,MVZR2,cplAhAhhh,           & 
& cplAhcHpmcVWLm,cplAhcHpmcVWRm,cplAhcVWLmVWRm,cplAhcVWRmVWLm,cplAhhhVP,cplAhhhVZ,       & 
& cplAhhhVZR,cplAhHpmcHpm,cplAhHpmVWLm,cplAhHpmVWRm,cplcFdFdAhL,cplcFdFdAhR,             & 
& cplcFdFdVZL,cplcFdFdVZR,cplcFeFeAhL,cplcFeFeAhR,cplcFeFeVZL,cplcFeFeVZR,               & 
& cplcFuFuAhL,cplcFuFuAhR,cplcFuFuVZL,cplcFuFuVZR,cplcgWLmgWLmAh,cplcgWLmgWLmVZ,         & 
& cplcgWLmgWRmAh,cplcgWLmgWRmVZ,cplcgWLpgWLpAh,cplcgWLpgWLpVZ,cplcgWLpgWRpAh,            & 
& cplcgWLpgWRpVZ,cplcgWRmgWLmAh,cplcgWRmgWLmVZ,cplcgWRmgWRmAh,cplcgWRmgWRmVZ,            & 
& cplcgWRpgWLpAh,cplcgWRpgWLpVZ,cplcgWRpgWRpAh,cplcgWRpgWRpVZ,cplcHpmcVWLmVZ,            & 
& cplcHpmcVWRmVZ,cplcVWLmVWRmVZ,cplcVWRmVWLmVZ,cplFvFvAhL,cplFvFvAhR,cplFvFvVZL,         & 
& cplFvFvVZR,cplhhVPVZ,cplhhVZVZ,cplhhVZVZR,cplHpmcHpmVZ,cplHpmVWLmVZ,cplHpmVWRmVZ,kont,res)

Implicit None 
Real(dp), Intent(in) :: MAh(4),MAh2(4),MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),MFv(9),MFv2(9),           & 
& Mhh(4),Mhh2(4),MHpm(4),MHpm2(4),MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,MVZR2

Complex(dp), Intent(in) :: cplAhAhhh(4,4,4),cplAhcHpmcVWLm(4,4),cplAhcHpmcVWRm(4,4),cplAhcVWLmVWRm(4),           & 
& cplAhcVWRmVWLm(4),cplAhhhVP(4,4),cplAhhhVZ(4,4),cplAhhhVZR(4,4),cplAhHpmcHpm(4,4,4),   & 
& cplAhHpmVWLm(4,4),cplAhHpmVWRm(4,4),cplcFdFdAhL(3,3,4),cplcFdFdAhR(3,3,4),             & 
& cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),cplcFeFeAhL(3,3,4),cplcFeFeAhR(3,3,4),               & 
& cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),cplcFuFuAhL(3,3,4),cplcFuFuAhR(3,3,4),               & 
& cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),cplcgWLmgWLmAh(4),cplcgWLmgWLmVZ,cplcgWLmgWRmAh(4),  & 
& cplcgWLmgWRmVZ,cplcgWLpgWLpAh(4),cplcgWLpgWLpVZ,cplcgWLpgWRpAh(4),cplcgWLpgWRpVZ,      & 
& cplcgWRmgWLmAh(4),cplcgWRmgWLmVZ,cplcgWRmgWRmAh(4),cplcgWRmgWRmVZ,cplcgWRpgWLpAh(4),   & 
& cplcgWRpgWLpVZ,cplcgWRpgWRpAh(4),cplcgWRpgWRpVZ,cplcHpmcVWLmVZ(4),cplcHpmcVWRmVZ(4),   & 
& cplcVWLmVWRmVZ,cplcVWRmVWLmVZ,cplFvFvAhL(9,9,4),cplFvFvAhR(9,9,4),cplFvFvVZL(9,9),     & 
& cplFvFvVZR(9,9),cplhhVPVZ(4),cplhhVZVZ(4),cplhhVZVZR(4),cplHpmcHpmVZ(4,4),             & 
& cplHpmVWLmVZ(4),cplHpmVWRmVZ(4)

Integer, Intent(inout) :: kont 
Real(dp) :: B0m2, F0m2, G0m2, B1m2, H0m2, B22m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Complex(dp), Intent(inout) :: res(4) 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2, coup3, temp, sumI 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
Real(dp) ::MVG,MVP,MVG2,MVP2
MVG = Mass_Regulator_PhotonGluon 
MVP = Mass_Regulator_PhotonGluon 
MVG2 = Mass_Regulator_PhotonGluon**2 
MVP2 = Mass_Regulator_PhotonGluon**2 

res = 0._dp 
 
!------------------------ 
! hh, Ah 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
       Do i2 = 1, 4
 Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MAh2(i2),Mhh2(i1)),dp) 
B1m2 = Real(SA_DerB1(p2,MAh2(i2),Mhh2(i1)),dp) 
coup1 = cplAhhhVZ(i2,i1)
coup2 = cplAhAhhh(gO2,i2,i1)
    SumI = -coup1*coup2*(B1m2+0.5_dp*B0m2)
End do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fd], Fd 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MFd2(i1),MFd2(i2)),dp) 
B1m2 = Real(SA_DerB1(p2,MFd2(i1),MFd2(i2)),dp) 
coupL1 = cplcFdFdVZL(i1,i2)
coupR1 = cplcFdFdVZR(i1,i2)
coupL2 = cplcFdFdAhL(i2,i1,gO2)
coupR2 = cplcFdFdAhR(i2,i1,gO2)
    SumI = (coupL1*coupL2+coupR1*coupR2)*MFd(i1)*(B0m2+B1m2) & 
  & + (coupL1*coupR2+coupR1*coupL2)*MFd(i2)*B1m2  
End do 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fe], Fe 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MFe2(i1),MFe2(i2)),dp) 
B1m2 = Real(SA_DerB1(p2,MFe2(i1),MFe2(i2)),dp) 
coupL1 = cplcFeFeVZL(i1,i2)
coupR1 = cplcFeFeVZR(i1,i2)
coupL2 = cplcFeFeAhL(i2,i1,gO2)
coupR2 = cplcFeFeAhR(i2,i1,gO2)
    SumI = (coupL1*coupL2+coupR1*coupR2)*MFe(i1)*(B0m2+B1m2) & 
  & + (coupL1*coupR2+coupR1*coupL2)*MFe(i2)*B1m2  
End do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fu], Fu 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MFu2(i1),MFu2(i2)),dp) 
B1m2 = Real(SA_DerB1(p2,MFu2(i1),MFu2(i2)),dp) 
coupL1 = cplcFuFuVZL(i1,i2)
coupR1 = cplcFuFuVZR(i1,i2)
coupL2 = cplcFuFuAhL(i2,i1,gO2)
coupR2 = cplcFuFuAhR(i2,i1,gO2)
    SumI = (coupL1*coupL2+coupR1*coupR2)*MFu(i1)*(B0m2+B1m2) & 
  & + (coupL1*coupR2+coupR1*coupL2)*MFu(i2)*B1m2  
End do 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! Fv, Fv 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 9
       Do i2 = 1, 9
 Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MFv2(i1),MFv2(i2)),dp) 
B1m2 = Real(SA_DerB1(p2,MFv2(i1),MFv2(i2)),dp) 
coupL1 = cplFvFvVZL(i1,i2)
coupR1 = cplFvFvVZR(i1,i2)
coupL2 = cplFvFvAhL(i1,i2,gO2)
coupR2 = cplFvFvAhR(i1,i2,gO2)
    SumI = (coupL1*coupL2+coupR1*coupR2)*MFv(i1)*(B0m2+B1m2) & 
  & + (coupL1*coupR2+coupR1*coupL2)*MFv(i2)*B1m2  
End do 
res = res +0.5_dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[gWLm], gWLm 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MVWLm2,MVWLm2),dp) 
B1m2 = Real(SA_DerB1(p2,MVWLm2,MVWLm2),dp) 
coup1 = cplcgWLmgWLmVZ
coup2 = cplcgWLmgWLmAh(gO2) 
   SumI = -0.5_dp*coup1*coup2*(B0m2+B1m2) 
End do 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWRm], gWLm 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MVWLm2,MVWRm2),dp) 
B1m2 = Real(SA_DerB1(p2,MVWLm2,MVWRm2),dp) 
coup1 = cplcgWRmgWLmVZ
coup2 = cplcgWLmgWRmAh(gO2) 
   SumI = -0.5_dp*coup1*coup2*(B0m2+B1m2) 
End do 
res = res +2._dp* SumI  
!------------------------ 
! bar[gWLmC], gWLmC 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MVWLm2,MVWLm2),dp) 
B1m2 = Real(SA_DerB1(p2,MVWLm2,MVWLm2),dp) 
coup1 = cplcgWLpgWLpVZ
coup2 = cplcgWLpgWLpAh(gO2) 
   SumI = -0.5_dp*coup1*coup2*(B0m2+B1m2) 
End do 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWRmC], gWLmC 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MVWLm2,MVWRm2),dp) 
B1m2 = Real(SA_DerB1(p2,MVWLm2,MVWRm2),dp) 
coup1 = cplcgWRpgWLpVZ
coup2 = cplcgWLpgWRpAh(gO2) 
   SumI = -0.5_dp*coup1*coup2*(B0m2+B1m2) 
End do 
res = res +2._dp* SumI  
!------------------------ 
! bar[gWLm], gWRm 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MVWRm2,MVWLm2),dp) 
B1m2 = Real(SA_DerB1(p2,MVWRm2,MVWLm2),dp) 
coup1 = cplcgWLmgWRmVZ
coup2 = cplcgWRmgWLmAh(gO2) 
   SumI = -0.5_dp*coup1*coup2*(B0m2+B1m2) 
End do 
res = res +2._dp* SumI  
!------------------------ 
! bar[gWRm], gWRm 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MVWRm2,MVWRm2),dp) 
B1m2 = Real(SA_DerB1(p2,MVWRm2,MVWRm2),dp) 
coup1 = cplcgWRmgWRmVZ
coup2 = cplcgWRmgWRmAh(gO2) 
   SumI = -0.5_dp*coup1*coup2*(B0m2+B1m2) 
End do 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWLmC], gWRmC 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MVWRm2,MVWLm2),dp) 
B1m2 = Real(SA_DerB1(p2,MVWRm2,MVWLm2),dp) 
coup1 = cplcgWLpgWRpVZ
coup2 = cplcgWRpgWLpAh(gO2) 
   SumI = -0.5_dp*coup1*coup2*(B0m2+B1m2) 
End do 
res = res +2._dp* SumI  
!------------------------ 
! bar[gWRmC], gWRmC 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MVWRm2,MVWRm2),dp) 
B1m2 = Real(SA_DerB1(p2,MVWRm2,MVWRm2),dp) 
coup1 = cplcgWRpgWRpVZ
coup2 = cplcgWRpgWRpAh(gO2) 
   SumI = -0.5_dp*coup1*coup2*(B0m2+B1m2) 
End do 
res = res +1._dp* SumI  
!------------------------ 
! VP, hh 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MVP2,Mhh2(i2)),dp) 
B1m2 = Real(SA_DerB1(p2,MVP2,Mhh2(i2)),dp) 
coup1 = cplhhVPVZ(i2)
coup2 = cplAhhhVP(gO2,i2)
    SumI = coup1*coup2*(B1m2-B0m2) 
End do 
res = res +0.5_dp* SumI  
    End Do 
 !------------------------ 
! VZ, hh 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MVZ2,Mhh2(i2)),dp) 
B1m2 = Real(SA_DerB1(p2,MVZ2,Mhh2(i2)),dp) 
coup1 = cplhhVZVZ(i2)
coup2 = cplAhhhVZ(gO2,i2)
    SumI = coup1*coup2*(B1m2-B0m2) 
End do 
res = res +0.5_dp* SumI  
    End Do 
 !------------------------ 
! VZR, hh 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MVZR2,Mhh2(i2)),dp) 
B1m2 = Real(SA_DerB1(p2,MVZR2,Mhh2(i2)),dp) 
coup1 = cplhhVZVZR(i2)
coup2 = cplAhhhVZR(gO2,i2)
    SumI = coup1*coup2*(B1m2-B0m2) 
End do 
res = res +0.5_dp* SumI  
    End Do 
 !------------------------ 
! conj[Hpm], Hpm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
       Do i2 = 1, 4
 Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MHpm2(i2),MHpm2(i1)),dp) 
B1m2 = Real(SA_DerB1(p2,MHpm2(i2),MHpm2(i1)),dp) 
coup1 = cplHpmcHpmVZ(i2,i1)
coup2 = cplAhHpmcHpm(gO2,i1,i2)
    SumI = -coup1*coup2*(B1m2+0.5_dp*B0m2)
End do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! VWLm, Hpm 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MVWLm2,MHpm2(i2)),dp) 
B1m2 = Real(SA_DerB1(p2,MVWLm2,MHpm2(i2)),dp) 
coup1 = cplHpmVWLmVZ(i2)
coup2 = cplAhcHpmcVWLm(gO2,i2)
    SumI = coup1*coup2*(B1m2-B0m2) 
End do 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! VWRm, Hpm 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MVWRm2,MHpm2(i2)),dp) 
B1m2 = Real(SA_DerB1(p2,MVWRm2,MHpm2(i2)),dp) 
coup1 = cplHpmVWRmVZ(i2)
coup2 = cplAhcHpmcVWRm(gO2,i2)
    SumI = coup1*coup2*(B1m2-B0m2) 
End do 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! conj[VWRm], VWLm 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MVWRm2,MVWLm2),dp)
B1m2 = Real(SA_DerB1(p2,MVWRm2,MVWLm2),dp) 
coup1 = cplcVWRmVWLmVZ
coup2 = cplAhcVWLmVWRm(gO2)
    SumI = coup1*coup2*(3._dp/2._dp*B0m2+3._dp*B1m2) 
End do 
res = res +2._dp* SumI  
!------------------------ 
! conj[VWLm], VWRm 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MVWLm2,MVWRm2),dp)
B1m2 = Real(SA_DerB1(p2,MVWLm2,MVWRm2),dp) 
coup1 = cplcVWLmVWRmVZ
coup2 = cplAhcVWRmVWLm(gO2)
    SumI = coup1*coup2*(3._dp/2._dp*B0m2+3._dp*B1m2) 
End do 
res = res +2._dp* SumI  
!------------------------ 
! conj[VWLm], conj[Hpm] 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MVWLm2,MHpm2(i2)),dp) 
B1m2 = Real(SA_DerB1(p2,MVWLm2,MHpm2(i2)),dp) 
coup1 = cplcHpmcVWLmVZ(i2)
coup2 = cplAhHpmVWLm(gO2,i2)
    SumI = coup1*coup2*(B1m2-B0m2) 
End do 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! conj[VWRm], conj[Hpm] 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MVWRm2,MHpm2(i2)),dp) 
B1m2 = Real(SA_DerB1(p2,MVWRm2,MHpm2(i2)),dp) 
coup1 = cplcHpmcVWRmVZ(i2)
coup2 = cplAhHpmVWRm(gO2,i2)
    SumI = coup1*coup2*(B1m2-B0m2) 
End do 
res = res +1._dp* SumI  
    End Do 
 res = oo16pi2*res 
 
End Subroutine DerPi1LoopVZAh 
 
Subroutine Pi1LoopVZHpm(p2,MAh,MAh2,Mhh,Mhh2,MHpm,MHpm2,cplAhhhcHpm,cplAhhhVZ,        & 
& cplHpmcHpmcHpm,cplHpmcHpmVZ,kont,res)

Implicit None 
Real(dp), Intent(in) :: MAh(4),MAh2(4),Mhh(4),Mhh2(4),MHpm(4),MHpm2(4)

Complex(dp), Intent(in) :: cplAhhhcHpm(4,4,4),cplAhhhVZ(4,4),cplHpmcHpmcHpm(4,4,4),cplHpmcHpmVZ(4,4)

Integer, Intent(inout) :: kont 
Real(dp) :: B0m2, F0m2, G0m2, B1m2, H0m2, B22m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Complex(dp), Intent(inout) :: res(4) 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2, coup3, temp, sumI 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
res = 0._dp 
 
!------------------------ 
! hh, Ah 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
       Do i2 = 1, 4
 Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MAh2(i2),Mhh2(i1)),dp) 
B1m2 = Real(SA_B1(p2,MAh2(i2),Mhh2(i1)),dp) 
coup1 = cplAhhhVZ(i2,i1)
coup2 = cplAhhhcHpm(i2,i1,gO2)
    SumI = -coup1*coup2*(B1m2+0.5_dp*B0m2)
End do 
res = res +0.5_dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[Hpm], Hpm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
       Do i2 = 1, 4
 Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MHpm2(i2),MHpm2(i1)),dp) 
B1m2 = Real(SA_B1(p2,MHpm2(i2),MHpm2(i1)),dp) 
coup1 = cplHpmcHpmVZ(i2,i1)
coup2 = cplHpmcHpmcHpm(i1,gO2,i2)
    SumI = -coup1*coup2*(B1m2+0.5_dp*B0m2)
End do 
res = res +0.5_dp* SumI  
      End Do 
     End Do 
 res = oo16pi2*res 
 
End Subroutine Pi1LoopVZHpm 
 
Subroutine DerPi1LoopVZHpm(p2,MAh,MAh2,Mhh,Mhh2,MHpm,MHpm2,cplAhhhcHpm,               & 
& cplAhhhVZ,cplHpmcHpmcHpm,cplHpmcHpmVZ,kont,res)

Implicit None 
Real(dp), Intent(in) :: MAh(4),MAh2(4),Mhh(4),Mhh2(4),MHpm(4),MHpm2(4)

Complex(dp), Intent(in) :: cplAhhhcHpm(4,4,4),cplAhhhVZ(4,4),cplHpmcHpmcHpm(4,4,4),cplHpmcHpmVZ(4,4)

Integer, Intent(inout) :: kont 
Real(dp) :: B0m2, F0m2, G0m2, B1m2, H0m2, B22m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Complex(dp), Intent(inout) :: res(4) 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2, coup3, temp, sumI 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
Real(dp) ::MVG,MVP,MVG2,MVP2
MVG = Mass_Regulator_PhotonGluon 
MVP = Mass_Regulator_PhotonGluon 
MVG2 = Mass_Regulator_PhotonGluon**2 
MVP2 = Mass_Regulator_PhotonGluon**2 

res = 0._dp 
 
!------------------------ 
! hh, Ah 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
       Do i2 = 1, 4
 Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MAh2(i2),Mhh2(i1)),dp) 
B1m2 = Real(SA_DerB1(p2,MAh2(i2),Mhh2(i1)),dp) 
coup1 = cplAhhhVZ(i2,i1)
coup2 = cplAhhhcHpm(i2,i1,gO2)
    SumI = -coup1*coup2*(B1m2+0.5_dp*B0m2)
End do 
res = res +0.5_dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[Hpm], Hpm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
       Do i2 = 1, 4
 Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MHpm2(i2),MHpm2(i1)),dp) 
B1m2 = Real(SA_DerB1(p2,MHpm2(i2),MHpm2(i1)),dp) 
coup1 = cplHpmcHpmVZ(i2,i1)
coup2 = cplHpmcHpmcHpm(i1,gO2,i2)
    SumI = -coup1*coup2*(B1m2+0.5_dp*B0m2)
End do 
res = res +0.5_dp* SumI  
      End Do 
     End Do 
 res = oo16pi2*res 
 
End Subroutine DerPi1LoopVZHpm 
 
Subroutine Pi1LoopVZRhh(p2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,MHpm,MHpm2,            & 
& MVWLm,MVWLm2,MVWRm,MVWRm2,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZRL,cplcFdFdVZRR,           & 
& cplcFeFehhL,cplcFeFehhR,cplcFeFeVZRL,cplcFeFeVZRR,cplcFuFuhhL,cplcFuFuhhR,             & 
& cplcFuFuVZRL,cplcFuFuVZRR,cplcgWLmgWLmhh,cplcgWLmgWLmVZR,cplcgWLmgWRmhh,               & 
& cplcgWLmgWRmVZR,cplcgWLpgWLphh,cplcgWLpgWLpVZR,cplcgWLpgWRphh,cplcgWLpgWRpVZR,         & 
& cplcgWRmgWLmhh,cplcgWRmgWLmVZR,cplcgWRmgWRmhh,cplcgWRmgWRmVZR,cplcgWRpgWLphh,          & 
& cplcgWRpgWLpVZR,cplcgWRpgWRphh,cplcgWRpgWRpVZR,cplcHpmcVWLmVZR,cplcHpmcVWRmVZR,        & 
& cplcVWLmVWLmVZR,cplcVWLmVWRmVZR,cplcVWRmVWLmVZR,cplcVWRmVWRmVZR,cplFvFvhhL,            & 
& cplFvFvhhR,cplFvFvVZRL,cplFvFvVZRR,cplhhcHpmcVWLm,cplhhcHpmcVWRm,cplhhcVWLmVWLm,       & 
& cplhhcVWLmVWRm,cplhhcVWRmVWLm,cplhhcVWRmVWRm,cplhhHpmcHpm,cplhhHpmVWLm,cplhhHpmVWRm,   & 
& cplHpmcHpmVZR,cplHpmVWLmVZR,cplHpmVWRmVZR,kont,res)

Implicit None 
Real(dp), Intent(in) :: MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),MFv(9),MFv2(9),MHpm(4),MHpm2(4),         & 
& MVWLm,MVWLm2,MVWRm,MVWRm2

Complex(dp), Intent(in) :: cplcFdFdhhL(3,3,4),cplcFdFdhhR(3,3,4),cplcFdFdVZRL(3,3),cplcFdFdVZRR(3,3),            & 
& cplcFeFehhL(3,3,4),cplcFeFehhR(3,3,4),cplcFeFeVZRL(3,3),cplcFeFeVZRR(3,3),             & 
& cplcFuFuhhL(3,3,4),cplcFuFuhhR(3,3,4),cplcFuFuVZRL(3,3),cplcFuFuVZRR(3,3),             & 
& cplcgWLmgWLmhh(4),cplcgWLmgWLmVZR,cplcgWLmgWRmhh(4),cplcgWLmgWRmVZR,cplcgWLpgWLphh(4), & 
& cplcgWLpgWLpVZR,cplcgWLpgWRphh(4),cplcgWLpgWRpVZR,cplcgWRmgWLmhh(4),cplcgWRmgWLmVZR,   & 
& cplcgWRmgWRmhh(4),cplcgWRmgWRmVZR,cplcgWRpgWLphh(4),cplcgWRpgWLpVZR,cplcgWRpgWRphh(4), & 
& cplcgWRpgWRpVZR,cplcHpmcVWLmVZR(4),cplcHpmcVWRmVZR(4),cplcVWLmVWLmVZR,cplcVWLmVWRmVZR, & 
& cplcVWRmVWLmVZR,cplcVWRmVWRmVZR,cplFvFvhhL(9,9,4),cplFvFvhhR(9,9,4),cplFvFvVZRL(9,9),  & 
& cplFvFvVZRR(9,9),cplhhcHpmcVWLm(4,4),cplhhcHpmcVWRm(4,4),cplhhcVWLmVWLm(4),            & 
& cplhhcVWLmVWRm(4),cplhhcVWRmVWLm(4),cplhhcVWRmVWRm(4),cplhhHpmcHpm(4,4,4),             & 
& cplhhHpmVWLm(4,4),cplhhHpmVWRm(4,4),cplHpmcHpmVZR(4,4),cplHpmVWLmVZR(4),               & 
& cplHpmVWRmVZR(4)

Integer, Intent(inout) :: kont 
Real(dp) :: B0m2, F0m2, G0m2, B1m2, H0m2, B22m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Complex(dp), Intent(inout) :: res(4) 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2, coup3, temp, sumI 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
res = 0._dp 
 
!------------------------ 
! bar[Fd], Fd 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MFd2(i1),MFd2(i2)),dp) 
B1m2 = Real(SA_B1(p2,MFd2(i1),MFd2(i2)),dp) 
coupL1 = cplcFdFdVZRL(i1,i2)
coupR1 = cplcFdFdVZRR(i1,i2)
coupL2 = cplcFdFdhhL(i2,i1,gO2)
coupR2 = cplcFdFdhhR(i2,i1,gO2)
    SumI = (coupL1*coupL2+coupR1*coupR2)*MFd(i1)*(B0m2+B1m2) & 
  & + (coupL1*coupR2+coupR1*coupL2)*MFd(i2)*B1m2  
End do 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fe], Fe 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MFe2(i1),MFe2(i2)),dp) 
B1m2 = Real(SA_B1(p2,MFe2(i1),MFe2(i2)),dp) 
coupL1 = cplcFeFeVZRL(i1,i2)
coupR1 = cplcFeFeVZRR(i1,i2)
coupL2 = cplcFeFehhL(i2,i1,gO2)
coupR2 = cplcFeFehhR(i2,i1,gO2)
    SumI = (coupL1*coupL2+coupR1*coupR2)*MFe(i1)*(B0m2+B1m2) & 
  & + (coupL1*coupR2+coupR1*coupL2)*MFe(i2)*B1m2  
End do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fu], Fu 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MFu2(i1),MFu2(i2)),dp) 
B1m2 = Real(SA_B1(p2,MFu2(i1),MFu2(i2)),dp) 
coupL1 = cplcFuFuVZRL(i1,i2)
coupR1 = cplcFuFuVZRR(i1,i2)
coupL2 = cplcFuFuhhL(i2,i1,gO2)
coupR2 = cplcFuFuhhR(i2,i1,gO2)
    SumI = (coupL1*coupL2+coupR1*coupR2)*MFu(i1)*(B0m2+B1m2) & 
  & + (coupL1*coupR2+coupR1*coupL2)*MFu(i2)*B1m2  
End do 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! Fv, Fv 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 9
       Do i2 = 1, 9
 Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MFv2(i1),MFv2(i2)),dp) 
B1m2 = Real(SA_B1(p2,MFv2(i1),MFv2(i2)),dp) 
coupL1 = cplFvFvVZRL(i1,i2)
coupR1 = cplFvFvVZRR(i1,i2)
coupL2 = cplFvFvhhL(i1,i2,gO2)
coupR2 = cplFvFvhhR(i1,i2,gO2)
    SumI = (coupL1*coupL2+coupR1*coupR2)*MFv(i1)*(B0m2+B1m2) & 
  & + (coupL1*coupR2+coupR1*coupL2)*MFv(i2)*B1m2  
End do 
res = res +0.5_dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[gWLm], gWLm 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MVWLm2,MVWLm2),dp) 
B1m2 = Real(SA_B1(p2,MVWLm2,MVWLm2),dp) 
coup1 = cplcgWLmgWLmVZR
coup2 = cplcgWLmgWLmhh(gO2) 
   SumI = -0.5_dp*coup1*coup2*(B0m2+B1m2) 
End do 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWRm], gWLm 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MVWLm2,MVWRm2),dp) 
B1m2 = Real(SA_B1(p2,MVWLm2,MVWRm2),dp) 
coup1 = cplcgWRmgWLmVZR
coup2 = cplcgWLmgWRmhh(gO2) 
   SumI = -0.5_dp*coup1*coup2*(B0m2+B1m2) 
End do 
res = res +2._dp* SumI  
!------------------------ 
! bar[gWLmC], gWLmC 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MVWLm2,MVWLm2),dp) 
B1m2 = Real(SA_B1(p2,MVWLm2,MVWLm2),dp) 
coup1 = cplcgWLpgWLpVZR
coup2 = cplcgWLpgWLphh(gO2) 
   SumI = -0.5_dp*coup1*coup2*(B0m2+B1m2) 
End do 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWRmC], gWLmC 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MVWLm2,MVWRm2),dp) 
B1m2 = Real(SA_B1(p2,MVWLm2,MVWRm2),dp) 
coup1 = cplcgWRpgWLpVZR
coup2 = cplcgWLpgWRphh(gO2) 
   SumI = -0.5_dp*coup1*coup2*(B0m2+B1m2) 
End do 
res = res +2._dp* SumI  
!------------------------ 
! bar[gWLm], gWRm 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MVWRm2,MVWLm2),dp) 
B1m2 = Real(SA_B1(p2,MVWRm2,MVWLm2),dp) 
coup1 = cplcgWLmgWRmVZR
coup2 = cplcgWRmgWLmhh(gO2) 
   SumI = -0.5_dp*coup1*coup2*(B0m2+B1m2) 
End do 
res = res +2._dp* SumI  
!------------------------ 
! bar[gWRm], gWRm 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MVWRm2,MVWRm2),dp) 
B1m2 = Real(SA_B1(p2,MVWRm2,MVWRm2),dp) 
coup1 = cplcgWRmgWRmVZR
coup2 = cplcgWRmgWRmhh(gO2) 
   SumI = -0.5_dp*coup1*coup2*(B0m2+B1m2) 
End do 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWLmC], gWRmC 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MVWRm2,MVWLm2),dp) 
B1m2 = Real(SA_B1(p2,MVWRm2,MVWLm2),dp) 
coup1 = cplcgWLpgWRpVZR
coup2 = cplcgWRpgWLphh(gO2) 
   SumI = -0.5_dp*coup1*coup2*(B0m2+B1m2) 
End do 
res = res +2._dp* SumI  
!------------------------ 
! bar[gWRmC], gWRmC 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MVWRm2,MVWRm2),dp) 
B1m2 = Real(SA_B1(p2,MVWRm2,MVWRm2),dp) 
coup1 = cplcgWRpgWRpVZR
coup2 = cplcgWRpgWRphh(gO2) 
   SumI = -0.5_dp*coup1*coup2*(B0m2+B1m2) 
End do 
res = res +1._dp* SumI  
!------------------------ 
! conj[Hpm], Hpm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
       Do i2 = 1, 4
 Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MHpm2(i2),MHpm2(i1)),dp) 
B1m2 = Real(SA_B1(p2,MHpm2(i2),MHpm2(i1)),dp) 
coup1 = cplHpmcHpmVZR(i2,i1)
coup2 = cplhhHpmcHpm(gO2,i1,i2)
    SumI = -coup1*coup2*(B1m2+0.5_dp*B0m2)
End do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! VWLm, Hpm 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MVWLm2,MHpm2(i2)),dp) 
B1m2 = Real(SA_B1(p2,MVWLm2,MHpm2(i2)),dp) 
coup1 = cplHpmVWLmVZR(i2)
coup2 = cplhhcHpmcVWLm(gO2,i2)
    SumI = coup1*coup2*(B1m2-B0m2) 
End do 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! VWRm, Hpm 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MVWRm2,MHpm2(i2)),dp) 
B1m2 = Real(SA_B1(p2,MVWRm2,MHpm2(i2)),dp) 
coup1 = cplHpmVWRmVZR(i2)
coup2 = cplhhcHpmcVWRm(gO2,i2)
    SumI = coup1*coup2*(B1m2-B0m2) 
End do 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! conj[VWLm], VWLm 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MVWLm2,MVWLm2),dp)
B1m2 = Real(SA_B1(p2,MVWLm2,MVWLm2),dp) 
coup1 = cplcVWLmVWLmVZR
coup2 = cplhhcVWLmVWLm(gO2)
    SumI = coup1*coup2*(3._dp/2._dp*B0m2+3._dp*B1m2) 
End do 
res = res +1._dp* SumI  
!------------------------ 
! conj[VWRm], VWLm 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MVWRm2,MVWLm2),dp)
B1m2 = Real(SA_B1(p2,MVWRm2,MVWLm2),dp) 
coup1 = cplcVWRmVWLmVZR
coup2 = cplhhcVWLmVWRm(gO2)
    SumI = coup1*coup2*(3._dp/2._dp*B0m2+3._dp*B1m2) 
End do 
res = res +2._dp* SumI  
!------------------------ 
! conj[VWLm], VWRm 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MVWLm2,MVWRm2),dp)
B1m2 = Real(SA_B1(p2,MVWLm2,MVWRm2),dp) 
coup1 = cplcVWLmVWRmVZR
coup2 = cplhhcVWRmVWLm(gO2)
    SumI = coup1*coup2*(3._dp/2._dp*B0m2+3._dp*B1m2) 
End do 
res = res +2._dp* SumI  
!------------------------ 
! conj[VWRm], VWRm 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MVWRm2,MVWRm2),dp)
B1m2 = Real(SA_B1(p2,MVWRm2,MVWRm2),dp) 
coup1 = cplcVWRmVWRmVZR
coup2 = cplhhcVWRmVWRm(gO2)
    SumI = coup1*coup2*(3._dp/2._dp*B0m2+3._dp*B1m2) 
End do 
res = res +1._dp* SumI  
!------------------------ 
! conj[VWLm], conj[Hpm] 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MVWLm2,MHpm2(i2)),dp) 
B1m2 = Real(SA_B1(p2,MVWLm2,MHpm2(i2)),dp) 
coup1 = cplcHpmcVWLmVZR(i2)
coup2 = cplhhHpmVWLm(gO2,i2)
    SumI = coup1*coup2*(B1m2-B0m2) 
End do 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! conj[VWRm], conj[Hpm] 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MVWRm2,MHpm2(i2)),dp) 
B1m2 = Real(SA_B1(p2,MVWRm2,MHpm2(i2)),dp) 
coup1 = cplcHpmcVWRmVZR(i2)
coup2 = cplhhHpmVWRm(gO2,i2)
    SumI = coup1*coup2*(B1m2-B0m2) 
End do 
res = res +1._dp* SumI  
    End Do 
 res = oo16pi2*res 
 
End Subroutine Pi1LoopVZRhh 
 
Subroutine DerPi1LoopVZRhh(p2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,MHpm,               & 
& MHpm2,MVWLm,MVWLm2,MVWRm,MVWRm2,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZRL,cplcFdFdVZRR,     & 
& cplcFeFehhL,cplcFeFehhR,cplcFeFeVZRL,cplcFeFeVZRR,cplcFuFuhhL,cplcFuFuhhR,             & 
& cplcFuFuVZRL,cplcFuFuVZRR,cplcgWLmgWLmhh,cplcgWLmgWLmVZR,cplcgWLmgWRmhh,               & 
& cplcgWLmgWRmVZR,cplcgWLpgWLphh,cplcgWLpgWLpVZR,cplcgWLpgWRphh,cplcgWLpgWRpVZR,         & 
& cplcgWRmgWLmhh,cplcgWRmgWLmVZR,cplcgWRmgWRmhh,cplcgWRmgWRmVZR,cplcgWRpgWLphh,          & 
& cplcgWRpgWLpVZR,cplcgWRpgWRphh,cplcgWRpgWRpVZR,cplcHpmcVWLmVZR,cplcHpmcVWRmVZR,        & 
& cplcVWLmVWLmVZR,cplcVWLmVWRmVZR,cplcVWRmVWLmVZR,cplcVWRmVWRmVZR,cplFvFvhhL,            & 
& cplFvFvhhR,cplFvFvVZRL,cplFvFvVZRR,cplhhcHpmcVWLm,cplhhcHpmcVWRm,cplhhcVWLmVWLm,       & 
& cplhhcVWLmVWRm,cplhhcVWRmVWLm,cplhhcVWRmVWRm,cplhhHpmcHpm,cplhhHpmVWLm,cplhhHpmVWRm,   & 
& cplHpmcHpmVZR,cplHpmVWLmVZR,cplHpmVWRmVZR,kont,res)

Implicit None 
Real(dp), Intent(in) :: MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),MFv(9),MFv2(9),MHpm(4),MHpm2(4),         & 
& MVWLm,MVWLm2,MVWRm,MVWRm2

Complex(dp), Intent(in) :: cplcFdFdhhL(3,3,4),cplcFdFdhhR(3,3,4),cplcFdFdVZRL(3,3),cplcFdFdVZRR(3,3),            & 
& cplcFeFehhL(3,3,4),cplcFeFehhR(3,3,4),cplcFeFeVZRL(3,3),cplcFeFeVZRR(3,3),             & 
& cplcFuFuhhL(3,3,4),cplcFuFuhhR(3,3,4),cplcFuFuVZRL(3,3),cplcFuFuVZRR(3,3),             & 
& cplcgWLmgWLmhh(4),cplcgWLmgWLmVZR,cplcgWLmgWRmhh(4),cplcgWLmgWRmVZR,cplcgWLpgWLphh(4), & 
& cplcgWLpgWLpVZR,cplcgWLpgWRphh(4),cplcgWLpgWRpVZR,cplcgWRmgWLmhh(4),cplcgWRmgWLmVZR,   & 
& cplcgWRmgWRmhh(4),cplcgWRmgWRmVZR,cplcgWRpgWLphh(4),cplcgWRpgWLpVZR,cplcgWRpgWRphh(4), & 
& cplcgWRpgWRpVZR,cplcHpmcVWLmVZR(4),cplcHpmcVWRmVZR(4),cplcVWLmVWLmVZR,cplcVWLmVWRmVZR, & 
& cplcVWRmVWLmVZR,cplcVWRmVWRmVZR,cplFvFvhhL(9,9,4),cplFvFvhhR(9,9,4),cplFvFvVZRL(9,9),  & 
& cplFvFvVZRR(9,9),cplhhcHpmcVWLm(4,4),cplhhcHpmcVWRm(4,4),cplhhcVWLmVWLm(4),            & 
& cplhhcVWLmVWRm(4),cplhhcVWRmVWLm(4),cplhhcVWRmVWRm(4),cplhhHpmcHpm(4,4,4),             & 
& cplhhHpmVWLm(4,4),cplhhHpmVWRm(4,4),cplHpmcHpmVZR(4,4),cplHpmVWLmVZR(4),               & 
& cplHpmVWRmVZR(4)

Integer, Intent(inout) :: kont 
Real(dp) :: B0m2, F0m2, G0m2, B1m2, H0m2, B22m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Complex(dp), Intent(inout) :: res(4) 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2, coup3, temp, sumI 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
Real(dp) ::MVG,MVP,MVG2,MVP2
MVG = Mass_Regulator_PhotonGluon 
MVP = Mass_Regulator_PhotonGluon 
MVG2 = Mass_Regulator_PhotonGluon**2 
MVP2 = Mass_Regulator_PhotonGluon**2 

res = 0._dp 
 
!------------------------ 
! bar[Fd], Fd 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MFd2(i1),MFd2(i2)),dp) 
B1m2 = Real(SA_DerB1(p2,MFd2(i1),MFd2(i2)),dp) 
coupL1 = cplcFdFdVZRL(i1,i2)
coupR1 = cplcFdFdVZRR(i1,i2)
coupL2 = cplcFdFdhhL(i2,i1,gO2)
coupR2 = cplcFdFdhhR(i2,i1,gO2)
    SumI = (coupL1*coupL2+coupR1*coupR2)*MFd(i1)*(B0m2+B1m2) & 
  & + (coupL1*coupR2+coupR1*coupL2)*MFd(i2)*B1m2  
End do 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fe], Fe 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MFe2(i1),MFe2(i2)),dp) 
B1m2 = Real(SA_DerB1(p2,MFe2(i1),MFe2(i2)),dp) 
coupL1 = cplcFeFeVZRL(i1,i2)
coupR1 = cplcFeFeVZRR(i1,i2)
coupL2 = cplcFeFehhL(i2,i1,gO2)
coupR2 = cplcFeFehhR(i2,i1,gO2)
    SumI = (coupL1*coupL2+coupR1*coupR2)*MFe(i1)*(B0m2+B1m2) & 
  & + (coupL1*coupR2+coupR1*coupL2)*MFe(i2)*B1m2  
End do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fu], Fu 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MFu2(i1),MFu2(i2)),dp) 
B1m2 = Real(SA_DerB1(p2,MFu2(i1),MFu2(i2)),dp) 
coupL1 = cplcFuFuVZRL(i1,i2)
coupR1 = cplcFuFuVZRR(i1,i2)
coupL2 = cplcFuFuhhL(i2,i1,gO2)
coupR2 = cplcFuFuhhR(i2,i1,gO2)
    SumI = (coupL1*coupL2+coupR1*coupR2)*MFu(i1)*(B0m2+B1m2) & 
  & + (coupL1*coupR2+coupR1*coupL2)*MFu(i2)*B1m2  
End do 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! Fv, Fv 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 9
       Do i2 = 1, 9
 Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MFv2(i1),MFv2(i2)),dp) 
B1m2 = Real(SA_DerB1(p2,MFv2(i1),MFv2(i2)),dp) 
coupL1 = cplFvFvVZRL(i1,i2)
coupR1 = cplFvFvVZRR(i1,i2)
coupL2 = cplFvFvhhL(i1,i2,gO2)
coupR2 = cplFvFvhhR(i1,i2,gO2)
    SumI = (coupL1*coupL2+coupR1*coupR2)*MFv(i1)*(B0m2+B1m2) & 
  & + (coupL1*coupR2+coupR1*coupL2)*MFv(i2)*B1m2  
End do 
res = res +0.5_dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[gWLm], gWLm 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MVWLm2,MVWLm2),dp) 
B1m2 = Real(SA_DerB1(p2,MVWLm2,MVWLm2),dp) 
coup1 = cplcgWLmgWLmVZR
coup2 = cplcgWLmgWLmhh(gO2) 
   SumI = -0.5_dp*coup1*coup2*(B0m2+B1m2) 
End do 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWRm], gWLm 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MVWLm2,MVWRm2),dp) 
B1m2 = Real(SA_DerB1(p2,MVWLm2,MVWRm2),dp) 
coup1 = cplcgWRmgWLmVZR
coup2 = cplcgWLmgWRmhh(gO2) 
   SumI = -0.5_dp*coup1*coup2*(B0m2+B1m2) 
End do 
res = res +2._dp* SumI  
!------------------------ 
! bar[gWLmC], gWLmC 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MVWLm2,MVWLm2),dp) 
B1m2 = Real(SA_DerB1(p2,MVWLm2,MVWLm2),dp) 
coup1 = cplcgWLpgWLpVZR
coup2 = cplcgWLpgWLphh(gO2) 
   SumI = -0.5_dp*coup1*coup2*(B0m2+B1m2) 
End do 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWRmC], gWLmC 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MVWLm2,MVWRm2),dp) 
B1m2 = Real(SA_DerB1(p2,MVWLm2,MVWRm2),dp) 
coup1 = cplcgWRpgWLpVZR
coup2 = cplcgWLpgWRphh(gO2) 
   SumI = -0.5_dp*coup1*coup2*(B0m2+B1m2) 
End do 
res = res +2._dp* SumI  
!------------------------ 
! bar[gWLm], gWRm 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MVWRm2,MVWLm2),dp) 
B1m2 = Real(SA_DerB1(p2,MVWRm2,MVWLm2),dp) 
coup1 = cplcgWLmgWRmVZR
coup2 = cplcgWRmgWLmhh(gO2) 
   SumI = -0.5_dp*coup1*coup2*(B0m2+B1m2) 
End do 
res = res +2._dp* SumI  
!------------------------ 
! bar[gWRm], gWRm 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MVWRm2,MVWRm2),dp) 
B1m2 = Real(SA_DerB1(p2,MVWRm2,MVWRm2),dp) 
coup1 = cplcgWRmgWRmVZR
coup2 = cplcgWRmgWRmhh(gO2) 
   SumI = -0.5_dp*coup1*coup2*(B0m2+B1m2) 
End do 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWLmC], gWRmC 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MVWRm2,MVWLm2),dp) 
B1m2 = Real(SA_DerB1(p2,MVWRm2,MVWLm2),dp) 
coup1 = cplcgWLpgWRpVZR
coup2 = cplcgWRpgWLphh(gO2) 
   SumI = -0.5_dp*coup1*coup2*(B0m2+B1m2) 
End do 
res = res +2._dp* SumI  
!------------------------ 
! bar[gWRmC], gWRmC 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MVWRm2,MVWRm2),dp) 
B1m2 = Real(SA_DerB1(p2,MVWRm2,MVWRm2),dp) 
coup1 = cplcgWRpgWRpVZR
coup2 = cplcgWRpgWRphh(gO2) 
   SumI = -0.5_dp*coup1*coup2*(B0m2+B1m2) 
End do 
res = res +1._dp* SumI  
!------------------------ 
! conj[Hpm], Hpm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
       Do i2 = 1, 4
 Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MHpm2(i2),MHpm2(i1)),dp) 
B1m2 = Real(SA_DerB1(p2,MHpm2(i2),MHpm2(i1)),dp) 
coup1 = cplHpmcHpmVZR(i2,i1)
coup2 = cplhhHpmcHpm(gO2,i1,i2)
    SumI = -coup1*coup2*(B1m2+0.5_dp*B0m2)
End do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! VWLm, Hpm 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MVWLm2,MHpm2(i2)),dp) 
B1m2 = Real(SA_DerB1(p2,MVWLm2,MHpm2(i2)),dp) 
coup1 = cplHpmVWLmVZR(i2)
coup2 = cplhhcHpmcVWLm(gO2,i2)
    SumI = coup1*coup2*(B1m2-B0m2) 
End do 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! VWRm, Hpm 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MVWRm2,MHpm2(i2)),dp) 
B1m2 = Real(SA_DerB1(p2,MVWRm2,MHpm2(i2)),dp) 
coup1 = cplHpmVWRmVZR(i2)
coup2 = cplhhcHpmcVWRm(gO2,i2)
    SumI = coup1*coup2*(B1m2-B0m2) 
End do 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! conj[VWLm], VWLm 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MVWLm2,MVWLm2),dp)
B1m2 = Real(SA_DerB1(p2,MVWLm2,MVWLm2),dp) 
coup1 = cplcVWLmVWLmVZR
coup2 = cplhhcVWLmVWLm(gO2)
    SumI = coup1*coup2*(3._dp/2._dp*B0m2+3._dp*B1m2) 
End do 
res = res +1._dp* SumI  
!------------------------ 
! conj[VWRm], VWLm 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MVWRm2,MVWLm2),dp)
B1m2 = Real(SA_DerB1(p2,MVWRm2,MVWLm2),dp) 
coup1 = cplcVWRmVWLmVZR
coup2 = cplhhcVWLmVWRm(gO2)
    SumI = coup1*coup2*(3._dp/2._dp*B0m2+3._dp*B1m2) 
End do 
res = res +2._dp* SumI  
!------------------------ 
! conj[VWLm], VWRm 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MVWLm2,MVWRm2),dp)
B1m2 = Real(SA_DerB1(p2,MVWLm2,MVWRm2),dp) 
coup1 = cplcVWLmVWRmVZR
coup2 = cplhhcVWRmVWLm(gO2)
    SumI = coup1*coup2*(3._dp/2._dp*B0m2+3._dp*B1m2) 
End do 
res = res +2._dp* SumI  
!------------------------ 
! conj[VWRm], VWRm 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MVWRm2,MVWRm2),dp)
B1m2 = Real(SA_DerB1(p2,MVWRm2,MVWRm2),dp) 
coup1 = cplcVWRmVWRmVZR
coup2 = cplhhcVWRmVWRm(gO2)
    SumI = coup1*coup2*(3._dp/2._dp*B0m2+3._dp*B1m2) 
End do 
res = res +1._dp* SumI  
!------------------------ 
! conj[VWLm], conj[Hpm] 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MVWLm2,MHpm2(i2)),dp) 
B1m2 = Real(SA_DerB1(p2,MVWLm2,MHpm2(i2)),dp) 
coup1 = cplcHpmcVWLmVZR(i2)
coup2 = cplhhHpmVWLm(gO2,i2)
    SumI = coup1*coup2*(B1m2-B0m2) 
End do 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! conj[VWRm], conj[Hpm] 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MVWRm2,MHpm2(i2)),dp) 
B1m2 = Real(SA_DerB1(p2,MVWRm2,MHpm2(i2)),dp) 
coup1 = cplcHpmcVWRmVZR(i2)
coup2 = cplhhHpmVWRm(gO2,i2)
    SumI = coup1*coup2*(B1m2-B0m2) 
End do 
res = res +1._dp* SumI  
    End Do 
 res = oo16pi2*res 
 
End Subroutine DerPi1LoopVZRhh 
 
Subroutine Pi1LoopVZRAh(p2,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,              & 
& Mhh,Mhh2,MHpm,MHpm2,MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,MVZR2,cplAhAhhh,           & 
& cplAhcHpmcVWLm,cplAhcHpmcVWRm,cplAhcVWLmVWRm,cplAhcVWRmVWLm,cplAhhhVP,cplAhhhVZ,       & 
& cplAhhhVZR,cplAhHpmcHpm,cplAhHpmVWLm,cplAhHpmVWRm,cplcFdFdAhL,cplcFdFdAhR,             & 
& cplcFdFdVZRL,cplcFdFdVZRR,cplcFeFeAhL,cplcFeFeAhR,cplcFeFeVZRL,cplcFeFeVZRR,           & 
& cplcFuFuAhL,cplcFuFuAhR,cplcFuFuVZRL,cplcFuFuVZRR,cplcgWLmgWLmAh,cplcgWLmgWLmVZR,      & 
& cplcgWLmgWRmAh,cplcgWLmgWRmVZR,cplcgWLpgWLpAh,cplcgWLpgWLpVZR,cplcgWLpgWRpAh,          & 
& cplcgWLpgWRpVZR,cplcgWRmgWLmAh,cplcgWRmgWLmVZR,cplcgWRmgWRmAh,cplcgWRmgWRmVZR,         & 
& cplcgWRpgWLpAh,cplcgWRpgWLpVZR,cplcgWRpgWRpAh,cplcgWRpgWRpVZR,cplcHpmcVWLmVZR,         & 
& cplcHpmcVWRmVZR,cplcVWLmVWRmVZR,cplcVWRmVWLmVZR,cplFvFvAhL,cplFvFvAhR,cplFvFvVZRL,     & 
& cplFvFvVZRR,cplhhVPVZR,cplhhVZRVZR,cplhhVZVZR,cplHpmcHpmVZR,cplHpmVWLmVZR,             & 
& cplHpmVWRmVZR,kont,res)

Implicit None 
Real(dp), Intent(in) :: MAh(4),MAh2(4),MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),MFv(9),MFv2(9),           & 
& Mhh(4),Mhh2(4),MHpm(4),MHpm2(4),MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,MVZR2

Complex(dp), Intent(in) :: cplAhAhhh(4,4,4),cplAhcHpmcVWLm(4,4),cplAhcHpmcVWRm(4,4),cplAhcVWLmVWRm(4),           & 
& cplAhcVWRmVWLm(4),cplAhhhVP(4,4),cplAhhhVZ(4,4),cplAhhhVZR(4,4),cplAhHpmcHpm(4,4,4),   & 
& cplAhHpmVWLm(4,4),cplAhHpmVWRm(4,4),cplcFdFdAhL(3,3,4),cplcFdFdAhR(3,3,4),             & 
& cplcFdFdVZRL(3,3),cplcFdFdVZRR(3,3),cplcFeFeAhL(3,3,4),cplcFeFeAhR(3,3,4),             & 
& cplcFeFeVZRL(3,3),cplcFeFeVZRR(3,3),cplcFuFuAhL(3,3,4),cplcFuFuAhR(3,3,4),             & 
& cplcFuFuVZRL(3,3),cplcFuFuVZRR(3,3),cplcgWLmgWLmAh(4),cplcgWLmgWLmVZR,cplcgWLmgWRmAh(4),& 
& cplcgWLmgWRmVZR,cplcgWLpgWLpAh(4),cplcgWLpgWLpVZR,cplcgWLpgWRpAh(4),cplcgWLpgWRpVZR,   & 
& cplcgWRmgWLmAh(4),cplcgWRmgWLmVZR,cplcgWRmgWRmAh(4),cplcgWRmgWRmVZR,cplcgWRpgWLpAh(4), & 
& cplcgWRpgWLpVZR,cplcgWRpgWRpAh(4),cplcgWRpgWRpVZR,cplcHpmcVWLmVZR(4),cplcHpmcVWRmVZR(4),& 
& cplcVWLmVWRmVZR,cplcVWRmVWLmVZR,cplFvFvAhL(9,9,4),cplFvFvAhR(9,9,4),cplFvFvVZRL(9,9),  & 
& cplFvFvVZRR(9,9),cplhhVPVZR(4),cplhhVZRVZR(4),cplhhVZVZR(4),cplHpmcHpmVZR(4,4),        & 
& cplHpmVWLmVZR(4),cplHpmVWRmVZR(4)

Integer, Intent(inout) :: kont 
Real(dp) :: B0m2, F0m2, G0m2, B1m2, H0m2, B22m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Complex(dp), Intent(inout) :: res(4) 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2, coup3, temp, sumI 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
res = 0._dp 
 
!------------------------ 
! hh, Ah 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
       Do i2 = 1, 4
 Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MAh2(i2),Mhh2(i1)),dp) 
B1m2 = Real(SA_B1(p2,MAh2(i2),Mhh2(i1)),dp) 
coup1 = cplAhhhVZR(i2,i1)
coup2 = cplAhAhhh(gO2,i2,i1)
    SumI = -coup1*coup2*(B1m2+0.5_dp*B0m2)
End do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fd], Fd 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MFd2(i1),MFd2(i2)),dp) 
B1m2 = Real(SA_B1(p2,MFd2(i1),MFd2(i2)),dp) 
coupL1 = cplcFdFdVZRL(i1,i2)
coupR1 = cplcFdFdVZRR(i1,i2)
coupL2 = cplcFdFdAhL(i2,i1,gO2)
coupR2 = cplcFdFdAhR(i2,i1,gO2)
    SumI = (coupL1*coupL2+coupR1*coupR2)*MFd(i1)*(B0m2+B1m2) & 
  & + (coupL1*coupR2+coupR1*coupL2)*MFd(i2)*B1m2  
End do 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fe], Fe 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MFe2(i1),MFe2(i2)),dp) 
B1m2 = Real(SA_B1(p2,MFe2(i1),MFe2(i2)),dp) 
coupL1 = cplcFeFeVZRL(i1,i2)
coupR1 = cplcFeFeVZRR(i1,i2)
coupL2 = cplcFeFeAhL(i2,i1,gO2)
coupR2 = cplcFeFeAhR(i2,i1,gO2)
    SumI = (coupL1*coupL2+coupR1*coupR2)*MFe(i1)*(B0m2+B1m2) & 
  & + (coupL1*coupR2+coupR1*coupL2)*MFe(i2)*B1m2  
End do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fu], Fu 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MFu2(i1),MFu2(i2)),dp) 
B1m2 = Real(SA_B1(p2,MFu2(i1),MFu2(i2)),dp) 
coupL1 = cplcFuFuVZRL(i1,i2)
coupR1 = cplcFuFuVZRR(i1,i2)
coupL2 = cplcFuFuAhL(i2,i1,gO2)
coupR2 = cplcFuFuAhR(i2,i1,gO2)
    SumI = (coupL1*coupL2+coupR1*coupR2)*MFu(i1)*(B0m2+B1m2) & 
  & + (coupL1*coupR2+coupR1*coupL2)*MFu(i2)*B1m2  
End do 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! Fv, Fv 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 9
       Do i2 = 1, 9
 Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MFv2(i1),MFv2(i2)),dp) 
B1m2 = Real(SA_B1(p2,MFv2(i1),MFv2(i2)),dp) 
coupL1 = cplFvFvVZRL(i1,i2)
coupR1 = cplFvFvVZRR(i1,i2)
coupL2 = cplFvFvAhL(i1,i2,gO2)
coupR2 = cplFvFvAhR(i1,i2,gO2)
    SumI = (coupL1*coupL2+coupR1*coupR2)*MFv(i1)*(B0m2+B1m2) & 
  & + (coupL1*coupR2+coupR1*coupL2)*MFv(i2)*B1m2  
End do 
res = res +0.5_dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[gWLm], gWLm 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MVWLm2,MVWLm2),dp) 
B1m2 = Real(SA_B1(p2,MVWLm2,MVWLm2),dp) 
coup1 = cplcgWLmgWLmVZR
coup2 = cplcgWLmgWLmAh(gO2) 
   SumI = -0.5_dp*coup1*coup2*(B0m2+B1m2) 
End do 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWRm], gWLm 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MVWLm2,MVWRm2),dp) 
B1m2 = Real(SA_B1(p2,MVWLm2,MVWRm2),dp) 
coup1 = cplcgWRmgWLmVZR
coup2 = cplcgWLmgWRmAh(gO2) 
   SumI = -0.5_dp*coup1*coup2*(B0m2+B1m2) 
End do 
res = res +2._dp* SumI  
!------------------------ 
! bar[gWLmC], gWLmC 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MVWLm2,MVWLm2),dp) 
B1m2 = Real(SA_B1(p2,MVWLm2,MVWLm2),dp) 
coup1 = cplcgWLpgWLpVZR
coup2 = cplcgWLpgWLpAh(gO2) 
   SumI = -0.5_dp*coup1*coup2*(B0m2+B1m2) 
End do 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWRmC], gWLmC 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MVWLm2,MVWRm2),dp) 
B1m2 = Real(SA_B1(p2,MVWLm2,MVWRm2),dp) 
coup1 = cplcgWRpgWLpVZR
coup2 = cplcgWLpgWRpAh(gO2) 
   SumI = -0.5_dp*coup1*coup2*(B0m2+B1m2) 
End do 
res = res +2._dp* SumI  
!------------------------ 
! bar[gWLm], gWRm 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MVWRm2,MVWLm2),dp) 
B1m2 = Real(SA_B1(p2,MVWRm2,MVWLm2),dp) 
coup1 = cplcgWLmgWRmVZR
coup2 = cplcgWRmgWLmAh(gO2) 
   SumI = -0.5_dp*coup1*coup2*(B0m2+B1m2) 
End do 
res = res +2._dp* SumI  
!------------------------ 
! bar[gWRm], gWRm 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MVWRm2,MVWRm2),dp) 
B1m2 = Real(SA_B1(p2,MVWRm2,MVWRm2),dp) 
coup1 = cplcgWRmgWRmVZR
coup2 = cplcgWRmgWRmAh(gO2) 
   SumI = -0.5_dp*coup1*coup2*(B0m2+B1m2) 
End do 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWLmC], gWRmC 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MVWRm2,MVWLm2),dp) 
B1m2 = Real(SA_B1(p2,MVWRm2,MVWLm2),dp) 
coup1 = cplcgWLpgWRpVZR
coup2 = cplcgWRpgWLpAh(gO2) 
   SumI = -0.5_dp*coup1*coup2*(B0m2+B1m2) 
End do 
res = res +2._dp* SumI  
!------------------------ 
! bar[gWRmC], gWRmC 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MVWRm2,MVWRm2),dp) 
B1m2 = Real(SA_B1(p2,MVWRm2,MVWRm2),dp) 
coup1 = cplcgWRpgWRpVZR
coup2 = cplcgWRpgWRpAh(gO2) 
   SumI = -0.5_dp*coup1*coup2*(B0m2+B1m2) 
End do 
res = res +1._dp* SumI  
!------------------------ 
! VP, hh 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 Do gO2=1,4 
B0m2 = Real(SA_B0(p2,0._dp,Mhh2(i2)),dp) 
B1m2 = Real(SA_B1(p2,0._dp,Mhh2(i2)),dp) 
coup1 = cplhhVPVZR(i2)
coup2 = cplAhhhVP(gO2,i2)
    SumI = coup1*coup2*(B1m2-B0m2) 
End do 
res = res +0.5_dp* SumI  
    End Do 
 !------------------------ 
! VZ, hh 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MVZ2,Mhh2(i2)),dp) 
B1m2 = Real(SA_B1(p2,MVZ2,Mhh2(i2)),dp) 
coup1 = cplhhVZVZR(i2)
coup2 = cplAhhhVZ(gO2,i2)
    SumI = coup1*coup2*(B1m2-B0m2) 
End do 
res = res +0.5_dp* SumI  
    End Do 
 !------------------------ 
! VZR, hh 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MVZR2,Mhh2(i2)),dp) 
B1m2 = Real(SA_B1(p2,MVZR2,Mhh2(i2)),dp) 
coup1 = cplhhVZRVZR(i2)
coup2 = cplAhhhVZR(gO2,i2)
    SumI = coup1*coup2*(B1m2-B0m2) 
End do 
res = res +0.5_dp* SumI  
    End Do 
 !------------------------ 
! conj[Hpm], Hpm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
       Do i2 = 1, 4
 Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MHpm2(i2),MHpm2(i1)),dp) 
B1m2 = Real(SA_B1(p2,MHpm2(i2),MHpm2(i1)),dp) 
coup1 = cplHpmcHpmVZR(i2,i1)
coup2 = cplAhHpmcHpm(gO2,i1,i2)
    SumI = -coup1*coup2*(B1m2+0.5_dp*B0m2)
End do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! VWLm, Hpm 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MVWLm2,MHpm2(i2)),dp) 
B1m2 = Real(SA_B1(p2,MVWLm2,MHpm2(i2)),dp) 
coup1 = cplHpmVWLmVZR(i2)
coup2 = cplAhcHpmcVWLm(gO2,i2)
    SumI = coup1*coup2*(B1m2-B0m2) 
End do 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! VWRm, Hpm 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MVWRm2,MHpm2(i2)),dp) 
B1m2 = Real(SA_B1(p2,MVWRm2,MHpm2(i2)),dp) 
coup1 = cplHpmVWRmVZR(i2)
coup2 = cplAhcHpmcVWRm(gO2,i2)
    SumI = coup1*coup2*(B1m2-B0m2) 
End do 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! conj[VWRm], VWLm 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MVWRm2,MVWLm2),dp)
B1m2 = Real(SA_B1(p2,MVWRm2,MVWLm2),dp) 
coup1 = cplcVWRmVWLmVZR
coup2 = cplAhcVWLmVWRm(gO2)
    SumI = coup1*coup2*(3._dp/2._dp*B0m2+3._dp*B1m2) 
End do 
res = res +2._dp* SumI  
!------------------------ 
! conj[VWLm], VWRm 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MVWLm2,MVWRm2),dp)
B1m2 = Real(SA_B1(p2,MVWLm2,MVWRm2),dp) 
coup1 = cplcVWLmVWRmVZR
coup2 = cplAhcVWRmVWLm(gO2)
    SumI = coup1*coup2*(3._dp/2._dp*B0m2+3._dp*B1m2) 
End do 
res = res +2._dp* SumI  
!------------------------ 
! conj[VWLm], conj[Hpm] 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MVWLm2,MHpm2(i2)),dp) 
B1m2 = Real(SA_B1(p2,MVWLm2,MHpm2(i2)),dp) 
coup1 = cplcHpmcVWLmVZR(i2)
coup2 = cplAhHpmVWLm(gO2,i2)
    SumI = coup1*coup2*(B1m2-B0m2) 
End do 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! conj[VWRm], conj[Hpm] 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MVWRm2,MHpm2(i2)),dp) 
B1m2 = Real(SA_B1(p2,MVWRm2,MHpm2(i2)),dp) 
coup1 = cplcHpmcVWRmVZR(i2)
coup2 = cplAhHpmVWRm(gO2,i2)
    SumI = coup1*coup2*(B1m2-B0m2) 
End do 
res = res +1._dp* SumI  
    End Do 
 res = oo16pi2*res 
 
End Subroutine Pi1LoopVZRAh 
 
Subroutine DerPi1LoopVZRAh(p2,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,           & 
& Mhh,Mhh2,MHpm,MHpm2,MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,MVZR2,cplAhAhhh,           & 
& cplAhcHpmcVWLm,cplAhcHpmcVWRm,cplAhcVWLmVWRm,cplAhcVWRmVWLm,cplAhhhVP,cplAhhhVZ,       & 
& cplAhhhVZR,cplAhHpmcHpm,cplAhHpmVWLm,cplAhHpmVWRm,cplcFdFdAhL,cplcFdFdAhR,             & 
& cplcFdFdVZRL,cplcFdFdVZRR,cplcFeFeAhL,cplcFeFeAhR,cplcFeFeVZRL,cplcFeFeVZRR,           & 
& cplcFuFuAhL,cplcFuFuAhR,cplcFuFuVZRL,cplcFuFuVZRR,cplcgWLmgWLmAh,cplcgWLmgWLmVZR,      & 
& cplcgWLmgWRmAh,cplcgWLmgWRmVZR,cplcgWLpgWLpAh,cplcgWLpgWLpVZR,cplcgWLpgWRpAh,          & 
& cplcgWLpgWRpVZR,cplcgWRmgWLmAh,cplcgWRmgWLmVZR,cplcgWRmgWRmAh,cplcgWRmgWRmVZR,         & 
& cplcgWRpgWLpAh,cplcgWRpgWLpVZR,cplcgWRpgWRpAh,cplcgWRpgWRpVZR,cplcHpmcVWLmVZR,         & 
& cplcHpmcVWRmVZR,cplcVWLmVWRmVZR,cplcVWRmVWLmVZR,cplFvFvAhL,cplFvFvAhR,cplFvFvVZRL,     & 
& cplFvFvVZRR,cplhhVPVZR,cplhhVZRVZR,cplhhVZVZR,cplHpmcHpmVZR,cplHpmVWLmVZR,             & 
& cplHpmVWRmVZR,kont,res)

Implicit None 
Real(dp), Intent(in) :: MAh(4),MAh2(4),MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),MFv(9),MFv2(9),           & 
& Mhh(4),Mhh2(4),MHpm(4),MHpm2(4),MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,MVZR2

Complex(dp), Intent(in) :: cplAhAhhh(4,4,4),cplAhcHpmcVWLm(4,4),cplAhcHpmcVWRm(4,4),cplAhcVWLmVWRm(4),           & 
& cplAhcVWRmVWLm(4),cplAhhhVP(4,4),cplAhhhVZ(4,4),cplAhhhVZR(4,4),cplAhHpmcHpm(4,4,4),   & 
& cplAhHpmVWLm(4,4),cplAhHpmVWRm(4,4),cplcFdFdAhL(3,3,4),cplcFdFdAhR(3,3,4),             & 
& cplcFdFdVZRL(3,3),cplcFdFdVZRR(3,3),cplcFeFeAhL(3,3,4),cplcFeFeAhR(3,3,4),             & 
& cplcFeFeVZRL(3,3),cplcFeFeVZRR(3,3),cplcFuFuAhL(3,3,4),cplcFuFuAhR(3,3,4),             & 
& cplcFuFuVZRL(3,3),cplcFuFuVZRR(3,3),cplcgWLmgWLmAh(4),cplcgWLmgWLmVZR,cplcgWLmgWRmAh(4),& 
& cplcgWLmgWRmVZR,cplcgWLpgWLpAh(4),cplcgWLpgWLpVZR,cplcgWLpgWRpAh(4),cplcgWLpgWRpVZR,   & 
& cplcgWRmgWLmAh(4),cplcgWRmgWLmVZR,cplcgWRmgWRmAh(4),cplcgWRmgWRmVZR,cplcgWRpgWLpAh(4), & 
& cplcgWRpgWLpVZR,cplcgWRpgWRpAh(4),cplcgWRpgWRpVZR,cplcHpmcVWLmVZR(4),cplcHpmcVWRmVZR(4),& 
& cplcVWLmVWRmVZR,cplcVWRmVWLmVZR,cplFvFvAhL(9,9,4),cplFvFvAhR(9,9,4),cplFvFvVZRL(9,9),  & 
& cplFvFvVZRR(9,9),cplhhVPVZR(4),cplhhVZRVZR(4),cplhhVZVZR(4),cplHpmcHpmVZR(4,4),        & 
& cplHpmVWLmVZR(4),cplHpmVWRmVZR(4)

Integer, Intent(inout) :: kont 
Real(dp) :: B0m2, F0m2, G0m2, B1m2, H0m2, B22m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Complex(dp), Intent(inout) :: res(4) 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2, coup3, temp, sumI 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
Real(dp) ::MVG,MVP,MVG2,MVP2
MVG = Mass_Regulator_PhotonGluon 
MVP = Mass_Regulator_PhotonGluon 
MVG2 = Mass_Regulator_PhotonGluon**2 
MVP2 = Mass_Regulator_PhotonGluon**2 

res = 0._dp 
 
!------------------------ 
! hh, Ah 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
       Do i2 = 1, 4
 Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MAh2(i2),Mhh2(i1)),dp) 
B1m2 = Real(SA_DerB1(p2,MAh2(i2),Mhh2(i1)),dp) 
coup1 = cplAhhhVZR(i2,i1)
coup2 = cplAhAhhh(gO2,i2,i1)
    SumI = -coup1*coup2*(B1m2+0.5_dp*B0m2)
End do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fd], Fd 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MFd2(i1),MFd2(i2)),dp) 
B1m2 = Real(SA_DerB1(p2,MFd2(i1),MFd2(i2)),dp) 
coupL1 = cplcFdFdVZRL(i1,i2)
coupR1 = cplcFdFdVZRR(i1,i2)
coupL2 = cplcFdFdAhL(i2,i1,gO2)
coupR2 = cplcFdFdAhR(i2,i1,gO2)
    SumI = (coupL1*coupL2+coupR1*coupR2)*MFd(i1)*(B0m2+B1m2) & 
  & + (coupL1*coupR2+coupR1*coupL2)*MFd(i2)*B1m2  
End do 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fe], Fe 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MFe2(i1),MFe2(i2)),dp) 
B1m2 = Real(SA_DerB1(p2,MFe2(i1),MFe2(i2)),dp) 
coupL1 = cplcFeFeVZRL(i1,i2)
coupR1 = cplcFeFeVZRR(i1,i2)
coupL2 = cplcFeFeAhL(i2,i1,gO2)
coupR2 = cplcFeFeAhR(i2,i1,gO2)
    SumI = (coupL1*coupL2+coupR1*coupR2)*MFe(i1)*(B0m2+B1m2) & 
  & + (coupL1*coupR2+coupR1*coupL2)*MFe(i2)*B1m2  
End do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fu], Fu 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MFu2(i1),MFu2(i2)),dp) 
B1m2 = Real(SA_DerB1(p2,MFu2(i1),MFu2(i2)),dp) 
coupL1 = cplcFuFuVZRL(i1,i2)
coupR1 = cplcFuFuVZRR(i1,i2)
coupL2 = cplcFuFuAhL(i2,i1,gO2)
coupR2 = cplcFuFuAhR(i2,i1,gO2)
    SumI = (coupL1*coupL2+coupR1*coupR2)*MFu(i1)*(B0m2+B1m2) & 
  & + (coupL1*coupR2+coupR1*coupL2)*MFu(i2)*B1m2  
End do 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! Fv, Fv 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 9
       Do i2 = 1, 9
 Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MFv2(i1),MFv2(i2)),dp) 
B1m2 = Real(SA_DerB1(p2,MFv2(i1),MFv2(i2)),dp) 
coupL1 = cplFvFvVZRL(i1,i2)
coupR1 = cplFvFvVZRR(i1,i2)
coupL2 = cplFvFvAhL(i1,i2,gO2)
coupR2 = cplFvFvAhR(i1,i2,gO2)
    SumI = (coupL1*coupL2+coupR1*coupR2)*MFv(i1)*(B0m2+B1m2) & 
  & + (coupL1*coupR2+coupR1*coupL2)*MFv(i2)*B1m2  
End do 
res = res +0.5_dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[gWLm], gWLm 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MVWLm2,MVWLm2),dp) 
B1m2 = Real(SA_DerB1(p2,MVWLm2,MVWLm2),dp) 
coup1 = cplcgWLmgWLmVZR
coup2 = cplcgWLmgWLmAh(gO2) 
   SumI = -0.5_dp*coup1*coup2*(B0m2+B1m2) 
End do 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWRm], gWLm 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MVWLm2,MVWRm2),dp) 
B1m2 = Real(SA_DerB1(p2,MVWLm2,MVWRm2),dp) 
coup1 = cplcgWRmgWLmVZR
coup2 = cplcgWLmgWRmAh(gO2) 
   SumI = -0.5_dp*coup1*coup2*(B0m2+B1m2) 
End do 
res = res +2._dp* SumI  
!------------------------ 
! bar[gWLmC], gWLmC 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MVWLm2,MVWLm2),dp) 
B1m2 = Real(SA_DerB1(p2,MVWLm2,MVWLm2),dp) 
coup1 = cplcgWLpgWLpVZR
coup2 = cplcgWLpgWLpAh(gO2) 
   SumI = -0.5_dp*coup1*coup2*(B0m2+B1m2) 
End do 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWRmC], gWLmC 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MVWLm2,MVWRm2),dp) 
B1m2 = Real(SA_DerB1(p2,MVWLm2,MVWRm2),dp) 
coup1 = cplcgWRpgWLpVZR
coup2 = cplcgWLpgWRpAh(gO2) 
   SumI = -0.5_dp*coup1*coup2*(B0m2+B1m2) 
End do 
res = res +2._dp* SumI  
!------------------------ 
! bar[gWLm], gWRm 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MVWRm2,MVWLm2),dp) 
B1m2 = Real(SA_DerB1(p2,MVWRm2,MVWLm2),dp) 
coup1 = cplcgWLmgWRmVZR
coup2 = cplcgWRmgWLmAh(gO2) 
   SumI = -0.5_dp*coup1*coup2*(B0m2+B1m2) 
End do 
res = res +2._dp* SumI  
!------------------------ 
! bar[gWRm], gWRm 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MVWRm2,MVWRm2),dp) 
B1m2 = Real(SA_DerB1(p2,MVWRm2,MVWRm2),dp) 
coup1 = cplcgWRmgWRmVZR
coup2 = cplcgWRmgWRmAh(gO2) 
   SumI = -0.5_dp*coup1*coup2*(B0m2+B1m2) 
End do 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWLmC], gWRmC 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MVWRm2,MVWLm2),dp) 
B1m2 = Real(SA_DerB1(p2,MVWRm2,MVWLm2),dp) 
coup1 = cplcgWLpgWRpVZR
coup2 = cplcgWRpgWLpAh(gO2) 
   SumI = -0.5_dp*coup1*coup2*(B0m2+B1m2) 
End do 
res = res +2._dp* SumI  
!------------------------ 
! bar[gWRmC], gWRmC 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MVWRm2,MVWRm2),dp) 
B1m2 = Real(SA_DerB1(p2,MVWRm2,MVWRm2),dp) 
coup1 = cplcgWRpgWRpVZR
coup2 = cplcgWRpgWRpAh(gO2) 
   SumI = -0.5_dp*coup1*coup2*(B0m2+B1m2) 
End do 
res = res +1._dp* SumI  
!------------------------ 
! VP, hh 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MVP2,Mhh2(i2)),dp) 
B1m2 = Real(SA_DerB1(p2,MVP2,Mhh2(i2)),dp) 
coup1 = cplhhVPVZR(i2)
coup2 = cplAhhhVP(gO2,i2)
    SumI = coup1*coup2*(B1m2-B0m2) 
End do 
res = res +0.5_dp* SumI  
    End Do 
 !------------------------ 
! VZ, hh 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MVZ2,Mhh2(i2)),dp) 
B1m2 = Real(SA_DerB1(p2,MVZ2,Mhh2(i2)),dp) 
coup1 = cplhhVZVZR(i2)
coup2 = cplAhhhVZ(gO2,i2)
    SumI = coup1*coup2*(B1m2-B0m2) 
End do 
res = res +0.5_dp* SumI  
    End Do 
 !------------------------ 
! VZR, hh 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MVZR2,Mhh2(i2)),dp) 
B1m2 = Real(SA_DerB1(p2,MVZR2,Mhh2(i2)),dp) 
coup1 = cplhhVZRVZR(i2)
coup2 = cplAhhhVZR(gO2,i2)
    SumI = coup1*coup2*(B1m2-B0m2) 
End do 
res = res +0.5_dp* SumI  
    End Do 
 !------------------------ 
! conj[Hpm], Hpm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
       Do i2 = 1, 4
 Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MHpm2(i2),MHpm2(i1)),dp) 
B1m2 = Real(SA_DerB1(p2,MHpm2(i2),MHpm2(i1)),dp) 
coup1 = cplHpmcHpmVZR(i2,i1)
coup2 = cplAhHpmcHpm(gO2,i1,i2)
    SumI = -coup1*coup2*(B1m2+0.5_dp*B0m2)
End do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! VWLm, Hpm 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MVWLm2,MHpm2(i2)),dp) 
B1m2 = Real(SA_DerB1(p2,MVWLm2,MHpm2(i2)),dp) 
coup1 = cplHpmVWLmVZR(i2)
coup2 = cplAhcHpmcVWLm(gO2,i2)
    SumI = coup1*coup2*(B1m2-B0m2) 
End do 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! VWRm, Hpm 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MVWRm2,MHpm2(i2)),dp) 
B1m2 = Real(SA_DerB1(p2,MVWRm2,MHpm2(i2)),dp) 
coup1 = cplHpmVWRmVZR(i2)
coup2 = cplAhcHpmcVWRm(gO2,i2)
    SumI = coup1*coup2*(B1m2-B0m2) 
End do 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! conj[VWRm], VWLm 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MVWRm2,MVWLm2),dp)
B1m2 = Real(SA_DerB1(p2,MVWRm2,MVWLm2),dp) 
coup1 = cplcVWRmVWLmVZR
coup2 = cplAhcVWLmVWRm(gO2)
    SumI = coup1*coup2*(3._dp/2._dp*B0m2+3._dp*B1m2) 
End do 
res = res +2._dp* SumI  
!------------------------ 
! conj[VWLm], VWRm 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MVWLm2,MVWRm2),dp)
B1m2 = Real(SA_DerB1(p2,MVWLm2,MVWRm2),dp) 
coup1 = cplcVWLmVWRmVZR
coup2 = cplAhcVWRmVWLm(gO2)
    SumI = coup1*coup2*(3._dp/2._dp*B0m2+3._dp*B1m2) 
End do 
res = res +2._dp* SumI  
!------------------------ 
! conj[VWLm], conj[Hpm] 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MVWLm2,MHpm2(i2)),dp) 
B1m2 = Real(SA_DerB1(p2,MVWLm2,MHpm2(i2)),dp) 
coup1 = cplcHpmcVWLmVZR(i2)
coup2 = cplAhHpmVWLm(gO2,i2)
    SumI = coup1*coup2*(B1m2-B0m2) 
End do 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! conj[VWRm], conj[Hpm] 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 4
 Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MVWRm2,MHpm2(i2)),dp) 
B1m2 = Real(SA_DerB1(p2,MVWRm2,MHpm2(i2)),dp) 
coup1 = cplcHpmcVWRmVZR(i2)
coup2 = cplAhHpmVWRm(gO2,i2)
    SumI = coup1*coup2*(B1m2-B0m2) 
End do 
res = res +1._dp* SumI  
    End Do 
 res = oo16pi2*res 
 
End Subroutine DerPi1LoopVZRAh 
 
Subroutine Pi1LoopVZRHpm(p2,MAh,MAh2,Mhh,Mhh2,MHpm,MHpm2,cplAhhhcHpm,cplAhhhVZR,      & 
& cplHpmcHpmcHpm,cplHpmcHpmVZR,kont,res)

Implicit None 
Real(dp), Intent(in) :: MAh(4),MAh2(4),Mhh(4),Mhh2(4),MHpm(4),MHpm2(4)

Complex(dp), Intent(in) :: cplAhhhcHpm(4,4,4),cplAhhhVZR(4,4),cplHpmcHpmcHpm(4,4,4),cplHpmcHpmVZR(4,4)

Integer, Intent(inout) :: kont 
Real(dp) :: B0m2, F0m2, G0m2, B1m2, H0m2, B22m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Complex(dp), Intent(inout) :: res(4) 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2, coup3, temp, sumI 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
res = 0._dp 
 
!------------------------ 
! hh, Ah 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
       Do i2 = 1, 4
 Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MAh2(i2),Mhh2(i1)),dp) 
B1m2 = Real(SA_B1(p2,MAh2(i2),Mhh2(i1)),dp) 
coup1 = cplAhhhVZR(i2,i1)
coup2 = cplAhhhcHpm(i2,i1,gO2)
    SumI = -coup1*coup2*(B1m2+0.5_dp*B0m2)
End do 
res = res +0.5_dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[Hpm], Hpm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
       Do i2 = 1, 4
 Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MHpm2(i2),MHpm2(i1)),dp) 
B1m2 = Real(SA_B1(p2,MHpm2(i2),MHpm2(i1)),dp) 
coup1 = cplHpmcHpmVZR(i2,i1)
coup2 = cplHpmcHpmcHpm(i1,gO2,i2)
    SumI = -coup1*coup2*(B1m2+0.5_dp*B0m2)
End do 
res = res +0.5_dp* SumI  
      End Do 
     End Do 
 res = oo16pi2*res 
 
End Subroutine Pi1LoopVZRHpm 
 
Subroutine DerPi1LoopVZRHpm(p2,MAh,MAh2,Mhh,Mhh2,MHpm,MHpm2,cplAhhhcHpm,              & 
& cplAhhhVZR,cplHpmcHpmcHpm,cplHpmcHpmVZR,kont,res)

Implicit None 
Real(dp), Intent(in) :: MAh(4),MAh2(4),Mhh(4),Mhh2(4),MHpm(4),MHpm2(4)

Complex(dp), Intent(in) :: cplAhhhcHpm(4,4,4),cplAhhhVZR(4,4),cplHpmcHpmcHpm(4,4,4),cplHpmcHpmVZR(4,4)

Integer, Intent(inout) :: kont 
Real(dp) :: B0m2, F0m2, G0m2, B1m2, H0m2, B22m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Complex(dp), Intent(inout) :: res(4) 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2, coup3, temp, sumI 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
Real(dp) ::MVG,MVP,MVG2,MVP2
MVG = Mass_Regulator_PhotonGluon 
MVP = Mass_Regulator_PhotonGluon 
MVG2 = Mass_Regulator_PhotonGluon**2 
MVP2 = Mass_Regulator_PhotonGluon**2 

res = 0._dp 
 
!------------------------ 
! hh, Ah 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
       Do i2 = 1, 4
 Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MAh2(i2),Mhh2(i1)),dp) 
B1m2 = Real(SA_DerB1(p2,MAh2(i2),Mhh2(i1)),dp) 
coup1 = cplAhhhVZR(i2,i1)
coup2 = cplAhhhcHpm(i2,i1,gO2)
    SumI = -coup1*coup2*(B1m2+0.5_dp*B0m2)
End do 
res = res +0.5_dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[Hpm], Hpm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
       Do i2 = 1, 4
 Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MHpm2(i2),MHpm2(i1)),dp) 
B1m2 = Real(SA_DerB1(p2,MHpm2(i2),MHpm2(i1)),dp) 
coup1 = cplHpmcHpmVZR(i2,i1)
coup2 = cplHpmcHpmcHpm(i1,gO2,i2)
    SumI = -coup1*coup2*(B1m2+0.5_dp*B0m2)
End do 
res = res +0.5_dp* SumI  
      End Do 
     End Do 
 res = oo16pi2*res 
 
End Subroutine DerPi1LoopVZRHpm 
 
Subroutine Pi1LoopVWLmhh(p2,MAh,MAh2,Mhh,Mhh2,MHpm,MHpm2,cplAhhhcHpm,cplAhHpmVWLm,    & 
& cplhhhhcHpm,cplhhHpmVWLm,kont,res)

Implicit None 
Real(dp), Intent(in) :: MAh(4),MAh2(4),Mhh(4),Mhh2(4),MHpm(4),MHpm2(4)

Complex(dp), Intent(in) :: cplAhhhcHpm(4,4,4),cplAhHpmVWLm(4,4),cplhhhhcHpm(4,4,4),cplhhHpmVWLm(4,4)

Integer, Intent(inout) :: kont 
Real(dp) :: B0m2, F0m2, G0m2, B1m2, H0m2, B22m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Complex(dp), Intent(inout) :: res(4) 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2, coup3, temp, sumI 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
res = 0._dp 
 
!------------------------ 
! Hpm, Ah 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
       Do i2 = 1, 4
 Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MAh2(i2),MHpm2(i1)),dp) 
B1m2 = Real(SA_B1(p2,MAh2(i2),MHpm2(i1)),dp) 
coup1 = cplAhHpmVWLm(i2,i1)
coup2 = cplAhhhcHpm(i2,gO2,i1)
    SumI = -coup1*coup2*(B1m2+0.5_dp*B0m2)
End do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! Hpm, hh 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
       Do i2 = 1, 4
 Do gO2=1,4 
B0m2 = Real(SA_B0(p2,Mhh2(i2),MHpm2(i1)),dp) 
B1m2 = Real(SA_B1(p2,Mhh2(i2),MHpm2(i1)),dp) 
coup1 = cplhhHpmVWLm(i2,i1)
coup2 = cplhhhhcHpm(gO2,i2,i1)
    SumI = -coup1*coup2*(B1m2+0.5_dp*B0m2)
End do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 res = oo16pi2*res 
 
End Subroutine Pi1LoopVWLmhh 
 
Subroutine DerPi1LoopVWLmhh(p2,MAh,MAh2,Mhh,Mhh2,MHpm,MHpm2,cplAhhhcHpm,              & 
& cplAhHpmVWLm,cplhhhhcHpm,cplhhHpmVWLm,kont,res)

Implicit None 
Real(dp), Intent(in) :: MAh(4),MAh2(4),Mhh(4),Mhh2(4),MHpm(4),MHpm2(4)

Complex(dp), Intent(in) :: cplAhhhcHpm(4,4,4),cplAhHpmVWLm(4,4),cplhhhhcHpm(4,4,4),cplhhHpmVWLm(4,4)

Integer, Intent(inout) :: kont 
Real(dp) :: B0m2, F0m2, G0m2, B1m2, H0m2, B22m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Complex(dp), Intent(inout) :: res(4) 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2, coup3, temp, sumI 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
Real(dp) ::MVG,MVP,MVG2,MVP2
MVG = Mass_Regulator_PhotonGluon 
MVP = Mass_Regulator_PhotonGluon 
MVG2 = Mass_Regulator_PhotonGluon**2 
MVP2 = Mass_Regulator_PhotonGluon**2 

res = 0._dp 
 
!------------------------ 
! Hpm, Ah 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
       Do i2 = 1, 4
 Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MAh2(i2),MHpm2(i1)),dp) 
B1m2 = Real(SA_DerB1(p2,MAh2(i2),MHpm2(i1)),dp) 
coup1 = cplAhHpmVWLm(i2,i1)
coup2 = cplAhhhcHpm(i2,gO2,i1)
    SumI = -coup1*coup2*(B1m2+0.5_dp*B0m2)
End do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! Hpm, hh 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
       Do i2 = 1, 4
 Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,Mhh2(i2),MHpm2(i1)),dp) 
B1m2 = Real(SA_DerB1(p2,Mhh2(i2),MHpm2(i1)),dp) 
coup1 = cplhhHpmVWLm(i2,i1)
coup2 = cplhhhhcHpm(gO2,i2,i1)
    SumI = -coup1*coup2*(B1m2+0.5_dp*B0m2)
End do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 res = oo16pi2*res 
 
End Subroutine DerPi1LoopVWLmhh 
 
Subroutine Pi1LoopVWLmAh(p2,MAh,MAh2,Mhh,Mhh2,MHpm,MHpm2,cplAhAhcHpm,cplAhhhcHpm,     & 
& cplAhHpmVWLm,cplhhHpmVWLm,kont,res)

Implicit None 
Real(dp), Intent(in) :: MAh(4),MAh2(4),Mhh(4),Mhh2(4),MHpm(4),MHpm2(4)

Complex(dp), Intent(in) :: cplAhAhcHpm(4,4,4),cplAhhhcHpm(4,4,4),cplAhHpmVWLm(4,4),cplhhHpmVWLm(4,4)

Integer, Intent(inout) :: kont 
Real(dp) :: B0m2, F0m2, G0m2, B1m2, H0m2, B22m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Complex(dp), Intent(inout) :: res(4) 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2, coup3, temp, sumI 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
res = 0._dp 
 
!------------------------ 
! Hpm, Ah 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
       Do i2 = 1, 4
 Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MAh2(i2),MHpm2(i1)),dp) 
B1m2 = Real(SA_B1(p2,MAh2(i2),MHpm2(i1)),dp) 
coup1 = cplAhHpmVWLm(i2,i1)
coup2 = cplAhAhcHpm(gO2,i2,i1)
    SumI = -coup1*coup2*(B1m2+0.5_dp*B0m2)
End do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! Hpm, hh 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
       Do i2 = 1, 4
 Do gO2=1,4 
B0m2 = Real(SA_B0(p2,Mhh2(i2),MHpm2(i1)),dp) 
B1m2 = Real(SA_B1(p2,Mhh2(i2),MHpm2(i1)),dp) 
coup1 = cplhhHpmVWLm(i2,i1)
coup2 = cplAhhhcHpm(gO2,i2,i1)
    SumI = -coup1*coup2*(B1m2+0.5_dp*B0m2)
End do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 res = oo16pi2*res 
 
End Subroutine Pi1LoopVWLmAh 
 
Subroutine DerPi1LoopVWLmAh(p2,MAh,MAh2,Mhh,Mhh2,MHpm,MHpm2,cplAhAhcHpm,              & 
& cplAhhhcHpm,cplAhHpmVWLm,cplhhHpmVWLm,kont,res)

Implicit None 
Real(dp), Intent(in) :: MAh(4),MAh2(4),Mhh(4),Mhh2(4),MHpm(4),MHpm2(4)

Complex(dp), Intent(in) :: cplAhAhcHpm(4,4,4),cplAhhhcHpm(4,4,4),cplAhHpmVWLm(4,4),cplhhHpmVWLm(4,4)

Integer, Intent(inout) :: kont 
Real(dp) :: B0m2, F0m2, G0m2, B1m2, H0m2, B22m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Complex(dp), Intent(inout) :: res(4) 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2, coup3, temp, sumI 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
Real(dp) ::MVG,MVP,MVG2,MVP2
MVG = Mass_Regulator_PhotonGluon 
MVP = Mass_Regulator_PhotonGluon 
MVG2 = Mass_Regulator_PhotonGluon**2 
MVP2 = Mass_Regulator_PhotonGluon**2 

res = 0._dp 
 
!------------------------ 
! Hpm, Ah 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
       Do i2 = 1, 4
 Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MAh2(i2),MHpm2(i1)),dp) 
B1m2 = Real(SA_DerB1(p2,MAh2(i2),MHpm2(i1)),dp) 
coup1 = cplAhHpmVWLm(i2,i1)
coup2 = cplAhAhcHpm(gO2,i2,i1)
    SumI = -coup1*coup2*(B1m2+0.5_dp*B0m2)
End do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! Hpm, hh 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
       Do i2 = 1, 4
 Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,Mhh2(i2),MHpm2(i1)),dp) 
B1m2 = Real(SA_DerB1(p2,Mhh2(i2),MHpm2(i1)),dp) 
coup1 = cplhhHpmVWLm(i2,i1)
coup2 = cplAhhhcHpm(gO2,i2,i1)
    SumI = -coup1*coup2*(B1m2+0.5_dp*B0m2)
End do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 res = oo16pi2*res 
 
End Subroutine DerPi1LoopVWLmAh 
 
Subroutine Pi1LoopVWRmhh(p2,MAh,MAh2,Mhh,Mhh2,MHpm,MHpm2,cplAhhhcHpm,cplAhHpmVWRm,    & 
& cplhhhhcHpm,cplhhHpmVWRm,kont,res)

Implicit None 
Real(dp), Intent(in) :: MAh(4),MAh2(4),Mhh(4),Mhh2(4),MHpm(4),MHpm2(4)

Complex(dp), Intent(in) :: cplAhhhcHpm(4,4,4),cplAhHpmVWRm(4,4),cplhhhhcHpm(4,4,4),cplhhHpmVWRm(4,4)

Integer, Intent(inout) :: kont 
Real(dp) :: B0m2, F0m2, G0m2, B1m2, H0m2, B22m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Complex(dp), Intent(inout) :: res(4) 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2, coup3, temp, sumI 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
res = 0._dp 
 
!------------------------ 
! Hpm, Ah 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
       Do i2 = 1, 4
 Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MAh2(i2),MHpm2(i1)),dp) 
B1m2 = Real(SA_B1(p2,MAh2(i2),MHpm2(i1)),dp) 
coup1 = cplAhHpmVWRm(i2,i1)
coup2 = cplAhhhcHpm(i2,gO2,i1)
    SumI = -coup1*coup2*(B1m2+0.5_dp*B0m2)
End do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! Hpm, hh 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
       Do i2 = 1, 4
 Do gO2=1,4 
B0m2 = Real(SA_B0(p2,Mhh2(i2),MHpm2(i1)),dp) 
B1m2 = Real(SA_B1(p2,Mhh2(i2),MHpm2(i1)),dp) 
coup1 = cplhhHpmVWRm(i2,i1)
coup2 = cplhhhhcHpm(gO2,i2,i1)
    SumI = -coup1*coup2*(B1m2+0.5_dp*B0m2)
End do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 res = oo16pi2*res 
 
End Subroutine Pi1LoopVWRmhh 
 
Subroutine DerPi1LoopVWRmhh(p2,MAh,MAh2,Mhh,Mhh2,MHpm,MHpm2,cplAhhhcHpm,              & 
& cplAhHpmVWRm,cplhhhhcHpm,cplhhHpmVWRm,kont,res)

Implicit None 
Real(dp), Intent(in) :: MAh(4),MAh2(4),Mhh(4),Mhh2(4),MHpm(4),MHpm2(4)

Complex(dp), Intent(in) :: cplAhhhcHpm(4,4,4),cplAhHpmVWRm(4,4),cplhhhhcHpm(4,4,4),cplhhHpmVWRm(4,4)

Integer, Intent(inout) :: kont 
Real(dp) :: B0m2, F0m2, G0m2, B1m2, H0m2, B22m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Complex(dp), Intent(inout) :: res(4) 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2, coup3, temp, sumI 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
Real(dp) ::MVG,MVP,MVG2,MVP2
MVG = Mass_Regulator_PhotonGluon 
MVP = Mass_Regulator_PhotonGluon 
MVG2 = Mass_Regulator_PhotonGluon**2 
MVP2 = Mass_Regulator_PhotonGluon**2 

res = 0._dp 
 
!------------------------ 
! Hpm, Ah 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
       Do i2 = 1, 4
 Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MAh2(i2),MHpm2(i1)),dp) 
B1m2 = Real(SA_DerB1(p2,MAh2(i2),MHpm2(i1)),dp) 
coup1 = cplAhHpmVWRm(i2,i1)
coup2 = cplAhhhcHpm(i2,gO2,i1)
    SumI = -coup1*coup2*(B1m2+0.5_dp*B0m2)
End do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! Hpm, hh 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
       Do i2 = 1, 4
 Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,Mhh2(i2),MHpm2(i1)),dp) 
B1m2 = Real(SA_DerB1(p2,Mhh2(i2),MHpm2(i1)),dp) 
coup1 = cplhhHpmVWRm(i2,i1)
coup2 = cplhhhhcHpm(gO2,i2,i1)
    SumI = -coup1*coup2*(B1m2+0.5_dp*B0m2)
End do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 res = oo16pi2*res 
 
End Subroutine DerPi1LoopVWRmhh 
 
Subroutine Pi1LoopVWRmAh(p2,MAh,MAh2,Mhh,Mhh2,MHpm,MHpm2,cplAhAhcHpm,cplAhhhcHpm,     & 
& cplAhHpmVWRm,cplhhHpmVWRm,kont,res)

Implicit None 
Real(dp), Intent(in) :: MAh(4),MAh2(4),Mhh(4),Mhh2(4),MHpm(4),MHpm2(4)

Complex(dp), Intent(in) :: cplAhAhcHpm(4,4,4),cplAhhhcHpm(4,4,4),cplAhHpmVWRm(4,4),cplhhHpmVWRm(4,4)

Integer, Intent(inout) :: kont 
Real(dp) :: B0m2, F0m2, G0m2, B1m2, H0m2, B22m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Complex(dp), Intent(inout) :: res(4) 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2, coup3, temp, sumI 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
res = 0._dp 
 
!------------------------ 
! Hpm, Ah 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
       Do i2 = 1, 4
 Do gO2=1,4 
B0m2 = Real(SA_B0(p2,MAh2(i2),MHpm2(i1)),dp) 
B1m2 = Real(SA_B1(p2,MAh2(i2),MHpm2(i1)),dp) 
coup1 = cplAhHpmVWRm(i2,i1)
coup2 = cplAhAhcHpm(gO2,i2,i1)
    SumI = -coup1*coup2*(B1m2+0.5_dp*B0m2)
End do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! Hpm, hh 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
       Do i2 = 1, 4
 Do gO2=1,4 
B0m2 = Real(SA_B0(p2,Mhh2(i2),MHpm2(i1)),dp) 
B1m2 = Real(SA_B1(p2,Mhh2(i2),MHpm2(i1)),dp) 
coup1 = cplhhHpmVWRm(i2,i1)
coup2 = cplAhhhcHpm(gO2,i2,i1)
    SumI = -coup1*coup2*(B1m2+0.5_dp*B0m2)
End do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 res = oo16pi2*res 
 
End Subroutine Pi1LoopVWRmAh 
 
Subroutine DerPi1LoopVWRmAh(p2,MAh,MAh2,Mhh,Mhh2,MHpm,MHpm2,cplAhAhcHpm,              & 
& cplAhhhcHpm,cplAhHpmVWRm,cplhhHpmVWRm,kont,res)

Implicit None 
Real(dp), Intent(in) :: MAh(4),MAh2(4),Mhh(4),Mhh2(4),MHpm(4),MHpm2(4)

Complex(dp), Intent(in) :: cplAhAhcHpm(4,4,4),cplAhhhcHpm(4,4,4),cplAhHpmVWRm(4,4),cplhhHpmVWRm(4,4)

Integer, Intent(inout) :: kont 
Real(dp) :: B0m2, F0m2, G0m2, B1m2, H0m2, B22m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Complex(dp), Intent(inout) :: res(4) 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2, coup3, temp, sumI 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
Real(dp) ::MVG,MVP,MVG2,MVP2
MVG = Mass_Regulator_PhotonGluon 
MVP = Mass_Regulator_PhotonGluon 
MVG2 = Mass_Regulator_PhotonGluon**2 
MVP2 = Mass_Regulator_PhotonGluon**2 

res = 0._dp 
 
!------------------------ 
! Hpm, Ah 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
       Do i2 = 1, 4
 Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,MAh2(i2),MHpm2(i1)),dp) 
B1m2 = Real(SA_DerB1(p2,MAh2(i2),MHpm2(i1)),dp) 
coup1 = cplAhHpmVWRm(i2,i1)
coup2 = cplAhAhcHpm(gO2,i2,i1)
    SumI = -coup1*coup2*(B1m2+0.5_dp*B0m2)
End do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! Hpm, hh 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 4
       Do i2 = 1, 4
 Do gO2=1,4 
B0m2 = Real(SA_DerB0(p2,Mhh2(i2),MHpm2(i1)),dp) 
B1m2 = Real(SA_DerB1(p2,Mhh2(i2),MHpm2(i1)),dp) 
coup1 = cplhhHpmVWRm(i2,i1)
coup2 = cplAhhhcHpm(gO2,i2,i1)
    SumI = -coup1*coup2*(B1m2+0.5_dp*B0m2)
End do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 res = oo16pi2*res 
 
End Subroutine DerPi1LoopVWRmAh 
 
End Module LoopMasses_DLRSM 
