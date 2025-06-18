! ------------------------------------------------------------------------------  
! This file was automatically created by SARAH version 4.15.3 
! SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223,
!           1405.1434, 1411.0675, 1503.03098, 1703.09237, 1706.05372, 1805.07306  
! (c) Florian Staub, Mark Goodsell and Werner Porod 2020  
! ------------------------------------------------------------------------------  
! File created at 15:43 on 18.6.2025   
! ----------------------------------------------------------------------  
 
 
Module Wrapper_OneLoopDecay_Fe_SM
Use Model_Data_SM 
Use Kinematics 
Use OneLoopDecay_Fe_SM 
Use Control 
Use Settings 

 
Contains

 
Subroutine OneLoopDecay_Fe(MFdOS,MFd2OS,MFuOS,MFu2OS,MFeOS,MFe2OS,MHpOS,              & 
& MHp2OS,MAhOS,MAh2OS,MhhOS,Mhh2OS,MVZOS,MVZ2OS,MVWpOS,MVWp2OS,ZDLOS,ZDROS,              & 
& ZULOS,ZUROS,ZELOS,ZEROS,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,Mhh,Mhh2,MHp,              & 
& MHp2,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,ZW,ZZ,g1,g2,g3,Lam,Yu,             & 
& Yd,Ye,m2SM,vvSM,dg1,dg2,dg3,dYu,dYd,dYe,dm2SM,dLam,dvvSM,dZDL,dZDR,dZUL,               & 
& dZUR,dZEL,dZER,dSinTW,dCosTW,dTanTW,ZfVG,ZfHp,ZfvL,ZfAh,Zfhh,ZfVP,ZfVZ,ZfVWp,          & 
& ZfDL,ZfDR,ZfUL,ZfUR,ZfEL,ZfER,ZfVPVZ,ZfVZVP,cplAhAhhh,cplAhcHpVWp,cplAhhhVZ,           & 
& cplAhHpcVWp,cplcFeFeAhL,cplcFeFeAhR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,               & 
& cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplcFeFvcHpL,cplcFeFvcHpR,cplcFeFvcVWpL,           & 
& cplcFeFvcVWpR,cplcFvFeHpL,cplcFvFeHpR,cplcFvFeVWpL,cplcFvFeVWpR,cplcFvFvVZL,           & 
& cplcFvFvVZR,cplcHpVPVWp,cplcHpVWpVZ,cplcVWpVPVWp,cplcVWpVWpVZ,cplhhcHpVWp,             & 
& cplhhcVWpVWp,cplhhhhhh,cplhhHpcHp,cplhhHpcVWp,cplhhVZVZ,cplHpcHpVP,cplHpcHpVZ,         & 
& cplHpcVWpVP,cplHpcVWpVZ,ctcplcFeFeAhL,ctcplcFeFeAhR,ctcplcFeFehhL,ctcplcFeFehhR,       & 
& ctcplcFeFeVPL,ctcplcFeFeVPR,ctcplcFeFeVZL,ctcplcFeFeVZR,ctcplcFeFvcHpL,ctcplcFeFvcHpR, & 
& ctcplcFeFvcVWpL,ctcplcFeFvcVWpR,GcplcFeFvcHpL,GcplcFeFvcHpR,GcplcHpVPVWp,              & 
& GcplHpcVWpVP,GosZcplcFeFvcHpL,GosZcplcFeFvcHpR,GosZcplcHpVPVWp,GosZcplHpcVWpVP,        & 
& GZcplcFeFvcHpL,GZcplcFeFvcHpR,GZcplcHpVPVWp,GZcplHpcVWpVP,ZcplcFeFeAhL,ZcplcFeFeAhR,   & 
& ZcplcFeFehhL,ZcplcFeFehhR,ZcplcFeFeVPL,ZcplcFeFeVPR,ZcplcFeFeVZL,ZcplcFeFeVZR,         & 
& ZcplcFeFvcHpL,ZcplcFeFvcHpR,ZcplcFeFvcVWpL,ZcplcFeFvcVWpR,ZcplcFvFeHpL,ZcplcFvFeHpR,   & 
& ZcplcFvFeVWpL,ZcplcFvFeVWpR,ZcplcHpVPVWp,ZcplcVWpVPVWp,ZcplHpcHpVP,ZcplHpcVWpVP,       & 
& ZRUVd,ZRUUd,ZRUVu,ZRUUu,ZRUVe,ZRUUe,MLambda,em,gs,deltaM,kont,gP1LFe)

Implicit None 
Real(dp),Intent(in) :: g1,g2,g3

Complex(dp),Intent(in) :: Lam,Yu(3,3),Yd(3,3),Ye(3,3),m2SM

Real(dp),Intent(in) :: vvSM

Real(dp),Intent(in) :: MAh,MAh2,MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),Mhh,Mhh2,MHp,MHp2,              & 
& MVWp,MVWp2,MVZ,MVZ2,TW,ZZ(2,2)

Complex(dp),Intent(in) :: ZDR(3,3),ZER(3,3),ZUR(3,3),ZDL(3,3),ZEL(3,3),ZUL(3,3),ZW(2,2)

Real(dp),Intent(in) :: dg1,dg2,dg3,dvvSM,dSinTW,dCosTW,dTanTW

Complex(dp),Intent(in) :: dYu(3,3),dYd(3,3),dYe(3,3),dm2SM,dLam,dZDL(3,3),dZDR(3,3),dZUL(3,3),dZUR(3,3),        & 
& dZEL(3,3),dZER(3,3)

Complex(dp),Intent(in) :: cplAhAhhh,cplAhcHpVWp,cplAhhhVZ,cplAhHpcVWp,cplcFeFeAhL(3,3),cplcFeFeAhR(3,3),        & 
& cplcFeFehhL(3,3),cplcFeFehhR(3,3),cplcFeFeVPL(3,3),cplcFeFeVPR(3,3),cplcFeFeVZL(3,3),  & 
& cplcFeFeVZR(3,3),cplcFeFvcHpL(3,3),cplcFeFvcHpR(3,3),cplcFeFvcVWpL(3,3),               & 
& cplcFeFvcVWpR(3,3),cplcFvFeHpL(3,3),cplcFvFeHpR(3,3),cplcFvFeVWpL(3,3),cplcFvFeVWpR(3,3),& 
& cplcFvFvVZL(3,3),cplcFvFvVZR(3,3),cplcHpVPVWp,cplcHpVWpVZ,cplcVWpVPVWp,cplcVWpVWpVZ,   & 
& cplhhcHpVWp,cplhhcVWpVWp,cplhhhhhh,cplhhHpcHp,cplhhHpcVWp,cplhhVZVZ,cplHpcHpVP,        & 
& cplHpcHpVZ,cplHpcVWpVP,cplHpcVWpVZ,ctcplcFeFeAhL(3,3),ctcplcFeFeAhR(3,3),              & 
& ctcplcFeFehhL(3,3),ctcplcFeFehhR(3,3),ctcplcFeFeVPL(3,3),ctcplcFeFeVPR(3,3),           & 
& ctcplcFeFeVZL(3,3),ctcplcFeFeVZR(3,3),ctcplcFeFvcHpL(3,3),ctcplcFeFvcHpR(3,3),         & 
& ctcplcFeFvcVWpL(3,3),ctcplcFeFvcVWpR(3,3),GcplcFeFvcHpL(3,3),GcplcFeFvcHpR(3,3),       & 
& GcplcHpVPVWp,GcplHpcVWpVP,GosZcplcFeFvcHpL(3,3),GosZcplcFeFvcHpR(3,3),GosZcplcHpVPVWp, & 
& GosZcplHpcVWpVP,GZcplcFeFvcHpL(3,3),GZcplcFeFvcHpR(3,3),GZcplcHpVPVWp,GZcplHpcVWpVP,   & 
& ZcplcFeFeAhL(3,3),ZcplcFeFeAhR(3,3),ZcplcFeFehhL(3,3),ZcplcFeFehhR(3,3),               & 
& ZcplcFeFeVPL(3,3),ZcplcFeFeVPR(3,3),ZcplcFeFeVZL(3,3),ZcplcFeFeVZR(3,3),               & 
& ZcplcFeFvcHpL(3,3),ZcplcFeFvcHpR(3,3),ZcplcFeFvcVWpL(3,3),ZcplcFeFvcVWpR(3,3),         & 
& ZcplcFvFeHpL(3,3),ZcplcFvFeHpR(3,3),ZcplcFvFeVWpL(3,3),ZcplcFvFeVWpR(3,3),             & 
& ZcplcHpVPVWp,ZcplcVWpVPVWp,ZcplHpcHpVP,ZcplHpcVWpVP

Real(dp), Intent(in) :: em, gs 
Complex(dp),Intent(in) :: ZfVG,ZfHp,ZfvL(3,3),ZfAh,Zfhh,ZfVP,ZfVZ,ZfVWp,ZfDL(3,3),ZfDR(3,3),ZfUL(3,3),          & 
& ZfUR(3,3),ZfEL(3,3),ZfER(3,3),ZfVPVZ,ZfVZVP

Real(dp),Intent(in) :: MFdOS(3),MFd2OS(3),MFuOS(3),MFu2OS(3),MFeOS(3),MFe2OS(3),MHpOS,MHp2OS,MAhOS,          & 
& MAh2OS,MhhOS,Mhh2OS,MVZOS,MVZ2OS,MVWpOS,MVWp2OS

Complex(dp),Intent(in) :: ZDLOS(3,3),ZDROS(3,3),ZULOS(3,3),ZUROS(3,3),ZELOS(3,3),ZEROS(3,3)

Complex(dp),Intent(in) :: ZRUVd(3,3),ZRUUd(3,3),ZRUVu(3,3),ZRUUu(3,3),ZRUVe(3,3),ZRUUe(3,3)

Real(dp), Intent(in) :: MLambda, deltaM 
Real(dp), Intent(out) :: gP1LFe(3,12) 
Integer, Intent(out) :: kont 
Real(dp) :: MVG,MVP,MVG2,MVP2, helfactor, phasespacefactor 
Integer :: i1,i2,i3,i4, isave, gt1, gt2, gt3 

Complex(dp) :: ZRUVdc(3, 3) 
Complex(dp) :: ZRUUdc(3, 3) 
Complex(dp) :: ZRUVuc(3, 3) 
Complex(dp) :: ZRUUuc(3, 3) 
Complex(dp) :: ZRUVec(3, 3) 
Complex(dp) :: ZRUUec(3, 3) 
Real(dp) :: MRPFeToFehh(3,3),MRGFeToFehh(3,3), MRPZFeToFehh(3,3),MRGZFeToFehh(3,3) 
Real(dp) :: MVPFeToFehh(3,3) 
Real(dp) :: RMsqTreeFeToFehh(3,3),RMsqWaveFeToFehh(3,3),RMsqVertexFeToFehh(3,3) 
Complex(dp) :: AmpTreeFeToFehh(2,3,3),AmpWaveFeToFehh(2,3,3)=(0._dp,0._dp),AmpVertexFeToFehh(2,3,3)& 
 & ,AmpVertexIRosFeToFehh(2,3,3),AmpVertexIRdrFeToFehh(2,3,3), AmpSumFeToFehh(2,3,3), AmpSum2FeToFehh(2,3,3) 
Complex(dp) :: AmpTreeZFeToFehh(2,3,3),AmpWaveZFeToFehh(2,3,3),AmpVertexZFeToFehh(2,3,3) 
Real(dp) :: AmpSqFeToFehh(3,3),  AmpSqTreeFeToFehh(3,3) 
Real(dp) :: MRPFeToFeVZ(3,3),MRGFeToFeVZ(3,3), MRPZFeToFeVZ(3,3),MRGZFeToFeVZ(3,3) 
Real(dp) :: MVPFeToFeVZ(3,3) 
Real(dp) :: RMsqTreeFeToFeVZ(3,3),RMsqWaveFeToFeVZ(3,3),RMsqVertexFeToFeVZ(3,3) 
Complex(dp) :: AmpTreeFeToFeVZ(4,3,3),AmpWaveFeToFeVZ(4,3,3)=(0._dp,0._dp),AmpVertexFeToFeVZ(4,3,3)& 
 & ,AmpVertexIRosFeToFeVZ(4,3,3),AmpVertexIRdrFeToFeVZ(4,3,3), AmpSumFeToFeVZ(4,3,3), AmpSum2FeToFeVZ(4,3,3) 
Complex(dp) :: AmpTreeZFeToFeVZ(4,3,3),AmpWaveZFeToFeVZ(4,3,3),AmpVertexZFeToFeVZ(4,3,3) 
Real(dp) :: AmpSqFeToFeVZ(3,3),  AmpSqTreeFeToFeVZ(3,3) 
Real(dp) :: MRPFeToFvcVWp(3,3),MRGFeToFvcVWp(3,3), MRPZFeToFvcVWp(3,3),MRGZFeToFvcVWp(3,3) 
Real(dp) :: MVPFeToFvcVWp(3,3) 
Real(dp) :: RMsqTreeFeToFvcVWp(3,3),RMsqWaveFeToFvcVWp(3,3),RMsqVertexFeToFvcVWp(3,3) 
Complex(dp) :: AmpTreeFeToFvcVWp(4,3,3),AmpWaveFeToFvcVWp(4,3,3)=(0._dp,0._dp),AmpVertexFeToFvcVWp(4,3,3)& 
 & ,AmpVertexIRosFeToFvcVWp(4,3,3),AmpVertexIRdrFeToFvcVWp(4,3,3), AmpSumFeToFvcVWp(4,3,3), AmpSum2FeToFvcVWp(4,3,3) 
Complex(dp) :: AmpTreeZFeToFvcVWp(4,3,3),AmpWaveZFeToFvcVWp(4,3,3),AmpVertexZFeToFvcVWp(4,3,3) 
Real(dp) :: AmpSqFeToFvcVWp(3,3),  AmpSqTreeFeToFvcVWp(3,3) 
Real(dp) :: MRPFeToFeVP(3,3),MRGFeToFeVP(3,3), MRPZFeToFeVP(3,3),MRGZFeToFeVP(3,3) 
Real(dp) :: MVPFeToFeVP(3,3) 
Real(dp) :: RMsqTreeFeToFeVP(3,3),RMsqWaveFeToFeVP(3,3),RMsqVertexFeToFeVP(3,3) 
Complex(dp) :: AmpTreeFeToFeVP(4,3,3),AmpWaveFeToFeVP(4,3,3)=(0._dp,0._dp),AmpVertexFeToFeVP(4,3,3)& 
 & ,AmpVertexIRosFeToFeVP(4,3,3),AmpVertexIRdrFeToFeVP(4,3,3), AmpSumFeToFeVP(4,3,3), AmpSum2FeToFeVP(4,3,3) 
Complex(dp) :: AmpTreeZFeToFeVP(4,3,3),AmpWaveZFeToFeVP(4,3,3),AmpVertexZFeToFeVP(4,3,3) 
Real(dp) :: AmpSqFeToFeVP(3,3),  AmpSqTreeFeToFeVP(3,3) 
Write(*,*) "Calculating one-loop decays of Fe " 
kont = 0 
MVG = MLambda 
MVP = MLambda 
MVG2 = MLambda**2 
MVP2 = MLambda**2 

ZRUVdc = Conjg(ZRUVd)
ZRUUdc = Conjg(ZRUUd)
ZRUVuc = Conjg(ZRUVu)
ZRUUuc = Conjg(ZRUUu)
ZRUVec = Conjg(ZRUVe)
ZRUUec = Conjg(ZRUUe)

 ! Counter 
isave = 1 

If (.not.CalcLoopDecay_LoopInducedOnly) Then 
!---------------- 
! Fe hh
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_SM_FeToFehh(cplcFeFehhL,cplcFeFehhR,MFe,Mhh,MFe2,Mhh2,            & 
& AmpTreeFeToFehh)

  Else 
Call Amplitude_Tree_SM_FeToFehh(ZcplcFeFehhL,ZcplcFeFehhR,MFe,Mhh,MFe2,               & 
& Mhh2,AmpTreeFeToFehh)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_SM_FeToFehh(MLambda,em,gs,cplcFeFehhL,cplcFeFehhR,MFeOS,              & 
& MhhOS,MRPFeToFehh,MRGFeToFehh)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_SM_FeToFehh(MLambda,em,gs,ZcplcFeFehhL,ZcplcFeFehhR,MFeOS,            & 
& MhhOS,MRPFeToFehh,MRGFeToFehh)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_SM_FeToFehh(MLambda,em,gs,cplcFeFehhL,cplcFeFehhR,MFe,Mhh,            & 
& MRPFeToFehh,MRGFeToFehh)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_SM_FeToFehh(MLambda,em,gs,ZcplcFeFehhL,ZcplcFeFehhR,MFe,              & 
& Mhh,MRPFeToFehh,MRGFeToFehh)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_SM_FeToFehh(cplcFeFehhL,cplcFeFehhR,ctcplcFeFehhL,ctcplcFeFehhR,  & 
& MFe,MFe2,Mhh,Mhh2,ZfEL,ZfER,Zfhh,AmpWaveFeToFehh)



!Vertex Corrections 
Call Amplitude_VERTEX_SM_FeToFehh(MAh,MFe,Mhh,MHp,MVP,MVWp,MVZ,MAh2,MFe2,             & 
& Mhh2,MHp2,MVP2,MVWp2,MVZ2,cplAhAhhh,cplcFeFeAhL,cplcFeFeAhR,cplAhhhVZ,cplcFeFehhL,     & 
& cplcFeFehhR,cplcFvFeHpL,cplcFvFeHpR,cplcFeFeVPL,cplcFeFeVPR,cplcFvFeVWpL,              & 
& cplcFvFeVWpR,cplcFeFeVZL,cplcFeFeVZR,cplcFeFvcHpL,cplcFeFvcHpR,cplcFeFvcVWpL,          & 
& cplcFeFvcVWpR,cplhhhhhh,cplhhHpcHp,cplhhHpcVWp,cplhhcHpVWp,cplhhcVWpVWp,               & 
& cplhhVZVZ,AmpVertexFeToFehh)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_SM_FeToFehh(MAh,MFe,Mhh,MHp,MVP,MVWp,MVZ,MAh2,               & 
& MFe2,Mhh2,MHp2,MVP2,MVWp2,MVZ2,cplAhAhhh,cplcFeFeAhL,cplcFeFeAhR,cplAhhhVZ,            & 
& cplcFeFehhL,cplcFeFehhR,cplcFvFeHpL,cplcFvFeHpR,cplcFeFeVPL,cplcFeFeVPR,               & 
& cplcFvFeVWpL,cplcFvFeVWpR,cplcFeFeVZL,cplcFeFeVZR,cplcFeFvcHpL,cplcFeFvcHpR,           & 
& cplcFeFvcVWpL,cplcFeFvcVWpR,cplhhhhhh,cplhhHpcHp,cplhhHpcVWp,cplhhcHpVWp,              & 
& cplhhcVWpVWp,cplhhVZVZ,AmpVertexIRdrFeToFehh)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_SM_FeToFehh(MAhOS,MFeOS,MhhOS,MHpOS,MVP,MVWpOS,              & 
& MVZOS,MAh2OS,MFe2OS,Mhh2OS,MHp2OS,MVP2,MVWp2OS,MVZ2OS,cplAhAhhh,cplcFeFeAhL,           & 
& cplcFeFeAhR,cplAhhhVZ,ZcplcFeFehhL,ZcplcFeFehhR,cplcFvFeHpL,cplcFvFeHpR,               & 
& cplcFeFeVPL,cplcFeFeVPR,cplcFvFeVWpL,cplcFvFeVWpR,cplcFeFeVZL,cplcFeFeVZR,             & 
& cplcFeFvcHpL,cplcFeFvcHpR,cplcFeFvcVWpL,cplcFeFvcVWpR,cplhhhhhh,cplhhHpcHp,            & 
& cplhhHpcVWp,cplhhcHpVWp,cplhhcVWpVWp,cplhhVZVZ,AmpVertexIRosFeToFehh)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_SM_FeToFehh(MAh,MFe,Mhh,MHp,MVP,MVWp,MVZ,MAh2,               & 
& MFe2,Mhh2,MHp2,MVP2,MVWp2,MVZ2,cplAhAhhh,cplcFeFeAhL,cplcFeFeAhR,cplAhhhVZ,            & 
& ZcplcFeFehhL,ZcplcFeFehhR,cplcFvFeHpL,cplcFvFeHpR,cplcFeFeVPL,cplcFeFeVPR,             & 
& cplcFvFeVWpL,cplcFvFeVWpR,cplcFeFeVZL,cplcFeFeVZR,cplcFeFvcHpL,cplcFeFvcHpR,           & 
& cplcFeFvcVWpL,cplcFeFvcVWpR,cplhhhhhh,cplhhHpcHp,cplhhHpcVWp,cplhhcHpVWp,              & 
& cplhhcVWpVWp,cplhhVZVZ,AmpVertexIRosFeToFehh)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_SM_FeToFehh(MAhOS,MFeOS,MhhOS,MHpOS,MVP,MVWpOS,              & 
& MVZOS,MAh2OS,MFe2OS,Mhh2OS,MHp2OS,MVP2,MVWp2OS,MVZ2OS,cplAhAhhh,cplcFeFeAhL,           & 
& cplcFeFeAhR,cplAhhhVZ,cplcFeFehhL,cplcFeFehhR,cplcFvFeHpL,cplcFvFeHpR,cplcFeFeVPL,     & 
& cplcFeFeVPR,cplcFvFeVWpL,cplcFvFeVWpR,cplcFeFeVZL,cplcFeFeVZR,cplcFeFvcHpL,            & 
& cplcFeFvcHpR,cplcFeFvcVWpL,cplcFeFvcVWpR,cplhhhhhh,cplhhHpcHp,cplhhHpcVWp,             & 
& cplhhcHpVWp,cplhhcVWpVWp,cplhhVZVZ,AmpVertexIRosFeToFehh)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_SM_FeToFehh(MAh,MFe,Mhh,MHp,MVP,MVWp,MVZ,MAh2,               & 
& MFe2,Mhh2,MHp2,MVP2,MVWp2,MVZ2,cplAhAhhh,cplcFeFeAhL,cplcFeFeAhR,cplAhhhVZ,            & 
& cplcFeFehhL,cplcFeFehhR,cplcFvFeHpL,cplcFvFeHpR,cplcFeFeVPL,cplcFeFeVPR,               & 
& cplcFvFeVWpL,cplcFvFeVWpR,cplcFeFeVZL,cplcFeFeVZR,cplcFeFvcHpL,cplcFeFvcHpR,           & 
& cplcFeFvcVWpL,cplcFeFvcVWpR,cplhhhhhh,cplhhHpcHp,cplhhHpcVWp,cplhhcHpVWp,              & 
& cplhhcVWpVWp,cplhhVZVZ,AmpVertexIRosFeToFehh)

 End if 
 End if 
AmpVertexFeToFehh = AmpVertexFeToFehh -  AmpVertexIRdrFeToFehh! +  AmpVertexIRosFeToFehh ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZFeToFehh=0._dp 
AmpVertexZFeToFehh=0._dp 
Do gt1=1,3
  Do gt2=1,3
AmpWaveZFeToFehh(1,gt2,:) = AmpWaveZFeToFehh(1,gt2,:)+ZRUUe(gt2,gt1)*AmpWaveFeToFehh(1,gt1,:) 
AmpVertexZFeToFehh(1,gt2,:)= AmpVertexZFeToFehh(1,gt2,:) + ZRUUe(gt2,gt1)*AmpVertexFeToFehh(1,gt1,:) 
AmpWaveZFeToFehh(2,gt2,:) = AmpWaveZFeToFehh(2,gt2,:)+ZRUVec(gt2,gt1)*AmpWaveFeToFehh(2,gt1,:) 
AmpVertexZFeToFehh(2,gt2,:)= AmpVertexZFeToFehh(2,gt2,:) + ZRUVec(gt2,gt1)*AmpVertexFeToFehh(2,gt1,:) 
 End Do 
End Do 
AmpWaveFeToFehh=AmpWaveZFeToFehh 
AmpVertexFeToFehh= AmpVertexZFeToFehh
! Final State 1 
AmpWaveZFeToFehh=0._dp 
AmpVertexZFeToFehh=0._dp 
Do gt1=1,3
  Do gt2=1,3
AmpWaveZFeToFehh(1,:,gt2) = AmpWaveZFeToFehh(1,:,gt2)+ZRUVe(gt2,gt1)*AmpWaveFeToFehh(1,:,gt1) 
AmpVertexZFeToFehh(1,:,gt2)= AmpVertexZFeToFehh(1,:,gt2)+ZRUVe(gt2,gt1)*AmpVertexFeToFehh(1,:,gt1) 
AmpWaveZFeToFehh(2,:,gt2) = AmpWaveZFeToFehh(2,:,gt2)+ZRUUec(gt2,gt1)*AmpWaveFeToFehh(2,:,gt1) 
AmpVertexZFeToFehh(2,:,gt2)= AmpVertexZFeToFehh(2,:,gt2)+ZRUUec(gt2,gt1)*AmpVertexFeToFehh(2,:,gt1) 
 End Do 
End Do 
AmpWaveFeToFehh=AmpWaveZFeToFehh 
AmpVertexFeToFehh= AmpVertexZFeToFehh
End if
If (ShiftIRdiv) Then 
AmpVertexFeToFehh = AmpVertexFeToFehh  +  AmpVertexIRosFeToFehh
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Fe->Fe hh -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumFeToFehh = AmpTreeFeToFehh 
 AmpSum2FeToFehh = AmpTreeFeToFehh + 2._dp*AmpWaveFeToFehh + 2._dp*AmpVertexFeToFehh  
Else 
 AmpSumFeToFehh = AmpTreeFeToFehh + AmpWaveFeToFehh + AmpVertexFeToFehh
 AmpSum2FeToFehh = AmpTreeFeToFehh + AmpWaveFeToFehh + AmpVertexFeToFehh 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumFeToFehh = AmpTreeFeToFehh
 AmpSum2FeToFehh = AmpTreeFeToFehh 
End if 
Do gt1=1,3
i4 = isave 
  Do gt2=1,3
If (((OSkinematics).and.(Abs(MFeOS(gt1)).gt.(Abs(MFeOS(gt2))+Abs(MhhOS)))).or.((.not.OSkinematics).and.(Abs(MFe(gt1)).gt.(Abs(MFe(gt2))+Abs(Mhh))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2 
  AmpSum2FeToFehh = AmpTreeFeToFehh
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MFeOS(gt1),MFeOS(gt2),MhhOS,AmpSumFeToFehh(:,gt1, gt2),AmpSum2FeToFehh(:,gt1, gt2),AmpSqFeToFehh(gt1, gt2)) 
Else  
  Call SquareAmp_FtoFS(MFe(gt1),MFe(gt2),Mhh,AmpSumFeToFehh(:,gt1, gt2),AmpSum2FeToFehh(:,gt1, gt2),AmpSqFeToFehh(gt1, gt2)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqFeToFehh(gt1, gt2) 
  AmpSum2FeToFehh = 2._dp*AmpWaveFeToFehh
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MFeOS(gt1),MFeOS(gt2),MhhOS,AmpSumFeToFehh(:,gt1, gt2),AmpSum2FeToFehh(:,gt1, gt2),AmpSqFeToFehh(gt1, gt2)) 
Else  
  Call SquareAmp_FtoFS(MFe(gt1),MFe(gt2),Mhh,AmpSumFeToFehh(:,gt1, gt2),AmpSum2FeToFehh(:,gt1, gt2),AmpSqFeToFehh(gt1, gt2)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqFeToFehh(gt1, gt2) 
  AmpSum2FeToFehh = 2._dp*AmpVertexFeToFehh
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MFeOS(gt1),MFeOS(gt2),MhhOS,AmpSumFeToFehh(:,gt1, gt2),AmpSum2FeToFehh(:,gt1, gt2),AmpSqFeToFehh(gt1, gt2)) 
Else  
  Call SquareAmp_FtoFS(MFe(gt1),MFe(gt2),Mhh,AmpSumFeToFehh(:,gt1, gt2),AmpSum2FeToFehh(:,gt1, gt2),AmpSqFeToFehh(gt1, gt2)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqFeToFehh(gt1, gt2) 
  AmpSum2FeToFehh = AmpTreeFeToFehh + 2._dp*AmpWaveFeToFehh + 2._dp*AmpVertexFeToFehh
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MFeOS(gt1),MFeOS(gt2),MhhOS,AmpSumFeToFehh(:,gt1, gt2),AmpSum2FeToFehh(:,gt1, gt2),AmpSqFeToFehh(gt1, gt2)) 
Else  
  Call SquareAmp_FtoFS(MFe(gt1),MFe(gt2),Mhh,AmpSumFeToFehh(:,gt1, gt2),AmpSum2FeToFehh(:,gt1, gt2),AmpSqFeToFehh(gt1, gt2)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqFeToFehh(gt1, gt2) 
 End if 
If (OSkinematics) Then 
  AmpSum2FeToFehh = AmpTreeFeToFehh
  Call SquareAmp_FtoFS(MFeOS(gt1),MFeOS(gt2),MhhOS,AmpSumFeToFehh(:,gt1, gt2),AmpSum2FeToFehh(:,gt1, gt2),AmpSqFeToFehh(gt1, gt2)) 
  AmpSqTreeFeToFehh(gt1, gt2) = AmpSqFeToFehh(gt1, gt2)  
  AmpSum2FeToFehh = + 2._dp*AmpWaveFeToFehh + 2._dp*AmpVertexFeToFehh
  Call SquareAmp_FtoFS(MFeOS(gt1),MFeOS(gt2),MhhOS,AmpSumFeToFehh(:,gt1, gt2),AmpSum2FeToFehh(:,gt1, gt2),AmpSqFeToFehh(gt1, gt2)) 
  AmpSqFeToFehh(gt1, gt2) = AmpSqFeToFehh(gt1, gt2) + AmpSqTreeFeToFehh(gt1, gt2)  
Else  
  AmpSum2FeToFehh = AmpTreeFeToFehh
  Call SquareAmp_FtoFS(MFe(gt1),MFe(gt2),Mhh,AmpSumFeToFehh(:,gt1, gt2),AmpSum2FeToFehh(:,gt1, gt2),AmpSqFeToFehh(gt1, gt2)) 
  AmpSqTreeFeToFehh(gt1, gt2) = AmpSqFeToFehh(gt1, gt2)  
  AmpSum2FeToFehh = + 2._dp*AmpWaveFeToFehh + 2._dp*AmpVertexFeToFehh
  Call SquareAmp_FtoFS(MFe(gt1),MFe(gt2),Mhh,AmpSumFeToFehh(:,gt1, gt2),AmpSum2FeToFehh(:,gt1, gt2),AmpSqFeToFehh(gt1, gt2)) 
  AmpSqFeToFehh(gt1, gt2) = AmpSqFeToFehh(gt1, gt2) + AmpSqTreeFeToFehh(gt1, gt2)  
End if  
Else  
  AmpSqFeToFehh(gt1, gt2) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 2._dp 
If (AmpSqFeToFehh(gt1, gt2).eq.0._dp) Then 
  gP1LFe(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LFe(gt1,i4) = 1._dp*GammaTPS(MFeOS(gt1),MFeOS(gt2),MhhOS,helfactor*AmpSqFeToFehh(gt1, gt2))
Else 
  gP1LFe(gt1,i4) = 1._dp*GammaTPS(MFe(gt1),MFe(gt2),Mhh,helfactor*AmpSqFeToFehh(gt1, gt2))
End if 
If ((Abs(MRPFeToFehh(gt1, gt2)).gt.1.0E-20_dp).or.(Abs(MRGFeToFehh(gt1, gt2)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LFe(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPFeToFehh(gt1, gt2)).gt.1.0E-20_dp).or.(Abs(MRGFeToFehh(gt1, gt2)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*0.5_dp*helfactor*(MRPFeToFehh(gt1, gt2) + MRGFeToFehh(gt1, gt2)) 
  gP1LFe(gt1,i4) = gP1LFe(gt1,i4) + phasespacefactor*0.5_dp*helfactor*(MRPFeToFehh(gt1, gt2) + MRGFeToFehh(gt1, gt2))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LFe(gt1,i4) 
  End if 
End if 
End if 
i4=i4+1

  End do
If (gt1.eq.3) isave = i4 
End do
End If 
If (.not.CalcLoopDecay_LoopInducedOnly) Then 
!---------------- 
! Fe VZ
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_SM_FeToFeVZ(cplcFeFeVZL,cplcFeFeVZR,MFe,MVZ,MFe2,MVZ2,            & 
& AmpTreeFeToFeVZ)

  Else 
Call Amplitude_Tree_SM_FeToFeVZ(ZcplcFeFeVZL,ZcplcFeFeVZR,MFe,MVZ,MFe2,               & 
& MVZ2,AmpTreeFeToFeVZ)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_SM_FeToFeVZ(MLambda,em,gs,cplcFeFeVZL,cplcFeFeVZR,MFeOS,              & 
& MVZOS,MRPFeToFeVZ,MRGFeToFeVZ)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_SM_FeToFeVZ(MLambda,em,gs,ZcplcFeFeVZL,ZcplcFeFeVZR,MFeOS,            & 
& MVZOS,MRPFeToFeVZ,MRGFeToFeVZ)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_SM_FeToFeVZ(MLambda,em,gs,cplcFeFeVZL,cplcFeFeVZR,MFe,MVZ,            & 
& MRPFeToFeVZ,MRGFeToFeVZ)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_SM_FeToFeVZ(MLambda,em,gs,ZcplcFeFeVZL,ZcplcFeFeVZR,MFe,              & 
& MVZ,MRPFeToFeVZ,MRGFeToFeVZ)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_SM_FeToFeVZ(cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,      & 
& ctcplcFeFeVPL,ctcplcFeFeVPR,ctcplcFeFeVZL,ctcplcFeFeVZR,MFe,MFe2,MVP,MVP2,             & 
& MVZ,MVZ2,ZfEL,ZfER,ZfVPVZ,ZfVZ,AmpWaveFeToFeVZ)



!Vertex Corrections 
Call Amplitude_VERTEX_SM_FeToFeVZ(MAh,MFe,Mhh,MHp,MVP,MVWp,MVZ,MAh2,MFe2,             & 
& Mhh2,MHp2,MVP2,MVWp2,MVZ2,cplcFeFeAhL,cplcFeFeAhR,cplAhhhVZ,cplcFeFehhL,               & 
& cplcFeFehhR,cplcFvFeHpL,cplcFvFeHpR,cplcFeFeVPL,cplcFeFeVPR,cplcFvFeVWpL,              & 
& cplcFvFeVWpR,cplcFeFeVZL,cplcFeFeVZR,cplcFvFvVZL,cplcFvFvVZR,cplcFeFvcHpL,             & 
& cplcFeFvcHpR,cplcFeFvcVWpL,cplcFeFvcVWpR,cplhhVZVZ,cplHpcHpVZ,cplHpcVWpVZ,             & 
& cplcHpVWpVZ,cplcVWpVWpVZ,AmpVertexFeToFeVZ)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_SM_FeToFeVZ(MAh,MFe,Mhh,MHp,MVP,MVWp,MVZ,MAh2,               & 
& MFe2,Mhh2,MHp2,MVP2,MVWp2,MVZ2,cplcFeFeAhL,cplcFeFeAhR,cplAhhhVZ,cplcFeFehhL,          & 
& cplcFeFehhR,cplcFvFeHpL,cplcFvFeHpR,cplcFeFeVPL,cplcFeFeVPR,cplcFvFeVWpL,              & 
& cplcFvFeVWpR,cplcFeFeVZL,cplcFeFeVZR,cplcFvFvVZL,cplcFvFvVZR,cplcFeFvcHpL,             & 
& cplcFeFvcHpR,cplcFeFvcVWpL,cplcFeFvcVWpR,cplhhVZVZ,cplHpcHpVZ,cplHpcVWpVZ,             & 
& cplcHpVWpVZ,cplcVWpVWpVZ,AmpVertexIRdrFeToFeVZ)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_SM_FeToFeVZ(MAhOS,MFeOS,MhhOS,MHpOS,MVP,MVWpOS,              & 
& MVZOS,MAh2OS,MFe2OS,Mhh2OS,MHp2OS,MVP2,MVWp2OS,MVZ2OS,cplcFeFeAhL,cplcFeFeAhR,         & 
& cplAhhhVZ,cplcFeFehhL,cplcFeFehhR,cplcFvFeHpL,cplcFvFeHpR,cplcFeFeVPL,cplcFeFeVPR,     & 
& cplcFvFeVWpL,cplcFvFeVWpR,ZcplcFeFeVZL,ZcplcFeFeVZR,cplcFvFvVZL,cplcFvFvVZR,           & 
& cplcFeFvcHpL,cplcFeFvcHpR,cplcFeFvcVWpL,cplcFeFvcVWpR,cplhhVZVZ,cplHpcHpVZ,            & 
& cplHpcVWpVZ,cplcHpVWpVZ,cplcVWpVWpVZ,AmpVertexIRosFeToFeVZ)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_SM_FeToFeVZ(MAh,MFe,Mhh,MHp,MVP,MVWp,MVZ,MAh2,               & 
& MFe2,Mhh2,MHp2,MVP2,MVWp2,MVZ2,cplcFeFeAhL,cplcFeFeAhR,cplAhhhVZ,cplcFeFehhL,          & 
& cplcFeFehhR,cplcFvFeHpL,cplcFvFeHpR,cplcFeFeVPL,cplcFeFeVPR,cplcFvFeVWpL,              & 
& cplcFvFeVWpR,ZcplcFeFeVZL,ZcplcFeFeVZR,cplcFvFvVZL,cplcFvFvVZR,cplcFeFvcHpL,           & 
& cplcFeFvcHpR,cplcFeFvcVWpL,cplcFeFvcVWpR,cplhhVZVZ,cplHpcHpVZ,cplHpcVWpVZ,             & 
& cplcHpVWpVZ,cplcVWpVWpVZ,AmpVertexIRosFeToFeVZ)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_SM_FeToFeVZ(MAhOS,MFeOS,MhhOS,MHpOS,MVP,MVWpOS,              & 
& MVZOS,MAh2OS,MFe2OS,Mhh2OS,MHp2OS,MVP2,MVWp2OS,MVZ2OS,cplcFeFeAhL,cplcFeFeAhR,         & 
& cplAhhhVZ,cplcFeFehhL,cplcFeFehhR,cplcFvFeHpL,cplcFvFeHpR,cplcFeFeVPL,cplcFeFeVPR,     & 
& cplcFvFeVWpL,cplcFvFeVWpR,cplcFeFeVZL,cplcFeFeVZR,cplcFvFvVZL,cplcFvFvVZR,             & 
& cplcFeFvcHpL,cplcFeFvcHpR,cplcFeFvcVWpL,cplcFeFvcVWpR,cplhhVZVZ,cplHpcHpVZ,            & 
& cplHpcVWpVZ,cplcHpVWpVZ,cplcVWpVWpVZ,AmpVertexIRosFeToFeVZ)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_SM_FeToFeVZ(MAh,MFe,Mhh,MHp,MVP,MVWp,MVZ,MAh2,               & 
& MFe2,Mhh2,MHp2,MVP2,MVWp2,MVZ2,cplcFeFeAhL,cplcFeFeAhR,cplAhhhVZ,cplcFeFehhL,          & 
& cplcFeFehhR,cplcFvFeHpL,cplcFvFeHpR,cplcFeFeVPL,cplcFeFeVPR,cplcFvFeVWpL,              & 
& cplcFvFeVWpR,cplcFeFeVZL,cplcFeFeVZR,cplcFvFvVZL,cplcFvFvVZR,cplcFeFvcHpL,             & 
& cplcFeFvcHpR,cplcFeFvcVWpL,cplcFeFvcVWpR,cplhhVZVZ,cplHpcHpVZ,cplHpcVWpVZ,             & 
& cplcHpVWpVZ,cplcVWpVWpVZ,AmpVertexIRosFeToFeVZ)

 End if 
 End if 
AmpVertexFeToFeVZ = AmpVertexFeToFeVZ -  AmpVertexIRdrFeToFeVZ! +  AmpVertexIRosFeToFeVZ ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZFeToFeVZ=0._dp 
AmpVertexZFeToFeVZ=0._dp 
Do gt1=1,3
  Do gt2=1,3
AmpWaveZFeToFeVZ(1,gt2,:) = AmpWaveZFeToFeVZ(1,gt2,:)+ZRUVec(gt2,gt1)*AmpWaveFeToFeVZ(1,gt1,:) 
AmpVertexZFeToFeVZ(1,gt2,:)= AmpVertexZFeToFeVZ(1,gt2,:) + ZRUVec(gt2,gt1)*AmpVertexFeToFeVZ(1,gt1,:) 
AmpWaveZFeToFeVZ(2,gt2,:) = AmpWaveZFeToFeVZ(2,gt2,:)+ZRUUe(gt2,gt1)*AmpWaveFeToFeVZ(2,gt1,:) 
AmpVertexZFeToFeVZ(2,gt2,:)= AmpVertexZFeToFeVZ(2,gt2,:) + ZRUUe(gt2,gt1)*AmpVertexFeToFeVZ(2,gt1,:) 
AmpWaveZFeToFeVZ(3,gt2,:) = AmpWaveZFeToFeVZ(3,gt2,:)+ZRUVec(gt2,gt1)*AmpWaveFeToFeVZ(3,gt1,:) 
AmpVertexZFeToFeVZ(3,gt2,:)= AmpVertexZFeToFeVZ(3,gt2,:) + ZRUVec(gt2,gt1)*AmpVertexFeToFeVZ(3,gt1,:) 
AmpWaveZFeToFeVZ(4,gt2,:) = AmpWaveZFeToFeVZ(4,gt2,:)+ZRUUe(gt2,gt1)*AmpWaveFeToFeVZ(4,gt1,:) 
AmpVertexZFeToFeVZ(4,gt2,:)= AmpVertexZFeToFeVZ(4,gt2,:) + ZRUUe(gt2,gt1)*AmpVertexFeToFeVZ(4,gt1,:) 
 End Do 
End Do 
AmpWaveFeToFeVZ=AmpWaveZFeToFeVZ 
AmpVertexFeToFeVZ= AmpVertexZFeToFeVZ
! Final State 1 
AmpWaveZFeToFeVZ=0._dp 
AmpVertexZFeToFeVZ=0._dp 
Do gt1=1,3
  Do gt2=1,3
AmpWaveZFeToFeVZ(1,:,gt2) = AmpWaveZFeToFeVZ(1,:,gt2)+ZRUVe(gt2,gt1)*AmpWaveFeToFeVZ(1,:,gt1) 
AmpVertexZFeToFeVZ(1,:,gt2)= AmpVertexZFeToFeVZ(1,:,gt2)+ZRUVe(gt2,gt1)*AmpVertexFeToFeVZ(1,:,gt1) 
AmpWaveZFeToFeVZ(2,:,gt2) = AmpWaveZFeToFeVZ(2,:,gt2)+ZRUUec(gt2,gt1)*AmpWaveFeToFeVZ(2,:,gt1) 
AmpVertexZFeToFeVZ(2,:,gt2)= AmpVertexZFeToFeVZ(2,:,gt2)+ZRUUec(gt2,gt1)*AmpVertexFeToFeVZ(2,:,gt1) 
AmpWaveZFeToFeVZ(3,:,gt2) = AmpWaveZFeToFeVZ(3,:,gt2)+ZRUVe(gt2,gt1)*AmpWaveFeToFeVZ(3,:,gt1) 
AmpVertexZFeToFeVZ(3,:,gt2)= AmpVertexZFeToFeVZ(3,:,gt2)+ZRUVe(gt2,gt1)*AmpVertexFeToFeVZ(3,:,gt1) 
AmpWaveZFeToFeVZ(4,:,gt2) = AmpWaveZFeToFeVZ(4,:,gt2)+ZRUUec(gt2,gt1)*AmpWaveFeToFeVZ(4,:,gt1) 
AmpVertexZFeToFeVZ(4,:,gt2)= AmpVertexZFeToFeVZ(4,:,gt2)+ZRUUec(gt2,gt1)*AmpVertexFeToFeVZ(4,:,gt1) 
 End Do 
End Do 
AmpWaveFeToFeVZ=AmpWaveZFeToFeVZ 
AmpVertexFeToFeVZ= AmpVertexZFeToFeVZ
End if
If (ShiftIRdiv) Then 
AmpVertexFeToFeVZ = AmpVertexFeToFeVZ  +  AmpVertexIRosFeToFeVZ
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Fe->Fe VZ -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumFeToFeVZ = AmpTreeFeToFeVZ 
 AmpSum2FeToFeVZ = AmpTreeFeToFeVZ + 2._dp*AmpWaveFeToFeVZ + 2._dp*AmpVertexFeToFeVZ  
Else 
 AmpSumFeToFeVZ = AmpTreeFeToFeVZ + AmpWaveFeToFeVZ + AmpVertexFeToFeVZ
 AmpSum2FeToFeVZ = AmpTreeFeToFeVZ + AmpWaveFeToFeVZ + AmpVertexFeToFeVZ 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumFeToFeVZ = AmpTreeFeToFeVZ
 AmpSum2FeToFeVZ = AmpTreeFeToFeVZ 
End if 
Do gt1=1,3
i4 = isave 
  Do gt2=1,3
If (((OSkinematics).and.(Abs(MFeOS(gt1)).gt.(Abs(MFeOS(gt2))+Abs(MVZOS)))).or.((.not.OSkinematics).and.(Abs(MFe(gt1)).gt.(Abs(MFe(gt2))+Abs(MVZ))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2 
  AmpSum2FeToFeVZ = AmpTreeFeToFeVZ
If (OSkinematics) Then 
  Call SquareAmp_FtoFV(MFeOS(gt1),MFeOS(gt2),MVZOS,AmpSumFeToFeVZ(:,gt1, gt2),AmpSum2FeToFeVZ(:,gt1, gt2),AmpSqFeToFeVZ(gt1, gt2)) 
Else  
  Call SquareAmp_FtoFV(MFe(gt1),MFe(gt2),MVZ,AmpSumFeToFeVZ(:,gt1, gt2),AmpSum2FeToFeVZ(:,gt1, gt2),AmpSqFeToFeVZ(gt1, gt2)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqFeToFeVZ(gt1, gt2) 
  AmpSum2FeToFeVZ = 2._dp*AmpWaveFeToFeVZ
If (OSkinematics) Then 
  Call SquareAmp_FtoFV(MFeOS(gt1),MFeOS(gt2),MVZOS,AmpSumFeToFeVZ(:,gt1, gt2),AmpSum2FeToFeVZ(:,gt1, gt2),AmpSqFeToFeVZ(gt1, gt2)) 
Else  
  Call SquareAmp_FtoFV(MFe(gt1),MFe(gt2),MVZ,AmpSumFeToFeVZ(:,gt1, gt2),AmpSum2FeToFeVZ(:,gt1, gt2),AmpSqFeToFeVZ(gt1, gt2)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqFeToFeVZ(gt1, gt2) 
  AmpSum2FeToFeVZ = 2._dp*AmpVertexFeToFeVZ
If (OSkinematics) Then 
  Call SquareAmp_FtoFV(MFeOS(gt1),MFeOS(gt2),MVZOS,AmpSumFeToFeVZ(:,gt1, gt2),AmpSum2FeToFeVZ(:,gt1, gt2),AmpSqFeToFeVZ(gt1, gt2)) 
Else  
  Call SquareAmp_FtoFV(MFe(gt1),MFe(gt2),MVZ,AmpSumFeToFeVZ(:,gt1, gt2),AmpSum2FeToFeVZ(:,gt1, gt2),AmpSqFeToFeVZ(gt1, gt2)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqFeToFeVZ(gt1, gt2) 
  AmpSum2FeToFeVZ = AmpTreeFeToFeVZ + 2._dp*AmpWaveFeToFeVZ + 2._dp*AmpVertexFeToFeVZ
If (OSkinematics) Then 
  Call SquareAmp_FtoFV(MFeOS(gt1),MFeOS(gt2),MVZOS,AmpSumFeToFeVZ(:,gt1, gt2),AmpSum2FeToFeVZ(:,gt1, gt2),AmpSqFeToFeVZ(gt1, gt2)) 
Else  
  Call SquareAmp_FtoFV(MFe(gt1),MFe(gt2),MVZ,AmpSumFeToFeVZ(:,gt1, gt2),AmpSum2FeToFeVZ(:,gt1, gt2),AmpSqFeToFeVZ(gt1, gt2)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqFeToFeVZ(gt1, gt2) 
 End if 
If (OSkinematics) Then 
  AmpSum2FeToFeVZ = AmpTreeFeToFeVZ
  Call SquareAmp_FtoFV(MFeOS(gt1),MFeOS(gt2),MVZOS,AmpSumFeToFeVZ(:,gt1, gt2),AmpSum2FeToFeVZ(:,gt1, gt2),AmpSqFeToFeVZ(gt1, gt2)) 
  AmpSqTreeFeToFeVZ(gt1, gt2) = AmpSqFeToFeVZ(gt1, gt2)  
  AmpSum2FeToFeVZ = + 2._dp*AmpWaveFeToFeVZ + 2._dp*AmpVertexFeToFeVZ
  Call SquareAmp_FtoFV(MFeOS(gt1),MFeOS(gt2),MVZOS,AmpSumFeToFeVZ(:,gt1, gt2),AmpSum2FeToFeVZ(:,gt1, gt2),AmpSqFeToFeVZ(gt1, gt2)) 
  AmpSqFeToFeVZ(gt1, gt2) = AmpSqFeToFeVZ(gt1, gt2) + AmpSqTreeFeToFeVZ(gt1, gt2)  
Else  
  AmpSum2FeToFeVZ = AmpTreeFeToFeVZ
  Call SquareAmp_FtoFV(MFe(gt1),MFe(gt2),MVZ,AmpSumFeToFeVZ(:,gt1, gt2),AmpSum2FeToFeVZ(:,gt1, gt2),AmpSqFeToFeVZ(gt1, gt2)) 
  AmpSqTreeFeToFeVZ(gt1, gt2) = AmpSqFeToFeVZ(gt1, gt2)  
  AmpSum2FeToFeVZ = + 2._dp*AmpWaveFeToFeVZ + 2._dp*AmpVertexFeToFeVZ
  Call SquareAmp_FtoFV(MFe(gt1),MFe(gt2),MVZ,AmpSumFeToFeVZ(:,gt1, gt2),AmpSum2FeToFeVZ(:,gt1, gt2),AmpSqFeToFeVZ(gt1, gt2)) 
  AmpSqFeToFeVZ(gt1, gt2) = AmpSqFeToFeVZ(gt1, gt2) + AmpSqTreeFeToFeVZ(gt1, gt2)  
End if  
Else  
  AmpSqFeToFeVZ(gt1, gt2) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 2._dp 
If (AmpSqFeToFeVZ(gt1, gt2).eq.0._dp) Then 
  gP1LFe(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LFe(gt1,i4) = 1._dp*GammaTPS(MFeOS(gt1),MFeOS(gt2),MVZOS,helfactor*AmpSqFeToFeVZ(gt1, gt2))
Else 
  gP1LFe(gt1,i4) = 1._dp*GammaTPS(MFe(gt1),MFe(gt2),MVZ,helfactor*AmpSqFeToFeVZ(gt1, gt2))
End if 
If ((Abs(MRPFeToFeVZ(gt1, gt2)).gt.1.0E-20_dp).or.(Abs(MRGFeToFeVZ(gt1, gt2)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LFe(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPFeToFeVZ(gt1, gt2)).gt.1.0E-20_dp).or.(Abs(MRGFeToFeVZ(gt1, gt2)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*0.5_dp*helfactor*(MRPFeToFeVZ(gt1, gt2) + MRGFeToFeVZ(gt1, gt2)) 
  gP1LFe(gt1,i4) = gP1LFe(gt1,i4) + phasespacefactor*0.5_dp*helfactor*(MRPFeToFeVZ(gt1, gt2) + MRGFeToFeVZ(gt1, gt2))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LFe(gt1,i4) 
  End if 
End if 
End if 
i4=i4+1

  End do
If (gt1.eq.3) isave = i4 
End do
End If 
If (.not.CalcLoopDecay_LoopInducedOnly) Then 
!---------------- 
! Fv Conjg(VWp)
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_SM_FeToFvcVWp(cplcFeFvcVWpL,cplcFeFvcVWpR,MFe,MVWp,               & 
& MFe2,MVWp2,AmpTreeFeToFvcVWp)

  Else 
Call Amplitude_Tree_SM_FeToFvcVWp(ZcplcFeFvcVWpL,ZcplcFeFvcVWpR,MFe,MVWp,             & 
& MFe2,MVWp2,AmpTreeFeToFvcVWp)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_SM_FeToFvcVWp(MLambda,em,gs,cplcFeFvcVWpL,cplcFeFvcVWpR,              & 
& MFeOS,MVWpOS,MRPFeToFvcVWp,MRGFeToFvcVWp)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_SM_FeToFvcVWp(MLambda,em,gs,ZcplcFeFvcVWpL,ZcplcFeFvcVWpR,            & 
& MFeOS,MVWpOS,MRPFeToFvcVWp,MRGFeToFvcVWp)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_SM_FeToFvcVWp(MLambda,em,gs,cplcFeFvcVWpL,cplcFeFvcVWpR,              & 
& MFe,MVWp,MRPFeToFvcVWp,MRGFeToFvcVWp)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_SM_FeToFvcVWp(MLambda,em,gs,ZcplcFeFvcVWpL,ZcplcFeFvcVWpR,            & 
& MFe,MVWp,MRPFeToFvcVWp,MRGFeToFvcVWp)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_SM_FeToFvcVWp(cplcFeFvcVWpL,cplcFeFvcVWpR,ctcplcFeFvcVWpL,        & 
& ctcplcFeFvcVWpR,MFe,MFe2,MVWp,MVWp2,ZfEL,ZfER,ZfvL,ZfVWp,AmpWaveFeToFvcVWp)



!Vertex Corrections 
Call Amplitude_VERTEX_SM_FeToFvcVWp(MAh,MFe,Mhh,MHp,MVP,MVWp,MVZ,MAh2,MFe2,           & 
& Mhh2,MHp2,MVP2,MVWp2,MVZ2,cplcFeFeAhL,cplcFeFeAhR,cplAhHpcVWp,cplcFeFehhL,             & 
& cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplcFvFvVZL,               & 
& cplcFvFvVZR,cplcFeFvcHpL,cplcFeFvcHpR,cplcFeFvcVWpL,cplcFeFvcVWpR,cplhhHpcVWp,         & 
& cplhhcVWpVWp,cplHpcVWpVP,cplHpcVWpVZ,cplcVWpVPVWp,cplcVWpVWpVZ,AmpVertexFeToFvcVWp)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_SM_FeToFvcVWp(MAh,MFe,Mhh,MHp,MVP,MVWp,MVZ,MAh2,             & 
& MFe2,Mhh2,MHp2,MVP2,MVWp2,MVZ2,cplcFeFeAhL,cplcFeFeAhR,cplAhHpcVWp,cplcFeFehhL,        & 
& cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplcFvFvVZL,               & 
& cplcFvFvVZR,cplcFeFvcHpL,cplcFeFvcHpR,cplcFeFvcVWpL,cplcFeFvcVWpR,cplhhHpcVWp,         & 
& cplhhcVWpVWp,cplHpcVWpVP,cplHpcVWpVZ,cplcVWpVPVWp,cplcVWpVWpVZ,AmpVertexIRdrFeToFvcVWp)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_SM_FeToFvcVWp(MAhOS,MFeOS,MhhOS,MHpOS,MVP,MVWpOS,            & 
& MVZOS,MAh2OS,MFe2OS,Mhh2OS,MHp2OS,MVP2,MVWp2OS,MVZ2OS,cplcFeFeAhL,cplcFeFeAhR,         & 
& cplAhHpcVWp,cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,               & 
& cplcFeFeVZR,cplcFvFvVZL,cplcFvFvVZR,GosZcplcFeFvcHpL,GosZcplcFeFvcHpR,ZcplcFeFvcVWpL,  & 
& ZcplcFeFvcVWpR,cplhhHpcVWp,cplhhcVWpVWp,GosZcplHpcVWpVP,cplHpcVWpVZ,cplcVWpVPVWp,      & 
& cplcVWpVWpVZ,AmpVertexIRosFeToFvcVWp)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_SM_FeToFvcVWp(MAh,MFe,Mhh,MHp,MVP,MVWp,MVZ,MAh2,             & 
& MFe2,Mhh2,MHp2,MVP2,MVWp2,MVZ2,cplcFeFeAhL,cplcFeFeAhR,cplAhHpcVWp,cplcFeFehhL,        & 
& cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplcFvFvVZL,               & 
& cplcFvFvVZR,GZcplcFeFvcHpL,GZcplcFeFvcHpR,ZcplcFeFvcVWpL,ZcplcFeFvcVWpR,               & 
& cplhhHpcVWp,cplhhcVWpVWp,GZcplHpcVWpVP,cplHpcVWpVZ,cplcVWpVPVWp,cplcVWpVWpVZ,          & 
& AmpVertexIRosFeToFvcVWp)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_SM_FeToFvcVWp(MAhOS,MFeOS,MhhOS,MHpOS,MVP,MVWpOS,            & 
& MVZOS,MAh2OS,MFe2OS,Mhh2OS,MHp2OS,MVP2,MVWp2OS,MVZ2OS,cplcFeFeAhL,cplcFeFeAhR,         & 
& cplAhHpcVWp,cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,               & 
& cplcFeFeVZR,cplcFvFvVZL,cplcFvFvVZR,GcplcFeFvcHpL,GcplcFeFvcHpR,cplcFeFvcVWpL,         & 
& cplcFeFvcVWpR,cplhhHpcVWp,cplhhcVWpVWp,GcplHpcVWpVP,cplHpcVWpVZ,cplcVWpVPVWp,          & 
& cplcVWpVWpVZ,AmpVertexIRosFeToFvcVWp)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_SM_FeToFvcVWp(MAh,MFe,Mhh,MHp,MVP,MVWp,MVZ,MAh2,             & 
& MFe2,Mhh2,MHp2,MVP2,MVWp2,MVZ2,cplcFeFeAhL,cplcFeFeAhR,cplAhHpcVWp,cplcFeFehhL,        & 
& cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplcFvFvVZL,               & 
& cplcFvFvVZR,cplcFeFvcHpL,cplcFeFvcHpR,cplcFeFvcVWpL,cplcFeFvcVWpR,cplhhHpcVWp,         & 
& cplhhcVWpVWp,cplHpcVWpVP,cplHpcVWpVZ,cplcVWpVPVWp,cplcVWpVWpVZ,AmpVertexIRosFeToFvcVWp)

 End if 
 End if 
AmpVertexFeToFvcVWp = AmpVertexFeToFvcVWp -  AmpVertexIRdrFeToFvcVWp! +  AmpVertexIRosFeToFvcVWp ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZFeToFvcVWp=0._dp 
AmpVertexZFeToFvcVWp=0._dp 
Do gt1=1,3
  Do gt2=1,3
AmpWaveZFeToFvcVWp(1,gt2,:) = AmpWaveZFeToFvcVWp(1,gt2,:)+ZRUVec(gt2,gt1)*AmpWaveFeToFvcVWp(1,gt1,:) 
AmpVertexZFeToFvcVWp(1,gt2,:)= AmpVertexZFeToFvcVWp(1,gt2,:) + ZRUVec(gt2,gt1)*AmpVertexFeToFvcVWp(1,gt1,:) 
AmpWaveZFeToFvcVWp(2,gt2,:) = AmpWaveZFeToFvcVWp(2,gt2,:)+ZRUUe(gt2,gt1)*AmpWaveFeToFvcVWp(2,gt1,:) 
AmpVertexZFeToFvcVWp(2,gt2,:)= AmpVertexZFeToFvcVWp(2,gt2,:) + ZRUUe(gt2,gt1)*AmpVertexFeToFvcVWp(2,gt1,:) 
AmpWaveZFeToFvcVWp(3,gt2,:) = AmpWaveZFeToFvcVWp(3,gt2,:)+ZRUVec(gt2,gt1)*AmpWaveFeToFvcVWp(3,gt1,:) 
AmpVertexZFeToFvcVWp(3,gt2,:)= AmpVertexZFeToFvcVWp(3,gt2,:) + ZRUVec(gt2,gt1)*AmpVertexFeToFvcVWp(3,gt1,:) 
AmpWaveZFeToFvcVWp(4,gt2,:) = AmpWaveZFeToFvcVWp(4,gt2,:)+ZRUUe(gt2,gt1)*AmpWaveFeToFvcVWp(4,gt1,:) 
AmpVertexZFeToFvcVWp(4,gt2,:)= AmpVertexZFeToFvcVWp(4,gt2,:) + ZRUUe(gt2,gt1)*AmpVertexFeToFvcVWp(4,gt1,:) 
 End Do 
End Do 
AmpWaveFeToFvcVWp=AmpWaveZFeToFvcVWp 
AmpVertexFeToFvcVWp= AmpVertexZFeToFvcVWp
End if
If (ShiftIRdiv) Then 
AmpVertexFeToFvcVWp = AmpVertexFeToFvcVWp  +  AmpVertexIRosFeToFvcVWp
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Fe->Fv conj[VWp] -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumFeToFvcVWp = AmpTreeFeToFvcVWp 
 AmpSum2FeToFvcVWp = AmpTreeFeToFvcVWp + 2._dp*AmpWaveFeToFvcVWp + 2._dp*AmpVertexFeToFvcVWp  
Else 
 AmpSumFeToFvcVWp = AmpTreeFeToFvcVWp + AmpWaveFeToFvcVWp + AmpVertexFeToFvcVWp
 AmpSum2FeToFvcVWp = AmpTreeFeToFvcVWp + AmpWaveFeToFvcVWp + AmpVertexFeToFvcVWp 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumFeToFvcVWp = AmpTreeFeToFvcVWp
 AmpSum2FeToFvcVWp = AmpTreeFeToFvcVWp 
End if 
Do gt1=1,3
i4 = isave 
  Do gt2=1,3
If (((OSkinematics).and.(Abs(MFeOS(gt1)).gt.(Abs(0.)+Abs(MVWpOS)))).or.((.not.OSkinematics).and.(Abs(MFe(gt1)).gt.(Abs(0._dp)+Abs(MVWp))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2 
  AmpSum2FeToFvcVWp = AmpTreeFeToFvcVWp
If (OSkinematics) Then 
  Call SquareAmp_FtoFV(MFeOS(gt1),0._dp,MVWpOS,AmpSumFeToFvcVWp(:,gt1, gt2),AmpSum2FeToFvcVWp(:,gt1, gt2),AmpSqFeToFvcVWp(gt1, gt2)) 
Else  
  Call SquareAmp_FtoFV(MFe(gt1),0._dp,MVWp,AmpSumFeToFvcVWp(:,gt1, gt2),AmpSum2FeToFvcVWp(:,gt1, gt2),AmpSqFeToFvcVWp(gt1, gt2)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqFeToFvcVWp(gt1, gt2) 
  AmpSum2FeToFvcVWp = 2._dp*AmpWaveFeToFvcVWp
If (OSkinematics) Then 
  Call SquareAmp_FtoFV(MFeOS(gt1),0._dp,MVWpOS,AmpSumFeToFvcVWp(:,gt1, gt2),AmpSum2FeToFvcVWp(:,gt1, gt2),AmpSqFeToFvcVWp(gt1, gt2)) 
Else  
  Call SquareAmp_FtoFV(MFe(gt1),0._dp,MVWp,AmpSumFeToFvcVWp(:,gt1, gt2),AmpSum2FeToFvcVWp(:,gt1, gt2),AmpSqFeToFvcVWp(gt1, gt2)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqFeToFvcVWp(gt1, gt2) 
  AmpSum2FeToFvcVWp = 2._dp*AmpVertexFeToFvcVWp
If (OSkinematics) Then 
  Call SquareAmp_FtoFV(MFeOS(gt1),0._dp,MVWpOS,AmpSumFeToFvcVWp(:,gt1, gt2),AmpSum2FeToFvcVWp(:,gt1, gt2),AmpSqFeToFvcVWp(gt1, gt2)) 
Else  
  Call SquareAmp_FtoFV(MFe(gt1),0._dp,MVWp,AmpSumFeToFvcVWp(:,gt1, gt2),AmpSum2FeToFvcVWp(:,gt1, gt2),AmpSqFeToFvcVWp(gt1, gt2)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqFeToFvcVWp(gt1, gt2) 
  AmpSum2FeToFvcVWp = AmpTreeFeToFvcVWp + 2._dp*AmpWaveFeToFvcVWp + 2._dp*AmpVertexFeToFvcVWp
If (OSkinematics) Then 
  Call SquareAmp_FtoFV(MFeOS(gt1),0._dp,MVWpOS,AmpSumFeToFvcVWp(:,gt1, gt2),AmpSum2FeToFvcVWp(:,gt1, gt2),AmpSqFeToFvcVWp(gt1, gt2)) 
Else  
  Call SquareAmp_FtoFV(MFe(gt1),0._dp,MVWp,AmpSumFeToFvcVWp(:,gt1, gt2),AmpSum2FeToFvcVWp(:,gt1, gt2),AmpSqFeToFvcVWp(gt1, gt2)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqFeToFvcVWp(gt1, gt2) 
 End if 
If (OSkinematics) Then 
  AmpSum2FeToFvcVWp = AmpTreeFeToFvcVWp
  Call SquareAmp_FtoFV(MFeOS(gt1),0._dp,MVWpOS,AmpSumFeToFvcVWp(:,gt1, gt2),AmpSum2FeToFvcVWp(:,gt1, gt2),AmpSqFeToFvcVWp(gt1, gt2)) 
  AmpSqTreeFeToFvcVWp(gt1, gt2) = AmpSqFeToFvcVWp(gt1, gt2)  
  AmpSum2FeToFvcVWp = + 2._dp*AmpWaveFeToFvcVWp + 2._dp*AmpVertexFeToFvcVWp
  Call SquareAmp_FtoFV(MFeOS(gt1),0._dp,MVWpOS,AmpSumFeToFvcVWp(:,gt1, gt2),AmpSum2FeToFvcVWp(:,gt1, gt2),AmpSqFeToFvcVWp(gt1, gt2)) 
  AmpSqFeToFvcVWp(gt1, gt2) = AmpSqFeToFvcVWp(gt1, gt2) + AmpSqTreeFeToFvcVWp(gt1, gt2)  
Else  
  AmpSum2FeToFvcVWp = AmpTreeFeToFvcVWp
  Call SquareAmp_FtoFV(MFe(gt1),0._dp,MVWp,AmpSumFeToFvcVWp(:,gt1, gt2),AmpSum2FeToFvcVWp(:,gt1, gt2),AmpSqFeToFvcVWp(gt1, gt2)) 
  AmpSqTreeFeToFvcVWp(gt1, gt2) = AmpSqFeToFvcVWp(gt1, gt2)  
  AmpSum2FeToFvcVWp = + 2._dp*AmpWaveFeToFvcVWp + 2._dp*AmpVertexFeToFvcVWp
  Call SquareAmp_FtoFV(MFe(gt1),0._dp,MVWp,AmpSumFeToFvcVWp(:,gt1, gt2),AmpSum2FeToFvcVWp(:,gt1, gt2),AmpSqFeToFvcVWp(gt1, gt2)) 
  AmpSqFeToFvcVWp(gt1, gt2) = AmpSqFeToFvcVWp(gt1, gt2) + AmpSqTreeFeToFvcVWp(gt1, gt2)  
End if  
Else  
  AmpSqFeToFvcVWp(gt1, gt2) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 2._dp 
If (AmpSqFeToFvcVWp(gt1, gt2).eq.0._dp) Then 
  gP1LFe(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LFe(gt1,i4) = 1._dp*GammaTPS(MFeOS(gt1),0._dp,MVWpOS,helfactor*AmpSqFeToFvcVWp(gt1, gt2))
Else 
  gP1LFe(gt1,i4) = 1._dp*GammaTPS(MFe(gt1),0._dp,MVWp,helfactor*AmpSqFeToFvcVWp(gt1, gt2))
End if 
If ((Abs(MRPFeToFvcVWp(gt1, gt2)).gt.1.0E-20_dp).or.(Abs(MRGFeToFvcVWp(gt1, gt2)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LFe(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPFeToFvcVWp(gt1, gt2)).gt.1.0E-20_dp).or.(Abs(MRGFeToFvcVWp(gt1, gt2)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*0.5_dp*helfactor*(MRPFeToFvcVWp(gt1, gt2) + MRGFeToFvcVWp(gt1, gt2)) 
  gP1LFe(gt1,i4) = gP1LFe(gt1,i4) + phasespacefactor*0.5_dp*helfactor*(MRPFeToFvcVWp(gt1, gt2) + MRGFeToFvcVWp(gt1, gt2))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LFe(gt1,i4) 
  End if 
End if 
End if 
i4=i4+1

  End do
If (gt1.eq.3) isave = i4 
End do
End If 
!---------------- 
! Fe VP
!---------------- 

If (LoopInducedDecaysOS) Then 


!Self-energy Corrections 
 If (ExternalZfactors) Then 
Call Amplitude_WAVE_SM_FeToFeVP(ZcplcFeFeVPL,ZcplcFeFeVPR,ZcplcFeFeVZL,               & 
& ZcplcFeFeVZR,ctcplcFeFeVPL,ctcplcFeFeVPR,ctcplcFeFeVZL,ctcplcFeFeVZR,MFeOS,            & 
& MFe2OS,MVP,MVP2,ZfEL,ZfER,ZfVP,ZfVZVP,AmpWaveFeToFeVP)

 Else 
Call Amplitude_WAVE_SM_FeToFeVP(cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,      & 
& ctcplcFeFeVPL,ctcplcFeFeVPR,ctcplcFeFeVZL,ctcplcFeFeVZR,MFeOS,MFe2OS,MVP,              & 
& MVP2,ZfEL,ZfER,ZfVP,ZfVZVP,AmpWaveFeToFeVP)

 End if 


!Vertex Corrections 
 If (ExternalZfactors) Then 
Call Amplitude_VERTEX_SM_FeToFeVP(MAhOS,MFeOS,MhhOS,MHpOS,MVP,MVWpOS,MVZOS,           & 
& MAh2OS,MFe2OS,Mhh2OS,MHp2OS,MVP2,MVWp2OS,MVZ2OS,ZcplcFeFeAhL,ZcplcFeFeAhR,             & 
& ZcplcFeFehhL,ZcplcFeFehhR,ZcplcFvFeHpL,ZcplcFvFeHpR,ZcplcFeFeVPL,ZcplcFeFeVPR,         & 
& ZcplcFvFeVWpL,ZcplcFvFeVWpR,ZcplcFeFeVZL,ZcplcFeFeVZR,ZcplcFeFvcHpL,ZcplcFeFvcHpR,     & 
& ZcplcFeFvcVWpL,ZcplcFeFvcVWpR,ZcplHpcHpVP,ZcplHpcVWpVP,ZcplcHpVPVWp,ZcplcVWpVPVWp,     & 
& AmpVertexFeToFeVP)

 Else 
Call Amplitude_VERTEX_SM_FeToFeVP(MAhOS,MFeOS,MhhOS,MHpOS,MVP,MVWpOS,MVZOS,           & 
& MAh2OS,MFe2OS,Mhh2OS,MHp2OS,MVP2,MVWp2OS,MVZ2OS,cplcFeFeAhL,cplcFeFeAhR,               & 
& cplcFeFehhL,cplcFeFehhR,cplcFvFeHpL,cplcFvFeHpR,cplcFeFeVPL,cplcFeFeVPR,               & 
& cplcFvFeVWpL,cplcFvFeVWpR,cplcFeFeVZL,cplcFeFeVZR,cplcFeFvcHpL,cplcFeFvcHpR,           & 
& cplcFeFvcVWpL,cplcFeFvcVWpR,cplHpcHpVP,cplHpcVWpVP,cplcHpVPVWp,cplcVWpVPVWp,           & 
& AmpVertexFeToFeVP)

 End if 
Else 


!Self-energy Corrections 
Call Amplitude_WAVE_SM_FeToFeVP(cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,      & 
& ctcplcFeFeVPL,ctcplcFeFeVPR,ctcplcFeFeVZL,ctcplcFeFeVZR,MFe,MFe2,MVP,MVP2,             & 
& ZfEL,ZfER,ZfVP,ZfVZVP,AmpWaveFeToFeVP)



!Vertex Corrections 
Call Amplitude_VERTEX_SM_FeToFeVP(MAh,MFe,Mhh,MHp,MVP,MVWp,MVZ,MAh2,MFe2,             & 
& Mhh2,MHp2,MVP2,MVWp2,MVZ2,cplcFeFeAhL,cplcFeFeAhR,cplcFeFehhL,cplcFeFehhR,             & 
& cplcFvFeHpL,cplcFvFeHpR,cplcFeFeVPL,cplcFeFeVPR,cplcFvFeVWpL,cplcFvFeVWpR,             & 
& cplcFeFeVZL,cplcFeFeVZR,cplcFeFvcHpL,cplcFeFvcHpR,cplcFeFvcVWpL,cplcFeFvcVWpR,         & 
& cplHpcHpVP,cplHpcVWpVP,cplcHpVPVWp,cplcVWpVPVWp,AmpVertexFeToFeVP)

End if 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Fe->Fe VP -----------------------" 
End if 
If (OnlyTreeLevelContributions) Then 
 AmpSumFeToFeVP = 0._dp 
 AmpSum2FeToFeVP = 0._dp  
Else 
 AmpSumFeToFeVP = AmpVertexFeToFeVP + AmpWaveFeToFeVP
 AmpSum2FeToFeVP = AmpVertexFeToFeVP + AmpWaveFeToFeVP 
End If 
Do gt1=1,3
i4 = isave 
  Do gt2=1,3
If (((OSkinematics).and.(Abs(MFeOS(gt1)).gt.(Abs(MFeOS(gt2))+Abs(0.)))).or.((.not.OSkinematics).and.(Abs(MFe(gt1)).gt.(Abs(MFe(gt2))+Abs(MVP))))) Then 
If (OSkinematics) Then 
  Call SquareAmp_FtoFV(MFeOS(gt1),MFeOS(gt2),0._dp,AmpSumFeToFeVP(:,gt1, gt2),AmpSum2FeToFeVP(:,gt1, gt2),AmpSqFeToFeVP(gt1, gt2)) 
Else  
  Call SquareAmp_FtoFV(MFe(gt1),MFe(gt2),MVP,AmpSumFeToFeVP(:,gt1, gt2),AmpSum2FeToFeVP(:,gt1, gt2),AmpSqFeToFeVP(gt1, gt2)) 
End if  
Else  
  AmpSqFeToFeVP(gt1, gt2) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 2._dp 
If (AmpSqFeToFeVP(gt1, gt2).eq.0._dp) Then 
  gP1LFe(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LFe(gt1,i4) = 1._dp*GammaTPS(MFeOS(gt1),MFeOS(gt2),0._dp,helfactor*AmpSqFeToFeVP(gt1, gt2))
Else 
  gP1LFe(gt1,i4) = 1._dp*GammaTPS(MFe(gt1),MFe(gt2),MVP,helfactor*AmpSqFeToFeVP(gt1, gt2))
End if 
If ((Abs(MRPFeToFeVP(gt1, gt2)).gt.1.0E-20_dp).or.(Abs(MRGFeToFeVP(gt1, gt2)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LFe(gt1,i4) 
End if 
i4=i4+1

  End do
If (gt1.eq.3) isave = i4 
End do
End Subroutine OneLoopDecay_Fe

End Module Wrapper_OneLoopDecay_Fe_SM
