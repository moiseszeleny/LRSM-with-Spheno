! ------------------------------------------------------------------------------  
! This file was automatically created by SARAH version 4.15.3 
! SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223,
!           1405.1434, 1411.0675, 1503.03098, 1703.09237, 1706.05372, 1805.07306  
! (c) Florian Staub, Mark Goodsell and Werner Porod 2020  
! ------------------------------------------------------------------------------  
! File created at 15:44 on 18.6.2025   
! ----------------------------------------------------------------------  
 
 
Module FlavorKit_QFV_SM 
Use Control 
Use Settings 
Use Couplings_SM 
Use LoopCouplings_SM 
Use LoopMasses_SM_HC 
Use LoopFunctions 
Use LoopMasses_SM 
Use StandardModel 

 
 Contains 
 
Subroutine CalculateBox2d2L(gt1,gt2,gt3,gt4,OnlySM,MAh,MAh2,MFd,MFd2,MFe,             & 
& MFe2,MFu,MFu2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,cplAhAhhh,cplAhcHpVWp,             & 
& cplAhhhVZ,cplAhHpcVWp,cplcFdFdAhL,cplcFdFdAhR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVPL,     & 
& cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,cplcFdFucHpL,cplcFdFucHpR,cplcFdFucVWpL,           & 
& cplcFdFucVWpR,cplcFeFeAhL,cplcFeFeAhR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,             & 
& cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplcFeFvcHpL,cplcFeFvcHpR,cplcFeFvcVWpL,           & 
& cplcFeFvcVWpR,cplcFuFdHpL,cplcFuFdHpR,cplcFuFdVWpL,cplcFuFdVWpR,cplcFuFuAhL,           & 
& cplcFuFuAhR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZL,               & 
& cplcFuFuVZR,cplcFvFeHpL,cplcFvFeHpR,cplcFvFeVWpL,cplcFvFeVWpR,cplcHpVPVWp,             & 
& cplcHpVWpVZ,cplcVWpVPVWp,cplcVWpVWpVZ,cplhhcHpVWp,cplhhcVWpVWp,cplhhhhhh,              & 
& cplhhHpcHp,cplhhHpcVWp,cplhhVZVZ,cplHpcHpVP,cplHpcHpVZ,cplHpcVWpVP,cplHpcVWpVZ,        & 
& BOddllSLL,BOddllSRR,BOddllSRL,BOddllSLR,BOddllVRR,BOddllVLL,BOddllVRL,BOddllVLR,       & 
& BOddllTLL,BOddllTLR,BOddllTRL,BOddllTRR)

! ---------------------------------------------------------------- 
! Code based on automatically generated SARAH extensions by 'PreSARAH' 
! Expressions for amplitudes are obtained by FeynArts/FormCalc 
! Based on user input for process Box2d2L 
! 'PreSARAH' output has been generated  at 16:40 on 10.6.2016 
! ---------------------------------------------------------------- 
 
Implicit None 
Real(dp),Intent(in) :: MAh,MAh2,MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),Mhh,Mhh2,MHp,MHp2,              & 
& MVWp,MVWp2,MVZ,MVZ2

Complex(dp),Intent(in) :: cplAhAhhh,cplAhcHpVWp,cplAhhhVZ,cplAhHpcVWp,cplcFdFdAhL(3,3),cplcFdFdAhR(3,3),        & 
& cplcFdFdhhL(3,3),cplcFdFdhhR(3,3),cplcFdFdVPL(3,3),cplcFdFdVPR(3,3),cplcFdFdVZL(3,3),  & 
& cplcFdFdVZR(3,3),cplcFdFucHpL(3,3),cplcFdFucHpR(3,3),cplcFdFucVWpL(3,3),               & 
& cplcFdFucVWpR(3,3),cplcFeFeAhL(3,3),cplcFeFeAhR(3,3),cplcFeFehhL(3,3),cplcFeFehhR(3,3),& 
& cplcFeFeVPL(3,3),cplcFeFeVPR(3,3),cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),cplcFeFvcHpL(3,3), & 
& cplcFeFvcHpR(3,3),cplcFeFvcVWpL(3,3),cplcFeFvcVWpR(3,3),cplcFuFdHpL(3,3),              & 
& cplcFuFdHpR(3,3),cplcFuFdVWpL(3,3),cplcFuFdVWpR(3,3),cplcFuFuAhL(3,3),cplcFuFuAhR(3,3),& 
& cplcFuFuhhL(3,3),cplcFuFuhhR(3,3),cplcFuFuVPL(3,3),cplcFuFuVPR(3,3),cplcFuFuVZL(3,3),  & 
& cplcFuFuVZR(3,3),cplcFvFeHpL(3,3),cplcFvFeHpR(3,3),cplcFvFeVWpL(3,3),cplcFvFeVWpR(3,3),& 
& cplcHpVPVWp,cplcHpVWpVZ,cplcVWpVPVWp,cplcVWpVWpVZ,cplhhcHpVWp,cplhhcVWpVWp,            & 
& cplhhhhhh,cplhhHpcHp,cplhhHpcVWp,cplhhVZVZ,cplHpcHpVP,cplHpcHpVZ,cplHpcVWpVP,          & 
& cplHpcVWpVZ

Integer,Intent(in) :: gt1, gt2,gt3,gt4 
Logical, Intent(in) :: OnlySM 
Integer :: iprop, i1, i2, i3, i4 
Real(dp) :: MassEx1,MassEx2,MassEx3,MassEx4, MassEx12,MassEx22,MassEx32,MassEx42 
Complex(dp), Intent(out) :: BOddllSLL 
Complex(dp), Intent(out) :: BOddllSRR 
Complex(dp), Intent(out) :: BOddllSRL 
Complex(dp), Intent(out) :: BOddllSLR 
Complex(dp), Intent(out) :: BOddllVRR 
Complex(dp), Intent(out) :: BOddllVLL 
Complex(dp), Intent(out) :: BOddllVRL 
Complex(dp), Intent(out) :: BOddllVLR 
Complex(dp), Intent(out) :: BOddllTLL 
Complex(dp), Intent(out) :: BOddllTLR 
Complex(dp), Intent(out) :: BOddllTRL 
Complex(dp), Intent(out) :: BOddllTRR 
Complex(dp) :: vertex1L, vertex1R, vertex2L, vertex2R 
Real(dp) ::  MP, MP2, IMP2, IMP, MFin, MFin2, IMFin, IMFin2, Finite  
Real(dp) ::  MS1, MS12, MS2, MS22, MF1, MF12, MF2, MF22, MV1, MV12, MV2, MV22  
Complex(dp) ::  chargefactor  
Complex(dp) ::  coup1L, coup1R, coup2L, coup2R, coup3L, coup3R, coup3, coup4L, coup4R 

Complex(dp) ::  int1,int2,int3,int4,int5,int6,int7,int8 

Iname=Iname+1 
NameOfUnit(Iname)='CalculateBox2d2L' 

Finite=1._dp 
MassEx1=MFd(gt1)  
MassEx12=MFd2(gt1) 
MassEx2=MFd(gt2)  
MassEx22=MFd2(gt2) 
MassEx3=MFe(gt3)  
MassEx32=MFe2(gt3) 
MassEx4=MFe(gt4)  
MassEx42=MFe2(gt4) 
! ------------------------------ 
 ! Amplitudes for external states 
 ! {DownQuark, bar[DownQuark], ChargedLepton, bar[ChargedLepton]} 
 ! ------------------------------ 
 
BOddllSLL=0._dp 
BOddllSRR=0._dp 
BOddllSRL=0._dp 
BOddllSLR=0._dp 
BOddllVRR=0._dp 
BOddllVLL=0._dp 
BOddllVRL=0._dp 
BOddllVLR=0._dp 
BOddllTLL=0._dp 
BOddllTLR=0._dp 
BOddllTRL=0._dp 
BOddllTRR=0._dp 
!----------------------------- 
! Box Contributions            
!----------------------------- 
! Fd,Ah,bar[Fe],Ah
chargefactor = 1 
! Generic diagram: FSSF,  InsertionOrder: 1
Do i1=1,3
    Do i3=1,3
If ((MFd2(i1).gt.mf_l2(3)).Or.(MAh2.gt.mf_l2(3)).Or.(MFe2(i3).gt.mf_l2(3)).Or.(MAh2.gt.mf_l2(3))) Then
If (((i1.lt.4).and.(i3.lt.4)).or.(.not.OnlySM)) Then 
coup1L = cplcFdFdAhL(i1,gt1)
coup1R = cplcFdFdAhR(i1,gt1)
coup2L = cplcFdFdAhL(gt2,i1)
coup2R = cplcFdFdAhR(gt2,i1)
coup3L = cplcFeFeAhL(i3,gt3)
coup3R = cplcFeFeAhR(i3,gt3)
coup4L = cplcFeFeAhL(gt4,i3)
coup4R = cplcFeFeAhR(gt4,i3)
mF1 = MFd(i1)
mF12 = MFd2(i1)
mS1 = MAh
mS12 = MAh2
mF2 = MFe(i3)
mF22 = MFe2(i3)
mS2 = MAh
mS22 = MAh2
  int1=D00check(mF12, mF22, mS22, mS12)
  int2=MMD0(mF1, mF2, mF12, mF22, mS22, mS12)
  BOddllSLL=BOddllSLL - 1.*chargefactor*coup1L*coup2L*coup3L*coup4L*int2
  BOddllSRR=BOddllSRR - 1.*chargefactor*coup1R*coup2R*coup3R*coup4R*int2
  BOddllSRL=BOddllSRL - 1.*chargefactor*coup1R*coup2R*coup3L*coup4L*int2
  BOddllSLR=BOddllSLR - 1.*chargefactor*coup1L*coup2L*coup3R*coup4R*int2
  BOddllVRR=BOddllVRR+chargefactor*coup1R*coup2L*coup3R*coup4L*int1
  BOddllVLL=BOddllVLL+chargefactor*coup1L*coup2R*coup3L*coup4R*int1
  BOddllVRL=BOddllVRL+chargefactor*coup1R*coup2L*coup3L*coup4R*int1
  BOddllVLR=BOddllVLR+chargefactor*coup1L*coup2R*coup3R*coup4L*int1
  BOddllTLL=BOddllTLL+0.
  BOddllTLR=BOddllTLR+0.
  BOddllTRL=BOddllTRL+0.
  BOddllTRR=BOddllTRR+0.
  End if 
End if 
    End Do 
  End Do 


 ! Fd,hh,bar[Fe],Ah
chargefactor = 1 
! Generic diagram: FSSF,  InsertionOrder: 1
Do i1=1,3
    Do i3=1,3
If ((MFd2(i1).gt.mf_l2(3)).Or.(Mhh2.gt.mf_l2(3)).Or.(MFe2(i3).gt.mf_l2(3)).Or.(MAh2.gt.mf_l2(3))) Then
If (.not.OnlySM) Then 
coup1L = cplcFdFdAhL(i1,gt1)
coup1R = cplcFdFdAhR(i1,gt1)
coup2L = cplcFdFdhhL(gt2,i1)
coup2R = cplcFdFdhhR(gt2,i1)
coup3L = cplcFeFeAhL(i3,gt3)
coup3R = cplcFeFeAhR(i3,gt3)
coup4L = cplcFeFehhL(gt4,i3)
coup4R = cplcFeFehhR(gt4,i3)
mF1 = MFd(i1)
mF12 = MFd2(i1)
mS1 = MAh
mS12 = MAh2
mF2 = MFe(i3)
mF22 = MFe2(i3)
mS2 = Mhh
mS22 = Mhh2
  int1=D00check(mF12, mF22, mS22, mS12)
  int2=MMD0(mF1, mF2, mF12, mF22, mS22, mS12)
  BOddllSLL=BOddllSLL - 1.*chargefactor*coup1L*coup2L*coup3L*coup4L*int2
  BOddllSRR=BOddllSRR - 1.*chargefactor*coup1R*coup2R*coup3R*coup4R*int2
  BOddllSRL=BOddllSRL - 1.*chargefactor*coup1R*coup2R*coup3L*coup4L*int2
  BOddllSLR=BOddllSLR - 1.*chargefactor*coup1L*coup2L*coup3R*coup4R*int2
  BOddllVRR=BOddllVRR+chargefactor*coup1R*coup2L*coup3R*coup4L*int1
  BOddllVLL=BOddllVLL+chargefactor*coup1L*coup2R*coup3L*coup4R*int1
  BOddllVRL=BOddllVRL+chargefactor*coup1R*coup2L*coup3L*coup4R*int1
  BOddllVLR=BOddllVLR+chargefactor*coup1L*coup2R*coup3R*coup4L*int1
  BOddllTLL=BOddllTLL+0.
  BOddllTLR=BOddllTLR+0.
  BOddllTRL=BOddllTRL+0.
  BOddllTRR=BOddllTRR+0.
  End if 
End if 
    End Do 
  End Do 


 ! Fd,VZ,bar[Fe],Ah
chargefactor = 1 
! Generic diagram: FSVF,  InsertionOrder: 1
Do i1=1,3
    Do i3=1,3
If ((MFd2(i1).gt.mf_l2(3)).Or.(MVZ2.gt.mf_l2(3)).Or.(MFe2(i3).gt.mf_l2(3)).Or.(MAh2.gt.mf_l2(3))) Then
If (((i1.lt.4).and.(i3.lt.4)).or.(.not.OnlySM)) Then 
coup1L = cplcFdFdAhL(i1,gt1)
coup1R = cplcFdFdAhR(i1,gt1)
coup2L = cplcFdFdVZL(gt2,i1)
coup2R = cplcFdFdVZR(gt2,i1)
coup3L = cplcFeFeAhL(i3,gt3)
coup3R = cplcFeFeAhR(i3,gt3)
coup4L = cplcFeFeVZL(gt4,i3)
coup4R = cplcFeFeVZR(gt4,i3)
mF1 = MFd(i1)
mF12 = MFd2(i1)
mS1 = MAh
mS12 = MAh2
mF2 = MFe(i3)
mF22 = MFe2(i3)
mV2 = MVZ
mV22 = MVZ2
  int1=D00check(mF12, mF22, mV22, mS12)
  int2=MMD0(mF1, mF2, mF12, mF22, mV22, mS12)
  BOddllSLL=BOddllSLL - 4.*chargefactor*coup1L*coup2R*coup3L*coup4R*int1
  BOddllSRR=BOddllSRR - 4.*chargefactor*coup1R*coup2L*coup3R*coup4L*int1
  BOddllSRL=BOddllSRL - 4.*chargefactor*coup1R*coup2L*coup3L*coup4R*int1
  BOddllSLR=BOddllSLR - 4.*chargefactor*coup1L*coup2R*coup3R*coup4L*int1
  BOddllVRR=BOddllVRR+chargefactor*coup1R*coup2R*coup3R*coup4R*int2
  BOddllVLL=BOddllVLL+chargefactor*coup1L*coup2L*coup3L*coup4L*int2
  BOddllVRL=BOddllVRL+chargefactor*coup1R*coup2R*coup3L*coup4L*int2
  BOddllVLR=BOddllVLR+chargefactor*coup1L*coup2L*coup3R*coup4R*int2
  BOddllTLL=BOddllTLL - 1.*chargefactor*coup1L*coup2R*coup3L*coup4R*int1
  BOddllTLR=BOddllTLR+0.
  BOddllTRL=BOddllTRL+0.
  BOddllTRR=BOddllTRR - 1.*chargefactor*coup1R*coup2L*coup3R*coup4L*int1
  End if 
End if 
    End Do 
  End Do 


 ! Fd,Ah,bar[Fe],hh
chargefactor = 1 
! Generic diagram: FSSF,  InsertionOrder: 1
Do i1=1,3
    Do i3=1,3
If ((MFd2(i1).gt.mf_l2(3)).Or.(MAh2.gt.mf_l2(3)).Or.(MFe2(i3).gt.mf_l2(3)).Or.(Mhh2.gt.mf_l2(3))) Then
If (.not.OnlySM) Then 
coup1L = cplcFdFdhhL(i1,gt1)
coup1R = cplcFdFdhhR(i1,gt1)
coup2L = cplcFdFdAhL(gt2,i1)
coup2R = cplcFdFdAhR(gt2,i1)
coup3L = cplcFeFehhL(i3,gt3)
coup3R = cplcFeFehhR(i3,gt3)
coup4L = cplcFeFeAhL(gt4,i3)
coup4R = cplcFeFeAhR(gt4,i3)
mF1 = MFd(i1)
mF12 = MFd2(i1)
mS1 = Mhh
mS12 = Mhh2
mF2 = MFe(i3)
mF22 = MFe2(i3)
mS2 = MAh
mS22 = MAh2
  int1=D00check(mF12, mF22, mS22, mS12)
  int2=MMD0(mF1, mF2, mF12, mF22, mS22, mS12)
  BOddllSLL=BOddllSLL - 1.*chargefactor*coup1L*coup2L*coup3L*coup4L*int2
  BOddllSRR=BOddllSRR - 1.*chargefactor*coup1R*coup2R*coup3R*coup4R*int2
  BOddllSRL=BOddllSRL - 1.*chargefactor*coup1R*coup2R*coup3L*coup4L*int2
  BOddllSLR=BOddllSLR - 1.*chargefactor*coup1L*coup2L*coup3R*coup4R*int2
  BOddllVRR=BOddllVRR+chargefactor*coup1R*coup2L*coup3R*coup4L*int1
  BOddllVLL=BOddllVLL+chargefactor*coup1L*coup2R*coup3L*coup4R*int1
  BOddllVRL=BOddllVRL+chargefactor*coup1R*coup2L*coup3L*coup4R*int1
  BOddllVLR=BOddllVLR+chargefactor*coup1L*coup2R*coup3R*coup4L*int1
  BOddllTLL=BOddllTLL+0.
  BOddllTLR=BOddllTLR+0.
  BOddllTRL=BOddllTRL+0.
  BOddllTRR=BOddllTRR+0.
  End if 
End if 
    End Do 
  End Do 


 ! Fd,hh,bar[Fe],hh
chargefactor = 1 
! Generic diagram: FSSF,  InsertionOrder: 1
Do i1=1,3
    Do i3=1,3
If ((MFd2(i1).gt.mf_l2(3)).Or.(Mhh2.gt.mf_l2(3)).Or.(MFe2(i3).gt.mf_l2(3)).Or.(Mhh2.gt.mf_l2(3))) Then
If (.not.OnlySM) Then 
coup1L = cplcFdFdhhL(i1,gt1)
coup1R = cplcFdFdhhR(i1,gt1)
coup2L = cplcFdFdhhL(gt2,i1)
coup2R = cplcFdFdhhR(gt2,i1)
coup3L = cplcFeFehhL(i3,gt3)
coup3R = cplcFeFehhR(i3,gt3)
coup4L = cplcFeFehhL(gt4,i3)
coup4R = cplcFeFehhR(gt4,i3)
mF1 = MFd(i1)
mF12 = MFd2(i1)
mS1 = Mhh
mS12 = Mhh2
mF2 = MFe(i3)
mF22 = MFe2(i3)
mS2 = Mhh
mS22 = Mhh2
  int1=D00check(mF12, mF22, mS22, mS12)
  int2=MMD0(mF1, mF2, mF12, mF22, mS22, mS12)
  BOddllSLL=BOddllSLL - 1.*chargefactor*coup1L*coup2L*coup3L*coup4L*int2
  BOddllSRR=BOddllSRR - 1.*chargefactor*coup1R*coup2R*coup3R*coup4R*int2
  BOddllSRL=BOddllSRL - 1.*chargefactor*coup1R*coup2R*coup3L*coup4L*int2
  BOddllSLR=BOddllSLR - 1.*chargefactor*coup1L*coup2L*coup3R*coup4R*int2
  BOddllVRR=BOddllVRR+chargefactor*coup1R*coup2L*coup3R*coup4L*int1
  BOddllVLL=BOddllVLL+chargefactor*coup1L*coup2R*coup3L*coup4R*int1
  BOddllVRL=BOddllVRL+chargefactor*coup1R*coup2L*coup3L*coup4R*int1
  BOddllVLR=BOddllVLR+chargefactor*coup1L*coup2R*coup3R*coup4L*int1
  BOddllTLL=BOddllTLL+0.
  BOddllTLR=BOddllTLR+0.
  BOddllTRL=BOddllTRL+0.
  BOddllTRR=BOddllTRR+0.
  End if 
End if 
    End Do 
  End Do 


 ! Fd,VZ,bar[Fe],hh
chargefactor = 1 
! Generic diagram: FSVF,  InsertionOrder: 1
Do i1=1,3
    Do i3=1,3
If ((MFd2(i1).gt.mf_l2(3)).Or.(MVZ2.gt.mf_l2(3)).Or.(MFe2(i3).gt.mf_l2(3)).Or.(Mhh2.gt.mf_l2(3))) Then
If (.not.OnlySM) Then 
coup1L = cplcFdFdhhL(i1,gt1)
coup1R = cplcFdFdhhR(i1,gt1)
coup2L = cplcFdFdVZL(gt2,i1)
coup2R = cplcFdFdVZR(gt2,i1)
coup3L = cplcFeFehhL(i3,gt3)
coup3R = cplcFeFehhR(i3,gt3)
coup4L = cplcFeFeVZL(gt4,i3)
coup4R = cplcFeFeVZR(gt4,i3)
mF1 = MFd(i1)
mF12 = MFd2(i1)
mS1 = Mhh
mS12 = Mhh2
mF2 = MFe(i3)
mF22 = MFe2(i3)
mV2 = MVZ
mV22 = MVZ2
  int1=D00check(mF12, mF22, mV22, mS12)
  int2=MMD0(mF1, mF2, mF12, mF22, mV22, mS12)
  BOddllSLL=BOddllSLL - 4.*chargefactor*coup1L*coup2R*coup3L*coup4R*int1
  BOddllSRR=BOddllSRR - 4.*chargefactor*coup1R*coup2L*coup3R*coup4L*int1
  BOddllSRL=BOddllSRL - 4.*chargefactor*coup1R*coup2L*coup3L*coup4R*int1
  BOddllSLR=BOddllSLR - 4.*chargefactor*coup1L*coup2R*coup3R*coup4L*int1
  BOddllVRR=BOddllVRR+chargefactor*coup1R*coup2R*coup3R*coup4R*int2
  BOddllVLL=BOddllVLL+chargefactor*coup1L*coup2L*coup3L*coup4L*int2
  BOddllVRL=BOddllVRL+chargefactor*coup1R*coup2R*coup3L*coup4L*int2
  BOddllVLR=BOddllVLR+chargefactor*coup1L*coup2L*coup3R*coup4R*int2
  BOddllTLL=BOddllTLL - 1.*chargefactor*coup1L*coup2R*coup3L*coup4R*int1
  BOddllTLR=BOddllTLR+0.
  BOddllTRL=BOddllTRL+0.
  BOddllTRR=BOddllTRR - 1.*chargefactor*coup1R*coup2L*coup3R*coup4L*int1
  End if 
End if 
    End Do 
  End Do 


 ! Fd,Ah,bar[Fe],VZ
chargefactor = 1 
! Generic diagram: FVSF,  InsertionOrder: 1
Do i1=1,3
    Do i3=1,3
If ((MFd2(i1).gt.mf_l2(3)).Or.(MAh2.gt.mf_l2(3)).Or.(MFe2(i3).gt.mf_l2(3)).Or.(MVZ2.gt.mf_l2(3))) Then
If (((i1.lt.4).and.(i3.lt.4)).or.(.not.OnlySM)) Then 
coup1L = cplcFdFdVZL(i1,gt1)
coup1R = cplcFdFdVZR(i1,gt1)
coup2L = cplcFdFdAhL(gt2,i1)
coup2R = cplcFdFdAhR(gt2,i1)
coup3L = cplcFeFeVZL(i3,gt3)
coup3R = cplcFeFeVZR(i3,gt3)
coup4L = cplcFeFeAhL(gt4,i3)
coup4R = cplcFeFeAhR(gt4,i3)
mF1 = MFd(i1)
mF12 = MFd2(i1)
mV1 = MVZ
mV12 = MVZ2
mF2 = MFe(i3)
mF22 = MFe2(i3)
mS2 = MAh
mS22 = MAh2
  int1=D00check(mF12, mF22, mS22, mV12)
  int2=MMD0(mF1, mF2, mF12, mF22, mS22, mV12)
  BOddllSLL=BOddllSLL - 4.*chargefactor*coup1L*coup2L*coup3L*coup4L*int1
  BOddllSRR=BOddllSRR - 4.*chargefactor*coup1R*coup2R*coup3R*coup4R*int1
  BOddllSRL=BOddllSRL - 4.*chargefactor*coup1R*coup2R*coup3L*coup4L*int1
  BOddllSLR=BOddllSLR - 4.*chargefactor*coup1L*coup2L*coup3R*coup4R*int1
  BOddllVRR=BOddllVRR+chargefactor*coup1R*coup2L*coup3R*coup4L*int2
  BOddllVLL=BOddllVLL+chargefactor*coup1L*coup2R*coup3L*coup4R*int2
  BOddllVRL=BOddllVRL+chargefactor*coup1R*coup2L*coup3L*coup4R*int2
  BOddllVLR=BOddllVLR+chargefactor*coup1L*coup2R*coup3R*coup4L*int2
  BOddllTLL=BOddllTLL - 1.*chargefactor*coup1L*coup2L*coup3L*coup4L*int1
  BOddllTLR=BOddllTLR+0.
  BOddllTRL=BOddllTRL+0.
  BOddllTRR=BOddllTRR - 1.*chargefactor*coup1R*coup2R*coup3R*coup4R*int1
  End if 
End if 
    End Do 
  End Do 


 ! Fd,hh,bar[Fe],VZ
chargefactor = 1 
! Generic diagram: FVSF,  InsertionOrder: 1
Do i1=1,3
    Do i3=1,3
If ((MFd2(i1).gt.mf_l2(3)).Or.(Mhh2.gt.mf_l2(3)).Or.(MFe2(i3).gt.mf_l2(3)).Or.(MVZ2.gt.mf_l2(3))) Then
If (.not.OnlySM) Then 
coup1L = cplcFdFdVZL(i1,gt1)
coup1R = cplcFdFdVZR(i1,gt1)
coup2L = cplcFdFdhhL(gt2,i1)
coup2R = cplcFdFdhhR(gt2,i1)
coup3L = cplcFeFeVZL(i3,gt3)
coup3R = cplcFeFeVZR(i3,gt3)
coup4L = cplcFeFehhL(gt4,i3)
coup4R = cplcFeFehhR(gt4,i3)
mF1 = MFd(i1)
mF12 = MFd2(i1)
mV1 = MVZ
mV12 = MVZ2
mF2 = MFe(i3)
mF22 = MFe2(i3)
mS2 = Mhh
mS22 = Mhh2
  int1=D00check(mF12, mF22, mS22, mV12)
  int2=MMD0(mF1, mF2, mF12, mF22, mS22, mV12)
  BOddllSLL=BOddllSLL - 4.*chargefactor*coup1L*coup2L*coup3L*coup4L*int1
  BOddllSRR=BOddllSRR - 4.*chargefactor*coup1R*coup2R*coup3R*coup4R*int1
  BOddllSRL=BOddllSRL - 4.*chargefactor*coup1R*coup2R*coup3L*coup4L*int1
  BOddllSLR=BOddllSLR - 4.*chargefactor*coup1L*coup2L*coup3R*coup4R*int1
  BOddllVRR=BOddllVRR+chargefactor*coup1R*coup2L*coup3R*coup4L*int2
  BOddllVLL=BOddllVLL+chargefactor*coup1L*coup2R*coup3L*coup4R*int2
  BOddllVRL=BOddllVRL+chargefactor*coup1R*coup2L*coup3L*coup4R*int2
  BOddllVLR=BOddllVLR+chargefactor*coup1L*coup2R*coup3R*coup4L*int2
  BOddllTLL=BOddllTLL - 1.*chargefactor*coup1L*coup2L*coup3L*coup4L*int1
  BOddllTLR=BOddllTLR+0.
  BOddllTRL=BOddllTRL+0.
  BOddllTRR=BOddllTRR - 1.*chargefactor*coup1R*coup2R*coup3R*coup4R*int1
  End if 
End if 
    End Do 
  End Do 


 ! Fd,VZ,bar[Fe],VZ
chargefactor = 1 
! Generic diagram: FVVF,  InsertionOrder: 1
Do i1=1,3
    Do i3=1,3
If ((MFd2(i1).gt.mf_l2(3)).Or.(MVZ2.gt.mf_l2(3)).Or.(MFe2(i3).gt.mf_l2(3)).Or.(MVZ2.gt.mf_l2(3))) Then
If (((i1.lt.4).and.(i3.lt.4)).or.(.not.OnlySM)) Then 
coup1L = cplcFdFdVZL(i1,gt1)
coup1R = cplcFdFdVZR(i1,gt1)
coup2L = cplcFdFdVZL(gt2,i1)
coup2R = cplcFdFdVZR(gt2,i1)
coup3L = cplcFeFeVZL(i3,gt3)
coup3R = cplcFeFeVZR(i3,gt3)
coup4L = cplcFeFeVZL(gt4,i3)
coup4R = cplcFeFeVZR(gt4,i3)
mF1 = MFd(i1)
mF12 = MFd2(i1)
mV1 = MVZ
mV12 = MVZ2
mF2 = MFe(i3)
mF22 = MFe2(i3)
mV2 = MVZ
mV22 = MVZ2
  int1=D00check(mF12, mF22, mV22, mV12)
  int2=MMD0(mF1, mF2, mF12, mF22, mV22, mV12)
  BOddllSLL=BOddllSLL - 4.*chargefactor*coup1L*coup2R*coup3L*coup4R*int2
  BOddllSRR=BOddllSRR - 4.*chargefactor*coup1R*coup2L*coup3R*coup4L*int2
  BOddllSRL=BOddllSRL - 4.*chargefactor*coup1R*coup2L*coup3L*coup4R*int2
  BOddllSLR=BOddllSLR - 4.*chargefactor*coup1L*coup2R*coup3R*coup4L*int2
  BOddllVRR=BOddllVRR+16.*chargefactor*coup1R*coup2R*coup3R*coup4R*int1
  BOddllVLL=BOddllVLL+16.*chargefactor*coup1L*coup2L*coup3L*coup4L*int1
  BOddllVRL=BOddllVRL+4.*chargefactor*coup1R*coup2R*coup3L*coup4L*int1
  BOddllVLR=BOddllVLR+4.*chargefactor*coup1L*coup2L*coup3R*coup4R*int1
  BOddllTLL=BOddllTLL - 1.*chargefactor*coup1L*coup2R*coup3L*coup4R*int2
  BOddllTLR=BOddllTLR+0.
  BOddllTRL=BOddllTRL+0.
  BOddllTRR=BOddllTRR - 1.*chargefactor*coup1R*coup2L*coup3R*coup4L*int2
  End if 
End if 
    End Do 
  End Do 


 ! Fd,Ah,Fe,Ah
chargefactor = 1 
! Generic diagram: FSSF,  InsertionOrder: 2
Do i1=1,3
    Do i3=1,3
If ((MFd2(i1).gt.mf_l2(3)).Or.(MAh2.gt.mf_l2(3)).Or.(MFe2(i3).gt.mf_l2(3)).Or.(MAh2.gt.mf_l2(3))) Then
If (((i1.lt.4).and.(i3.lt.4)).or.(.not.OnlySM)) Then 
coup1L = cplcFdFdAhL(i1,gt1)
coup1R = cplcFdFdAhR(i1,gt1)
coup2L = cplcFdFdAhL(gt2,i1)
coup2R = cplcFdFdAhR(gt2,i1)
coup3L = cplcFeFeAhL(gt4,i3)
coup3R = cplcFeFeAhR(gt4,i3)
coup4L = cplcFeFeAhL(i3,gt3)
coup4R = cplcFeFeAhR(i3,gt3)
mF1 = MFd(i1)
mF12 = MFd2(i1)
mS1 = MAh
mS12 = MAh2
mF2 = MFe(i3)
mF22 = MFe2(i3)
mS2 = MAh
mS22 = MAh2
  int1=D00check(mF12, mF22, mS22, mS12)
  int2=MMD0(mF1, mF2, mF12, mF22, mS22, mS12)
  BOddllSLL=BOddllSLL - 1.*chargefactor*coup1L*coup2L*coup3L*coup4L*int2
  BOddllSRR=BOddllSRR - 1.*chargefactor*coup1R*coup2R*coup3R*coup4R*int2
  BOddllSRL=BOddllSRL - 1.*chargefactor*coup1R*coup2R*coup3L*coup4L*int2
  BOddllSLR=BOddllSLR - 1.*chargefactor*coup1L*coup2L*coup3R*coup4R*int2
  BOddllVRR=BOddllVRR - 1.*chargefactor*coup1R*coup2L*coup3L*coup4R*int1
  BOddllVLL=BOddllVLL - 1.*chargefactor*coup1L*coup2R*coup3R*coup4L*int1
  BOddllVRL=BOddllVRL - 1.*chargefactor*coup1R*coup2L*coup3R*coup4L*int1
  BOddllVLR=BOddllVLR - 1.*chargefactor*coup1L*coup2R*coup3L*coup4R*int1
  BOddllTLL=BOddllTLL+0.
  BOddllTLR=BOddllTLR+0.
  BOddllTRL=BOddllTRL+0.
  BOddllTRR=BOddllTRR+0.
  End if 
End if 
    End Do 
  End Do 


 ! Fd,hh,Fe,Ah
chargefactor = 1 
! Generic diagram: FSSF,  InsertionOrder: 2
Do i1=1,3
    Do i3=1,3
If ((MFd2(i1).gt.mf_l2(3)).Or.(Mhh2.gt.mf_l2(3)).Or.(MFe2(i3).gt.mf_l2(3)).Or.(MAh2.gt.mf_l2(3))) Then
If (.not.OnlySM) Then 
coup1L = cplcFdFdAhL(i1,gt1)
coup1R = cplcFdFdAhR(i1,gt1)
coup2L = cplcFdFdhhL(gt2,i1)
coup2R = cplcFdFdhhR(gt2,i1)
coup3L = cplcFeFeAhL(gt4,i3)
coup3R = cplcFeFeAhR(gt4,i3)
coup4L = cplcFeFehhL(i3,gt3)
coup4R = cplcFeFehhR(i3,gt3)
mF1 = MFd(i1)
mF12 = MFd2(i1)
mS1 = MAh
mS12 = MAh2
mF2 = MFe(i3)
mF22 = MFe2(i3)
mS2 = Mhh
mS22 = Mhh2
  int1=D00check(mF12, mF22, mS22, mS12)
  int2=MMD0(mF1, mF2, mF12, mF22, mS22, mS12)
  BOddllSLL=BOddllSLL - 1.*chargefactor*coup1L*coup2L*coup3L*coup4L*int2
  BOddllSRR=BOddllSRR - 1.*chargefactor*coup1R*coup2R*coup3R*coup4R*int2
  BOddllSRL=BOddllSRL - 1.*chargefactor*coup1R*coup2R*coup3L*coup4L*int2
  BOddllSLR=BOddllSLR - 1.*chargefactor*coup1L*coup2L*coup3R*coup4R*int2
  BOddllVRR=BOddllVRR - 1.*chargefactor*coup1R*coup2L*coup3L*coup4R*int1
  BOddllVLL=BOddllVLL - 1.*chargefactor*coup1L*coup2R*coup3R*coup4L*int1
  BOddllVRL=BOddllVRL - 1.*chargefactor*coup1R*coup2L*coup3R*coup4L*int1
  BOddllVLR=BOddllVLR - 1.*chargefactor*coup1L*coup2R*coup3L*coup4R*int1
  BOddllTLL=BOddllTLL+0.
  BOddllTLR=BOddllTLR+0.
  BOddllTRL=BOddllTRL+0.
  BOddllTRR=BOddllTRR+0.
  End if 
End if 
    End Do 
  End Do 


 ! Fd,VZ,Fe,Ah
chargefactor = 1 
! Generic diagram: FSVF,  InsertionOrder: 2
Do i1=1,3
    Do i3=1,3
If ((MFd2(i1).gt.mf_l2(3)).Or.(MVZ2.gt.mf_l2(3)).Or.(MFe2(i3).gt.mf_l2(3)).Or.(MAh2.gt.mf_l2(3))) Then
If (((i1.lt.4).and.(i3.lt.4)).or.(.not.OnlySM)) Then 
coup1L = cplcFdFdAhL(i1,gt1)
coup1R = cplcFdFdAhR(i1,gt1)
coup2L = cplcFdFdVZL(gt2,i1)
coup2R = cplcFdFdVZR(gt2,i1)
coup3L = cplcFeFeAhL(gt4,i3)
coup3R = cplcFeFeAhR(gt4,i3)
coup4L = cplcFeFeVZL(i3,gt3)
coup4R = cplcFeFeVZR(i3,gt3)
mF1 = MFd(i1)
mF12 = MFd2(i1)
mS1 = MAh
mS12 = MAh2
mF2 = MFe(i3)
mF22 = MFe2(i3)
mV2 = MVZ
mV22 = MVZ2
  int1=C0D0check(mF22, mV22, mS12, mF12)
  int2=D00check(mF12, mF22, mV22, mS12)
  int3=MMD0(mF1, mF2, mF12, mF22, mV22, mS12)
  BOddllSLL=BOddllSLL+2.*chargefactor*coup1L*coup2R*coup3L*coup4L*(int1 -             & 
&  2.*int2)
  BOddllSRR=BOddllSRR+2.*chargefactor*coup1R*coup2L*coup3R*coup4R*(int1 -             & 
&  2.*int2)
  BOddllSRL=BOddllSRL+2.*chargefactor*coup1R*coup2L*coup3L*coup4L*(int1 -             & 
&  2.*int2)
  BOddllSLR=BOddllSLR+2.*chargefactor*coup1L*coup2R*coup3R*coup4R*(int1 -             & 
&  2.*int2)
  BOddllVRR=BOddllVRR+chargefactor*coup1R*coup2R*coup3L*coup4R*int3
  BOddllVLL=BOddllVLL+chargefactor*coup1L*coup2L*coup3R*coup4L*int3
  BOddllVRL=BOddllVRL+chargefactor*coup1R*coup2R*coup3R*coup4L*int3
  BOddllVLR=BOddllVLR+chargefactor*coup1L*coup2L*coup3L*coup4R*int3
  BOddllTLL=BOddllTLL - 1.*chargefactor*coup1L*coup2R*coup3L*coup4L*int2
  BOddllTLR=BOddllTLR+0.
  BOddllTRL=BOddllTRL+0.
  BOddllTRR=BOddllTRR - 1.*chargefactor*coup1R*coup2L*coup3R*coup4R*int2
  End if 
End if 
    End Do 
  End Do 


 ! Fd,Ah,Fe,hh
chargefactor = 1 
! Generic diagram: FSSF,  InsertionOrder: 2
Do i1=1,3
    Do i3=1,3
If ((MFd2(i1).gt.mf_l2(3)).Or.(MAh2.gt.mf_l2(3)).Or.(MFe2(i3).gt.mf_l2(3)).Or.(Mhh2.gt.mf_l2(3))) Then
If (.not.OnlySM) Then 
coup1L = cplcFdFdhhL(i1,gt1)
coup1R = cplcFdFdhhR(i1,gt1)
coup2L = cplcFdFdAhL(gt2,i1)
coup2R = cplcFdFdAhR(gt2,i1)
coup3L = cplcFeFehhL(gt4,i3)
coup3R = cplcFeFehhR(gt4,i3)
coup4L = cplcFeFeAhL(i3,gt3)
coup4R = cplcFeFeAhR(i3,gt3)
mF1 = MFd(i1)
mF12 = MFd2(i1)
mS1 = Mhh
mS12 = Mhh2
mF2 = MFe(i3)
mF22 = MFe2(i3)
mS2 = MAh
mS22 = MAh2
  int1=D00check(mF12, mF22, mS22, mS12)
  int2=MMD0(mF1, mF2, mF12, mF22, mS22, mS12)
  BOddllSLL=BOddllSLL - 1.*chargefactor*coup1L*coup2L*coup3L*coup4L*int2
  BOddllSRR=BOddllSRR - 1.*chargefactor*coup1R*coup2R*coup3R*coup4R*int2
  BOddllSRL=BOddllSRL - 1.*chargefactor*coup1R*coup2R*coup3L*coup4L*int2
  BOddllSLR=BOddllSLR - 1.*chargefactor*coup1L*coup2L*coup3R*coup4R*int2
  BOddllVRR=BOddllVRR - 1.*chargefactor*coup1R*coup2L*coup3L*coup4R*int1
  BOddllVLL=BOddllVLL - 1.*chargefactor*coup1L*coup2R*coup3R*coup4L*int1
  BOddllVRL=BOddllVRL - 1.*chargefactor*coup1R*coup2L*coup3R*coup4L*int1
  BOddllVLR=BOddllVLR - 1.*chargefactor*coup1L*coup2R*coup3L*coup4R*int1
  BOddllTLL=BOddllTLL+0.
  BOddllTLR=BOddllTLR+0.
  BOddllTRL=BOddllTRL+0.
  BOddllTRR=BOddllTRR+0.
  End if 
End if 
    End Do 
  End Do 


 ! Fd,hh,Fe,hh
chargefactor = 1 
! Generic diagram: FSSF,  InsertionOrder: 2
Do i1=1,3
    Do i3=1,3
If ((MFd2(i1).gt.mf_l2(3)).Or.(Mhh2.gt.mf_l2(3)).Or.(MFe2(i3).gt.mf_l2(3)).Or.(Mhh2.gt.mf_l2(3))) Then
If (.not.OnlySM) Then 
coup1L = cplcFdFdhhL(i1,gt1)
coup1R = cplcFdFdhhR(i1,gt1)
coup2L = cplcFdFdhhL(gt2,i1)
coup2R = cplcFdFdhhR(gt2,i1)
coup3L = cplcFeFehhL(gt4,i3)
coup3R = cplcFeFehhR(gt4,i3)
coup4L = cplcFeFehhL(i3,gt3)
coup4R = cplcFeFehhR(i3,gt3)
mF1 = MFd(i1)
mF12 = MFd2(i1)
mS1 = Mhh
mS12 = Mhh2
mF2 = MFe(i3)
mF22 = MFe2(i3)
mS2 = Mhh
mS22 = Mhh2
  int1=D00check(mF12, mF22, mS22, mS12)
  int2=MMD0(mF1, mF2, mF12, mF22, mS22, mS12)
  BOddllSLL=BOddllSLL - 1.*chargefactor*coup1L*coup2L*coup3L*coup4L*int2
  BOddllSRR=BOddllSRR - 1.*chargefactor*coup1R*coup2R*coup3R*coup4R*int2
  BOddllSRL=BOddllSRL - 1.*chargefactor*coup1R*coup2R*coup3L*coup4L*int2
  BOddllSLR=BOddllSLR - 1.*chargefactor*coup1L*coup2L*coup3R*coup4R*int2
  BOddllVRR=BOddllVRR - 1.*chargefactor*coup1R*coup2L*coup3L*coup4R*int1
  BOddllVLL=BOddllVLL - 1.*chargefactor*coup1L*coup2R*coup3R*coup4L*int1
  BOddllVRL=BOddllVRL - 1.*chargefactor*coup1R*coup2L*coup3R*coup4L*int1
  BOddllVLR=BOddllVLR - 1.*chargefactor*coup1L*coup2R*coup3L*coup4R*int1
  BOddllTLL=BOddllTLL+0.
  BOddllTLR=BOddllTLR+0.
  BOddllTRL=BOddllTRL+0.
  BOddllTRR=BOddllTRR+0.
  End if 
End if 
    End Do 
  End Do 


 ! Fd,VZ,Fe,hh
chargefactor = 1 
! Generic diagram: FSVF,  InsertionOrder: 2
Do i1=1,3
    Do i3=1,3
If ((MFd2(i1).gt.mf_l2(3)).Or.(MVZ2.gt.mf_l2(3)).Or.(MFe2(i3).gt.mf_l2(3)).Or.(Mhh2.gt.mf_l2(3))) Then
If (.not.OnlySM) Then 
coup1L = cplcFdFdhhL(i1,gt1)
coup1R = cplcFdFdhhR(i1,gt1)
coup2L = cplcFdFdVZL(gt2,i1)
coup2R = cplcFdFdVZR(gt2,i1)
coup3L = cplcFeFehhL(gt4,i3)
coup3R = cplcFeFehhR(gt4,i3)
coup4L = cplcFeFeVZL(i3,gt3)
coup4R = cplcFeFeVZR(i3,gt3)
mF1 = MFd(i1)
mF12 = MFd2(i1)
mS1 = Mhh
mS12 = Mhh2
mF2 = MFe(i3)
mF22 = MFe2(i3)
mV2 = MVZ
mV22 = MVZ2
  int1=C0D0check(mF22, mV22, mS12, mF12)
  int2=D00check(mF12, mF22, mV22, mS12)
  int3=MMD0(mF1, mF2, mF12, mF22, mV22, mS12)
  BOddllSLL=BOddllSLL+2.*chargefactor*coup1L*coup2R*coup3L*coup4L*(int1 -             & 
&  2.*int2)
  BOddllSRR=BOddllSRR+2.*chargefactor*coup1R*coup2L*coup3R*coup4R*(int1 -             & 
&  2.*int2)
  BOddllSRL=BOddllSRL+2.*chargefactor*coup1R*coup2L*coup3L*coup4L*(int1 -             & 
&  2.*int2)
  BOddllSLR=BOddllSLR+2.*chargefactor*coup1L*coup2R*coup3R*coup4R*(int1 -             & 
&  2.*int2)
  BOddllVRR=BOddllVRR+chargefactor*coup1R*coup2R*coup3L*coup4R*int3
  BOddllVLL=BOddllVLL+chargefactor*coup1L*coup2L*coup3R*coup4L*int3
  BOddllVRL=BOddllVRL+chargefactor*coup1R*coup2R*coup3R*coup4L*int3
  BOddllVLR=BOddllVLR+chargefactor*coup1L*coup2L*coup3L*coup4R*int3
  BOddllTLL=BOddllTLL - 1.*chargefactor*coup1L*coup2R*coup3L*coup4L*int2
  BOddllTLR=BOddllTLR+0.
  BOddllTRL=BOddllTRL+0.
  BOddllTRR=BOddllTRR - 1.*chargefactor*coup1R*coup2L*coup3R*coup4R*int2
  End if 
End if 
    End Do 
  End Do 


 ! Fu,Hp,Fv,Hp
chargefactor = 1 
! Generic diagram: FSSF,  InsertionOrder: 2
Do i1=1,3
    Do i3=1,3
If ((MFu2(i1).gt.mf_l2(3)).Or.(MHp2.gt.mf_l2(3)).Or.(0._dp.gt.mf_l2(3)).Or.(MHp2.gt.mf_l2(3))) Then
If (((i1.lt.4).and.(i3.lt.4)).or.(.not.OnlySM)) Then 
coup1L = cplcFuFdHpL(i1,gt1)
coup1R = cplcFuFdHpR(i1,gt1)
coup2L = cplcFdFucHpL(gt2,i1)
coup2R = cplcFdFucHpR(gt2,i1)
coup3L = cplcFeFvcHpL(gt4,i3)
coup3R = cplcFeFvcHpR(gt4,i3)
coup4L = cplcFvFeHpL(i3,gt3)
coup4R = cplcFvFeHpR(i3,gt3)
mF1 = MFu(i1)
mF12 = MFu2(i1)
mS1 = MHp
mS12 = MHp2
mF2 = 0._dp
mF22 = 0._dp
mS2 = MHp
mS22 = MHp2
  int1=D00check(mF12, mF22, mS22, mS12)
  int2=MMD0(mF1, mF2, mF12, mF22, mS22, mS12)
  BOddllSLL=BOddllSLL - 1.*chargefactor*coup1L*coup2L*coup3L*coup4L*int2
  BOddllSRR=BOddllSRR - 1.*chargefactor*coup1R*coup2R*coup3R*coup4R*int2
  BOddllSRL=BOddllSRL - 1.*chargefactor*coup1R*coup2R*coup3L*coup4L*int2
  BOddllSLR=BOddllSLR - 1.*chargefactor*coup1L*coup2L*coup3R*coup4R*int2
  BOddllVRR=BOddllVRR - 1.*chargefactor*coup1R*coup2L*coup3L*coup4R*int1
  BOddllVLL=BOddllVLL - 1.*chargefactor*coup1L*coup2R*coup3R*coup4L*int1
  BOddllVRL=BOddllVRL - 1.*chargefactor*coup1R*coup2L*coup3R*coup4L*int1
  BOddllVLR=BOddllVLR - 1.*chargefactor*coup1L*coup2R*coup3L*coup4R*int1
  BOddllTLL=BOddllTLL+0.
  BOddllTLR=BOddllTLR+0.
  BOddllTRL=BOddllTRL+0.
  BOddllTRR=BOddllTRR+0.
  End if 
End if 
    End Do 
  End Do 


 ! Fu,VWp,Fv,Hp
chargefactor = 1 
! Generic diagram: FSVF,  InsertionOrder: 2
Do i1=1,3
    Do i3=1,3
If ((MFu2(i1).gt.mf_l2(3)).Or.(MVWp2.gt.mf_l2(3)).Or.(0._dp.gt.mf_l2(3)).Or.(MHp2.gt.mf_l2(3))) Then
If (((i1.lt.4).and.(i3.lt.4)).or.(.not.OnlySM)) Then 
coup1L = cplcFuFdHpL(i1,gt1)
coup1R = cplcFuFdHpR(i1,gt1)
coup2L = cplcFdFucVWpL(gt2,i1)
coup2R = cplcFdFucVWpR(gt2,i1)
coup3L = cplcFeFvcHpL(gt4,i3)
coup3R = cplcFeFvcHpR(gt4,i3)
coup4L = cplcFvFeVWpL(i3,gt3)
coup4R = cplcFvFeVWpR(i3,gt3)
mF1 = MFu(i1)
mF12 = MFu2(i1)
mS1 = MHp
mS12 = MHp2
mF2 = 0._dp
mF22 = 0._dp
mV2 = MVWp
mV22 = MVWp2
  int1=C0D0check(mF22, mV22, mS12, mF12)
  int2=D00check(mF12, mF22, mV22, mS12)
  int3=MMD0(mF1, mF2, mF12, mF22, mV22, mS12)
  BOddllSLL=BOddllSLL+2.*chargefactor*coup1L*coup2R*coup3L*coup4L*(int1 -             & 
&  2.*int2)
  BOddllSRR=BOddllSRR+2.*chargefactor*coup1R*coup2L*coup3R*coup4R*(int1 -             & 
&  2.*int2)
  BOddllSRL=BOddllSRL+2.*chargefactor*coup1R*coup2L*coup3L*coup4L*(int1 -             & 
&  2.*int2)
  BOddllSLR=BOddllSLR+2.*chargefactor*coup1L*coup2R*coup3R*coup4R*(int1 -             & 
&  2.*int2)
  BOddllVRR=BOddllVRR+chargefactor*coup1R*coup2R*coup3L*coup4R*int3
  BOddllVLL=BOddllVLL+chargefactor*coup1L*coup2L*coup3R*coup4L*int3
  BOddllVRL=BOddllVRL+chargefactor*coup1R*coup2R*coup3R*coup4L*int3
  BOddllVLR=BOddllVLR+chargefactor*coup1L*coup2L*coup3L*coup4R*int3
  BOddllTLL=BOddllTLL - 1.*chargefactor*coup1L*coup2R*coup3L*coup4L*int2
  BOddllTLR=BOddllTLR+0.
  BOddllTRL=BOddllTRL+0.
  BOddllTRR=BOddllTRR - 1.*chargefactor*coup1R*coup2L*coup3R*coup4R*int2
  End if 
End if 
    End Do 
  End Do 


 ! Fu,Hp,Fv,VWp
chargefactor = 1 
! Generic diagram: FVSF,  InsertionOrder: 2
Do i1=1,3
    Do i3=1,3
If ((MFu2(i1).gt.mf_l2(3)).Or.(MHp2.gt.mf_l2(3)).Or.(0._dp.gt.mf_l2(3)).Or.(MVWp2.gt.mf_l2(3))) Then
If (((i1.lt.4).and.(i3.lt.4)).or.(.not.OnlySM)) Then 
coup1L = cplcFuFdVWpL(i1,gt1)
coup1R = cplcFuFdVWpR(i1,gt1)
coup2L = cplcFdFucHpL(gt2,i1)
coup2R = cplcFdFucHpR(gt2,i1)
coup3L = cplcFeFvcVWpL(gt4,i3)
coup3R = cplcFeFvcVWpR(gt4,i3)
coup4L = cplcFvFeHpL(i3,gt3)
coup4R = cplcFvFeHpR(i3,gt3)
mF1 = MFu(i1)
mF12 = MFu2(i1)
mV1 = MVWp
mV12 = MVWp2
mF2 = 0._dp
mF22 = 0._dp
mS2 = MHp
mS22 = MHp2
  int1=C0D0check(mF22, mS22, mV12, mF12)
  int2=D00check(mF12, mF22, mS22, mV12)
  int3=MMD0(mF1, mF2, mF12, mF22, mS22, mV12)
  BOddllSLL=BOddllSLL+2.*chargefactor*coup1L*coup2L*coup3R*coup4L*(int1 -             & 
&  2.*int2)
  BOddllSRR=BOddllSRR+2.*chargefactor*coup1R*coup2R*coup3L*coup4R*(int1 -             & 
&  2.*int2)
  BOddllSRL=BOddllSRL+2.*chargefactor*coup1R*coup2R*coup3R*coup4L*(int1 -             & 
&  2.*int2)
  BOddllSLR=BOddllSLR+2.*chargefactor*coup1L*coup2L*coup3L*coup4R*(int1 -             & 
&  2.*int2)
  BOddllVRR=BOddllVRR+chargefactor*coup1R*coup2L*coup3R*coup4R*int3
  BOddllVLL=BOddllVLL+chargefactor*coup1L*coup2R*coup3L*coup4L*int3
  BOddllVRL=BOddllVRL+chargefactor*coup1R*coup2L*coup3L*coup4L*int3
  BOddllVLR=BOddllVLR+chargefactor*coup1L*coup2R*coup3R*coup4R*int3
  BOddllTLL=BOddllTLL - 1.*chargefactor*coup1L*coup2L*coup3R*coup4L*int2
  BOddllTLR=BOddllTLR+0.
  BOddllTRL=BOddllTRL+0.
  BOddllTRR=BOddllTRR - 1.*chargefactor*coup1R*coup2R*coup3L*coup4R*int2
  End if 
End if 
    End Do 
  End Do 


 ! Fu,VWp,Fv,VWp
chargefactor = 1 
! Generic diagram: FVVF,  InsertionOrder: 2
Do i1=1,3
    Do i3=1,3
If ((MFu2(i1).gt.mf_l2(3)).Or.(MVWp2.gt.mf_l2(3)).Or.(0._dp.gt.mf_l2(3)).Or.(MVWp2.gt.mf_l2(3))) Then
If (((i1.lt.4).and.(i3.lt.4)).or.(.not.OnlySM)) Then 
coup1L = cplcFuFdVWpL(i1,gt1)
coup1R = cplcFuFdVWpR(i1,gt1)
coup2L = cplcFdFucVWpL(gt2,i1)
coup2R = cplcFdFucVWpR(gt2,i1)
coup3L = cplcFeFvcVWpL(gt4,i3)
coup3R = cplcFeFvcVWpR(gt4,i3)
coup4L = cplcFvFeVWpL(i3,gt3)
coup4R = cplcFvFeVWpR(i3,gt3)
mF1 = MFu(i1)
mF12 = MFu2(i1)
mV1 = MVWp
mV12 = MVWp2
mF2 = 0._dp
mF22 = 0._dp
mV2 = MVWp
mV22 = MVWp2
  int1=C0D0check(mF22, mV22, mV12, mF12)
  int2=D00check(mF12, mF22, mV22, mV12)
  int3=MMD0(mF1, mF2, mF12, mF22, mV22, mV12)
  BOddllSLL=BOddllSLL - 4.*chargefactor*coup1L*coup2R*coup3R*coup4L*int3
  BOddllSRR=BOddllSRR - 4.*chargefactor*coup1R*coup2L*coup3L*coup4R*int3
  BOddllSRL=BOddllSRL - 4.*chargefactor*coup1R*coup2L*coup3R*coup4L*int3
  BOddllSLR=BOddllSLR - 4.*chargefactor*coup1L*coup2R*coup3L*coup4R*int3
  BOddllVRR=BOddllVRR - 4.*chargefactor*coup1R*coup2R*coup3R*coup4R*(int1 -           & 
&  3.*int2)
  BOddllVLL=BOddllVLL - 4.*chargefactor*coup1L*coup2L*coup3L*coup4L*(int1 -           & 
&  3.*int2)
  BOddllVRL=BOddllVRL - 4.*chargefactor*coup1R*coup2R*coup3L*coup4L*int1
  BOddllVLR=BOddllVLR - 4.*chargefactor*coup1L*coup2L*coup3R*coup4R*int1
  BOddllTLL=BOddllTLL+chargefactor*coup1L*coup2R*coup3R*coup4L*int3
  BOddllTLR=BOddllTLR+0.
  BOddllTRL=BOddllTRL+0.
  BOddllTRR=BOddllTRR+chargefactor*coup1R*coup2L*coup3L*coup4R*int3
  End if 
End if 
    End Do 
  End Do 


 ! Fd,Ah,Fe,VZ
chargefactor = 1 
! Generic diagram: FVSF,  InsertionOrder: 2
Do i1=1,3
    Do i3=1,3
If ((MFd2(i1).gt.mf_l2(3)).Or.(MAh2.gt.mf_l2(3)).Or.(MFe2(i3).gt.mf_l2(3)).Or.(MVZ2.gt.mf_l2(3))) Then
If (((i1.lt.4).and.(i3.lt.4)).or.(.not.OnlySM)) Then 
coup1L = cplcFdFdVZL(i1,gt1)
coup1R = cplcFdFdVZR(i1,gt1)
coup2L = cplcFdFdAhL(gt2,i1)
coup2R = cplcFdFdAhR(gt2,i1)
coup3L = cplcFeFeVZL(gt4,i3)
coup3R = cplcFeFeVZR(gt4,i3)
coup4L = cplcFeFeAhL(i3,gt3)
coup4R = cplcFeFeAhR(i3,gt3)
mF1 = MFd(i1)
mF12 = MFd2(i1)
mV1 = MVZ
mV12 = MVZ2
mF2 = MFe(i3)
mF22 = MFe2(i3)
mS2 = MAh
mS22 = MAh2
  int1=C0D0check(mF22, mS22, mV12, mF12)
  int2=D00check(mF12, mF22, mS22, mV12)
  int3=MMD0(mF1, mF2, mF12, mF22, mS22, mV12)
  BOddllSLL=BOddllSLL+2.*chargefactor*coup1L*coup2L*coup3R*coup4L*(int1 -             & 
&  2.*int2)
  BOddllSRR=BOddllSRR+2.*chargefactor*coup1R*coup2R*coup3L*coup4R*(int1 -             & 
&  2.*int2)
  BOddllSRL=BOddllSRL+2.*chargefactor*coup1R*coup2R*coup3R*coup4L*(int1 -             & 
&  2.*int2)
  BOddllSLR=BOddllSLR+2.*chargefactor*coup1L*coup2L*coup3L*coup4R*(int1 -             & 
&  2.*int2)
  BOddllVRR=BOddllVRR+chargefactor*coup1R*coup2L*coup3R*coup4R*int3
  BOddllVLL=BOddllVLL+chargefactor*coup1L*coup2R*coup3L*coup4L*int3
  BOddllVRL=BOddllVRL+chargefactor*coup1R*coup2L*coup3L*coup4L*int3
  BOddllVLR=BOddllVLR+chargefactor*coup1L*coup2R*coup3R*coup4R*int3
  BOddllTLL=BOddllTLL - 1.*chargefactor*coup1L*coup2L*coup3R*coup4L*int2
  BOddllTLR=BOddllTLR+0.
  BOddllTRL=BOddllTRL+0.
  BOddllTRR=BOddllTRR - 1.*chargefactor*coup1R*coup2R*coup3L*coup4R*int2
  End if 
End if 
    End Do 
  End Do 


 ! Fd,hh,Fe,VZ
chargefactor = 1 
! Generic diagram: FVSF,  InsertionOrder: 2
Do i1=1,3
    Do i3=1,3
If ((MFd2(i1).gt.mf_l2(3)).Or.(Mhh2.gt.mf_l2(3)).Or.(MFe2(i3).gt.mf_l2(3)).Or.(MVZ2.gt.mf_l2(3))) Then
If (.not.OnlySM) Then 
coup1L = cplcFdFdVZL(i1,gt1)
coup1R = cplcFdFdVZR(i1,gt1)
coup2L = cplcFdFdhhL(gt2,i1)
coup2R = cplcFdFdhhR(gt2,i1)
coup3L = cplcFeFeVZL(gt4,i3)
coup3R = cplcFeFeVZR(gt4,i3)
coup4L = cplcFeFehhL(i3,gt3)
coup4R = cplcFeFehhR(i3,gt3)
mF1 = MFd(i1)
mF12 = MFd2(i1)
mV1 = MVZ
mV12 = MVZ2
mF2 = MFe(i3)
mF22 = MFe2(i3)
mS2 = Mhh
mS22 = Mhh2
  int1=C0D0check(mF22, mS22, mV12, mF12)
  int2=D00check(mF12, mF22, mS22, mV12)
  int3=MMD0(mF1, mF2, mF12, mF22, mS22, mV12)
  BOddllSLL=BOddllSLL+2.*chargefactor*coup1L*coup2L*coup3R*coup4L*(int1 -             & 
&  2.*int2)
  BOddllSRR=BOddllSRR+2.*chargefactor*coup1R*coup2R*coup3L*coup4R*(int1 -             & 
&  2.*int2)
  BOddllSRL=BOddllSRL+2.*chargefactor*coup1R*coup2R*coup3R*coup4L*(int1 -             & 
&  2.*int2)
  BOddllSLR=BOddllSLR+2.*chargefactor*coup1L*coup2L*coup3L*coup4R*(int1 -             & 
&  2.*int2)
  BOddllVRR=BOddllVRR+chargefactor*coup1R*coup2L*coup3R*coup4R*int3
  BOddllVLL=BOddllVLL+chargefactor*coup1L*coup2R*coup3L*coup4L*int3
  BOddllVRL=BOddllVRL+chargefactor*coup1R*coup2L*coup3L*coup4L*int3
  BOddllVLR=BOddllVLR+chargefactor*coup1L*coup2R*coup3R*coup4R*int3
  BOddllTLL=BOddllTLL - 1.*chargefactor*coup1L*coup2L*coup3R*coup4L*int2
  BOddllTLR=BOddllTLR+0.
  BOddllTRL=BOddllTRL+0.
  BOddllTRR=BOddllTRR - 1.*chargefactor*coup1R*coup2R*coup3L*coup4R*int2
  End if 
End if 
    End Do 
  End Do 


 ! Fd,VZ,Fe,VZ
chargefactor = 1 
! Generic diagram: FVVF,  InsertionOrder: 2
Do i1=1,3
    Do i3=1,3
If ((MFd2(i1).gt.mf_l2(3)).Or.(MVZ2.gt.mf_l2(3)).Or.(MFe2(i3).gt.mf_l2(3)).Or.(MVZ2.gt.mf_l2(3))) Then
If (((i1.lt.4).and.(i3.lt.4)).or.(.not.OnlySM)) Then 
coup1L = cplcFdFdVZL(i1,gt1)
coup1R = cplcFdFdVZR(i1,gt1)
coup2L = cplcFdFdVZL(gt2,i1)
coup2R = cplcFdFdVZR(gt2,i1)
coup3L = cplcFeFeVZL(gt4,i3)
coup3R = cplcFeFeVZR(gt4,i3)
coup4L = cplcFeFeVZL(i3,gt3)
coup4R = cplcFeFeVZR(i3,gt3)
mF1 = MFd(i1)
mF12 = MFd2(i1)
mV1 = MVZ
mV12 = MVZ2
mF2 = MFe(i3)
mF22 = MFe2(i3)
mV2 = MVZ
mV22 = MVZ2
  int1=C0D0check(mF22, mV22, mV12, mF12)
  int2=D00check(mF12, mF22, mV22, mV12)
  int3=MMD0(mF1, mF2, mF12, mF22, mV22, mV12)
  BOddllSLL=BOddllSLL - 4.*chargefactor*coup1L*coup2R*coup3R*coup4L*int3
  BOddllSRR=BOddllSRR - 4.*chargefactor*coup1R*coup2L*coup3L*coup4R*int3
  BOddllSRL=BOddllSRL - 4.*chargefactor*coup1R*coup2L*coup3R*coup4L*int3
  BOddllSLR=BOddllSLR - 4.*chargefactor*coup1L*coup2R*coup3L*coup4R*int3
  BOddllVRR=BOddllVRR - 4.*chargefactor*coup1R*coup2R*coup3R*coup4R*(int1 -           & 
&  3.*int2)
  BOddllVLL=BOddllVLL - 4.*chargefactor*coup1L*coup2L*coup3L*coup4L*(int1 -           & 
&  3.*int2)
  BOddllVRL=BOddllVRL - 4.*chargefactor*coup1R*coup2R*coup3L*coup4L*int1
  BOddllVLR=BOddllVLR - 4.*chargefactor*coup1L*coup2L*coup3R*coup4R*int1
  BOddllTLL=BOddllTLL+chargefactor*coup1L*coup2R*coup3R*coup4L*int3
  BOddllTLR=BOddllTLR+0.
  BOddllTRL=BOddllTRL+0.
  BOddllTRR=BOddllTRR+chargefactor*coup1R*coup2L*coup3L*coup4R*int3
  End if 
End if 
    End Do 
  End Do 


 BOddllSLL=oo16pi2*BOddllSLL 
BOddllSRR=oo16pi2*BOddllSRR 
BOddllSRL=oo16pi2*BOddllSRL 
BOddllSLR=oo16pi2*BOddllSLR 
BOddllVRR=oo16pi2*BOddllVRR 
BOddllVLL=oo16pi2*BOddllVLL 
BOddllVRL=oo16pi2*BOddllVRL 
BOddllVLR=oo16pi2*BOddllVLR 
BOddllTLL=oo16pi2*BOddllTLL 
BOddllTLR=oo16pi2*BOddllTLR 
BOddllTRL=oo16pi2*BOddllTRL 
BOddllTRR=oo16pi2*BOddllTRR 
Iname=Iname-1

End Subroutine CalculateBox2d2L 

Subroutine CalculatePengS2d2L(gt1,gt2,gt3,gt4,OnlySM,MAh,MAh2,MFd,MFd2,               & 
& MFe,MFe2,MFu,MFu2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,cplAhAhhh,cplAhcHpVWp,         & 
& cplAhhhVZ,cplAhHpcVWp,cplcFdFdAhL,cplcFdFdAhR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVPL,     & 
& cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,cplcFdFucHpL,cplcFdFucHpR,cplcFdFucVWpL,           & 
& cplcFdFucVWpR,cplcFeFeAhL,cplcFeFeAhR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,             & 
& cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplcFeFvcHpL,cplcFeFvcHpR,cplcFeFvcVWpL,           & 
& cplcFeFvcVWpR,cplcFuFdHpL,cplcFuFdHpR,cplcFuFdVWpL,cplcFuFdVWpR,cplcFuFuAhL,           & 
& cplcFuFuAhR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZL,               & 
& cplcFuFuVZR,cplcFvFeHpL,cplcFvFeHpR,cplcFvFeVWpL,cplcFvFeVWpR,cplcHpVPVWp,             & 
& cplcHpVWpVZ,cplcVWpVPVWp,cplcVWpVWpVZ,cplhhcHpVWp,cplhhcVWpVWp,cplhhhhhh,              & 
& cplhhHpcHp,cplhhHpcVWp,cplhhVZVZ,cplHpcHpVP,cplHpcHpVZ,cplHpcVWpVP,cplHpcVWpVZ,        & 
& PSOddllSLL,PSOddllSRR,PSOddllSRL,PSOddllSLR,PSOddllVRR,PSOddllVLL,PSOddllVRL,          & 
& PSOddllVLR,PSOddllTLL,PSOddllTLR,PSOddllTRL,PSOddllTRR)

! ---------------------------------------------------------------- 
! Code based on automatically generated SARAH extensions by 'PreSARAH' 
! Expressions for amplitudes are obtained by FeynArts/FormCalc 
! Based on user input for process PengS2d2L 
! 'PreSARAH' output has been generated  at 15:40 on 16.12.2015 
! ---------------------------------------------------------------- 
 
Implicit None 
Real(dp),Intent(in) :: MAh,MAh2,MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),Mhh,Mhh2,MHp,MHp2,              & 
& MVWp,MVWp2,MVZ,MVZ2

Complex(dp),Intent(in) :: cplAhAhhh,cplAhcHpVWp,cplAhhhVZ,cplAhHpcVWp,cplcFdFdAhL(3,3),cplcFdFdAhR(3,3),        & 
& cplcFdFdhhL(3,3),cplcFdFdhhR(3,3),cplcFdFdVPL(3,3),cplcFdFdVPR(3,3),cplcFdFdVZL(3,3),  & 
& cplcFdFdVZR(3,3),cplcFdFucHpL(3,3),cplcFdFucHpR(3,3),cplcFdFucVWpL(3,3),               & 
& cplcFdFucVWpR(3,3),cplcFeFeAhL(3,3),cplcFeFeAhR(3,3),cplcFeFehhL(3,3),cplcFeFehhR(3,3),& 
& cplcFeFeVPL(3,3),cplcFeFeVPR(3,3),cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),cplcFeFvcHpL(3,3), & 
& cplcFeFvcHpR(3,3),cplcFeFvcVWpL(3,3),cplcFeFvcVWpR(3,3),cplcFuFdHpL(3,3),              & 
& cplcFuFdHpR(3,3),cplcFuFdVWpL(3,3),cplcFuFdVWpR(3,3),cplcFuFuAhL(3,3),cplcFuFuAhR(3,3),& 
& cplcFuFuhhL(3,3),cplcFuFuhhR(3,3),cplcFuFuVPL(3,3),cplcFuFuVPR(3,3),cplcFuFuVZL(3,3),  & 
& cplcFuFuVZR(3,3),cplcFvFeHpL(3,3),cplcFvFeHpR(3,3),cplcFvFeVWpL(3,3),cplcFvFeVWpR(3,3),& 
& cplcHpVPVWp,cplcHpVWpVZ,cplcVWpVPVWp,cplcVWpVWpVZ,cplhhcHpVWp,cplhhcVWpVWp,            & 
& cplhhhhhh,cplhhHpcHp,cplhhHpcVWp,cplhhVZVZ,cplHpcHpVP,cplHpcHpVZ,cplHpcVWpVP,          & 
& cplHpcVWpVZ

Integer,Intent(in) :: gt1, gt2,gt3,gt4 
Logical, Intent(in) :: OnlySM 
Integer :: iprop, i1, i2, i3, i4 
Real(dp) :: MassEx1,MassEx2,MassEx3,MassEx4, MassEx12,MassEx22,MassEx32,MassEx42 
Complex(dp), Intent(out) :: PSOddllSLL 
Complex(dp), Intent(out) :: PSOddllSRR 
Complex(dp), Intent(out) :: PSOddllSRL 
Complex(dp), Intent(out) :: PSOddllSLR 
Complex(dp), Intent(out) :: PSOddllVRR 
Complex(dp), Intent(out) :: PSOddllVLL 
Complex(dp), Intent(out) :: PSOddllVRL 
Complex(dp), Intent(out) :: PSOddllVLR 
Complex(dp), Intent(out) :: PSOddllTLL 
Complex(dp), Intent(out) :: PSOddllTLR 
Complex(dp), Intent(out) :: PSOddllTRL 
Complex(dp), Intent(out) :: PSOddllTRR 
Complex(dp) :: vertex1L, vertex1R, vertex2L, vertex2R 
Real(dp) ::  MP, MP2, IMP2, IMP, MFin, MFin2, IMFin, IMFin2, Finite  
Real(dp) ::  MS1, MS12, MS2, MS22, MF1, MF12, MF2, MF22, MV1, MV12, MV2, MV22  
Complex(dp) ::  chargefactor  
Complex(dp) ::  coup1L, coup1R, coup2L, coup2R, coup3L, coup3R, coup3, coup4L, coup4R 

Complex(dp) ::  int1,int2,int3,int4,int5,int6,int7,int8 

Iname=Iname+1 
NameOfUnit(Iname)='CalculatePengS2d2L' 

Finite=1._dp 
MassEx1=MFd(gt1)  
MassEx12=MFd2(gt1) 
MassEx2=MFd(gt2)  
MassEx22=MFd2(gt2) 
MassEx3=MFe(gt3)  
MassEx32=MFe2(gt3) 
MassEx4=MFe(gt4)  
MassEx42=MFe2(gt4) 
! ------------------------------ 
 ! Amplitudes for external states 
 ! {DownQuark, bar[DownQuark], ChargedLepton, bar[ChargedLepton]} 
 ! ------------------------------ 
 
PSOddllSLL=0._dp 
PSOddllSRR=0._dp 
PSOddllSRL=0._dp 
PSOddllSLR=0._dp 
PSOddllVRR=0._dp 
PSOddllVLL=0._dp 
PSOddllVRL=0._dp 
PSOddllVLR=0._dp 
PSOddllTLL=0._dp 
PSOddllTLR=0._dp 
PSOddllTRL=0._dp 
PSOddllTRR=0._dp 
!---------------------------------------- 
! Scalar Wave Contributions            
!---------------------------------------- 
! -- Ah - Penguins            
! Propagator: Ah, Loop particles: Ah,Fd, Internal fermion: bar[Fd]
! Generic diagram: SFF,  InsertionOrder: 1
chargefactor = 1 
  Do i2=1,3
    Do i3=1,3
If ((MAh2.gt.mf_l2(3)).Or.(MFd2(i2).gt.mf_l2(3))) Then
If (((i2.lt.4).and.(i3.lt.4)).or.(.not.OnlySM)) Then 
coup1L = cplcFdFdAhL(i2,gt1)
coup1R = cplcFdFdAhR(i2,gt1)
coup2L = cplcFdFdAhL(i3,i2)
coup2R = cplcFdFdAhR(i3,i2)
coup3L = cplcFdFdAhL(gt2,i3)
coup3R = cplcFdFdAhR(gt2,i3)
coup4L = cplcFeFeAhL(gt4,gt3)
coup4R = cplcFeFeAhR(gt4,gt3)
! Masses in loop
mS1 = MAh
mS12 = MAh2
mF1 = MFd(i2)
mF12 = MFd2(i2)
! Mass of internal fermion 
MFin = MFd(i3)-MFd(gt1)
MFin2 = MFd2(i3)-MFd2(gt1)
If (Abs(MFin).gt.10E-10_dp) Then 
MFin = MFd(i3)
MFin2 = MFd2(i3)
! Propagator and inverse propagator mass 
MP = MAh
MP2 = MAh2
IMP = 1._dp/MP  
IMP2 = 1._dp/MP2 
! Amplitude 
  int1=B0(0._dp, mF12, mS12)
  int2=B1(0._dp, mF12, mS12)
  PSOddllSLL=PSOddllSLL+(chargefactor*coup3L*coup4L*IMP2*(-1.*coup1L*coup2R*int2*MassEx12 +& 
&  coup1R*coup2R*int1*MassEx1*mF1 - 1.*coup1R*coup2L*int2*MassEx1*MFin + coup1L*coup2L*int1*mF1*MFin))& 
& /(MassEx12 - 1.*MFin2)
  PSOddllSRR=PSOddllSRR+(chargefactor*coup3R*coup4R*IMP2*(-1.*coup1R*coup2L*int2*MassEx12 +& 
&  coup1L*coup2L*int1*MassEx1*mF1 - 1.*coup1L*coup2R*int2*MassEx1*MFin + coup1R*coup2R*int1*mF1*MFin))& 
& /(MassEx12 - 1.*MFin2)
  PSOddllSRL=PSOddllSRL+(chargefactor*coup3R*coup4L*IMP2*(-1.*coup1R*coup2L*int2*MassEx12 +& 
&  coup1L*coup2L*int1*MassEx1*mF1 - 1.*coup1L*coup2R*int2*MassEx1*MFin + coup1R*coup2R*int1*mF1*MFin))& 
& /(MassEx12 - 1.*MFin2)
  PSOddllSLR=PSOddllSLR+(chargefactor*coup3L*coup4R*IMP2*(-1.*coup1L*coup2R*int2*MassEx12 +& 
&  coup1R*coup2R*int1*MassEx1*mF1 - 1.*coup1R*coup2L*int2*MassEx1*MFin + coup1L*coup2L*int1*mF1*MFin))& 
& /(MassEx12 - 1.*MFin2)
  PSOddllVRR=PSOddllVRR+0.
  PSOddllVLL=PSOddllVLL+0.
  PSOddllVRL=PSOddllVRL+0.
  PSOddllVLR=PSOddllVLR+0.
  PSOddllTLL=PSOddllTLL+0.
  PSOddllTLR=PSOddllTLR+0.
  PSOddllTRL=PSOddllTRL+0.
  PSOddllTRR=PSOddllTRR+0.
     End if 
  End if 
End if 
   End Do 
  End Do 


 ! Propagator: Ah, Loop particles: hh,Fd, Internal fermion: bar[Fd]
! Generic diagram: SFF,  InsertionOrder: 1
chargefactor = 1 
  Do i2=1,3
    Do i3=1,3
If ((Mhh2.gt.mf_l2(3)).Or.(MFd2(i2).gt.mf_l2(3))) Then
If (.not.OnlySM) Then 
coup1L = cplcFdFdhhL(i2,gt1)
coup1R = cplcFdFdhhR(i2,gt1)
coup2L = cplcFdFdhhL(i3,i2)
coup2R = cplcFdFdhhR(i3,i2)
coup3L = cplcFdFdAhL(gt2,i3)
coup3R = cplcFdFdAhR(gt2,i3)
coup4L = cplcFeFeAhL(gt4,gt3)
coup4R = cplcFeFeAhR(gt4,gt3)
! Masses in loop
mS1 = Mhh
mS12 = Mhh2
mF1 = MFd(i2)
mF12 = MFd2(i2)
! Mass of internal fermion 
MFin = MFd(i3)-MFd(gt1)
MFin2 = MFd2(i3)-MFd2(gt1)
If (Abs(MFin).gt.10E-10_dp) Then 
MFin = MFd(i3)
MFin2 = MFd2(i3)
! Propagator and inverse propagator mass 
MP = MAh
MP2 = MAh2
IMP = 1._dp/MP  
IMP2 = 1._dp/MP2 
! Amplitude 
  int1=B0(0._dp, mF12, mS12)
  int2=B1(0._dp, mF12, mS12)
  PSOddllSLL=PSOddllSLL+(chargefactor*coup3L*coup4L*IMP2*(-1.*coup1L*coup2R*int2*MassEx12 +& 
&  coup1R*coup2R*int1*MassEx1*mF1 - 1.*coup1R*coup2L*int2*MassEx1*MFin + coup1L*coup2L*int1*mF1*MFin))& 
& /(MassEx12 - 1.*MFin2)
  PSOddllSRR=PSOddllSRR+(chargefactor*coup3R*coup4R*IMP2*(-1.*coup1R*coup2L*int2*MassEx12 +& 
&  coup1L*coup2L*int1*MassEx1*mF1 - 1.*coup1L*coup2R*int2*MassEx1*MFin + coup1R*coup2R*int1*mF1*MFin))& 
& /(MassEx12 - 1.*MFin2)
  PSOddllSRL=PSOddllSRL+(chargefactor*coup3R*coup4L*IMP2*(-1.*coup1R*coup2L*int2*MassEx12 +& 
&  coup1L*coup2L*int1*MassEx1*mF1 - 1.*coup1L*coup2R*int2*MassEx1*MFin + coup1R*coup2R*int1*mF1*MFin))& 
& /(MassEx12 - 1.*MFin2)
  PSOddllSLR=PSOddllSLR+(chargefactor*coup3L*coup4R*IMP2*(-1.*coup1L*coup2R*int2*MassEx12 +& 
&  coup1R*coup2R*int1*MassEx1*mF1 - 1.*coup1R*coup2L*int2*MassEx1*MFin + coup1L*coup2L*int1*mF1*MFin))& 
& /(MassEx12 - 1.*MFin2)
  PSOddllVRR=PSOddllVRR+0.
  PSOddllVLL=PSOddllVLL+0.
  PSOddllVRL=PSOddllVRL+0.
  PSOddllVLR=PSOddllVLR+0.
  PSOddllTLL=PSOddllTLL+0.
  PSOddllTLR=PSOddllTLR+0.
  PSOddllTRL=PSOddllTRL+0.
  PSOddllTRR=PSOddllTRR+0.
     End if 
  End if 
End if 
   End Do 
  End Do 


 ! Propagator: Ah, Loop particles: Hp,Fu, Internal fermion: bar[Fd]
! Generic diagram: SFF,  InsertionOrder: 1
chargefactor = 1 
  Do i2=1,3
    Do i3=1,3
If ((MHp2.gt.mf_l2(3)).Or.(MFu2(i2).gt.mf_l2(3))) Then
If (((i2.lt.4).and.(i3.lt.4)).or.(.not.OnlySM)) Then 
coup1L = cplcFuFdHpL(i2,gt1)
coup1R = cplcFuFdHpR(i2,gt1)
coup2L = cplcFdFucHpL(i3,i2)
coup2R = cplcFdFucHpR(i3,i2)
coup3L = cplcFdFdAhL(gt2,i3)
coup3R = cplcFdFdAhR(gt2,i3)
coup4L = cplcFeFeAhL(gt4,gt3)
coup4R = cplcFeFeAhR(gt4,gt3)
! Masses in loop
mS1 = MHp
mS12 = MHp2
mF1 = MFu(i2)
mF12 = MFu2(i2)
! Mass of internal fermion 
MFin = MFd(i3)-MFd(gt1)
MFin2 = MFd2(i3)-MFd2(gt1)
If (Abs(MFin).gt.10E-10_dp) Then 
MFin = MFd(i3)
MFin2 = MFd2(i3)
! Propagator and inverse propagator mass 
MP = MAh
MP2 = MAh2
IMP = 1._dp/MP  
IMP2 = 1._dp/MP2 
! Amplitude 
  int1=B0(0._dp, mF12, mS12)
  int2=B1(0._dp, mF12, mS12)
  PSOddllSLL=PSOddllSLL+(chargefactor*coup3L*coup4L*IMP2*(-1.*coup1L*coup2R*int2*MassEx12 +& 
&  coup1R*coup2R*int1*MassEx1*mF1 - 1.*coup1R*coup2L*int2*MassEx1*MFin + coup1L*coup2L*int1*mF1*MFin))& 
& /(MassEx12 - 1.*MFin2)
  PSOddllSRR=PSOddllSRR+(chargefactor*coup3R*coup4R*IMP2*(-1.*coup1R*coup2L*int2*MassEx12 +& 
&  coup1L*coup2L*int1*MassEx1*mF1 - 1.*coup1L*coup2R*int2*MassEx1*MFin + coup1R*coup2R*int1*mF1*MFin))& 
& /(MassEx12 - 1.*MFin2)
  PSOddllSRL=PSOddllSRL+(chargefactor*coup3R*coup4L*IMP2*(-1.*coup1R*coup2L*int2*MassEx12 +& 
&  coup1L*coup2L*int1*MassEx1*mF1 - 1.*coup1L*coup2R*int2*MassEx1*MFin + coup1R*coup2R*int1*mF1*MFin))& 
& /(MassEx12 - 1.*MFin2)
  PSOddllSLR=PSOddllSLR+(chargefactor*coup3L*coup4R*IMP2*(-1.*coup1L*coup2R*int2*MassEx12 +& 
&  coup1R*coup2R*int1*MassEx1*mF1 - 1.*coup1R*coup2L*int2*MassEx1*MFin + coup1L*coup2L*int1*mF1*MFin))& 
& /(MassEx12 - 1.*MFin2)
  PSOddllVRR=PSOddllVRR+0.
  PSOddllVLL=PSOddllVLL+0.
  PSOddllVRL=PSOddllVRL+0.
  PSOddllVLR=PSOddllVLR+0.
  PSOddllTLL=PSOddllTLL+0.
  PSOddllTLR=PSOddllTLR+0.
  PSOddllTRL=PSOddllTRL+0.
  PSOddllTRR=PSOddllTRR+0.
     End if 
  End if 
End if 
   End Do 
  End Do 


 ! Propagator: Ah, Loop particles: VWp,Fu, Internal fermion: bar[Fd]
! Generic diagram: VFF,  InsertionOrder: 1
chargefactor = 1 
  Do i2=1,3
    Do i3=1,3
If ((MVWp2.gt.mf_l2(3)).Or.(MFu2(i2).gt.mf_l2(3))) Then
If (((i2.lt.4).and.(i3.lt.4)).or.(.not.OnlySM)) Then 
coup1L = cplcFuFdVWpL(i2,gt1)
coup1R = cplcFuFdVWpR(i2,gt1)
coup2L = cplcFdFucVWpL(i3,i2)
coup2R = cplcFdFucVWpR(i3,i2)
coup3L = cplcFdFdAhL(gt2,i3)
coup3R = cplcFdFdAhR(gt2,i3)
coup4L = cplcFeFeAhL(gt4,gt3)
coup4R = cplcFeFeAhR(gt4,gt3)
! Masses in loop
mV1 = MVWp
mV12 = MVWp2
mF1 = MFu(i2)
mF12 = MFu2(i2)
! Mass of internal fermion 
MFin = MFd(i3)-MFd(gt1)
MFin2 = MFd2(i3)-MFd2(gt1)
If (Abs(MFin).gt.10E-10_dp) Then 
MFin = MFd(i3)
MFin2 = MFd2(i3)
! Propagator and inverse propagator mass 
MP = MAh
MP2 = MAh2
IMP = 1._dp/MP  
IMP2 = 1._dp/MP2 
! Amplitude 
  int1=B0(0._dp, mF12, mV12)
  int2=B1(0._dp, mF12, mV12)
  PSOddllSLL=PSOddllSLL+(-1.*chargefactor*coup3L*coup4L*IMP2*(coup1R*MassEx1*(-       & 
& 2.*coup2L*(Finite - 2.*int1)*mF1 + coup2R*(Finite + 2.*int2)*MFin) + coup1L*(coup2L*(Finite + 2.*int2)& 
& *MassEx12 - 2.*coup2R*(Finite - 2.*int1)*mF1*MFin)))/(MassEx12 - 1.*MFin2)
  PSOddllSRR=PSOddllSRR+(-1.*chargefactor*coup3R*coup4R*IMP2*(coup1L*MassEx1*(-       & 
& 2.*coup2R*(Finite - 2.*int1)*mF1 + coup2L*(Finite + 2.*int2)*MFin) + coup1R*(coup2R*(Finite + 2.*int2)& 
& *MassEx12 - 2.*coup2L*(Finite - 2.*int1)*mF1*MFin)))/(MassEx12 - 1.*MFin2)
  PSOddllSRL=PSOddllSRL+(-1.*chargefactor*coup3R*coup4L*IMP2*(coup1L*MassEx1*(-       & 
& 2.*coup2R*(Finite - 2.*int1)*mF1 + coup2L*(Finite + 2.*int2)*MFin) + coup1R*(coup2R*(Finite + 2.*int2)& 
& *MassEx12 - 2.*coup2L*(Finite - 2.*int1)*mF1*MFin)))/(MassEx12 - 1.*MFin2)
  PSOddllSLR=PSOddllSLR+(-1.*chargefactor*coup3L*coup4R*IMP2*(coup1R*MassEx1*(-       & 
& 2.*coup2L*(Finite - 2.*int1)*mF1 + coup2R*(Finite + 2.*int2)*MFin) + coup1L*(coup2L*(Finite + 2.*int2)& 
& *MassEx12 - 2.*coup2R*(Finite - 2.*int1)*mF1*MFin)))/(MassEx12 - 1.*MFin2)
  PSOddllVRR=PSOddllVRR+0.
  PSOddllVLL=PSOddllVLL+0.
  PSOddllVRL=PSOddllVRL+0.
  PSOddllVLR=PSOddllVLR+0.
  PSOddllTLL=PSOddllTLL+0.
  PSOddllTLR=PSOddllTLR+0.
  PSOddllTRL=PSOddllTRL+0.
  PSOddllTRR=PSOddllTRR+0.
     End if 
  End if 
End if 
   End Do 
  End Do 


 ! Propagator: Ah, Loop particles: VZ,Fd, Internal fermion: bar[Fd]
! Generic diagram: VFF,  InsertionOrder: 1
chargefactor = 1 
  Do i2=1,3
    Do i3=1,3
If ((MVZ2.gt.mf_l2(3)).Or.(MFd2(i2).gt.mf_l2(3))) Then
If (((i2.lt.4).and.(i3.lt.4)).or.(.not.OnlySM)) Then 
coup1L = cplcFdFdVZL(i2,gt1)
coup1R = cplcFdFdVZR(i2,gt1)
coup2L = cplcFdFdVZL(i3,i2)
coup2R = cplcFdFdVZR(i3,i2)
coup3L = cplcFdFdAhL(gt2,i3)
coup3R = cplcFdFdAhR(gt2,i3)
coup4L = cplcFeFeAhL(gt4,gt3)
coup4R = cplcFeFeAhR(gt4,gt3)
! Masses in loop
mV1 = MVZ
mV12 = MVZ2
mF1 = MFd(i2)
mF12 = MFd2(i2)
! Mass of internal fermion 
MFin = MFd(i3)-MFd(gt1)
MFin2 = MFd2(i3)-MFd2(gt1)
If (Abs(MFin).gt.10E-10_dp) Then 
MFin = MFd(i3)
MFin2 = MFd2(i3)
! Propagator and inverse propagator mass 
MP = MAh
MP2 = MAh2
IMP = 1._dp/MP  
IMP2 = 1._dp/MP2 
! Amplitude 
  int1=B0(0._dp, mF12, mV12)
  int2=B1(0._dp, mF12, mV12)
  PSOddllSLL=PSOddllSLL+(-1.*chargefactor*coup3L*coup4L*IMP2*(coup1R*MassEx1*(-       & 
& 2.*coup2L*(Finite - 2.*int1)*mF1 + coup2R*(Finite + 2.*int2)*MFin) + coup1L*(coup2L*(Finite + 2.*int2)& 
& *MassEx12 - 2.*coup2R*(Finite - 2.*int1)*mF1*MFin)))/(MassEx12 - 1.*MFin2)
  PSOddllSRR=PSOddllSRR+(-1.*chargefactor*coup3R*coup4R*IMP2*(coup1L*MassEx1*(-       & 
& 2.*coup2R*(Finite - 2.*int1)*mF1 + coup2L*(Finite + 2.*int2)*MFin) + coup1R*(coup2R*(Finite + 2.*int2)& 
& *MassEx12 - 2.*coup2L*(Finite - 2.*int1)*mF1*MFin)))/(MassEx12 - 1.*MFin2)
  PSOddllSRL=PSOddllSRL+(-1.*chargefactor*coup3R*coup4L*IMP2*(coup1L*MassEx1*(-       & 
& 2.*coup2R*(Finite - 2.*int1)*mF1 + coup2L*(Finite + 2.*int2)*MFin) + coup1R*(coup2R*(Finite + 2.*int2)& 
& *MassEx12 - 2.*coup2L*(Finite - 2.*int1)*mF1*MFin)))/(MassEx12 - 1.*MFin2)
  PSOddllSLR=PSOddllSLR+(-1.*chargefactor*coup3L*coup4R*IMP2*(coup1R*MassEx1*(-       & 
& 2.*coup2L*(Finite - 2.*int1)*mF1 + coup2R*(Finite + 2.*int2)*MFin) + coup1L*(coup2L*(Finite + 2.*int2)& 
& *MassEx12 - 2.*coup2R*(Finite - 2.*int1)*mF1*MFin)))/(MassEx12 - 1.*MFin2)
  PSOddllVRR=PSOddllVRR+0.
  PSOddllVLL=PSOddllVLL+0.
  PSOddllVRL=PSOddllVRL+0.
  PSOddllVLR=PSOddllVLR+0.
  PSOddllTLL=PSOddllTLL+0.
  PSOddllTLR=PSOddllTLR+0.
  PSOddllTRL=PSOddllTRL+0.
  PSOddllTRR=PSOddllTRR+0.
     End if 
  End if 
End if 
   End Do 
  End Do 


 ! Propagator: Ah, Loop particles: Fd,Ah, Internal fermion: Fd
! Generic diagram: FSF,  InsertionOrder: 2
chargefactor = 1 
Do i1=1,3
    Do i3=1,3
If ((MFd2(i1).gt.mf_l2(3)).Or.(MAh2.gt.mf_l2(3))) Then
If (((i1.lt.4).and.(i3.lt.4)).or.(.not.OnlySM)) Then 
coup3L = cplcFdFdAhL(i3,gt1)
coup3R = cplcFdFdAhR(i3,gt1)
coup2L = cplcFdFdAhL(i1,i3)
coup2R = cplcFdFdAhR(i1,i3)
coup1L = cplcFdFdAhL(gt2,i1)
coup1R = cplcFdFdAhR(gt2,i1)
coup4L = cplcFeFeAhL(gt4,gt3)
coup4R = cplcFeFeAhR(gt4,gt3)
! Masses in loop
mF1 = MFd(i1)
mF12 = MFd2(i1)
mS1 = MAh
mS12 = MAh2
! Mass of internal fermion 
MFin = MFd(i3)-MFd(gt2)
MFin2 = MFd2(i3)-MFd2(gt2)
If (Abs(MFin).gt.10E-10_dp) Then 
MFin = MFd(i3)
MFin2 = MFd2(i3)
! Propagator and inverse propagator mass 
MP = MAh
MP2 = MAh2
IMP = 1._dp/MP  
IMP2 = 1._dp/MP2 
! Amplitude 
  int1=B0(0._dp, mF12, mS12)
  int2=B1(0._dp, mF12, mS12)
  PSOddllSLL=PSOddllSLL+(chargefactor*coup3L*coup4L*IMP2*(-1.*coup1L*coup2R*int2*MassEx22 +& 
&  coup1R*coup2R*int1*MassEx2*mF1 - 1.*coup1R*coup2L*int2*MassEx2*MFin + coup1L*coup2L*int1*mF1*MFin))& 
& /(MassEx22 - 1.*MFin2)
  PSOddllSRR=PSOddllSRR+(chargefactor*coup3R*coup4R*IMP2*(-1.*coup1R*coup2L*int2*MassEx22 +& 
&  coup1L*coup2L*int1*MassEx2*mF1 - 1.*coup1L*coup2R*int2*MassEx2*MFin + coup1R*coup2R*int1*mF1*MFin))& 
& /(MassEx22 - 1.*MFin2)
  PSOddllSRL=PSOddllSRL+(chargefactor*coup3R*coup4L*IMP2*(-1.*coup1R*coup2L*int2*MassEx22 +& 
&  coup1L*coup2L*int1*MassEx2*mF1 - 1.*coup1L*coup2R*int2*MassEx2*MFin + coup1R*coup2R*int1*mF1*MFin))& 
& /(MassEx22 - 1.*MFin2)
  PSOddllSLR=PSOddllSLR+(chargefactor*coup3L*coup4R*IMP2*(-1.*coup1L*coup2R*int2*MassEx22 +& 
&  coup1R*coup2R*int1*MassEx2*mF1 - 1.*coup1R*coup2L*int2*MassEx2*MFin + coup1L*coup2L*int1*mF1*MFin))& 
& /(MassEx22 - 1.*MFin2)
  PSOddllVRR=PSOddllVRR+0.
  PSOddllVLL=PSOddllVLL+0.
  PSOddllVRL=PSOddllVRL+0.
  PSOddllVLR=PSOddllVLR+0.
  PSOddllTLL=PSOddllTLL+0.
  PSOddllTLR=PSOddllTLR+0.
  PSOddllTRL=PSOddllTRL+0.
  PSOddllTRR=PSOddllTRR+0.
     End if 
  End if 
End if 
    End Do 
  End Do 


 ! Propagator: Ah, Loop particles: Fd,hh, Internal fermion: Fd
! Generic diagram: FSF,  InsertionOrder: 2
chargefactor = 1 
Do i1=1,3
    Do i3=1,3
If ((MFd2(i1).gt.mf_l2(3)).Or.(Mhh2.gt.mf_l2(3))) Then
If (.not.OnlySM) Then 
coup3L = cplcFdFdAhL(i3,gt1)
coup3R = cplcFdFdAhR(i3,gt1)
coup2L = cplcFdFdhhL(i1,i3)
coup2R = cplcFdFdhhR(i1,i3)
coup1L = cplcFdFdhhL(gt2,i1)
coup1R = cplcFdFdhhR(gt2,i1)
coup4L = cplcFeFeAhL(gt4,gt3)
coup4R = cplcFeFeAhR(gt4,gt3)
! Masses in loop
mF1 = MFd(i1)
mF12 = MFd2(i1)
mS1 = Mhh
mS12 = Mhh2
! Mass of internal fermion 
MFin = MFd(i3)-MFd(gt2)
MFin2 = MFd2(i3)-MFd2(gt2)
If (Abs(MFin).gt.10E-10_dp) Then 
MFin = MFd(i3)
MFin2 = MFd2(i3)
! Propagator and inverse propagator mass 
MP = MAh
MP2 = MAh2
IMP = 1._dp/MP  
IMP2 = 1._dp/MP2 
! Amplitude 
  int1=B0(0._dp, mF12, mS12)
  int2=B1(0._dp, mF12, mS12)
  PSOddllSLL=PSOddllSLL+(chargefactor*coup3L*coup4L*IMP2*(-1.*coup1L*coup2R*int2*MassEx22 +& 
&  coup1R*coup2R*int1*MassEx2*mF1 - 1.*coup1R*coup2L*int2*MassEx2*MFin + coup1L*coup2L*int1*mF1*MFin))& 
& /(MassEx22 - 1.*MFin2)
  PSOddllSRR=PSOddllSRR+(chargefactor*coup3R*coup4R*IMP2*(-1.*coup1R*coup2L*int2*MassEx22 +& 
&  coup1L*coup2L*int1*MassEx2*mF1 - 1.*coup1L*coup2R*int2*MassEx2*MFin + coup1R*coup2R*int1*mF1*MFin))& 
& /(MassEx22 - 1.*MFin2)
  PSOddllSRL=PSOddllSRL+(chargefactor*coup3R*coup4L*IMP2*(-1.*coup1R*coup2L*int2*MassEx22 +& 
&  coup1L*coup2L*int1*MassEx2*mF1 - 1.*coup1L*coup2R*int2*MassEx2*MFin + coup1R*coup2R*int1*mF1*MFin))& 
& /(MassEx22 - 1.*MFin2)
  PSOddllSLR=PSOddllSLR+(chargefactor*coup3L*coup4R*IMP2*(-1.*coup1L*coup2R*int2*MassEx22 +& 
&  coup1R*coup2R*int1*MassEx2*mF1 - 1.*coup1R*coup2L*int2*MassEx2*MFin + coup1L*coup2L*int1*mF1*MFin))& 
& /(MassEx22 - 1.*MFin2)
  PSOddllVRR=PSOddllVRR+0.
  PSOddllVLL=PSOddllVLL+0.
  PSOddllVRL=PSOddllVRL+0.
  PSOddllVLR=PSOddllVLR+0.
  PSOddllTLL=PSOddllTLL+0.
  PSOddllTLR=PSOddllTLR+0.
  PSOddllTRL=PSOddllTRL+0.
  PSOddllTRR=PSOddllTRR+0.
     End if 
  End if 
End if 
    End Do 
  End Do 


 ! Propagator: Ah, Loop particles: Fu,Hp, Internal fermion: Fd
! Generic diagram: FSF,  InsertionOrder: 2
chargefactor = 1 
Do i1=1,3
    Do i3=1,3
If ((MFu2(i1).gt.mf_l2(3)).Or.(MHp2.gt.mf_l2(3))) Then
If (((i1.lt.4).and.(i3.lt.4)).or.(.not.OnlySM)) Then 
coup3L = cplcFdFdAhL(i3,gt1)
coup3R = cplcFdFdAhR(i3,gt1)
coup2L = cplcFuFdHpL(i1,i3)
coup2R = cplcFuFdHpR(i1,i3)
coup1L = cplcFdFucHpL(gt2,i1)
coup1R = cplcFdFucHpR(gt2,i1)
coup4L = cplcFeFeAhL(gt4,gt3)
coup4R = cplcFeFeAhR(gt4,gt3)
! Masses in loop
mF1 = MFu(i1)
mF12 = MFu2(i1)
mS1 = MHp
mS12 = MHp2
! Mass of internal fermion 
MFin = MFd(i3)-MFd(gt2)
MFin2 = MFd2(i3)-MFd2(gt2)
If (Abs(MFin).gt.10E-10_dp) Then 
MFin = MFd(i3)
MFin2 = MFd2(i3)
! Propagator and inverse propagator mass 
MP = MAh
MP2 = MAh2
IMP = 1._dp/MP  
IMP2 = 1._dp/MP2 
! Amplitude 
  int1=B0(0._dp, mF12, mS12)
  int2=B1(0._dp, mF12, mS12)
  PSOddllSLL=PSOddllSLL+(chargefactor*coup3L*coup4L*IMP2*(-1.*coup1L*coup2R*int2*MassEx22 +& 
&  coup1R*coup2R*int1*MassEx2*mF1 - 1.*coup1R*coup2L*int2*MassEx2*MFin + coup1L*coup2L*int1*mF1*MFin))& 
& /(MassEx22 - 1.*MFin2)
  PSOddllSRR=PSOddllSRR+(chargefactor*coup3R*coup4R*IMP2*(-1.*coup1R*coup2L*int2*MassEx22 +& 
&  coup1L*coup2L*int1*MassEx2*mF1 - 1.*coup1L*coup2R*int2*MassEx2*MFin + coup1R*coup2R*int1*mF1*MFin))& 
& /(MassEx22 - 1.*MFin2)
  PSOddllSRL=PSOddllSRL+(chargefactor*coup3R*coup4L*IMP2*(-1.*coup1R*coup2L*int2*MassEx22 +& 
&  coup1L*coup2L*int1*MassEx2*mF1 - 1.*coup1L*coup2R*int2*MassEx2*MFin + coup1R*coup2R*int1*mF1*MFin))& 
& /(MassEx22 - 1.*MFin2)
  PSOddllSLR=PSOddllSLR+(chargefactor*coup3L*coup4R*IMP2*(-1.*coup1L*coup2R*int2*MassEx22 +& 
&  coup1R*coup2R*int1*MassEx2*mF1 - 1.*coup1R*coup2L*int2*MassEx2*MFin + coup1L*coup2L*int1*mF1*MFin))& 
& /(MassEx22 - 1.*MFin2)
  PSOddllVRR=PSOddllVRR+0.
  PSOddllVLL=PSOddllVLL+0.
  PSOddllVRL=PSOddllVRL+0.
  PSOddllVLR=PSOddllVLR+0.
  PSOddllTLL=PSOddllTLL+0.
  PSOddllTLR=PSOddllTLR+0.
  PSOddllTRL=PSOddllTRL+0.
  PSOddllTRR=PSOddllTRR+0.
     End if 
  End if 
End if 
    End Do 
  End Do 


 ! Propagator: Ah, Loop particles: Fu,VWp, Internal fermion: Fd
! Generic diagram: FVF,  InsertionOrder: 2
chargefactor = 1 
Do i1=1,3
    Do i3=1,3
If ((MFu2(i1).gt.mf_l2(3)).Or.(MVWp2.gt.mf_l2(3))) Then
If (((i1.lt.4).and.(i3.lt.4)).or.(.not.OnlySM)) Then 
coup3L = cplcFdFdAhL(i3,gt1)
coup3R = cplcFdFdAhR(i3,gt1)
coup2L = cplcFuFdVWpL(i1,i3)
coup2R = cplcFuFdVWpR(i1,i3)
coup1L = cplcFdFucVWpL(gt2,i1)
coup1R = cplcFdFucVWpR(gt2,i1)
coup4L = cplcFeFeAhL(gt4,gt3)
coup4R = cplcFeFeAhR(gt4,gt3)
! Masses in loop
mF1 = MFu(i1)
mF12 = MFu2(i1)
mV1 = MVWp
mV12 = MVWp2
! Mass of internal fermion 
MFin = MFd(i3)-MFd(gt2)
MFin2 = MFd2(i3)-MFd2(gt2)
If (Abs(MFin).gt.10E-10_dp) Then 
MFin = MFd(i3)
MFin2 = MFd2(i3)
! Propagator and inverse propagator mass 
MP = MAh
MP2 = MAh2
IMP = 1._dp/MP  
IMP2 = 1._dp/MP2 
! Amplitude 
  int1=B0(0._dp, mF12, mV12)
  int2=B1(0._dp, mF12, mV12)
  PSOddllSLL=PSOddllSLL+(-1.*chargefactor*coup3L*coup4L*IMP2*(coup1L*MassEx2*(-       & 
& 2.*coup2R*(Finite - 2.*int1)*mF1 + coup2L*(Finite + 2.*int2)*MFin) + coup1R*(coup2R*(Finite + 2.*int2)& 
& *MassEx22 - 2.*coup2L*(Finite - 2.*int1)*mF1*MFin)))/(MassEx22 - 1.*MFin2)
  PSOddllSRR=PSOddllSRR+(-1.*chargefactor*coup3R*coup4R*IMP2*(coup1R*MassEx2*(-       & 
& 2.*coup2L*(Finite - 2.*int1)*mF1 + coup2R*(Finite + 2.*int2)*MFin) + coup1L*(coup2L*(Finite + 2.*int2)& 
& *MassEx22 - 2.*coup2R*(Finite - 2.*int1)*mF1*MFin)))/(MassEx22 - 1.*MFin2)
  PSOddllSRL=PSOddllSRL+(-1.*chargefactor*coup3R*coup4L*IMP2*(coup1R*MassEx2*(-       & 
& 2.*coup2L*(Finite - 2.*int1)*mF1 + coup2R*(Finite + 2.*int2)*MFin) + coup1L*(coup2L*(Finite + 2.*int2)& 
& *MassEx22 - 2.*coup2R*(Finite - 2.*int1)*mF1*MFin)))/(MassEx22 - 1.*MFin2)
  PSOddllSLR=PSOddllSLR+(-1.*chargefactor*coup3L*coup4R*IMP2*(coup1L*MassEx2*(-       & 
& 2.*coup2R*(Finite - 2.*int1)*mF1 + coup2L*(Finite + 2.*int2)*MFin) + coup1R*(coup2R*(Finite + 2.*int2)& 
& *MassEx22 - 2.*coup2L*(Finite - 2.*int1)*mF1*MFin)))/(MassEx22 - 1.*MFin2)
  PSOddllVRR=PSOddllVRR+0.
  PSOddllVLL=PSOddllVLL+0.
  PSOddllVRL=PSOddllVRL+0.
  PSOddllVLR=PSOddllVLR+0.
  PSOddllTLL=PSOddllTLL+0.
  PSOddllTLR=PSOddllTLR+0.
  PSOddllTRL=PSOddllTRL+0.
  PSOddllTRR=PSOddllTRR+0.
     End if 
  End if 
End if 
    End Do 
  End Do 


 ! Propagator: Ah, Loop particles: Fd,VZ, Internal fermion: Fd
! Generic diagram: FVF,  InsertionOrder: 2
chargefactor = 1 
Do i1=1,3
    Do i3=1,3
If ((MFd2(i1).gt.mf_l2(3)).Or.(MVZ2.gt.mf_l2(3))) Then
If (((i1.lt.4).and.(i3.lt.4)).or.(.not.OnlySM)) Then 
coup3L = cplcFdFdAhL(i3,gt1)
coup3R = cplcFdFdAhR(i3,gt1)
coup2L = cplcFdFdVZL(i1,i3)
coup2R = cplcFdFdVZR(i1,i3)
coup1L = cplcFdFdVZL(gt2,i1)
coup1R = cplcFdFdVZR(gt2,i1)
coup4L = cplcFeFeAhL(gt4,gt3)
coup4R = cplcFeFeAhR(gt4,gt3)
! Masses in loop
mF1 = MFd(i1)
mF12 = MFd2(i1)
mV1 = MVZ
mV12 = MVZ2
! Mass of internal fermion 
MFin = MFd(i3)-MFd(gt2)
MFin2 = MFd2(i3)-MFd2(gt2)
If (Abs(MFin).gt.10E-10_dp) Then 
MFin = MFd(i3)
MFin2 = MFd2(i3)
! Propagator and inverse propagator mass 
MP = MAh
MP2 = MAh2
IMP = 1._dp/MP  
IMP2 = 1._dp/MP2 
! Amplitude 
  int1=B0(0._dp, mF12, mV12)
  int2=B1(0._dp, mF12, mV12)
  PSOddllSLL=PSOddllSLL+(-1.*chargefactor*coup3L*coup4L*IMP2*(coup1L*MassEx2*(-       & 
& 2.*coup2R*(Finite - 2.*int1)*mF1 + coup2L*(Finite + 2.*int2)*MFin) + coup1R*(coup2R*(Finite + 2.*int2)& 
& *MassEx22 - 2.*coup2L*(Finite - 2.*int1)*mF1*MFin)))/(MassEx22 - 1.*MFin2)
  PSOddllSRR=PSOddllSRR+(-1.*chargefactor*coup3R*coup4R*IMP2*(coup1R*MassEx2*(-       & 
& 2.*coup2L*(Finite - 2.*int1)*mF1 + coup2R*(Finite + 2.*int2)*MFin) + coup1L*(coup2L*(Finite + 2.*int2)& 
& *MassEx22 - 2.*coup2R*(Finite - 2.*int1)*mF1*MFin)))/(MassEx22 - 1.*MFin2)
  PSOddllSRL=PSOddllSRL+(-1.*chargefactor*coup3R*coup4L*IMP2*(coup1R*MassEx2*(-       & 
& 2.*coup2L*(Finite - 2.*int1)*mF1 + coup2R*(Finite + 2.*int2)*MFin) + coup1L*(coup2L*(Finite + 2.*int2)& 
& *MassEx22 - 2.*coup2R*(Finite - 2.*int1)*mF1*MFin)))/(MassEx22 - 1.*MFin2)
  PSOddllSLR=PSOddllSLR+(-1.*chargefactor*coup3L*coup4R*IMP2*(coup1L*MassEx2*(-       & 
& 2.*coup2R*(Finite - 2.*int1)*mF1 + coup2L*(Finite + 2.*int2)*MFin) + coup1R*(coup2R*(Finite + 2.*int2)& 
& *MassEx22 - 2.*coup2L*(Finite - 2.*int1)*mF1*MFin)))/(MassEx22 - 1.*MFin2)
  PSOddllVRR=PSOddllVRR+0.
  PSOddllVLL=PSOddllVLL+0.
  PSOddllVRL=PSOddllVRL+0.
  PSOddllVLR=PSOddllVLR+0.
  PSOddllTLL=PSOddllTLL+0.
  PSOddllTLR=PSOddllTLR+0.
  PSOddllTRL=PSOddllTRL+0.
  PSOddllTRR=PSOddllTRR+0.
     End if 
  End if 
End if 
    End Do 
  End Do 


 ! Propagator: Ah, Loop particles: Ah,Fe, Internal fermion: bar[Fe]
! Generic diagram: SFF,  InsertionOrder: 7
chargefactor = 1 
  Do i2=1,3
    Do i3=1,3
If ((MAh2.gt.mf_l2(3)).Or.(MFe2(i2).gt.mf_l2(3))) Then
If (((i2.lt.4).and.(i3.lt.4)).or.(.not.OnlySM)) Then 
coup1L = cplcFeFeAhL(i2,gt3)
coup1R = cplcFeFeAhR(i2,gt3)
coup2L = cplcFeFeAhL(i3,i2)
coup2R = cplcFeFeAhR(i3,i2)
coup3L = cplcFeFeAhL(gt4,i3)
coup3R = cplcFeFeAhR(gt4,i3)
coup4L = cplcFdFdAhL(gt2,gt1)
coup4R = cplcFdFdAhR(gt2,gt1)
! Masses in loop
mS1 = MAh
mS12 = MAh2
mF1 = MFe(i2)
mF12 = MFe2(i2)
! Mass of internal fermion 
MFin = MFe(i3)-MFe(gt3)
MFin2 = MFe2(i3)-MFe2(gt3)
If (Abs(MFin).gt.10E-10_dp) Then 
MFin = MFe(i3)
MFin2 = MFe2(i3)
! Propagator and inverse propagator mass 
MP = MAh
MP2 = MAh2
IMP = 1._dp/MP  
IMP2 = 1._dp/MP2 
! Amplitude 
  int1=B0(0._dp, mF12, mS12)
  int2=B1(0._dp, mF12, mS12)
  PSOddllSLL=PSOddllSLL+(chargefactor*coup3L*coup4L*IMP2*(-1.*coup1L*coup2R*int2*MassEx32 +& 
&  coup1R*coup2R*int1*MassEx3*mF1 - 1.*coup1R*coup2L*int2*MassEx3*MFin + coup1L*coup2L*int1*mF1*MFin))& 
& /(MassEx32 - 1.*MFin2)
  PSOddllSRR=PSOddllSRR+(chargefactor*coup3R*coup4R*IMP2*(-1.*coup1R*coup2L*int2*MassEx32 +& 
&  coup1L*coup2L*int1*MassEx3*mF1 - 1.*coup1L*coup2R*int2*MassEx3*MFin + coup1R*coup2R*int1*mF1*MFin))& 
& /(MassEx32 - 1.*MFin2)
  PSOddllSRL=PSOddllSRL+(chargefactor*coup3L*coup4R*IMP2*(-1.*coup1L*coup2R*int2*MassEx32 +& 
&  coup1R*coup2R*int1*MassEx3*mF1 - 1.*coup1R*coup2L*int2*MassEx3*MFin + coup1L*coup2L*int1*mF1*MFin))& 
& /(MassEx32 - 1.*MFin2)
  PSOddllSLR=PSOddllSLR+(chargefactor*coup3R*coup4L*IMP2*(-1.*coup1R*coup2L*int2*MassEx32 +& 
&  coup1L*coup2L*int1*MassEx3*mF1 - 1.*coup1L*coup2R*int2*MassEx3*MFin + coup1R*coup2R*int1*mF1*MFin))& 
& /(MassEx32 - 1.*MFin2)
  PSOddllVRR=PSOddllVRR+0.
  PSOddllVLL=PSOddllVLL+0.
  PSOddllVRL=PSOddllVRL+0.
  PSOddllVLR=PSOddllVLR+0.
  PSOddllTLL=PSOddllTLL+0.
  PSOddllTLR=PSOddllTLR+0.
  PSOddllTRL=PSOddllTRL+0.
  PSOddllTRR=PSOddllTRR+0.
     End if 
  End if 
End if 
   End Do 
  End Do 


 ! Propagator: Ah, Loop particles: hh,Fe, Internal fermion: bar[Fe]
! Generic diagram: SFF,  InsertionOrder: 7
chargefactor = 1 
  Do i2=1,3
    Do i3=1,3
If ((Mhh2.gt.mf_l2(3)).Or.(MFe2(i2).gt.mf_l2(3))) Then
If (.not.OnlySM) Then 
coup1L = cplcFeFehhL(i2,gt3)
coup1R = cplcFeFehhR(i2,gt3)
coup2L = cplcFeFehhL(i3,i2)
coup2R = cplcFeFehhR(i3,i2)
coup3L = cplcFeFeAhL(gt4,i3)
coup3R = cplcFeFeAhR(gt4,i3)
coup4L = cplcFdFdAhL(gt2,gt1)
coup4R = cplcFdFdAhR(gt2,gt1)
! Masses in loop
mS1 = Mhh
mS12 = Mhh2
mF1 = MFe(i2)
mF12 = MFe2(i2)
! Mass of internal fermion 
MFin = MFe(i3)-MFe(gt3)
MFin2 = MFe2(i3)-MFe2(gt3)
If (Abs(MFin).gt.10E-10_dp) Then 
MFin = MFe(i3)
MFin2 = MFe2(i3)
! Propagator and inverse propagator mass 
MP = MAh
MP2 = MAh2
IMP = 1._dp/MP  
IMP2 = 1._dp/MP2 
! Amplitude 
  int1=B0(0._dp, mF12, mS12)
  int2=B1(0._dp, mF12, mS12)
  PSOddllSLL=PSOddllSLL+(chargefactor*coup3L*coup4L*IMP2*(-1.*coup1L*coup2R*int2*MassEx32 +& 
&  coup1R*coup2R*int1*MassEx3*mF1 - 1.*coup1R*coup2L*int2*MassEx3*MFin + coup1L*coup2L*int1*mF1*MFin))& 
& /(MassEx32 - 1.*MFin2)
  PSOddllSRR=PSOddllSRR+(chargefactor*coup3R*coup4R*IMP2*(-1.*coup1R*coup2L*int2*MassEx32 +& 
&  coup1L*coup2L*int1*MassEx3*mF1 - 1.*coup1L*coup2R*int2*MassEx3*MFin + coup1R*coup2R*int1*mF1*MFin))& 
& /(MassEx32 - 1.*MFin2)
  PSOddllSRL=PSOddllSRL+(chargefactor*coup3L*coup4R*IMP2*(-1.*coup1L*coup2R*int2*MassEx32 +& 
&  coup1R*coup2R*int1*MassEx3*mF1 - 1.*coup1R*coup2L*int2*MassEx3*MFin + coup1L*coup2L*int1*mF1*MFin))& 
& /(MassEx32 - 1.*MFin2)
  PSOddllSLR=PSOddllSLR+(chargefactor*coup3R*coup4L*IMP2*(-1.*coup1R*coup2L*int2*MassEx32 +& 
&  coup1L*coup2L*int1*MassEx3*mF1 - 1.*coup1L*coup2R*int2*MassEx3*MFin + coup1R*coup2R*int1*mF1*MFin))& 
& /(MassEx32 - 1.*MFin2)
  PSOddllVRR=PSOddllVRR+0.
  PSOddllVLL=PSOddllVLL+0.
  PSOddllVRL=PSOddllVRL+0.
  PSOddllVLR=PSOddllVLR+0.
  PSOddllTLL=PSOddllTLL+0.
  PSOddllTLR=PSOddllTLR+0.
  PSOddllTRL=PSOddllTRL+0.
  PSOddllTRR=PSOddllTRR+0.
     End if 
  End if 
End if 
   End Do 
  End Do 


 ! Propagator: Ah, Loop particles: VZ,Fe, Internal fermion: bar[Fe]
! Generic diagram: VFF,  InsertionOrder: 7
chargefactor = 1 
  Do i2=1,3
    Do i3=1,3
If ((MVZ2.gt.mf_l2(3)).Or.(MFe2(i2).gt.mf_l2(3))) Then
If (((i2.lt.4).and.(i3.lt.4)).or.(.not.OnlySM)) Then 
coup1L = cplcFeFeVZL(i2,gt3)
coup1R = cplcFeFeVZR(i2,gt3)
coup2L = cplcFeFeVZL(i3,i2)
coup2R = cplcFeFeVZR(i3,i2)
coup3L = cplcFeFeAhL(gt4,i3)
coup3R = cplcFeFeAhR(gt4,i3)
coup4L = cplcFdFdAhL(gt2,gt1)
coup4R = cplcFdFdAhR(gt2,gt1)
! Masses in loop
mV1 = MVZ
mV12 = MVZ2
mF1 = MFe(i2)
mF12 = MFe2(i2)
! Mass of internal fermion 
MFin = MFe(i3)-MFe(gt3)
MFin2 = MFe2(i3)-MFe2(gt3)
If (Abs(MFin).gt.10E-10_dp) Then 
MFin = MFe(i3)
MFin2 = MFe2(i3)
! Propagator and inverse propagator mass 
MP = MAh
MP2 = MAh2
IMP = 1._dp/MP  
IMP2 = 1._dp/MP2 
! Amplitude 
  int1=B0(0._dp, mF12, mV12)
  int2=B1(0._dp, mF12, mV12)
  PSOddllSLL=PSOddllSLL+(-1.*chargefactor*coup3L*coup4L*IMP2*(coup1R*MassEx3*(-       & 
& 2.*coup2L*(Finite - 2.*int1)*mF1 + coup2R*(Finite + 2.*int2)*MFin) + coup1L*(coup2L*(Finite + 2.*int2)& 
& *MassEx32 - 2.*coup2R*(Finite - 2.*int1)*mF1*MFin)))/(MassEx32 - 1.*MFin2)
  PSOddllSRR=PSOddllSRR+(-1.*chargefactor*coup3R*coup4R*IMP2*(coup1L*MassEx3*(-       & 
& 2.*coup2R*(Finite - 2.*int1)*mF1 + coup2L*(Finite + 2.*int2)*MFin) + coup1R*(coup2R*(Finite + 2.*int2)& 
& *MassEx32 - 2.*coup2L*(Finite - 2.*int1)*mF1*MFin)))/(MassEx32 - 1.*MFin2)
  PSOddllSRL=PSOddllSRL+(-1.*chargefactor*coup3L*coup4R*IMP2*(coup1R*MassEx3*(-       & 
& 2.*coup2L*(Finite - 2.*int1)*mF1 + coup2R*(Finite + 2.*int2)*MFin) + coup1L*(coup2L*(Finite + 2.*int2)& 
& *MassEx32 - 2.*coup2R*(Finite - 2.*int1)*mF1*MFin)))/(MassEx32 - 1.*MFin2)
  PSOddllSLR=PSOddllSLR+(-1.*chargefactor*coup3R*coup4L*IMP2*(coup1L*MassEx3*(-       & 
& 2.*coup2R*(Finite - 2.*int1)*mF1 + coup2L*(Finite + 2.*int2)*MFin) + coup1R*(coup2R*(Finite + 2.*int2)& 
& *MassEx32 - 2.*coup2L*(Finite - 2.*int1)*mF1*MFin)))/(MassEx32 - 1.*MFin2)
  PSOddllVRR=PSOddllVRR+0.
  PSOddllVLL=PSOddllVLL+0.
  PSOddllVRL=PSOddllVRL+0.
  PSOddllVLR=PSOddllVLR+0.
  PSOddllTLL=PSOddllTLL+0.
  PSOddllTLR=PSOddllTLR+0.
  PSOddllTRL=PSOddllTRL+0.
  PSOddllTRR=PSOddllTRR+0.
     End if 
  End if 
End if 
   End Do 
  End Do 


 ! Propagator: Ah, Loop particles: Fe,Ah, Internal fermion: Fe
! Generic diagram: FSF,  InsertionOrder: 8
chargefactor = 1 
Do i1=1,3
    Do i3=1,3
If ((MFe2(i1).gt.mf_l2(3)).Or.(MAh2.gt.mf_l2(3))) Then
If (((i1.lt.4).and.(i3.lt.4)).or.(.not.OnlySM)) Then 
coup3L = cplcFeFeAhL(i3,gt3)
coup3R = cplcFeFeAhR(i3,gt3)
coup2L = cplcFeFeAhL(i1,i3)
coup2R = cplcFeFeAhR(i1,i3)
coup1L = cplcFeFeAhL(gt4,i1)
coup1R = cplcFeFeAhR(gt4,i1)
coup4L = cplcFdFdAhL(gt2,gt1)
coup4R = cplcFdFdAhR(gt2,gt1)
! Masses in loop
mF1 = MFe(i1)
mF12 = MFe2(i1)
mS1 = MAh
mS12 = MAh2
! Mass of internal fermion 
MFin = MFe(i3)-MFe(gt4)
MFin2 = MFe2(i3)-MFe2(gt4)
If (Abs(MFin).gt.10E-10_dp) Then 
MFin = MFe(i3)
MFin2 = MFe2(i3)
! Propagator and inverse propagator mass 
MP = MAh
MP2 = MAh2
IMP = 1._dp/MP  
IMP2 = 1._dp/MP2 
! Amplitude 
  int1=B0(0._dp, mF12, mS12)
  int2=B1(0._dp, mF12, mS12)
  PSOddllSLL=PSOddllSLL+(chargefactor*coup3L*coup4L*IMP2*(-1.*coup1L*coup2R*int2*MassEx42 +& 
&  coup1R*coup2R*int1*MassEx4*mF1 - 1.*coup1R*coup2L*int2*MassEx4*MFin + coup1L*coup2L*int1*mF1*MFin))& 
& /(MassEx42 - 1.*MFin2)
  PSOddllSRR=PSOddllSRR+(chargefactor*coup3R*coup4R*IMP2*(-1.*coup1R*coup2L*int2*MassEx42 +& 
&  coup1L*coup2L*int1*MassEx4*mF1 - 1.*coup1L*coup2R*int2*MassEx4*MFin + coup1R*coup2R*int1*mF1*MFin))& 
& /(MassEx42 - 1.*MFin2)
  PSOddllSRL=PSOddllSRL+(chargefactor*coup3L*coup4R*IMP2*(-1.*coup1L*coup2R*int2*MassEx42 +& 
&  coup1R*coup2R*int1*MassEx4*mF1 - 1.*coup1R*coup2L*int2*MassEx4*MFin + coup1L*coup2L*int1*mF1*MFin))& 
& /(MassEx42 - 1.*MFin2)
  PSOddllSLR=PSOddllSLR+(chargefactor*coup3R*coup4L*IMP2*(-1.*coup1R*coup2L*int2*MassEx42 +& 
&  coup1L*coup2L*int1*MassEx4*mF1 - 1.*coup1L*coup2R*int2*MassEx4*MFin + coup1R*coup2R*int1*mF1*MFin))& 
& /(MassEx42 - 1.*MFin2)
  PSOddllVRR=PSOddllVRR+0.
  PSOddllVLL=PSOddllVLL+0.
  PSOddllVRL=PSOddllVRL+0.
  PSOddllVLR=PSOddllVLR+0.
  PSOddllTLL=PSOddllTLL+0.
  PSOddllTLR=PSOddllTLR+0.
  PSOddllTRL=PSOddllTRL+0.
  PSOddllTRR=PSOddllTRR+0.
     End if 
  End if 
End if 
    End Do 
  End Do 


 ! Propagator: Ah, Loop particles: Fe,hh, Internal fermion: Fe
! Generic diagram: FSF,  InsertionOrder: 8
chargefactor = 1 
Do i1=1,3
    Do i3=1,3
If ((MFe2(i1).gt.mf_l2(3)).Or.(Mhh2.gt.mf_l2(3))) Then
If (.not.OnlySM) Then 
coup3L = cplcFeFeAhL(i3,gt3)
coup3R = cplcFeFeAhR(i3,gt3)
coup2L = cplcFeFehhL(i1,i3)
coup2R = cplcFeFehhR(i1,i3)
coup1L = cplcFeFehhL(gt4,i1)
coup1R = cplcFeFehhR(gt4,i1)
coup4L = cplcFdFdAhL(gt2,gt1)
coup4R = cplcFdFdAhR(gt2,gt1)
! Masses in loop
mF1 = MFe(i1)
mF12 = MFe2(i1)
mS1 = Mhh
mS12 = Mhh2
! Mass of internal fermion 
MFin = MFe(i3)-MFe(gt4)
MFin2 = MFe2(i3)-MFe2(gt4)
If (Abs(MFin).gt.10E-10_dp) Then 
MFin = MFe(i3)
MFin2 = MFe2(i3)
! Propagator and inverse propagator mass 
MP = MAh
MP2 = MAh2
IMP = 1._dp/MP  
IMP2 = 1._dp/MP2 
! Amplitude 
  int1=B0(0._dp, mF12, mS12)
  int2=B1(0._dp, mF12, mS12)
  PSOddllSLL=PSOddllSLL+(chargefactor*coup3L*coup4L*IMP2*(-1.*coup1L*coup2R*int2*MassEx42 +& 
&  coup1R*coup2R*int1*MassEx4*mF1 - 1.*coup1R*coup2L*int2*MassEx4*MFin + coup1L*coup2L*int1*mF1*MFin))& 
& /(MassEx42 - 1.*MFin2)
  PSOddllSRR=PSOddllSRR+(chargefactor*coup3R*coup4R*IMP2*(-1.*coup1R*coup2L*int2*MassEx42 +& 
&  coup1L*coup2L*int1*MassEx4*mF1 - 1.*coup1L*coup2R*int2*MassEx4*MFin + coup1R*coup2R*int1*mF1*MFin))& 
& /(MassEx42 - 1.*MFin2)
  PSOddllSRL=PSOddllSRL+(chargefactor*coup3L*coup4R*IMP2*(-1.*coup1L*coup2R*int2*MassEx42 +& 
&  coup1R*coup2R*int1*MassEx4*mF1 - 1.*coup1R*coup2L*int2*MassEx4*MFin + coup1L*coup2L*int1*mF1*MFin))& 
& /(MassEx42 - 1.*MFin2)
  PSOddllSLR=PSOddllSLR+(chargefactor*coup3R*coup4L*IMP2*(-1.*coup1R*coup2L*int2*MassEx42 +& 
&  coup1L*coup2L*int1*MassEx4*mF1 - 1.*coup1L*coup2R*int2*MassEx4*MFin + coup1R*coup2R*int1*mF1*MFin))& 
& /(MassEx42 - 1.*MFin2)
  PSOddllVRR=PSOddllVRR+0.
  PSOddllVLL=PSOddllVLL+0.
  PSOddllVRL=PSOddllVRL+0.
  PSOddllVLR=PSOddllVLR+0.
  PSOddllTLL=PSOddllTLL+0.
  PSOddllTLR=PSOddllTLR+0.
  PSOddllTRL=PSOddllTRL+0.
  PSOddllTRR=PSOddllTRR+0.
     End if 
  End if 
End if 
    End Do 
  End Do 


 ! Propagator: Ah, Loop particles: Fe,VZ, Internal fermion: Fe
! Generic diagram: FVF,  InsertionOrder: 8
chargefactor = 1 
Do i1=1,3
    Do i3=1,3
If ((MFe2(i1).gt.mf_l2(3)).Or.(MVZ2.gt.mf_l2(3))) Then
If (((i1.lt.4).and.(i3.lt.4)).or.(.not.OnlySM)) Then 
coup3L = cplcFeFeAhL(i3,gt3)
coup3R = cplcFeFeAhR(i3,gt3)
coup2L = cplcFeFeVZL(i1,i3)
coup2R = cplcFeFeVZR(i1,i3)
coup1L = cplcFeFeVZL(gt4,i1)
coup1R = cplcFeFeVZR(gt4,i1)
coup4L = cplcFdFdAhL(gt2,gt1)
coup4R = cplcFdFdAhR(gt2,gt1)
! Masses in loop
mF1 = MFe(i1)
mF12 = MFe2(i1)
mV1 = MVZ
mV12 = MVZ2
! Mass of internal fermion 
MFin = MFe(i3)-MFe(gt4)
MFin2 = MFe2(i3)-MFe2(gt4)
If (Abs(MFin).gt.10E-10_dp) Then 
MFin = MFe(i3)
MFin2 = MFe2(i3)
! Propagator and inverse propagator mass 
MP = MAh
MP2 = MAh2
IMP = 1._dp/MP  
IMP2 = 1._dp/MP2 
! Amplitude 
  int1=B0(0._dp, mF12, mV12)
  int2=B1(0._dp, mF12, mV12)
  PSOddllSLL=PSOddllSLL+(-1.*chargefactor*coup3L*coup4L*IMP2*(coup1L*MassEx4*(-       & 
& 2.*coup2R*(Finite - 2.*int1)*mF1 + coup2L*(Finite + 2.*int2)*MFin) + coup1R*(coup2R*(Finite + 2.*int2)& 
& *MassEx42 - 2.*coup2L*(Finite - 2.*int1)*mF1*MFin)))/(MassEx42 - 1.*MFin2)
  PSOddllSRR=PSOddllSRR+(-1.*chargefactor*coup3R*coup4R*IMP2*(coup1R*MassEx4*(-       & 
& 2.*coup2L*(Finite - 2.*int1)*mF1 + coup2R*(Finite + 2.*int2)*MFin) + coup1L*(coup2L*(Finite + 2.*int2)& 
& *MassEx42 - 2.*coup2R*(Finite - 2.*int1)*mF1*MFin)))/(MassEx42 - 1.*MFin2)
  PSOddllSRL=PSOddllSRL+(-1.*chargefactor*coup3L*coup4R*IMP2*(coup1L*MassEx4*(-       & 
& 2.*coup2R*(Finite - 2.*int1)*mF1 + coup2L*(Finite + 2.*int2)*MFin) + coup1R*(coup2R*(Finite + 2.*int2)& 
& *MassEx42 - 2.*coup2L*(Finite - 2.*int1)*mF1*MFin)))/(MassEx42 - 1.*MFin2)
  PSOddllSLR=PSOddllSLR+(-1.*chargefactor*coup3R*coup4L*IMP2*(coup1R*MassEx4*(-       & 
& 2.*coup2L*(Finite - 2.*int1)*mF1 + coup2R*(Finite + 2.*int2)*MFin) + coup1L*(coup2L*(Finite + 2.*int2)& 
& *MassEx42 - 2.*coup2R*(Finite - 2.*int1)*mF1*MFin)))/(MassEx42 - 1.*MFin2)
  PSOddllVRR=PSOddllVRR+0.
  PSOddllVLL=PSOddllVLL+0.
  PSOddllVRL=PSOddllVRL+0.
  PSOddllVLR=PSOddllVLR+0.
  PSOddllTLL=PSOddllTLL+0.
  PSOddllTLR=PSOddllTLR+0.
  PSOddllTRL=PSOddllTRL+0.
  PSOddllTRR=PSOddllTRR+0.
     End if 
  End if 
End if 
    End Do 
  End Do 


 ! -- hh - Penguins            
! Propagator: hh, Loop particles: Ah,Fd, Internal fermion: bar[Fd]
! Generic diagram: SFF,  InsertionOrder: 1
chargefactor = 1 
  Do i2=1,3
    Do i3=1,3
If ((MAh2.gt.mf_l2(3)).Or.(MFd2(i2).gt.mf_l2(3))) Then
If (.not.OnlySM) Then 
coup1L = cplcFdFdAhL(i2,gt1)
coup1R = cplcFdFdAhR(i2,gt1)
coup2L = cplcFdFdAhL(i3,i2)
coup2R = cplcFdFdAhR(i3,i2)
coup3L = cplcFdFdhhL(gt2,i3)
coup3R = cplcFdFdhhR(gt2,i3)
coup4L = cplcFeFehhL(gt4,gt3)
coup4R = cplcFeFehhR(gt4,gt3)
! Masses in loop
mS1 = MAh
mS12 = MAh2
mF1 = MFd(i2)
mF12 = MFd2(i2)
! Mass of internal fermion 
MFin = MFd(i3)-MFd(gt1)
MFin2 = MFd2(i3)-MFd2(gt1)
If (Abs(MFin).gt.10E-10_dp) Then 
MFin = MFd(i3)
MFin2 = MFd2(i3)
! Propagator and inverse propagator mass 
MP = Mhh
MP2 = Mhh2
IMP = 1._dp/MP  
IMP2 = 1._dp/MP2 
! Amplitude 
  int1=B0(0._dp, mF12, mS12)
  int2=B1(0._dp, mF12, mS12)
  PSOddllSLL=PSOddllSLL+(chargefactor*coup3L*coup4L*IMP2*(-1.*coup1L*coup2R*int2*MassEx12 +& 
&  coup1R*coup2R*int1*MassEx1*mF1 - 1.*coup1R*coup2L*int2*MassEx1*MFin + coup1L*coup2L*int1*mF1*MFin))& 
& /(MassEx12 - 1.*MFin2)
  PSOddllSRR=PSOddllSRR+(chargefactor*coup3R*coup4R*IMP2*(-1.*coup1R*coup2L*int2*MassEx12 +& 
&  coup1L*coup2L*int1*MassEx1*mF1 - 1.*coup1L*coup2R*int2*MassEx1*MFin + coup1R*coup2R*int1*mF1*MFin))& 
& /(MassEx12 - 1.*MFin2)
  PSOddllSRL=PSOddllSRL+(chargefactor*coup3R*coup4L*IMP2*(-1.*coup1R*coup2L*int2*MassEx12 +& 
&  coup1L*coup2L*int1*MassEx1*mF1 - 1.*coup1L*coup2R*int2*MassEx1*MFin + coup1R*coup2R*int1*mF1*MFin))& 
& /(MassEx12 - 1.*MFin2)
  PSOddllSLR=PSOddllSLR+(chargefactor*coup3L*coup4R*IMP2*(-1.*coup1L*coup2R*int2*MassEx12 +& 
&  coup1R*coup2R*int1*MassEx1*mF1 - 1.*coup1R*coup2L*int2*MassEx1*MFin + coup1L*coup2L*int1*mF1*MFin))& 
& /(MassEx12 - 1.*MFin2)
  PSOddllVRR=PSOddllVRR+0.
  PSOddllVLL=PSOddllVLL+0.
  PSOddllVRL=PSOddllVRL+0.
  PSOddllVLR=PSOddllVLR+0.
  PSOddllTLL=PSOddllTLL+0.
  PSOddllTLR=PSOddllTLR+0.
  PSOddllTRL=PSOddllTRL+0.
  PSOddllTRR=PSOddllTRR+0.
     End if 
  End if 
End if 
   End Do 
  End Do 


 ! Propagator: hh, Loop particles: hh,Fd, Internal fermion: bar[Fd]
! Generic diagram: SFF,  InsertionOrder: 1
chargefactor = 1 
  Do i2=1,3
    Do i3=1,3
If ((Mhh2.gt.mf_l2(3)).Or.(MFd2(i2).gt.mf_l2(3))) Then
If (.not.OnlySM) Then 
coup1L = cplcFdFdhhL(i2,gt1)
coup1R = cplcFdFdhhR(i2,gt1)
coup2L = cplcFdFdhhL(i3,i2)
coup2R = cplcFdFdhhR(i3,i2)
coup3L = cplcFdFdhhL(gt2,i3)
coup3R = cplcFdFdhhR(gt2,i3)
coup4L = cplcFeFehhL(gt4,gt3)
coup4R = cplcFeFehhR(gt4,gt3)
! Masses in loop
mS1 = Mhh
mS12 = Mhh2
mF1 = MFd(i2)
mF12 = MFd2(i2)
! Mass of internal fermion 
MFin = MFd(i3)-MFd(gt1)
MFin2 = MFd2(i3)-MFd2(gt1)
If (Abs(MFin).gt.10E-10_dp) Then 
MFin = MFd(i3)
MFin2 = MFd2(i3)
! Propagator and inverse propagator mass 
MP = Mhh
MP2 = Mhh2
IMP = 1._dp/MP  
IMP2 = 1._dp/MP2 
! Amplitude 
  int1=B0(0._dp, mF12, mS12)
  int2=B1(0._dp, mF12, mS12)
  PSOddllSLL=PSOddllSLL+(chargefactor*coup3L*coup4L*IMP2*(-1.*coup1L*coup2R*int2*MassEx12 +& 
&  coup1R*coup2R*int1*MassEx1*mF1 - 1.*coup1R*coup2L*int2*MassEx1*MFin + coup1L*coup2L*int1*mF1*MFin))& 
& /(MassEx12 - 1.*MFin2)
  PSOddllSRR=PSOddllSRR+(chargefactor*coup3R*coup4R*IMP2*(-1.*coup1R*coup2L*int2*MassEx12 +& 
&  coup1L*coup2L*int1*MassEx1*mF1 - 1.*coup1L*coup2R*int2*MassEx1*MFin + coup1R*coup2R*int1*mF1*MFin))& 
& /(MassEx12 - 1.*MFin2)
  PSOddllSRL=PSOddllSRL+(chargefactor*coup3R*coup4L*IMP2*(-1.*coup1R*coup2L*int2*MassEx12 +& 
&  coup1L*coup2L*int1*MassEx1*mF1 - 1.*coup1L*coup2R*int2*MassEx1*MFin + coup1R*coup2R*int1*mF1*MFin))& 
& /(MassEx12 - 1.*MFin2)
  PSOddllSLR=PSOddllSLR+(chargefactor*coup3L*coup4R*IMP2*(-1.*coup1L*coup2R*int2*MassEx12 +& 
&  coup1R*coup2R*int1*MassEx1*mF1 - 1.*coup1R*coup2L*int2*MassEx1*MFin + coup1L*coup2L*int1*mF1*MFin))& 
& /(MassEx12 - 1.*MFin2)
  PSOddllVRR=PSOddllVRR+0.
  PSOddllVLL=PSOddllVLL+0.
  PSOddllVRL=PSOddllVRL+0.
  PSOddllVLR=PSOddllVLR+0.
  PSOddllTLL=PSOddllTLL+0.
  PSOddllTLR=PSOddllTLR+0.
  PSOddllTRL=PSOddllTRL+0.
  PSOddllTRR=PSOddllTRR+0.
     End if 
  End if 
End if 
   End Do 
  End Do 


 ! Propagator: hh, Loop particles: Hp,Fu, Internal fermion: bar[Fd]
! Generic diagram: SFF,  InsertionOrder: 1
chargefactor = 1 
  Do i2=1,3
    Do i3=1,3
If ((MHp2.gt.mf_l2(3)).Or.(MFu2(i2).gt.mf_l2(3))) Then
If (.not.OnlySM) Then 
coup1L = cplcFuFdHpL(i2,gt1)
coup1R = cplcFuFdHpR(i2,gt1)
coup2L = cplcFdFucHpL(i3,i2)
coup2R = cplcFdFucHpR(i3,i2)
coup3L = cplcFdFdhhL(gt2,i3)
coup3R = cplcFdFdhhR(gt2,i3)
coup4L = cplcFeFehhL(gt4,gt3)
coup4R = cplcFeFehhR(gt4,gt3)
! Masses in loop
mS1 = MHp
mS12 = MHp2
mF1 = MFu(i2)
mF12 = MFu2(i2)
! Mass of internal fermion 
MFin = MFd(i3)-MFd(gt1)
MFin2 = MFd2(i3)-MFd2(gt1)
If (Abs(MFin).gt.10E-10_dp) Then 
MFin = MFd(i3)
MFin2 = MFd2(i3)
! Propagator and inverse propagator mass 
MP = Mhh
MP2 = Mhh2
IMP = 1._dp/MP  
IMP2 = 1._dp/MP2 
! Amplitude 
  int1=B0(0._dp, mF12, mS12)
  int2=B1(0._dp, mF12, mS12)
  PSOddllSLL=PSOddllSLL+(chargefactor*coup3L*coup4L*IMP2*(-1.*coup1L*coup2R*int2*MassEx12 +& 
&  coup1R*coup2R*int1*MassEx1*mF1 - 1.*coup1R*coup2L*int2*MassEx1*MFin + coup1L*coup2L*int1*mF1*MFin))& 
& /(MassEx12 - 1.*MFin2)
  PSOddllSRR=PSOddllSRR+(chargefactor*coup3R*coup4R*IMP2*(-1.*coup1R*coup2L*int2*MassEx12 +& 
&  coup1L*coup2L*int1*MassEx1*mF1 - 1.*coup1L*coup2R*int2*MassEx1*MFin + coup1R*coup2R*int1*mF1*MFin))& 
& /(MassEx12 - 1.*MFin2)
  PSOddllSRL=PSOddllSRL+(chargefactor*coup3R*coup4L*IMP2*(-1.*coup1R*coup2L*int2*MassEx12 +& 
&  coup1L*coup2L*int1*MassEx1*mF1 - 1.*coup1L*coup2R*int2*MassEx1*MFin + coup1R*coup2R*int1*mF1*MFin))& 
& /(MassEx12 - 1.*MFin2)
  PSOddllSLR=PSOddllSLR+(chargefactor*coup3L*coup4R*IMP2*(-1.*coup1L*coup2R*int2*MassEx12 +& 
&  coup1R*coup2R*int1*MassEx1*mF1 - 1.*coup1R*coup2L*int2*MassEx1*MFin + coup1L*coup2L*int1*mF1*MFin))& 
& /(MassEx12 - 1.*MFin2)
  PSOddllVRR=PSOddllVRR+0.
  PSOddllVLL=PSOddllVLL+0.
  PSOddllVRL=PSOddllVRL+0.
  PSOddllVLR=PSOddllVLR+0.
  PSOddllTLL=PSOddllTLL+0.
  PSOddllTLR=PSOddllTLR+0.
  PSOddllTRL=PSOddllTRL+0.
  PSOddllTRR=PSOddllTRR+0.
     End if 
  End if 
End if 
   End Do 
  End Do 


 ! Propagator: hh, Loop particles: VWp,Fu, Internal fermion: bar[Fd]
! Generic diagram: VFF,  InsertionOrder: 1
chargefactor = 1 
  Do i2=1,3
    Do i3=1,3
If ((MVWp2.gt.mf_l2(3)).Or.(MFu2(i2).gt.mf_l2(3))) Then
If (.not.OnlySM) Then 
coup1L = cplcFuFdVWpL(i2,gt1)
coup1R = cplcFuFdVWpR(i2,gt1)
coup2L = cplcFdFucVWpL(i3,i2)
coup2R = cplcFdFucVWpR(i3,i2)
coup3L = cplcFdFdhhL(gt2,i3)
coup3R = cplcFdFdhhR(gt2,i3)
coup4L = cplcFeFehhL(gt4,gt3)
coup4R = cplcFeFehhR(gt4,gt3)
! Masses in loop
mV1 = MVWp
mV12 = MVWp2
mF1 = MFu(i2)
mF12 = MFu2(i2)
! Mass of internal fermion 
MFin = MFd(i3)-MFd(gt1)
MFin2 = MFd2(i3)-MFd2(gt1)
If (Abs(MFin).gt.10E-10_dp) Then 
MFin = MFd(i3)
MFin2 = MFd2(i3)
! Propagator and inverse propagator mass 
MP = Mhh
MP2 = Mhh2
IMP = 1._dp/MP  
IMP2 = 1._dp/MP2 
! Amplitude 
  int1=B0(0._dp, mF12, mV12)
  int2=B1(0._dp, mF12, mV12)
  PSOddllSLL=PSOddllSLL+(-1.*chargefactor*coup3L*coup4L*IMP2*(coup1R*MassEx1*(-       & 
& 2.*coup2L*(Finite - 2.*int1)*mF1 + coup2R*(Finite + 2.*int2)*MFin) + coup1L*(coup2L*(Finite + 2.*int2)& 
& *MassEx12 - 2.*coup2R*(Finite - 2.*int1)*mF1*MFin)))/(MassEx12 - 1.*MFin2)
  PSOddllSRR=PSOddllSRR+(-1.*chargefactor*coup3R*coup4R*IMP2*(coup1L*MassEx1*(-       & 
& 2.*coup2R*(Finite - 2.*int1)*mF1 + coup2L*(Finite + 2.*int2)*MFin) + coup1R*(coup2R*(Finite + 2.*int2)& 
& *MassEx12 - 2.*coup2L*(Finite - 2.*int1)*mF1*MFin)))/(MassEx12 - 1.*MFin2)
  PSOddllSRL=PSOddllSRL+(-1.*chargefactor*coup3R*coup4L*IMP2*(coup1L*MassEx1*(-       & 
& 2.*coup2R*(Finite - 2.*int1)*mF1 + coup2L*(Finite + 2.*int2)*MFin) + coup1R*(coup2R*(Finite + 2.*int2)& 
& *MassEx12 - 2.*coup2L*(Finite - 2.*int1)*mF1*MFin)))/(MassEx12 - 1.*MFin2)
  PSOddllSLR=PSOddllSLR+(-1.*chargefactor*coup3L*coup4R*IMP2*(coup1R*MassEx1*(-       & 
& 2.*coup2L*(Finite - 2.*int1)*mF1 + coup2R*(Finite + 2.*int2)*MFin) + coup1L*(coup2L*(Finite + 2.*int2)& 
& *MassEx12 - 2.*coup2R*(Finite - 2.*int1)*mF1*MFin)))/(MassEx12 - 1.*MFin2)
  PSOddllVRR=PSOddllVRR+0.
  PSOddllVLL=PSOddllVLL+0.
  PSOddllVRL=PSOddllVRL+0.
  PSOddllVLR=PSOddllVLR+0.
  PSOddllTLL=PSOddllTLL+0.
  PSOddllTLR=PSOddllTLR+0.
  PSOddllTRL=PSOddllTRL+0.
  PSOddllTRR=PSOddllTRR+0.
     End if 
  End if 
End if 
   End Do 
  End Do 


 ! Propagator: hh, Loop particles: VZ,Fd, Internal fermion: bar[Fd]
! Generic diagram: VFF,  InsertionOrder: 1
chargefactor = 1 
  Do i2=1,3
    Do i3=1,3
If ((MVZ2.gt.mf_l2(3)).Or.(MFd2(i2).gt.mf_l2(3))) Then
If (.not.OnlySM) Then 
coup1L = cplcFdFdVZL(i2,gt1)
coup1R = cplcFdFdVZR(i2,gt1)
coup2L = cplcFdFdVZL(i3,i2)
coup2R = cplcFdFdVZR(i3,i2)
coup3L = cplcFdFdhhL(gt2,i3)
coup3R = cplcFdFdhhR(gt2,i3)
coup4L = cplcFeFehhL(gt4,gt3)
coup4R = cplcFeFehhR(gt4,gt3)
! Masses in loop
mV1 = MVZ
mV12 = MVZ2
mF1 = MFd(i2)
mF12 = MFd2(i2)
! Mass of internal fermion 
MFin = MFd(i3)-MFd(gt1)
MFin2 = MFd2(i3)-MFd2(gt1)
If (Abs(MFin).gt.10E-10_dp) Then 
MFin = MFd(i3)
MFin2 = MFd2(i3)
! Propagator and inverse propagator mass 
MP = Mhh
MP2 = Mhh2
IMP = 1._dp/MP  
IMP2 = 1._dp/MP2 
! Amplitude 
  int1=B0(0._dp, mF12, mV12)
  int2=B1(0._dp, mF12, mV12)
  PSOddllSLL=PSOddllSLL+(-1.*chargefactor*coup3L*coup4L*IMP2*(coup1R*MassEx1*(-       & 
& 2.*coup2L*(Finite - 2.*int1)*mF1 + coup2R*(Finite + 2.*int2)*MFin) + coup1L*(coup2L*(Finite + 2.*int2)& 
& *MassEx12 - 2.*coup2R*(Finite - 2.*int1)*mF1*MFin)))/(MassEx12 - 1.*MFin2)
  PSOddllSRR=PSOddllSRR+(-1.*chargefactor*coup3R*coup4R*IMP2*(coup1L*MassEx1*(-       & 
& 2.*coup2R*(Finite - 2.*int1)*mF1 + coup2L*(Finite + 2.*int2)*MFin) + coup1R*(coup2R*(Finite + 2.*int2)& 
& *MassEx12 - 2.*coup2L*(Finite - 2.*int1)*mF1*MFin)))/(MassEx12 - 1.*MFin2)
  PSOddllSRL=PSOddllSRL+(-1.*chargefactor*coup3R*coup4L*IMP2*(coup1L*MassEx1*(-       & 
& 2.*coup2R*(Finite - 2.*int1)*mF1 + coup2L*(Finite + 2.*int2)*MFin) + coup1R*(coup2R*(Finite + 2.*int2)& 
& *MassEx12 - 2.*coup2L*(Finite - 2.*int1)*mF1*MFin)))/(MassEx12 - 1.*MFin2)
  PSOddllSLR=PSOddllSLR+(-1.*chargefactor*coup3L*coup4R*IMP2*(coup1R*MassEx1*(-       & 
& 2.*coup2L*(Finite - 2.*int1)*mF1 + coup2R*(Finite + 2.*int2)*MFin) + coup1L*(coup2L*(Finite + 2.*int2)& 
& *MassEx12 - 2.*coup2R*(Finite - 2.*int1)*mF1*MFin)))/(MassEx12 - 1.*MFin2)
  PSOddllVRR=PSOddllVRR+0.
  PSOddllVLL=PSOddllVLL+0.
  PSOddllVRL=PSOddllVRL+0.
  PSOddllVLR=PSOddllVLR+0.
  PSOddllTLL=PSOddllTLL+0.
  PSOddllTLR=PSOddllTLR+0.
  PSOddllTRL=PSOddllTRL+0.
  PSOddllTRR=PSOddllTRR+0.
     End if 
  End if 
End if 
   End Do 
  End Do 


 ! Propagator: hh, Loop particles: Fd,Ah, Internal fermion: Fd
! Generic diagram: FSF,  InsertionOrder: 2
chargefactor = 1 
Do i1=1,3
    Do i3=1,3
If ((MFd2(i1).gt.mf_l2(3)).Or.(MAh2.gt.mf_l2(3))) Then
If (.not.OnlySM) Then 
coup3L = cplcFdFdhhL(i3,gt1)
coup3R = cplcFdFdhhR(i3,gt1)
coup2L = cplcFdFdAhL(i1,i3)
coup2R = cplcFdFdAhR(i1,i3)
coup1L = cplcFdFdAhL(gt2,i1)
coup1R = cplcFdFdAhR(gt2,i1)
coup4L = cplcFeFehhL(gt4,gt3)
coup4R = cplcFeFehhR(gt4,gt3)
! Masses in loop
mF1 = MFd(i1)
mF12 = MFd2(i1)
mS1 = MAh
mS12 = MAh2
! Mass of internal fermion 
MFin = MFd(i3)-MFd(gt2)
MFin2 = MFd2(i3)-MFd2(gt2)
If (Abs(MFin).gt.10E-10_dp) Then 
MFin = MFd(i3)
MFin2 = MFd2(i3)
! Propagator and inverse propagator mass 
MP = Mhh
MP2 = Mhh2
IMP = 1._dp/MP  
IMP2 = 1._dp/MP2 
! Amplitude 
  int1=B0(0._dp, mF12, mS12)
  int2=B1(0._dp, mF12, mS12)
  PSOddllSLL=PSOddllSLL+(chargefactor*coup3L*coup4L*IMP2*(-1.*coup1L*coup2R*int2*MassEx22 +& 
&  coup1R*coup2R*int1*MassEx2*mF1 - 1.*coup1R*coup2L*int2*MassEx2*MFin + coup1L*coup2L*int1*mF1*MFin))& 
& /(MassEx22 - 1.*MFin2)
  PSOddllSRR=PSOddllSRR+(chargefactor*coup3R*coup4R*IMP2*(-1.*coup1R*coup2L*int2*MassEx22 +& 
&  coup1L*coup2L*int1*MassEx2*mF1 - 1.*coup1L*coup2R*int2*MassEx2*MFin + coup1R*coup2R*int1*mF1*MFin))& 
& /(MassEx22 - 1.*MFin2)
  PSOddllSRL=PSOddllSRL+(chargefactor*coup3R*coup4L*IMP2*(-1.*coup1R*coup2L*int2*MassEx22 +& 
&  coup1L*coup2L*int1*MassEx2*mF1 - 1.*coup1L*coup2R*int2*MassEx2*MFin + coup1R*coup2R*int1*mF1*MFin))& 
& /(MassEx22 - 1.*MFin2)
  PSOddllSLR=PSOddllSLR+(chargefactor*coup3L*coup4R*IMP2*(-1.*coup1L*coup2R*int2*MassEx22 +& 
&  coup1R*coup2R*int1*MassEx2*mF1 - 1.*coup1R*coup2L*int2*MassEx2*MFin + coup1L*coup2L*int1*mF1*MFin))& 
& /(MassEx22 - 1.*MFin2)
  PSOddllVRR=PSOddllVRR+0.
  PSOddllVLL=PSOddllVLL+0.
  PSOddllVRL=PSOddllVRL+0.
  PSOddllVLR=PSOddllVLR+0.
  PSOddllTLL=PSOddllTLL+0.
  PSOddllTLR=PSOddllTLR+0.
  PSOddllTRL=PSOddllTRL+0.
  PSOddllTRR=PSOddllTRR+0.
     End if 
  End if 
End if 
    End Do 
  End Do 


 ! Propagator: hh, Loop particles: Fd,hh, Internal fermion: Fd
! Generic diagram: FSF,  InsertionOrder: 2
chargefactor = 1 
Do i1=1,3
    Do i3=1,3
If ((MFd2(i1).gt.mf_l2(3)).Or.(Mhh2.gt.mf_l2(3))) Then
If (.not.OnlySM) Then 
coup3L = cplcFdFdhhL(i3,gt1)
coup3R = cplcFdFdhhR(i3,gt1)
coup2L = cplcFdFdhhL(i1,i3)
coup2R = cplcFdFdhhR(i1,i3)
coup1L = cplcFdFdhhL(gt2,i1)
coup1R = cplcFdFdhhR(gt2,i1)
coup4L = cplcFeFehhL(gt4,gt3)
coup4R = cplcFeFehhR(gt4,gt3)
! Masses in loop
mF1 = MFd(i1)
mF12 = MFd2(i1)
mS1 = Mhh
mS12 = Mhh2
! Mass of internal fermion 
MFin = MFd(i3)-MFd(gt2)
MFin2 = MFd2(i3)-MFd2(gt2)
If (Abs(MFin).gt.10E-10_dp) Then 
MFin = MFd(i3)
MFin2 = MFd2(i3)
! Propagator and inverse propagator mass 
MP = Mhh
MP2 = Mhh2
IMP = 1._dp/MP  
IMP2 = 1._dp/MP2 
! Amplitude 
  int1=B0(0._dp, mF12, mS12)
  int2=B1(0._dp, mF12, mS12)
  PSOddllSLL=PSOddllSLL+(chargefactor*coup3L*coup4L*IMP2*(-1.*coup1L*coup2R*int2*MassEx22 +& 
&  coup1R*coup2R*int1*MassEx2*mF1 - 1.*coup1R*coup2L*int2*MassEx2*MFin + coup1L*coup2L*int1*mF1*MFin))& 
& /(MassEx22 - 1.*MFin2)
  PSOddllSRR=PSOddllSRR+(chargefactor*coup3R*coup4R*IMP2*(-1.*coup1R*coup2L*int2*MassEx22 +& 
&  coup1L*coup2L*int1*MassEx2*mF1 - 1.*coup1L*coup2R*int2*MassEx2*MFin + coup1R*coup2R*int1*mF1*MFin))& 
& /(MassEx22 - 1.*MFin2)
  PSOddllSRL=PSOddllSRL+(chargefactor*coup3R*coup4L*IMP2*(-1.*coup1R*coup2L*int2*MassEx22 +& 
&  coup1L*coup2L*int1*MassEx2*mF1 - 1.*coup1L*coup2R*int2*MassEx2*MFin + coup1R*coup2R*int1*mF1*MFin))& 
& /(MassEx22 - 1.*MFin2)
  PSOddllSLR=PSOddllSLR+(chargefactor*coup3L*coup4R*IMP2*(-1.*coup1L*coup2R*int2*MassEx22 +& 
&  coup1R*coup2R*int1*MassEx2*mF1 - 1.*coup1R*coup2L*int2*MassEx2*MFin + coup1L*coup2L*int1*mF1*MFin))& 
& /(MassEx22 - 1.*MFin2)
  PSOddllVRR=PSOddllVRR+0.
  PSOddllVLL=PSOddllVLL+0.
  PSOddllVRL=PSOddllVRL+0.
  PSOddllVLR=PSOddllVLR+0.
  PSOddllTLL=PSOddllTLL+0.
  PSOddllTLR=PSOddllTLR+0.
  PSOddllTRL=PSOddllTRL+0.
  PSOddllTRR=PSOddllTRR+0.
     End if 
  End if 
End if 
    End Do 
  End Do 


 ! Propagator: hh, Loop particles: Fu,Hp, Internal fermion: Fd
! Generic diagram: FSF,  InsertionOrder: 2
chargefactor = 1 
Do i1=1,3
    Do i3=1,3
If ((MFu2(i1).gt.mf_l2(3)).Or.(MHp2.gt.mf_l2(3))) Then
If (.not.OnlySM) Then 
coup3L = cplcFdFdhhL(i3,gt1)
coup3R = cplcFdFdhhR(i3,gt1)
coup2L = cplcFuFdHpL(i1,i3)
coup2R = cplcFuFdHpR(i1,i3)
coup1L = cplcFdFucHpL(gt2,i1)
coup1R = cplcFdFucHpR(gt2,i1)
coup4L = cplcFeFehhL(gt4,gt3)
coup4R = cplcFeFehhR(gt4,gt3)
! Masses in loop
mF1 = MFu(i1)
mF12 = MFu2(i1)
mS1 = MHp
mS12 = MHp2
! Mass of internal fermion 
MFin = MFd(i3)-MFd(gt2)
MFin2 = MFd2(i3)-MFd2(gt2)
If (Abs(MFin).gt.10E-10_dp) Then 
MFin = MFd(i3)
MFin2 = MFd2(i3)
! Propagator and inverse propagator mass 
MP = Mhh
MP2 = Mhh2
IMP = 1._dp/MP  
IMP2 = 1._dp/MP2 
! Amplitude 
  int1=B0(0._dp, mF12, mS12)
  int2=B1(0._dp, mF12, mS12)
  PSOddllSLL=PSOddllSLL+(chargefactor*coup3L*coup4L*IMP2*(-1.*coup1L*coup2R*int2*MassEx22 +& 
&  coup1R*coup2R*int1*MassEx2*mF1 - 1.*coup1R*coup2L*int2*MassEx2*MFin + coup1L*coup2L*int1*mF1*MFin))& 
& /(MassEx22 - 1.*MFin2)
  PSOddllSRR=PSOddllSRR+(chargefactor*coup3R*coup4R*IMP2*(-1.*coup1R*coup2L*int2*MassEx22 +& 
&  coup1L*coup2L*int1*MassEx2*mF1 - 1.*coup1L*coup2R*int2*MassEx2*MFin + coup1R*coup2R*int1*mF1*MFin))& 
& /(MassEx22 - 1.*MFin2)
  PSOddllSRL=PSOddllSRL+(chargefactor*coup3R*coup4L*IMP2*(-1.*coup1R*coup2L*int2*MassEx22 +& 
&  coup1L*coup2L*int1*MassEx2*mF1 - 1.*coup1L*coup2R*int2*MassEx2*MFin + coup1R*coup2R*int1*mF1*MFin))& 
& /(MassEx22 - 1.*MFin2)
  PSOddllSLR=PSOddllSLR+(chargefactor*coup3L*coup4R*IMP2*(-1.*coup1L*coup2R*int2*MassEx22 +& 
&  coup1R*coup2R*int1*MassEx2*mF1 - 1.*coup1R*coup2L*int2*MassEx2*MFin + coup1L*coup2L*int1*mF1*MFin))& 
& /(MassEx22 - 1.*MFin2)
  PSOddllVRR=PSOddllVRR+0.
  PSOddllVLL=PSOddllVLL+0.
  PSOddllVRL=PSOddllVRL+0.
  PSOddllVLR=PSOddllVLR+0.
  PSOddllTLL=PSOddllTLL+0.
  PSOddllTLR=PSOddllTLR+0.
  PSOddllTRL=PSOddllTRL+0.
  PSOddllTRR=PSOddllTRR+0.
     End if 
  End if 
End if 
    End Do 
  End Do 


 ! Propagator: hh, Loop particles: Fu,VWp, Internal fermion: Fd
! Generic diagram: FVF,  InsertionOrder: 2
chargefactor = 1 
Do i1=1,3
    Do i3=1,3
If ((MFu2(i1).gt.mf_l2(3)).Or.(MVWp2.gt.mf_l2(3))) Then
If (.not.OnlySM) Then 
coup3L = cplcFdFdhhL(i3,gt1)
coup3R = cplcFdFdhhR(i3,gt1)
coup2L = cplcFuFdVWpL(i1,i3)
coup2R = cplcFuFdVWpR(i1,i3)
coup1L = cplcFdFucVWpL(gt2,i1)
coup1R = cplcFdFucVWpR(gt2,i1)
coup4L = cplcFeFehhL(gt4,gt3)
coup4R = cplcFeFehhR(gt4,gt3)
! Masses in loop
mF1 = MFu(i1)
mF12 = MFu2(i1)
mV1 = MVWp
mV12 = MVWp2
! Mass of internal fermion 
MFin = MFd(i3)-MFd(gt2)
MFin2 = MFd2(i3)-MFd2(gt2)
If (Abs(MFin).gt.10E-10_dp) Then 
MFin = MFd(i3)
MFin2 = MFd2(i3)
! Propagator and inverse propagator mass 
MP = Mhh
MP2 = Mhh2
IMP = 1._dp/MP  
IMP2 = 1._dp/MP2 
! Amplitude 
  int1=B0(0._dp, mF12, mV12)
  int2=B1(0._dp, mF12, mV12)
  PSOddllSLL=PSOddllSLL+(-1.*chargefactor*coup3L*coup4L*IMP2*(coup1L*MassEx2*(-       & 
& 2.*coup2R*(Finite - 2.*int1)*mF1 + coup2L*(Finite + 2.*int2)*MFin) + coup1R*(coup2R*(Finite + 2.*int2)& 
& *MassEx22 - 2.*coup2L*(Finite - 2.*int1)*mF1*MFin)))/(MassEx22 - 1.*MFin2)
  PSOddllSRR=PSOddllSRR+(-1.*chargefactor*coup3R*coup4R*IMP2*(coup1R*MassEx2*(-       & 
& 2.*coup2L*(Finite - 2.*int1)*mF1 + coup2R*(Finite + 2.*int2)*MFin) + coup1L*(coup2L*(Finite + 2.*int2)& 
& *MassEx22 - 2.*coup2R*(Finite - 2.*int1)*mF1*MFin)))/(MassEx22 - 1.*MFin2)
  PSOddllSRL=PSOddllSRL+(-1.*chargefactor*coup3R*coup4L*IMP2*(coup1R*MassEx2*(-       & 
& 2.*coup2L*(Finite - 2.*int1)*mF1 + coup2R*(Finite + 2.*int2)*MFin) + coup1L*(coup2L*(Finite + 2.*int2)& 
& *MassEx22 - 2.*coup2R*(Finite - 2.*int1)*mF1*MFin)))/(MassEx22 - 1.*MFin2)
  PSOddllSLR=PSOddllSLR+(-1.*chargefactor*coup3L*coup4R*IMP2*(coup1L*MassEx2*(-       & 
& 2.*coup2R*(Finite - 2.*int1)*mF1 + coup2L*(Finite + 2.*int2)*MFin) + coup1R*(coup2R*(Finite + 2.*int2)& 
& *MassEx22 - 2.*coup2L*(Finite - 2.*int1)*mF1*MFin)))/(MassEx22 - 1.*MFin2)
  PSOddllVRR=PSOddllVRR+0.
  PSOddllVLL=PSOddllVLL+0.
  PSOddllVRL=PSOddllVRL+0.
  PSOddllVLR=PSOddllVLR+0.
  PSOddllTLL=PSOddllTLL+0.
  PSOddllTLR=PSOddllTLR+0.
  PSOddllTRL=PSOddllTRL+0.
  PSOddllTRR=PSOddllTRR+0.
     End if 
  End if 
End if 
    End Do 
  End Do 


 ! Propagator: hh, Loop particles: Fd,VZ, Internal fermion: Fd
! Generic diagram: FVF,  InsertionOrder: 2
chargefactor = 1 
Do i1=1,3
    Do i3=1,3
If ((MFd2(i1).gt.mf_l2(3)).Or.(MVZ2.gt.mf_l2(3))) Then
If (.not.OnlySM) Then 
coup3L = cplcFdFdhhL(i3,gt1)
coup3R = cplcFdFdhhR(i3,gt1)
coup2L = cplcFdFdVZL(i1,i3)
coup2R = cplcFdFdVZR(i1,i3)
coup1L = cplcFdFdVZL(gt2,i1)
coup1R = cplcFdFdVZR(gt2,i1)
coup4L = cplcFeFehhL(gt4,gt3)
coup4R = cplcFeFehhR(gt4,gt3)
! Masses in loop
mF1 = MFd(i1)
mF12 = MFd2(i1)
mV1 = MVZ
mV12 = MVZ2
! Mass of internal fermion 
MFin = MFd(i3)-MFd(gt2)
MFin2 = MFd2(i3)-MFd2(gt2)
If (Abs(MFin).gt.10E-10_dp) Then 
MFin = MFd(i3)
MFin2 = MFd2(i3)
! Propagator and inverse propagator mass 
MP = Mhh
MP2 = Mhh2
IMP = 1._dp/MP  
IMP2 = 1._dp/MP2 
! Amplitude 
  int1=B0(0._dp, mF12, mV12)
  int2=B1(0._dp, mF12, mV12)
  PSOddllSLL=PSOddllSLL+(-1.*chargefactor*coup3L*coup4L*IMP2*(coup1L*MassEx2*(-       & 
& 2.*coup2R*(Finite - 2.*int1)*mF1 + coup2L*(Finite + 2.*int2)*MFin) + coup1R*(coup2R*(Finite + 2.*int2)& 
& *MassEx22 - 2.*coup2L*(Finite - 2.*int1)*mF1*MFin)))/(MassEx22 - 1.*MFin2)
  PSOddllSRR=PSOddllSRR+(-1.*chargefactor*coup3R*coup4R*IMP2*(coup1R*MassEx2*(-       & 
& 2.*coup2L*(Finite - 2.*int1)*mF1 + coup2R*(Finite + 2.*int2)*MFin) + coup1L*(coup2L*(Finite + 2.*int2)& 
& *MassEx22 - 2.*coup2R*(Finite - 2.*int1)*mF1*MFin)))/(MassEx22 - 1.*MFin2)
  PSOddllSRL=PSOddllSRL+(-1.*chargefactor*coup3R*coup4L*IMP2*(coup1R*MassEx2*(-       & 
& 2.*coup2L*(Finite - 2.*int1)*mF1 + coup2R*(Finite + 2.*int2)*MFin) + coup1L*(coup2L*(Finite + 2.*int2)& 
& *MassEx22 - 2.*coup2R*(Finite - 2.*int1)*mF1*MFin)))/(MassEx22 - 1.*MFin2)
  PSOddllSLR=PSOddllSLR+(-1.*chargefactor*coup3L*coup4R*IMP2*(coup1L*MassEx2*(-       & 
& 2.*coup2R*(Finite - 2.*int1)*mF1 + coup2L*(Finite + 2.*int2)*MFin) + coup1R*(coup2R*(Finite + 2.*int2)& 
& *MassEx22 - 2.*coup2L*(Finite - 2.*int1)*mF1*MFin)))/(MassEx22 - 1.*MFin2)
  PSOddllVRR=PSOddllVRR+0.
  PSOddllVLL=PSOddllVLL+0.
  PSOddllVRL=PSOddllVRL+0.
  PSOddllVLR=PSOddllVLR+0.
  PSOddllTLL=PSOddllTLL+0.
  PSOddllTLR=PSOddllTLR+0.
  PSOddllTRL=PSOddllTRL+0.
  PSOddllTRR=PSOddllTRR+0.
     End if 
  End if 
End if 
    End Do 
  End Do 


 ! Propagator: hh, Loop particles: Ah,Fe, Internal fermion: bar[Fe]
! Generic diagram: SFF,  InsertionOrder: 7
chargefactor = 1 
  Do i2=1,3
    Do i3=1,3
If ((MAh2.gt.mf_l2(3)).Or.(MFe2(i2).gt.mf_l2(3))) Then
If (.not.OnlySM) Then 
coup1L = cplcFeFeAhL(i2,gt3)
coup1R = cplcFeFeAhR(i2,gt3)
coup2L = cplcFeFeAhL(i3,i2)
coup2R = cplcFeFeAhR(i3,i2)
coup3L = cplcFeFehhL(gt4,i3)
coup3R = cplcFeFehhR(gt4,i3)
coup4L = cplcFdFdhhL(gt2,gt1)
coup4R = cplcFdFdhhR(gt2,gt1)
! Masses in loop
mS1 = MAh
mS12 = MAh2
mF1 = MFe(i2)
mF12 = MFe2(i2)
! Mass of internal fermion 
MFin = MFe(i3)-MFe(gt3)
MFin2 = MFe2(i3)-MFe2(gt3)
If (Abs(MFin).gt.10E-10_dp) Then 
MFin = MFe(i3)
MFin2 = MFe2(i3)
! Propagator and inverse propagator mass 
MP = Mhh
MP2 = Mhh2
IMP = 1._dp/MP  
IMP2 = 1._dp/MP2 
! Amplitude 
  int1=B0(0._dp, mF12, mS12)
  int2=B1(0._dp, mF12, mS12)
  PSOddllSLL=PSOddllSLL+(chargefactor*coup3L*coup4L*IMP2*(-1.*coup1L*coup2R*int2*MassEx32 +& 
&  coup1R*coup2R*int1*MassEx3*mF1 - 1.*coup1R*coup2L*int2*MassEx3*MFin + coup1L*coup2L*int1*mF1*MFin))& 
& /(MassEx32 - 1.*MFin2)
  PSOddllSRR=PSOddllSRR+(chargefactor*coup3R*coup4R*IMP2*(-1.*coup1R*coup2L*int2*MassEx32 +& 
&  coup1L*coup2L*int1*MassEx3*mF1 - 1.*coup1L*coup2R*int2*MassEx3*MFin + coup1R*coup2R*int1*mF1*MFin))& 
& /(MassEx32 - 1.*MFin2)
  PSOddllSRL=PSOddllSRL+(chargefactor*coup3L*coup4R*IMP2*(-1.*coup1L*coup2R*int2*MassEx32 +& 
&  coup1R*coup2R*int1*MassEx3*mF1 - 1.*coup1R*coup2L*int2*MassEx3*MFin + coup1L*coup2L*int1*mF1*MFin))& 
& /(MassEx32 - 1.*MFin2)
  PSOddllSLR=PSOddllSLR+(chargefactor*coup3R*coup4L*IMP2*(-1.*coup1R*coup2L*int2*MassEx32 +& 
&  coup1L*coup2L*int1*MassEx3*mF1 - 1.*coup1L*coup2R*int2*MassEx3*MFin + coup1R*coup2R*int1*mF1*MFin))& 
& /(MassEx32 - 1.*MFin2)
  PSOddllVRR=PSOddllVRR+0.
  PSOddllVLL=PSOddllVLL+0.
  PSOddllVRL=PSOddllVRL+0.
  PSOddllVLR=PSOddllVLR+0.
  PSOddllTLL=PSOddllTLL+0.
  PSOddllTLR=PSOddllTLR+0.
  PSOddllTRL=PSOddllTRL+0.
  PSOddllTRR=PSOddllTRR+0.
     End if 
  End if 
End if 
   End Do 
  End Do 


 ! Propagator: hh, Loop particles: hh,Fe, Internal fermion: bar[Fe]
! Generic diagram: SFF,  InsertionOrder: 7
chargefactor = 1 
  Do i2=1,3
    Do i3=1,3
If ((Mhh2.gt.mf_l2(3)).Or.(MFe2(i2).gt.mf_l2(3))) Then
If (.not.OnlySM) Then 
coup1L = cplcFeFehhL(i2,gt3)
coup1R = cplcFeFehhR(i2,gt3)
coup2L = cplcFeFehhL(i3,i2)
coup2R = cplcFeFehhR(i3,i2)
coup3L = cplcFeFehhL(gt4,i3)
coup3R = cplcFeFehhR(gt4,i3)
coup4L = cplcFdFdhhL(gt2,gt1)
coup4R = cplcFdFdhhR(gt2,gt1)
! Masses in loop
mS1 = Mhh
mS12 = Mhh2
mF1 = MFe(i2)
mF12 = MFe2(i2)
! Mass of internal fermion 
MFin = MFe(i3)-MFe(gt3)
MFin2 = MFe2(i3)-MFe2(gt3)
If (Abs(MFin).gt.10E-10_dp) Then 
MFin = MFe(i3)
MFin2 = MFe2(i3)
! Propagator and inverse propagator mass 
MP = Mhh
MP2 = Mhh2
IMP = 1._dp/MP  
IMP2 = 1._dp/MP2 
! Amplitude 
  int1=B0(0._dp, mF12, mS12)
  int2=B1(0._dp, mF12, mS12)
  PSOddllSLL=PSOddllSLL+(chargefactor*coup3L*coup4L*IMP2*(-1.*coup1L*coup2R*int2*MassEx32 +& 
&  coup1R*coup2R*int1*MassEx3*mF1 - 1.*coup1R*coup2L*int2*MassEx3*MFin + coup1L*coup2L*int1*mF1*MFin))& 
& /(MassEx32 - 1.*MFin2)
  PSOddllSRR=PSOddllSRR+(chargefactor*coup3R*coup4R*IMP2*(-1.*coup1R*coup2L*int2*MassEx32 +& 
&  coup1L*coup2L*int1*MassEx3*mF1 - 1.*coup1L*coup2R*int2*MassEx3*MFin + coup1R*coup2R*int1*mF1*MFin))& 
& /(MassEx32 - 1.*MFin2)
  PSOddllSRL=PSOddllSRL+(chargefactor*coup3L*coup4R*IMP2*(-1.*coup1L*coup2R*int2*MassEx32 +& 
&  coup1R*coup2R*int1*MassEx3*mF1 - 1.*coup1R*coup2L*int2*MassEx3*MFin + coup1L*coup2L*int1*mF1*MFin))& 
& /(MassEx32 - 1.*MFin2)
  PSOddllSLR=PSOddllSLR+(chargefactor*coup3R*coup4L*IMP2*(-1.*coup1R*coup2L*int2*MassEx32 +& 
&  coup1L*coup2L*int1*MassEx3*mF1 - 1.*coup1L*coup2R*int2*MassEx3*MFin + coup1R*coup2R*int1*mF1*MFin))& 
& /(MassEx32 - 1.*MFin2)
  PSOddllVRR=PSOddllVRR+0.
  PSOddllVLL=PSOddllVLL+0.
  PSOddllVRL=PSOddllVRL+0.
  PSOddllVLR=PSOddllVLR+0.
  PSOddllTLL=PSOddllTLL+0.
  PSOddllTLR=PSOddllTLR+0.
  PSOddllTRL=PSOddllTRL+0.
  PSOddllTRR=PSOddllTRR+0.
     End if 
  End if 
End if 
   End Do 
  End Do 


 ! Propagator: hh, Loop particles: VZ,Fe, Internal fermion: bar[Fe]
! Generic diagram: VFF,  InsertionOrder: 7
chargefactor = 1 
  Do i2=1,3
    Do i3=1,3
If ((MVZ2.gt.mf_l2(3)).Or.(MFe2(i2).gt.mf_l2(3))) Then
If (.not.OnlySM) Then 
coup1L = cplcFeFeVZL(i2,gt3)
coup1R = cplcFeFeVZR(i2,gt3)
coup2L = cplcFeFeVZL(i3,i2)
coup2R = cplcFeFeVZR(i3,i2)
coup3L = cplcFeFehhL(gt4,i3)
coup3R = cplcFeFehhR(gt4,i3)
coup4L = cplcFdFdhhL(gt2,gt1)
coup4R = cplcFdFdhhR(gt2,gt1)
! Masses in loop
mV1 = MVZ
mV12 = MVZ2
mF1 = MFe(i2)
mF12 = MFe2(i2)
! Mass of internal fermion 
MFin = MFe(i3)-MFe(gt3)
MFin2 = MFe2(i3)-MFe2(gt3)
If (Abs(MFin).gt.10E-10_dp) Then 
MFin = MFe(i3)
MFin2 = MFe2(i3)
! Propagator and inverse propagator mass 
MP = Mhh
MP2 = Mhh2
IMP = 1._dp/MP  
IMP2 = 1._dp/MP2 
! Amplitude 
  int1=B0(0._dp, mF12, mV12)
  int2=B1(0._dp, mF12, mV12)
  PSOddllSLL=PSOddllSLL+(-1.*chargefactor*coup3L*coup4L*IMP2*(coup1R*MassEx3*(-       & 
& 2.*coup2L*(Finite - 2.*int1)*mF1 + coup2R*(Finite + 2.*int2)*MFin) + coup1L*(coup2L*(Finite + 2.*int2)& 
& *MassEx32 - 2.*coup2R*(Finite - 2.*int1)*mF1*MFin)))/(MassEx32 - 1.*MFin2)
  PSOddllSRR=PSOddllSRR+(-1.*chargefactor*coup3R*coup4R*IMP2*(coup1L*MassEx3*(-       & 
& 2.*coup2R*(Finite - 2.*int1)*mF1 + coup2L*(Finite + 2.*int2)*MFin) + coup1R*(coup2R*(Finite + 2.*int2)& 
& *MassEx32 - 2.*coup2L*(Finite - 2.*int1)*mF1*MFin)))/(MassEx32 - 1.*MFin2)
  PSOddllSRL=PSOddllSRL+(-1.*chargefactor*coup3L*coup4R*IMP2*(coup1R*MassEx3*(-       & 
& 2.*coup2L*(Finite - 2.*int1)*mF1 + coup2R*(Finite + 2.*int2)*MFin) + coup1L*(coup2L*(Finite + 2.*int2)& 
& *MassEx32 - 2.*coup2R*(Finite - 2.*int1)*mF1*MFin)))/(MassEx32 - 1.*MFin2)
  PSOddllSLR=PSOddllSLR+(-1.*chargefactor*coup3R*coup4L*IMP2*(coup1L*MassEx3*(-       & 
& 2.*coup2R*(Finite - 2.*int1)*mF1 + coup2L*(Finite + 2.*int2)*MFin) + coup1R*(coup2R*(Finite + 2.*int2)& 
& *MassEx32 - 2.*coup2L*(Finite - 2.*int1)*mF1*MFin)))/(MassEx32 - 1.*MFin2)
  PSOddllVRR=PSOddllVRR+0.
  PSOddllVLL=PSOddllVLL+0.
  PSOddllVRL=PSOddllVRL+0.
  PSOddllVLR=PSOddllVLR+0.
  PSOddllTLL=PSOddllTLL+0.
  PSOddllTLR=PSOddllTLR+0.
  PSOddllTRL=PSOddllTRL+0.
  PSOddllTRR=PSOddllTRR+0.
     End if 
  End if 
End if 
   End Do 
  End Do 


 ! Propagator: hh, Loop particles: Fe,Ah, Internal fermion: Fe
! Generic diagram: FSF,  InsertionOrder: 8
chargefactor = 1 
Do i1=1,3
    Do i3=1,3
If ((MFe2(i1).gt.mf_l2(3)).Or.(MAh2.gt.mf_l2(3))) Then
If (.not.OnlySM) Then 
coup3L = cplcFeFehhL(i3,gt3)
coup3R = cplcFeFehhR(i3,gt3)
coup2L = cplcFeFeAhL(i1,i3)
coup2R = cplcFeFeAhR(i1,i3)
coup1L = cplcFeFeAhL(gt4,i1)
coup1R = cplcFeFeAhR(gt4,i1)
coup4L = cplcFdFdhhL(gt2,gt1)
coup4R = cplcFdFdhhR(gt2,gt1)
! Masses in loop
mF1 = MFe(i1)
mF12 = MFe2(i1)
mS1 = MAh
mS12 = MAh2
! Mass of internal fermion 
MFin = MFe(i3)-MFe(gt4)
MFin2 = MFe2(i3)-MFe2(gt4)
If (Abs(MFin).gt.10E-10_dp) Then 
MFin = MFe(i3)
MFin2 = MFe2(i3)
! Propagator and inverse propagator mass 
MP = Mhh
MP2 = Mhh2
IMP = 1._dp/MP  
IMP2 = 1._dp/MP2 
! Amplitude 
  int1=B0(0._dp, mF12, mS12)
  int2=B1(0._dp, mF12, mS12)
  PSOddllSLL=PSOddllSLL+(chargefactor*coup3L*coup4L*IMP2*(-1.*coup1L*coup2R*int2*MassEx42 +& 
&  coup1R*coup2R*int1*MassEx4*mF1 - 1.*coup1R*coup2L*int2*MassEx4*MFin + coup1L*coup2L*int1*mF1*MFin))& 
& /(MassEx42 - 1.*MFin2)
  PSOddllSRR=PSOddllSRR+(chargefactor*coup3R*coup4R*IMP2*(-1.*coup1R*coup2L*int2*MassEx42 +& 
&  coup1L*coup2L*int1*MassEx4*mF1 - 1.*coup1L*coup2R*int2*MassEx4*MFin + coup1R*coup2R*int1*mF1*MFin))& 
& /(MassEx42 - 1.*MFin2)
  PSOddllSRL=PSOddllSRL+(chargefactor*coup3L*coup4R*IMP2*(-1.*coup1L*coup2R*int2*MassEx42 +& 
&  coup1R*coup2R*int1*MassEx4*mF1 - 1.*coup1R*coup2L*int2*MassEx4*MFin + coup1L*coup2L*int1*mF1*MFin))& 
& /(MassEx42 - 1.*MFin2)
  PSOddllSLR=PSOddllSLR+(chargefactor*coup3R*coup4L*IMP2*(-1.*coup1R*coup2L*int2*MassEx42 +& 
&  coup1L*coup2L*int1*MassEx4*mF1 - 1.*coup1L*coup2R*int2*MassEx4*MFin + coup1R*coup2R*int1*mF1*MFin))& 
& /(MassEx42 - 1.*MFin2)
  PSOddllVRR=PSOddllVRR+0.
  PSOddllVLL=PSOddllVLL+0.
  PSOddllVRL=PSOddllVRL+0.
  PSOddllVLR=PSOddllVLR+0.
  PSOddllTLL=PSOddllTLL+0.
  PSOddllTLR=PSOddllTLR+0.
  PSOddllTRL=PSOddllTRL+0.
  PSOddllTRR=PSOddllTRR+0.
     End if 
  End if 
End if 
    End Do 
  End Do 


 ! Propagator: hh, Loop particles: Fe,hh, Internal fermion: Fe
! Generic diagram: FSF,  InsertionOrder: 8
chargefactor = 1 
Do i1=1,3
    Do i3=1,3
If ((MFe2(i1).gt.mf_l2(3)).Or.(Mhh2.gt.mf_l2(3))) Then
If (.not.OnlySM) Then 
coup3L = cplcFeFehhL(i3,gt3)
coup3R = cplcFeFehhR(i3,gt3)
coup2L = cplcFeFehhL(i1,i3)
coup2R = cplcFeFehhR(i1,i3)
coup1L = cplcFeFehhL(gt4,i1)
coup1R = cplcFeFehhR(gt4,i1)
coup4L = cplcFdFdhhL(gt2,gt1)
coup4R = cplcFdFdhhR(gt2,gt1)
! Masses in loop
mF1 = MFe(i1)
mF12 = MFe2(i1)
mS1 = Mhh
mS12 = Mhh2
! Mass of internal fermion 
MFin = MFe(i3)-MFe(gt4)
MFin2 = MFe2(i3)-MFe2(gt4)
If (Abs(MFin).gt.10E-10_dp) Then 
MFin = MFe(i3)
MFin2 = MFe2(i3)
! Propagator and inverse propagator mass 
MP = Mhh
MP2 = Mhh2
IMP = 1._dp/MP  
IMP2 = 1._dp/MP2 
! Amplitude 
  int1=B0(0._dp, mF12, mS12)
  int2=B1(0._dp, mF12, mS12)
  PSOddllSLL=PSOddllSLL+(chargefactor*coup3L*coup4L*IMP2*(-1.*coup1L*coup2R*int2*MassEx42 +& 
&  coup1R*coup2R*int1*MassEx4*mF1 - 1.*coup1R*coup2L*int2*MassEx4*MFin + coup1L*coup2L*int1*mF1*MFin))& 
& /(MassEx42 - 1.*MFin2)
  PSOddllSRR=PSOddllSRR+(chargefactor*coup3R*coup4R*IMP2*(-1.*coup1R*coup2L*int2*MassEx42 +& 
&  coup1L*coup2L*int1*MassEx4*mF1 - 1.*coup1L*coup2R*int2*MassEx4*MFin + coup1R*coup2R*int1*mF1*MFin))& 
& /(MassEx42 - 1.*MFin2)
  PSOddllSRL=PSOddllSRL+(chargefactor*coup3L*coup4R*IMP2*(-1.*coup1L*coup2R*int2*MassEx42 +& 
&  coup1R*coup2R*int1*MassEx4*mF1 - 1.*coup1R*coup2L*int2*MassEx4*MFin + coup1L*coup2L*int1*mF1*MFin))& 
& /(MassEx42 - 1.*MFin2)
  PSOddllSLR=PSOddllSLR+(chargefactor*coup3R*coup4L*IMP2*(-1.*coup1R*coup2L*int2*MassEx42 +& 
&  coup1L*coup2L*int1*MassEx4*mF1 - 1.*coup1L*coup2R*int2*MassEx4*MFin + coup1R*coup2R*int1*mF1*MFin))& 
& /(MassEx42 - 1.*MFin2)
  PSOddllVRR=PSOddllVRR+0.
  PSOddllVLL=PSOddllVLL+0.
  PSOddllVRL=PSOddllVRL+0.
  PSOddllVLR=PSOddllVLR+0.
  PSOddllTLL=PSOddllTLL+0.
  PSOddllTLR=PSOddllTLR+0.
  PSOddllTRL=PSOddllTRL+0.
  PSOddllTRR=PSOddllTRR+0.
     End if 
  End if 
End if 
    End Do 
  End Do 


 ! Propagator: hh, Loop particles: Fe,VZ, Internal fermion: Fe
! Generic diagram: FVF,  InsertionOrder: 8
chargefactor = 1 
Do i1=1,3
    Do i3=1,3
If ((MFe2(i1).gt.mf_l2(3)).Or.(MVZ2.gt.mf_l2(3))) Then
If (.not.OnlySM) Then 
coup3L = cplcFeFehhL(i3,gt3)
coup3R = cplcFeFehhR(i3,gt3)
coup2L = cplcFeFeVZL(i1,i3)
coup2R = cplcFeFeVZR(i1,i3)
coup1L = cplcFeFeVZL(gt4,i1)
coup1R = cplcFeFeVZR(gt4,i1)
coup4L = cplcFdFdhhL(gt2,gt1)
coup4R = cplcFdFdhhR(gt2,gt1)
! Masses in loop
mF1 = MFe(i1)
mF12 = MFe2(i1)
mV1 = MVZ
mV12 = MVZ2
! Mass of internal fermion 
MFin = MFe(i3)-MFe(gt4)
MFin2 = MFe2(i3)-MFe2(gt4)
If (Abs(MFin).gt.10E-10_dp) Then 
MFin = MFe(i3)
MFin2 = MFe2(i3)
! Propagator and inverse propagator mass 
MP = Mhh
MP2 = Mhh2
IMP = 1._dp/MP  
IMP2 = 1._dp/MP2 
! Amplitude 
  int1=B0(0._dp, mF12, mV12)
  int2=B1(0._dp, mF12, mV12)
  PSOddllSLL=PSOddllSLL+(-1.*chargefactor*coup3L*coup4L*IMP2*(coup1L*MassEx4*(-       & 
& 2.*coup2R*(Finite - 2.*int1)*mF1 + coup2L*(Finite + 2.*int2)*MFin) + coup1R*(coup2R*(Finite + 2.*int2)& 
& *MassEx42 - 2.*coup2L*(Finite - 2.*int1)*mF1*MFin)))/(MassEx42 - 1.*MFin2)
  PSOddllSRR=PSOddllSRR+(-1.*chargefactor*coup3R*coup4R*IMP2*(coup1R*MassEx4*(-       & 
& 2.*coup2L*(Finite - 2.*int1)*mF1 + coup2R*(Finite + 2.*int2)*MFin) + coup1L*(coup2L*(Finite + 2.*int2)& 
& *MassEx42 - 2.*coup2R*(Finite - 2.*int1)*mF1*MFin)))/(MassEx42 - 1.*MFin2)
  PSOddllSRL=PSOddllSRL+(-1.*chargefactor*coup3L*coup4R*IMP2*(coup1L*MassEx4*(-       & 
& 2.*coup2R*(Finite - 2.*int1)*mF1 + coup2L*(Finite + 2.*int2)*MFin) + coup1R*(coup2R*(Finite + 2.*int2)& 
& *MassEx42 - 2.*coup2L*(Finite - 2.*int1)*mF1*MFin)))/(MassEx42 - 1.*MFin2)
  PSOddllSLR=PSOddllSLR+(-1.*chargefactor*coup3R*coup4L*IMP2*(coup1R*MassEx4*(-       & 
& 2.*coup2L*(Finite - 2.*int1)*mF1 + coup2R*(Finite + 2.*int2)*MFin) + coup1L*(coup2L*(Finite + 2.*int2)& 
& *MassEx42 - 2.*coup2R*(Finite - 2.*int1)*mF1*MFin)))/(MassEx42 - 1.*MFin2)
  PSOddllVRR=PSOddllVRR+0.
  PSOddllVLL=PSOddllVLL+0.
  PSOddllVRL=PSOddllVRL+0.
  PSOddllVLR=PSOddllVLR+0.
  PSOddllTLL=PSOddllTLL+0.
  PSOddllTLR=PSOddllTLR+0.
  PSOddllTRL=PSOddllTRL+0.
  PSOddllTRR=PSOddllTRR+0.
     End if 
  End if 
End if 
    End Do 
  End Do 


 !---------------------------------------- 
! Scalar Penguin Contributions            
!---------------------------------------- 
! -- Ah - Penguins            
! Propagator: Ah, Loop particles: Ah,Fd,Fd
! Generic diagram: SFF,  InsertionOrder: 1
chargefactor = 1 
  Do i2=1,3
    Do i3=1,3
If ((MAh2.gt.mf_l2(3)).Or.(MFd2(i2).gt.mf_l2(3)).Or.(MFd2(i3).gt.mf_l2(3))) Then
If (((i2.lt.4).and.(i3.lt.4)).or.(.not.OnlySM)) Then 
coup1L = cplcFdFdAhL(i2,gt1)
coup1R = cplcFdFdAhR(i2,gt1)
coup2L = cplcFdFdAhL(gt2,i3)
coup2R = cplcFdFdAhR(gt2,i3)
coup3L = cplcFdFdAhL(i3,i2)
coup3R = cplcFdFdAhR(i3,i2)
coup4L = cplcFeFeAhL(gt4,gt3)
coup4R = cplcFeFeAhR(gt4,gt3)
! Masses in loop
mS1 = MAh
mS12 = MAh2
mF1 = MFd(i2)
mF12 = MFd2(i2)
mF2 = MFd(i3)
mF22 = MFd2(i3)
! Propagator and inverse propagator mass 
MP = MAh
MP2 = MAh2
IMP = 1._dp/MP  
IMP2 = 1._dp/MP2 
! Amplitude 
  int1=B0C0check(mF22, mF12, mS12)
  int2=C0check(mF22, mF12, mS12)
  PSOddllSLL=PSOddllSLL+chargefactor*coup1L*coup2L*coup4L*IMP2*(coup3R*int1 +         & 
&  coup3L*int2*mF1*mF2)
  PSOddllSRR=PSOddllSRR+chargefactor*coup1R*coup2R*coup4R*IMP2*(coup3L*int1 +         & 
&  coup3R*int2*mF1*mF2)
  PSOddllSRL=PSOddllSRL+chargefactor*coup1R*coup2R*coup4L*IMP2*(coup3L*int1 +         & 
&  coup3R*int2*mF1*mF2)
  PSOddllSLR=PSOddllSLR+chargefactor*coup1L*coup2L*coup4R*IMP2*(coup3R*int1 +         & 
&  coup3L*int2*mF1*mF2)
  PSOddllVRR=PSOddllVRR+0.
  PSOddllVLL=PSOddllVLL+0.
  PSOddllVRL=PSOddllVRL+0.
  PSOddllVLR=PSOddllVLR+0.
  PSOddllTLL=PSOddllTLL+0.
  PSOddllTLR=PSOddllTLR+0.
  PSOddllTRL=PSOddllTRL+0.
  PSOddllTRR=PSOddllTRR+0.
  End if 
End if 
   End Do 
  End Do 


 ! Propagator: Ah, Loop particles: hh,Fd,Fd
! Generic diagram: SFF,  InsertionOrder: 1
chargefactor = 1 
  Do i2=1,3
    Do i3=1,3
If ((Mhh2.gt.mf_l2(3)).Or.(MFd2(i2).gt.mf_l2(3)).Or.(MFd2(i3).gt.mf_l2(3))) Then
If (.not.OnlySM) Then 
coup1L = cplcFdFdhhL(i2,gt1)
coup1R = cplcFdFdhhR(i2,gt1)
coup2L = cplcFdFdhhL(gt2,i3)
coup2R = cplcFdFdhhR(gt2,i3)
coup3L = cplcFdFdAhL(i3,i2)
coup3R = cplcFdFdAhR(i3,i2)
coup4L = cplcFeFeAhL(gt4,gt3)
coup4R = cplcFeFeAhR(gt4,gt3)
! Masses in loop
mS1 = Mhh
mS12 = Mhh2
mF1 = MFd(i2)
mF12 = MFd2(i2)
mF2 = MFd(i3)
mF22 = MFd2(i3)
! Propagator and inverse propagator mass 
MP = MAh
MP2 = MAh2
IMP = 1._dp/MP  
IMP2 = 1._dp/MP2 
! Amplitude 
  int1=B0C0check(mF22, mF12, mS12)
  int2=C0check(mF22, mF12, mS12)
  PSOddllSLL=PSOddllSLL+chargefactor*coup1L*coup2L*coup4L*IMP2*(coup3R*int1 +         & 
&  coup3L*int2*mF1*mF2)
  PSOddllSRR=PSOddllSRR+chargefactor*coup1R*coup2R*coup4R*IMP2*(coup3L*int1 +         & 
&  coup3R*int2*mF1*mF2)
  PSOddllSRL=PSOddllSRL+chargefactor*coup1R*coup2R*coup4L*IMP2*(coup3L*int1 +         & 
&  coup3R*int2*mF1*mF2)
  PSOddllSLR=PSOddllSLR+chargefactor*coup1L*coup2L*coup4R*IMP2*(coup3R*int1 +         & 
&  coup3L*int2*mF1*mF2)
  PSOddllVRR=PSOddllVRR+0.
  PSOddllVLL=PSOddllVLL+0.
  PSOddllVRL=PSOddllVRL+0.
  PSOddllVLR=PSOddllVLR+0.
  PSOddllTLL=PSOddllTLL+0.
  PSOddllTLR=PSOddllTLR+0.
  PSOddllTRL=PSOddllTRL+0.
  PSOddllTRR=PSOddllTRR+0.
  End if 
End if 
   End Do 
  End Do 


 ! Propagator: Ah, Loop particles: Hp,Fu,Fu
! Generic diagram: SFF,  InsertionOrder: 1
chargefactor = 1 
  Do i2=1,3
    Do i3=1,3
If ((MHp2.gt.mf_l2(3)).Or.(MFu2(i2).gt.mf_l2(3)).Or.(MFu2(i3).gt.mf_l2(3))) Then
If (((i2.lt.4).and.(i3.lt.4)).or.(.not.OnlySM)) Then 
coup1L = cplcFuFdHpL(i2,gt1)
coup1R = cplcFuFdHpR(i2,gt1)
coup2L = cplcFdFucHpL(gt2,i3)
coup2R = cplcFdFucHpR(gt2,i3)
coup3L = cplcFuFuAhL(i3,i2)
coup3R = cplcFuFuAhR(i3,i2)
coup4L = cplcFeFeAhL(gt4,gt3)
coup4R = cplcFeFeAhR(gt4,gt3)
! Masses in loop
mS1 = MHp
mS12 = MHp2
mF1 = MFu(i2)
mF12 = MFu2(i2)
mF2 = MFu(i3)
mF22 = MFu2(i3)
! Propagator and inverse propagator mass 
MP = MAh
MP2 = MAh2
IMP = 1._dp/MP  
IMP2 = 1._dp/MP2 
! Amplitude 
  int1=B0C0check(mF22, mF12, mS12)
  int2=C0check(mF22, mF12, mS12)
  PSOddllSLL=PSOddllSLL+chargefactor*coup1L*coup2L*coup4L*IMP2*(coup3R*int1 +         & 
&  coup3L*int2*mF1*mF2)
  PSOddllSRR=PSOddllSRR+chargefactor*coup1R*coup2R*coup4R*IMP2*(coup3L*int1 +         & 
&  coup3R*int2*mF1*mF2)
  PSOddllSRL=PSOddllSRL+chargefactor*coup1R*coup2R*coup4L*IMP2*(coup3L*int1 +         & 
&  coup3R*int2*mF1*mF2)
  PSOddllSLR=PSOddllSLR+chargefactor*coup1L*coup2L*coup4R*IMP2*(coup3R*int1 +         & 
&  coup3L*int2*mF1*mF2)
  PSOddllVRR=PSOddllVRR+0.
  PSOddllVLL=PSOddllVLL+0.
  PSOddllVRL=PSOddllVRL+0.
  PSOddllVLR=PSOddllVLR+0.
  PSOddllTLL=PSOddllTLL+0.
  PSOddllTLR=PSOddllTLR+0.
  PSOddllTRL=PSOddllTRL+0.
  PSOddllTRR=PSOddllTRR+0.
  End if 
End if 
   End Do 
  End Do 


 ! Propagator: Ah, Loop particles: VWp,Fu,Fu
! Generic diagram: VFF,  InsertionOrder: 1
chargefactor = 1 
  Do i2=1,3
    Do i3=1,3
If ((MVWp2.gt.mf_l2(3)).Or.(MFu2(i2).gt.mf_l2(3)).Or.(MFu2(i3).gt.mf_l2(3))) Then
If (((i2.lt.4).and.(i3.lt.4)).or.(.not.OnlySM)) Then 
coup1L = cplcFuFdVWpL(i2,gt1)
coup1R = cplcFuFdVWpR(i2,gt1)
coup2L = cplcFdFucVWpL(gt2,i3)
coup2R = cplcFdFucVWpR(gt2,i3)
coup3L = cplcFuFuAhL(i3,i2)
coup3R = cplcFuFuAhR(i3,i2)
coup4L = cplcFeFeAhL(gt4,gt3)
coup4R = cplcFeFeAhR(gt4,gt3)
! Masses in loop
mV1 = MVWp
mV12 = MVWp2
mF1 = MFu(i2)
mF12 = MFu2(i2)
mF2 = MFu(i3)
mF22 = MFu2(i3)
! Propagator and inverse propagator mass 
MP = MAh
MP2 = MAh2
IMP = 1._dp/MP  
IMP2 = 1._dp/MP2 
! Amplitude 
  int1=B0C0check(mF22, mF12, mV12)
  int2=C0check(mF22, mF12, mV12)
  PSOddllSLL=PSOddllSLL+2.*chargefactor*coup1L*coup2R*coup4L*IMP2*(coup3L*(Finite -   & 
&  2.*int1) - 2.*coup3R*int2*mF1*mF2)
  PSOddllSRR=PSOddllSRR+2.*chargefactor*coup1R*coup2L*coup4R*IMP2*(coup3R*(Finite -   & 
&  2.*int1) - 2.*coup3L*int2*mF1*mF2)
  PSOddllSRL=PSOddllSRL+2.*chargefactor*coup1R*coup2L*coup4L*IMP2*(coup3R*(Finite -   & 
&  2.*int1) - 2.*coup3L*int2*mF1*mF2)
  PSOddllSLR=PSOddllSLR+2.*chargefactor*coup1L*coup2R*coup4R*IMP2*(coup3L*(Finite -   & 
&  2.*int1) - 2.*coup3R*int2*mF1*mF2)
  PSOddllVRR=PSOddllVRR+0.
  PSOddllVLL=PSOddllVLL+0.
  PSOddllVRL=PSOddllVRL+0.
  PSOddllVLR=PSOddllVLR+0.
  PSOddllTLL=PSOddllTLL+0.
  PSOddllTLR=PSOddllTLR+0.
  PSOddllTRL=PSOddllTRL+0.
  PSOddllTRR=PSOddllTRR+0.
  End if 
End if 
   End Do 
  End Do 


 ! Propagator: Ah, Loop particles: VZ,Fd,Fd
! Generic diagram: VFF,  InsertionOrder: 1
chargefactor = 1 
  Do i2=1,3
    Do i3=1,3
If ((MVZ2.gt.mf_l2(3)).Or.(MFd2(i2).gt.mf_l2(3)).Or.(MFd2(i3).gt.mf_l2(3))) Then
If (((i2.lt.4).and.(i3.lt.4)).or.(.not.OnlySM)) Then 
coup1L = cplcFdFdVZL(i2,gt1)
coup1R = cplcFdFdVZR(i2,gt1)
coup2L = cplcFdFdVZL(gt2,i3)
coup2R = cplcFdFdVZR(gt2,i3)
coup3L = cplcFdFdAhL(i3,i2)
coup3R = cplcFdFdAhR(i3,i2)
coup4L = cplcFeFeAhL(gt4,gt3)
coup4R = cplcFeFeAhR(gt4,gt3)
! Masses in loop
mV1 = MVZ
mV12 = MVZ2
mF1 = MFd(i2)
mF12 = MFd2(i2)
mF2 = MFd(i3)
mF22 = MFd2(i3)
! Propagator and inverse propagator mass 
MP = MAh
MP2 = MAh2
IMP = 1._dp/MP  
IMP2 = 1._dp/MP2 
! Amplitude 
  int1=B0C0check(mF22, mF12, mV12)
  int2=C0check(mF22, mF12, mV12)
  PSOddllSLL=PSOddllSLL+2.*chargefactor*coup1L*coup2R*coup4L*IMP2*(coup3L*(Finite -   & 
&  2.*int1) - 2.*coup3R*int2*mF1*mF2)
  PSOddllSRR=PSOddllSRR+2.*chargefactor*coup1R*coup2L*coup4R*IMP2*(coup3R*(Finite -   & 
&  2.*int1) - 2.*coup3L*int2*mF1*mF2)
  PSOddllSRL=PSOddllSRL+2.*chargefactor*coup1R*coup2L*coup4L*IMP2*(coup3R*(Finite -   & 
&  2.*int1) - 2.*coup3L*int2*mF1*mF2)
  PSOddllSLR=PSOddllSLR+2.*chargefactor*coup1L*coup2R*coup4R*IMP2*(coup3L*(Finite -   & 
&  2.*int1) - 2.*coup3R*int2*mF1*mF2)
  PSOddllVRR=PSOddllVRR+0.
  PSOddllVLL=PSOddllVLL+0.
  PSOddllVRL=PSOddllVRL+0.
  PSOddllVLR=PSOddllVLR+0.
  PSOddllTLL=PSOddllTLL+0.
  PSOddllTLR=PSOddllTLR+0.
  PSOddllTRL=PSOddllTRL+0.
  PSOddllTRR=PSOddllTRR+0.
  End if 
End if 
   End Do 
  End Do 


 ! Propagator: Ah, Loop particles: bar[Fd],hh,Ah
! Generic diagram: FSS,  InsertionOrder: 1
chargefactor = 1 
Do i1=1,3
If ((MFd2(i1).gt.mf_l2(3)).Or.(Mhh2.gt.mf_l2(3)).Or.(MAh2.gt.mf_l2(3))) Then
If (.not.OnlySM) Then 
coup1L = cplcFdFdhhL(i1,gt1)
coup1R = cplcFdFdhhR(i1,gt1)
coup2L = cplcFdFdAhL(gt2,i1)
coup2R = cplcFdFdAhR(gt2,i1)
coup3 = cplAhAhhh
coup4L = cplcFeFeAhL(gt4,gt3)
coup4R = cplcFeFeAhR(gt4,gt3)
! Masses in loop
mF1 = MFd(i1)
mF12 = MFd2(i1)
mS1 = Mhh
mS12 = Mhh2
mS2 = MAh
mS22 = MAh2
! Propagator and inverse propagator mass 
MP = MAh
MP2 = MAh2
IMP = 1._dp/MP  
IMP2 = 1._dp/MP2 
! Amplitude 
  int1=C0check(mF12, mS22, mS12)
  PSOddllSLL=PSOddllSLL+chargefactor*coup1L*coup2L*coup3*coup4L*IMP2*int1*mF1
  PSOddllSRR=PSOddllSRR+chargefactor*coup1R*coup2R*coup3*coup4R*IMP2*int1*mF1
  PSOddllSRL=PSOddllSRL+chargefactor*coup1R*coup2R*coup3*coup4L*IMP2*int1*mF1
  PSOddllSLR=PSOddllSLR+chargefactor*coup1L*coup2L*coup3*coup4R*IMP2*int1*mF1
  PSOddllVRR=PSOddllVRR+0.
  PSOddllVLL=PSOddllVLL+0.
  PSOddllVRL=PSOddllVRL+0.
  PSOddllVLR=PSOddllVLR+0.
  PSOddllTLL=PSOddllTLL+0.
  PSOddllTLR=PSOddllTLR+0.
  PSOddllTRL=PSOddllTRL+0.
  PSOddllTRR=PSOddllTRR+0.
  End if 
End if 
    End Do 


 ! Propagator: Ah, Loop particles: bar[Fd],Ah,hh
! Generic diagram: FSS,  InsertionOrder: 1
chargefactor = 1 
Do i1=1,3
If ((MFd2(i1).gt.mf_l2(3)).Or.(MAh2.gt.mf_l2(3)).Or.(Mhh2.gt.mf_l2(3))) Then
If (.not.OnlySM) Then 
coup1L = cplcFdFdAhL(i1,gt1)
coup1R = cplcFdFdAhR(i1,gt1)
coup2L = cplcFdFdhhL(gt2,i1)
coup2R = cplcFdFdhhR(gt2,i1)
coup3 = cplAhAhhh
coup4L = cplcFeFeAhL(gt4,gt3)
coup4R = cplcFeFeAhR(gt4,gt3)
! Masses in loop
mF1 = MFd(i1)
mF12 = MFd2(i1)
mS1 = MAh
mS12 = MAh2
mS2 = Mhh
mS22 = Mhh2
! Propagator and inverse propagator mass 
MP = MAh
MP2 = MAh2
IMP = 1._dp/MP  
IMP2 = 1._dp/MP2 
! Amplitude 
  int1=C0check(mF12, mS22, mS12)
  PSOddllSLL=PSOddllSLL+chargefactor*coup1L*coup2L*coup3*coup4L*IMP2*int1*mF1
  PSOddllSRR=PSOddllSRR+chargefactor*coup1R*coup2R*coup3*coup4R*IMP2*int1*mF1
  PSOddllSRL=PSOddllSRL+chargefactor*coup1R*coup2R*coup3*coup4L*IMP2*int1*mF1
  PSOddllSLR=PSOddllSLR+chargefactor*coup1L*coup2L*coup3*coup4R*IMP2*int1*mF1
  PSOddllVRR=PSOddllVRR+0.
  PSOddllVLL=PSOddllVLL+0.
  PSOddllVRL=PSOddllVRL+0.
  PSOddllVLR=PSOddllVLR+0.
  PSOddllTLL=PSOddllTLL+0.
  PSOddllTLR=PSOddllTLR+0.
  PSOddllTRL=PSOddllTRL+0.
  PSOddllTRR=PSOddllTRR+0.
  End if 
End if 
    End Do 


 ! Propagator: Ah, Loop particles: bar[Fd],VZ,hh
! Generic diagram: FVS,  InsertionOrder: 1
chargefactor = 1 
Do i1=1,3
If ((MFd2(i1).gt.mf_l2(3)).Or.(MVZ2.gt.mf_l2(3)).Or.(Mhh2.gt.mf_l2(3))) Then
If (.not.OnlySM) Then 
coup1L = cplcFdFdVZL(i1,gt1)
coup1R = cplcFdFdVZR(i1,gt1)
coup2L = cplcFdFdhhL(gt2,i1)
coup2R = cplcFdFdhhR(gt2,i1)
coup3 = -cplAhhhVZ
coup4L = cplcFeFeAhL(gt4,gt3)
coup4R = cplcFeFeAhR(gt4,gt3)
! Masses in loop
mF1 = MFd(i1)
mF12 = MFd2(i1)
mV1 = MVZ
mV12 = MVZ2
mS2 = Mhh
mS22 = Mhh2
! Propagator and inverse propagator mass 
MP = MAh
MP2 = MAh2
IMP = 1._dp/MP  
IMP2 = 1._dp/MP2 
! Amplitude 
  int1=B0(0._dp, mS22, mV12)
  int2=C0check(mF12, mS22, mV12)
  PSOddllSLL=PSOddllSLL+chargefactor*coup1L*coup2L*coup3*coup4L*IMP2*(int1 +          & 
&  int2*mF12)
  PSOddllSRR=PSOddllSRR+chargefactor*coup1R*coup2R*coup3*coup4R*IMP2*(int1 +          & 
&  int2*mF12)
  PSOddllSRL=PSOddllSRL+chargefactor*coup1R*coup2R*coup3*coup4L*IMP2*(int1 +          & 
&  int2*mF12)
  PSOddllSLR=PSOddllSLR+chargefactor*coup1L*coup2L*coup3*coup4R*IMP2*(int1 +          & 
&  int2*mF12)
  PSOddllVRR=PSOddllVRR+0.
  PSOddllVLL=PSOddllVLL+0.
  PSOddllVRL=PSOddllVRL+0.
  PSOddllVLR=PSOddllVLR+0.
  PSOddllTLL=PSOddllTLL+0.
  PSOddllTLR=PSOddllTLR+0.
  PSOddllTRL=PSOddllTRL+0.
  PSOddllTRR=PSOddllTRR+0.
  End if 
End if 
    End Do 


 ! Propagator: Ah, Loop particles: bar[Fd],hh,VZ
! Generic diagram: FSV,  InsertionOrder: 1
chargefactor = 1 
Do i1=1,3
If ((MFd2(i1).gt.mf_l2(3)).Or.(Mhh2.gt.mf_l2(3)).Or.(MVZ2.gt.mf_l2(3))) Then
If (.not.OnlySM) Then 
coup1L = cplcFdFdhhL(i1,gt1)
coup1R = cplcFdFdhhR(i1,gt1)
coup2L = cplcFdFdVZL(gt2,i1)
coup2R = cplcFdFdVZR(gt2,i1)
coup3 = -cplAhhhVZ
coup4L = cplcFeFeAhL(gt4,gt3)
coup4R = cplcFeFeAhR(gt4,gt3)
! Masses in loop
mF1 = MFd(i1)
mF12 = MFd2(i1)
mS1 = Mhh
mS12 = Mhh2
mV2 = MVZ
mV22 = MVZ2
! Propagator and inverse propagator mass 
MP = MAh
MP2 = MAh2
IMP = 1._dp/MP  
IMP2 = 1._dp/MP2 
! Amplitude 
  int1=B0(0._dp, mS12, mV22)
  int2=C0check(mF12, mV22, mS12)
  PSOddllSLL=PSOddllSLL - 1.*chargefactor*coup1L*coup2R*coup3*coup4L*IMP2*(int1 +     & 
&  int2*mF12)
  PSOddllSRR=PSOddllSRR - 1.*chargefactor*coup1R*coup2L*coup3*coup4R*IMP2*(int1 +     & 
&  int2*mF12)
  PSOddllSRL=PSOddllSRL - 1.*chargefactor*coup1R*coup2L*coup3*coup4L*IMP2*(int1 +     & 
&  int2*mF12)
  PSOddllSLR=PSOddllSLR - 1.*chargefactor*coup1L*coup2R*coup3*coup4R*IMP2*(int1 +     & 
&  int2*mF12)
  PSOddllVRR=PSOddllVRR+0.
  PSOddllVLL=PSOddllVLL+0.
  PSOddllVRL=PSOddllVRL+0.
  PSOddllVLR=PSOddllVLR+0.
  PSOddllTLL=PSOddllTLL+0.
  PSOddllTLR=PSOddllTLR+0.
  PSOddllTRL=PSOddllTRL+0.
  PSOddllTRR=PSOddllTRR+0.
  End if 
End if 
    End Do 


 ! Propagator: Ah, Loop particles: bar[Fu],conj[VWp],conj[Hp]
! Generic diagram: FVS,  InsertionOrder: 1
chargefactor = 1 
Do i1=1,3
If ((MFu2(i1).gt.mf_l2(3)).Or.(MVWp2.gt.mf_l2(3)).Or.(MHp2.gt.mf_l2(3))) Then
If (((i1.lt.4)).or.(.not.OnlySM)) Then 
coup1L = cplcFuFdVWpL(i1,gt1)
coup1R = cplcFuFdVWpR(i1,gt1)
coup2L = cplcFdFucHpL(gt2,i1)
coup2R = cplcFdFucHpR(gt2,i1)
coup3 = -cplAhHpcVWp
coup4L = cplcFeFeAhL(gt4,gt3)
coup4R = cplcFeFeAhR(gt4,gt3)
! Masses in loop
mF1 = MFu(i1)
mF12 = MFu2(i1)
mV1 = MVWp
mV12 = MVWp2
mS2 = MHp
mS22 = MHp2
! Propagator and inverse propagator mass 
MP = MAh
MP2 = MAh2
IMP = 1._dp/MP  
IMP2 = 1._dp/MP2 
! Amplitude 
  int1=B0(0._dp, mS22, mV12)
  int2=C0check(mF12, mS22, mV12)
  PSOddllSLL=PSOddllSLL+chargefactor*coup1L*coup2L*coup3*coup4L*IMP2*(int1 +          & 
&  int2*mF12)
  PSOddllSRR=PSOddllSRR+chargefactor*coup1R*coup2R*coup3*coup4R*IMP2*(int1 +          & 
&  int2*mF12)
  PSOddllSRL=PSOddllSRL+chargefactor*coup1R*coup2R*coup3*coup4L*IMP2*(int1 +          & 
&  int2*mF12)
  PSOddllSLR=PSOddllSLR+chargefactor*coup1L*coup2L*coup3*coup4R*IMP2*(int1 +          & 
&  int2*mF12)
  PSOddllVRR=PSOddllVRR+0.
  PSOddllVLL=PSOddllVLL+0.
  PSOddllVRL=PSOddllVRL+0.
  PSOddllVLR=PSOddllVLR+0.
  PSOddllTLL=PSOddllTLL+0.
  PSOddllTLR=PSOddllTLR+0.
  PSOddllTRL=PSOddllTRL+0.
  PSOddllTRR=PSOddllTRR+0.
  End if 
End if 
    End Do 


 ! Propagator: Ah, Loop particles: bar[Fu],conj[Hp],conj[VWp]
! Generic diagram: FSV,  InsertionOrder: 1
chargefactor = 1 
Do i1=1,3
If ((MFu2(i1).gt.mf_l2(3)).Or.(MHp2.gt.mf_l2(3)).Or.(MVWp2.gt.mf_l2(3))) Then
If (((i1.lt.4)).or.(.not.OnlySM)) Then 
coup1L = cplcFuFdHpL(i1,gt1)
coup1R = cplcFuFdHpR(i1,gt1)
coup2L = cplcFdFucVWpL(gt2,i1)
coup2R = cplcFdFucVWpR(gt2,i1)
coup3 = -cplAhcHpVWp
coup4L = cplcFeFeAhL(gt4,gt3)
coup4R = cplcFeFeAhR(gt4,gt3)
! Masses in loop
mF1 = MFu(i1)
mF12 = MFu2(i1)
mS1 = MHp
mS12 = MHp2
mV2 = MVWp
mV22 = MVWp2
! Propagator and inverse propagator mass 
MP = MAh
MP2 = MAh2
IMP = 1._dp/MP  
IMP2 = 1._dp/MP2 
! Amplitude 
  int1=B0(0._dp, mS12, mV22)
  int2=C0check(mF12, mV22, mS12)
  PSOddllSLL=PSOddllSLL - 1.*chargefactor*coup1L*coup2R*coup3*coup4L*IMP2*(int1 +     & 
&  int2*mF12)
  PSOddllSRR=PSOddllSRR - 1.*chargefactor*coup1R*coup2L*coup3*coup4R*IMP2*(int1 +     & 
&  int2*mF12)
  PSOddllSRL=PSOddllSRL - 1.*chargefactor*coup1R*coup2L*coup3*coup4L*IMP2*(int1 +     & 
&  int2*mF12)
  PSOddllSLR=PSOddllSLR - 1.*chargefactor*coup1L*coup2R*coup3*coup4R*IMP2*(int1 +     & 
&  int2*mF12)
  PSOddllVRR=PSOddllVRR+0.
  PSOddllVLL=PSOddllVLL+0.
  PSOddllVRL=PSOddllVRL+0.
  PSOddllVLR=PSOddllVLR+0.
  PSOddllTLL=PSOddllTLL+0.
  PSOddllTLR=PSOddllTLR+0.
  PSOddllTRL=PSOddllTRL+0.
  PSOddllTRR=PSOddllTRR+0.
  End if 
End if 
    End Do 


 ! Propagator: Ah, Loop particles: Ah,Fe,Fe
! Generic diagram: SFF,  InsertionOrder: 4
chargefactor = 1 
  Do i2=1,3
    Do i3=1,3
If ((MAh2.gt.mf_l2(3)).Or.(MFe2(i2).gt.mf_l2(3)).Or.(MFe2(i3).gt.mf_l2(3))) Then
If (((i2.lt.4).and.(i3.lt.4)).or.(.not.OnlySM)) Then 
coup1L = cplcFeFeAhL(i2,gt3)
coup1R = cplcFeFeAhR(i2,gt3)
coup2L = cplcFeFeAhL(gt4,i3)
coup2R = cplcFeFeAhR(gt4,i3)
coup3L = cplcFeFeAhL(i3,i2)
coup3R = cplcFeFeAhR(i3,i2)
coup4L = cplcFdFdAhL(gt2,gt1)
coup4R = cplcFdFdAhR(gt2,gt1)
! Masses in loop
mS1 = MAh
mS12 = MAh2
mF1 = MFe(i2)
mF12 = MFe2(i2)
mF2 = MFe(i3)
mF22 = MFe2(i3)
! Propagator and inverse propagator mass 
MP = MAh
MP2 = MAh2
IMP = 1._dp/MP  
IMP2 = 1._dp/MP2 
! Amplitude 
  int1=B0C0check(mF22, mF12, mS12)
  int2=C0check(mF22, mF12, mS12)
  PSOddllSLL=PSOddllSLL+chargefactor*coup1L*coup2L*coup4L*IMP2*(coup3R*int1 +         & 
&  coup3L*int2*mF1*mF2)
  PSOddllSRR=PSOddllSRR+chargefactor*coup1R*coup2R*coup4R*IMP2*(coup3L*int1 +         & 
&  coup3R*int2*mF1*mF2)
  PSOddllSRL=PSOddllSRL+chargefactor*coup1L*coup2L*coup4R*IMP2*(coup3R*int1 +         & 
&  coup3L*int2*mF1*mF2)
  PSOddllSLR=PSOddllSLR+chargefactor*coup1R*coup2R*coup4L*IMP2*(coup3L*int1 +         & 
&  coup3R*int2*mF1*mF2)
  PSOddllVRR=PSOddllVRR+0.
  PSOddllVLL=PSOddllVLL+0.
  PSOddllVRL=PSOddllVRL+0.
  PSOddllVLR=PSOddllVLR+0.
  PSOddllTLL=PSOddllTLL+0.
  PSOddllTLR=PSOddllTLR+0.
  PSOddllTRL=PSOddllTRL+0.
  PSOddllTRR=PSOddllTRR+0.
  End if 
End if 
   End Do 
  End Do 


 ! Propagator: Ah, Loop particles: hh,Fe,Fe
! Generic diagram: SFF,  InsertionOrder: 4
chargefactor = 1 
  Do i2=1,3
    Do i3=1,3
If ((Mhh2.gt.mf_l2(3)).Or.(MFe2(i2).gt.mf_l2(3)).Or.(MFe2(i3).gt.mf_l2(3))) Then
If (.not.OnlySM) Then 
coup1L = cplcFeFehhL(i2,gt3)
coup1R = cplcFeFehhR(i2,gt3)
coup2L = cplcFeFehhL(gt4,i3)
coup2R = cplcFeFehhR(gt4,i3)
coup3L = cplcFeFeAhL(i3,i2)
coup3R = cplcFeFeAhR(i3,i2)
coup4L = cplcFdFdAhL(gt2,gt1)
coup4R = cplcFdFdAhR(gt2,gt1)
! Masses in loop
mS1 = Mhh
mS12 = Mhh2
mF1 = MFe(i2)
mF12 = MFe2(i2)
mF2 = MFe(i3)
mF22 = MFe2(i3)
! Propagator and inverse propagator mass 
MP = MAh
MP2 = MAh2
IMP = 1._dp/MP  
IMP2 = 1._dp/MP2 
! Amplitude 
  int1=B0C0check(mF22, mF12, mS12)
  int2=C0check(mF22, mF12, mS12)
  PSOddllSLL=PSOddllSLL+chargefactor*coup1L*coup2L*coup4L*IMP2*(coup3R*int1 +         & 
&  coup3L*int2*mF1*mF2)
  PSOddllSRR=PSOddllSRR+chargefactor*coup1R*coup2R*coup4R*IMP2*(coup3L*int1 +         & 
&  coup3R*int2*mF1*mF2)
  PSOddllSRL=PSOddllSRL+chargefactor*coup1L*coup2L*coup4R*IMP2*(coup3R*int1 +         & 
&  coup3L*int2*mF1*mF2)
  PSOddllSLR=PSOddllSLR+chargefactor*coup1R*coup2R*coup4L*IMP2*(coup3L*int1 +         & 
&  coup3R*int2*mF1*mF2)
  PSOddllVRR=PSOddllVRR+0.
  PSOddllVLL=PSOddllVLL+0.
  PSOddllVRL=PSOddllVRL+0.
  PSOddllVLR=PSOddllVLR+0.
  PSOddllTLL=PSOddllTLL+0.
  PSOddllTLR=PSOddllTLR+0.
  PSOddllTRL=PSOddllTRL+0.
  PSOddllTRR=PSOddllTRR+0.
  End if 
End if 
   End Do 
  End Do 


 ! Propagator: Ah, Loop particles: VZ,Fe,Fe
! Generic diagram: VFF,  InsertionOrder: 4
chargefactor = 1 
  Do i2=1,3
    Do i3=1,3
If ((MVZ2.gt.mf_l2(3)).Or.(MFe2(i2).gt.mf_l2(3)).Or.(MFe2(i3).gt.mf_l2(3))) Then
If (((i2.lt.4).and.(i3.lt.4)).or.(.not.OnlySM)) Then 
coup1L = cplcFeFeVZL(i2,gt3)
coup1R = cplcFeFeVZR(i2,gt3)
coup2L = cplcFeFeVZL(gt4,i3)
coup2R = cplcFeFeVZR(gt4,i3)
coup3L = cplcFeFeAhL(i3,i2)
coup3R = cplcFeFeAhR(i3,i2)
coup4L = cplcFdFdAhL(gt2,gt1)
coup4R = cplcFdFdAhR(gt2,gt1)
! Masses in loop
mV1 = MVZ
mV12 = MVZ2
mF1 = MFe(i2)
mF12 = MFe2(i2)
mF2 = MFe(i3)
mF22 = MFe2(i3)
! Propagator and inverse propagator mass 
MP = MAh
MP2 = MAh2
IMP = 1._dp/MP  
IMP2 = 1._dp/MP2 
! Amplitude 
  int1=B0C0check(mF22, mF12, mV12)
  int2=C0check(mF22, mF12, mV12)
  PSOddllSLL=PSOddllSLL+2.*chargefactor*coup1L*coup2R*coup4L*IMP2*(coup3L*(Finite -   & 
&  2.*int1) - 2.*coup3R*int2*mF1*mF2)
  PSOddllSRR=PSOddllSRR+2.*chargefactor*coup1R*coup2L*coup4R*IMP2*(coup3R*(Finite -   & 
&  2.*int1) - 2.*coup3L*int2*mF1*mF2)
  PSOddllSRL=PSOddllSRL+2.*chargefactor*coup1L*coup2R*coup4R*IMP2*(coup3L*(Finite -   & 
&  2.*int1) - 2.*coup3R*int2*mF1*mF2)
  PSOddllSLR=PSOddllSLR+2.*chargefactor*coup1R*coup2L*coup4L*IMP2*(coup3R*(Finite -   & 
&  2.*int1) - 2.*coup3L*int2*mF1*mF2)
  PSOddllVRR=PSOddllVRR+0.
  PSOddllVLL=PSOddllVLL+0.
  PSOddllVRL=PSOddllVRL+0.
  PSOddllVLR=PSOddllVLR+0.
  PSOddllTLL=PSOddllTLL+0.
  PSOddllTLR=PSOddllTLR+0.
  PSOddllTRL=PSOddllTRL+0.
  PSOddllTRR=PSOddllTRR+0.
  End if 
End if 
   End Do 
  End Do 


 ! Propagator: Ah, Loop particles: bar[Fe],hh,Ah
! Generic diagram: FSS,  InsertionOrder: 4
chargefactor = 1 
Do i1=1,3
If ((MFe2(i1).gt.mf_l2(3)).Or.(Mhh2.gt.mf_l2(3)).Or.(MAh2.gt.mf_l2(3))) Then
If (.not.OnlySM) Then 
coup1L = cplcFeFehhL(i1,gt3)
coup1R = cplcFeFehhR(i1,gt3)
coup2L = cplcFeFeAhL(gt4,i1)
coup2R = cplcFeFeAhR(gt4,i1)
coup3 = cplAhAhhh
coup4L = cplcFdFdAhL(gt2,gt1)
coup4R = cplcFdFdAhR(gt2,gt1)
! Masses in loop
mF1 = MFe(i1)
mF12 = MFe2(i1)
mS1 = Mhh
mS12 = Mhh2
mS2 = MAh
mS22 = MAh2
! Propagator and inverse propagator mass 
MP = MAh
MP2 = MAh2
IMP = 1._dp/MP  
IMP2 = 1._dp/MP2 
! Amplitude 
  int1=C0check(mF12, mS12, mS22)
  PSOddllSLL=PSOddllSLL+chargefactor*coup1L*coup2L*coup3*coup4L*IMP2*int1*mF1
  PSOddllSRR=PSOddllSRR+chargefactor*coup1R*coup2R*coup3*coup4R*IMP2*int1*mF1
  PSOddllSRL=PSOddllSRL+chargefactor*coup1L*coup2L*coup3*coup4R*IMP2*int1*mF1
  PSOddllSLR=PSOddllSLR+chargefactor*coup1R*coup2R*coup3*coup4L*IMP2*int1*mF1
  PSOddllVRR=PSOddllVRR+0.
  PSOddllVLL=PSOddllVLL+0.
  PSOddllVRL=PSOddllVRL+0.
  PSOddllVLR=PSOddllVLR+0.
  PSOddllTLL=PSOddllTLL+0.
  PSOddllTLR=PSOddllTLR+0.
  PSOddllTRL=PSOddllTRL+0.
  PSOddllTRR=PSOddllTRR+0.
  End if 
End if 
    End Do 


 ! Propagator: Ah, Loop particles: bar[Fe],Ah,hh
! Generic diagram: FSS,  InsertionOrder: 4
chargefactor = 1 
Do i1=1,3
If ((MFe2(i1).gt.mf_l2(3)).Or.(MAh2.gt.mf_l2(3)).Or.(Mhh2.gt.mf_l2(3))) Then
If (.not.OnlySM) Then 
coup1L = cplcFeFeAhL(i1,gt3)
coup1R = cplcFeFeAhR(i1,gt3)
coup2L = cplcFeFehhL(gt4,i1)
coup2R = cplcFeFehhR(gt4,i1)
coup3 = cplAhAhhh
coup4L = cplcFdFdAhL(gt2,gt1)
coup4R = cplcFdFdAhR(gt2,gt1)
! Masses in loop
mF1 = MFe(i1)
mF12 = MFe2(i1)
mS1 = MAh
mS12 = MAh2
mS2 = Mhh
mS22 = Mhh2
! Propagator and inverse propagator mass 
MP = MAh
MP2 = MAh2
IMP = 1._dp/MP  
IMP2 = 1._dp/MP2 
! Amplitude 
  int1=C0check(mF12, mS12, mS22)
  PSOddllSLL=PSOddllSLL+chargefactor*coup1L*coup2L*coup3*coup4L*IMP2*int1*mF1
  PSOddllSRR=PSOddllSRR+chargefactor*coup1R*coup2R*coup3*coup4R*IMP2*int1*mF1
  PSOddllSRL=PSOddllSRL+chargefactor*coup1L*coup2L*coup3*coup4R*IMP2*int1*mF1
  PSOddllSLR=PSOddllSLR+chargefactor*coup1R*coup2R*coup3*coup4L*IMP2*int1*mF1
  PSOddllVRR=PSOddllVRR+0.
  PSOddllVLL=PSOddllVLL+0.
  PSOddllVRL=PSOddllVRL+0.
  PSOddllVLR=PSOddllVLR+0.
  PSOddllTLL=PSOddllTLL+0.
  PSOddllTLR=PSOddllTLR+0.
  PSOddllTRL=PSOddllTRL+0.
  PSOddllTRR=PSOddllTRR+0.
  End if 
End if 
    End Do 


 ! Propagator: Ah, Loop particles: bar[Fe],VZ,hh
! Generic diagram: FVS,  InsertionOrder: 4
chargefactor = 1 
Do i1=1,3
If ((MFe2(i1).gt.mf_l2(3)).Or.(MVZ2.gt.mf_l2(3)).Or.(Mhh2.gt.mf_l2(3))) Then
If (.not.OnlySM) Then 
coup1L = cplcFeFeVZL(i1,gt3)
coup1R = cplcFeFeVZR(i1,gt3)
coup2L = cplcFeFehhL(gt4,i1)
coup2R = cplcFeFehhR(gt4,i1)
coup3 = -cplAhhhVZ
coup4L = cplcFdFdAhL(gt2,gt1)
coup4R = cplcFdFdAhR(gt2,gt1)
! Masses in loop
mF1 = MFe(i1)
mF12 = MFe2(i1)
mV1 = MVZ
mV12 = MVZ2
mS2 = Mhh
mS22 = Mhh2
! Propagator and inverse propagator mass 
MP = MAh
MP2 = MAh2
IMP = 1._dp/MP  
IMP2 = 1._dp/MP2 
! Amplitude 
  int1=B0(0._dp, mS22, mV12)
  int2=C0check(mF12, mV12, mS22)
  PSOddllSLL=PSOddllSLL+chargefactor*coup1L*coup2L*coup3*coup4L*IMP2*(int1 +          & 
&  int2*mF12)
  PSOddllSRR=PSOddllSRR+chargefactor*coup1R*coup2R*coup3*coup4R*IMP2*(int1 +          & 
&  int2*mF12)
  PSOddllSRL=PSOddllSRL+chargefactor*coup1L*coup2L*coup3*coup4R*IMP2*(int1 +          & 
&  int2*mF12)
  PSOddllSLR=PSOddllSLR+chargefactor*coup1R*coup2R*coup3*coup4L*IMP2*(int1 +          & 
&  int2*mF12)
  PSOddllVRR=PSOddllVRR+0.
  PSOddllVLL=PSOddllVLL+0.
  PSOddllVRL=PSOddllVRL+0.
  PSOddllVLR=PSOddllVLR+0.
  PSOddllTLL=PSOddllTLL+0.
  PSOddllTLR=PSOddllTLR+0.
  PSOddllTRL=PSOddllTRL+0.
  PSOddllTRR=PSOddllTRR+0.
  End if 
End if 
    End Do 


 ! Propagator: Ah, Loop particles: bar[Fe],hh,VZ
! Generic diagram: FSV,  InsertionOrder: 4
chargefactor = 1 
Do i1=1,3
If ((MFe2(i1).gt.mf_l2(3)).Or.(Mhh2.gt.mf_l2(3)).Or.(MVZ2.gt.mf_l2(3))) Then
If (.not.OnlySM) Then 
coup1L = cplcFeFehhL(i1,gt3)
coup1R = cplcFeFehhR(i1,gt3)
coup2L = cplcFeFeVZL(gt4,i1)
coup2R = cplcFeFeVZR(gt4,i1)
coup3 = -cplAhhhVZ
coup4L = cplcFdFdAhL(gt2,gt1)
coup4R = cplcFdFdAhR(gt2,gt1)
! Masses in loop
mF1 = MFe(i1)
mF12 = MFe2(i1)
mS1 = Mhh
mS12 = Mhh2
mV2 = MVZ
mV22 = MVZ2
! Propagator and inverse propagator mass 
MP = MAh
MP2 = MAh2
IMP = 1._dp/MP  
IMP2 = 1._dp/MP2 
! Amplitude 
  int1=B0(0._dp, mS12, mV22)
  int2=C0check(mF12, mS12, mV22)
  PSOddllSLL=PSOddllSLL - 1.*chargefactor*coup1L*coup2R*coup3*coup4L*IMP2*(int1 +     & 
&  int2*mF12)
  PSOddllSRR=PSOddllSRR - 1.*chargefactor*coup1R*coup2L*coup3*coup4R*IMP2*(int1 +     & 
&  int2*mF12)
  PSOddllSRL=PSOddllSRL - 1.*chargefactor*coup1L*coup2R*coup3*coup4R*IMP2*(int1 +     & 
&  int2*mF12)
  PSOddllSLR=PSOddllSLR - 1.*chargefactor*coup1R*coup2L*coup3*coup4L*IMP2*(int1 +     & 
&  int2*mF12)
  PSOddllVRR=PSOddllVRR+0.
  PSOddllVLL=PSOddllVLL+0.
  PSOddllVRL=PSOddllVRL+0.
  PSOddllVLR=PSOddllVLR+0.
  PSOddllTLL=PSOddllTLL+0.
  PSOddllTLR=PSOddllTLR+0.
  PSOddllTRL=PSOddllTRL+0.
  PSOddllTRR=PSOddllTRR+0.
  End if 
End if 
    End Do 


 ! -- hh - Penguins            
! Propagator: hh, Loop particles: Ah,Fd,Fd
! Generic diagram: SFF,  InsertionOrder: 1
chargefactor = 1 
  Do i2=1,3
    Do i3=1,3
If ((MAh2.gt.mf_l2(3)).Or.(MFd2(i2).gt.mf_l2(3)).Or.(MFd2(i3).gt.mf_l2(3))) Then
If (.not.OnlySM) Then 
coup1L = cplcFdFdAhL(i2,gt1)
coup1R = cplcFdFdAhR(i2,gt1)
coup2L = cplcFdFdAhL(gt2,i3)
coup2R = cplcFdFdAhR(gt2,i3)
coup3L = cplcFdFdhhL(i3,i2)
coup3R = cplcFdFdhhR(i3,i2)
coup4L = cplcFeFehhL(gt4,gt3)
coup4R = cplcFeFehhR(gt4,gt3)
! Masses in loop
mS1 = MAh
mS12 = MAh2
mF1 = MFd(i2)
mF12 = MFd2(i2)
mF2 = MFd(i3)
mF22 = MFd2(i3)
! Propagator and inverse propagator mass 
MP = Mhh
MP2 = Mhh2
IMP = 1._dp/MP  
IMP2 = 1._dp/MP2 
! Amplitude 
  int1=B0C0check(mF22, mF12, mS12)
  int2=C0check(mF22, mF12, mS12)
  PSOddllSLL=PSOddllSLL+chargefactor*coup1L*coup2L*coup4L*IMP2*(coup3R*int1 +         & 
&  coup3L*int2*mF1*mF2)
  PSOddllSRR=PSOddllSRR+chargefactor*coup1R*coup2R*coup4R*IMP2*(coup3L*int1 +         & 
&  coup3R*int2*mF1*mF2)
  PSOddllSRL=PSOddllSRL+chargefactor*coup1R*coup2R*coup4L*IMP2*(coup3L*int1 +         & 
&  coup3R*int2*mF1*mF2)
  PSOddllSLR=PSOddllSLR+chargefactor*coup1L*coup2L*coup4R*IMP2*(coup3R*int1 +         & 
&  coup3L*int2*mF1*mF2)
  PSOddllVRR=PSOddllVRR+0.
  PSOddllVLL=PSOddllVLL+0.
  PSOddllVRL=PSOddllVRL+0.
  PSOddllVLR=PSOddllVLR+0.
  PSOddllTLL=PSOddllTLL+0.
  PSOddllTLR=PSOddllTLR+0.
  PSOddllTRL=PSOddllTRL+0.
  PSOddllTRR=PSOddllTRR+0.
  End if 
End if 
   End Do 
  End Do 


 ! Propagator: hh, Loop particles: hh,Fd,Fd
! Generic diagram: SFF,  InsertionOrder: 1
chargefactor = 1 
  Do i2=1,3
    Do i3=1,3
If ((Mhh2.gt.mf_l2(3)).Or.(MFd2(i2).gt.mf_l2(3)).Or.(MFd2(i3).gt.mf_l2(3))) Then
If (.not.OnlySM) Then 
coup1L = cplcFdFdhhL(i2,gt1)
coup1R = cplcFdFdhhR(i2,gt1)
coup2L = cplcFdFdhhL(gt2,i3)
coup2R = cplcFdFdhhR(gt2,i3)
coup3L = cplcFdFdhhL(i3,i2)
coup3R = cplcFdFdhhR(i3,i2)
coup4L = cplcFeFehhL(gt4,gt3)
coup4R = cplcFeFehhR(gt4,gt3)
! Masses in loop
mS1 = Mhh
mS12 = Mhh2
mF1 = MFd(i2)
mF12 = MFd2(i2)
mF2 = MFd(i3)
mF22 = MFd2(i3)
! Propagator and inverse propagator mass 
MP = Mhh
MP2 = Mhh2
IMP = 1._dp/MP  
IMP2 = 1._dp/MP2 
! Amplitude 
  int1=B0C0check(mF22, mF12, mS12)
  int2=C0check(mF22, mF12, mS12)
  PSOddllSLL=PSOddllSLL+chargefactor*coup1L*coup2L*coup4L*IMP2*(coup3R*int1 +         & 
&  coup3L*int2*mF1*mF2)
  PSOddllSRR=PSOddllSRR+chargefactor*coup1R*coup2R*coup4R*IMP2*(coup3L*int1 +         & 
&  coup3R*int2*mF1*mF2)
  PSOddllSRL=PSOddllSRL+chargefactor*coup1R*coup2R*coup4L*IMP2*(coup3L*int1 +         & 
&  coup3R*int2*mF1*mF2)
  PSOddllSLR=PSOddllSLR+chargefactor*coup1L*coup2L*coup4R*IMP2*(coup3R*int1 +         & 
&  coup3L*int2*mF1*mF2)
  PSOddllVRR=PSOddllVRR+0.
  PSOddllVLL=PSOddllVLL+0.
  PSOddllVRL=PSOddllVRL+0.
  PSOddllVLR=PSOddllVLR+0.
  PSOddllTLL=PSOddllTLL+0.
  PSOddllTLR=PSOddllTLR+0.
  PSOddllTRL=PSOddllTRL+0.
  PSOddllTRR=PSOddllTRR+0.
  End if 
End if 
   End Do 
  End Do 


 ! Propagator: hh, Loop particles: Hp,Fu,Fu
! Generic diagram: SFF,  InsertionOrder: 1
chargefactor = 1 
  Do i2=1,3
    Do i3=1,3
If ((MHp2.gt.mf_l2(3)).Or.(MFu2(i2).gt.mf_l2(3)).Or.(MFu2(i3).gt.mf_l2(3))) Then
If (.not.OnlySM) Then 
coup1L = cplcFuFdHpL(i2,gt1)
coup1R = cplcFuFdHpR(i2,gt1)
coup2L = cplcFdFucHpL(gt2,i3)
coup2R = cplcFdFucHpR(gt2,i3)
coup3L = cplcFuFuhhL(i3,i2)
coup3R = cplcFuFuhhR(i3,i2)
coup4L = cplcFeFehhL(gt4,gt3)
coup4R = cplcFeFehhR(gt4,gt3)
! Masses in loop
mS1 = MHp
mS12 = MHp2
mF1 = MFu(i2)
mF12 = MFu2(i2)
mF2 = MFu(i3)
mF22 = MFu2(i3)
! Propagator and inverse propagator mass 
MP = Mhh
MP2 = Mhh2
IMP = 1._dp/MP  
IMP2 = 1._dp/MP2 
! Amplitude 
  int1=B0C0check(mF22, mF12, mS12)
  int2=C0check(mF22, mF12, mS12)
  PSOddllSLL=PSOddllSLL+chargefactor*coup1L*coup2L*coup4L*IMP2*(coup3R*int1 +         & 
&  coup3L*int2*mF1*mF2)
  PSOddllSRR=PSOddllSRR+chargefactor*coup1R*coup2R*coup4R*IMP2*(coup3L*int1 +         & 
&  coup3R*int2*mF1*mF2)
  PSOddllSRL=PSOddllSRL+chargefactor*coup1R*coup2R*coup4L*IMP2*(coup3L*int1 +         & 
&  coup3R*int2*mF1*mF2)
  PSOddllSLR=PSOddllSLR+chargefactor*coup1L*coup2L*coup4R*IMP2*(coup3R*int1 +         & 
&  coup3L*int2*mF1*mF2)
  PSOddllVRR=PSOddllVRR+0.
  PSOddllVLL=PSOddllVLL+0.
  PSOddllVRL=PSOddllVRL+0.
  PSOddllVLR=PSOddllVLR+0.
  PSOddllTLL=PSOddllTLL+0.
  PSOddllTLR=PSOddllTLR+0.
  PSOddllTRL=PSOddllTRL+0.
  PSOddllTRR=PSOddllTRR+0.
  End if 
End if 
   End Do 
  End Do 


 ! Propagator: hh, Loop particles: VWp,Fu,Fu
! Generic diagram: VFF,  InsertionOrder: 1
chargefactor = 1 
  Do i2=1,3
    Do i3=1,3
If ((MVWp2.gt.mf_l2(3)).Or.(MFu2(i2).gt.mf_l2(3)).Or.(MFu2(i3).gt.mf_l2(3))) Then
If (.not.OnlySM) Then 
coup1L = cplcFuFdVWpL(i2,gt1)
coup1R = cplcFuFdVWpR(i2,gt1)
coup2L = cplcFdFucVWpL(gt2,i3)
coup2R = cplcFdFucVWpR(gt2,i3)
coup3L = cplcFuFuhhL(i3,i2)
coup3R = cplcFuFuhhR(i3,i2)
coup4L = cplcFeFehhL(gt4,gt3)
coup4R = cplcFeFehhR(gt4,gt3)
! Masses in loop
mV1 = MVWp
mV12 = MVWp2
mF1 = MFu(i2)
mF12 = MFu2(i2)
mF2 = MFu(i3)
mF22 = MFu2(i3)
! Propagator and inverse propagator mass 
MP = Mhh
MP2 = Mhh2
IMP = 1._dp/MP  
IMP2 = 1._dp/MP2 
! Amplitude 
  int1=B0C0check(mF22, mF12, mV12)
  int2=C0check(mF22, mF12, mV12)
  PSOddllSLL=PSOddllSLL+2.*chargefactor*coup1L*coup2R*coup4L*IMP2*(coup3L*(Finite -   & 
&  2.*int1) - 2.*coup3R*int2*mF1*mF2)
  PSOddllSRR=PSOddllSRR+2.*chargefactor*coup1R*coup2L*coup4R*IMP2*(coup3R*(Finite -   & 
&  2.*int1) - 2.*coup3L*int2*mF1*mF2)
  PSOddllSRL=PSOddllSRL+2.*chargefactor*coup1R*coup2L*coup4L*IMP2*(coup3R*(Finite -   & 
&  2.*int1) - 2.*coup3L*int2*mF1*mF2)
  PSOddllSLR=PSOddllSLR+2.*chargefactor*coup1L*coup2R*coup4R*IMP2*(coup3L*(Finite -   & 
&  2.*int1) - 2.*coup3R*int2*mF1*mF2)
  PSOddllVRR=PSOddllVRR+0.
  PSOddllVLL=PSOddllVLL+0.
  PSOddllVRL=PSOddllVRL+0.
  PSOddllVLR=PSOddllVLR+0.
  PSOddllTLL=PSOddllTLL+0.
  PSOddllTLR=PSOddllTLR+0.
  PSOddllTRL=PSOddllTRL+0.
  PSOddllTRR=PSOddllTRR+0.
  End if 
End if 
   End Do 
  End Do 


 ! Propagator: hh, Loop particles: VZ,Fd,Fd
! Generic diagram: VFF,  InsertionOrder: 1
chargefactor = 1 
  Do i2=1,3
    Do i3=1,3
If ((MVZ2.gt.mf_l2(3)).Or.(MFd2(i2).gt.mf_l2(3)).Or.(MFd2(i3).gt.mf_l2(3))) Then
If (.not.OnlySM) Then 
coup1L = cplcFdFdVZL(i2,gt1)
coup1R = cplcFdFdVZR(i2,gt1)
coup2L = cplcFdFdVZL(gt2,i3)
coup2R = cplcFdFdVZR(gt2,i3)
coup3L = cplcFdFdhhL(i3,i2)
coup3R = cplcFdFdhhR(i3,i2)
coup4L = cplcFeFehhL(gt4,gt3)
coup4R = cplcFeFehhR(gt4,gt3)
! Masses in loop
mV1 = MVZ
mV12 = MVZ2
mF1 = MFd(i2)
mF12 = MFd2(i2)
mF2 = MFd(i3)
mF22 = MFd2(i3)
! Propagator and inverse propagator mass 
MP = Mhh
MP2 = Mhh2
IMP = 1._dp/MP  
IMP2 = 1._dp/MP2 
! Amplitude 
  int1=B0C0check(mF22, mF12, mV12)
  int2=C0check(mF22, mF12, mV12)
  PSOddllSLL=PSOddllSLL+2.*chargefactor*coup1L*coup2R*coup4L*IMP2*(coup3L*(Finite -   & 
&  2.*int1) - 2.*coup3R*int2*mF1*mF2)
  PSOddllSRR=PSOddllSRR+2.*chargefactor*coup1R*coup2L*coup4R*IMP2*(coup3R*(Finite -   & 
&  2.*int1) - 2.*coup3L*int2*mF1*mF2)
  PSOddllSRL=PSOddllSRL+2.*chargefactor*coup1R*coup2L*coup4L*IMP2*(coup3R*(Finite -   & 
&  2.*int1) - 2.*coup3L*int2*mF1*mF2)
  PSOddllSLR=PSOddllSLR+2.*chargefactor*coup1L*coup2R*coup4R*IMP2*(coup3L*(Finite -   & 
&  2.*int1) - 2.*coup3R*int2*mF1*mF2)
  PSOddllVRR=PSOddllVRR+0.
  PSOddllVLL=PSOddllVLL+0.
  PSOddllVRL=PSOddllVRL+0.
  PSOddllVLR=PSOddllVLR+0.
  PSOddllTLL=PSOddllTLL+0.
  PSOddllTLR=PSOddllTLR+0.
  PSOddllTRL=PSOddllTRL+0.
  PSOddllTRR=PSOddllTRR+0.
  End if 
End if 
   End Do 
  End Do 


 ! Propagator: hh, Loop particles: bar[Fd],Ah,Ah
! Generic diagram: FSS,  InsertionOrder: 1
chargefactor = 1 
Do i1=1,3
If ((MFd2(i1).gt.mf_l2(3)).Or.(MAh2.gt.mf_l2(3)).Or.(MAh2.gt.mf_l2(3))) Then
If (.not.OnlySM) Then 
coup1L = cplcFdFdAhL(i1,gt1)
coup1R = cplcFdFdAhR(i1,gt1)
coup2L = cplcFdFdAhL(gt2,i1)
coup2R = cplcFdFdAhR(gt2,i1)
coup3 = cplAhAhhh
coup4L = cplcFeFehhL(gt4,gt3)
coup4R = cplcFeFehhR(gt4,gt3)
! Masses in loop
mF1 = MFd(i1)
mF12 = MFd2(i1)
mS1 = MAh
mS12 = MAh2
mS2 = MAh
mS22 = MAh2
! Propagator and inverse propagator mass 
MP = Mhh
MP2 = Mhh2
IMP = 1._dp/MP  
IMP2 = 1._dp/MP2 
! Amplitude 
  int1=C0check(mF12, mS22, mS12)
  PSOddllSLL=PSOddllSLL+chargefactor*coup1L*coup2L*coup3*coup4L*IMP2*int1*mF1
  PSOddllSRR=PSOddllSRR+chargefactor*coup1R*coup2R*coup3*coup4R*IMP2*int1*mF1
  PSOddllSRL=PSOddllSRL+chargefactor*coup1R*coup2R*coup3*coup4L*IMP2*int1*mF1
  PSOddllSLR=PSOddllSLR+chargefactor*coup1L*coup2L*coup3*coup4R*IMP2*int1*mF1
  PSOddllVRR=PSOddllVRR+0.
  PSOddllVLL=PSOddllVLL+0.
  PSOddllVRL=PSOddllVRL+0.
  PSOddllVLR=PSOddllVLR+0.
  PSOddllTLL=PSOddllTLL+0.
  PSOddllTLR=PSOddllTLR+0.
  PSOddllTRL=PSOddllTRL+0.
  PSOddllTRR=PSOddllTRR+0.
  End if 
End if 
    End Do 


 ! Propagator: hh, Loop particles: bar[Fd],VZ,Ah
! Generic diagram: FVS,  InsertionOrder: 1
chargefactor = 1 
Do i1=1,3
If ((MFd2(i1).gt.mf_l2(3)).Or.(MVZ2.gt.mf_l2(3)).Or.(MAh2.gt.mf_l2(3))) Then
If (.not.OnlySM) Then 
coup1L = cplcFdFdVZL(i1,gt1)
coup1R = cplcFdFdVZR(i1,gt1)
coup2L = cplcFdFdAhL(gt2,i1)
coup2R = cplcFdFdAhR(gt2,i1)
coup3 = cplAhhhVZ
coup4L = cplcFeFehhL(gt4,gt3)
coup4R = cplcFeFehhR(gt4,gt3)
! Masses in loop
mF1 = MFd(i1)
mF12 = MFd2(i1)
mV1 = MVZ
mV12 = MVZ2
mS2 = MAh
mS22 = MAh2
! Propagator and inverse propagator mass 
MP = Mhh
MP2 = Mhh2
IMP = 1._dp/MP  
IMP2 = 1._dp/MP2 
! Amplitude 
  int1=B0(0._dp, mS22, mV12)
  int2=C0check(mF12, mS22, mV12)
  PSOddllSLL=PSOddllSLL+chargefactor*coup1L*coup2L*coup3*coup4L*IMP2*(int1 +          & 
&  int2*mF12)
  PSOddllSRR=PSOddllSRR+chargefactor*coup1R*coup2R*coup3*coup4R*IMP2*(int1 +          & 
&  int2*mF12)
  PSOddllSRL=PSOddllSRL+chargefactor*coup1R*coup2R*coup3*coup4L*IMP2*(int1 +          & 
&  int2*mF12)
  PSOddllSLR=PSOddllSLR+chargefactor*coup1L*coup2L*coup3*coup4R*IMP2*(int1 +          & 
&  int2*mF12)
  PSOddllVRR=PSOddllVRR+0.
  PSOddllVLL=PSOddllVLL+0.
  PSOddllVRL=PSOddllVRL+0.
  PSOddllVLR=PSOddllVLR+0.
  PSOddllTLL=PSOddllTLL+0.
  PSOddllTLR=PSOddllTLR+0.
  PSOddllTRL=PSOddllTRL+0.
  PSOddllTRR=PSOddllTRR+0.
  End if 
End if 
    End Do 


 ! Propagator: hh, Loop particles: bar[Fd],hh,hh
! Generic diagram: FSS,  InsertionOrder: 1
chargefactor = 1 
Do i1=1,3
If ((MFd2(i1).gt.mf_l2(3)).Or.(Mhh2.gt.mf_l2(3)).Or.(Mhh2.gt.mf_l2(3))) Then
If (.not.OnlySM) Then 
coup1L = cplcFdFdhhL(i1,gt1)
coup1R = cplcFdFdhhR(i1,gt1)
coup2L = cplcFdFdhhL(gt2,i1)
coup2R = cplcFdFdhhR(gt2,i1)
coup3 = cplhhhhhh
coup4L = cplcFeFehhL(gt4,gt3)
coup4R = cplcFeFehhR(gt4,gt3)
! Masses in loop
mF1 = MFd(i1)
mF12 = MFd2(i1)
mS1 = Mhh
mS12 = Mhh2
mS2 = Mhh
mS22 = Mhh2
! Propagator and inverse propagator mass 
MP = Mhh
MP2 = Mhh2
IMP = 1._dp/MP  
IMP2 = 1._dp/MP2 
! Amplitude 
  int1=C0check(mF12, mS22, mS12)
  PSOddllSLL=PSOddllSLL+chargefactor*coup1L*coup2L*coup3*coup4L*IMP2*int1*mF1
  PSOddllSRR=PSOddllSRR+chargefactor*coup1R*coup2R*coup3*coup4R*IMP2*int1*mF1
  PSOddllSRL=PSOddllSRL+chargefactor*coup1R*coup2R*coup3*coup4L*IMP2*int1*mF1
  PSOddllSLR=PSOddllSLR+chargefactor*coup1L*coup2L*coup3*coup4R*IMP2*int1*mF1
  PSOddllVRR=PSOddllVRR+0.
  PSOddllVLL=PSOddllVLL+0.
  PSOddllVRL=PSOddllVRL+0.
  PSOddllVLR=PSOddllVLR+0.
  PSOddllTLL=PSOddllTLL+0.
  PSOddllTLR=PSOddllTLR+0.
  PSOddllTRL=PSOddllTRL+0.
  PSOddllTRR=PSOddllTRR+0.
  End if 
End if 
    End Do 


 ! Propagator: hh, Loop particles: bar[Fd],Ah,VZ
! Generic diagram: FSV,  InsertionOrder: 1
chargefactor = 1 
Do i1=1,3
If ((MFd2(i1).gt.mf_l2(3)).Or.(MAh2.gt.mf_l2(3)).Or.(MVZ2.gt.mf_l2(3))) Then
If (.not.OnlySM) Then 
coup1L = cplcFdFdAhL(i1,gt1)
coup1R = cplcFdFdAhR(i1,gt1)
coup2L = cplcFdFdVZL(gt2,i1)
coup2R = cplcFdFdVZR(gt2,i1)
coup3 = cplAhhhVZ
coup4L = cplcFeFehhL(gt4,gt3)
coup4R = cplcFeFehhR(gt4,gt3)
! Masses in loop
mF1 = MFd(i1)
mF12 = MFd2(i1)
mS1 = MAh
mS12 = MAh2
mV2 = MVZ
mV22 = MVZ2
! Propagator and inverse propagator mass 
MP = Mhh
MP2 = Mhh2
IMP = 1._dp/MP  
IMP2 = 1._dp/MP2 
! Amplitude 
  int1=B0(0._dp, mS12, mV22)
  int2=C0check(mF12, mV22, mS12)
  PSOddllSLL=PSOddllSLL - 1.*chargefactor*coup1L*coup2R*coup3*coup4L*IMP2*(int1 +     & 
&  int2*mF12)
  PSOddllSRR=PSOddllSRR - 1.*chargefactor*coup1R*coup2L*coup3*coup4R*IMP2*(int1 +     & 
&  int2*mF12)
  PSOddllSRL=PSOddllSRL - 1.*chargefactor*coup1R*coup2L*coup3*coup4L*IMP2*(int1 +     & 
&  int2*mF12)
  PSOddllSLR=PSOddllSLR - 1.*chargefactor*coup1L*coup2R*coup3*coup4R*IMP2*(int1 +     & 
&  int2*mF12)
  PSOddllVRR=PSOddllVRR+0.
  PSOddllVLL=PSOddllVLL+0.
  PSOddllVRL=PSOddllVRL+0.
  PSOddllVLR=PSOddllVLR+0.
  PSOddllTLL=PSOddllTLL+0.
  PSOddllTLR=PSOddllTLR+0.
  PSOddllTRL=PSOddllTRL+0.
  PSOddllTRR=PSOddllTRR+0.
  End if 
End if 
    End Do 


 ! Propagator: hh, Loop particles: bar[Fd],VZ,VZ
! Generic diagram: FVV,  InsertionOrder: 1
chargefactor = 1 
Do i1=1,3
If ((MFd2(i1).gt.mf_l2(3)).Or.(MVZ2.gt.mf_l2(3)).Or.(MVZ2.gt.mf_l2(3))) Then
If (.not.OnlySM) Then 
coup1L = cplcFdFdVZL(i1,gt1)
coup1R = cplcFdFdVZR(i1,gt1)
coup2L = cplcFdFdVZL(gt2,i1)
coup2R = cplcFdFdVZR(gt2,i1)
coup3 = cplhhVZVZ
coup4L = cplcFeFehhL(gt4,gt3)
coup4R = cplcFeFehhR(gt4,gt3)
! Masses in loop
mF1 = MFd(i1)
mF12 = MFd2(i1)
mV1 = MVZ
mV12 = MVZ2
mV2 = MVZ
mV22 = MVZ2
! Propagator and inverse propagator mass 
MP = Mhh
MP2 = Mhh2
IMP = 1._dp/MP  
IMP2 = 1._dp/MP2 
! Amplitude 
  int1=C0check(mF12, mV22, mV12)
  PSOddllSLL=PSOddllSLL+4.*chargefactor*coup1L*coup2R*coup3*coup4L*IMP2*int1*mF1
  PSOddllSRR=PSOddllSRR+4.*chargefactor*coup1R*coup2L*coup3*coup4R*IMP2*int1*mF1
  PSOddllSRL=PSOddllSRL+4.*chargefactor*coup1R*coup2L*coup3*coup4L*IMP2*int1*mF1
  PSOddllSLR=PSOddllSLR+4.*chargefactor*coup1L*coup2R*coup3*coup4R*IMP2*int1*mF1
  PSOddllVRR=PSOddllVRR+0.
  PSOddllVLL=PSOddllVLL+0.
  PSOddllVRL=PSOddllVRL+0.
  PSOddllVLR=PSOddllVLR+0.
  PSOddllTLL=PSOddllTLL+0.
  PSOddllTLR=PSOddllTLR+0.
  PSOddllTRL=PSOddllTRL+0.
  PSOddllTRR=PSOddllTRR+0.
  End if 
End if 
    End Do 


 ! Propagator: hh, Loop particles: bar[Fu],conj[Hp],conj[Hp]
! Generic diagram: FSS,  InsertionOrder: 1
chargefactor = 1 
Do i1=1,3
If ((MFu2(i1).gt.mf_l2(3)).Or.(MHp2.gt.mf_l2(3)).Or.(MHp2.gt.mf_l2(3))) Then
If (.not.OnlySM) Then 
coup1L = cplcFuFdHpL(i1,gt1)
coup1R = cplcFuFdHpR(i1,gt1)
coup2L = cplcFdFucHpL(gt2,i1)
coup2R = cplcFdFucHpR(gt2,i1)
coup3 = cplhhHpcHp
coup4L = cplcFeFehhL(gt4,gt3)
coup4R = cplcFeFehhR(gt4,gt3)
! Masses in loop
mF1 = MFu(i1)
mF12 = MFu2(i1)
mS1 = MHp
mS12 = MHp2
mS2 = MHp
mS22 = MHp2
! Propagator and inverse propagator mass 
MP = Mhh
MP2 = Mhh2
IMP = 1._dp/MP  
IMP2 = 1._dp/MP2 
! Amplitude 
  int1=C0check(mF12, mS22, mS12)
  PSOddllSLL=PSOddllSLL+chargefactor*coup1L*coup2L*coup3*coup4L*IMP2*int1*mF1
  PSOddllSRR=PSOddllSRR+chargefactor*coup1R*coup2R*coup3*coup4R*IMP2*int1*mF1
  PSOddllSRL=PSOddllSRL+chargefactor*coup1R*coup2R*coup3*coup4L*IMP2*int1*mF1
  PSOddllSLR=PSOddllSLR+chargefactor*coup1L*coup2L*coup3*coup4R*IMP2*int1*mF1
  PSOddllVRR=PSOddllVRR+0.
  PSOddllVLL=PSOddllVLL+0.
  PSOddllVRL=PSOddllVRL+0.
  PSOddllVLR=PSOddllVLR+0.
  PSOddllTLL=PSOddllTLL+0.
  PSOddllTLR=PSOddllTLR+0.
  PSOddllTRL=PSOddllTRL+0.
  PSOddllTRR=PSOddllTRR+0.
  End if 
End if 
    End Do 


 ! Propagator: hh, Loop particles: bar[Fu],conj[VWp],conj[Hp]
! Generic diagram: FVS,  InsertionOrder: 1
chargefactor = 1 
Do i1=1,3
If ((MFu2(i1).gt.mf_l2(3)).Or.(MVWp2.gt.mf_l2(3)).Or.(MHp2.gt.mf_l2(3))) Then
If (.not.OnlySM) Then 
coup1L = cplcFuFdVWpL(i1,gt1)
coup1R = cplcFuFdVWpR(i1,gt1)
coup2L = cplcFdFucHpL(gt2,i1)
coup2R = cplcFdFucHpR(gt2,i1)
coup3 = -cplhhHpcVWp
coup4L = cplcFeFehhL(gt4,gt3)
coup4R = cplcFeFehhR(gt4,gt3)
! Masses in loop
mF1 = MFu(i1)
mF12 = MFu2(i1)
mV1 = MVWp
mV12 = MVWp2
mS2 = MHp
mS22 = MHp2
! Propagator and inverse propagator mass 
MP = Mhh
MP2 = Mhh2
IMP = 1._dp/MP  
IMP2 = 1._dp/MP2 
! Amplitude 
  int1=B0(0._dp, mS22, mV12)
  int2=C0check(mF12, mS22, mV12)
  PSOddllSLL=PSOddllSLL+chargefactor*coup1L*coup2L*coup3*coup4L*IMP2*(int1 +          & 
&  int2*mF12)
  PSOddllSRR=PSOddllSRR+chargefactor*coup1R*coup2R*coup3*coup4R*IMP2*(int1 +          & 
&  int2*mF12)
  PSOddllSRL=PSOddllSRL+chargefactor*coup1R*coup2R*coup3*coup4L*IMP2*(int1 +          & 
&  int2*mF12)
  PSOddllSLR=PSOddllSLR+chargefactor*coup1L*coup2L*coup3*coup4R*IMP2*(int1 +          & 
&  int2*mF12)
  PSOddllVRR=PSOddllVRR+0.
  PSOddllVLL=PSOddllVLL+0.
  PSOddllVRL=PSOddllVRL+0.
  PSOddllVLR=PSOddllVLR+0.
  PSOddllTLL=PSOddllTLL+0.
  PSOddllTLR=PSOddllTLR+0.
  PSOddllTRL=PSOddllTRL+0.
  PSOddllTRR=PSOddllTRR+0.
  End if 
End if 
    End Do 


 ! Propagator: hh, Loop particles: bar[Fu],conj[Hp],conj[VWp]
! Generic diagram: FSV,  InsertionOrder: 1
chargefactor = 1 
Do i1=1,3
If ((MFu2(i1).gt.mf_l2(3)).Or.(MHp2.gt.mf_l2(3)).Or.(MVWp2.gt.mf_l2(3))) Then
If (.not.OnlySM) Then 
coup1L = cplcFuFdHpL(i1,gt1)
coup1R = cplcFuFdHpR(i1,gt1)
coup2L = cplcFdFucVWpL(gt2,i1)
coup2R = cplcFdFucVWpR(gt2,i1)
coup3 = -cplhhcHpVWp
coup4L = cplcFeFehhL(gt4,gt3)
coup4R = cplcFeFehhR(gt4,gt3)
! Masses in loop
mF1 = MFu(i1)
mF12 = MFu2(i1)
mS1 = MHp
mS12 = MHp2
mV2 = MVWp
mV22 = MVWp2
! Propagator and inverse propagator mass 
MP = Mhh
MP2 = Mhh2
IMP = 1._dp/MP  
IMP2 = 1._dp/MP2 
! Amplitude 
  int1=B0(0._dp, mS12, mV22)
  int2=C0check(mF12, mV22, mS12)
  PSOddllSLL=PSOddllSLL - 1.*chargefactor*coup1L*coup2R*coup3*coup4L*IMP2*(int1 +     & 
&  int2*mF12)
  PSOddllSRR=PSOddllSRR - 1.*chargefactor*coup1R*coup2L*coup3*coup4R*IMP2*(int1 +     & 
&  int2*mF12)
  PSOddllSRL=PSOddllSRL - 1.*chargefactor*coup1R*coup2L*coup3*coup4L*IMP2*(int1 +     & 
&  int2*mF12)
  PSOddllSLR=PSOddllSLR - 1.*chargefactor*coup1L*coup2R*coup3*coup4R*IMP2*(int1 +     & 
&  int2*mF12)
  PSOddllVRR=PSOddllVRR+0.
  PSOddllVLL=PSOddllVLL+0.
  PSOddllVRL=PSOddllVRL+0.
  PSOddllVLR=PSOddllVLR+0.
  PSOddllTLL=PSOddllTLL+0.
  PSOddllTLR=PSOddllTLR+0.
  PSOddllTRL=PSOddllTRL+0.
  PSOddllTRR=PSOddllTRR+0.
  End if 
End if 
    End Do 


 ! Propagator: hh, Loop particles: bar[Fu],conj[VWp],conj[VWp]
! Generic diagram: FVV,  InsertionOrder: 1
chargefactor = 1 
Do i1=1,3
If ((MFu2(i1).gt.mf_l2(3)).Or.(MVWp2.gt.mf_l2(3)).Or.(MVWp2.gt.mf_l2(3))) Then
If (.not.OnlySM) Then 
coup1L = cplcFuFdVWpL(i1,gt1)
coup1R = cplcFuFdVWpR(i1,gt1)
coup2L = cplcFdFucVWpL(gt2,i1)
coup2R = cplcFdFucVWpR(gt2,i1)
coup3 = cplhhcVWpVWp
coup4L = cplcFeFehhL(gt4,gt3)
coup4R = cplcFeFehhR(gt4,gt3)
! Masses in loop
mF1 = MFu(i1)
mF12 = MFu2(i1)
mV1 = MVWp
mV12 = MVWp2
mV2 = MVWp
mV22 = MVWp2
! Propagator and inverse propagator mass 
MP = Mhh
MP2 = Mhh2
IMP = 1._dp/MP  
IMP2 = 1._dp/MP2 
! Amplitude 
  int1=C0check(mF12, mV22, mV12)
  PSOddllSLL=PSOddllSLL+4.*chargefactor*coup1L*coup2R*coup3*coup4L*IMP2*int1*mF1
  PSOddllSRR=PSOddllSRR+4.*chargefactor*coup1R*coup2L*coup3*coup4R*IMP2*int1*mF1
  PSOddllSRL=PSOddllSRL+4.*chargefactor*coup1R*coup2L*coup3*coup4L*IMP2*int1*mF1
  PSOddllSLR=PSOddllSLR+4.*chargefactor*coup1L*coup2R*coup3*coup4R*IMP2*int1*mF1
  PSOddllVRR=PSOddllVRR+0.
  PSOddllVLL=PSOddllVLL+0.
  PSOddllVRL=PSOddllVRL+0.
  PSOddllVLR=PSOddllVLR+0.
  PSOddllTLL=PSOddllTLL+0.
  PSOddllTLR=PSOddllTLR+0.
  PSOddllTRL=PSOddllTRL+0.
  PSOddllTRR=PSOddllTRR+0.
  End if 
End if 
    End Do 


 ! Propagator: hh, Loop particles: Ah,Fe,Fe
! Generic diagram: SFF,  InsertionOrder: 4
chargefactor = 1 
  Do i2=1,3
    Do i3=1,3
If ((MAh2.gt.mf_l2(3)).Or.(MFe2(i2).gt.mf_l2(3)).Or.(MFe2(i3).gt.mf_l2(3))) Then
If (.not.OnlySM) Then 
coup1L = cplcFeFeAhL(i2,gt3)
coup1R = cplcFeFeAhR(i2,gt3)
coup2L = cplcFeFeAhL(gt4,i3)
coup2R = cplcFeFeAhR(gt4,i3)
coup3L = cplcFeFehhL(i3,i2)
coup3R = cplcFeFehhR(i3,i2)
coup4L = cplcFdFdhhL(gt2,gt1)
coup4R = cplcFdFdhhR(gt2,gt1)
! Masses in loop
mS1 = MAh
mS12 = MAh2
mF1 = MFe(i2)
mF12 = MFe2(i2)
mF2 = MFe(i3)
mF22 = MFe2(i3)
! Propagator and inverse propagator mass 
MP = Mhh
MP2 = Mhh2
IMP = 1._dp/MP  
IMP2 = 1._dp/MP2 
! Amplitude 
  int1=B0C0check(mF22, mF12, mS12)
  int2=C0check(mF22, mF12, mS12)
  PSOddllSLL=PSOddllSLL+chargefactor*coup1L*coup2L*coup4L*IMP2*(coup3R*int1 +         & 
&  coup3L*int2*mF1*mF2)
  PSOddllSRR=PSOddllSRR+chargefactor*coup1R*coup2R*coup4R*IMP2*(coup3L*int1 +         & 
&  coup3R*int2*mF1*mF2)
  PSOddllSRL=PSOddllSRL+chargefactor*coup1L*coup2L*coup4R*IMP2*(coup3R*int1 +         & 
&  coup3L*int2*mF1*mF2)
  PSOddllSLR=PSOddllSLR+chargefactor*coup1R*coup2R*coup4L*IMP2*(coup3L*int1 +         & 
&  coup3R*int2*mF1*mF2)
  PSOddllVRR=PSOddllVRR+0.
  PSOddllVLL=PSOddllVLL+0.
  PSOddllVRL=PSOddllVRL+0.
  PSOddllVLR=PSOddllVLR+0.
  PSOddllTLL=PSOddllTLL+0.
  PSOddllTLR=PSOddllTLR+0.
  PSOddllTRL=PSOddllTRL+0.
  PSOddllTRR=PSOddllTRR+0.
  End if 
End if 
   End Do 
  End Do 


 ! Propagator: hh, Loop particles: hh,Fe,Fe
! Generic diagram: SFF,  InsertionOrder: 4
chargefactor = 1 
  Do i2=1,3
    Do i3=1,3
If ((Mhh2.gt.mf_l2(3)).Or.(MFe2(i2).gt.mf_l2(3)).Or.(MFe2(i3).gt.mf_l2(3))) Then
If (.not.OnlySM) Then 
coup1L = cplcFeFehhL(i2,gt3)
coup1R = cplcFeFehhR(i2,gt3)
coup2L = cplcFeFehhL(gt4,i3)
coup2R = cplcFeFehhR(gt4,i3)
coup3L = cplcFeFehhL(i3,i2)
coup3R = cplcFeFehhR(i3,i2)
coup4L = cplcFdFdhhL(gt2,gt1)
coup4R = cplcFdFdhhR(gt2,gt1)
! Masses in loop
mS1 = Mhh
mS12 = Mhh2
mF1 = MFe(i2)
mF12 = MFe2(i2)
mF2 = MFe(i3)
mF22 = MFe2(i3)
! Propagator and inverse propagator mass 
MP = Mhh
MP2 = Mhh2
IMP = 1._dp/MP  
IMP2 = 1._dp/MP2 
! Amplitude 
  int1=B0C0check(mF22, mF12, mS12)
  int2=C0check(mF22, mF12, mS12)
  PSOddllSLL=PSOddllSLL+chargefactor*coup1L*coup2L*coup4L*IMP2*(coup3R*int1 +         & 
&  coup3L*int2*mF1*mF2)
  PSOddllSRR=PSOddllSRR+chargefactor*coup1R*coup2R*coup4R*IMP2*(coup3L*int1 +         & 
&  coup3R*int2*mF1*mF2)
  PSOddllSRL=PSOddllSRL+chargefactor*coup1L*coup2L*coup4R*IMP2*(coup3R*int1 +         & 
&  coup3L*int2*mF1*mF2)
  PSOddllSLR=PSOddllSLR+chargefactor*coup1R*coup2R*coup4L*IMP2*(coup3L*int1 +         & 
&  coup3R*int2*mF1*mF2)
  PSOddllVRR=PSOddllVRR+0.
  PSOddllVLL=PSOddllVLL+0.
  PSOddllVRL=PSOddllVRL+0.
  PSOddllVLR=PSOddllVLR+0.
  PSOddllTLL=PSOddllTLL+0.
  PSOddllTLR=PSOddllTLR+0.
  PSOddllTRL=PSOddllTRL+0.
  PSOddllTRR=PSOddllTRR+0.
  End if 
End if 
   End Do 
  End Do 


 ! Propagator: hh, Loop particles: VZ,Fe,Fe
! Generic diagram: VFF,  InsertionOrder: 4
chargefactor = 1 
  Do i2=1,3
    Do i3=1,3
If ((MVZ2.gt.mf_l2(3)).Or.(MFe2(i2).gt.mf_l2(3)).Or.(MFe2(i3).gt.mf_l2(3))) Then
If (.not.OnlySM) Then 
coup1L = cplcFeFeVZL(i2,gt3)
coup1R = cplcFeFeVZR(i2,gt3)
coup2L = cplcFeFeVZL(gt4,i3)
coup2R = cplcFeFeVZR(gt4,i3)
coup3L = cplcFeFehhL(i3,i2)
coup3R = cplcFeFehhR(i3,i2)
coup4L = cplcFdFdhhL(gt2,gt1)
coup4R = cplcFdFdhhR(gt2,gt1)
! Masses in loop
mV1 = MVZ
mV12 = MVZ2
mF1 = MFe(i2)
mF12 = MFe2(i2)
mF2 = MFe(i3)
mF22 = MFe2(i3)
! Propagator and inverse propagator mass 
MP = Mhh
MP2 = Mhh2
IMP = 1._dp/MP  
IMP2 = 1._dp/MP2 
! Amplitude 
  int1=B0C0check(mF22, mF12, mV12)
  int2=C0check(mF22, mF12, mV12)
  PSOddllSLL=PSOddllSLL+2.*chargefactor*coup1L*coup2R*coup4L*IMP2*(coup3L*(Finite -   & 
&  2.*int1) - 2.*coup3R*int2*mF1*mF2)
  PSOddllSRR=PSOddllSRR+2.*chargefactor*coup1R*coup2L*coup4R*IMP2*(coup3R*(Finite -   & 
&  2.*int1) - 2.*coup3L*int2*mF1*mF2)
  PSOddllSRL=PSOddllSRL+2.*chargefactor*coup1L*coup2R*coup4R*IMP2*(coup3L*(Finite -   & 
&  2.*int1) - 2.*coup3R*int2*mF1*mF2)
  PSOddllSLR=PSOddllSLR+2.*chargefactor*coup1R*coup2L*coup4L*IMP2*(coup3R*(Finite -   & 
&  2.*int1) - 2.*coup3L*int2*mF1*mF2)
  PSOddllVRR=PSOddllVRR+0.
  PSOddllVLL=PSOddllVLL+0.
  PSOddllVRL=PSOddllVRL+0.
  PSOddllVLR=PSOddllVLR+0.
  PSOddllTLL=PSOddllTLL+0.
  PSOddllTLR=PSOddllTLR+0.
  PSOddllTRL=PSOddllTRL+0.
  PSOddllTRR=PSOddllTRR+0.
  End if 
End if 
   End Do 
  End Do 


 ! Propagator: hh, Loop particles: bar[Fe],Ah,Ah
! Generic diagram: FSS,  InsertionOrder: 4
chargefactor = 1 
Do i1=1,3
If ((MFe2(i1).gt.mf_l2(3)).Or.(MAh2.gt.mf_l2(3)).Or.(MAh2.gt.mf_l2(3))) Then
If (.not.OnlySM) Then 
coup1L = cplcFeFeAhL(i1,gt3)
coup1R = cplcFeFeAhR(i1,gt3)
coup2L = cplcFeFeAhL(gt4,i1)
coup2R = cplcFeFeAhR(gt4,i1)
coup3 = cplAhAhhh
coup4L = cplcFdFdhhL(gt2,gt1)
coup4R = cplcFdFdhhR(gt2,gt1)
! Masses in loop
mF1 = MFe(i1)
mF12 = MFe2(i1)
mS1 = MAh
mS12 = MAh2
mS2 = MAh
mS22 = MAh2
! Propagator and inverse propagator mass 
MP = Mhh
MP2 = Mhh2
IMP = 1._dp/MP  
IMP2 = 1._dp/MP2 
! Amplitude 
  int1=C0check(mF12, mS12, mS22)
  PSOddllSLL=PSOddllSLL+chargefactor*coup1L*coup2L*coup3*coup4L*IMP2*int1*mF1
  PSOddllSRR=PSOddllSRR+chargefactor*coup1R*coup2R*coup3*coup4R*IMP2*int1*mF1
  PSOddllSRL=PSOddllSRL+chargefactor*coup1L*coup2L*coup3*coup4R*IMP2*int1*mF1
  PSOddllSLR=PSOddllSLR+chargefactor*coup1R*coup2R*coup3*coup4L*IMP2*int1*mF1
  PSOddllVRR=PSOddllVRR+0.
  PSOddllVLL=PSOddllVLL+0.
  PSOddllVRL=PSOddllVRL+0.
  PSOddllVLR=PSOddllVLR+0.
  PSOddllTLL=PSOddllTLL+0.
  PSOddllTLR=PSOddllTLR+0.
  PSOddllTRL=PSOddllTRL+0.
  PSOddllTRR=PSOddllTRR+0.
  End if 
End if 
    End Do 


 ! Propagator: hh, Loop particles: bar[Fe],VZ,Ah
! Generic diagram: FVS,  InsertionOrder: 4
chargefactor = 1 
Do i1=1,3
If ((MFe2(i1).gt.mf_l2(3)).Or.(MVZ2.gt.mf_l2(3)).Or.(MAh2.gt.mf_l2(3))) Then
If (.not.OnlySM) Then 
coup1L = cplcFeFeVZL(i1,gt3)
coup1R = cplcFeFeVZR(i1,gt3)
coup2L = cplcFeFeAhL(gt4,i1)
coup2R = cplcFeFeAhR(gt4,i1)
coup3 = cplAhhhVZ
coup4L = cplcFdFdhhL(gt2,gt1)
coup4R = cplcFdFdhhR(gt2,gt1)
! Masses in loop
mF1 = MFe(i1)
mF12 = MFe2(i1)
mV1 = MVZ
mV12 = MVZ2
mS2 = MAh
mS22 = MAh2
! Propagator and inverse propagator mass 
MP = Mhh
MP2 = Mhh2
IMP = 1._dp/MP  
IMP2 = 1._dp/MP2 
! Amplitude 
  int1=B0(0._dp, mS22, mV12)
  int2=C0check(mF12, mV12, mS22)
  PSOddllSLL=PSOddllSLL+chargefactor*coup1L*coup2L*coup3*coup4L*IMP2*(int1 +          & 
&  int2*mF12)
  PSOddllSRR=PSOddllSRR+chargefactor*coup1R*coup2R*coup3*coup4R*IMP2*(int1 +          & 
&  int2*mF12)
  PSOddllSRL=PSOddllSRL+chargefactor*coup1L*coup2L*coup3*coup4R*IMP2*(int1 +          & 
&  int2*mF12)
  PSOddllSLR=PSOddllSLR+chargefactor*coup1R*coup2R*coup3*coup4L*IMP2*(int1 +          & 
&  int2*mF12)
  PSOddllVRR=PSOddllVRR+0.
  PSOddllVLL=PSOddllVLL+0.
  PSOddllVRL=PSOddllVRL+0.
  PSOddllVLR=PSOddllVLR+0.
  PSOddllTLL=PSOddllTLL+0.
  PSOddllTLR=PSOddllTLR+0.
  PSOddllTRL=PSOddllTRL+0.
  PSOddllTRR=PSOddllTRR+0.
  End if 
End if 
    End Do 


 ! Propagator: hh, Loop particles: bar[Fe],hh,hh
! Generic diagram: FSS,  InsertionOrder: 4
chargefactor = 1 
Do i1=1,3
If ((MFe2(i1).gt.mf_l2(3)).Or.(Mhh2.gt.mf_l2(3)).Or.(Mhh2.gt.mf_l2(3))) Then
If (.not.OnlySM) Then 
coup1L = cplcFeFehhL(i1,gt3)
coup1R = cplcFeFehhR(i1,gt3)
coup2L = cplcFeFehhL(gt4,i1)
coup2R = cplcFeFehhR(gt4,i1)
coup3 = cplhhhhhh
coup4L = cplcFdFdhhL(gt2,gt1)
coup4R = cplcFdFdhhR(gt2,gt1)
! Masses in loop
mF1 = MFe(i1)
mF12 = MFe2(i1)
mS1 = Mhh
mS12 = Mhh2
mS2 = Mhh
mS22 = Mhh2
! Propagator and inverse propagator mass 
MP = Mhh
MP2 = Mhh2
IMP = 1._dp/MP  
IMP2 = 1._dp/MP2 
! Amplitude 
  int1=C0check(mF12, mS12, mS22)
  PSOddllSLL=PSOddllSLL+chargefactor*coup1L*coup2L*coup3*coup4L*IMP2*int1*mF1
  PSOddllSRR=PSOddllSRR+chargefactor*coup1R*coup2R*coup3*coup4R*IMP2*int1*mF1
  PSOddllSRL=PSOddllSRL+chargefactor*coup1L*coup2L*coup3*coup4R*IMP2*int1*mF1
  PSOddllSLR=PSOddllSLR+chargefactor*coup1R*coup2R*coup3*coup4L*IMP2*int1*mF1
  PSOddllVRR=PSOddllVRR+0.
  PSOddllVLL=PSOddllVLL+0.
  PSOddllVRL=PSOddllVRL+0.
  PSOddllVLR=PSOddllVLR+0.
  PSOddllTLL=PSOddllTLL+0.
  PSOddllTLR=PSOddllTLR+0.
  PSOddllTRL=PSOddllTRL+0.
  PSOddllTRR=PSOddllTRR+0.
  End if 
End if 
    End Do 


 ! Propagator: hh, Loop particles: bar[Fe],Ah,VZ
! Generic diagram: FSV,  InsertionOrder: 4
chargefactor = 1 
Do i1=1,3
If ((MFe2(i1).gt.mf_l2(3)).Or.(MAh2.gt.mf_l2(3)).Or.(MVZ2.gt.mf_l2(3))) Then
If (.not.OnlySM) Then 
coup1L = cplcFeFeAhL(i1,gt3)
coup1R = cplcFeFeAhR(i1,gt3)
coup2L = cplcFeFeVZL(gt4,i1)
coup2R = cplcFeFeVZR(gt4,i1)
coup3 = cplAhhhVZ
coup4L = cplcFdFdhhL(gt2,gt1)
coup4R = cplcFdFdhhR(gt2,gt1)
! Masses in loop
mF1 = MFe(i1)
mF12 = MFe2(i1)
mS1 = MAh
mS12 = MAh2
mV2 = MVZ
mV22 = MVZ2
! Propagator and inverse propagator mass 
MP = Mhh
MP2 = Mhh2
IMP = 1._dp/MP  
IMP2 = 1._dp/MP2 
! Amplitude 
  int1=B0(0._dp, mS12, mV22)
  int2=C0check(mF12, mS12, mV22)
  PSOddllSLL=PSOddllSLL - 1.*chargefactor*coup1L*coup2R*coup3*coup4L*IMP2*(int1 +     & 
&  int2*mF12)
  PSOddllSRR=PSOddllSRR - 1.*chargefactor*coup1R*coup2L*coup3*coup4R*IMP2*(int1 +     & 
&  int2*mF12)
  PSOddllSRL=PSOddllSRL - 1.*chargefactor*coup1L*coup2R*coup3*coup4R*IMP2*(int1 +     & 
&  int2*mF12)
  PSOddllSLR=PSOddllSLR - 1.*chargefactor*coup1R*coup2L*coup3*coup4L*IMP2*(int1 +     & 
&  int2*mF12)
  PSOddllVRR=PSOddllVRR+0.
  PSOddllVLL=PSOddllVLL+0.
  PSOddllVRL=PSOddllVRL+0.
  PSOddllVLR=PSOddllVLR+0.
  PSOddllTLL=PSOddllTLL+0.
  PSOddllTLR=PSOddllTLR+0.
  PSOddllTRL=PSOddllTRL+0.
  PSOddllTRR=PSOddllTRR+0.
  End if 
End if 
    End Do 


 ! Propagator: hh, Loop particles: bar[Fe],VZ,VZ
! Generic diagram: FVV,  InsertionOrder: 4
chargefactor = 1 
Do i1=1,3
If ((MFe2(i1).gt.mf_l2(3)).Or.(MVZ2.gt.mf_l2(3)).Or.(MVZ2.gt.mf_l2(3))) Then
If (.not.OnlySM) Then 
coup1L = cplcFeFeVZL(i1,gt3)
coup1R = cplcFeFeVZR(i1,gt3)
coup2L = cplcFeFeVZL(gt4,i1)
coup2R = cplcFeFeVZR(gt4,i1)
coup3 = cplhhVZVZ
coup4L = cplcFdFdhhL(gt2,gt1)
coup4R = cplcFdFdhhR(gt2,gt1)
! Masses in loop
mF1 = MFe(i1)
mF12 = MFe2(i1)
mV1 = MVZ
mV12 = MVZ2
mV2 = MVZ
mV22 = MVZ2
! Propagator and inverse propagator mass 
MP = Mhh
MP2 = Mhh2
IMP = 1._dp/MP  
IMP2 = 1._dp/MP2 
! Amplitude 
  int1=C0check(mF12, mV12, mV22)
  PSOddllSLL=PSOddllSLL+4.*chargefactor*coup1L*coup2R*coup3*coup4L*IMP2*int1*mF1
  PSOddllSRR=PSOddllSRR+4.*chargefactor*coup1R*coup2L*coup3*coup4R*IMP2*int1*mF1
  PSOddllSRL=PSOddllSRL+4.*chargefactor*coup1L*coup2R*coup3*coup4R*IMP2*int1*mF1
  PSOddllSLR=PSOddllSLR+4.*chargefactor*coup1R*coup2L*coup3*coup4L*IMP2*int1*mF1
  PSOddllVRR=PSOddllVRR+0.
  PSOddllVLL=PSOddllVLL+0.
  PSOddllVRL=PSOddllVRL+0.
  PSOddllVLR=PSOddllVLR+0.
  PSOddllTLL=PSOddllTLL+0.
  PSOddllTLR=PSOddllTLR+0.
  PSOddllTRL=PSOddllTRL+0.
  PSOddllTRR=PSOddllTRR+0.
  End if 
End if 
    End Do 


 PSOddllSLL=oo16pi2*PSOddllSLL 
PSOddllSRR=oo16pi2*PSOddllSRR 
PSOddllSRL=oo16pi2*PSOddllSRL 
PSOddllSLR=oo16pi2*PSOddllSLR 
PSOddllVRR=oo16pi2*PSOddllVRR 
PSOddllVLL=oo16pi2*PSOddllVLL 
PSOddllVRL=oo16pi2*PSOddllVRL 
PSOddllVLR=oo16pi2*PSOddllVLR 
PSOddllTLL=oo16pi2*PSOddllTLL 
PSOddllTLR=oo16pi2*PSOddllTLR 
PSOddllTRL=oo16pi2*PSOddllTRL 
PSOddllTRR=oo16pi2*PSOddllTRR 
Iname=Iname-1

End Subroutine CalculatePengS2d2L 

Subroutine CalculatePengV2d2L(gt1,gt2,gt3,gt4,OnlySM,MAh,MAh2,MFd,MFd2,               & 
& MFe,MFe2,MFu,MFu2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,cplAhAhhh,cplAhcHpVWp,         & 
& cplAhhhVZ,cplAhHpcVWp,cplcFdFdAhL,cplcFdFdAhR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVPL,     & 
& cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,cplcFdFucHpL,cplcFdFucHpR,cplcFdFucVWpL,           & 
& cplcFdFucVWpR,cplcFeFeAhL,cplcFeFeAhR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,             & 
& cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplcFeFvcHpL,cplcFeFvcHpR,cplcFeFvcVWpL,           & 
& cplcFeFvcVWpR,cplcFuFdHpL,cplcFuFdHpR,cplcFuFdVWpL,cplcFuFdVWpR,cplcFuFuAhL,           & 
& cplcFuFuAhR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZL,               & 
& cplcFuFuVZR,cplcFvFeHpL,cplcFvFeHpR,cplcFvFeVWpL,cplcFvFeVWpR,cplcHpVPVWp,             & 
& cplcHpVWpVZ,cplcVWpVPVWp,cplcVWpVWpVZ,cplhhcHpVWp,cplhhcVWpVWp,cplhhhhhh,              & 
& cplhhHpcHp,cplhhHpcVWp,cplhhVZVZ,cplHpcHpVP,cplHpcHpVZ,cplHpcVWpVP,cplHpcVWpVZ,        & 
& PVOddllSLL,PVOddllSRR,PVOddllSRL,PVOddllSLR,PVOddllVRR,PVOddllVLL,PVOddllVRL,          & 
& PVOddllVLR,PVOddllTLL,PVOddllTLR,PVOddllTRL,PVOddllTRR)

! ---------------------------------------------------------------- 
! Code based on automatically generated SARAH extensions by 'PreSARAH' 
! Expressions for amplitudes are obtained by FeynArts/FormCalc 
! Based on user input for process PengV2d2L 
! 'PreSARAH' output has been generated  at 15:41 on 16.12.2015 
! ---------------------------------------------------------------- 
 
Implicit None 
Real(dp),Intent(in) :: MAh,MAh2,MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),Mhh,Mhh2,MHp,MHp2,              & 
& MVWp,MVWp2,MVZ,MVZ2

Complex(dp),Intent(in) :: cplAhAhhh,cplAhcHpVWp,cplAhhhVZ,cplAhHpcVWp,cplcFdFdAhL(3,3),cplcFdFdAhR(3,3),        & 
& cplcFdFdhhL(3,3),cplcFdFdhhR(3,3),cplcFdFdVPL(3,3),cplcFdFdVPR(3,3),cplcFdFdVZL(3,3),  & 
& cplcFdFdVZR(3,3),cplcFdFucHpL(3,3),cplcFdFucHpR(3,3),cplcFdFucVWpL(3,3),               & 
& cplcFdFucVWpR(3,3),cplcFeFeAhL(3,3),cplcFeFeAhR(3,3),cplcFeFehhL(3,3),cplcFeFehhR(3,3),& 
& cplcFeFeVPL(3,3),cplcFeFeVPR(3,3),cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),cplcFeFvcHpL(3,3), & 
& cplcFeFvcHpR(3,3),cplcFeFvcVWpL(3,3),cplcFeFvcVWpR(3,3),cplcFuFdHpL(3,3),              & 
& cplcFuFdHpR(3,3),cplcFuFdVWpL(3,3),cplcFuFdVWpR(3,3),cplcFuFuAhL(3,3),cplcFuFuAhR(3,3),& 
& cplcFuFuhhL(3,3),cplcFuFuhhR(3,3),cplcFuFuVPL(3,3),cplcFuFuVPR(3,3),cplcFuFuVZL(3,3),  & 
& cplcFuFuVZR(3,3),cplcFvFeHpL(3,3),cplcFvFeHpR(3,3),cplcFvFeVWpL(3,3),cplcFvFeVWpR(3,3),& 
& cplcHpVPVWp,cplcHpVWpVZ,cplcVWpVPVWp,cplcVWpVWpVZ,cplhhcHpVWp,cplhhcVWpVWp,            & 
& cplhhhhhh,cplhhHpcHp,cplhhHpcVWp,cplhhVZVZ,cplHpcHpVP,cplHpcHpVZ,cplHpcVWpVP,          & 
& cplHpcVWpVZ

Integer,Intent(in) :: gt1, gt2,gt3,gt4 
Logical, Intent(in) :: OnlySM 
Integer :: iprop, i1, i2, i3, i4 
Real(dp) :: MassEx1,MassEx2,MassEx3,MassEx4, MassEx12,MassEx22,MassEx32,MassEx42 
Complex(dp), Intent(out) :: PVOddllSLL 
Complex(dp), Intent(out) :: PVOddllSRR 
Complex(dp), Intent(out) :: PVOddllSRL 
Complex(dp), Intent(out) :: PVOddllSLR 
Complex(dp), Intent(out) :: PVOddllVRR 
Complex(dp), Intent(out) :: PVOddllVLL 
Complex(dp), Intent(out) :: PVOddllVRL 
Complex(dp), Intent(out) :: PVOddllVLR 
Complex(dp), Intent(out) :: PVOddllTLL 
Complex(dp), Intent(out) :: PVOddllTLR 
Complex(dp), Intent(out) :: PVOddllTRL 
Complex(dp), Intent(out) :: PVOddllTRR 
Complex(dp) :: vertex1L, vertex1R, vertex2L, vertex2R 
Real(dp) ::  MP, MP2, IMP2, IMP, MFin, MFin2, IMFin, IMFin2, Finite  
Real(dp) ::  MS1, MS12, MS2, MS22, MF1, MF12, MF2, MF22, MV1, MV12, MV2, MV22  
Complex(dp) ::  chargefactor  
Complex(dp) ::  coup1L, coup1R, coup2L, coup2R, coup3L, coup3R, coup3, coup4L, coup4R 

Complex(dp) ::  int1,int2,int3,int4,int5,int6,int7,int8 

Iname=Iname+1 
NameOfUnit(Iname)='CalculatePengV2d2L' 

Finite=1._dp 
MassEx1=MFd(gt1)  
MassEx12=MFd2(gt1) 
MassEx2=MFd(gt2)  
MassEx22=MFd2(gt2) 
MassEx3=MFe(gt3)  
MassEx32=MFe2(gt3) 
MassEx4=MFe(gt4)  
MassEx42=MFe2(gt4) 
! ------------------------------ 
 ! Amplitudes for external states 
 ! {DownQuark, bar[DownQuark], ChargedLepton, bar[ChargedLepton]} 
 ! ------------------------------ 
 
PVOddllSLL=0._dp 
PVOddllSRR=0._dp 
PVOddllSRL=0._dp 
PVOddllSLR=0._dp 
PVOddllVRR=0._dp 
PVOddllVLL=0._dp 
PVOddllVRL=0._dp 
PVOddllVLR=0._dp 
PVOddllTLL=0._dp 
PVOddllTLR=0._dp 
PVOddllTRL=0._dp 
PVOddllTRR=0._dp 
!---------------------------------------- 
! Vector Wave Contributions            
!---------------------------------------- 
! --  VZ - Penguins            
! Propagator: VZ, Loop particles: Ah,Fd, Internal fermion: bar[Fd]
! Generic diagram: SFF,  InsertionOrder: 1
chargefactor = 1 
  Do i2=1,3
    Do i3=1,3
If ((MAh2.gt.mf_l2(3)).Or.(MFd2(i2).gt.mf_l2(3))) Then
If (((i2.lt.4).and.(i3.lt.4)).or.(.not.OnlySM)) Then 
coup1L = cplcFdFdAhL(i2,gt1)
coup1R = cplcFdFdAhR(i2,gt1)
coup2L = cplcFdFdAhL(i3,i2)
coup2R = cplcFdFdAhR(i3,i2)
coup3L = cplcFdFdVZL(gt2,i3)
coup3R = cplcFdFdVZR(gt2,i3)
coup4L = cplcFeFeVZL(gt4,gt3)
coup4R = cplcFeFeVZR(gt4,gt3)
! Masses in loop
mS1 = MAh
mS12 = MAh2
mF1 = MFd(i2)
mF12 = MFd2(i2)
! Mass of internal fermion 
MFin = MFd(i3)-MFd(gt1)
MFin2 = MFd2(i3)-MFd2(gt1)
If (Abs(MFin).gt.10E-10_dp) Then 
MFin = MFd(i3)
MFin2 = MFd2(i3)
! Propagator and inverse propagator mass 
MP = MVZ
MP2 = MVZ2
IMP = 1._dp/MP  
IMP2 = 1._dp/MP2 
! Amplitude 
  int1=B0(0._dp, mF12, mS12)
  int2=B1(0._dp, mF12, mS12)
  PVOddllSLL=PVOddllSLL+0.
  PVOddllSRR=PVOddllSRR+0.
  PVOddllSRL=PVOddllSRL+0.
  PVOddllSLR=PVOddllSLR+0.
  PVOddllVRR=PVOddllVRR+(chargefactor*coup3R*coup4R*IMP2*(coup1R*coup2L*int2*MassEx12 -& 
&  1.*coup1L*coup2L*int1*MassEx1*mF1 + coup1L*coup2R*int2*MassEx1*MFin - 1.*coup1R*coup2R*int1*mF1*MFin))& 
& /(MassEx12 - 1.*MFin2)
  PVOddllVLL=PVOddllVLL+(chargefactor*coup3L*coup4L*IMP2*(coup1L*coup2R*int2*MassEx12 -& 
&  1.*coup1R*coup2R*int1*MassEx1*mF1 + coup1R*coup2L*int2*MassEx1*MFin - 1.*coup1L*coup2L*int1*mF1*MFin))& 
& /(MassEx12 - 1.*MFin2)
  PVOddllVRL=PVOddllVRL+(chargefactor*coup3R*coup4L*IMP2*(coup1R*coup2L*int2*MassEx12 -& 
&  1.*coup1L*coup2L*int1*MassEx1*mF1 + coup1L*coup2R*int2*MassEx1*MFin - 1.*coup1R*coup2R*int1*mF1*MFin))& 
& /(MassEx12 - 1.*MFin2)
  PVOddllVLR=PVOddllVLR+(chargefactor*coup3L*coup4R*IMP2*(coup1L*coup2R*int2*MassEx12 -& 
&  1.*coup1R*coup2R*int1*MassEx1*mF1 + coup1R*coup2L*int2*MassEx1*MFin - 1.*coup1L*coup2L*int1*mF1*MFin))& 
& /(MassEx12 - 1.*MFin2)
  PVOddllTLL=PVOddllTLL+0.
  PVOddllTLR=PVOddllTLR+0.
  PVOddllTRL=PVOddllTRL+0.
  PVOddllTRR=PVOddllTRR+0.
     End if 
  End if 
End if 
   End Do 
  End Do 


 ! Propagator: VZ, Loop particles: hh,Fd, Internal fermion: bar[Fd]
! Generic diagram: SFF,  InsertionOrder: 1
chargefactor = 1 
  Do i2=1,3
    Do i3=1,3
If ((Mhh2.gt.mf_l2(3)).Or.(MFd2(i2).gt.mf_l2(3))) Then
If (.not.OnlySM) Then 
coup1L = cplcFdFdhhL(i2,gt1)
coup1R = cplcFdFdhhR(i2,gt1)
coup2L = cplcFdFdhhL(i3,i2)
coup2R = cplcFdFdhhR(i3,i2)
coup3L = cplcFdFdVZL(gt2,i3)
coup3R = cplcFdFdVZR(gt2,i3)
coup4L = cplcFeFeVZL(gt4,gt3)
coup4R = cplcFeFeVZR(gt4,gt3)
! Masses in loop
mS1 = Mhh
mS12 = Mhh2
mF1 = MFd(i2)
mF12 = MFd2(i2)
! Mass of internal fermion 
MFin = MFd(i3)-MFd(gt1)
MFin2 = MFd2(i3)-MFd2(gt1)
If (Abs(MFin).gt.10E-10_dp) Then 
MFin = MFd(i3)
MFin2 = MFd2(i3)
! Propagator and inverse propagator mass 
MP = MVZ
MP2 = MVZ2
IMP = 1._dp/MP  
IMP2 = 1._dp/MP2 
! Amplitude 
  int1=B0(0._dp, mF12, mS12)
  int2=B1(0._dp, mF12, mS12)
  PVOddllSLL=PVOddllSLL+0.
  PVOddllSRR=PVOddllSRR+0.
  PVOddllSRL=PVOddllSRL+0.
  PVOddllSLR=PVOddllSLR+0.
  PVOddllVRR=PVOddllVRR+(chargefactor*coup3R*coup4R*IMP2*(coup1R*coup2L*int2*MassEx12 -& 
&  1.*coup1L*coup2L*int1*MassEx1*mF1 + coup1L*coup2R*int2*MassEx1*MFin - 1.*coup1R*coup2R*int1*mF1*MFin))& 
& /(MassEx12 - 1.*MFin2)
  PVOddllVLL=PVOddllVLL+(chargefactor*coup3L*coup4L*IMP2*(coup1L*coup2R*int2*MassEx12 -& 
&  1.*coup1R*coup2R*int1*MassEx1*mF1 + coup1R*coup2L*int2*MassEx1*MFin - 1.*coup1L*coup2L*int1*mF1*MFin))& 
& /(MassEx12 - 1.*MFin2)
  PVOddllVRL=PVOddllVRL+(chargefactor*coup3R*coup4L*IMP2*(coup1R*coup2L*int2*MassEx12 -& 
&  1.*coup1L*coup2L*int1*MassEx1*mF1 + coup1L*coup2R*int2*MassEx1*MFin - 1.*coup1R*coup2R*int1*mF1*MFin))& 
& /(MassEx12 - 1.*MFin2)
  PVOddllVLR=PVOddllVLR+(chargefactor*coup3L*coup4R*IMP2*(coup1L*coup2R*int2*MassEx12 -& 
&  1.*coup1R*coup2R*int1*MassEx1*mF1 + coup1R*coup2L*int2*MassEx1*MFin - 1.*coup1L*coup2L*int1*mF1*MFin))& 
& /(MassEx12 - 1.*MFin2)
  PVOddllTLL=PVOddllTLL+0.
  PVOddllTLR=PVOddllTLR+0.
  PVOddllTRL=PVOddllTRL+0.
  PVOddllTRR=PVOddllTRR+0.
     End if 
  End if 
End if 
   End Do 
  End Do 


 ! Propagator: VZ, Loop particles: Hp,Fu, Internal fermion: bar[Fd]
! Generic diagram: SFF,  InsertionOrder: 1
chargefactor = 1 
  Do i2=1,3
    Do i3=1,3
If ((MHp2.gt.mf_l2(3)).Or.(MFu2(i2).gt.mf_l2(3))) Then
If (((i2.lt.4).and.(i3.lt.4)).or.(.not.OnlySM)) Then 
coup1L = cplcFuFdHpL(i2,gt1)
coup1R = cplcFuFdHpR(i2,gt1)
coup2L = cplcFdFucHpL(i3,i2)
coup2R = cplcFdFucHpR(i3,i2)
coup3L = cplcFdFdVZL(gt2,i3)
coup3R = cplcFdFdVZR(gt2,i3)
coup4L = cplcFeFeVZL(gt4,gt3)
coup4R = cplcFeFeVZR(gt4,gt3)
! Masses in loop
mS1 = MHp
mS12 = MHp2
mF1 = MFu(i2)
mF12 = MFu2(i2)
! Mass of internal fermion 
MFin = MFd(i3)-MFd(gt1)
MFin2 = MFd2(i3)-MFd2(gt1)
If (Abs(MFin).gt.10E-10_dp) Then 
MFin = MFd(i3)
MFin2 = MFd2(i3)
! Propagator and inverse propagator mass 
MP = MVZ
MP2 = MVZ2
IMP = 1._dp/MP  
IMP2 = 1._dp/MP2 
! Amplitude 
  int1=B0(0._dp, mF12, mS12)
  int2=B1(0._dp, mF12, mS12)
  PVOddllSLL=PVOddllSLL+0.
  PVOddllSRR=PVOddllSRR+0.
  PVOddllSRL=PVOddllSRL+0.
  PVOddllSLR=PVOddllSLR+0.
  PVOddllVRR=PVOddllVRR+(chargefactor*coup3R*coup4R*IMP2*(coup1R*coup2L*int2*MassEx12 -& 
&  1.*coup1L*coup2L*int1*MassEx1*mF1 + coup1L*coup2R*int2*MassEx1*MFin - 1.*coup1R*coup2R*int1*mF1*MFin))& 
& /(MassEx12 - 1.*MFin2)
  PVOddllVLL=PVOddllVLL+(chargefactor*coup3L*coup4L*IMP2*(coup1L*coup2R*int2*MassEx12 -& 
&  1.*coup1R*coup2R*int1*MassEx1*mF1 + coup1R*coup2L*int2*MassEx1*MFin - 1.*coup1L*coup2L*int1*mF1*MFin))& 
& /(MassEx12 - 1.*MFin2)
  PVOddllVRL=PVOddllVRL+(chargefactor*coup3R*coup4L*IMP2*(coup1R*coup2L*int2*MassEx12 -& 
&  1.*coup1L*coup2L*int1*MassEx1*mF1 + coup1L*coup2R*int2*MassEx1*MFin - 1.*coup1R*coup2R*int1*mF1*MFin))& 
& /(MassEx12 - 1.*MFin2)
  PVOddllVLR=PVOddllVLR+(chargefactor*coup3L*coup4R*IMP2*(coup1L*coup2R*int2*MassEx12 -& 
&  1.*coup1R*coup2R*int1*MassEx1*mF1 + coup1R*coup2L*int2*MassEx1*MFin - 1.*coup1L*coup2L*int1*mF1*MFin))& 
& /(MassEx12 - 1.*MFin2)
  PVOddllTLL=PVOddllTLL+0.
  PVOddllTLR=PVOddllTLR+0.
  PVOddllTRL=PVOddllTRL+0.
  PVOddllTRR=PVOddllTRR+0.
     End if 
  End if 
End if 
   End Do 
  End Do 


 ! Propagator: VZ, Loop particles: VWp,Fu, Internal fermion: bar[Fd]
! Generic diagram: VFF,  InsertionOrder: 1
chargefactor = 1 
  Do i2=1,3
    Do i3=1,3
If ((MVWp2.gt.mf_l2(3)).Or.(MFu2(i2).gt.mf_l2(3))) Then
If (((i2.lt.4).and.(i3.lt.4)).or.(.not.OnlySM)) Then 
coup1L = cplcFuFdVWpL(i2,gt1)
coup1R = cplcFuFdVWpR(i2,gt1)
coup2L = cplcFdFucVWpL(i3,i2)
coup2R = cplcFdFucVWpR(i3,i2)
coup3L = cplcFdFdVZL(gt2,i3)
coup3R = cplcFdFdVZR(gt2,i3)
coup4L = cplcFeFeVZL(gt4,gt3)
coup4R = cplcFeFeVZR(gt4,gt3)
! Masses in loop
mV1 = MVWp
mV12 = MVWp2
mF1 = MFu(i2)
mF12 = MFu2(i2)
! Mass of internal fermion 
MFin = MFd(i3)-MFd(gt1)
MFin2 = MFd2(i3)-MFd2(gt1)
If (Abs(MFin).gt.10E-10_dp) Then 
MFin = MFd(i3)
MFin2 = MFd2(i3)
! Propagator and inverse propagator mass 
MP = MVZ
MP2 = MVZ2
IMP = 1._dp/MP  
IMP2 = 1._dp/MP2 
! Amplitude 
  int1=B0(0._dp, mF12, mV12)
  int2=B1(0._dp, mF12, mV12)
  PVOddllSLL=PVOddllSLL+0.
  PVOddllSRR=PVOddllSRR+0.
  PVOddllSRL=PVOddllSRL+0.
  PVOddllSLR=PVOddllSLR+0.
  PVOddllVRR=PVOddllVRR+(chargefactor*coup3R*coup4R*IMP2*(coup1L*MassEx1*(-           & 
& 2.*coup2R*(Finite - 2.*int1)*mF1 + coup2L*(Finite + 2.*int2)*MFin) + coup1R*(coup2R*(Finite + 2.*int2)& 
& *MassEx12 - 2.*coup2L*(Finite - 2.*int1)*mF1*MFin)))/(MassEx12 - 1.*MFin2)
  PVOddllVLL=PVOddllVLL+(chargefactor*coup3L*coup4L*IMP2*(coup1R*MassEx1*(-           & 
& 2.*coup2L*(Finite - 2.*int1)*mF1 + coup2R*(Finite + 2.*int2)*MFin) + coup1L*(coup2L*(Finite + 2.*int2)& 
& *MassEx12 - 2.*coup2R*(Finite - 2.*int1)*mF1*MFin)))/(MassEx12 - 1.*MFin2)
  PVOddllVRL=PVOddllVRL+(chargefactor*coup3R*coup4L*IMP2*(coup1L*MassEx1*(-           & 
& 2.*coup2R*(Finite - 2.*int1)*mF1 + coup2L*(Finite + 2.*int2)*MFin) + coup1R*(coup2R*(Finite + 2.*int2)& 
& *MassEx12 - 2.*coup2L*(Finite - 2.*int1)*mF1*MFin)))/(MassEx12 - 1.*MFin2)
  PVOddllVLR=PVOddllVLR+(chargefactor*coup3L*coup4R*IMP2*(coup1R*MassEx1*(-           & 
& 2.*coup2L*(Finite - 2.*int1)*mF1 + coup2R*(Finite + 2.*int2)*MFin) + coup1L*(coup2L*(Finite + 2.*int2)& 
& *MassEx12 - 2.*coup2R*(Finite - 2.*int1)*mF1*MFin)))/(MassEx12 - 1.*MFin2)
  PVOddllTLL=PVOddllTLL+0.
  PVOddllTLR=PVOddllTLR+0.
  PVOddllTRL=PVOddllTRL+0.
  PVOddllTRR=PVOddllTRR+0.
     End if 
  End if 
End if 
   End Do 
  End Do 


 ! Propagator: VZ, Loop particles: VZ,Fd, Internal fermion: bar[Fd]
! Generic diagram: VFF,  InsertionOrder: 1
chargefactor = 1 
  Do i2=1,3
    Do i3=1,3
If ((MVZ2.gt.mf_l2(3)).Or.(MFd2(i2).gt.mf_l2(3))) Then
If (((i2.lt.4).and.(i3.lt.4)).or.(.not.OnlySM)) Then 
coup1L = cplcFdFdVZL(i2,gt1)
coup1R = cplcFdFdVZR(i2,gt1)
coup2L = cplcFdFdVZL(i3,i2)
coup2R = cplcFdFdVZR(i3,i2)
coup3L = cplcFdFdVZL(gt2,i3)
coup3R = cplcFdFdVZR(gt2,i3)
coup4L = cplcFeFeVZL(gt4,gt3)
coup4R = cplcFeFeVZR(gt4,gt3)
! Masses in loop
mV1 = MVZ
mV12 = MVZ2
mF1 = MFd(i2)
mF12 = MFd2(i2)
! Mass of internal fermion 
MFin = MFd(i3)-MFd(gt1)
MFin2 = MFd2(i3)-MFd2(gt1)
If (Abs(MFin).gt.10E-10_dp) Then 
MFin = MFd(i3)
MFin2 = MFd2(i3)
! Propagator and inverse propagator mass 
MP = MVZ
MP2 = MVZ2
IMP = 1._dp/MP  
IMP2 = 1._dp/MP2 
! Amplitude 
  int1=B0(0._dp, mF12, mV12)
  int2=B1(0._dp, mF12, mV12)
  PVOddllSLL=PVOddllSLL+0.
  PVOddllSRR=PVOddllSRR+0.
  PVOddllSRL=PVOddllSRL+0.
  PVOddllSLR=PVOddllSLR+0.
  PVOddllVRR=PVOddllVRR+(chargefactor*coup3R*coup4R*IMP2*(coup1L*MassEx1*(-           & 
& 2.*coup2R*(Finite - 2.*int1)*mF1 + coup2L*(Finite + 2.*int2)*MFin) + coup1R*(coup2R*(Finite + 2.*int2)& 
& *MassEx12 - 2.*coup2L*(Finite - 2.*int1)*mF1*MFin)))/(MassEx12 - 1.*MFin2)
  PVOddllVLL=PVOddllVLL+(chargefactor*coup3L*coup4L*IMP2*(coup1R*MassEx1*(-           & 
& 2.*coup2L*(Finite - 2.*int1)*mF1 + coup2R*(Finite + 2.*int2)*MFin) + coup1L*(coup2L*(Finite + 2.*int2)& 
& *MassEx12 - 2.*coup2R*(Finite - 2.*int1)*mF1*MFin)))/(MassEx12 - 1.*MFin2)
  PVOddllVRL=PVOddllVRL+(chargefactor*coup3R*coup4L*IMP2*(coup1L*MassEx1*(-           & 
& 2.*coup2R*(Finite - 2.*int1)*mF1 + coup2L*(Finite + 2.*int2)*MFin) + coup1R*(coup2R*(Finite + 2.*int2)& 
& *MassEx12 - 2.*coup2L*(Finite - 2.*int1)*mF1*MFin)))/(MassEx12 - 1.*MFin2)
  PVOddllVLR=PVOddllVLR+(chargefactor*coup3L*coup4R*IMP2*(coup1R*MassEx1*(-           & 
& 2.*coup2L*(Finite - 2.*int1)*mF1 + coup2R*(Finite + 2.*int2)*MFin) + coup1L*(coup2L*(Finite + 2.*int2)& 
& *MassEx12 - 2.*coup2R*(Finite - 2.*int1)*mF1*MFin)))/(MassEx12 - 1.*MFin2)
  PVOddllTLL=PVOddllTLL+0.
  PVOddllTLR=PVOddllTLR+0.
  PVOddllTRL=PVOddllTRL+0.
  PVOddllTRR=PVOddllTRR+0.
     End if 
  End if 
End if 
   End Do 
  End Do 


 ! Propagator: VZ, Loop particles: Fd,Ah, Internal fermion: Fd
! Generic diagram: FSF,  InsertionOrder: 2
chargefactor = 1 
Do i1=1,3
    Do i3=1,3
If ((MFd2(i1).gt.mf_l2(3)).Or.(MAh2.gt.mf_l2(3))) Then
If (((i1.lt.4).and.(i3.lt.4)).or.(.not.OnlySM)) Then 
coup3L = cplcFdFdVZL(i3,gt1)
coup3R = cplcFdFdVZR(i3,gt1)
coup2L = cplcFdFdAhL(i1,i3)
coup2R = cplcFdFdAhR(i1,i3)
coup1L = cplcFdFdAhL(gt2,i1)
coup1R = cplcFdFdAhR(gt2,i1)
coup4L = cplcFeFeVZL(gt4,gt3)
coup4R = cplcFeFeVZR(gt4,gt3)
! Masses in loop
mF1 = MFd(i1)
mF12 = MFd2(i1)
mS1 = MAh
mS12 = MAh2
! Mass of internal fermion 
MFin = MFd(i3)-MFd(gt2)
MFin2 = MFd2(i3)-MFd2(gt2)
If (Abs(MFin).gt.10E-10_dp) Then 
MFin = MFd(i3)
MFin2 = MFd2(i3)
! Propagator and inverse propagator mass 
MP = MVZ
MP2 = MVZ2
IMP = 1._dp/MP  
IMP2 = 1._dp/MP2 
! Amplitude 
  int1=B0(0._dp, mF12, mS12)
  int2=B1(0._dp, mF12, mS12)
  PVOddllSLL=PVOddllSLL+0.
  PVOddllSRR=PVOddllSRR+0.
  PVOddllSRL=PVOddllSRL+0.
  PVOddllSLR=PVOddllSLR+0.
  PVOddllVRR=PVOddllVRR+(chargefactor*coup3R*coup4R*IMP2*(coup1L*coup2R*int2*MassEx22 -& 
&  1.*coup1R*coup2R*int1*MassEx2*mF1 + coup1R*coup2L*int2*MassEx2*MFin - 1.*coup1L*coup2L*int1*mF1*MFin))& 
& /(MassEx22 - 1.*MFin2)
  PVOddllVLL=PVOddllVLL+(chargefactor*coup3L*coup4L*IMP2*(coup1R*coup2L*int2*MassEx22 -& 
&  1.*coup1L*coup2L*int1*MassEx2*mF1 + coup1L*coup2R*int2*MassEx2*MFin - 1.*coup1R*coup2R*int1*mF1*MFin))& 
& /(MassEx22 - 1.*MFin2)
  PVOddllVRL=PVOddllVRL+(chargefactor*coup3R*coup4L*IMP2*(coup1L*coup2R*int2*MassEx22 -& 
&  1.*coup1R*coup2R*int1*MassEx2*mF1 + coup1R*coup2L*int2*MassEx2*MFin - 1.*coup1L*coup2L*int1*mF1*MFin))& 
& /(MassEx22 - 1.*MFin2)
  PVOddllVLR=PVOddllVLR+(chargefactor*coup3L*coup4R*IMP2*(coup1R*coup2L*int2*MassEx22 -& 
&  1.*coup1L*coup2L*int1*MassEx2*mF1 + coup1L*coup2R*int2*MassEx2*MFin - 1.*coup1R*coup2R*int1*mF1*MFin))& 
& /(MassEx22 - 1.*MFin2)
  PVOddllTLL=PVOddllTLL+0.
  PVOddllTLR=PVOddllTLR+0.
  PVOddllTRL=PVOddllTRL+0.
  PVOddllTRR=PVOddllTRR+0.
     End if 
  End if 
End if 
    End Do 
  End Do 


 ! Propagator: VZ, Loop particles: Fd,hh, Internal fermion: Fd
! Generic diagram: FSF,  InsertionOrder: 2
chargefactor = 1 
Do i1=1,3
    Do i3=1,3
If ((MFd2(i1).gt.mf_l2(3)).Or.(Mhh2.gt.mf_l2(3))) Then
If (.not.OnlySM) Then 
coup3L = cplcFdFdVZL(i3,gt1)
coup3R = cplcFdFdVZR(i3,gt1)
coup2L = cplcFdFdhhL(i1,i3)
coup2R = cplcFdFdhhR(i1,i3)
coup1L = cplcFdFdhhL(gt2,i1)
coup1R = cplcFdFdhhR(gt2,i1)
coup4L = cplcFeFeVZL(gt4,gt3)
coup4R = cplcFeFeVZR(gt4,gt3)
! Masses in loop
mF1 = MFd(i1)
mF12 = MFd2(i1)
mS1 = Mhh
mS12 = Mhh2
! Mass of internal fermion 
MFin = MFd(i3)-MFd(gt2)
MFin2 = MFd2(i3)-MFd2(gt2)
If (Abs(MFin).gt.10E-10_dp) Then 
MFin = MFd(i3)
MFin2 = MFd2(i3)
! Propagator and inverse propagator mass 
MP = MVZ
MP2 = MVZ2
IMP = 1._dp/MP  
IMP2 = 1._dp/MP2 
! Amplitude 
  int1=B0(0._dp, mF12, mS12)
  int2=B1(0._dp, mF12, mS12)
  PVOddllSLL=PVOddllSLL+0.
  PVOddllSRR=PVOddllSRR+0.
  PVOddllSRL=PVOddllSRL+0.
  PVOddllSLR=PVOddllSLR+0.
  PVOddllVRR=PVOddllVRR+(chargefactor*coup3R*coup4R*IMP2*(coup1L*coup2R*int2*MassEx22 -& 
&  1.*coup1R*coup2R*int1*MassEx2*mF1 + coup1R*coup2L*int2*MassEx2*MFin - 1.*coup1L*coup2L*int1*mF1*MFin))& 
& /(MassEx22 - 1.*MFin2)
  PVOddllVLL=PVOddllVLL+(chargefactor*coup3L*coup4L*IMP2*(coup1R*coup2L*int2*MassEx22 -& 
&  1.*coup1L*coup2L*int1*MassEx2*mF1 + coup1L*coup2R*int2*MassEx2*MFin - 1.*coup1R*coup2R*int1*mF1*MFin))& 
& /(MassEx22 - 1.*MFin2)
  PVOddllVRL=PVOddllVRL+(chargefactor*coup3R*coup4L*IMP2*(coup1L*coup2R*int2*MassEx22 -& 
&  1.*coup1R*coup2R*int1*MassEx2*mF1 + coup1R*coup2L*int2*MassEx2*MFin - 1.*coup1L*coup2L*int1*mF1*MFin))& 
& /(MassEx22 - 1.*MFin2)
  PVOddllVLR=PVOddllVLR+(chargefactor*coup3L*coup4R*IMP2*(coup1R*coup2L*int2*MassEx22 -& 
&  1.*coup1L*coup2L*int1*MassEx2*mF1 + coup1L*coup2R*int2*MassEx2*MFin - 1.*coup1R*coup2R*int1*mF1*MFin))& 
& /(MassEx22 - 1.*MFin2)
  PVOddllTLL=PVOddllTLL+0.
  PVOddllTLR=PVOddllTLR+0.
  PVOddllTRL=PVOddllTRL+0.
  PVOddllTRR=PVOddllTRR+0.
     End if 
  End if 
End if 
    End Do 
  End Do 


 ! Propagator: VZ, Loop particles: Fu,Hp, Internal fermion: Fd
! Generic diagram: FSF,  InsertionOrder: 2
chargefactor = 1 
Do i1=1,3
    Do i3=1,3
If ((MFu2(i1).gt.mf_l2(3)).Or.(MHp2.gt.mf_l2(3))) Then
If (((i1.lt.4).and.(i3.lt.4)).or.(.not.OnlySM)) Then 
coup3L = cplcFdFdVZL(i3,gt1)
coup3R = cplcFdFdVZR(i3,gt1)
coup2L = cplcFuFdHpL(i1,i3)
coup2R = cplcFuFdHpR(i1,i3)
coup1L = cplcFdFucHpL(gt2,i1)
coup1R = cplcFdFucHpR(gt2,i1)
coup4L = cplcFeFeVZL(gt4,gt3)
coup4R = cplcFeFeVZR(gt4,gt3)
! Masses in loop
mF1 = MFu(i1)
mF12 = MFu2(i1)
mS1 = MHp
mS12 = MHp2
! Mass of internal fermion 
MFin = MFd(i3)-MFd(gt2)
MFin2 = MFd2(i3)-MFd2(gt2)
If (Abs(MFin).gt.10E-10_dp) Then 
MFin = MFd(i3)
MFin2 = MFd2(i3)
! Propagator and inverse propagator mass 
MP = MVZ
MP2 = MVZ2
IMP = 1._dp/MP  
IMP2 = 1._dp/MP2 
! Amplitude 
  int1=B0(0._dp, mF12, mS12)
  int2=B1(0._dp, mF12, mS12)
  PVOddllSLL=PVOddllSLL+0.
  PVOddllSRR=PVOddllSRR+0.
  PVOddllSRL=PVOddllSRL+0.
  PVOddllSLR=PVOddllSLR+0.
  PVOddllVRR=PVOddllVRR+(chargefactor*coup3R*coup4R*IMP2*(coup1L*coup2R*int2*MassEx22 -& 
&  1.*coup1R*coup2R*int1*MassEx2*mF1 + coup1R*coup2L*int2*MassEx2*MFin - 1.*coup1L*coup2L*int1*mF1*MFin))& 
& /(MassEx22 - 1.*MFin2)
  PVOddllVLL=PVOddllVLL+(chargefactor*coup3L*coup4L*IMP2*(coup1R*coup2L*int2*MassEx22 -& 
&  1.*coup1L*coup2L*int1*MassEx2*mF1 + coup1L*coup2R*int2*MassEx2*MFin - 1.*coup1R*coup2R*int1*mF1*MFin))& 
& /(MassEx22 - 1.*MFin2)
  PVOddllVRL=PVOddllVRL+(chargefactor*coup3R*coup4L*IMP2*(coup1L*coup2R*int2*MassEx22 -& 
&  1.*coup1R*coup2R*int1*MassEx2*mF1 + coup1R*coup2L*int2*MassEx2*MFin - 1.*coup1L*coup2L*int1*mF1*MFin))& 
& /(MassEx22 - 1.*MFin2)
  PVOddllVLR=PVOddllVLR+(chargefactor*coup3L*coup4R*IMP2*(coup1R*coup2L*int2*MassEx22 -& 
&  1.*coup1L*coup2L*int1*MassEx2*mF1 + coup1L*coup2R*int2*MassEx2*MFin - 1.*coup1R*coup2R*int1*mF1*MFin))& 
& /(MassEx22 - 1.*MFin2)
  PVOddllTLL=PVOddllTLL+0.
  PVOddllTLR=PVOddllTLR+0.
  PVOddllTRL=PVOddllTRL+0.
  PVOddllTRR=PVOddllTRR+0.
     End if 
  End if 
End if 
    End Do 
  End Do 


 ! Propagator: VZ, Loop particles: Fu,VWp, Internal fermion: Fd
! Generic diagram: FVF,  InsertionOrder: 2
chargefactor = 1 
Do i1=1,3
    Do i3=1,3
If ((MFu2(i1).gt.mf_l2(3)).Or.(MVWp2.gt.mf_l2(3))) Then
If (((i1.lt.4).and.(i3.lt.4)).or.(.not.OnlySM)) Then 
coup3L = cplcFdFdVZL(i3,gt1)
coup3R = cplcFdFdVZR(i3,gt1)
coup2L = cplcFuFdVWpL(i1,i3)
coup2R = cplcFuFdVWpR(i1,i3)
coup1L = cplcFdFucVWpL(gt2,i1)
coup1R = cplcFdFucVWpR(gt2,i1)
coup4L = cplcFeFeVZL(gt4,gt3)
coup4R = cplcFeFeVZR(gt4,gt3)
! Masses in loop
mF1 = MFu(i1)
mF12 = MFu2(i1)
mV1 = MVWp
mV12 = MVWp2
! Mass of internal fermion 
MFin = MFd(i3)-MFd(gt2)
MFin2 = MFd2(i3)-MFd2(gt2)
If (Abs(MFin).gt.10E-10_dp) Then 
MFin = MFd(i3)
MFin2 = MFd2(i3)
! Propagator and inverse propagator mass 
MP = MVZ
MP2 = MVZ2
IMP = 1._dp/MP  
IMP2 = 1._dp/MP2 
! Amplitude 
  int1=B0(0._dp, mF12, mV12)
  int2=B1(0._dp, mF12, mV12)
  PVOddllSLL=PVOddllSLL+0.
  PVOddllSRR=PVOddllSRR+0.
  PVOddllSRL=PVOddllSRL+0.
  PVOddllSLR=PVOddllSLR+0.
  PVOddllVRR=PVOddllVRR+(chargefactor*coup3R*coup4R*IMP2*(coup1L*MassEx2*(-           & 
& 2.*coup2R*(Finite - 2.*int1)*mF1 + coup2L*(Finite + 2.*int2)*MFin) + coup1R*(coup2R*(Finite + 2.*int2)& 
& *MassEx22 - 2.*coup2L*(Finite - 2.*int1)*mF1*MFin)))/(MassEx22 - 1.*MFin2)
  PVOddllVLL=PVOddllVLL+(chargefactor*coup3L*coup4L*IMP2*(coup1R*MassEx2*(-           & 
& 2.*coup2L*(Finite - 2.*int1)*mF1 + coup2R*(Finite + 2.*int2)*MFin) + coup1L*(coup2L*(Finite + 2.*int2)& 
& *MassEx22 - 2.*coup2R*(Finite - 2.*int1)*mF1*MFin)))/(MassEx22 - 1.*MFin2)
  PVOddllVRL=PVOddllVRL+(chargefactor*coup3R*coup4L*IMP2*(coup1L*MassEx2*(-           & 
& 2.*coup2R*(Finite - 2.*int1)*mF1 + coup2L*(Finite + 2.*int2)*MFin) + coup1R*(coup2R*(Finite + 2.*int2)& 
& *MassEx22 - 2.*coup2L*(Finite - 2.*int1)*mF1*MFin)))/(MassEx22 - 1.*MFin2)
  PVOddllVLR=PVOddllVLR+(chargefactor*coup3L*coup4R*IMP2*(coup1R*MassEx2*(-           & 
& 2.*coup2L*(Finite - 2.*int1)*mF1 + coup2R*(Finite + 2.*int2)*MFin) + coup1L*(coup2L*(Finite + 2.*int2)& 
& *MassEx22 - 2.*coup2R*(Finite - 2.*int1)*mF1*MFin)))/(MassEx22 - 1.*MFin2)
  PVOddllTLL=PVOddllTLL+0.
  PVOddllTLR=PVOddllTLR+0.
  PVOddllTRL=PVOddllTRL+0.
  PVOddllTRR=PVOddllTRR+0.
     End if 
  End if 
End if 
    End Do 
  End Do 


 ! Propagator: VZ, Loop particles: Fd,VZ, Internal fermion: Fd
! Generic diagram: FVF,  InsertionOrder: 2
chargefactor = 1 
Do i1=1,3
    Do i3=1,3
If ((MFd2(i1).gt.mf_l2(3)).Or.(MVZ2.gt.mf_l2(3))) Then
If (((i1.lt.4).and.(i3.lt.4)).or.(.not.OnlySM)) Then 
coup3L = cplcFdFdVZL(i3,gt1)
coup3R = cplcFdFdVZR(i3,gt1)
coup2L = cplcFdFdVZL(i1,i3)
coup2R = cplcFdFdVZR(i1,i3)
coup1L = cplcFdFdVZL(gt2,i1)
coup1R = cplcFdFdVZR(gt2,i1)
coup4L = cplcFeFeVZL(gt4,gt3)
coup4R = cplcFeFeVZR(gt4,gt3)
! Masses in loop
mF1 = MFd(i1)
mF12 = MFd2(i1)
mV1 = MVZ
mV12 = MVZ2
! Mass of internal fermion 
MFin = MFd(i3)-MFd(gt2)
MFin2 = MFd2(i3)-MFd2(gt2)
If (Abs(MFin).gt.10E-10_dp) Then 
MFin = MFd(i3)
MFin2 = MFd2(i3)
! Propagator and inverse propagator mass 
MP = MVZ
MP2 = MVZ2
IMP = 1._dp/MP  
IMP2 = 1._dp/MP2 
! Amplitude 
  int1=B0(0._dp, mF12, mV12)
  int2=B1(0._dp, mF12, mV12)
  PVOddllSLL=PVOddllSLL+0.
  PVOddllSRR=PVOddllSRR+0.
  PVOddllSRL=PVOddllSRL+0.
  PVOddllSLR=PVOddllSLR+0.
  PVOddllVRR=PVOddllVRR+(chargefactor*coup3R*coup4R*IMP2*(coup1L*MassEx2*(-           & 
& 2.*coup2R*(Finite - 2.*int1)*mF1 + coup2L*(Finite + 2.*int2)*MFin) + coup1R*(coup2R*(Finite + 2.*int2)& 
& *MassEx22 - 2.*coup2L*(Finite - 2.*int1)*mF1*MFin)))/(MassEx22 - 1.*MFin2)
  PVOddllVLL=PVOddllVLL+(chargefactor*coup3L*coup4L*IMP2*(coup1R*MassEx2*(-           & 
& 2.*coup2L*(Finite - 2.*int1)*mF1 + coup2R*(Finite + 2.*int2)*MFin) + coup1L*(coup2L*(Finite + 2.*int2)& 
& *MassEx22 - 2.*coup2R*(Finite - 2.*int1)*mF1*MFin)))/(MassEx22 - 1.*MFin2)
  PVOddllVRL=PVOddllVRL+(chargefactor*coup3R*coup4L*IMP2*(coup1L*MassEx2*(-           & 
& 2.*coup2R*(Finite - 2.*int1)*mF1 + coup2L*(Finite + 2.*int2)*MFin) + coup1R*(coup2R*(Finite + 2.*int2)& 
& *MassEx22 - 2.*coup2L*(Finite - 2.*int1)*mF1*MFin)))/(MassEx22 - 1.*MFin2)
  PVOddllVLR=PVOddllVLR+(chargefactor*coup3L*coup4R*IMP2*(coup1R*MassEx2*(-           & 
& 2.*coup2L*(Finite - 2.*int1)*mF1 + coup2R*(Finite + 2.*int2)*MFin) + coup1L*(coup2L*(Finite + 2.*int2)& 
& *MassEx22 - 2.*coup2R*(Finite - 2.*int1)*mF1*MFin)))/(MassEx22 - 1.*MFin2)
  PVOddllTLL=PVOddllTLL+0.
  PVOddllTLR=PVOddllTLR+0.
  PVOddllTRL=PVOddllTRL+0.
  PVOddllTRR=PVOddllTRR+0.
     End if 
  End if 
End if 
    End Do 
  End Do 


 ! Propagator: VZ, Loop particles: Ah,Fe, Internal fermion: bar[Fe]
! Generic diagram: SFF,  InsertionOrder: 7
chargefactor = 1 
  Do i2=1,3
    Do i3=1,3
If ((MAh2.gt.mf_l2(3)).Or.(MFe2(i2).gt.mf_l2(3))) Then
If (((i2.lt.4).and.(i3.lt.4)).or.(.not.OnlySM)) Then 
coup1L = cplcFeFeAhL(i2,gt3)
coup1R = cplcFeFeAhR(i2,gt3)
coup2L = cplcFeFeAhL(i3,i2)
coup2R = cplcFeFeAhR(i3,i2)
coup3L = cplcFeFeVZL(gt4,i3)
coup3R = cplcFeFeVZR(gt4,i3)
coup4L = cplcFdFdVZL(gt2,gt1)
coup4R = cplcFdFdVZR(gt2,gt1)
! Masses in loop
mS1 = MAh
mS12 = MAh2
mF1 = MFe(i2)
mF12 = MFe2(i2)
! Mass of internal fermion 
MFin = MFe(i3)-MFe(gt3)
MFin2 = MFe2(i3)-MFe2(gt3)
If (Abs(MFin).gt.10E-10_dp) Then 
MFin = MFe(i3)
MFin2 = MFe2(i3)
! Propagator and inverse propagator mass 
MP = MVZ
MP2 = MVZ2
IMP = 1._dp/MP  
IMP2 = 1._dp/MP2 
! Amplitude 
  int1=B0(0._dp, mF12, mS12)
  int2=B1(0._dp, mF12, mS12)
  PVOddllSLL=PVOddllSLL+0.
  PVOddllSRR=PVOddllSRR+0.
  PVOddllSRL=PVOddllSRL+0.
  PVOddllSLR=PVOddllSLR+0.
  PVOddllVRR=PVOddllVRR+(chargefactor*coup3R*coup4R*IMP2*(coup1R*coup2L*int2*MassEx32 -& 
&  1.*coup1L*coup2L*int1*MassEx3*mF1 + coup1L*coup2R*int2*MassEx3*MFin - 1.*coup1R*coup2R*int1*mF1*MFin))& 
& /(MassEx32 - 1.*MFin2)
  PVOddllVLL=PVOddllVLL+(chargefactor*coup3L*coup4L*IMP2*(coup1L*coup2R*int2*MassEx32 -& 
&  1.*coup1R*coup2R*int1*MassEx3*mF1 + coup1R*coup2L*int2*MassEx3*MFin - 1.*coup1L*coup2L*int1*mF1*MFin))& 
& /(MassEx32 - 1.*MFin2)
  PVOddllVRL=PVOddllVRL+(chargefactor*coup3L*coup4R*IMP2*(coup1L*coup2R*int2*MassEx32 -& 
&  1.*coup1R*coup2R*int1*MassEx3*mF1 + coup1R*coup2L*int2*MassEx3*MFin - 1.*coup1L*coup2L*int1*mF1*MFin))& 
& /(MassEx32 - 1.*MFin2)
  PVOddllVLR=PVOddllVLR+(chargefactor*coup3R*coup4L*IMP2*(coup1R*coup2L*int2*MassEx32 -& 
&  1.*coup1L*coup2L*int1*MassEx3*mF1 + coup1L*coup2R*int2*MassEx3*MFin - 1.*coup1R*coup2R*int1*mF1*MFin))& 
& /(MassEx32 - 1.*MFin2)
  PVOddllTLL=PVOddllTLL+0.
  PVOddllTLR=PVOddllTLR+0.
  PVOddllTRL=PVOddllTRL+0.
  PVOddllTRR=PVOddllTRR+0.
     End if 
  End if 
End if 
   End Do 
  End Do 


 ! Propagator: VZ, Loop particles: hh,Fe, Internal fermion: bar[Fe]
! Generic diagram: SFF,  InsertionOrder: 7
chargefactor = 1 
  Do i2=1,3
    Do i3=1,3
If ((Mhh2.gt.mf_l2(3)).Or.(MFe2(i2).gt.mf_l2(3))) Then
If (.not.OnlySM) Then 
coup1L = cplcFeFehhL(i2,gt3)
coup1R = cplcFeFehhR(i2,gt3)
coup2L = cplcFeFehhL(i3,i2)
coup2R = cplcFeFehhR(i3,i2)
coup3L = cplcFeFeVZL(gt4,i3)
coup3R = cplcFeFeVZR(gt4,i3)
coup4L = cplcFdFdVZL(gt2,gt1)
coup4R = cplcFdFdVZR(gt2,gt1)
! Masses in loop
mS1 = Mhh
mS12 = Mhh2
mF1 = MFe(i2)
mF12 = MFe2(i2)
! Mass of internal fermion 
MFin = MFe(i3)-MFe(gt3)
MFin2 = MFe2(i3)-MFe2(gt3)
If (Abs(MFin).gt.10E-10_dp) Then 
MFin = MFe(i3)
MFin2 = MFe2(i3)
! Propagator and inverse propagator mass 
MP = MVZ
MP2 = MVZ2
IMP = 1._dp/MP  
IMP2 = 1._dp/MP2 
! Amplitude 
  int1=B0(0._dp, mF12, mS12)
  int2=B1(0._dp, mF12, mS12)
  PVOddllSLL=PVOddllSLL+0.
  PVOddllSRR=PVOddllSRR+0.
  PVOddllSRL=PVOddllSRL+0.
  PVOddllSLR=PVOddllSLR+0.
  PVOddllVRR=PVOddllVRR+(chargefactor*coup3R*coup4R*IMP2*(coup1R*coup2L*int2*MassEx32 -& 
&  1.*coup1L*coup2L*int1*MassEx3*mF1 + coup1L*coup2R*int2*MassEx3*MFin - 1.*coup1R*coup2R*int1*mF1*MFin))& 
& /(MassEx32 - 1.*MFin2)
  PVOddllVLL=PVOddllVLL+(chargefactor*coup3L*coup4L*IMP2*(coup1L*coup2R*int2*MassEx32 -& 
&  1.*coup1R*coup2R*int1*MassEx3*mF1 + coup1R*coup2L*int2*MassEx3*MFin - 1.*coup1L*coup2L*int1*mF1*MFin))& 
& /(MassEx32 - 1.*MFin2)
  PVOddllVRL=PVOddllVRL+(chargefactor*coup3L*coup4R*IMP2*(coup1L*coup2R*int2*MassEx32 -& 
&  1.*coup1R*coup2R*int1*MassEx3*mF1 + coup1R*coup2L*int2*MassEx3*MFin - 1.*coup1L*coup2L*int1*mF1*MFin))& 
& /(MassEx32 - 1.*MFin2)
  PVOddllVLR=PVOddllVLR+(chargefactor*coup3R*coup4L*IMP2*(coup1R*coup2L*int2*MassEx32 -& 
&  1.*coup1L*coup2L*int1*MassEx3*mF1 + coup1L*coup2R*int2*MassEx3*MFin - 1.*coup1R*coup2R*int1*mF1*MFin))& 
& /(MassEx32 - 1.*MFin2)
  PVOddllTLL=PVOddllTLL+0.
  PVOddllTLR=PVOddllTLR+0.
  PVOddllTRL=PVOddllTRL+0.
  PVOddllTRR=PVOddllTRR+0.
     End if 
  End if 
End if 
   End Do 
  End Do 


 ! Propagator: VZ, Loop particles: VZ,Fe, Internal fermion: bar[Fe]
! Generic diagram: VFF,  InsertionOrder: 7
chargefactor = 1 
  Do i2=1,3
    Do i3=1,3
If ((MVZ2.gt.mf_l2(3)).Or.(MFe2(i2).gt.mf_l2(3))) Then
If (((i2.lt.4).and.(i3.lt.4)).or.(.not.OnlySM)) Then 
coup1L = cplcFeFeVZL(i2,gt3)
coup1R = cplcFeFeVZR(i2,gt3)
coup2L = cplcFeFeVZL(i3,i2)
coup2R = cplcFeFeVZR(i3,i2)
coup3L = cplcFeFeVZL(gt4,i3)
coup3R = cplcFeFeVZR(gt4,i3)
coup4L = cplcFdFdVZL(gt2,gt1)
coup4R = cplcFdFdVZR(gt2,gt1)
! Masses in loop
mV1 = MVZ
mV12 = MVZ2
mF1 = MFe(i2)
mF12 = MFe2(i2)
! Mass of internal fermion 
MFin = MFe(i3)-MFe(gt3)
MFin2 = MFe2(i3)-MFe2(gt3)
If (Abs(MFin).gt.10E-10_dp) Then 
MFin = MFe(i3)
MFin2 = MFe2(i3)
! Propagator and inverse propagator mass 
MP = MVZ
MP2 = MVZ2
IMP = 1._dp/MP  
IMP2 = 1._dp/MP2 
! Amplitude 
  int1=B0(0._dp, mF12, mV12)
  int2=B1(0._dp, mF12, mV12)
  PVOddllSLL=PVOddllSLL+0.
  PVOddllSRR=PVOddllSRR+0.
  PVOddllSRL=PVOddllSRL+0.
  PVOddllSLR=PVOddllSLR+0.
  PVOddllVRR=PVOddllVRR+(chargefactor*coup3R*coup4R*IMP2*(coup1L*MassEx3*(-           & 
& 2.*coup2R*(Finite - 2.*int1)*mF1 + coup2L*(Finite + 2.*int2)*MFin) + coup1R*(coup2R*(Finite + 2.*int2)& 
& *MassEx32 - 2.*coup2L*(Finite - 2.*int1)*mF1*MFin)))/(MassEx32 - 1.*MFin2)
  PVOddllVLL=PVOddllVLL+(chargefactor*coup3L*coup4L*IMP2*(coup1R*MassEx3*(-           & 
& 2.*coup2L*(Finite - 2.*int1)*mF1 + coup2R*(Finite + 2.*int2)*MFin) + coup1L*(coup2L*(Finite + 2.*int2)& 
& *MassEx32 - 2.*coup2R*(Finite - 2.*int1)*mF1*MFin)))/(MassEx32 - 1.*MFin2)
  PVOddllVRL=PVOddllVRL+(chargefactor*coup3L*coup4R*IMP2*(coup1R*MassEx3*(-           & 
& 2.*coup2L*(Finite - 2.*int1)*mF1 + coup2R*(Finite + 2.*int2)*MFin) + coup1L*(coup2L*(Finite + 2.*int2)& 
& *MassEx32 - 2.*coup2R*(Finite - 2.*int1)*mF1*MFin)))/(MassEx32 - 1.*MFin2)
  PVOddllVLR=PVOddllVLR+(chargefactor*coup3R*coup4L*IMP2*(coup1L*MassEx3*(-           & 
& 2.*coup2R*(Finite - 2.*int1)*mF1 + coup2L*(Finite + 2.*int2)*MFin) + coup1R*(coup2R*(Finite + 2.*int2)& 
& *MassEx32 - 2.*coup2L*(Finite - 2.*int1)*mF1*MFin)))/(MassEx32 - 1.*MFin2)
  PVOddllTLL=PVOddllTLL+0.
  PVOddllTLR=PVOddllTLR+0.
  PVOddllTRL=PVOddllTRL+0.
  PVOddllTRR=PVOddllTRR+0.
     End if 
  End if 
End if 
   End Do 
  End Do 


 ! Propagator: VZ, Loop particles: Fe,Ah, Internal fermion: Fe
! Generic diagram: FSF,  InsertionOrder: 8
chargefactor = 1 
Do i1=1,3
    Do i3=1,3
If ((MFe2(i1).gt.mf_l2(3)).Or.(MAh2.gt.mf_l2(3))) Then
If (((i1.lt.4).and.(i3.lt.4)).or.(.not.OnlySM)) Then 
coup3L = cplcFeFeVZL(i3,gt3)
coup3R = cplcFeFeVZR(i3,gt3)
coup2L = cplcFeFeAhL(i1,i3)
coup2R = cplcFeFeAhR(i1,i3)
coup1L = cplcFeFeAhL(gt4,i1)
coup1R = cplcFeFeAhR(gt4,i1)
coup4L = cplcFdFdVZL(gt2,gt1)
coup4R = cplcFdFdVZR(gt2,gt1)
! Masses in loop
mF1 = MFe(i1)
mF12 = MFe2(i1)
mS1 = MAh
mS12 = MAh2
! Mass of internal fermion 
MFin = MFe(i3)-MFe(gt4)
MFin2 = MFe2(i3)-MFe2(gt4)
If (Abs(MFin).gt.10E-10_dp) Then 
MFin = MFe(i3)
MFin2 = MFe2(i3)
! Propagator and inverse propagator mass 
MP = MVZ
MP2 = MVZ2
IMP = 1._dp/MP  
IMP2 = 1._dp/MP2 
! Amplitude 
  int1=B0(0._dp, mF12, mS12)
  int2=B1(0._dp, mF12, mS12)
  PVOddllSLL=PVOddllSLL+0.
  PVOddllSRR=PVOddllSRR+0.
  PVOddllSRL=PVOddllSRL+0.
  PVOddllSLR=PVOddllSLR+0.
  PVOddllVRR=PVOddllVRR+(chargefactor*coup3R*coup4R*IMP2*(coup1L*coup2R*int2*MassEx42 -& 
&  1.*coup1R*coup2R*int1*MassEx4*mF1 + coup1R*coup2L*int2*MassEx4*MFin - 1.*coup1L*coup2L*int1*mF1*MFin))& 
& /(MassEx42 - 1.*MFin2)
  PVOddllVLL=PVOddllVLL+(chargefactor*coup3L*coup4L*IMP2*(coup1R*coup2L*int2*MassEx42 -& 
&  1.*coup1L*coup2L*int1*MassEx4*mF1 + coup1L*coup2R*int2*MassEx4*MFin - 1.*coup1R*coup2R*int1*mF1*MFin))& 
& /(MassEx42 - 1.*MFin2)
  PVOddllVRL=PVOddllVRL+(chargefactor*coup3L*coup4R*IMP2*(coup1R*coup2L*int2*MassEx42 -& 
&  1.*coup1L*coup2L*int1*MassEx4*mF1 + coup1L*coup2R*int2*MassEx4*MFin - 1.*coup1R*coup2R*int1*mF1*MFin))& 
& /(MassEx42 - 1.*MFin2)
  PVOddllVLR=PVOddllVLR+(chargefactor*coup3R*coup4L*IMP2*(coup1L*coup2R*int2*MassEx42 -& 
&  1.*coup1R*coup2R*int1*MassEx4*mF1 + coup1R*coup2L*int2*MassEx4*MFin - 1.*coup1L*coup2L*int1*mF1*MFin))& 
& /(MassEx42 - 1.*MFin2)
  PVOddllTLL=PVOddllTLL+0.
  PVOddllTLR=PVOddllTLR+0.
  PVOddllTRL=PVOddllTRL+0.
  PVOddllTRR=PVOddllTRR+0.
     End if 
  End if 
End if 
    End Do 
  End Do 


 ! Propagator: VZ, Loop particles: Fe,hh, Internal fermion: Fe
! Generic diagram: FSF,  InsertionOrder: 8
chargefactor = 1 
Do i1=1,3
    Do i3=1,3
If ((MFe2(i1).gt.mf_l2(3)).Or.(Mhh2.gt.mf_l2(3))) Then
If (.not.OnlySM) Then 
coup3L = cplcFeFeVZL(i3,gt3)
coup3R = cplcFeFeVZR(i3,gt3)
coup2L = cplcFeFehhL(i1,i3)
coup2R = cplcFeFehhR(i1,i3)
coup1L = cplcFeFehhL(gt4,i1)
coup1R = cplcFeFehhR(gt4,i1)
coup4L = cplcFdFdVZL(gt2,gt1)
coup4R = cplcFdFdVZR(gt2,gt1)
! Masses in loop
mF1 = MFe(i1)
mF12 = MFe2(i1)
mS1 = Mhh
mS12 = Mhh2
! Mass of internal fermion 
MFin = MFe(i3)-MFe(gt4)
MFin2 = MFe2(i3)-MFe2(gt4)
If (Abs(MFin).gt.10E-10_dp) Then 
MFin = MFe(i3)
MFin2 = MFe2(i3)
! Propagator and inverse propagator mass 
MP = MVZ
MP2 = MVZ2
IMP = 1._dp/MP  
IMP2 = 1._dp/MP2 
! Amplitude 
  int1=B0(0._dp, mF12, mS12)
  int2=B1(0._dp, mF12, mS12)
  PVOddllSLL=PVOddllSLL+0.
  PVOddllSRR=PVOddllSRR+0.
  PVOddllSRL=PVOddllSRL+0.
  PVOddllSLR=PVOddllSLR+0.
  PVOddllVRR=PVOddllVRR+(chargefactor*coup3R*coup4R*IMP2*(coup1L*coup2R*int2*MassEx42 -& 
&  1.*coup1R*coup2R*int1*MassEx4*mF1 + coup1R*coup2L*int2*MassEx4*MFin - 1.*coup1L*coup2L*int1*mF1*MFin))& 
& /(MassEx42 - 1.*MFin2)
  PVOddllVLL=PVOddllVLL+(chargefactor*coup3L*coup4L*IMP2*(coup1R*coup2L*int2*MassEx42 -& 
&  1.*coup1L*coup2L*int1*MassEx4*mF1 + coup1L*coup2R*int2*MassEx4*MFin - 1.*coup1R*coup2R*int1*mF1*MFin))& 
& /(MassEx42 - 1.*MFin2)
  PVOddllVRL=PVOddllVRL+(chargefactor*coup3L*coup4R*IMP2*(coup1R*coup2L*int2*MassEx42 -& 
&  1.*coup1L*coup2L*int1*MassEx4*mF1 + coup1L*coup2R*int2*MassEx4*MFin - 1.*coup1R*coup2R*int1*mF1*MFin))& 
& /(MassEx42 - 1.*MFin2)
  PVOddllVLR=PVOddllVLR+(chargefactor*coup3R*coup4L*IMP2*(coup1L*coup2R*int2*MassEx42 -& 
&  1.*coup1R*coup2R*int1*MassEx4*mF1 + coup1R*coup2L*int2*MassEx4*MFin - 1.*coup1L*coup2L*int1*mF1*MFin))& 
& /(MassEx42 - 1.*MFin2)
  PVOddllTLL=PVOddllTLL+0.
  PVOddllTLR=PVOddllTLR+0.
  PVOddllTRL=PVOddllTRL+0.
  PVOddllTRR=PVOddllTRR+0.
     End if 
  End if 
End if 
    End Do 
  End Do 


 ! Propagator: VZ, Loop particles: Fe,VZ, Internal fermion: Fe
! Generic diagram: FVF,  InsertionOrder: 8
chargefactor = 1 
Do i1=1,3
    Do i3=1,3
If ((MFe2(i1).gt.mf_l2(3)).Or.(MVZ2.gt.mf_l2(3))) Then
If (((i1.lt.4).and.(i3.lt.4)).or.(.not.OnlySM)) Then 
coup3L = cplcFeFeVZL(i3,gt3)
coup3R = cplcFeFeVZR(i3,gt3)
coup2L = cplcFeFeVZL(i1,i3)
coup2R = cplcFeFeVZR(i1,i3)
coup1L = cplcFeFeVZL(gt4,i1)
coup1R = cplcFeFeVZR(gt4,i1)
coup4L = cplcFdFdVZL(gt2,gt1)
coup4R = cplcFdFdVZR(gt2,gt1)
! Masses in loop
mF1 = MFe(i1)
mF12 = MFe2(i1)
mV1 = MVZ
mV12 = MVZ2
! Mass of internal fermion 
MFin = MFe(i3)-MFe(gt4)
MFin2 = MFe2(i3)-MFe2(gt4)
If (Abs(MFin).gt.10E-10_dp) Then 
MFin = MFe(i3)
MFin2 = MFe2(i3)
! Propagator and inverse propagator mass 
MP = MVZ
MP2 = MVZ2
IMP = 1._dp/MP  
IMP2 = 1._dp/MP2 
! Amplitude 
  int1=B0(0._dp, mF12, mV12)
  int2=B1(0._dp, mF12, mV12)
  PVOddllSLL=PVOddllSLL+0.
  PVOddllSRR=PVOddllSRR+0.
  PVOddllSRL=PVOddllSRL+0.
  PVOddllSLR=PVOddllSLR+0.
  PVOddllVRR=PVOddllVRR+(chargefactor*coup3R*coup4R*IMP2*(coup1L*MassEx4*(-           & 
& 2.*coup2R*(Finite - 2.*int1)*mF1 + coup2L*(Finite + 2.*int2)*MFin) + coup1R*(coup2R*(Finite + 2.*int2)& 
& *MassEx42 - 2.*coup2L*(Finite - 2.*int1)*mF1*MFin)))/(MassEx42 - 1.*MFin2)
  PVOddllVLL=PVOddllVLL+(chargefactor*coup3L*coup4L*IMP2*(coup1R*MassEx4*(-           & 
& 2.*coup2L*(Finite - 2.*int1)*mF1 + coup2R*(Finite + 2.*int2)*MFin) + coup1L*(coup2L*(Finite + 2.*int2)& 
& *MassEx42 - 2.*coup2R*(Finite - 2.*int1)*mF1*MFin)))/(MassEx42 - 1.*MFin2)
  PVOddllVRL=PVOddllVRL+(chargefactor*coup3L*coup4R*IMP2*(coup1R*MassEx4*(-           & 
& 2.*coup2L*(Finite - 2.*int1)*mF1 + coup2R*(Finite + 2.*int2)*MFin) + coup1L*(coup2L*(Finite + 2.*int2)& 
& *MassEx42 - 2.*coup2R*(Finite - 2.*int1)*mF1*MFin)))/(MassEx42 - 1.*MFin2)
  PVOddllVLR=PVOddllVLR+(chargefactor*coup3R*coup4L*IMP2*(coup1L*MassEx4*(-           & 
& 2.*coup2R*(Finite - 2.*int1)*mF1 + coup2L*(Finite + 2.*int2)*MFin) + coup1R*(coup2R*(Finite + 2.*int2)& 
& *MassEx42 - 2.*coup2L*(Finite - 2.*int1)*mF1*MFin)))/(MassEx42 - 1.*MFin2)
  PVOddllTLL=PVOddllTLL+0.
  PVOddllTLR=PVOddllTLR+0.
  PVOddllTRL=PVOddllTRL+0.
  PVOddllTRR=PVOddllTRR+0.
     End if 
  End if 
End if 
    End Do 
  End Do 


 !---------------------------------------- 
! Vector Penguin Contributions            
!---------------------------------------- 
! --  VZ - Penguins            
! Propagator: VZ, Loop particles: Ah,Fd,Fd
! Generic diagram: SFF,  InsertionOrder: 1
chargefactor = 1 
  Do i2=1,3
    Do i3=1,3
If ((MAh2.gt.mf_l2(3)).Or.(MFd2(i2).gt.mf_l2(3)).Or.(MFd2(i3).gt.mf_l2(3))) Then
If (((i2.lt.4).and.(i3.lt.4)).or.(.not.OnlySM)) Then 
coup1L = cplcFdFdAhL(i2,gt1)
coup1R = cplcFdFdAhR(i2,gt1)
coup2L = cplcFdFdAhL(gt2,i3)
coup2R = cplcFdFdAhR(gt2,i3)
coup3L = cplcFdFdVZL(i3,i2)
coup3R = cplcFdFdVZR(i3,i2)
coup4L = cplcFeFeVZL(gt4,gt3)
coup4R = cplcFeFeVZR(gt4,gt3)
! Masses in loop
mS1 = MAh
mS12 = MAh2
mF1 = MFd(i2)
mF12 = MFd2(i2)
mF2 = MFd(i3)
mF22 = MFd2(i3)
! Propagator and inverse propagator mass 
MP = MVZ
MP2 = MVZ2
IMP = 1._dp/MP  
IMP2 = 1._dp/MP2 
! Amplitude 
  int1=B0C0check(mF22, mF12, mS12)
  int2=C00_3m(mF22, mF12, mS12)
  int3=C0check(mF22, mF12, mS12)
  PVOddllSLL=PVOddllSLL+0.
  PVOddllSRR=PVOddllSRR+0.
  PVOddllSRL=PVOddllSRL+0.
  PVOddllSLR=PVOddllSLR+0.
  PVOddllVRR=PVOddllVRR+chargefactor*coup1R*coup2L*coup4R*IMP2*(coup3L*(int1 -        & 
&  2.*int2) - 1.*coup3R*int3*mF1*mF2)
  PVOddllVLL=PVOddllVLL+chargefactor*coup1L*coup2R*coup4L*IMP2*(coup3R*(int1 -        & 
&  2.*int2) - 1.*coup3L*int3*mF1*mF2)
  PVOddllVRL=PVOddllVRL+chargefactor*coup1R*coup2L*coup4L*IMP2*(coup3L*(int1 -        & 
&  2.*int2) - 1.*coup3R*int3*mF1*mF2)
  PVOddllVLR=PVOddllVLR+chargefactor*coup1L*coup2R*coup4R*IMP2*(coup3R*(int1 -        & 
&  2.*int2) - 1.*coup3L*int3*mF1*mF2)
  PVOddllTLL=PVOddllTLL+0.
  PVOddllTLR=PVOddllTLR+0.
  PVOddllTRL=PVOddllTRL+0.
  PVOddllTRR=PVOddllTRR+0.
  End if 
End if 
   End Do 
  End Do 


 ! Propagator: VZ, Loop particles: hh,Fd,Fd
! Generic diagram: SFF,  InsertionOrder: 1
chargefactor = 1 
  Do i2=1,3
    Do i3=1,3
If ((Mhh2.gt.mf_l2(3)).Or.(MFd2(i2).gt.mf_l2(3)).Or.(MFd2(i3).gt.mf_l2(3))) Then
If (.not.OnlySM) Then 
coup1L = cplcFdFdhhL(i2,gt1)
coup1R = cplcFdFdhhR(i2,gt1)
coup2L = cplcFdFdhhL(gt2,i3)
coup2R = cplcFdFdhhR(gt2,i3)
coup3L = cplcFdFdVZL(i3,i2)
coup3R = cplcFdFdVZR(i3,i2)
coup4L = cplcFeFeVZL(gt4,gt3)
coup4R = cplcFeFeVZR(gt4,gt3)
! Masses in loop
mS1 = Mhh
mS12 = Mhh2
mF1 = MFd(i2)
mF12 = MFd2(i2)
mF2 = MFd(i3)
mF22 = MFd2(i3)
! Propagator and inverse propagator mass 
MP = MVZ
MP2 = MVZ2
IMP = 1._dp/MP  
IMP2 = 1._dp/MP2 
! Amplitude 
  int1=B0C0check(mF22, mF12, mS12)
  int2=C00_3m(mF22, mF12, mS12)
  int3=C0check(mF22, mF12, mS12)
  PVOddllSLL=PVOddllSLL+0.
  PVOddllSRR=PVOddllSRR+0.
  PVOddllSRL=PVOddllSRL+0.
  PVOddllSLR=PVOddllSLR+0.
  PVOddllVRR=PVOddllVRR+chargefactor*coup1R*coup2L*coup4R*IMP2*(coup3L*(int1 -        & 
&  2.*int2) - 1.*coup3R*int3*mF1*mF2)
  PVOddllVLL=PVOddllVLL+chargefactor*coup1L*coup2R*coup4L*IMP2*(coup3R*(int1 -        & 
&  2.*int2) - 1.*coup3L*int3*mF1*mF2)
  PVOddllVRL=PVOddllVRL+chargefactor*coup1R*coup2L*coup4L*IMP2*(coup3L*(int1 -        & 
&  2.*int2) - 1.*coup3R*int3*mF1*mF2)
  PVOddllVLR=PVOddllVLR+chargefactor*coup1L*coup2R*coup4R*IMP2*(coup3R*(int1 -        & 
&  2.*int2) - 1.*coup3L*int3*mF1*mF2)
  PVOddllTLL=PVOddllTLL+0.
  PVOddllTLR=PVOddllTLR+0.
  PVOddllTRL=PVOddllTRL+0.
  PVOddllTRR=PVOddllTRR+0.
  End if 
End if 
   End Do 
  End Do 


 ! Propagator: VZ, Loop particles: Hp,Fu,Fu
! Generic diagram: SFF,  InsertionOrder: 1
chargefactor = 1 
  Do i2=1,3
    Do i3=1,3
If ((MHp2.gt.mf_l2(3)).Or.(MFu2(i2).gt.mf_l2(3)).Or.(MFu2(i3).gt.mf_l2(3))) Then
If (((i2.lt.4).and.(i3.lt.4)).or.(.not.OnlySM)) Then 
coup1L = cplcFuFdHpL(i2,gt1)
coup1R = cplcFuFdHpR(i2,gt1)
coup2L = cplcFdFucHpL(gt2,i3)
coup2R = cplcFdFucHpR(gt2,i3)
coup3L = cplcFuFuVZL(i3,i2)
coup3R = cplcFuFuVZR(i3,i2)
coup4L = cplcFeFeVZL(gt4,gt3)
coup4R = cplcFeFeVZR(gt4,gt3)
! Masses in loop
mS1 = MHp
mS12 = MHp2
mF1 = MFu(i2)
mF12 = MFu2(i2)
mF2 = MFu(i3)
mF22 = MFu2(i3)
! Propagator and inverse propagator mass 
MP = MVZ
MP2 = MVZ2
IMP = 1._dp/MP  
IMP2 = 1._dp/MP2 
! Amplitude 
  int1=B0C0check(mF22, mF12, mS12)
  int2=C00_3m(mF22, mF12, mS12)
  int3=C0check(mF22, mF12, mS12)
  PVOddllSLL=PVOddllSLL+0.
  PVOddllSRR=PVOddllSRR+0.
  PVOddllSRL=PVOddllSRL+0.
  PVOddllSLR=PVOddllSLR+0.
  PVOddllVRR=PVOddllVRR+chargefactor*coup1R*coup2L*coup4R*IMP2*(coup3L*(int1 -        & 
&  2.*int2) - 1.*coup3R*int3*mF1*mF2)
  PVOddllVLL=PVOddllVLL+chargefactor*coup1L*coup2R*coup4L*IMP2*(coup3R*(int1 -        & 
&  2.*int2) - 1.*coup3L*int3*mF1*mF2)
  PVOddllVRL=PVOddllVRL+chargefactor*coup1R*coup2L*coup4L*IMP2*(coup3L*(int1 -        & 
&  2.*int2) - 1.*coup3R*int3*mF1*mF2)
  PVOddllVLR=PVOddllVLR+chargefactor*coup1L*coup2R*coup4R*IMP2*(coup3R*(int1 -        & 
&  2.*int2) - 1.*coup3L*int3*mF1*mF2)
  PVOddllTLL=PVOddllTLL+0.
  PVOddllTLR=PVOddllTLR+0.
  PVOddllTRL=PVOddllTRL+0.
  PVOddllTRR=PVOddllTRR+0.
  End if 
End if 
   End Do 
  End Do 


 ! Propagator: VZ, Loop particles: VWp,Fu,Fu
! Generic diagram: VFF,  InsertionOrder: 1
chargefactor = 1 
  Do i2=1,3
    Do i3=1,3
If ((MVWp2.gt.mf_l2(3)).Or.(MFu2(i2).gt.mf_l2(3)).Or.(MFu2(i3).gt.mf_l2(3))) Then
If (((i2.lt.4).and.(i3.lt.4)).or.(.not.OnlySM)) Then 
coup1L = cplcFuFdVWpL(i2,gt1)
coup1R = cplcFuFdVWpR(i2,gt1)
coup2L = cplcFdFucVWpL(gt2,i3)
coup2R = cplcFdFucVWpR(gt2,i3)
coup3L = cplcFuFuVZL(i3,i2)
coup3R = cplcFuFuVZR(i3,i2)
coup4L = cplcFeFeVZL(gt4,gt3)
coup4R = cplcFeFeVZR(gt4,gt3)
! Masses in loop
mV1 = MVWp
mV12 = MVWp2
mF1 = MFu(i2)
mF12 = MFu2(i2)
mF2 = MFu(i3)
mF22 = MFu2(i3)
! Propagator and inverse propagator mass 
MP = MVZ
MP2 = MVZ2
IMP = 1._dp/MP  
IMP2 = 1._dp/MP2 
! Amplitude 
  int1=B0C0check(mF22, mF12, mV12)
  int2=C00_3m(mF22, mF12, mV12)
  int3=C0check(mF22, mF12, mV12)
  PVOddllSLL=PVOddllSLL+0.
  PVOddllSRR=PVOddllSRR+0.
  PVOddllSRL=PVOddllSRL+0.
  PVOddllSLR=PVOddllSLR+0.
  PVOddllVRR=PVOddllVRR - 1.*chargefactor*coup1R*coup2R*coup4R*IMP2*(coup3R*(Finite - & 
&  2.*int1 + 4.*int2) + 2.*coup3L*int3*mF1*mF2)
  PVOddllVLL=PVOddllVLL - 1.*chargefactor*coup1L*coup2L*coup4L*IMP2*(coup3L*(Finite - & 
&  2.*int1 + 4.*int2) + 2.*coup3R*int3*mF1*mF2)
  PVOddllVRL=PVOddllVRL - 1.*chargefactor*coup1R*coup2R*coup4L*IMP2*(coup3R*(Finite - & 
&  2.*int1 + 4.*int2) + 2.*coup3L*int3*mF1*mF2)
  PVOddllVLR=PVOddllVLR - 1.*chargefactor*coup1L*coup2L*coup4R*IMP2*(coup3L*(Finite - & 
&  2.*int1 + 4.*int2) + 2.*coup3R*int3*mF1*mF2)
  PVOddllTLL=PVOddllTLL+0.
  PVOddllTLR=PVOddllTLR+0.
  PVOddllTRL=PVOddllTRL+0.
  PVOddllTRR=PVOddllTRR+0.
  End if 
End if 
   End Do 
  End Do 


 ! Propagator: VZ, Loop particles: VZ,Fd,Fd
! Generic diagram: VFF,  InsertionOrder: 1
chargefactor = 1 
  Do i2=1,3
    Do i3=1,3
If ((MVZ2.gt.mf_l2(3)).Or.(MFd2(i2).gt.mf_l2(3)).Or.(MFd2(i3).gt.mf_l2(3))) Then
If (((i2.lt.4).and.(i3.lt.4)).or.(.not.OnlySM)) Then 
coup1L = cplcFdFdVZL(i2,gt1)
coup1R = cplcFdFdVZR(i2,gt1)
coup2L = cplcFdFdVZL(gt2,i3)
coup2R = cplcFdFdVZR(gt2,i3)
coup3L = cplcFdFdVZL(i3,i2)
coup3R = cplcFdFdVZR(i3,i2)
coup4L = cplcFeFeVZL(gt4,gt3)
coup4R = cplcFeFeVZR(gt4,gt3)
! Masses in loop
mV1 = MVZ
mV12 = MVZ2
mF1 = MFd(i2)
mF12 = MFd2(i2)
mF2 = MFd(i3)
mF22 = MFd2(i3)
! Propagator and inverse propagator mass 
MP = MVZ
MP2 = MVZ2
IMP = 1._dp/MP  
IMP2 = 1._dp/MP2 
! Amplitude 
  int1=B0C0check(mF22, mF12, mV12)
  int2=C00_3m(mF22, mF12, mV12)
  int3=C0check(mF22, mF12, mV12)
  PVOddllSLL=PVOddllSLL+0.
  PVOddllSRR=PVOddllSRR+0.
  PVOddllSRL=PVOddllSRL+0.
  PVOddllSLR=PVOddllSLR+0.
  PVOddllVRR=PVOddllVRR - 1.*chargefactor*coup1R*coup2R*coup4R*IMP2*(coup3R*(Finite - & 
&  2.*int1 + 4.*int2) + 2.*coup3L*int3*mF1*mF2)
  PVOddllVLL=PVOddllVLL - 1.*chargefactor*coup1L*coup2L*coup4L*IMP2*(coup3L*(Finite - & 
&  2.*int1 + 4.*int2) + 2.*coup3R*int3*mF1*mF2)
  PVOddllVRL=PVOddllVRL - 1.*chargefactor*coup1R*coup2R*coup4L*IMP2*(coup3R*(Finite - & 
&  2.*int1 + 4.*int2) + 2.*coup3L*int3*mF1*mF2)
  PVOddllVLR=PVOddllVLR - 1.*chargefactor*coup1L*coup2L*coup4R*IMP2*(coup3L*(Finite - & 
&  2.*int1 + 4.*int2) + 2.*coup3R*int3*mF1*mF2)
  PVOddllTLL=PVOddllTLL+0.
  PVOddllTLR=PVOddllTLR+0.
  PVOddllTRL=PVOddllTRL+0.
  PVOddllTRR=PVOddllTRR+0.
  End if 
End if 
   End Do 
  End Do 


 ! Propagator: VZ, Loop particles: bar[Fd],hh,Ah
! Generic diagram: FSS,  InsertionOrder: 1
chargefactor = 1 
Do i1=1,3
If ((MFd2(i1).gt.mf_l2(3)).Or.(Mhh2.gt.mf_l2(3)).Or.(MAh2.gt.mf_l2(3))) Then
If (.not.OnlySM) Then 
coup1L = cplcFdFdhhL(i1,gt1)
coup1R = cplcFdFdhhR(i1,gt1)
coup2L = cplcFdFdAhL(gt2,i1)
coup2R = cplcFdFdAhR(gt2,i1)
coup3 = cplAhhhVZ
coup4L = cplcFeFeVZL(gt4,gt3)
coup4R = cplcFeFeVZR(gt4,gt3)
! Masses in loop
mF1 = MFd(i1)
mF12 = MFd2(i1)
mS1 = Mhh
mS12 = Mhh2
mS2 = MAh
mS22 = MAh2
! Propagator and inverse propagator mass 
MP = MVZ
MP2 = MVZ2
IMP = 1._dp/MP  
IMP2 = 1._dp/MP2 
! Amplitude 
  int1=C00_3m(mF12, mS22, mS12)
  PVOddllSLL=PVOddllSLL+0.
  PVOddllSRR=PVOddllSRR+0.
  PVOddllSRL=PVOddllSRL+0.
  PVOddllSLR=PVOddllSLR+0.
  PVOddllVRR=PVOddllVRR+2.*chargefactor*coup1R*coup2L*coup3*coup4R*IMP2*int1
  PVOddllVLL=PVOddllVLL+2.*chargefactor*coup1L*coup2R*coup3*coup4L*IMP2*int1
  PVOddllVRL=PVOddllVRL+2.*chargefactor*coup1R*coup2L*coup3*coup4L*IMP2*int1
  PVOddllVLR=PVOddllVLR+2.*chargefactor*coup1L*coup2R*coup3*coup4R*IMP2*int1
  PVOddllTLL=PVOddllTLL+0.
  PVOddllTLR=PVOddllTLR+0.
  PVOddllTRL=PVOddllTRL+0.
  PVOddllTRR=PVOddllTRR+0.
  End if 
End if 
    End Do 


 ! Propagator: VZ, Loop particles: bar[Fd],Ah,hh
! Generic diagram: FSS,  InsertionOrder: 1
chargefactor = 1 
Do i1=1,3
If ((MFd2(i1).gt.mf_l2(3)).Or.(MAh2.gt.mf_l2(3)).Or.(Mhh2.gt.mf_l2(3))) Then
If (.not.OnlySM) Then 
coup1L = cplcFdFdAhL(i1,gt1)
coup1R = cplcFdFdAhR(i1,gt1)
coup2L = cplcFdFdhhL(gt2,i1)
coup2R = cplcFdFdhhR(gt2,i1)
coup3 = -cplAhhhVZ
coup4L = cplcFeFeVZL(gt4,gt3)
coup4R = cplcFeFeVZR(gt4,gt3)
! Masses in loop
mF1 = MFd(i1)
mF12 = MFd2(i1)
mS1 = MAh
mS12 = MAh2
mS2 = Mhh
mS22 = Mhh2
! Propagator and inverse propagator mass 
MP = MVZ
MP2 = MVZ2
IMP = 1._dp/MP  
IMP2 = 1._dp/MP2 
! Amplitude 
  int1=C00_3m(mF12, mS22, mS12)
  PVOddllSLL=PVOddllSLL+0.
  PVOddllSRR=PVOddllSRR+0.
  PVOddllSRL=PVOddllSRL+0.
  PVOddllSLR=PVOddllSLR+0.
  PVOddllVRR=PVOddllVRR+2.*chargefactor*coup1R*coup2L*coup3*coup4R*IMP2*int1
  PVOddllVLL=PVOddllVLL+2.*chargefactor*coup1L*coup2R*coup3*coup4L*IMP2*int1
  PVOddllVRL=PVOddllVRL+2.*chargefactor*coup1R*coup2L*coup3*coup4L*IMP2*int1
  PVOddllVLR=PVOddllVLR+2.*chargefactor*coup1L*coup2R*coup3*coup4R*IMP2*int1
  PVOddllTLL=PVOddllTLL+0.
  PVOddllTLR=PVOddllTLR+0.
  PVOddllTRL=PVOddllTRL+0.
  PVOddllTRR=PVOddllTRR+0.
  End if 
End if 
    End Do 


 ! Propagator: VZ, Loop particles: bar[Fd],VZ,hh
! Generic diagram: FVS,  InsertionOrder: 1
chargefactor = 1 
Do i1=1,3
If ((MFd2(i1).gt.mf_l2(3)).Or.(MVZ2.gt.mf_l2(3)).Or.(Mhh2.gt.mf_l2(3))) Then
If (.not.OnlySM) Then 
coup1L = cplcFdFdVZL(i1,gt1)
coup1R = cplcFdFdVZR(i1,gt1)
coup2L = cplcFdFdhhL(gt2,i1)
coup2R = cplcFdFdhhR(gt2,i1)
coup3 = cplhhVZVZ
coup4L = cplcFeFeVZL(gt4,gt3)
coup4R = cplcFeFeVZR(gt4,gt3)
! Masses in loop
mF1 = MFd(i1)
mF12 = MFd2(i1)
mV1 = MVZ
mV12 = MVZ2
mS2 = Mhh
mS22 = Mhh2
! Propagator and inverse propagator mass 
MP = MVZ
MP2 = MVZ2
IMP = 1._dp/MP  
IMP2 = 1._dp/MP2 
! Amplitude 
  int1=C0check(mF12, mS22, mV12)
  PVOddllSLL=PVOddllSLL+0.
  PVOddllSRR=PVOddllSRR+0.
  PVOddllSRL=PVOddllSRL+0.
  PVOddllSLR=PVOddllSLR+0.
  PVOddllVRR=PVOddllVRR+chargefactor*coup1R*coup2L*coup3*coup4R*IMP2*int1*mF1
  PVOddllVLL=PVOddllVLL+chargefactor*coup1L*coup2R*coup3*coup4L*IMP2*int1*mF1
  PVOddllVRL=PVOddllVRL+chargefactor*coup1R*coup2L*coup3*coup4L*IMP2*int1*mF1
  PVOddllVLR=PVOddllVLR+chargefactor*coup1L*coup2R*coup3*coup4R*IMP2*int1*mF1
  PVOddllTLL=PVOddllTLL+0.
  PVOddllTLR=PVOddllTLR+0.
  PVOddllTRL=PVOddllTRL+0.
  PVOddllTRR=PVOddllTRR+0.
  End if 
End if 
    End Do 


 ! Propagator: VZ, Loop particles: bar[Fd],hh,VZ
! Generic diagram: FSV,  InsertionOrder: 1
chargefactor = 1 
Do i1=1,3
If ((MFd2(i1).gt.mf_l2(3)).Or.(Mhh2.gt.mf_l2(3)).Or.(MVZ2.gt.mf_l2(3))) Then
If (.not.OnlySM) Then 
coup1L = cplcFdFdhhL(i1,gt1)
coup1R = cplcFdFdhhR(i1,gt1)
coup2L = cplcFdFdVZL(gt2,i1)
coup2R = cplcFdFdVZR(gt2,i1)
coup3 = cplhhVZVZ
coup4L = cplcFeFeVZL(gt4,gt3)
coup4R = cplcFeFeVZR(gt4,gt3)
! Masses in loop
mF1 = MFd(i1)
mF12 = MFd2(i1)
mS1 = Mhh
mS12 = Mhh2
mV2 = MVZ
mV22 = MVZ2
! Propagator and inverse propagator mass 
MP = MVZ
MP2 = MVZ2
IMP = 1._dp/MP  
IMP2 = 1._dp/MP2 
! Amplitude 
  int1=C0check(mF12, mV22, mS12)
  PVOddllSLL=PVOddllSLL+0.
  PVOddllSRR=PVOddllSRR+0.
  PVOddllSRL=PVOddllSRL+0.
  PVOddllSLR=PVOddllSLR+0.
  PVOddllVRR=PVOddllVRR+chargefactor*coup1R*coup2R*coup3*coup4R*IMP2*int1*mF1
  PVOddllVLL=PVOddllVLL+chargefactor*coup1L*coup2L*coup3*coup4L*IMP2*int1*mF1
  PVOddllVRL=PVOddllVRL+chargefactor*coup1R*coup2R*coup3*coup4L*IMP2*int1*mF1
  PVOddllVLR=PVOddllVLR+chargefactor*coup1L*coup2L*coup3*coup4R*IMP2*int1*mF1
  PVOddllTLL=PVOddllTLL+0.
  PVOddllTLR=PVOddllTLR+0.
  PVOddllTRL=PVOddllTRL+0.
  PVOddllTRR=PVOddllTRR+0.
  End if 
End if 
    End Do 


 ! Propagator: VZ, Loop particles: bar[Fu],conj[Hp],conj[Hp]
! Generic diagram: FSS,  InsertionOrder: 1
chargefactor = 1 
Do i1=1,3
If ((MFu2(i1).gt.mf_l2(3)).Or.(MHp2.gt.mf_l2(3)).Or.(MHp2.gt.mf_l2(3))) Then
If (((i1.lt.4)).or.(.not.OnlySM)) Then 
coup1L = cplcFuFdHpL(i1,gt1)
coup1R = cplcFuFdHpR(i1,gt1)
coup2L = cplcFdFucHpL(gt2,i1)
coup2R = cplcFdFucHpR(gt2,i1)
coup3 = cplHpcHpVZ
coup4L = cplcFeFeVZL(gt4,gt3)
coup4R = cplcFeFeVZR(gt4,gt3)
! Masses in loop
mF1 = MFu(i1)
mF12 = MFu2(i1)
mS1 = MHp
mS12 = MHp2
mS2 = MHp
mS22 = MHp2
! Propagator and inverse propagator mass 
MP = MVZ
MP2 = MVZ2
IMP = 1._dp/MP  
IMP2 = 1._dp/MP2 
! Amplitude 
  int1=C00_3m(mF12, mS22, mS12)
  PVOddllSLL=PVOddllSLL+0.
  PVOddllSRR=PVOddllSRR+0.
  PVOddllSRL=PVOddllSRL+0.
  PVOddllSLR=PVOddllSLR+0.
  PVOddllVRR=PVOddllVRR+2.*chargefactor*coup1R*coup2L*coup3*coup4R*IMP2*int1
  PVOddllVLL=PVOddllVLL+2.*chargefactor*coup1L*coup2R*coup3*coup4L*IMP2*int1
  PVOddllVRL=PVOddllVRL+2.*chargefactor*coup1R*coup2L*coup3*coup4L*IMP2*int1
  PVOddllVLR=PVOddllVLR+2.*chargefactor*coup1L*coup2R*coup3*coup4R*IMP2*int1
  PVOddllTLL=PVOddllTLL+0.
  PVOddllTLR=PVOddllTLR+0.
  PVOddllTRL=PVOddllTRL+0.
  PVOddllTRR=PVOddllTRR+0.
  End if 
End if 
    End Do 


 ! Propagator: VZ, Loop particles: bar[Fu],conj[VWp],conj[Hp]
! Generic diagram: FVS,  InsertionOrder: 1
chargefactor = 1 
Do i1=1,3
If ((MFu2(i1).gt.mf_l2(3)).Or.(MVWp2.gt.mf_l2(3)).Or.(MHp2.gt.mf_l2(3))) Then
If (((i1.lt.4)).or.(.not.OnlySM)) Then 
coup1L = cplcFuFdVWpL(i1,gt1)
coup1R = cplcFuFdVWpR(i1,gt1)
coup2L = cplcFdFucHpL(gt2,i1)
coup2R = cplcFdFucHpR(gt2,i1)
coup3 = cplHpcVWpVZ
coup4L = cplcFeFeVZL(gt4,gt3)
coup4R = cplcFeFeVZR(gt4,gt3)
! Masses in loop
mF1 = MFu(i1)
mF12 = MFu2(i1)
mV1 = MVWp
mV12 = MVWp2
mS2 = MHp
mS22 = MHp2
! Propagator and inverse propagator mass 
MP = MVZ
MP2 = MVZ2
IMP = 1._dp/MP  
IMP2 = 1._dp/MP2 
! Amplitude 
  int1=C0check(mF12, mS22, mV12)
  PVOddllSLL=PVOddllSLL+0.
  PVOddllSRR=PVOddllSRR+0.
  PVOddllSRL=PVOddllSRL+0.
  PVOddllSLR=PVOddllSLR+0.
  PVOddllVRR=PVOddllVRR+chargefactor*coup1R*coup2L*coup3*coup4R*IMP2*int1*mF1
  PVOddllVLL=PVOddllVLL+chargefactor*coup1L*coup2R*coup3*coup4L*IMP2*int1*mF1
  PVOddllVRL=PVOddllVRL+chargefactor*coup1R*coup2L*coup3*coup4L*IMP2*int1*mF1
  PVOddllVLR=PVOddllVLR+chargefactor*coup1L*coup2R*coup3*coup4R*IMP2*int1*mF1
  PVOddllTLL=PVOddllTLL+0.
  PVOddllTLR=PVOddllTLR+0.
  PVOddllTRL=PVOddllTRL+0.
  PVOddllTRR=PVOddllTRR+0.
  End if 
End if 
    End Do 


 ! Propagator: VZ, Loop particles: bar[Fu],conj[Hp],conj[VWp]
! Generic diagram: FSV,  InsertionOrder: 1
chargefactor = 1 
Do i1=1,3
If ((MFu2(i1).gt.mf_l2(3)).Or.(MHp2.gt.mf_l2(3)).Or.(MVWp2.gt.mf_l2(3))) Then
If (((i1.lt.4)).or.(.not.OnlySM)) Then 
coup1L = cplcFuFdHpL(i1,gt1)
coup1R = cplcFuFdHpR(i1,gt1)
coup2L = cplcFdFucVWpL(gt2,i1)
coup2R = cplcFdFucVWpR(gt2,i1)
coup3 = cplcHpVWpVZ
coup4L = cplcFeFeVZL(gt4,gt3)
coup4R = cplcFeFeVZR(gt4,gt3)
! Masses in loop
mF1 = MFu(i1)
mF12 = MFu2(i1)
mS1 = MHp
mS12 = MHp2
mV2 = MVWp
mV22 = MVWp2
! Propagator and inverse propagator mass 
MP = MVZ
MP2 = MVZ2
IMP = 1._dp/MP  
IMP2 = 1._dp/MP2 
! Amplitude 
  int1=C0check(mF12, mV22, mS12)
  PVOddllSLL=PVOddllSLL+0.
  PVOddllSRR=PVOddllSRR+0.
  PVOddllSRL=PVOddllSRL+0.
  PVOddllSLR=PVOddllSLR+0.
  PVOddllVRR=PVOddllVRR+chargefactor*coup1R*coup2R*coup3*coup4R*IMP2*int1*mF1
  PVOddllVLL=PVOddllVLL+chargefactor*coup1L*coup2L*coup3*coup4L*IMP2*int1*mF1
  PVOddllVRL=PVOddllVRL+chargefactor*coup1R*coup2R*coup3*coup4L*IMP2*int1*mF1
  PVOddllVLR=PVOddllVLR+chargefactor*coup1L*coup2L*coup3*coup4R*IMP2*int1*mF1
  PVOddllTLL=PVOddllTLL+0.
  PVOddllTLR=PVOddllTLR+0.
  PVOddllTRL=PVOddllTRL+0.
  PVOddllTRR=PVOddllTRR+0.
  End if 
End if 
    End Do 


 ! Propagator: VZ, Loop particles: bar[Fu],conj[VWp],conj[VWp]
! Generic diagram: FVV,  InsertionOrder: 1
chargefactor = 1 
Do i1=1,3
If ((MFu2(i1).gt.mf_l2(3)).Or.(MVWp2.gt.mf_l2(3)).Or.(MVWp2.gt.mf_l2(3))) Then
If (((i1.lt.4)).or.(.not.OnlySM)) Then 
coup1L = cplcFuFdVWpL(i1,gt1)
coup1R = cplcFuFdVWpR(i1,gt1)
coup2L = cplcFdFucVWpL(gt2,i1)
coup2R = cplcFdFucVWpR(gt2,i1)
coup3 = cplcVWpVWpVZ
coup4L = cplcFeFeVZL(gt4,gt3)
coup4R = cplcFeFeVZR(gt4,gt3)
! Masses in loop
mF1 = MFu(i1)
mF12 = MFu2(i1)
mV1 = MVWp
mV12 = MVWp2
mV2 = MVWp
mV22 = MVWp2
! Propagator and inverse propagator mass 
MP = MVZ
MP2 = MVZ2
IMP = 1._dp/MP  
IMP2 = 1._dp/MP2 
! Amplitude 
  int1=B0(0._dp, mV12, mV22)
  int2=C00_3m(mF12, mV22, mV12)
  int3=C0check(mF12, mV22, mV12)
  PVOddllSLL=PVOddllSLL+0.
  PVOddllSRR=PVOddllSRR+0.
  PVOddllSRL=PVOddllSRL+0.
  PVOddllSLR=PVOddllSLR+0.
  PVOddllVRR=PVOddllVRR+chargefactor*coup1R*coup2R*coup3*coup4R*IMP2*(-               & 
& 1.*Finite + 2.*(int1 + 2.*int2 + int3*mF12))
  PVOddllVLL=PVOddllVLL+chargefactor*coup1L*coup2L*coup3*coup4L*IMP2*(-               & 
& 1.*Finite + 2.*(int1 + 2.*int2 + int3*mF12))
  PVOddllVRL=PVOddllVRL+chargefactor*coup1R*coup2R*coup3*coup4L*IMP2*(-               & 
& 1.*Finite + 2.*(int1 + 2.*int2 + int3*mF12))
  PVOddllVLR=PVOddllVLR+chargefactor*coup1L*coup2L*coup3*coup4R*IMP2*(-               & 
& 1.*Finite + 2.*(int1 + 2.*int2 + int3*mF12))
  PVOddllTLL=PVOddllTLL+0.
  PVOddllTLR=PVOddllTLR+0.
  PVOddllTRL=PVOddllTRL+0.
  PVOddllTRR=PVOddllTRR+0.
  End if 
End if 
    End Do 


 ! Propagator: VZ, Loop particles: Ah,Fe,Fe
! Generic diagram: SFF,  InsertionOrder: 4
chargefactor = 1 
  Do i2=1,3
    Do i3=1,3
If ((MAh2.gt.mf_l2(3)).Or.(MFe2(i2).gt.mf_l2(3)).Or.(MFe2(i3).gt.mf_l2(3))) Then
If (((i2.lt.4).and.(i3.lt.4)).or.(.not.OnlySM)) Then 
coup1L = cplcFeFeAhL(i2,gt3)
coup1R = cplcFeFeAhR(i2,gt3)
coup2L = cplcFeFeAhL(gt4,i3)
coup2R = cplcFeFeAhR(gt4,i3)
coup3L = cplcFeFeVZL(i3,i2)
coup3R = cplcFeFeVZR(i3,i2)
coup4L = cplcFdFdVZL(gt2,gt1)
coup4R = cplcFdFdVZR(gt2,gt1)
! Masses in loop
mS1 = MAh
mS12 = MAh2
mF1 = MFe(i2)
mF12 = MFe2(i2)
mF2 = MFe(i3)
mF22 = MFe2(i3)
! Propagator and inverse propagator mass 
MP = MVZ
MP2 = MVZ2
IMP = 1._dp/MP  
IMP2 = 1._dp/MP2 
! Amplitude 
  int1=B0C0check(mF22, mF12, mS12)
  int2=C00_3m(mF22, mF12, mS12)
  int3=C0check(mF22, mF12, mS12)
  PVOddllSLL=PVOddllSLL+0.
  PVOddllSRR=PVOddllSRR+0.
  PVOddllSRL=PVOddllSRL+0.
  PVOddllSLR=PVOddllSLR+0.
  PVOddllVRR=PVOddllVRR+chargefactor*coup1R*coup2L*coup4R*IMP2*(coup3L*(int1 -        & 
&  2.*int2) - 1.*coup3R*int3*mF1*mF2)
  PVOddllVLL=PVOddllVLL+chargefactor*coup1L*coup2R*coup4L*IMP2*(coup3R*(int1 -        & 
&  2.*int2) - 1.*coup3L*int3*mF1*mF2)
  PVOddllVRL=PVOddllVRL+chargefactor*coup1L*coup2R*coup4R*IMP2*(coup3R*(int1 -        & 
&  2.*int2) - 1.*coup3L*int3*mF1*mF2)
  PVOddllVLR=PVOddllVLR+chargefactor*coup1R*coup2L*coup4L*IMP2*(coup3L*(int1 -        & 
&  2.*int2) - 1.*coup3R*int3*mF1*mF2)
  PVOddllTLL=PVOddllTLL+0.
  PVOddllTLR=PVOddllTLR+0.
  PVOddllTRL=PVOddllTRL+0.
  PVOddllTRR=PVOddllTRR+0.
  End if 
End if 
   End Do 
  End Do 


 ! Propagator: VZ, Loop particles: hh,Fe,Fe
! Generic diagram: SFF,  InsertionOrder: 4
chargefactor = 1 
  Do i2=1,3
    Do i3=1,3
If ((Mhh2.gt.mf_l2(3)).Or.(MFe2(i2).gt.mf_l2(3)).Or.(MFe2(i3).gt.mf_l2(3))) Then
If (.not.OnlySM) Then 
coup1L = cplcFeFehhL(i2,gt3)
coup1R = cplcFeFehhR(i2,gt3)
coup2L = cplcFeFehhL(gt4,i3)
coup2R = cplcFeFehhR(gt4,i3)
coup3L = cplcFeFeVZL(i3,i2)
coup3R = cplcFeFeVZR(i3,i2)
coup4L = cplcFdFdVZL(gt2,gt1)
coup4R = cplcFdFdVZR(gt2,gt1)
! Masses in loop
mS1 = Mhh
mS12 = Mhh2
mF1 = MFe(i2)
mF12 = MFe2(i2)
mF2 = MFe(i3)
mF22 = MFe2(i3)
! Propagator and inverse propagator mass 
MP = MVZ
MP2 = MVZ2
IMP = 1._dp/MP  
IMP2 = 1._dp/MP2 
! Amplitude 
  int1=B0C0check(mF22, mF12, mS12)
  int2=C00_3m(mF22, mF12, mS12)
  int3=C0check(mF22, mF12, mS12)
  PVOddllSLL=PVOddllSLL+0.
  PVOddllSRR=PVOddllSRR+0.
  PVOddllSRL=PVOddllSRL+0.
  PVOddllSLR=PVOddllSLR+0.
  PVOddllVRR=PVOddllVRR+chargefactor*coup1R*coup2L*coup4R*IMP2*(coup3L*(int1 -        & 
&  2.*int2) - 1.*coup3R*int3*mF1*mF2)
  PVOddllVLL=PVOddllVLL+chargefactor*coup1L*coup2R*coup4L*IMP2*(coup3R*(int1 -        & 
&  2.*int2) - 1.*coup3L*int3*mF1*mF2)
  PVOddllVRL=PVOddllVRL+chargefactor*coup1L*coup2R*coup4R*IMP2*(coup3R*(int1 -        & 
&  2.*int2) - 1.*coup3L*int3*mF1*mF2)
  PVOddllVLR=PVOddllVLR+chargefactor*coup1R*coup2L*coup4L*IMP2*(coup3L*(int1 -        & 
&  2.*int2) - 1.*coup3R*int3*mF1*mF2)
  PVOddllTLL=PVOddllTLL+0.
  PVOddllTLR=PVOddllTLR+0.
  PVOddllTRL=PVOddllTRL+0.
  PVOddllTRR=PVOddllTRR+0.
  End if 
End if 
   End Do 
  End Do 


 ! Propagator: VZ, Loop particles: VZ,Fe,Fe
! Generic diagram: VFF,  InsertionOrder: 4
chargefactor = 1 
  Do i2=1,3
    Do i3=1,3
If ((MVZ2.gt.mf_l2(3)).Or.(MFe2(i2).gt.mf_l2(3)).Or.(MFe2(i3).gt.mf_l2(3))) Then
If (((i2.lt.4).and.(i3.lt.4)).or.(.not.OnlySM)) Then 
coup1L = cplcFeFeVZL(i2,gt3)
coup1R = cplcFeFeVZR(i2,gt3)
coup2L = cplcFeFeVZL(gt4,i3)
coup2R = cplcFeFeVZR(gt4,i3)
coup3L = cplcFeFeVZL(i3,i2)
coup3R = cplcFeFeVZR(i3,i2)
coup4L = cplcFdFdVZL(gt2,gt1)
coup4R = cplcFdFdVZR(gt2,gt1)
! Masses in loop
mV1 = MVZ
mV12 = MVZ2
mF1 = MFe(i2)
mF12 = MFe2(i2)
mF2 = MFe(i3)
mF22 = MFe2(i3)
! Propagator and inverse propagator mass 
MP = MVZ
MP2 = MVZ2
IMP = 1._dp/MP  
IMP2 = 1._dp/MP2 
! Amplitude 
  int1=B0C0check(mF22, mF12, mV12)
  int2=C00_3m(mF22, mF12, mV12)
  int3=C0check(mF22, mF12, mV12)
  PVOddllSLL=PVOddllSLL+0.
  PVOddllSRR=PVOddllSRR+0.
  PVOddllSRL=PVOddllSRL+0.
  PVOddllSLR=PVOddllSLR+0.
  PVOddllVRR=PVOddllVRR - 1.*chargefactor*coup1R*coup2R*coup4R*IMP2*(coup3R*(Finite - & 
&  2.*int1 + 4.*int2) + 2.*coup3L*int3*mF1*mF2)
  PVOddllVLL=PVOddllVLL - 1.*chargefactor*coup1L*coup2L*coup4L*IMP2*(coup3L*(Finite - & 
&  2.*int1 + 4.*int2) + 2.*coup3R*int3*mF1*mF2)
  PVOddllVRL=PVOddllVRL - 1.*chargefactor*coup1L*coup2L*coup4R*IMP2*(coup3L*(Finite - & 
&  2.*int1 + 4.*int2) + 2.*coup3R*int3*mF1*mF2)
  PVOddllVLR=PVOddllVLR - 1.*chargefactor*coup1R*coup2R*coup4L*IMP2*(coup3R*(Finite - & 
&  2.*int1 + 4.*int2) + 2.*coup3L*int3*mF1*mF2)
  PVOddllTLL=PVOddllTLL+0.
  PVOddllTLR=PVOddllTLR+0.
  PVOddllTRL=PVOddllTRL+0.
  PVOddllTRR=PVOddllTRR+0.
  End if 
End if 
   End Do 
  End Do 


 ! Propagator: VZ, Loop particles: bar[Fe],hh,Ah
! Generic diagram: FSS,  InsertionOrder: 4
chargefactor = 1 
Do i1=1,3
If ((MFe2(i1).gt.mf_l2(3)).Or.(Mhh2.gt.mf_l2(3)).Or.(MAh2.gt.mf_l2(3))) Then
If (.not.OnlySM) Then 
coup1L = cplcFeFehhL(i1,gt3)
coup1R = cplcFeFehhR(i1,gt3)
coup2L = cplcFeFeAhL(gt4,i1)
coup2R = cplcFeFeAhR(gt4,i1)
coup3 = cplAhhhVZ
coup4L = cplcFdFdVZL(gt2,gt1)
coup4R = cplcFdFdVZR(gt2,gt1)
! Masses in loop
mF1 = MFe(i1)
mF12 = MFe2(i1)
mS1 = Mhh
mS12 = Mhh2
mS2 = MAh
mS22 = MAh2
! Propagator and inverse propagator mass 
MP = MVZ
MP2 = MVZ2
IMP = 1._dp/MP  
IMP2 = 1._dp/MP2 
! Amplitude 
  int1=C00_3m(mF12, mS12, mS22)
  PVOddllSLL=PVOddllSLL+0.
  PVOddllSRR=PVOddllSRR+0.
  PVOddllSRL=PVOddllSRL+0.
  PVOddllSLR=PVOddllSLR+0.
  PVOddllVRR=PVOddllVRR+2.*chargefactor*coup1R*coup2L*coup3*coup4R*IMP2*int1
  PVOddllVLL=PVOddllVLL+2.*chargefactor*coup1L*coup2R*coup3*coup4L*IMP2*int1
  PVOddllVRL=PVOddllVRL+2.*chargefactor*coup1L*coup2R*coup3*coup4R*IMP2*int1
  PVOddllVLR=PVOddllVLR+2.*chargefactor*coup1R*coup2L*coup3*coup4L*IMP2*int1
  PVOddllTLL=PVOddllTLL+0.
  PVOddllTLR=PVOddllTLR+0.
  PVOddllTRL=PVOddllTRL+0.
  PVOddllTRR=PVOddllTRR+0.
  End if 
End if 
    End Do 


 ! Propagator: VZ, Loop particles: bar[Fe],Ah,hh
! Generic diagram: FSS,  InsertionOrder: 4
chargefactor = 1 
Do i1=1,3
If ((MFe2(i1).gt.mf_l2(3)).Or.(MAh2.gt.mf_l2(3)).Or.(Mhh2.gt.mf_l2(3))) Then
If (.not.OnlySM) Then 
coup1L = cplcFeFeAhL(i1,gt3)
coup1R = cplcFeFeAhR(i1,gt3)
coup2L = cplcFeFehhL(gt4,i1)
coup2R = cplcFeFehhR(gt4,i1)
coup3 = -cplAhhhVZ
coup4L = cplcFdFdVZL(gt2,gt1)
coup4R = cplcFdFdVZR(gt2,gt1)
! Masses in loop
mF1 = MFe(i1)
mF12 = MFe2(i1)
mS1 = MAh
mS12 = MAh2
mS2 = Mhh
mS22 = Mhh2
! Propagator and inverse propagator mass 
MP = MVZ
MP2 = MVZ2
IMP = 1._dp/MP  
IMP2 = 1._dp/MP2 
! Amplitude 
  int1=C00_3m(mF12, mS12, mS22)
  PVOddllSLL=PVOddllSLL+0.
  PVOddllSRR=PVOddllSRR+0.
  PVOddllSRL=PVOddllSRL+0.
  PVOddllSLR=PVOddllSLR+0.
  PVOddllVRR=PVOddllVRR+2.*chargefactor*coup1R*coup2L*coup3*coup4R*IMP2*int1
  PVOddllVLL=PVOddllVLL+2.*chargefactor*coup1L*coup2R*coup3*coup4L*IMP2*int1
  PVOddllVRL=PVOddllVRL+2.*chargefactor*coup1L*coup2R*coup3*coup4R*IMP2*int1
  PVOddllVLR=PVOddllVLR+2.*chargefactor*coup1R*coup2L*coup3*coup4L*IMP2*int1
  PVOddllTLL=PVOddllTLL+0.
  PVOddllTLR=PVOddllTLR+0.
  PVOddllTRL=PVOddllTRL+0.
  PVOddllTRR=PVOddllTRR+0.
  End if 
End if 
    End Do 


 ! Propagator: VZ, Loop particles: bar[Fe],VZ,hh
! Generic diagram: FVS,  InsertionOrder: 4
chargefactor = 1 
Do i1=1,3
If ((MFe2(i1).gt.mf_l2(3)).Or.(MVZ2.gt.mf_l2(3)).Or.(Mhh2.gt.mf_l2(3))) Then
If (.not.OnlySM) Then 
coup1L = cplcFeFeVZL(i1,gt3)
coup1R = cplcFeFeVZR(i1,gt3)
coup2L = cplcFeFehhL(gt4,i1)
coup2R = cplcFeFehhR(gt4,i1)
coup3 = cplhhVZVZ
coup4L = cplcFdFdVZL(gt2,gt1)
coup4R = cplcFdFdVZR(gt2,gt1)
! Masses in loop
mF1 = MFe(i1)
mF12 = MFe2(i1)
mV1 = MVZ
mV12 = MVZ2
mS2 = Mhh
mS22 = Mhh2
! Propagator and inverse propagator mass 
MP = MVZ
MP2 = MVZ2
IMP = 1._dp/MP  
IMP2 = 1._dp/MP2 
! Amplitude 
  int1=C0check(mF12, mV12, mS22)
  PVOddllSLL=PVOddllSLL+0.
  PVOddllSRR=PVOddllSRR+0.
  PVOddllSRL=PVOddllSRL+0.
  PVOddllSLR=PVOddllSLR+0.
  PVOddllVRR=PVOddllVRR+chargefactor*coup1R*coup2L*coup3*coup4R*IMP2*int1*mF1
  PVOddllVLL=PVOddllVLL+chargefactor*coup1L*coup2R*coup3*coup4L*IMP2*int1*mF1
  PVOddllVRL=PVOddllVRL+chargefactor*coup1L*coup2R*coup3*coup4R*IMP2*int1*mF1
  PVOddllVLR=PVOddllVLR+chargefactor*coup1R*coup2L*coup3*coup4L*IMP2*int1*mF1
  PVOddllTLL=PVOddllTLL+0.
  PVOddllTLR=PVOddllTLR+0.
  PVOddllTRL=PVOddllTRL+0.
  PVOddllTRR=PVOddllTRR+0.
  End if 
End if 
    End Do 


 ! Propagator: VZ, Loop particles: bar[Fe],hh,VZ
! Generic diagram: FSV,  InsertionOrder: 4
chargefactor = 1 
Do i1=1,3
If ((MFe2(i1).gt.mf_l2(3)).Or.(Mhh2.gt.mf_l2(3)).Or.(MVZ2.gt.mf_l2(3))) Then
If (.not.OnlySM) Then 
coup1L = cplcFeFehhL(i1,gt3)
coup1R = cplcFeFehhR(i1,gt3)
coup2L = cplcFeFeVZL(gt4,i1)
coup2R = cplcFeFeVZR(gt4,i1)
coup3 = cplhhVZVZ
coup4L = cplcFdFdVZL(gt2,gt1)
coup4R = cplcFdFdVZR(gt2,gt1)
! Masses in loop
mF1 = MFe(i1)
mF12 = MFe2(i1)
mS1 = Mhh
mS12 = Mhh2
mV2 = MVZ
mV22 = MVZ2
! Propagator and inverse propagator mass 
MP = MVZ
MP2 = MVZ2
IMP = 1._dp/MP  
IMP2 = 1._dp/MP2 
! Amplitude 
  int1=C0check(mF12, mS12, mV22)
  PVOddllSLL=PVOddllSLL+0.
  PVOddllSRR=PVOddllSRR+0.
  PVOddllSRL=PVOddllSRL+0.
  PVOddllSLR=PVOddllSLR+0.
  PVOddllVRR=PVOddllVRR+chargefactor*coup1R*coup2R*coup3*coup4R*IMP2*int1*mF1
  PVOddllVLL=PVOddllVLL+chargefactor*coup1L*coup2L*coup3*coup4L*IMP2*int1*mF1
  PVOddllVRL=PVOddllVRL+chargefactor*coup1L*coup2L*coup3*coup4R*IMP2*int1*mF1
  PVOddllVLR=PVOddllVLR+chargefactor*coup1R*coup2R*coup3*coup4L*IMP2*int1*mF1
  PVOddllTLL=PVOddllTLL+0.
  PVOddllTLR=PVOddllTLR+0.
  PVOddllTRL=PVOddllTRL+0.
  PVOddllTRR=PVOddllTRR+0.
  End if 
End if 
    End Do 


 PVOddllSLL=oo16pi2*PVOddllSLL
PVOddllSRR=oo16pi2*PVOddllSRR
PVOddllSRL=oo16pi2*PVOddllSRL
PVOddllSLR=oo16pi2*PVOddllSLR
PVOddllVRR=oo16pi2*PVOddllVRR
PVOddllVLL=oo16pi2*PVOddllVLL
PVOddllVRL=oo16pi2*PVOddllVRL
PVOddllVLR=oo16pi2*PVOddllVLR
PVOddllTLL=oo16pi2*PVOddllTLL
PVOddllTLR=oo16pi2*PVOddllTLR
PVOddllTRL=oo16pi2*PVOddllTRL
PVOddllTRR=oo16pi2*PVOddllTRR
Iname=Iname-1

End Subroutine CalculatePengV2d2L 

Subroutine CalculateTreeS2d2L(gt1,gt2,gt3,gt4,OnlySM,MAh,MAh2,MFd,MFd2,               & 
& MFe,MFe2,MFu,MFu2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,cplAhAhhh,cplAhcHpVWp,         & 
& cplAhhhVZ,cplAhHpcVWp,cplcFdFdAhL,cplcFdFdAhR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVPL,     & 
& cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,cplcFdFucHpL,cplcFdFucHpR,cplcFdFucVWpL,           & 
& cplcFdFucVWpR,cplcFeFeAhL,cplcFeFeAhR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,             & 
& cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplcFeFvcHpL,cplcFeFvcHpR,cplcFeFvcVWpL,           & 
& cplcFeFvcVWpR,cplcFuFdHpL,cplcFuFdHpR,cplcFuFdVWpL,cplcFuFdVWpR,cplcFuFuAhL,           & 
& cplcFuFuAhR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZL,               & 
& cplcFuFuVZR,cplcFvFeHpL,cplcFvFeHpR,cplcFvFeVWpL,cplcFvFeVWpR,cplcHpVPVWp,             & 
& cplcHpVWpVZ,cplcVWpVPVWp,cplcVWpVWpVZ,cplhhcHpVWp,cplhhcVWpVWp,cplhhhhhh,              & 
& cplhhHpcHp,cplhhHpcVWp,cplhhVZVZ,cplHpcHpVP,cplHpcHpVZ,cplHpcVWpVP,cplHpcVWpVZ,        & 
& TSOddllSLL,TSOddllSRR,TSOddllSRL,TSOddllSLR,TSOddllVRR,TSOddllVLL,TSOddllVRL,          & 
& TSOddllVLR,TSOddllTLL,TSOddllTLR,TSOddllTRL,TSOddllTRR)

! ---------------------------------------------------------------- 
! Code based on automatically generated SARAH extensions by 'PreSARAH' 
! Expressions for amplitudes are obtained by FeynArts/FormCalc 
! Based on user input for process TreeS2d2L 
! 'PreSARAH' output has been generated  at 15:41 on 16.12.2015 
! ---------------------------------------------------------------- 
 
Implicit None 
Real(dp),Intent(in) :: MAh,MAh2,MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),Mhh,Mhh2,MHp,MHp2,              & 
& MVWp,MVWp2,MVZ,MVZ2

Complex(dp),Intent(in) :: cplAhAhhh,cplAhcHpVWp,cplAhhhVZ,cplAhHpcVWp,cplcFdFdAhL(3,3),cplcFdFdAhR(3,3),        & 
& cplcFdFdhhL(3,3),cplcFdFdhhR(3,3),cplcFdFdVPL(3,3),cplcFdFdVPR(3,3),cplcFdFdVZL(3,3),  & 
& cplcFdFdVZR(3,3),cplcFdFucHpL(3,3),cplcFdFucHpR(3,3),cplcFdFucVWpL(3,3),               & 
& cplcFdFucVWpR(3,3),cplcFeFeAhL(3,3),cplcFeFeAhR(3,3),cplcFeFehhL(3,3),cplcFeFehhR(3,3),& 
& cplcFeFeVPL(3,3),cplcFeFeVPR(3,3),cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),cplcFeFvcHpL(3,3), & 
& cplcFeFvcHpR(3,3),cplcFeFvcVWpL(3,3),cplcFeFvcVWpR(3,3),cplcFuFdHpL(3,3),              & 
& cplcFuFdHpR(3,3),cplcFuFdVWpL(3,3),cplcFuFdVWpR(3,3),cplcFuFuAhL(3,3),cplcFuFuAhR(3,3),& 
& cplcFuFuhhL(3,3),cplcFuFuhhR(3,3),cplcFuFuVPL(3,3),cplcFuFuVPR(3,3),cplcFuFuVZL(3,3),  & 
& cplcFuFuVZR(3,3),cplcFvFeHpL(3,3),cplcFvFeHpR(3,3),cplcFvFeVWpL(3,3),cplcFvFeVWpR(3,3),& 
& cplcHpVPVWp,cplcHpVWpVZ,cplcVWpVPVWp,cplcVWpVWpVZ,cplhhcHpVWp,cplhhcVWpVWp,            & 
& cplhhhhhh,cplhhHpcHp,cplhhHpcVWp,cplhhVZVZ,cplHpcHpVP,cplHpcHpVZ,cplHpcVWpVP,          & 
& cplHpcVWpVZ

Integer,Intent(in) :: gt1, gt2,gt3,gt4 
Logical, Intent(in) :: OnlySM 
Integer :: iprop, i1, i2, i3, i4 
Real(dp) :: MassEx1,MassEx2,MassEx3,MassEx4, MassEx12,MassEx22,MassEx32,MassEx42 
Complex(dp), Intent(out) :: TSOddllSLL 
Complex(dp), Intent(out) :: TSOddllSRR 
Complex(dp), Intent(out) :: TSOddllSRL 
Complex(dp), Intent(out) :: TSOddllSLR 
Complex(dp), Intent(out) :: TSOddllVRR 
Complex(dp), Intent(out) :: TSOddllVLL 
Complex(dp), Intent(out) :: TSOddllVRL 
Complex(dp), Intent(out) :: TSOddllVLR 
Complex(dp), Intent(out) :: TSOddllTLL 
Complex(dp), Intent(out) :: TSOddllTLR 
Complex(dp), Intent(out) :: TSOddllTRL 
Complex(dp), Intent(out) :: TSOddllTRR 
Complex(dp) :: vertex1L, vertex1R, vertex2L, vertex2R 
Real(dp) ::  MP, MP2, IMP2, IMP, MFin, MFin2, IMFin, IMFin2, Finite  
Real(dp) ::  MS1, MS12, MS2, MS22, MF1, MF12, MF2, MF22, MV1, MV12, MV2, MV22  
Complex(dp) ::  chargefactor  
Complex(dp) ::  coup1L, coup1R, coup2L, coup2R, coup3L, coup3R, coup3, coup4L, coup4R 

Complex(dp) ::  int1,int2,int3,int4,int5,int6,int7,int8 

Iname=Iname+1 
NameOfUnit(Iname)='CalculateTreeS2d2L' 

Finite=1._dp 
MassEx1=MFd(gt1)  
MassEx12=MFd2(gt1) 
MassEx2=MFd(gt2)  
MassEx22=MFd2(gt2) 
MassEx3=MFe(gt3)  
MassEx32=MFe2(gt3) 
MassEx4=MFe(gt4)  
MassEx42=MFe2(gt4) 
! ------------------------------ 
 ! Amplitudes for external states 
 ! {DownQuark, bar[DownQuark], ChargedLepton, bar[ChargedLepton]} 
 ! ------------------------------ 
 
TSOddllSLL=0._dp 
TSOddllSRR=0._dp 
TSOddllSRL=0._dp 
TSOddllSLR=0._dp 
TSOddllVRR=0._dp 
TSOddllVLL=0._dp 
TSOddllVRL=0._dp 
TSOddllVLR=0._dp 
TSOddllTLL=0._dp 
TSOddllTLR=0._dp 
TSOddllTRL=0._dp 
TSOddllTRR=0._dp 
!---------------------------------------- 
! Scalar Tree Contributions            
!---------------------------------------- 
! -- Ah - Tree            
! Propagator: VZ
! InsertionOrder: 1
chargefactor = 1 
If ((OnlySM).or.(.not.OnlySM)) Then 
coup1L = cplcFdFdAhL(gt2,gt1)
coup1R = cplcFdFdAhR(gt2,gt1)
coup2L = cplcFeFeAhL(gt4,gt3)
coup2R = cplcFeFeAhR(gt4,gt3)
! Propagator and inverse propagator mass 
MP = MAh
MP2 = MAh2
IMP = 1._dp/MP  
IMP2 = 1._dp/MP2 
! Amplitude 
  TSOddllSLL=TSOddllSLL+ coup1L*coup2L*IMP2
  TSOddllSRR=TSOddllSRR+ coup1R*coup2R*IMP2
  TSOddllSRL=TSOddllSRL+ coup1R*coup2L*IMP2
  TSOddllSLR=TSOddllSLR+ coup1L*coup2R*IMP2
  TSOddllVRR=TSOddllVRR+ 0.
  TSOddllVLL=TSOddllVLL+ 0.
  TSOddllVRL=TSOddllVRL+ 0.
  TSOddllVLR=TSOddllVLR+ 0.
  TSOddllTLL=TSOddllTLL+ 0.
  TSOddllTLR=TSOddllTLR+ 0.
  TSOddllTRL=TSOddllTRL+ 0.
  TSOddllTRR=TSOddllTRR+ 0.
 End if 


 ! -- hh - Tree            
! Propagator: VZ
! InsertionOrder: 1
chargefactor = 1 
If (.not.OnlySM) Then 
coup1L = cplcFdFdhhL(gt2,gt1)
coup1R = cplcFdFdhhR(gt2,gt1)
coup2L = cplcFeFehhL(gt4,gt3)
coup2R = cplcFeFehhR(gt4,gt3)
! Propagator and inverse propagator mass 
MP = Mhh
MP2 = Mhh2
IMP = 1._dp/MP  
IMP2 = 1._dp/MP2 
! Amplitude 
  TSOddllSLL=TSOddllSLL+ coup1L*coup2L*IMP2
  TSOddllSRR=TSOddllSRR+ coup1R*coup2R*IMP2
  TSOddllSRL=TSOddllSRL+ coup1R*coup2L*IMP2
  TSOddllSLR=TSOddllSLR+ coup1L*coup2R*IMP2
  TSOddllVRR=TSOddllVRR+ 0.
  TSOddllVLL=TSOddllVLL+ 0.
  TSOddllVRL=TSOddllVRL+ 0.
  TSOddllVLR=TSOddllVLR+ 0.
  TSOddllTLL=TSOddllTLL+ 0.
  TSOddllTLR=TSOddllTLR+ 0.
  TSOddllTRL=TSOddllTRL+ 0.
  TSOddllTRR=TSOddllTRR+ 0.
 End if 


 Iname=Iname-1

End Subroutine CalculateTreeS2d2L 

Subroutine CalculateTreeV2d2L(gt1,gt2,gt3,gt4,OnlySM,MAh,MAh2,MFd,MFd2,               & 
& MFe,MFe2,MFu,MFu2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,cplAhAhhh,cplAhcHpVWp,         & 
& cplAhhhVZ,cplAhHpcVWp,cplcFdFdAhL,cplcFdFdAhR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVPL,     & 
& cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,cplcFdFucHpL,cplcFdFucHpR,cplcFdFucVWpL,           & 
& cplcFdFucVWpR,cplcFeFeAhL,cplcFeFeAhR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,             & 
& cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplcFeFvcHpL,cplcFeFvcHpR,cplcFeFvcVWpL,           & 
& cplcFeFvcVWpR,cplcFuFdHpL,cplcFuFdHpR,cplcFuFdVWpL,cplcFuFdVWpR,cplcFuFuAhL,           & 
& cplcFuFuAhR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZL,               & 
& cplcFuFuVZR,cplcFvFeHpL,cplcFvFeHpR,cplcFvFeVWpL,cplcFvFeVWpR,cplcHpVPVWp,             & 
& cplcHpVWpVZ,cplcVWpVPVWp,cplcVWpVWpVZ,cplhhcHpVWp,cplhhcVWpVWp,cplhhhhhh,              & 
& cplhhHpcHp,cplhhHpcVWp,cplhhVZVZ,cplHpcHpVP,cplHpcHpVZ,cplHpcVWpVP,cplHpcVWpVZ,        & 
& TVOddllSLL,TVOddllSRR,TVOddllSRL,TVOddllSLR,TVOddllVRR,TVOddllVLL,TVOddllVRL,          & 
& TVOddllVLR,TVOddllTLL,TVOddllTLR,TVOddllTRL,TVOddllTRR)

! ---------------------------------------------------------------- 
! Code based on automatically generated SARAH extensions by 'PreSARAH' 
! Expressions for amplitudes are obtained by FeynArts/FormCalc 
! Based on user input for process TreeV2d2L 
! 'PreSARAH' output has been generated  at 15:41 on 16.12.2015 
! ---------------------------------------------------------------- 
 
Implicit None 
Real(dp),Intent(in) :: MAh,MAh2,MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),Mhh,Mhh2,MHp,MHp2,              & 
& MVWp,MVWp2,MVZ,MVZ2

Complex(dp),Intent(in) :: cplAhAhhh,cplAhcHpVWp,cplAhhhVZ,cplAhHpcVWp,cplcFdFdAhL(3,3),cplcFdFdAhR(3,3),        & 
& cplcFdFdhhL(3,3),cplcFdFdhhR(3,3),cplcFdFdVPL(3,3),cplcFdFdVPR(3,3),cplcFdFdVZL(3,3),  & 
& cplcFdFdVZR(3,3),cplcFdFucHpL(3,3),cplcFdFucHpR(3,3),cplcFdFucVWpL(3,3),               & 
& cplcFdFucVWpR(3,3),cplcFeFeAhL(3,3),cplcFeFeAhR(3,3),cplcFeFehhL(3,3),cplcFeFehhR(3,3),& 
& cplcFeFeVPL(3,3),cplcFeFeVPR(3,3),cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),cplcFeFvcHpL(3,3), & 
& cplcFeFvcHpR(3,3),cplcFeFvcVWpL(3,3),cplcFeFvcVWpR(3,3),cplcFuFdHpL(3,3),              & 
& cplcFuFdHpR(3,3),cplcFuFdVWpL(3,3),cplcFuFdVWpR(3,3),cplcFuFuAhL(3,3),cplcFuFuAhR(3,3),& 
& cplcFuFuhhL(3,3),cplcFuFuhhR(3,3),cplcFuFuVPL(3,3),cplcFuFuVPR(3,3),cplcFuFuVZL(3,3),  & 
& cplcFuFuVZR(3,3),cplcFvFeHpL(3,3),cplcFvFeHpR(3,3),cplcFvFeVWpL(3,3),cplcFvFeVWpR(3,3),& 
& cplcHpVPVWp,cplcHpVWpVZ,cplcVWpVPVWp,cplcVWpVWpVZ,cplhhcHpVWp,cplhhcVWpVWp,            & 
& cplhhhhhh,cplhhHpcHp,cplhhHpcVWp,cplhhVZVZ,cplHpcHpVP,cplHpcHpVZ,cplHpcVWpVP,          & 
& cplHpcVWpVZ

Integer,Intent(in) :: gt1, gt2,gt3,gt4 
Logical, Intent(in) :: OnlySM 
Integer :: iprop, i1, i2, i3, i4 
Real(dp) :: MassEx1,MassEx2,MassEx3,MassEx4, MassEx12,MassEx22,MassEx32,MassEx42 
Complex(dp), Intent(out) :: TVOddllSLL 
Complex(dp), Intent(out) :: TVOddllSRR 
Complex(dp), Intent(out) :: TVOddllSRL 
Complex(dp), Intent(out) :: TVOddllSLR 
Complex(dp), Intent(out) :: TVOddllVRR 
Complex(dp), Intent(out) :: TVOddllVLL 
Complex(dp), Intent(out) :: TVOddllVRL 
Complex(dp), Intent(out) :: TVOddllVLR 
Complex(dp), Intent(out) :: TVOddllTLL 
Complex(dp), Intent(out) :: TVOddllTLR 
Complex(dp), Intent(out) :: TVOddllTRL 
Complex(dp), Intent(out) :: TVOddllTRR 
Complex(dp) :: vertex1L, vertex1R, vertex2L, vertex2R 
Real(dp) ::  MP, MP2, IMP2, IMP, MFin, MFin2, IMFin, IMFin2, Finite  
Real(dp) ::  MS1, MS12, MS2, MS22, MF1, MF12, MF2, MF22, MV1, MV12, MV2, MV22  
Complex(dp) ::  chargefactor  
Complex(dp) ::  coup1L, coup1R, coup2L, coup2R, coup3L, coup3R, coup3, coup4L, coup4R 

Complex(dp) ::  int1,int2,int3,int4,int5,int6,int7,int8 

Iname=Iname+1 
NameOfUnit(Iname)='CalculateTreeV2d2L' 

Finite=1._dp 
MassEx1=MFd(gt1)  
MassEx12=MFd2(gt1) 
MassEx2=MFd(gt2)  
MassEx22=MFd2(gt2) 
MassEx3=MFe(gt3)  
MassEx32=MFe2(gt3) 
MassEx4=MFe(gt4)  
MassEx42=MFe2(gt4) 
! ------------------------------ 
 ! Amplitudes for external states 
 ! {DownQuark, bar[DownQuark], ChargedLepton, bar[ChargedLepton]} 
 ! ------------------------------ 
 
TVOddllSLL=0._dp 
TVOddllSRR=0._dp 
TVOddllSRL=0._dp 
TVOddllSLR=0._dp 
TVOddllVRR=0._dp 
TVOddllVLL=0._dp 
TVOddllVRL=0._dp 
TVOddllVLR=0._dp 
TVOddllTLL=0._dp 
TVOddllTLR=0._dp 
TVOddllTRL=0._dp 
TVOddllTRR=0._dp 
!---------------------------------------- 
! Vector Tree Contributions            
!---------------------------------------- 
! -- VZ - Tree            
! Propagator: VZ
! InsertionOrder: 1
chargefactor = 1 
If ((OnlySM).or.(.not.OnlySM)) Then 
coup1L = cplcFdFdVZL(gt2,gt1)
coup1R = cplcFdFdVZR(gt2,gt1)
coup2L = cplcFeFeVZL(gt4,gt3)
coup2R = cplcFeFeVZR(gt4,gt3)
! Propagator and inverse propagator mass 
MP = MVZ
MP2 = MVZ2
IMP = 1._dp/MP  
IMP2 = 1._dp/MP2 
! Amplitude 
  TVOddllSLL=TVOddllSLL+ 0.
  TVOddllSRR=TVOddllSRR+ 0.
  TVOddllSRL=TVOddllSRL+ 0.
  TVOddllSLR=TVOddllSLR+ 0.
  TVOddllVRR=TVOddllVRR-1.*coup1R*coup2R*IMP2
  TVOddllVLL=TVOddllVLL-1.*coup1L*coup2L*IMP2
  TVOddllVRL=TVOddllVRL-1.*coup1R*coup2L*IMP2
  TVOddllVLR=TVOddllVLR-1.*coup1L*coup2R*IMP2
  TVOddllTLL=TVOddllTLL+ 0.
  TVOddllTLR=TVOddllTLR+ 0.
  TVOddllTRL=TVOddllTRL+ 0.
  TVOddllTRR=TVOddllTRR+ 0.
 End if 


 Iname=Iname-1

End Subroutine CalculateTreeV2d2L 

Subroutine CalculateBox2d2nu(gt1,gt2,gt3,gt4,OnlySM,MAh,MAh2,MFd,MFd2,MFe,            & 
& MFe2,MFu,MFu2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,cplAhhhVZ,cplcFdFdAhL,             & 
& cplcFdFdAhR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZR,cplcFdFucHpL,              & 
& cplcFdFucHpR,cplcFdFucVWpL,cplcFdFucVWpR,cplcFeFeVZL,cplcFeFeVZR,cplcFeFvcHpL,         & 
& cplcFeFvcHpR,cplcFeFvcVWpL,cplcFeFvcVWpR,cplcFuFdHpL,cplcFuFdHpR,cplcFuFdVWpL,         & 
& cplcFuFdVWpR,cplcFuFuVZL,cplcFuFuVZR,cplcFvFeHpL,cplcFvFeHpR,cplcFvFeVWpL,             & 
& cplcFvFeVWpR,cplcFvFvVZL,cplcFvFvVZR,cplcHpVWpVZ,cplcVWpVWpVZ,cplhhVZVZ,               & 
& cplHpcHpVZ,cplHpcVWpVZ,BOddvvVRR,BOddvvVLL,BOddvvVRL,BOddvvVLR)

! ---------------------------------------------------------------- 
! Code based on automatically generated SARAH extensions by 'PreSARAH' 
! Expressions for amplitudes are obtained by FeynArts/FormCalc 
! Based on user input for process Box2d2nu 
! 'PreSARAH' output has been generated  at 12:38 on 13.6.2016 
! ---------------------------------------------------------------- 
 
Implicit None 
Real(dp),Intent(in) :: MAh,MAh2,MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),Mhh,Mhh2,MHp,MHp2,              & 
& MVWp,MVWp2,MVZ,MVZ2

Complex(dp),Intent(in) :: cplAhhhVZ,cplcFdFdAhL(3,3),cplcFdFdAhR(3,3),cplcFdFdhhL(3,3),cplcFdFdhhR(3,3),        & 
& cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),cplcFdFucHpL(3,3),cplcFdFucHpR(3,3),cplcFdFucVWpL(3,3),& 
& cplcFdFucVWpR(3,3),cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),cplcFeFvcHpL(3,3),cplcFeFvcHpR(3,3),& 
& cplcFeFvcVWpL(3,3),cplcFeFvcVWpR(3,3),cplcFuFdHpL(3,3),cplcFuFdHpR(3,3),               & 
& cplcFuFdVWpL(3,3),cplcFuFdVWpR(3,3),cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),cplcFvFeHpL(3,3),& 
& cplcFvFeHpR(3,3),cplcFvFeVWpL(3,3),cplcFvFeVWpR(3,3),cplcFvFvVZL(3,3),cplcFvFvVZR(3,3),& 
& cplcHpVWpVZ,cplcVWpVWpVZ,cplhhVZVZ,cplHpcHpVZ,cplHpcVWpVZ

Integer,Intent(in) :: gt1, gt2,gt3,gt4 
Logical, Intent(in) :: OnlySM 
Integer :: iprop, i1, i2, i3, i4 
Real(dp) :: MassEx1,MassEx2,MassEx3,MassEx4, MassEx12,MassEx22,MassEx32,MassEx42 
Complex(dp), Intent(out) :: BOddvvVRR 
Complex(dp), Intent(out) :: BOddvvVLL 
Complex(dp), Intent(out) :: BOddvvVRL 
Complex(dp), Intent(out) :: BOddvvVLR 
Complex(dp) :: vertex1L, vertex1R, vertex2L, vertex2R 
Real(dp) ::  MP, MP2, IMP2, IMP, MFin, MFin2, IMFin, IMFin2, Finite  
Real(dp) ::  MS1, MS12, MS2, MS22, MF1, MF12, MF2, MF22, MV1, MV12, MV2, MV22  
Complex(dp) ::  chargefactor  
Complex(dp) ::  coup1L, coup1R, coup2L, coup2R, coup3L, coup3R, coup3, coup4L, coup4R 

Complex(dp) ::  int1,int2,int3,int4,int5,int6,int7,int8 

Iname=Iname+1 
NameOfUnit(Iname)='CalculateBox2d2nu' 

Finite=1._dp 
MassEx1=MFd(gt1)  
MassEx12=MFd2(gt1) 
MassEx2=MFd(gt2)  
MassEx22=MFd2(gt2) 
MassEx3=0._dp  
MassEx32=0._dp 
MassEx4=0._dp  
MassEx42=0._dp 
! ------------------------------ 
 ! Amplitudes for external states 
 ! {DownQuark, bar[DownQuark], Neutrino, bar[Neutrino]} 
 ! ------------------------------ 
 
BOddvvVRR=0._dp 
BOddvvVLL=0._dp 
BOddvvVRL=0._dp 
BOddvvVLR=0._dp 
!----------------------------- 
! Box Contributions            
!----------------------------- 
! Fu,Hp,bar[Fe],Hp
chargefactor = 1 
! Generic diagram: FSSF,  InsertionOrder: 1
Do i1=1,3
    Do i3=1,3
If ((MFu2(i1).gt.mf_l2(3)).Or.(MHp2.gt.mf_l2(3)).Or.(MFe2(i3).gt.mf_l2(3)).Or.(MHp2.gt.mf_l2(3))) Then
If (((i1.lt.4).and.(i3.lt.4)).or.(.not.OnlySM)) Then 
coup1L = cplcFuFdHpL(i1,gt1)
coup1R = cplcFuFdHpR(i1,gt1)
coup2L = cplcFdFucHpL(gt2,i1)
coup2R = cplcFdFucHpR(gt2,i1)
coup3L = cplcFeFvcHpL(i3,gt3)
coup3R = cplcFeFvcHpR(i3,gt3)
coup4L = cplcFvFeHpL(gt4,i3)
coup4R = cplcFvFeHpR(gt4,i3)
mF1 = MFu(i1)
mF12 = MFu2(i1)
mS1 = MHp
mS12 = MHp2
mF2 = MFe(i3)
mF22 = MFe2(i3)
mS2 = MHp
mS22 = MHp2
  int1=D00check(mF12, mF22, mS22, mS12)
  BOddvvVRR=BOddvvVRR+chargefactor*coup1R*coup2L*coup3R*coup4L*int1
  BOddvvVLL=BOddvvVLL+chargefactor*coup1L*coup2R*coup3L*coup4R*int1
  BOddvvVRL=BOddvvVRL+chargefactor*coup1R*coup2L*coup3L*coup4R*int1
  BOddvvVLR=BOddvvVLR+chargefactor*coup1L*coup2R*coup3R*coup4L*int1
  End if 
End if 
    End Do 
  End Do 


 ! Fu,VWp,bar[Fe],Hp
chargefactor = 1 
! Generic diagram: FSVF,  InsertionOrder: 1
Do i1=1,3
    Do i3=1,3
If ((MFu2(i1).gt.mf_l2(3)).Or.(MVWp2.gt.mf_l2(3)).Or.(MFe2(i3).gt.mf_l2(3)).Or.(MHp2.gt.mf_l2(3))) Then
If (((i1.lt.4).and.(i3.lt.4)).or.(.not.OnlySM)) Then 
coup1L = cplcFuFdHpL(i1,gt1)
coup1R = cplcFuFdHpR(i1,gt1)
coup2L = cplcFdFucVWpL(gt2,i1)
coup2R = cplcFdFucVWpR(gt2,i1)
coup3L = cplcFeFvcHpL(i3,gt3)
coup3R = cplcFeFvcHpR(i3,gt3)
coup4L = cplcFvFeVWpL(gt4,i3)
coup4R = cplcFvFeVWpR(gt4,i3)
mF1 = MFu(i1)
mF12 = MFu2(i1)
mS1 = MHp
mS12 = MHp2
mF2 = MFe(i3)
mF22 = MFe2(i3)
mV2 = MVWp
mV22 = MVWp2
  int1=MMD0(mF1, mF2, mF12, mF22, mV22, mS12)
  BOddvvVRR=BOddvvVRR+chargefactor*coup1R*coup2R*coup3R*coup4R*int1
  BOddvvVLL=BOddvvVLL+chargefactor*coup1L*coup2L*coup3L*coup4L*int1
  BOddvvVRL=BOddvvVRL+chargefactor*coup1R*coup2R*coup3L*coup4L*int1
  BOddvvVLR=BOddvvVLR+chargefactor*coup1L*coup2L*coup3R*coup4R*int1
  End if 
End if 
    End Do 
  End Do 


 ! Fu,Hp,bar[Fe],VWp
chargefactor = 1 
! Generic diagram: FVSF,  InsertionOrder: 1
Do i1=1,3
    Do i3=1,3
If ((MFu2(i1).gt.mf_l2(3)).Or.(MHp2.gt.mf_l2(3)).Or.(MFe2(i3).gt.mf_l2(3)).Or.(MVWp2.gt.mf_l2(3))) Then
If (((i1.lt.4).and.(i3.lt.4)).or.(.not.OnlySM)) Then 
coup1L = cplcFuFdVWpL(i1,gt1)
coup1R = cplcFuFdVWpR(i1,gt1)
coup2L = cplcFdFucHpL(gt2,i1)
coup2R = cplcFdFucHpR(gt2,i1)
coup3L = cplcFeFvcVWpL(i3,gt3)
coup3R = cplcFeFvcVWpR(i3,gt3)
coup4L = cplcFvFeHpL(gt4,i3)
coup4R = cplcFvFeHpR(gt4,i3)
mF1 = MFu(i1)
mF12 = MFu2(i1)
mV1 = MVWp
mV12 = MVWp2
mF2 = MFe(i3)
mF22 = MFe2(i3)
mS2 = MHp
mS22 = MHp2
  int1=MMD0(mF1, mF2, mF12, mF22, mS22, mV12)
  BOddvvVRR=BOddvvVRR+chargefactor*coup1R*coup2L*coup3R*coup4L*int1
  BOddvvVLL=BOddvvVLL+chargefactor*coup1L*coup2R*coup3L*coup4R*int1
  BOddvvVRL=BOddvvVRL+chargefactor*coup1R*coup2L*coup3L*coup4R*int1
  BOddvvVLR=BOddvvVLR+chargefactor*coup1L*coup2R*coup3R*coup4L*int1
  End if 
End if 
    End Do 
  End Do 


 ! Fu,VWp,bar[Fe],VWp
chargefactor = 1 
! Generic diagram: FVVF,  InsertionOrder: 1
Do i1=1,3
    Do i3=1,3
If ((MFu2(i1).gt.mf_l2(3)).Or.(MVWp2.gt.mf_l2(3)).Or.(MFe2(i3).gt.mf_l2(3)).Or.(MVWp2.gt.mf_l2(3))) Then
If (((i1.lt.4).and.(i3.lt.4)).or.(.not.OnlySM)) Then 
coup1L = cplcFuFdVWpL(i1,gt1)
coup1R = cplcFuFdVWpR(i1,gt1)
coup2L = cplcFdFucVWpL(gt2,i1)
coup2R = cplcFdFucVWpR(gt2,i1)
coup3L = cplcFeFvcVWpL(i3,gt3)
coup3R = cplcFeFvcVWpR(i3,gt3)
coup4L = cplcFvFeVWpL(gt4,i3)
coup4R = cplcFvFeVWpR(gt4,i3)
mF1 = MFu(i1)
mF12 = MFu2(i1)
mV1 = MVWp
mV12 = MVWp2
mF2 = MFe(i3)
mF22 = MFe2(i3)
mV2 = MVWp
mV22 = MVWp2
  int1=D00check(mF12, mF22, mV22, mV12)
  BOddvvVRR=BOddvvVRR+16.*chargefactor*coup1R*coup2R*coup3R*coup4R*int1
  BOddvvVLL=BOddvvVLL+16.*chargefactor*coup1L*coup2L*coup3L*coup4L*int1
  BOddvvVRL=BOddvvVRL+4.*chargefactor*coup1R*coup2R*coup3L*coup4L*int1
  BOddvvVLR=BOddvvVLR+4.*chargefactor*coup1L*coup2L*coup3R*coup4R*int1
  End if 
End if 
    End Do 
  End Do 


 ! Fd,VZ,bar[Fv],VZ
chargefactor = 1 
! Generic diagram: FVVF,  InsertionOrder: 1
Do i1=1,3
    Do i3=1,3
If ((MFd2(i1).gt.mf_l2(3)).Or.(MVZ2.gt.mf_l2(3)).Or.(0._dp.gt.mf_l2(3)).Or.(MVZ2.gt.mf_l2(3))) Then
If (((i1.lt.4).and.(i3.lt.4)).or.(.not.OnlySM)) Then 
coup1L = cplcFdFdVZL(i1,gt1)
coup1R = cplcFdFdVZR(i1,gt1)
coup2L = cplcFdFdVZL(gt2,i1)
coup2R = cplcFdFdVZR(gt2,i1)
coup3L = cplcFvFvVZL(i3,gt3)
coup3R = cplcFvFvVZR(i3,gt3)
coup4L = cplcFvFvVZL(gt4,i3)
coup4R = cplcFvFvVZR(gt4,i3)
mF1 = MFd(i1)
mF12 = MFd2(i1)
mV1 = MVZ
mV12 = MVZ2
mF2 = 0._dp
mF22 = 0._dp
mV2 = MVZ
mV22 = MVZ2
  int1=D00check(mF12, mF22, mV22, mV12)
  BOddvvVRR=BOddvvVRR+16.*chargefactor*coup1R*coup2R*coup3R*coup4R*int1
  BOddvvVLL=BOddvvVLL+16.*chargefactor*coup1L*coup2L*coup3L*coup4L*int1
  BOddvvVRL=BOddvvVRL+4.*chargefactor*coup1R*coup2R*coup3L*coup4L*int1
  BOddvvVLR=BOddvvVLR+4.*chargefactor*coup1L*coup2L*coup3R*coup4R*int1
  End if 
End if 
    End Do 
  End Do 


 ! Fd,VZ,Fv,VZ
chargefactor = 1 
! Generic diagram: FVVF,  InsertionOrder: 2
Do i1=1,3
    Do i3=1,3
If ((MFd2(i1).gt.mf_l2(3)).Or.(MVZ2.gt.mf_l2(3)).Or.(0._dp.gt.mf_l2(3)).Or.(MVZ2.gt.mf_l2(3))) Then
If (((i1.lt.4).and.(i3.lt.4)).or.(.not.OnlySM)) Then 
coup1L = cplcFdFdVZL(i1,gt1)
coup1R = cplcFdFdVZR(i1,gt1)
coup2L = cplcFdFdVZL(gt2,i1)
coup2R = cplcFdFdVZR(gt2,i1)
coup3L = cplcFvFvVZL(gt4,i3)
coup3R = cplcFvFvVZR(gt4,i3)
coup4L = cplcFvFvVZL(i3,gt3)
coup4R = cplcFvFvVZR(i3,gt3)
mF1 = MFd(i1)
mF12 = MFd2(i1)
mV1 = MVZ
mV12 = MVZ2
mF2 = 0._dp
mF22 = 0._dp
mV2 = MVZ
mV22 = MVZ2
  int1=C0D0check(mF22, mV22, mV12, mF12)
  int2=D00check(mF12, mF22, mV22, mV12)
  BOddvvVRR=BOddvvVRR - 4.*chargefactor*coup1R*coup2R*coup3R*coup4R*(int1 -           & 
&  3.*int2)
  BOddvvVLL=BOddvvVLL - 4.*chargefactor*coup1L*coup2L*coup3L*coup4L*(int1 -           & 
&  3.*int2)
  BOddvvVRL=BOddvvVRL - 4.*chargefactor*coup1R*coup2R*coup3L*coup4L*int1
  BOddvvVLR=BOddvvVLR - 4.*chargefactor*coup1L*coup2L*coup3R*coup4R*int1
  End if 
End if 
    End Do 
  End Do 


 BOddvvVRR=oo16pi2*BOddvvVRR 
BOddvvVLL=oo16pi2*BOddvvVLL 
BOddvvVRL=oo16pi2*BOddvvVRL 
BOddvvVLR=oo16pi2*BOddvvVLR 
Iname=Iname-1

End Subroutine CalculateBox2d2nu 

Subroutine CalculatePengS2d2nu(gt1,gt2,gt3,gt4,OnlySM,MAh,MAh2,MFd,MFd2,              & 
& MFe,MFe2,MFu,MFu2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,cplAhhhVZ,cplcFdFdAhL,         & 
& cplcFdFdAhR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZR,cplcFdFucHpL,              & 
& cplcFdFucHpR,cplcFdFucVWpL,cplcFdFucVWpR,cplcFeFeVZL,cplcFeFeVZR,cplcFeFvcHpL,         & 
& cplcFeFvcHpR,cplcFeFvcVWpL,cplcFeFvcVWpR,cplcFuFdHpL,cplcFuFdHpR,cplcFuFdVWpL,         & 
& cplcFuFdVWpR,cplcFuFuVZL,cplcFuFuVZR,cplcFvFeHpL,cplcFvFeHpR,cplcFvFeVWpL,             & 
& cplcFvFeVWpR,cplcFvFvVZL,cplcFvFvVZR,cplcHpVWpVZ,cplcVWpVWpVZ,cplhhVZVZ,               & 
& cplHpcHpVZ,cplHpcVWpVZ,PSOddvvVRR,PSOddvvVLL,PSOddvvVRL,PSOddvvVLR)

! ---------------------------------------------------------------- 
! Code based on automatically generated SARAH extensions by 'PreSARAH' 
! Expressions for amplitudes are obtained by FeynArts/FormCalc 
! Based on user input for process PengS2d2nu 
! 'PreSARAH' output has been generated  at 19:19 on 4.3.2015 
! ---------------------------------------------------------------- 
 
Implicit None 
Real(dp),Intent(in) :: MAh,MAh2,MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),Mhh,Mhh2,MHp,MHp2,              & 
& MVWp,MVWp2,MVZ,MVZ2

Complex(dp),Intent(in) :: cplAhhhVZ,cplcFdFdAhL(3,3),cplcFdFdAhR(3,3),cplcFdFdhhL(3,3),cplcFdFdhhR(3,3),        & 
& cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),cplcFdFucHpL(3,3),cplcFdFucHpR(3,3),cplcFdFucVWpL(3,3),& 
& cplcFdFucVWpR(3,3),cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),cplcFeFvcHpL(3,3),cplcFeFvcHpR(3,3),& 
& cplcFeFvcVWpL(3,3),cplcFeFvcVWpR(3,3),cplcFuFdHpL(3,3),cplcFuFdHpR(3,3),               & 
& cplcFuFdVWpL(3,3),cplcFuFdVWpR(3,3),cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),cplcFvFeHpL(3,3),& 
& cplcFvFeHpR(3,3),cplcFvFeVWpL(3,3),cplcFvFeVWpR(3,3),cplcFvFvVZL(3,3),cplcFvFvVZR(3,3),& 
& cplcHpVWpVZ,cplcVWpVWpVZ,cplhhVZVZ,cplHpcHpVZ,cplHpcVWpVZ

Integer,Intent(in) :: gt1, gt2,gt3,gt4 
Logical, Intent(in) :: OnlySM 
Integer :: iprop, i1, i2, i3, i4 
Real(dp) :: MassEx1,MassEx2,MassEx3,MassEx4, MassEx12,MassEx22,MassEx32,MassEx42 
Complex(dp), Intent(out) :: PSOddvvVRR 
Complex(dp), Intent(out) :: PSOddvvVLL 
Complex(dp), Intent(out) :: PSOddvvVRL 
Complex(dp), Intent(out) :: PSOddvvVLR 
Complex(dp) :: vertex1L, vertex1R, vertex2L, vertex2R 
Real(dp) ::  MP, MP2, IMP2, IMP, MFin, MFin2, IMFin, IMFin2, Finite  
Real(dp) ::  MS1, MS12, MS2, MS22, MF1, MF12, MF2, MF22, MV1, MV12, MV2, MV22  
Complex(dp) ::  chargefactor  
Complex(dp) ::  coup1L, coup1R, coup2L, coup2R, coup3L, coup3R, coup3, coup4L, coup4R 

Complex(dp) ::  int1,int2,int3,int4,int5,int6,int7,int8 

Iname=Iname+1 
NameOfUnit(Iname)='CalculatePengS2d2nu' 

Finite=1._dp 
MassEx1=MFd(gt1)  
MassEx12=MFd2(gt1) 
MassEx2=MFd(gt2)  
MassEx22=MFd2(gt2) 
MassEx3=0._dp  
MassEx32=0._dp 
MassEx4=0._dp  
MassEx42=0._dp 
! ------------------------------ 
 ! Amplitudes for external states 
 ! {DownQuark, bar[DownQuark], Neutrino, bar[Neutrino]} 
 ! ------------------------------ 
 
PSOddvvVRR=0._dp 
PSOddvvVLL=0._dp 
PSOddvvVRL=0._dp 
PSOddvvVLR=0._dp 
PSOddvvVRR=oo16pi2*PSOddvvVRR 
PSOddvvVLL=oo16pi2*PSOddvvVLL 
PSOddvvVRL=oo16pi2*PSOddvvVRL 
PSOddvvVLR=oo16pi2*PSOddvvVLR 
Iname=Iname-1

End Subroutine CalculatePengS2d2nu 

Subroutine CalculatePengV2d2nu(gt1,gt2,gt3,gt4,OnlySM,MAh,MAh2,MFd,MFd2,              & 
& MFe,MFe2,MFu,MFu2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,cplAhhhVZ,cplcFdFdAhL,         & 
& cplcFdFdAhR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZR,cplcFdFucHpL,              & 
& cplcFdFucHpR,cplcFdFucVWpL,cplcFdFucVWpR,cplcFeFeVZL,cplcFeFeVZR,cplcFeFvcHpL,         & 
& cplcFeFvcHpR,cplcFeFvcVWpL,cplcFeFvcVWpR,cplcFuFdHpL,cplcFuFdHpR,cplcFuFdVWpL,         & 
& cplcFuFdVWpR,cplcFuFuVZL,cplcFuFuVZR,cplcFvFeHpL,cplcFvFeHpR,cplcFvFeVWpL,             & 
& cplcFvFeVWpR,cplcFvFvVZL,cplcFvFvVZR,cplcHpVWpVZ,cplcVWpVWpVZ,cplhhVZVZ,               & 
& cplHpcHpVZ,cplHpcVWpVZ,PVOddvvVRR,PVOddvvVLL,PVOddvvVRL,PVOddvvVLR)

! ---------------------------------------------------------------- 
! Code based on automatically generated SARAH extensions by 'PreSARAH' 
! Expressions for amplitudes are obtained by FeynArts/FormCalc 
! Based on user input for process PengV2d2nu 
! 'PreSARAH' output has been generated  at 19:21 on 4.3.2015 
! ---------------------------------------------------------------- 
 
Implicit None 
Real(dp),Intent(in) :: MAh,MAh2,MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),Mhh,Mhh2,MHp,MHp2,              & 
& MVWp,MVWp2,MVZ,MVZ2

Complex(dp),Intent(in) :: cplAhhhVZ,cplcFdFdAhL(3,3),cplcFdFdAhR(3,3),cplcFdFdhhL(3,3),cplcFdFdhhR(3,3),        & 
& cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),cplcFdFucHpL(3,3),cplcFdFucHpR(3,3),cplcFdFucVWpL(3,3),& 
& cplcFdFucVWpR(3,3),cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),cplcFeFvcHpL(3,3),cplcFeFvcHpR(3,3),& 
& cplcFeFvcVWpL(3,3),cplcFeFvcVWpR(3,3),cplcFuFdHpL(3,3),cplcFuFdHpR(3,3),               & 
& cplcFuFdVWpL(3,3),cplcFuFdVWpR(3,3),cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),cplcFvFeHpL(3,3),& 
& cplcFvFeHpR(3,3),cplcFvFeVWpL(3,3),cplcFvFeVWpR(3,3),cplcFvFvVZL(3,3),cplcFvFvVZR(3,3),& 
& cplcHpVWpVZ,cplcVWpVWpVZ,cplhhVZVZ,cplHpcHpVZ,cplHpcVWpVZ

Integer,Intent(in) :: gt1, gt2,gt3,gt4 
Logical, Intent(in) :: OnlySM 
Integer :: iprop, i1, i2, i3, i4 
Real(dp) :: MassEx1,MassEx2,MassEx3,MassEx4, MassEx12,MassEx22,MassEx32,MassEx42 
Complex(dp), Intent(out) :: PVOddvvVRR 
Complex(dp), Intent(out) :: PVOddvvVLL 
Complex(dp), Intent(out) :: PVOddvvVRL 
Complex(dp), Intent(out) :: PVOddvvVLR 
Complex(dp) :: vertex1L, vertex1R, vertex2L, vertex2R 
Real(dp) ::  MP, MP2, IMP2, IMP, MFin, MFin2, IMFin, IMFin2, Finite  
Real(dp) ::  MS1, MS12, MS2, MS22, MF1, MF12, MF2, MF22, MV1, MV12, MV2, MV22  
Complex(dp) ::  chargefactor  
Complex(dp) ::  coup1L, coup1R, coup2L, coup2R, coup3L, coup3R, coup3, coup4L, coup4R 

Complex(dp) ::  int1,int2,int3,int4,int5,int6,int7,int8 

Iname=Iname+1 
NameOfUnit(Iname)='CalculatePengV2d2nu' 

Finite=1._dp 
MassEx1=MFd(gt1)  
MassEx12=MFd2(gt1) 
MassEx2=MFd(gt2)  
MassEx22=MFd2(gt2) 
MassEx3=0._dp  
MassEx32=0._dp 
MassEx4=0._dp  
MassEx42=0._dp 
! ------------------------------ 
 ! Amplitudes for external states 
 ! {DownQuark, bar[DownQuark], Neutrino, bar[Neutrino]} 
 ! ------------------------------ 
 
PVOddvvVRR=0._dp 
PVOddvvVLL=0._dp 
PVOddvvVRL=0._dp 
PVOddvvVLR=0._dp 
!---------------------------------------- 
! Vector Wave Contributions            
!---------------------------------------- 
! --  VZ - Penguins            
! Propagator: VZ, Loop particles: Ah,Fd, Internal fermion: bar[Fd]
! Generic diagram: SFF,  InsertionOrder: 1
chargefactor = 1 
  Do i2=1,3
    Do i3=1,3
If ((MAh2.gt.mf_l2(3)).Or.(MFd2(i2).gt.mf_l2(3))) Then
If (((i2.lt.4).and.(i3.lt.4)).or.(.not.OnlySM)) Then 
coup1L = cplcFdFdAhL(i2,gt1)
coup1R = cplcFdFdAhR(i2,gt1)
coup2L = cplcFdFdAhL(i3,i2)
coup2R = cplcFdFdAhR(i3,i2)
coup3L = cplcFdFdVZL(gt2,i3)
coup3R = cplcFdFdVZR(gt2,i3)
coup4L = cplcFvFvVZL(gt4,gt3)
coup4R = cplcFvFvVZR(gt4,gt3)
! Masses in loop
mS1 = MAh
mS12 = MAh2
mF1 = MFd(i2)
mF12 = MFd2(i2)
! Mass of internal fermion 
MFin = MFd(i3)-MFd(gt1)
MFin2 = MFd2(i3)-MFd2(gt1)
If (Abs(MFin).gt.10E-10_dp) Then 
MFin = MFd(i3)
MFin2 = MFd2(i3)
! Propagator and inverse propagator mass 
MP = MVZ
MP2 = MVZ2
IMP = 1._dp/MP  
IMP2 = 1._dp/MP2 
! Amplitude 
  int1=B0(0._dp, mF12, mS12)
  int2=B1(0._dp, mF12, mS12)
  PVOddvvVRR=PVOddvvVRR+(chargefactor*coup3R*coup4R*IMP2*(coup1R*coup2L*int2*MassEx12 -& 
&  1.*coup1L*coup2L*int1*MassEx1*mF1 + coup1L*coup2R*int2*MassEx1*MFin - 1.*coup1R*coup2R*int1*mF1*MFin))& 
& /(MassEx12 - 1.*MFin2)
  PVOddvvVLL=PVOddvvVLL+(chargefactor*coup3L*coup4L*IMP2*(coup1L*coup2R*int2*MassEx12 -& 
&  1.*coup1R*coup2R*int1*MassEx1*mF1 + coup1R*coup2L*int2*MassEx1*MFin - 1.*coup1L*coup2L*int1*mF1*MFin))& 
& /(MassEx12 - 1.*MFin2)
  PVOddvvVRL=PVOddvvVRL+(chargefactor*coup3R*coup4L*IMP2*(coup1R*coup2L*int2*MassEx12 -& 
&  1.*coup1L*coup2L*int1*MassEx1*mF1 + coup1L*coup2R*int2*MassEx1*MFin - 1.*coup1R*coup2R*int1*mF1*MFin))& 
& /(MassEx12 - 1.*MFin2)
  PVOddvvVLR=PVOddvvVLR+(chargefactor*coup3L*coup4R*IMP2*(coup1L*coup2R*int2*MassEx12 -& 
&  1.*coup1R*coup2R*int1*MassEx1*mF1 + coup1R*coup2L*int2*MassEx1*MFin - 1.*coup1L*coup2L*int1*mF1*MFin))& 
& /(MassEx12 - 1.*MFin2)
     End if 
  End if 
End if 
   End Do 
  End Do 


 ! Propagator: VZ, Loop particles: hh,Fd, Internal fermion: bar[Fd]
! Generic diagram: SFF,  InsertionOrder: 1
chargefactor = 1 
  Do i2=1,3
    Do i3=1,3
If ((Mhh2.gt.mf_l2(3)).Or.(MFd2(i2).gt.mf_l2(3))) Then
If (.not.OnlySM) Then 
coup1L = cplcFdFdhhL(i2,gt1)
coup1R = cplcFdFdhhR(i2,gt1)
coup2L = cplcFdFdhhL(i3,i2)
coup2R = cplcFdFdhhR(i3,i2)
coup3L = cplcFdFdVZL(gt2,i3)
coup3R = cplcFdFdVZR(gt2,i3)
coup4L = cplcFvFvVZL(gt4,gt3)
coup4R = cplcFvFvVZR(gt4,gt3)
! Masses in loop
mS1 = Mhh
mS12 = Mhh2
mF1 = MFd(i2)
mF12 = MFd2(i2)
! Mass of internal fermion 
MFin = MFd(i3)-MFd(gt1)
MFin2 = MFd2(i3)-MFd2(gt1)
If (Abs(MFin).gt.10E-10_dp) Then 
MFin = MFd(i3)
MFin2 = MFd2(i3)
! Propagator and inverse propagator mass 
MP = MVZ
MP2 = MVZ2
IMP = 1._dp/MP  
IMP2 = 1._dp/MP2 
! Amplitude 
  int1=B0(0._dp, mF12, mS12)
  int2=B1(0._dp, mF12, mS12)
  PVOddvvVRR=PVOddvvVRR+(chargefactor*coup3R*coup4R*IMP2*(coup1R*coup2L*int2*MassEx12 -& 
&  1.*coup1L*coup2L*int1*MassEx1*mF1 + coup1L*coup2R*int2*MassEx1*MFin - 1.*coup1R*coup2R*int1*mF1*MFin))& 
& /(MassEx12 - 1.*MFin2)
  PVOddvvVLL=PVOddvvVLL+(chargefactor*coup3L*coup4L*IMP2*(coup1L*coup2R*int2*MassEx12 -& 
&  1.*coup1R*coup2R*int1*MassEx1*mF1 + coup1R*coup2L*int2*MassEx1*MFin - 1.*coup1L*coup2L*int1*mF1*MFin))& 
& /(MassEx12 - 1.*MFin2)
  PVOddvvVRL=PVOddvvVRL+(chargefactor*coup3R*coup4L*IMP2*(coup1R*coup2L*int2*MassEx12 -& 
&  1.*coup1L*coup2L*int1*MassEx1*mF1 + coup1L*coup2R*int2*MassEx1*MFin - 1.*coup1R*coup2R*int1*mF1*MFin))& 
& /(MassEx12 - 1.*MFin2)
  PVOddvvVLR=PVOddvvVLR+(chargefactor*coup3L*coup4R*IMP2*(coup1L*coup2R*int2*MassEx12 -& 
&  1.*coup1R*coup2R*int1*MassEx1*mF1 + coup1R*coup2L*int2*MassEx1*MFin - 1.*coup1L*coup2L*int1*mF1*MFin))& 
& /(MassEx12 - 1.*MFin2)
     End if 
  End if 
End if 
   End Do 
  End Do 


 ! Propagator: VZ, Loop particles: Hp,Fu, Internal fermion: bar[Fd]
! Generic diagram: SFF,  InsertionOrder: 1
chargefactor = 1 
  Do i2=1,3
    Do i3=1,3
If ((MHp2.gt.mf_l2(3)).Or.(MFu2(i2).gt.mf_l2(3))) Then
If (((i2.lt.4).and.(i3.lt.4)).or.(.not.OnlySM)) Then 
coup1L = cplcFuFdHpL(i2,gt1)
coup1R = cplcFuFdHpR(i2,gt1)
coup2L = cplcFdFucHpL(i3,i2)
coup2R = cplcFdFucHpR(i3,i2)
coup3L = cplcFdFdVZL(gt2,i3)
coup3R = cplcFdFdVZR(gt2,i3)
coup4L = cplcFvFvVZL(gt4,gt3)
coup4R = cplcFvFvVZR(gt4,gt3)
! Masses in loop
mS1 = MHp
mS12 = MHp2
mF1 = MFu(i2)
mF12 = MFu2(i2)
! Mass of internal fermion 
MFin = MFd(i3)-MFd(gt1)
MFin2 = MFd2(i3)-MFd2(gt1)
If (Abs(MFin).gt.10E-10_dp) Then 
MFin = MFd(i3)
MFin2 = MFd2(i3)
! Propagator and inverse propagator mass 
MP = MVZ
MP2 = MVZ2
IMP = 1._dp/MP  
IMP2 = 1._dp/MP2 
! Amplitude 
  int1=B0(0._dp, mF12, mS12)
  int2=B1(0._dp, mF12, mS12)
  PVOddvvVRR=PVOddvvVRR+(chargefactor*coup3R*coup4R*IMP2*(coup1R*coup2L*int2*MassEx12 -& 
&  1.*coup1L*coup2L*int1*MassEx1*mF1 + coup1L*coup2R*int2*MassEx1*MFin - 1.*coup1R*coup2R*int1*mF1*MFin))& 
& /(MassEx12 - 1.*MFin2)
  PVOddvvVLL=PVOddvvVLL+(chargefactor*coup3L*coup4L*IMP2*(coup1L*coup2R*int2*MassEx12 -& 
&  1.*coup1R*coup2R*int1*MassEx1*mF1 + coup1R*coup2L*int2*MassEx1*MFin - 1.*coup1L*coup2L*int1*mF1*MFin))& 
& /(MassEx12 - 1.*MFin2)
  PVOddvvVRL=PVOddvvVRL+(chargefactor*coup3R*coup4L*IMP2*(coup1R*coup2L*int2*MassEx12 -& 
&  1.*coup1L*coup2L*int1*MassEx1*mF1 + coup1L*coup2R*int2*MassEx1*MFin - 1.*coup1R*coup2R*int1*mF1*MFin))& 
& /(MassEx12 - 1.*MFin2)
  PVOddvvVLR=PVOddvvVLR+(chargefactor*coup3L*coup4R*IMP2*(coup1L*coup2R*int2*MassEx12 -& 
&  1.*coup1R*coup2R*int1*MassEx1*mF1 + coup1R*coup2L*int2*MassEx1*MFin - 1.*coup1L*coup2L*int1*mF1*MFin))& 
& /(MassEx12 - 1.*MFin2)
     End if 
  End if 
End if 
   End Do 
  End Do 


 ! Propagator: VZ, Loop particles: VWp,Fu, Internal fermion: bar[Fd]
! Generic diagram: VFF,  InsertionOrder: 1
chargefactor = 1 
  Do i2=1,3
    Do i3=1,3
If ((MVWp2.gt.mf_l2(3)).Or.(MFu2(i2).gt.mf_l2(3))) Then
If (((i2.lt.4).and.(i3.lt.4)).or.(.not.OnlySM)) Then 
coup1L = cplcFuFdVWpL(i2,gt1)
coup1R = cplcFuFdVWpR(i2,gt1)
coup2L = cplcFdFucVWpL(i3,i2)
coup2R = cplcFdFucVWpR(i3,i2)
coup3L = cplcFdFdVZL(gt2,i3)
coup3R = cplcFdFdVZR(gt2,i3)
coup4L = cplcFvFvVZL(gt4,gt3)
coup4R = cplcFvFvVZR(gt4,gt3)
! Masses in loop
mV1 = MVWp
mV12 = MVWp2
mF1 = MFu(i2)
mF12 = MFu2(i2)
! Mass of internal fermion 
MFin = MFd(i3)-MFd(gt1)
MFin2 = MFd2(i3)-MFd2(gt1)
If (Abs(MFin).gt.10E-10_dp) Then 
MFin = MFd(i3)
MFin2 = MFd2(i3)
! Propagator and inverse propagator mass 
MP = MVZ
MP2 = MVZ2
IMP = 1._dp/MP  
IMP2 = 1._dp/MP2 
! Amplitude 
  int1=B0(0._dp, mF12, mV12)
  int2=B1(0._dp, mF12, mV12)
  PVOddvvVRR=PVOddvvVRR+(chargefactor*coup3R*coup4R*IMP2*(coup1L*MassEx1*(-           & 
& 2.*coup2R*(Finite - 2.*int1)*mF1 + coup2L*(Finite + 2.*int2)*MFin) + coup1R*(coup2R*(Finite + 2.*int2)& 
& *MassEx12 - 2.*coup2L*(Finite - 2.*int1)*mF1*MFin)))/(MassEx12 - 1.*MFin2)
  PVOddvvVLL=PVOddvvVLL+(chargefactor*coup3L*coup4L*IMP2*(coup1R*MassEx1*(-           & 
& 2.*coup2L*(Finite - 2.*int1)*mF1 + coup2R*(Finite + 2.*int2)*MFin) + coup1L*(coup2L*(Finite + 2.*int2)& 
& *MassEx12 - 2.*coup2R*(Finite - 2.*int1)*mF1*MFin)))/(MassEx12 - 1.*MFin2)
  PVOddvvVRL=PVOddvvVRL+(chargefactor*coup3R*coup4L*IMP2*(coup1L*MassEx1*(-           & 
& 2.*coup2R*(Finite - 2.*int1)*mF1 + coup2L*(Finite + 2.*int2)*MFin) + coup1R*(coup2R*(Finite + 2.*int2)& 
& *MassEx12 - 2.*coup2L*(Finite - 2.*int1)*mF1*MFin)))/(MassEx12 - 1.*MFin2)
  PVOddvvVLR=PVOddvvVLR+(chargefactor*coup3L*coup4R*IMP2*(coup1R*MassEx1*(-           & 
& 2.*coup2L*(Finite - 2.*int1)*mF1 + coup2R*(Finite + 2.*int2)*MFin) + coup1L*(coup2L*(Finite + 2.*int2)& 
& *MassEx12 - 2.*coup2R*(Finite - 2.*int1)*mF1*MFin)))/(MassEx12 - 1.*MFin2)
     End if 
  End if 
End if 
   End Do 
  End Do 


 ! Propagator: VZ, Loop particles: VZ,Fd, Internal fermion: bar[Fd]
! Generic diagram: VFF,  InsertionOrder: 1
chargefactor = 1 
  Do i2=1,3
    Do i3=1,3
If ((MVZ2.gt.mf_l2(3)).Or.(MFd2(i2).gt.mf_l2(3))) Then
If (((i2.lt.4).and.(i3.lt.4)).or.(.not.OnlySM)) Then 
coup1L = cplcFdFdVZL(i2,gt1)
coup1R = cplcFdFdVZR(i2,gt1)
coup2L = cplcFdFdVZL(i3,i2)
coup2R = cplcFdFdVZR(i3,i2)
coup3L = cplcFdFdVZL(gt2,i3)
coup3R = cplcFdFdVZR(gt2,i3)
coup4L = cplcFvFvVZL(gt4,gt3)
coup4R = cplcFvFvVZR(gt4,gt3)
! Masses in loop
mV1 = MVZ
mV12 = MVZ2
mF1 = MFd(i2)
mF12 = MFd2(i2)
! Mass of internal fermion 
MFin = MFd(i3)-MFd(gt1)
MFin2 = MFd2(i3)-MFd2(gt1)
If (Abs(MFin).gt.10E-10_dp) Then 
MFin = MFd(i3)
MFin2 = MFd2(i3)
! Propagator and inverse propagator mass 
MP = MVZ
MP2 = MVZ2
IMP = 1._dp/MP  
IMP2 = 1._dp/MP2 
! Amplitude 
  int1=B0(0._dp, mF12, mV12)
  int2=B1(0._dp, mF12, mV12)
  PVOddvvVRR=PVOddvvVRR+(chargefactor*coup3R*coup4R*IMP2*(coup1L*MassEx1*(-           & 
& 2.*coup2R*(Finite - 2.*int1)*mF1 + coup2L*(Finite + 2.*int2)*MFin) + coup1R*(coup2R*(Finite + 2.*int2)& 
& *MassEx12 - 2.*coup2L*(Finite - 2.*int1)*mF1*MFin)))/(MassEx12 - 1.*MFin2)
  PVOddvvVLL=PVOddvvVLL+(chargefactor*coup3L*coup4L*IMP2*(coup1R*MassEx1*(-           & 
& 2.*coup2L*(Finite - 2.*int1)*mF1 + coup2R*(Finite + 2.*int2)*MFin) + coup1L*(coup2L*(Finite + 2.*int2)& 
& *MassEx12 - 2.*coup2R*(Finite - 2.*int1)*mF1*MFin)))/(MassEx12 - 1.*MFin2)
  PVOddvvVRL=PVOddvvVRL+(chargefactor*coup3R*coup4L*IMP2*(coup1L*MassEx1*(-           & 
& 2.*coup2R*(Finite - 2.*int1)*mF1 + coup2L*(Finite + 2.*int2)*MFin) + coup1R*(coup2R*(Finite + 2.*int2)& 
& *MassEx12 - 2.*coup2L*(Finite - 2.*int1)*mF1*MFin)))/(MassEx12 - 1.*MFin2)
  PVOddvvVLR=PVOddvvVLR+(chargefactor*coup3L*coup4R*IMP2*(coup1R*MassEx1*(-           & 
& 2.*coup2L*(Finite - 2.*int1)*mF1 + coup2R*(Finite + 2.*int2)*MFin) + coup1L*(coup2L*(Finite + 2.*int2)& 
& *MassEx12 - 2.*coup2R*(Finite - 2.*int1)*mF1*MFin)))/(MassEx12 - 1.*MFin2)
     End if 
  End if 
End if 
   End Do 
  End Do 


 ! Propagator: VZ, Loop particles: Fd,Ah, Internal fermion: Fd
! Generic diagram: FSF,  InsertionOrder: 2
chargefactor = 1 
Do i1=1,3
    Do i3=1,3
If ((MFd2(i1).gt.mf_l2(3)).Or.(MAh2.gt.mf_l2(3))) Then
If (((i1.lt.4).and.(i3.lt.4)).or.(.not.OnlySM)) Then 
coup3L = cplcFdFdVZL(i3,gt1)
coup3R = cplcFdFdVZR(i3,gt1)
coup2L = cplcFdFdAhL(i1,i3)
coup2R = cplcFdFdAhR(i1,i3)
coup1L = cplcFdFdAhL(gt2,i1)
coup1R = cplcFdFdAhR(gt2,i1)
coup4L = cplcFvFvVZL(gt4,gt3)
coup4R = cplcFvFvVZR(gt4,gt3)
! Masses in loop
mF1 = MFd(i1)
mF12 = MFd2(i1)
mS1 = MAh
mS12 = MAh2
! Mass of internal fermion 
MFin = MFd(i3)-MFd(gt2)
MFin2 = MFd2(i3)-MFd2(gt2)
If (Abs(MFin).gt.10E-10_dp) Then 
MFin = MFd(i3)
MFin2 = MFd2(i3)
! Propagator and inverse propagator mass 
MP = MVZ
MP2 = MVZ2
IMP = 1._dp/MP  
IMP2 = 1._dp/MP2 
! Amplitude 
  int1=B0(0._dp, mF12, mS12)
  int2=B1(0._dp, mF12, mS12)
  PVOddvvVRR=PVOddvvVRR+(chargefactor*coup3R*coup4R*IMP2*(coup1L*coup2R*int2*MassEx22 -& 
&  1.*coup1R*coup2R*int1*MassEx2*mF1 + coup1R*coup2L*int2*MassEx2*MFin - 1.*coup1L*coup2L*int1*mF1*MFin))& 
& /(MassEx22 - 1.*MFin2)
  PVOddvvVLL=PVOddvvVLL+(chargefactor*coup3L*coup4L*IMP2*(coup1R*coup2L*int2*MassEx22 -& 
&  1.*coup1L*coup2L*int1*MassEx2*mF1 + coup1L*coup2R*int2*MassEx2*MFin - 1.*coup1R*coup2R*int1*mF1*MFin))& 
& /(MassEx22 - 1.*MFin2)
  PVOddvvVRL=PVOddvvVRL+(chargefactor*coup3R*coup4L*IMP2*(coup1L*coup2R*int2*MassEx22 -& 
&  1.*coup1R*coup2R*int1*MassEx2*mF1 + coup1R*coup2L*int2*MassEx2*MFin - 1.*coup1L*coup2L*int1*mF1*MFin))& 
& /(MassEx22 - 1.*MFin2)
  PVOddvvVLR=PVOddvvVLR+(chargefactor*coup3L*coup4R*IMP2*(coup1R*coup2L*int2*MassEx22 -& 
&  1.*coup1L*coup2L*int1*MassEx2*mF1 + coup1L*coup2R*int2*MassEx2*MFin - 1.*coup1R*coup2R*int1*mF1*MFin))& 
& /(MassEx22 - 1.*MFin2)
     End if 
  End if 
End if 
    End Do 
  End Do 


 ! Propagator: VZ, Loop particles: Fd,hh, Internal fermion: Fd
! Generic diagram: FSF,  InsertionOrder: 2
chargefactor = 1 
Do i1=1,3
    Do i3=1,3
If ((MFd2(i1).gt.mf_l2(3)).Or.(Mhh2.gt.mf_l2(3))) Then
If (.not.OnlySM) Then 
coup3L = cplcFdFdVZL(i3,gt1)
coup3R = cplcFdFdVZR(i3,gt1)
coup2L = cplcFdFdhhL(i1,i3)
coup2R = cplcFdFdhhR(i1,i3)
coup1L = cplcFdFdhhL(gt2,i1)
coup1R = cplcFdFdhhR(gt2,i1)
coup4L = cplcFvFvVZL(gt4,gt3)
coup4R = cplcFvFvVZR(gt4,gt3)
! Masses in loop
mF1 = MFd(i1)
mF12 = MFd2(i1)
mS1 = Mhh
mS12 = Mhh2
! Mass of internal fermion 
MFin = MFd(i3)-MFd(gt2)
MFin2 = MFd2(i3)-MFd2(gt2)
If (Abs(MFin).gt.10E-10_dp) Then 
MFin = MFd(i3)
MFin2 = MFd2(i3)
! Propagator and inverse propagator mass 
MP = MVZ
MP2 = MVZ2
IMP = 1._dp/MP  
IMP2 = 1._dp/MP2 
! Amplitude 
  int1=B0(0._dp, mF12, mS12)
  int2=B1(0._dp, mF12, mS12)
  PVOddvvVRR=PVOddvvVRR+(chargefactor*coup3R*coup4R*IMP2*(coup1L*coup2R*int2*MassEx22 -& 
&  1.*coup1R*coup2R*int1*MassEx2*mF1 + coup1R*coup2L*int2*MassEx2*MFin - 1.*coup1L*coup2L*int1*mF1*MFin))& 
& /(MassEx22 - 1.*MFin2)
  PVOddvvVLL=PVOddvvVLL+(chargefactor*coup3L*coup4L*IMP2*(coup1R*coup2L*int2*MassEx22 -& 
&  1.*coup1L*coup2L*int1*MassEx2*mF1 + coup1L*coup2R*int2*MassEx2*MFin - 1.*coup1R*coup2R*int1*mF1*MFin))& 
& /(MassEx22 - 1.*MFin2)
  PVOddvvVRL=PVOddvvVRL+(chargefactor*coup3R*coup4L*IMP2*(coup1L*coup2R*int2*MassEx22 -& 
&  1.*coup1R*coup2R*int1*MassEx2*mF1 + coup1R*coup2L*int2*MassEx2*MFin - 1.*coup1L*coup2L*int1*mF1*MFin))& 
& /(MassEx22 - 1.*MFin2)
  PVOddvvVLR=PVOddvvVLR+(chargefactor*coup3L*coup4R*IMP2*(coup1R*coup2L*int2*MassEx22 -& 
&  1.*coup1L*coup2L*int1*MassEx2*mF1 + coup1L*coup2R*int2*MassEx2*MFin - 1.*coup1R*coup2R*int1*mF1*MFin))& 
& /(MassEx22 - 1.*MFin2)
     End if 
  End if 
End if 
    End Do 
  End Do 


 ! Propagator: VZ, Loop particles: Fu,Hp, Internal fermion: Fd
! Generic diagram: FSF,  InsertionOrder: 2
chargefactor = 1 
Do i1=1,3
    Do i3=1,3
If ((MFu2(i1).gt.mf_l2(3)).Or.(MHp2.gt.mf_l2(3))) Then
If (((i1.lt.4).and.(i3.lt.4)).or.(.not.OnlySM)) Then 
coup3L = cplcFdFdVZL(i3,gt1)
coup3R = cplcFdFdVZR(i3,gt1)
coup2L = cplcFuFdHpL(i1,i3)
coup2R = cplcFuFdHpR(i1,i3)
coup1L = cplcFdFucHpL(gt2,i1)
coup1R = cplcFdFucHpR(gt2,i1)
coup4L = cplcFvFvVZL(gt4,gt3)
coup4R = cplcFvFvVZR(gt4,gt3)
! Masses in loop
mF1 = MFu(i1)
mF12 = MFu2(i1)
mS1 = MHp
mS12 = MHp2
! Mass of internal fermion 
MFin = MFd(i3)-MFd(gt2)
MFin2 = MFd2(i3)-MFd2(gt2)
If (Abs(MFin).gt.10E-10_dp) Then 
MFin = MFd(i3)
MFin2 = MFd2(i3)
! Propagator and inverse propagator mass 
MP = MVZ
MP2 = MVZ2
IMP = 1._dp/MP  
IMP2 = 1._dp/MP2 
! Amplitude 
  int1=B0(0._dp, mF12, mS12)
  int2=B1(0._dp, mF12, mS12)
  PVOddvvVRR=PVOddvvVRR+(chargefactor*coup3R*coup4R*IMP2*(coup1L*coup2R*int2*MassEx22 -& 
&  1.*coup1R*coup2R*int1*MassEx2*mF1 + coup1R*coup2L*int2*MassEx2*MFin - 1.*coup1L*coup2L*int1*mF1*MFin))& 
& /(MassEx22 - 1.*MFin2)
  PVOddvvVLL=PVOddvvVLL+(chargefactor*coup3L*coup4L*IMP2*(coup1R*coup2L*int2*MassEx22 -& 
&  1.*coup1L*coup2L*int1*MassEx2*mF1 + coup1L*coup2R*int2*MassEx2*MFin - 1.*coup1R*coup2R*int1*mF1*MFin))& 
& /(MassEx22 - 1.*MFin2)
  PVOddvvVRL=PVOddvvVRL+(chargefactor*coup3R*coup4L*IMP2*(coup1L*coup2R*int2*MassEx22 -& 
&  1.*coup1R*coup2R*int1*MassEx2*mF1 + coup1R*coup2L*int2*MassEx2*MFin - 1.*coup1L*coup2L*int1*mF1*MFin))& 
& /(MassEx22 - 1.*MFin2)
  PVOddvvVLR=PVOddvvVLR+(chargefactor*coup3L*coup4R*IMP2*(coup1R*coup2L*int2*MassEx22 -& 
&  1.*coup1L*coup2L*int1*MassEx2*mF1 + coup1L*coup2R*int2*MassEx2*MFin - 1.*coup1R*coup2R*int1*mF1*MFin))& 
& /(MassEx22 - 1.*MFin2)
     End if 
  End if 
End if 
    End Do 
  End Do 


 ! Propagator: VZ, Loop particles: Fu,VWp, Internal fermion: Fd
! Generic diagram: FVF,  InsertionOrder: 2
chargefactor = 1 
Do i1=1,3
    Do i3=1,3
If ((MFu2(i1).gt.mf_l2(3)).Or.(MVWp2.gt.mf_l2(3))) Then
If (((i1.lt.4).and.(i3.lt.4)).or.(.not.OnlySM)) Then 
coup3L = cplcFdFdVZL(i3,gt1)
coup3R = cplcFdFdVZR(i3,gt1)
coup2L = cplcFuFdVWpL(i1,i3)
coup2R = cplcFuFdVWpR(i1,i3)
coup1L = cplcFdFucVWpL(gt2,i1)
coup1R = cplcFdFucVWpR(gt2,i1)
coup4L = cplcFvFvVZL(gt4,gt3)
coup4R = cplcFvFvVZR(gt4,gt3)
! Masses in loop
mF1 = MFu(i1)
mF12 = MFu2(i1)
mV1 = MVWp
mV12 = MVWp2
! Mass of internal fermion 
MFin = MFd(i3)-MFd(gt2)
MFin2 = MFd2(i3)-MFd2(gt2)
If (Abs(MFin).gt.10E-10_dp) Then 
MFin = MFd(i3)
MFin2 = MFd2(i3)
! Propagator and inverse propagator mass 
MP = MVZ
MP2 = MVZ2
IMP = 1._dp/MP  
IMP2 = 1._dp/MP2 
! Amplitude 
  int1=B0(0._dp, mF12, mV12)
  int2=B1(0._dp, mF12, mV12)
  PVOddvvVRR=PVOddvvVRR+(chargefactor*coup3R*coup4R*IMP2*(coup1L*MassEx2*(-           & 
& 2.*coup2R*(Finite - 2.*int1)*mF1 + coup2L*(Finite + 2.*int2)*MFin) + coup1R*(coup2R*(Finite + 2.*int2)& 
& *MassEx22 - 2.*coup2L*(Finite - 2.*int1)*mF1*MFin)))/(MassEx22 - 1.*MFin2)
  PVOddvvVLL=PVOddvvVLL+(chargefactor*coup3L*coup4L*IMP2*(coup1R*MassEx2*(-           & 
& 2.*coup2L*(Finite - 2.*int1)*mF1 + coup2R*(Finite + 2.*int2)*MFin) + coup1L*(coup2L*(Finite + 2.*int2)& 
& *MassEx22 - 2.*coup2R*(Finite - 2.*int1)*mF1*MFin)))/(MassEx22 - 1.*MFin2)
  PVOddvvVRL=PVOddvvVRL+(chargefactor*coup3R*coup4L*IMP2*(coup1L*MassEx2*(-           & 
& 2.*coup2R*(Finite - 2.*int1)*mF1 + coup2L*(Finite + 2.*int2)*MFin) + coup1R*(coup2R*(Finite + 2.*int2)& 
& *MassEx22 - 2.*coup2L*(Finite - 2.*int1)*mF1*MFin)))/(MassEx22 - 1.*MFin2)
  PVOddvvVLR=PVOddvvVLR+(chargefactor*coup3L*coup4R*IMP2*(coup1R*MassEx2*(-           & 
& 2.*coup2L*(Finite - 2.*int1)*mF1 + coup2R*(Finite + 2.*int2)*MFin) + coup1L*(coup2L*(Finite + 2.*int2)& 
& *MassEx22 - 2.*coup2R*(Finite - 2.*int1)*mF1*MFin)))/(MassEx22 - 1.*MFin2)
     End if 
  End if 
End if 
    End Do 
  End Do 


 ! Propagator: VZ, Loop particles: Fd,VZ, Internal fermion: Fd
! Generic diagram: FVF,  InsertionOrder: 2
chargefactor = 1 
Do i1=1,3
    Do i3=1,3
If ((MFd2(i1).gt.mf_l2(3)).Or.(MVZ2.gt.mf_l2(3))) Then
If (((i1.lt.4).and.(i3.lt.4)).or.(.not.OnlySM)) Then 
coup3L = cplcFdFdVZL(i3,gt1)
coup3R = cplcFdFdVZR(i3,gt1)
coup2L = cplcFdFdVZL(i1,i3)
coup2R = cplcFdFdVZR(i1,i3)
coup1L = cplcFdFdVZL(gt2,i1)
coup1R = cplcFdFdVZR(gt2,i1)
coup4L = cplcFvFvVZL(gt4,gt3)
coup4R = cplcFvFvVZR(gt4,gt3)
! Masses in loop
mF1 = MFd(i1)
mF12 = MFd2(i1)
mV1 = MVZ
mV12 = MVZ2
! Mass of internal fermion 
MFin = MFd(i3)-MFd(gt2)
MFin2 = MFd2(i3)-MFd2(gt2)
If (Abs(MFin).gt.10E-10_dp) Then 
MFin = MFd(i3)
MFin2 = MFd2(i3)
! Propagator and inverse propagator mass 
MP = MVZ
MP2 = MVZ2
IMP = 1._dp/MP  
IMP2 = 1._dp/MP2 
! Amplitude 
  int1=B0(0._dp, mF12, mV12)
  int2=B1(0._dp, mF12, mV12)
  PVOddvvVRR=PVOddvvVRR+(chargefactor*coup3R*coup4R*IMP2*(coup1L*MassEx2*(-           & 
& 2.*coup2R*(Finite - 2.*int1)*mF1 + coup2L*(Finite + 2.*int2)*MFin) + coup1R*(coup2R*(Finite + 2.*int2)& 
& *MassEx22 - 2.*coup2L*(Finite - 2.*int1)*mF1*MFin)))/(MassEx22 - 1.*MFin2)
  PVOddvvVLL=PVOddvvVLL+(chargefactor*coup3L*coup4L*IMP2*(coup1R*MassEx2*(-           & 
& 2.*coup2L*(Finite - 2.*int1)*mF1 + coup2R*(Finite + 2.*int2)*MFin) + coup1L*(coup2L*(Finite + 2.*int2)& 
& *MassEx22 - 2.*coup2R*(Finite - 2.*int1)*mF1*MFin)))/(MassEx22 - 1.*MFin2)
  PVOddvvVRL=PVOddvvVRL+(chargefactor*coup3R*coup4L*IMP2*(coup1L*MassEx2*(-           & 
& 2.*coup2R*(Finite - 2.*int1)*mF1 + coup2L*(Finite + 2.*int2)*MFin) + coup1R*(coup2R*(Finite + 2.*int2)& 
& *MassEx22 - 2.*coup2L*(Finite - 2.*int1)*mF1*MFin)))/(MassEx22 - 1.*MFin2)
  PVOddvvVLR=PVOddvvVLR+(chargefactor*coup3L*coup4R*IMP2*(coup1R*MassEx2*(-           & 
& 2.*coup2L*(Finite - 2.*int1)*mF1 + coup2R*(Finite + 2.*int2)*MFin) + coup1L*(coup2L*(Finite + 2.*int2)& 
& *MassEx22 - 2.*coup2R*(Finite - 2.*int1)*mF1*MFin)))/(MassEx22 - 1.*MFin2)
     End if 
  End if 
End if 
    End Do 
  End Do 


 !---------------------------------------- 
! Vector Penguin Contributions            
!---------------------------------------- 
! --  VZ - Penguins            
! Propagator: VZ, Loop particles: Ah,Fd,Fd
! Generic diagram: SFF,  InsertionOrder: 1
chargefactor = 1 
  Do i2=1,3
    Do i3=1,3
If ((MAh2.gt.mf_l2(3)).Or.(MFd2(i2).gt.mf_l2(3)).Or.(MFd2(i3).gt.mf_l2(3))) Then
If (((i2.lt.4).and.(i3.lt.4)).or.(.not.OnlySM)) Then 
coup1L = cplcFdFdAhL(i2,gt1)
coup1R = cplcFdFdAhR(i2,gt1)
coup2L = cplcFdFdAhL(gt2,i3)
coup2R = cplcFdFdAhR(gt2,i3)
coup3L = cplcFdFdVZL(i3,i2)
coup3R = cplcFdFdVZR(i3,i2)
coup4L = cplcFvFvVZL(gt4,gt3)
coup4R = cplcFvFvVZR(gt4,gt3)
! Masses in loop
mS1 = MAh
mS12 = MAh2
mF1 = MFd(i2)
mF12 = MFd2(i2)
mF2 = MFd(i3)
mF22 = MFd2(i3)
! Propagator and inverse propagator mass 
MP = MVZ
MP2 = MVZ2
IMP = 1._dp/MP  
IMP2 = 1._dp/MP2 
! Amplitude 
  int1=B0C0check(mF22, mF12, mS12)
  int2=C00_3m(mF22, mF12, mS12)
  int3=C0check(mF22, mF12, mS12)
  PVOddvvVRR=PVOddvvVRR+chargefactor*coup1R*coup2L*coup4R*IMP2*(coup3L*(int1 -        & 
&  2.*int2) - 1.*coup3R*int3*mF1*mF2)
  PVOddvvVLL=PVOddvvVLL+chargefactor*coup1L*coup2R*coup4L*IMP2*(coup3R*(int1 -        & 
&  2.*int2) - 1.*coup3L*int3*mF1*mF2)
  PVOddvvVRL=PVOddvvVRL+chargefactor*coup1R*coup2L*coup4L*IMP2*(coup3L*(int1 -        & 
&  2.*int2) - 1.*coup3R*int3*mF1*mF2)
  PVOddvvVLR=PVOddvvVLR+chargefactor*coup1L*coup2R*coup4R*IMP2*(coup3R*(int1 -        & 
&  2.*int2) - 1.*coup3L*int3*mF1*mF2)
  End if 
End if 
   End Do 
  End Do 


 ! Propagator: VZ, Loop particles: hh,Fd,Fd
! Generic diagram: SFF,  InsertionOrder: 1
chargefactor = 1 
  Do i2=1,3
    Do i3=1,3
If ((Mhh2.gt.mf_l2(3)).Or.(MFd2(i2).gt.mf_l2(3)).Or.(MFd2(i3).gt.mf_l2(3))) Then
If (.not.OnlySM) Then 
coup1L = cplcFdFdhhL(i2,gt1)
coup1R = cplcFdFdhhR(i2,gt1)
coup2L = cplcFdFdhhL(gt2,i3)
coup2R = cplcFdFdhhR(gt2,i3)
coup3L = cplcFdFdVZL(i3,i2)
coup3R = cplcFdFdVZR(i3,i2)
coup4L = cplcFvFvVZL(gt4,gt3)
coup4R = cplcFvFvVZR(gt4,gt3)
! Masses in loop
mS1 = Mhh
mS12 = Mhh2
mF1 = MFd(i2)
mF12 = MFd2(i2)
mF2 = MFd(i3)
mF22 = MFd2(i3)
! Propagator and inverse propagator mass 
MP = MVZ
MP2 = MVZ2
IMP = 1._dp/MP  
IMP2 = 1._dp/MP2 
! Amplitude 
  int1=B0C0check(mF22, mF12, mS12)
  int2=C00_3m(mF22, mF12, mS12)
  int3=C0check(mF22, mF12, mS12)
  PVOddvvVRR=PVOddvvVRR+chargefactor*coup1R*coup2L*coup4R*IMP2*(coup3L*(int1 -        & 
&  2.*int2) - 1.*coup3R*int3*mF1*mF2)
  PVOddvvVLL=PVOddvvVLL+chargefactor*coup1L*coup2R*coup4L*IMP2*(coup3R*(int1 -        & 
&  2.*int2) - 1.*coup3L*int3*mF1*mF2)
  PVOddvvVRL=PVOddvvVRL+chargefactor*coup1R*coup2L*coup4L*IMP2*(coup3L*(int1 -        & 
&  2.*int2) - 1.*coup3R*int3*mF1*mF2)
  PVOddvvVLR=PVOddvvVLR+chargefactor*coup1L*coup2R*coup4R*IMP2*(coup3R*(int1 -        & 
&  2.*int2) - 1.*coup3L*int3*mF1*mF2)
  End if 
End if 
   End Do 
  End Do 


 ! Propagator: VZ, Loop particles: Hp,Fu,Fu
! Generic diagram: SFF,  InsertionOrder: 1
chargefactor = 1 
  Do i2=1,3
    Do i3=1,3
If ((MHp2.gt.mf_l2(3)).Or.(MFu2(i2).gt.mf_l2(3)).Or.(MFu2(i3).gt.mf_l2(3))) Then
If (((i2.lt.4).and.(i3.lt.4)).or.(.not.OnlySM)) Then 
coup1L = cplcFuFdHpL(i2,gt1)
coup1R = cplcFuFdHpR(i2,gt1)
coup2L = cplcFdFucHpL(gt2,i3)
coup2R = cplcFdFucHpR(gt2,i3)
coup3L = cplcFuFuVZL(i3,i2)
coup3R = cplcFuFuVZR(i3,i2)
coup4L = cplcFvFvVZL(gt4,gt3)
coup4R = cplcFvFvVZR(gt4,gt3)
! Masses in loop
mS1 = MHp
mS12 = MHp2
mF1 = MFu(i2)
mF12 = MFu2(i2)
mF2 = MFu(i3)
mF22 = MFu2(i3)
! Propagator and inverse propagator mass 
MP = MVZ
MP2 = MVZ2
IMP = 1._dp/MP  
IMP2 = 1._dp/MP2 
! Amplitude 
  int1=B0C0check(mF22, mF12, mS12)
  int2=C00_3m(mF22, mF12, mS12)
  int3=C0check(mF22, mF12, mS12)
  PVOddvvVRR=PVOddvvVRR+chargefactor*coup1R*coup2L*coup4R*IMP2*(coup3L*(int1 -        & 
&  2.*int2) - 1.*coup3R*int3*mF1*mF2)
  PVOddvvVLL=PVOddvvVLL+chargefactor*coup1L*coup2R*coup4L*IMP2*(coup3R*(int1 -        & 
&  2.*int2) - 1.*coup3L*int3*mF1*mF2)
  PVOddvvVRL=PVOddvvVRL+chargefactor*coup1R*coup2L*coup4L*IMP2*(coup3L*(int1 -        & 
&  2.*int2) - 1.*coup3R*int3*mF1*mF2)
  PVOddvvVLR=PVOddvvVLR+chargefactor*coup1L*coup2R*coup4R*IMP2*(coup3R*(int1 -        & 
&  2.*int2) - 1.*coup3L*int3*mF1*mF2)
  End if 
End if 
   End Do 
  End Do 


 ! Propagator: VZ, Loop particles: VWp,Fu,Fu
! Generic diagram: VFF,  InsertionOrder: 1
chargefactor = 1 
  Do i2=1,3
    Do i3=1,3
If ((MVWp2.gt.mf_l2(3)).Or.(MFu2(i2).gt.mf_l2(3)).Or.(MFu2(i3).gt.mf_l2(3))) Then
If (((i2.lt.4).and.(i3.lt.4)).or.(.not.OnlySM)) Then 
coup1L = cplcFuFdVWpL(i2,gt1)
coup1R = cplcFuFdVWpR(i2,gt1)
coup2L = cplcFdFucVWpL(gt2,i3)
coup2R = cplcFdFucVWpR(gt2,i3)
coup3L = cplcFuFuVZL(i3,i2)
coup3R = cplcFuFuVZR(i3,i2)
coup4L = cplcFvFvVZL(gt4,gt3)
coup4R = cplcFvFvVZR(gt4,gt3)
! Masses in loop
mV1 = MVWp
mV12 = MVWp2
mF1 = MFu(i2)
mF12 = MFu2(i2)
mF2 = MFu(i3)
mF22 = MFu2(i3)
! Propagator and inverse propagator mass 
MP = MVZ
MP2 = MVZ2
IMP = 1._dp/MP  
IMP2 = 1._dp/MP2 
! Amplitude 
  int1=B0C0check(mF22, mF12, mV12)
  int2=C00_3m(mF22, mF12, mV12)
  int3=C0check(mF22, mF12, mV12)
  PVOddvvVRR=PVOddvvVRR - 1.*chargefactor*coup1R*coup2R*coup4R*IMP2*(coup3R*(Finite - & 
&  2.*int1 + 4.*int2) + 2.*coup3L*int3*mF1*mF2)
  PVOddvvVLL=PVOddvvVLL - 1.*chargefactor*coup1L*coup2L*coup4L*IMP2*(coup3L*(Finite - & 
&  2.*int1 + 4.*int2) + 2.*coup3R*int3*mF1*mF2)
  PVOddvvVRL=PVOddvvVRL - 1.*chargefactor*coup1R*coup2R*coup4L*IMP2*(coup3R*(Finite - & 
&  2.*int1 + 4.*int2) + 2.*coup3L*int3*mF1*mF2)
  PVOddvvVLR=PVOddvvVLR - 1.*chargefactor*coup1L*coup2L*coup4R*IMP2*(coup3L*(Finite - & 
&  2.*int1 + 4.*int2) + 2.*coup3R*int3*mF1*mF2)
  End if 
End if 
   End Do 
  End Do 


 ! Propagator: VZ, Loop particles: VZ,Fd,Fd
! Generic diagram: VFF,  InsertionOrder: 1
chargefactor = 1 
  Do i2=1,3
    Do i3=1,3
If ((MVZ2.gt.mf_l2(3)).Or.(MFd2(i2).gt.mf_l2(3)).Or.(MFd2(i3).gt.mf_l2(3))) Then
If (((i2.lt.4).and.(i3.lt.4)).or.(.not.OnlySM)) Then 
coup1L = cplcFdFdVZL(i2,gt1)
coup1R = cplcFdFdVZR(i2,gt1)
coup2L = cplcFdFdVZL(gt2,i3)
coup2R = cplcFdFdVZR(gt2,i3)
coup3L = cplcFdFdVZL(i3,i2)
coup3R = cplcFdFdVZR(i3,i2)
coup4L = cplcFvFvVZL(gt4,gt3)
coup4R = cplcFvFvVZR(gt4,gt3)
! Masses in loop
mV1 = MVZ
mV12 = MVZ2
mF1 = MFd(i2)
mF12 = MFd2(i2)
mF2 = MFd(i3)
mF22 = MFd2(i3)
! Propagator and inverse propagator mass 
MP = MVZ
MP2 = MVZ2
IMP = 1._dp/MP  
IMP2 = 1._dp/MP2 
! Amplitude 
  int1=B0C0check(mF22, mF12, mV12)
  int2=C00_3m(mF22, mF12, mV12)
  int3=C0check(mF22, mF12, mV12)
  PVOddvvVRR=PVOddvvVRR - 1.*chargefactor*coup1R*coup2R*coup4R*IMP2*(coup3R*(Finite - & 
&  2.*int1 + 4.*int2) + 2.*coup3L*int3*mF1*mF2)
  PVOddvvVLL=PVOddvvVLL - 1.*chargefactor*coup1L*coup2L*coup4L*IMP2*(coup3L*(Finite - & 
&  2.*int1 + 4.*int2) + 2.*coup3R*int3*mF1*mF2)
  PVOddvvVRL=PVOddvvVRL - 1.*chargefactor*coup1R*coup2R*coup4L*IMP2*(coup3R*(Finite - & 
&  2.*int1 + 4.*int2) + 2.*coup3L*int3*mF1*mF2)
  PVOddvvVLR=PVOddvvVLR - 1.*chargefactor*coup1L*coup2L*coup4R*IMP2*(coup3L*(Finite - & 
&  2.*int1 + 4.*int2) + 2.*coup3R*int3*mF1*mF2)
  End if 
End if 
   End Do 
  End Do 


 ! Propagator: VZ, Loop particles: bar[Fd],hh,Ah
! Generic diagram: FSS,  InsertionOrder: 1
chargefactor = 1 
Do i1=1,3
If ((MFd2(i1).gt.mf_l2(3)).Or.(Mhh2.gt.mf_l2(3)).Or.(MAh2.gt.mf_l2(3))) Then
If (.not.OnlySM) Then 
coup1L = cplcFdFdhhL(i1,gt1)
coup1R = cplcFdFdhhR(i1,gt1)
coup2L = cplcFdFdAhL(gt2,i1)
coup2R = cplcFdFdAhR(gt2,i1)
coup3 = cplAhhhVZ
coup4L = cplcFvFvVZL(gt4,gt3)
coup4R = cplcFvFvVZR(gt4,gt3)
! Masses in loop
mF1 = MFd(i1)
mF12 = MFd2(i1)
mS1 = Mhh
mS12 = Mhh2
mS2 = MAh
mS22 = MAh2
! Propagator and inverse propagator mass 
MP = MVZ
MP2 = MVZ2
IMP = 1._dp/MP  
IMP2 = 1._dp/MP2 
! Amplitude 
  int1=C00_3m(mF12, mS22, mS12)
  PVOddvvVRR=PVOddvvVRR+2.*chargefactor*coup1R*coup2L*coup3*coup4R*IMP2*int1
  PVOddvvVLL=PVOddvvVLL+2.*chargefactor*coup1L*coup2R*coup3*coup4L*IMP2*int1
  PVOddvvVRL=PVOddvvVRL+2.*chargefactor*coup1R*coup2L*coup3*coup4L*IMP2*int1
  PVOddvvVLR=PVOddvvVLR+2.*chargefactor*coup1L*coup2R*coup3*coup4R*IMP2*int1
  End if 
End if 
    End Do 


 ! Propagator: VZ, Loop particles: bar[Fd],Ah,hh
! Generic diagram: FSS,  InsertionOrder: 1
chargefactor = 1 
Do i1=1,3
If ((MFd2(i1).gt.mf_l2(3)).Or.(MAh2.gt.mf_l2(3)).Or.(Mhh2.gt.mf_l2(3))) Then
If (.not.OnlySM) Then 
coup1L = cplcFdFdAhL(i1,gt1)
coup1R = cplcFdFdAhR(i1,gt1)
coup2L = cplcFdFdhhL(gt2,i1)
coup2R = cplcFdFdhhR(gt2,i1)
coup3 = -cplAhhhVZ
coup4L = cplcFvFvVZL(gt4,gt3)
coup4R = cplcFvFvVZR(gt4,gt3)
! Masses in loop
mF1 = MFd(i1)
mF12 = MFd2(i1)
mS1 = MAh
mS12 = MAh2
mS2 = Mhh
mS22 = Mhh2
! Propagator and inverse propagator mass 
MP = MVZ
MP2 = MVZ2
IMP = 1._dp/MP  
IMP2 = 1._dp/MP2 
! Amplitude 
  int1=C00_3m(mF12, mS22, mS12)
  PVOddvvVRR=PVOddvvVRR+2.*chargefactor*coup1R*coup2L*coup3*coup4R*IMP2*int1
  PVOddvvVLL=PVOddvvVLL+2.*chargefactor*coup1L*coup2R*coup3*coup4L*IMP2*int1
  PVOddvvVRL=PVOddvvVRL+2.*chargefactor*coup1R*coup2L*coup3*coup4L*IMP2*int1
  PVOddvvVLR=PVOddvvVLR+2.*chargefactor*coup1L*coup2R*coup3*coup4R*IMP2*int1
  End if 
End if 
    End Do 


 ! Propagator: VZ, Loop particles: bar[Fd],VZ,hh
! Generic diagram: FVS,  InsertionOrder: 1
chargefactor = 1 
Do i1=1,3
If ((MFd2(i1).gt.mf_l2(3)).Or.(MVZ2.gt.mf_l2(3)).Or.(Mhh2.gt.mf_l2(3))) Then
If (.not.OnlySM) Then 
coup1L = cplcFdFdVZL(i1,gt1)
coup1R = cplcFdFdVZR(i1,gt1)
coup2L = cplcFdFdhhL(gt2,i1)
coup2R = cplcFdFdhhR(gt2,i1)
coup3 = cplhhVZVZ
coup4L = cplcFvFvVZL(gt4,gt3)
coup4R = cplcFvFvVZR(gt4,gt3)
! Masses in loop
mF1 = MFd(i1)
mF12 = MFd2(i1)
mV1 = MVZ
mV12 = MVZ2
mS2 = Mhh
mS22 = Mhh2
! Propagator and inverse propagator mass 
MP = MVZ
MP2 = MVZ2
IMP = 1._dp/MP  
IMP2 = 1._dp/MP2 
! Amplitude 
  int1=C0check(mF12, mS22, mV12)
  PVOddvvVRR=PVOddvvVRR+chargefactor*coup1R*coup2L*coup3*coup4R*IMP2*int1*mF1
  PVOddvvVLL=PVOddvvVLL+chargefactor*coup1L*coup2R*coup3*coup4L*IMP2*int1*mF1
  PVOddvvVRL=PVOddvvVRL+chargefactor*coup1R*coup2L*coup3*coup4L*IMP2*int1*mF1
  PVOddvvVLR=PVOddvvVLR+chargefactor*coup1L*coup2R*coup3*coup4R*IMP2*int1*mF1
  End if 
End if 
    End Do 


 ! Propagator: VZ, Loop particles: bar[Fd],hh,VZ
! Generic diagram: FSV,  InsertionOrder: 1
chargefactor = 1 
Do i1=1,3
If ((MFd2(i1).gt.mf_l2(3)).Or.(Mhh2.gt.mf_l2(3)).Or.(MVZ2.gt.mf_l2(3))) Then
If (.not.OnlySM) Then 
coup1L = cplcFdFdhhL(i1,gt1)
coup1R = cplcFdFdhhR(i1,gt1)
coup2L = cplcFdFdVZL(gt2,i1)
coup2R = cplcFdFdVZR(gt2,i1)
coup3 = cplhhVZVZ
coup4L = cplcFvFvVZL(gt4,gt3)
coup4R = cplcFvFvVZR(gt4,gt3)
! Masses in loop
mF1 = MFd(i1)
mF12 = MFd2(i1)
mS1 = Mhh
mS12 = Mhh2
mV2 = MVZ
mV22 = MVZ2
! Propagator and inverse propagator mass 
MP = MVZ
MP2 = MVZ2
IMP = 1._dp/MP  
IMP2 = 1._dp/MP2 
! Amplitude 
  int1=C0check(mF12, mV22, mS12)
  PVOddvvVRR=PVOddvvVRR+chargefactor*coup1R*coup2R*coup3*coup4R*IMP2*int1*mF1
  PVOddvvVLL=PVOddvvVLL+chargefactor*coup1L*coup2L*coup3*coup4L*IMP2*int1*mF1
  PVOddvvVRL=PVOddvvVRL+chargefactor*coup1R*coup2R*coup3*coup4L*IMP2*int1*mF1
  PVOddvvVLR=PVOddvvVLR+chargefactor*coup1L*coup2L*coup3*coup4R*IMP2*int1*mF1
  End if 
End if 
    End Do 


 ! Propagator: VZ, Loop particles: bar[Fu],conj[Hp],conj[Hp]
! Generic diagram: FSS,  InsertionOrder: 1
chargefactor = 1 
Do i1=1,3
If ((MFu2(i1).gt.mf_l2(3)).Or.(MHp2.gt.mf_l2(3)).Or.(MHp2.gt.mf_l2(3))) Then
If (((i1.lt.4)).or.(.not.OnlySM)) Then 
coup1L = cplcFuFdHpL(i1,gt1)
coup1R = cplcFuFdHpR(i1,gt1)
coup2L = cplcFdFucHpL(gt2,i1)
coup2R = cplcFdFucHpR(gt2,i1)
coup3 = cplHpcHpVZ
coup4L = cplcFvFvVZL(gt4,gt3)
coup4R = cplcFvFvVZR(gt4,gt3)
! Masses in loop
mF1 = MFu(i1)
mF12 = MFu2(i1)
mS1 = MHp
mS12 = MHp2
mS2 = MHp
mS22 = MHp2
! Propagator and inverse propagator mass 
MP = MVZ
MP2 = MVZ2
IMP = 1._dp/MP  
IMP2 = 1._dp/MP2 
! Amplitude 
  int1=C00_3m(mF12, mS22, mS12)
  PVOddvvVRR=PVOddvvVRR+2.*chargefactor*coup1R*coup2L*coup3*coup4R*IMP2*int1
  PVOddvvVLL=PVOddvvVLL+2.*chargefactor*coup1L*coup2R*coup3*coup4L*IMP2*int1
  PVOddvvVRL=PVOddvvVRL+2.*chargefactor*coup1R*coup2L*coup3*coup4L*IMP2*int1
  PVOddvvVLR=PVOddvvVLR+2.*chargefactor*coup1L*coup2R*coup3*coup4R*IMP2*int1
  End if 
End if 
    End Do 


 ! Propagator: VZ, Loop particles: bar[Fu],conj[VWp],conj[Hp]
! Generic diagram: FVS,  InsertionOrder: 1
chargefactor = 1 
Do i1=1,3
If ((MFu2(i1).gt.mf_l2(3)).Or.(MVWp2.gt.mf_l2(3)).Or.(MHp2.gt.mf_l2(3))) Then
If (((i1.lt.4)).or.(.not.OnlySM)) Then 
coup1L = cplcFuFdVWpL(i1,gt1)
coup1R = cplcFuFdVWpR(i1,gt1)
coup2L = cplcFdFucHpL(gt2,i1)
coup2R = cplcFdFucHpR(gt2,i1)
coup3 = cplHpcVWpVZ
coup4L = cplcFvFvVZL(gt4,gt3)
coup4R = cplcFvFvVZR(gt4,gt3)
! Masses in loop
mF1 = MFu(i1)
mF12 = MFu2(i1)
mV1 = MVWp
mV12 = MVWp2
mS2 = MHp
mS22 = MHp2
! Propagator and inverse propagator mass 
MP = MVZ
MP2 = MVZ2
IMP = 1._dp/MP  
IMP2 = 1._dp/MP2 
! Amplitude 
  int1=C0check(mF12, mS22, mV12)
  PVOddvvVRR=PVOddvvVRR+chargefactor*coup1R*coup2L*coup3*coup4R*IMP2*int1*mF1
  PVOddvvVLL=PVOddvvVLL+chargefactor*coup1L*coup2R*coup3*coup4L*IMP2*int1*mF1
  PVOddvvVRL=PVOddvvVRL+chargefactor*coup1R*coup2L*coup3*coup4L*IMP2*int1*mF1
  PVOddvvVLR=PVOddvvVLR+chargefactor*coup1L*coup2R*coup3*coup4R*IMP2*int1*mF1
  End if 
End if 
    End Do 


 ! Propagator: VZ, Loop particles: bar[Fu],conj[Hp],conj[VWp]
! Generic diagram: FSV,  InsertionOrder: 1
chargefactor = 1 
Do i1=1,3
If ((MFu2(i1).gt.mf_l2(3)).Or.(MHp2.gt.mf_l2(3)).Or.(MVWp2.gt.mf_l2(3))) Then
If (((i1.lt.4)).or.(.not.OnlySM)) Then 
coup1L = cplcFuFdHpL(i1,gt1)
coup1R = cplcFuFdHpR(i1,gt1)
coup2L = cplcFdFucVWpL(gt2,i1)
coup2R = cplcFdFucVWpR(gt2,i1)
coup3 = cplcHpVWpVZ
coup4L = cplcFvFvVZL(gt4,gt3)
coup4R = cplcFvFvVZR(gt4,gt3)
! Masses in loop
mF1 = MFu(i1)
mF12 = MFu2(i1)
mS1 = MHp
mS12 = MHp2
mV2 = MVWp
mV22 = MVWp2
! Propagator and inverse propagator mass 
MP = MVZ
MP2 = MVZ2
IMP = 1._dp/MP  
IMP2 = 1._dp/MP2 
! Amplitude 
  int1=C0check(mF12, mV22, mS12)
  PVOddvvVRR=PVOddvvVRR+chargefactor*coup1R*coup2R*coup3*coup4R*IMP2*int1*mF1
  PVOddvvVLL=PVOddvvVLL+chargefactor*coup1L*coup2L*coup3*coup4L*IMP2*int1*mF1
  PVOddvvVRL=PVOddvvVRL+chargefactor*coup1R*coup2R*coup3*coup4L*IMP2*int1*mF1
  PVOddvvVLR=PVOddvvVLR+chargefactor*coup1L*coup2L*coup3*coup4R*IMP2*int1*mF1
  End if 
End if 
    End Do 


 ! Propagator: VZ, Loop particles: bar[Fu],conj[VWp],conj[VWp]
! Generic diagram: FVV,  InsertionOrder: 1
chargefactor = 1 
Do i1=1,3
If ((MFu2(i1).gt.mf_l2(3)).Or.(MVWp2.gt.mf_l2(3)).Or.(MVWp2.gt.mf_l2(3))) Then
If (((i1.lt.4)).or.(.not.OnlySM)) Then 
coup1L = cplcFuFdVWpL(i1,gt1)
coup1R = cplcFuFdVWpR(i1,gt1)
coup2L = cplcFdFucVWpL(gt2,i1)
coup2R = cplcFdFucVWpR(gt2,i1)
coup3 = cplcVWpVWpVZ
coup4L = cplcFvFvVZL(gt4,gt3)
coup4R = cplcFvFvVZR(gt4,gt3)
! Masses in loop
mF1 = MFu(i1)
mF12 = MFu2(i1)
mV1 = MVWp
mV12 = MVWp2
mV2 = MVWp
mV22 = MVWp2
! Propagator and inverse propagator mass 
MP = MVZ
MP2 = MVZ2
IMP = 1._dp/MP  
IMP2 = 1._dp/MP2 
! Amplitude 
  int1=B0(0._dp, mV12, mV22)
  int2=C00_3m(mF12, mV22, mV12)
  int3=C0check(mF12, mV22, mV12)
  PVOddvvVRR=PVOddvvVRR+chargefactor*coup1R*coup2R*coup3*coup4R*IMP2*(-               & 
& 1.*Finite + 2.*(int1 + 2.*int2 + int3*mF12))
  PVOddvvVLL=PVOddvvVLL+chargefactor*coup1L*coup2L*coup3*coup4L*IMP2*(-               & 
& 1.*Finite + 2.*(int1 + 2.*int2 + int3*mF12))
  PVOddvvVRL=PVOddvvVRL+chargefactor*coup1R*coup2R*coup3*coup4L*IMP2*(-               & 
& 1.*Finite + 2.*(int1 + 2.*int2 + int3*mF12))
  PVOddvvVLR=PVOddvvVLR+chargefactor*coup1L*coup2L*coup3*coup4R*IMP2*(-               & 
& 1.*Finite + 2.*(int1 + 2.*int2 + int3*mF12))
  End if 
End if 
    End Do 


 ! Propagator: VZ, Loop particles: bar[Fe],Hp,Hp
! Generic diagram: FSS,  InsertionOrder: 4
chargefactor = 1 
Do i1=1,3
If ((MFe2(i1).gt.mf_l2(3)).Or.(MHp2.gt.mf_l2(3)).Or.(MHp2.gt.mf_l2(3))) Then
If (((i1.lt.4)).or.(.not.OnlySM)) Then 
coup1L = cplcFeFvcHpL(i1,gt3)
coup1R = cplcFeFvcHpR(i1,gt3)
coup2L = cplcFvFeHpL(gt4,i1)
coup2R = cplcFvFeHpR(gt4,i1)
coup3 = -cplHpcHpVZ
coup4L = cplcFdFdVZL(gt2,gt1)
coup4R = cplcFdFdVZR(gt2,gt1)
! Masses in loop
mF1 = MFe(i1)
mF12 = MFe2(i1)
mS1 = MHp
mS12 = MHp2
mS2 = MHp
mS22 = MHp2
! Propagator and inverse propagator mass 
MP = MVZ
MP2 = MVZ2
IMP = 1._dp/MP  
IMP2 = 1._dp/MP2 
! Amplitude 
  int1=C00_3m(mF12, mS12, mS22)
  PVOddvvVRR=PVOddvvVRR+2.*chargefactor*coup1R*coup2L*coup3*coup4R*IMP2*int1
  PVOddvvVLL=PVOddvvVLL+2.*chargefactor*coup1L*coup2R*coup3*coup4L*IMP2*int1
  PVOddvvVRL=PVOddvvVRL+2.*chargefactor*coup1L*coup2R*coup3*coup4R*IMP2*int1
  PVOddvvVLR=PVOddvvVLR+2.*chargefactor*coup1R*coup2L*coup3*coup4L*IMP2*int1
  End if 
End if 
    End Do 


 ! Propagator: VZ, Loop particles: bar[Fe],VWp,Hp
! Generic diagram: FVS,  InsertionOrder: 4
chargefactor = 1 
Do i1=1,3
If ((MFe2(i1).gt.mf_l2(3)).Or.(MVWp2.gt.mf_l2(3)).Or.(MHp2.gt.mf_l2(3))) Then
If (((i1.lt.4)).or.(.not.OnlySM)) Then 
coup1L = cplcFeFvcVWpL(i1,gt3)
coup1R = cplcFeFvcVWpR(i1,gt3)
coup2L = cplcFvFeHpL(gt4,i1)
coup2R = cplcFvFeHpR(gt4,i1)
coup3 = cplcHpVWpVZ
coup4L = cplcFdFdVZL(gt2,gt1)
coup4R = cplcFdFdVZR(gt2,gt1)
! Masses in loop
mF1 = MFe(i1)
mF12 = MFe2(i1)
mV1 = MVWp
mV12 = MVWp2
mS2 = MHp
mS22 = MHp2
! Propagator and inverse propagator mass 
MP = MVZ
MP2 = MVZ2
IMP = 1._dp/MP  
IMP2 = 1._dp/MP2 
! Amplitude 
  int1=C0check(mF12, mV12, mS22)
  PVOddvvVRR=PVOddvvVRR+chargefactor*coup1R*coup2L*coup3*coup4R*IMP2*int1*mF1
  PVOddvvVLL=PVOddvvVLL+chargefactor*coup1L*coup2R*coup3*coup4L*IMP2*int1*mF1
  PVOddvvVRL=PVOddvvVRL+chargefactor*coup1L*coup2R*coup3*coup4R*IMP2*int1*mF1
  PVOddvvVLR=PVOddvvVLR+chargefactor*coup1R*coup2L*coup3*coup4L*IMP2*int1*mF1
  End if 
End if 
    End Do 


 ! Propagator: VZ, Loop particles: bar[Fe],Hp,VWp
! Generic diagram: FSV,  InsertionOrder: 4
chargefactor = 1 
Do i1=1,3
If ((MFe2(i1).gt.mf_l2(3)).Or.(MHp2.gt.mf_l2(3)).Or.(MVWp2.gt.mf_l2(3))) Then
If (((i1.lt.4)).or.(.not.OnlySM)) Then 
coup1L = cplcFeFvcHpL(i1,gt3)
coup1R = cplcFeFvcHpR(i1,gt3)
coup2L = cplcFvFeVWpL(gt4,i1)
coup2R = cplcFvFeVWpR(gt4,i1)
coup3 = cplHpcVWpVZ
coup4L = cplcFdFdVZL(gt2,gt1)
coup4R = cplcFdFdVZR(gt2,gt1)
! Masses in loop
mF1 = MFe(i1)
mF12 = MFe2(i1)
mS1 = MHp
mS12 = MHp2
mV2 = MVWp
mV22 = MVWp2
! Propagator and inverse propagator mass 
MP = MVZ
MP2 = MVZ2
IMP = 1._dp/MP  
IMP2 = 1._dp/MP2 
! Amplitude 
  int1=C0check(mF12, mS12, mV22)
  PVOddvvVRR=PVOddvvVRR+chargefactor*coup1R*coup2R*coup3*coup4R*IMP2*int1*mF1
  PVOddvvVLL=PVOddvvVLL+chargefactor*coup1L*coup2L*coup3*coup4L*IMP2*int1*mF1
  PVOddvvVRL=PVOddvvVRL+chargefactor*coup1L*coup2L*coup3*coup4R*IMP2*int1*mF1
  PVOddvvVLR=PVOddvvVLR+chargefactor*coup1R*coup2R*coup3*coup4L*IMP2*int1*mF1
  End if 
End if 
    End Do 


 ! Propagator: VZ, Loop particles: bar[Fe],VWp,VWp
! Generic diagram: FVV,  InsertionOrder: 4
chargefactor = 1 
Do i1=1,3
If ((MFe2(i1).gt.mf_l2(3)).Or.(MVWp2.gt.mf_l2(3)).Or.(MVWp2.gt.mf_l2(3))) Then
If (((i1.lt.4)).or.(.not.OnlySM)) Then 
coup1L = cplcFeFvcVWpL(i1,gt3)
coup1R = cplcFeFvcVWpR(i1,gt3)
coup2L = cplcFvFeVWpL(gt4,i1)
coup2R = cplcFvFeVWpR(gt4,i1)
coup3 = -cplcVWpVWpVZ
coup4L = cplcFdFdVZL(gt2,gt1)
coup4R = cplcFdFdVZR(gt2,gt1)
! Masses in loop
mF1 = MFe(i1)
mF12 = MFe2(i1)
mV1 = MVWp
mV12 = MVWp2
mV2 = MVWp
mV22 = MVWp2
! Propagator and inverse propagator mass 
MP = MVZ
MP2 = MVZ2
IMP = 1._dp/MP  
IMP2 = 1._dp/MP2 
! Amplitude 
  int1=B0(0._dp, mV12, mV22)
  int2=C00_3m(mF12, mV12, mV22)
  int3=C0check(mF12, mV12, mV22)
  PVOddvvVRR=PVOddvvVRR+chargefactor*coup1R*coup2R*coup3*coup4R*IMP2*(-               & 
& 1.*Finite + 2.*(int1 + 2.*int2 + int3*mF12))
  PVOddvvVLL=PVOddvvVLL+chargefactor*coup1L*coup2L*coup3*coup4L*IMP2*(-               & 
& 1.*Finite + 2.*(int1 + 2.*int2 + int3*mF12))
  PVOddvvVRL=PVOddvvVRL+chargefactor*coup1L*coup2L*coup3*coup4R*IMP2*(-               & 
& 1.*Finite + 2.*(int1 + 2.*int2 + int3*mF12))
  PVOddvvVLR=PVOddvvVLR+chargefactor*coup1R*coup2R*coup3*coup4L*IMP2*(-               & 
& 1.*Finite + 2.*(int1 + 2.*int2 + int3*mF12))
  End if 
End if 
    End Do 


 ! Propagator: VZ, Loop particles: conj[Hp],Fe,Fe
! Generic diagram: SFF,  InsertionOrder: 4
chargefactor = 1 
  Do i2=1,3
    Do i3=1,3
If ((MHp2.gt.mf_l2(3)).Or.(MFe2(i2).gt.mf_l2(3)).Or.(MFe2(i3).gt.mf_l2(3))) Then
If (((i2.lt.4).and.(i3.lt.4)).or.(.not.OnlySM)) Then 
coup1L = cplcFeFvcHpL(i2,gt3)
coup1R = cplcFeFvcHpR(i2,gt3)
coup2L = cplcFvFeHpL(gt4,i3)
coup2R = cplcFvFeHpR(gt4,i3)
coup3L = cplcFeFeVZL(i3,i2)
coup3R = cplcFeFeVZR(i3,i2)
coup4L = cplcFdFdVZL(gt2,gt1)
coup4R = cplcFdFdVZR(gt2,gt1)
! Masses in loop
mS1 = MHp
mS12 = MHp2
mF1 = MFe(i2)
mF12 = MFe2(i2)
mF2 = MFe(i3)
mF22 = MFe2(i3)
! Propagator and inverse propagator mass 
MP = MVZ
MP2 = MVZ2
IMP = 1._dp/MP  
IMP2 = 1._dp/MP2 
! Amplitude 
  int1=B0C0check(mF22, mF12, mS12)
  int2=C00_3m(mF22, mF12, mS12)
  int3=C0check(mF22, mF12, mS12)
  PVOddvvVRR=PVOddvvVRR+chargefactor*coup1R*coup2L*coup4R*IMP2*(coup3L*(int1 -        & 
&  2.*int2) - 1.*coup3R*int3*mF1*mF2)
  PVOddvvVLL=PVOddvvVLL+chargefactor*coup1L*coup2R*coup4L*IMP2*(coup3R*(int1 -        & 
&  2.*int2) - 1.*coup3L*int3*mF1*mF2)
  PVOddvvVRL=PVOddvvVRL+chargefactor*coup1L*coup2R*coup4R*IMP2*(coup3R*(int1 -        & 
&  2.*int2) - 1.*coup3L*int3*mF1*mF2)
  PVOddvvVLR=PVOddvvVLR+chargefactor*coup1R*coup2L*coup4L*IMP2*(coup3L*(int1 -        & 
&  2.*int2) - 1.*coup3R*int3*mF1*mF2)
  End if 
End if 
   End Do 
  End Do 


 ! Propagator: VZ, Loop particles: conj[VWp],Fe,Fe
! Generic diagram: VFF,  InsertionOrder: 4
chargefactor = 1 
  Do i2=1,3
    Do i3=1,3
If ((MVWp2.gt.mf_l2(3)).Or.(MFe2(i2).gt.mf_l2(3)).Or.(MFe2(i3).gt.mf_l2(3))) Then
If (((i2.lt.4).and.(i3.lt.4)).or.(.not.OnlySM)) Then 
coup1L = cplcFeFvcVWpL(i2,gt3)
coup1R = cplcFeFvcVWpR(i2,gt3)
coup2L = cplcFvFeVWpL(gt4,i3)
coup2R = cplcFvFeVWpR(gt4,i3)
coup3L = cplcFeFeVZL(i3,i2)
coup3R = cplcFeFeVZR(i3,i2)
coup4L = cplcFdFdVZL(gt2,gt1)
coup4R = cplcFdFdVZR(gt2,gt1)
! Masses in loop
mV1 = MVWp
mV12 = MVWp2
mF1 = MFe(i2)
mF12 = MFe2(i2)
mF2 = MFe(i3)
mF22 = MFe2(i3)
! Propagator and inverse propagator mass 
MP = MVZ
MP2 = MVZ2
IMP = 1._dp/MP  
IMP2 = 1._dp/MP2 
! Amplitude 
  int1=B0C0check(mF22, mF12, mV12)
  int2=C00_3m(mF22, mF12, mV12)
  int3=C0check(mF22, mF12, mV12)
  PVOddvvVRR=PVOddvvVRR - 1.*chargefactor*coup1R*coup2R*coup4R*IMP2*(coup3R*(Finite - & 
&  2.*int1 + 4.*int2) + 2.*coup3L*int3*mF1*mF2)
  PVOddvvVLL=PVOddvvVLL - 1.*chargefactor*coup1L*coup2L*coup4L*IMP2*(coup3L*(Finite - & 
&  2.*int1 + 4.*int2) + 2.*coup3R*int3*mF1*mF2)
  PVOddvvVRL=PVOddvvVRL - 1.*chargefactor*coup1L*coup2L*coup4R*IMP2*(coup3L*(Finite - & 
&  2.*int1 + 4.*int2) + 2.*coup3R*int3*mF1*mF2)
  PVOddvvVLR=PVOddvvVLR - 1.*chargefactor*coup1R*coup2R*coup4L*IMP2*(coup3R*(Finite - & 
&  2.*int1 + 4.*int2) + 2.*coup3L*int3*mF1*mF2)
  End if 
End if 
   End Do 
  End Do 


 PVOddvvVRR=oo16pi2*PVOddvvVRR
PVOddvvVLL=oo16pi2*PVOddvvVLL
PVOddvvVRL=oo16pi2*PVOddvvVRL
PVOddvvVLR=oo16pi2*PVOddvvVLR
Iname=Iname-1

End Subroutine CalculatePengV2d2nu 

Subroutine CalculateTreeS2d2nu(gt1,gt2,gt3,gt4,OnlySM,MAh,MAh2,MFd,MFd2,              & 
& MFe,MFe2,MFu,MFu2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,cplAhhhVZ,cplcFdFdAhL,         & 
& cplcFdFdAhR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZR,cplcFdFucHpL,              & 
& cplcFdFucHpR,cplcFdFucVWpL,cplcFdFucVWpR,cplcFeFeVZL,cplcFeFeVZR,cplcFeFvcHpL,         & 
& cplcFeFvcHpR,cplcFeFvcVWpL,cplcFeFvcVWpR,cplcFuFdHpL,cplcFuFdHpR,cplcFuFdVWpL,         & 
& cplcFuFdVWpR,cplcFuFuVZL,cplcFuFuVZR,cplcFvFeHpL,cplcFvFeHpR,cplcFvFeVWpL,             & 
& cplcFvFeVWpR,cplcFvFvVZL,cplcFvFvVZR,cplcHpVWpVZ,cplcVWpVWpVZ,cplhhVZVZ,               & 
& cplHpcHpVZ,cplHpcVWpVZ,TSOddvvVRR,TSOddvvVLL,TSOddvvVRL,TSOddvvVLR)

! ---------------------------------------------------------------- 
! Code based on automatically generated SARAH extensions by 'PreSARAH' 
! Expressions for amplitudes are obtained by FeynArts/FormCalc 
! Based on user input for process TreeS2d2nu 
! 'PreSARAH' output has been generated  at 19:21 on 4.3.2015 
! ---------------------------------------------------------------- 
 
Implicit None 
Real(dp),Intent(in) :: MAh,MAh2,MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),Mhh,Mhh2,MHp,MHp2,              & 
& MVWp,MVWp2,MVZ,MVZ2

Complex(dp),Intent(in) :: cplAhhhVZ,cplcFdFdAhL(3,3),cplcFdFdAhR(3,3),cplcFdFdhhL(3,3),cplcFdFdhhR(3,3),        & 
& cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),cplcFdFucHpL(3,3),cplcFdFucHpR(3,3),cplcFdFucVWpL(3,3),& 
& cplcFdFucVWpR(3,3),cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),cplcFeFvcHpL(3,3),cplcFeFvcHpR(3,3),& 
& cplcFeFvcVWpL(3,3),cplcFeFvcVWpR(3,3),cplcFuFdHpL(3,3),cplcFuFdHpR(3,3),               & 
& cplcFuFdVWpL(3,3),cplcFuFdVWpR(3,3),cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),cplcFvFeHpL(3,3),& 
& cplcFvFeHpR(3,3),cplcFvFeVWpL(3,3),cplcFvFeVWpR(3,3),cplcFvFvVZL(3,3),cplcFvFvVZR(3,3),& 
& cplcHpVWpVZ,cplcVWpVWpVZ,cplhhVZVZ,cplHpcHpVZ,cplHpcVWpVZ

Integer,Intent(in) :: gt1, gt2,gt3,gt4 
Logical, Intent(in) :: OnlySM 
Integer :: iprop, i1, i2, i3, i4 
Real(dp) :: MassEx1,MassEx2,MassEx3,MassEx4, MassEx12,MassEx22,MassEx32,MassEx42 
Complex(dp), Intent(out) :: TSOddvvVRR 
Complex(dp), Intent(out) :: TSOddvvVLL 
Complex(dp), Intent(out) :: TSOddvvVRL 
Complex(dp), Intent(out) :: TSOddvvVLR 
Complex(dp) :: vertex1L, vertex1R, vertex2L, vertex2R 
Real(dp) ::  MP, MP2, IMP2, IMP, MFin, MFin2, IMFin, IMFin2, Finite  
Real(dp) ::  MS1, MS12, MS2, MS22, MF1, MF12, MF2, MF22, MV1, MV12, MV2, MV22  
Complex(dp) ::  chargefactor  
Complex(dp) ::  coup1L, coup1R, coup2L, coup2R, coup3L, coup3R, coup3, coup4L, coup4R 

Complex(dp) ::  int1,int2,int3,int4,int5,int6,int7,int8 

Iname=Iname+1 
NameOfUnit(Iname)='CalculateTreeS2d2nu' 

Finite=1._dp 
MassEx1=MFd(gt1)  
MassEx12=MFd2(gt1) 
MassEx2=MFd(gt2)  
MassEx22=MFd2(gt2) 
MassEx3=0._dp  
MassEx32=0._dp 
MassEx4=0._dp  
MassEx42=0._dp 
! ------------------------------ 
 ! Amplitudes for external states 
 ! {DownQuark, bar[DownQuark], Neutrino, bar[Neutrino]} 
 ! ------------------------------ 
 
TSOddvvVRR=0._dp 
TSOddvvVLL=0._dp 
TSOddvvVRL=0._dp 
TSOddvvVLR=0._dp 
Iname=Iname-1

End Subroutine CalculateTreeS2d2nu 

Subroutine CalculateTreeV2d2nu(gt1,gt2,gt3,gt4,OnlySM,MAh,MAh2,MFd,MFd2,              & 
& MFe,MFe2,MFu,MFu2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,cplAhhhVZ,cplcFdFdAhL,         & 
& cplcFdFdAhR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZR,cplcFdFucHpL,              & 
& cplcFdFucHpR,cplcFdFucVWpL,cplcFdFucVWpR,cplcFeFeVZL,cplcFeFeVZR,cplcFeFvcHpL,         & 
& cplcFeFvcHpR,cplcFeFvcVWpL,cplcFeFvcVWpR,cplcFuFdHpL,cplcFuFdHpR,cplcFuFdVWpL,         & 
& cplcFuFdVWpR,cplcFuFuVZL,cplcFuFuVZR,cplcFvFeHpL,cplcFvFeHpR,cplcFvFeVWpL,             & 
& cplcFvFeVWpR,cplcFvFvVZL,cplcFvFvVZR,cplcHpVWpVZ,cplcVWpVWpVZ,cplhhVZVZ,               & 
& cplHpcHpVZ,cplHpcVWpVZ,TVOddvvVRR,TVOddvvVLL,TVOddvvVRL,TVOddvvVLR)

! ---------------------------------------------------------------- 
! Code based on automatically generated SARAH extensions by 'PreSARAH' 
! Expressions for amplitudes are obtained by FeynArts/FormCalc 
! Based on user input for process TreeV2d2nu 
! 'PreSARAH' output has been generated  at 19:21 on 4.3.2015 
! ---------------------------------------------------------------- 
 
Implicit None 
Real(dp),Intent(in) :: MAh,MAh2,MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),Mhh,Mhh2,MHp,MHp2,              & 
& MVWp,MVWp2,MVZ,MVZ2

Complex(dp),Intent(in) :: cplAhhhVZ,cplcFdFdAhL(3,3),cplcFdFdAhR(3,3),cplcFdFdhhL(3,3),cplcFdFdhhR(3,3),        & 
& cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),cplcFdFucHpL(3,3),cplcFdFucHpR(3,3),cplcFdFucVWpL(3,3),& 
& cplcFdFucVWpR(3,3),cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),cplcFeFvcHpL(3,3),cplcFeFvcHpR(3,3),& 
& cplcFeFvcVWpL(3,3),cplcFeFvcVWpR(3,3),cplcFuFdHpL(3,3),cplcFuFdHpR(3,3),               & 
& cplcFuFdVWpL(3,3),cplcFuFdVWpR(3,3),cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),cplcFvFeHpL(3,3),& 
& cplcFvFeHpR(3,3),cplcFvFeVWpL(3,3),cplcFvFeVWpR(3,3),cplcFvFvVZL(3,3),cplcFvFvVZR(3,3),& 
& cplcHpVWpVZ,cplcVWpVWpVZ,cplhhVZVZ,cplHpcHpVZ,cplHpcVWpVZ

Integer,Intent(in) :: gt1, gt2,gt3,gt4 
Logical, Intent(in) :: OnlySM 
Integer :: iprop, i1, i2, i3, i4 
Real(dp) :: MassEx1,MassEx2,MassEx3,MassEx4, MassEx12,MassEx22,MassEx32,MassEx42 
Complex(dp), Intent(out) :: TVOddvvVRR 
Complex(dp), Intent(out) :: TVOddvvVLL 
Complex(dp), Intent(out) :: TVOddvvVRL 
Complex(dp), Intent(out) :: TVOddvvVLR 
Complex(dp) :: vertex1L, vertex1R, vertex2L, vertex2R 
Real(dp) ::  MP, MP2, IMP2, IMP, MFin, MFin2, IMFin, IMFin2, Finite  
Real(dp) ::  MS1, MS12, MS2, MS22, MF1, MF12, MF2, MF22, MV1, MV12, MV2, MV22  
Complex(dp) ::  chargefactor  
Complex(dp) ::  coup1L, coup1R, coup2L, coup2R, coup3L, coup3R, coup3, coup4L, coup4R 

Complex(dp) ::  int1,int2,int3,int4,int5,int6,int7,int8 

Iname=Iname+1 
NameOfUnit(Iname)='CalculateTreeV2d2nu' 

Finite=1._dp 
MassEx1=MFd(gt1)  
MassEx12=MFd2(gt1) 
MassEx2=MFd(gt2)  
MassEx22=MFd2(gt2) 
MassEx3=0._dp  
MassEx32=0._dp 
MassEx4=0._dp  
MassEx42=0._dp 
! ------------------------------ 
 ! Amplitudes for external states 
 ! {DownQuark, bar[DownQuark], Neutrino, bar[Neutrino]} 
 ! ------------------------------ 
 
TVOddvvVRR=0._dp 
TVOddvvVLL=0._dp 
TVOddvvVRL=0._dp 
TVOddvvVLR=0._dp 
!---------------------------------------- 
! Vector Tree Contributions            
!---------------------------------------- 
! -- VZ - Tree            
! Propagator: VZ
! InsertionOrder: 1
chargefactor = 1 
If ((OnlySM).or.(.not.OnlySM)) Then 
coup1L = cplcFdFdVZL(gt2,gt1)
coup1R = cplcFdFdVZR(gt2,gt1)
coup2L = cplcFvFvVZL(gt4,gt3)
coup2R = cplcFvFvVZR(gt4,gt3)
! Propagator and inverse propagator mass 
MP = MVZ
MP2 = MVZ2
IMP = 1._dp/MP  
IMP2 = 1._dp/MP2 
! Amplitude 
  TVOddvvVRR=TVOddvvVRR-1*coup1R*coup2R*IMP2
  TVOddvvVLL=TVOddvvVLL-1*coup1L*coup2L*IMP2
  TVOddvvVRL=TVOddvvVRL-1*coup1R*coup2L*IMP2
  TVOddvvVLR=TVOddvvVLR-1*coup1L*coup2R*IMP2
 End if 


 Iname=Iname-1

End Subroutine CalculateTreeV2d2nu 

Subroutine CalculateBox4d(gt1,gt2,gt3,gt4,OnlySM,MAh,MAh2,MFd,MFd2,MFu,               & 
& MFu2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,cplAhAhhh,cplAhcHpVWp,cplAhhhVZ,            & 
& cplAhHpcVWp,cplcFdFdAhL,cplcFdFdAhR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVGL,               & 
& cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,cplcFdFucHpL,              & 
& cplcFdFucHpR,cplcFdFucVWpL,cplcFdFucVWpR,cplcFuFdHpL,cplcFuFdHpR,cplcFuFdVWpL,         & 
& cplcFuFdVWpR,cplcFuFuAhL,cplcFuFuAhR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVGL,              & 
& cplcFuFuVGR,cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZL,cplcFuFuVZR,cplcHpVPVWp,               & 
& cplcHpVWpVZ,cplcVWpVPVWp,cplcVWpVWpVZ,cplhhcHpVWp,cplhhcVWpVWp,cplhhhhhh,              & 
& cplhhHpcHp,cplhhHpcVWp,cplhhVZVZ,cplHpcHpVP,cplHpcHpVZ,cplHpcVWpVP,cplHpcVWpVZ,        & 
& BO4dSLL,BO4dSRR,BO4dSRL,BO4dSLR,BO4dVRR,BO4dVLL,BO4dVRL,BO4dVLR,BO4dTLL,               & 
& BO4dTLR,BO4dTRL,BO4dTRR)

! ---------------------------------------------------------------- 
! Code based on automatically generated SARAH extensions by 'PreSARAH' 
! Expressions for amplitudes are obtained by FeynArts/FormCalc 
! Based on user input for process Box4d 
! 'PreSARAH' output has been generated  at 11:39 on 10.6.2016 
! ---------------------------------------------------------------- 
 
Implicit None 
Real(dp),Intent(in) :: MAh,MAh2,MFd(3),MFd2(3),MFu(3),MFu2(3),Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2

Complex(dp),Intent(in) :: cplAhAhhh,cplAhcHpVWp,cplAhhhVZ,cplAhHpcVWp,cplcFdFdAhL(3,3),cplcFdFdAhR(3,3),        & 
& cplcFdFdhhL(3,3),cplcFdFdhhR(3,3),cplcFdFdVGL(3,3),cplcFdFdVGR(3,3),cplcFdFdVPL(3,3),  & 
& cplcFdFdVPR(3,3),cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),cplcFdFucHpL(3,3),cplcFdFucHpR(3,3),& 
& cplcFdFucVWpL(3,3),cplcFdFucVWpR(3,3),cplcFuFdHpL(3,3),cplcFuFdHpR(3,3),               & 
& cplcFuFdVWpL(3,3),cplcFuFdVWpR(3,3),cplcFuFuAhL(3,3),cplcFuFuAhR(3,3),cplcFuFuhhL(3,3),& 
& cplcFuFuhhR(3,3),cplcFuFuVGL(3,3),cplcFuFuVGR(3,3),cplcFuFuVPL(3,3),cplcFuFuVPR(3,3),  & 
& cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),cplcHpVPVWp,cplcHpVWpVZ,cplcVWpVPVWp,cplcVWpVWpVZ,   & 
& cplhhcHpVWp,cplhhcVWpVWp,cplhhhhhh,cplhhHpcHp,cplhhHpcVWp,cplhhVZVZ,cplHpcHpVP,        & 
& cplHpcHpVZ,cplHpcVWpVP,cplHpcVWpVZ

Integer,Intent(in) :: gt1, gt2,gt3,gt4 
Logical, Intent(in) :: OnlySM 
Integer :: iprop, i1, i2, i3, i4 
Real(dp) :: MassEx1,MassEx2,MassEx3,MassEx4, MassEx12,MassEx22,MassEx32,MassEx42 
Complex(dp), Intent(out) :: BO4dSLL 
Complex(dp), Intent(out) :: BO4dSRR 
Complex(dp), Intent(out) :: BO4dSRL 
Complex(dp), Intent(out) :: BO4dSLR 
Complex(dp), Intent(out) :: BO4dVRR 
Complex(dp), Intent(out) :: BO4dVLL 
Complex(dp), Intent(out) :: BO4dVRL 
Complex(dp), Intent(out) :: BO4dVLR 
Complex(dp), Intent(out) :: BO4dTLL 
Complex(dp), Intent(out) :: BO4dTLR 
Complex(dp), Intent(out) :: BO4dTRL 
Complex(dp), Intent(out) :: BO4dTRR 
Complex(dp) :: vertex1L, vertex1R, vertex2L, vertex2R 
Real(dp) ::  MP, MP2, IMP2, IMP, MFin, MFin2, IMFin, IMFin2, Finite  
Real(dp) ::  MS1, MS12, MS2, MS22, MF1, MF12, MF2, MF22, MV1, MV12, MV2, MV22  
Complex(dp) ::  chargefactor  
Complex(dp) ::  coup1L, coup1R, coup2L, coup2R, coup3L, coup3R, coup3, coup4L, coup4R 

Complex(dp) ::  int1,int2,int3,int4,int5,int6,int7,int8 

Iname=Iname+1 
NameOfUnit(Iname)='CalculateBox4d' 

Finite=1._dp 
MassEx1=MFd(gt1)  
MassEx12=MFd2(gt1) 
MassEx2=MFd(gt2)  
MassEx22=MFd2(gt2) 
MassEx3=MFd(gt3)  
MassEx32=MFd2(gt3) 
MassEx4=MFd(gt4)  
MassEx42=MFd2(gt4) 
! ------------------------------ 
 ! Amplitudes for external states 
 ! {DownQuark, bar[DownQuark], DownQuark, bar[DownQuark]} 
 ! ------------------------------ 
 
BO4dSLL=0._dp 
BO4dSRR=0._dp 
BO4dSRL=0._dp 
BO4dSLR=0._dp 
BO4dVRR=0._dp 
BO4dVLL=0._dp 
BO4dVRL=0._dp 
BO4dVLR=0._dp 
BO4dTLL=0._dp 
BO4dTLR=0._dp 
BO4dTRL=0._dp 
BO4dTRR=0._dp 
!----------------------------- 
! Box Contributions            
!----------------------------- 
! Fd,Ah,bar[Fd],Ah
chargefactor = 1 
! Generic diagram: FSSF,  InsertionOrder: 1
Do i1=1,3
    Do i3=1,3
If ((MFd2(i1).gt.mf_l2(3)).Or.(MAh2.gt.mf_l2(3)).Or.(MFd2(i3).gt.mf_l2(3)).Or.(MAh2.gt.mf_l2(3))) Then
If (((i1.lt.4).and.(i3.lt.4)).or.(.not.OnlySM)) Then 
coup1L = cplcFdFdAhL(i1,gt1)
coup1R = cplcFdFdAhR(i1,gt1)
coup2L = cplcFdFdAhL(gt2,i1)
coup2R = cplcFdFdAhR(gt2,i1)
coup3L = cplcFdFdAhL(i3,gt3)
coup3R = cplcFdFdAhR(i3,gt3)
coup4L = cplcFdFdAhL(gt4,i3)
coup4R = cplcFdFdAhR(gt4,i3)
mF1 = MFd(i1)
mF12 = MFd2(i1)
mS1 = MAh
mS12 = MAh2
mF2 = MFd(i3)
mF22 = MFd2(i3)
mS2 = MAh
mS22 = MAh2
  int1=D00check(mF12, mF22, mS22, mS12)
  int2=MMD0(mF1, mF2, mF12, mF22, mS22, mS12)
  BO4dSLL=BO4dSLL - 1.*chargefactor*coup1L*coup2L*coup3L*coup4L*int2
  BO4dSRR=BO4dSRR - 1.*chargefactor*coup1R*coup2R*coup3R*coup4R*int2
  BO4dSRL=BO4dSRL - 1.*chargefactor*coup1R*coup2R*coup3L*coup4L*int2
  BO4dSLR=BO4dSLR - 1.*chargefactor*coup1L*coup2L*coup3R*coup4R*int2
  BO4dVRR=BO4dVRR+chargefactor*coup1R*coup2L*coup3R*coup4L*int1
  BO4dVLL=BO4dVLL+chargefactor*coup1L*coup2R*coup3L*coup4R*int1
  BO4dVRL=BO4dVRL+chargefactor*coup1R*coup2L*coup3L*coup4R*int1
  BO4dVLR=BO4dVLR+chargefactor*coup1L*coup2R*coup3R*coup4L*int1
  BO4dTLL=BO4dTLL+0.
  BO4dTLR=BO4dTLR+0.
  BO4dTRL=BO4dTRL+0.
  BO4dTRR=BO4dTRR+0.
  End if 
End if 
    End Do 
  End Do 


 ! Fd,hh,bar[Fd],Ah
chargefactor = 1 
! Generic diagram: FSSF,  InsertionOrder: 1
Do i1=1,3
    Do i3=1,3
If ((MFd2(i1).gt.mf_l2(3)).Or.(Mhh2.gt.mf_l2(3)).Or.(MFd2(i3).gt.mf_l2(3)).Or.(MAh2.gt.mf_l2(3))) Then
If (.not.OnlySM) Then 
coup1L = cplcFdFdAhL(i1,gt1)
coup1R = cplcFdFdAhR(i1,gt1)
coup2L = cplcFdFdhhL(gt2,i1)
coup2R = cplcFdFdhhR(gt2,i1)
coup3L = cplcFdFdAhL(i3,gt3)
coup3R = cplcFdFdAhR(i3,gt3)
coup4L = cplcFdFdhhL(gt4,i3)
coup4R = cplcFdFdhhR(gt4,i3)
mF1 = MFd(i1)
mF12 = MFd2(i1)
mS1 = MAh
mS12 = MAh2
mF2 = MFd(i3)
mF22 = MFd2(i3)
mS2 = Mhh
mS22 = Mhh2
  int1=D00check(mF12, mF22, mS22, mS12)
  int2=MMD0(mF1, mF2, mF12, mF22, mS22, mS12)
  BO4dSLL=BO4dSLL - 1.*chargefactor*coup1L*coup2L*coup3L*coup4L*int2
  BO4dSRR=BO4dSRR - 1.*chargefactor*coup1R*coup2R*coup3R*coup4R*int2
  BO4dSRL=BO4dSRL - 1.*chargefactor*coup1R*coup2R*coup3L*coup4L*int2
  BO4dSLR=BO4dSLR - 1.*chargefactor*coup1L*coup2L*coup3R*coup4R*int2
  BO4dVRR=BO4dVRR+chargefactor*coup1R*coup2L*coup3R*coup4L*int1
  BO4dVLL=BO4dVLL+chargefactor*coup1L*coup2R*coup3L*coup4R*int1
  BO4dVRL=BO4dVRL+chargefactor*coup1R*coup2L*coup3L*coup4R*int1
  BO4dVLR=BO4dVLR+chargefactor*coup1L*coup2R*coup3R*coup4L*int1
  BO4dTLL=BO4dTLL+0.
  BO4dTLR=BO4dTLR+0.
  BO4dTRL=BO4dTRL+0.
  BO4dTRR=BO4dTRR+0.
  End if 
End if 
    End Do 
  End Do 


 ! Fd,VZ,bar[Fd],Ah
chargefactor = 1 
! Generic diagram: FSVF,  InsertionOrder: 1
Do i1=1,3
    Do i3=1,3
If ((MFd2(i1).gt.mf_l2(3)).Or.(MVZ2.gt.mf_l2(3)).Or.(MFd2(i3).gt.mf_l2(3)).Or.(MAh2.gt.mf_l2(3))) Then
If (((i1.lt.4).and.(i3.lt.4)).or.(.not.OnlySM)) Then 
coup1L = cplcFdFdAhL(i1,gt1)
coup1R = cplcFdFdAhR(i1,gt1)
coup2L = cplcFdFdVZL(gt2,i1)
coup2R = cplcFdFdVZR(gt2,i1)
coup3L = cplcFdFdAhL(i3,gt3)
coup3R = cplcFdFdAhR(i3,gt3)
coup4L = cplcFdFdVZL(gt4,i3)
coup4R = cplcFdFdVZR(gt4,i3)
mF1 = MFd(i1)
mF12 = MFd2(i1)
mS1 = MAh
mS12 = MAh2
mF2 = MFd(i3)
mF22 = MFd2(i3)
mV2 = MVZ
mV22 = MVZ2
  int1=D00check(mF12, mF22, mV22, mS12)
  int2=MMD0(mF1, mF2, mF12, mF22, mV22, mS12)
  BO4dSLL=BO4dSLL - 4.*chargefactor*coup1L*coup2R*coup3L*coup4R*int1
  BO4dSRR=BO4dSRR - 4.*chargefactor*coup1R*coup2L*coup3R*coup4L*int1
  BO4dSRL=BO4dSRL - 4.*chargefactor*coup1R*coup2L*coup3L*coup4R*int1
  BO4dSLR=BO4dSLR - 4.*chargefactor*coup1L*coup2R*coup3R*coup4L*int1
  BO4dVRR=BO4dVRR+chargefactor*coup1R*coup2R*coup3R*coup4R*int2
  BO4dVLL=BO4dVLL+chargefactor*coup1L*coup2L*coup3L*coup4L*int2
  BO4dVRL=BO4dVRL+chargefactor*coup1R*coup2R*coup3L*coup4L*int2
  BO4dVLR=BO4dVLR+chargefactor*coup1L*coup2L*coup3R*coup4R*int2
  BO4dTLL=BO4dTLL - 1.*chargefactor*coup1L*coup2R*coup3L*coup4R*int1
  BO4dTLR=BO4dTLR+0.
  BO4dTRL=BO4dTRL+0.
  BO4dTRR=BO4dTRR - 1.*chargefactor*coup1R*coup2L*coup3R*coup4L*int1
  End if 
End if 
    End Do 
  End Do 


 ! Fd,Ah,bar[Fd],hh
chargefactor = 1 
! Generic diagram: FSSF,  InsertionOrder: 1
Do i1=1,3
    Do i3=1,3
If ((MFd2(i1).gt.mf_l2(3)).Or.(MAh2.gt.mf_l2(3)).Or.(MFd2(i3).gt.mf_l2(3)).Or.(Mhh2.gt.mf_l2(3))) Then
If (.not.OnlySM) Then 
coup1L = cplcFdFdhhL(i1,gt1)
coup1R = cplcFdFdhhR(i1,gt1)
coup2L = cplcFdFdAhL(gt2,i1)
coup2R = cplcFdFdAhR(gt2,i1)
coup3L = cplcFdFdhhL(i3,gt3)
coup3R = cplcFdFdhhR(i3,gt3)
coup4L = cplcFdFdAhL(gt4,i3)
coup4R = cplcFdFdAhR(gt4,i3)
mF1 = MFd(i1)
mF12 = MFd2(i1)
mS1 = Mhh
mS12 = Mhh2
mF2 = MFd(i3)
mF22 = MFd2(i3)
mS2 = MAh
mS22 = MAh2
  int1=D00check(mF12, mF22, mS22, mS12)
  int2=MMD0(mF1, mF2, mF12, mF22, mS22, mS12)
  BO4dSLL=BO4dSLL - 1.*chargefactor*coup1L*coup2L*coup3L*coup4L*int2
  BO4dSRR=BO4dSRR - 1.*chargefactor*coup1R*coup2R*coup3R*coup4R*int2
  BO4dSRL=BO4dSRL - 1.*chargefactor*coup1R*coup2R*coup3L*coup4L*int2
  BO4dSLR=BO4dSLR - 1.*chargefactor*coup1L*coup2L*coup3R*coup4R*int2
  BO4dVRR=BO4dVRR+chargefactor*coup1R*coup2L*coup3R*coup4L*int1
  BO4dVLL=BO4dVLL+chargefactor*coup1L*coup2R*coup3L*coup4R*int1
  BO4dVRL=BO4dVRL+chargefactor*coup1R*coup2L*coup3L*coup4R*int1
  BO4dVLR=BO4dVLR+chargefactor*coup1L*coup2R*coup3R*coup4L*int1
  BO4dTLL=BO4dTLL+0.
  BO4dTLR=BO4dTLR+0.
  BO4dTRL=BO4dTRL+0.
  BO4dTRR=BO4dTRR+0.
  End if 
End if 
    End Do 
  End Do 


 ! Fd,hh,bar[Fd],hh
chargefactor = 1 
! Generic diagram: FSSF,  InsertionOrder: 1
Do i1=1,3
    Do i3=1,3
If ((MFd2(i1).gt.mf_l2(3)).Or.(Mhh2.gt.mf_l2(3)).Or.(MFd2(i3).gt.mf_l2(3)).Or.(Mhh2.gt.mf_l2(3))) Then
If (.not.OnlySM) Then 
coup1L = cplcFdFdhhL(i1,gt1)
coup1R = cplcFdFdhhR(i1,gt1)
coup2L = cplcFdFdhhL(gt2,i1)
coup2R = cplcFdFdhhR(gt2,i1)
coup3L = cplcFdFdhhL(i3,gt3)
coup3R = cplcFdFdhhR(i3,gt3)
coup4L = cplcFdFdhhL(gt4,i3)
coup4R = cplcFdFdhhR(gt4,i3)
mF1 = MFd(i1)
mF12 = MFd2(i1)
mS1 = Mhh
mS12 = Mhh2
mF2 = MFd(i3)
mF22 = MFd2(i3)
mS2 = Mhh
mS22 = Mhh2
  int1=D00check(mF12, mF22, mS22, mS12)
  int2=MMD0(mF1, mF2, mF12, mF22, mS22, mS12)
  BO4dSLL=BO4dSLL - 1.*chargefactor*coup1L*coup2L*coup3L*coup4L*int2
  BO4dSRR=BO4dSRR - 1.*chargefactor*coup1R*coup2R*coup3R*coup4R*int2
  BO4dSRL=BO4dSRL - 1.*chargefactor*coup1R*coup2R*coup3L*coup4L*int2
  BO4dSLR=BO4dSLR - 1.*chargefactor*coup1L*coup2L*coup3R*coup4R*int2
  BO4dVRR=BO4dVRR+chargefactor*coup1R*coup2L*coup3R*coup4L*int1
  BO4dVLL=BO4dVLL+chargefactor*coup1L*coup2R*coup3L*coup4R*int1
  BO4dVRL=BO4dVRL+chargefactor*coup1R*coup2L*coup3L*coup4R*int1
  BO4dVLR=BO4dVLR+chargefactor*coup1L*coup2R*coup3R*coup4L*int1
  BO4dTLL=BO4dTLL+0.
  BO4dTLR=BO4dTLR+0.
  BO4dTRL=BO4dTRL+0.
  BO4dTRR=BO4dTRR+0.
  End if 
End if 
    End Do 
  End Do 


 ! Fd,VZ,bar[Fd],hh
chargefactor = 1 
! Generic diagram: FSVF,  InsertionOrder: 1
Do i1=1,3
    Do i3=1,3
If ((MFd2(i1).gt.mf_l2(3)).Or.(MVZ2.gt.mf_l2(3)).Or.(MFd2(i3).gt.mf_l2(3)).Or.(Mhh2.gt.mf_l2(3))) Then
If (.not.OnlySM) Then 
coup1L = cplcFdFdhhL(i1,gt1)
coup1R = cplcFdFdhhR(i1,gt1)
coup2L = cplcFdFdVZL(gt2,i1)
coup2R = cplcFdFdVZR(gt2,i1)
coup3L = cplcFdFdhhL(i3,gt3)
coup3R = cplcFdFdhhR(i3,gt3)
coup4L = cplcFdFdVZL(gt4,i3)
coup4R = cplcFdFdVZR(gt4,i3)
mF1 = MFd(i1)
mF12 = MFd2(i1)
mS1 = Mhh
mS12 = Mhh2
mF2 = MFd(i3)
mF22 = MFd2(i3)
mV2 = MVZ
mV22 = MVZ2
  int1=D00check(mF12, mF22, mV22, mS12)
  int2=MMD0(mF1, mF2, mF12, mF22, mV22, mS12)
  BO4dSLL=BO4dSLL - 4.*chargefactor*coup1L*coup2R*coup3L*coup4R*int1
  BO4dSRR=BO4dSRR - 4.*chargefactor*coup1R*coup2L*coup3R*coup4L*int1
  BO4dSRL=BO4dSRL - 4.*chargefactor*coup1R*coup2L*coup3L*coup4R*int1
  BO4dSLR=BO4dSLR - 4.*chargefactor*coup1L*coup2R*coup3R*coup4L*int1
  BO4dVRR=BO4dVRR+chargefactor*coup1R*coup2R*coup3R*coup4R*int2
  BO4dVLL=BO4dVLL+chargefactor*coup1L*coup2L*coup3L*coup4L*int2
  BO4dVRL=BO4dVRL+chargefactor*coup1R*coup2R*coup3L*coup4L*int2
  BO4dVLR=BO4dVLR+chargefactor*coup1L*coup2L*coup3R*coup4R*int2
  BO4dTLL=BO4dTLL - 1.*chargefactor*coup1L*coup2R*coup3L*coup4R*int1
  BO4dTLR=BO4dTLR+0.
  BO4dTRL=BO4dTRL+0.
  BO4dTRR=BO4dTRR - 1.*chargefactor*coup1R*coup2L*coup3R*coup4L*int1
  End if 
End if 
    End Do 
  End Do 


 ! Fd,Ah,bar[Fd],VZ
chargefactor = 1 
! Generic diagram: FVSF,  InsertionOrder: 1
Do i1=1,3
    Do i3=1,3
If ((MFd2(i1).gt.mf_l2(3)).Or.(MAh2.gt.mf_l2(3)).Or.(MFd2(i3).gt.mf_l2(3)).Or.(MVZ2.gt.mf_l2(3))) Then
If (((i1.lt.4).and.(i3.lt.4)).or.(.not.OnlySM)) Then 
coup1L = cplcFdFdVZL(i1,gt1)
coup1R = cplcFdFdVZR(i1,gt1)
coup2L = cplcFdFdAhL(gt2,i1)
coup2R = cplcFdFdAhR(gt2,i1)
coup3L = cplcFdFdVZL(i3,gt3)
coup3R = cplcFdFdVZR(i3,gt3)
coup4L = cplcFdFdAhL(gt4,i3)
coup4R = cplcFdFdAhR(gt4,i3)
mF1 = MFd(i1)
mF12 = MFd2(i1)
mV1 = MVZ
mV12 = MVZ2
mF2 = MFd(i3)
mF22 = MFd2(i3)
mS2 = MAh
mS22 = MAh2
  int1=D00check(mF12, mF22, mS22, mV12)
  int2=MMD0(mF1, mF2, mF12, mF22, mS22, mV12)
  BO4dSLL=BO4dSLL - 4.*chargefactor*coup1L*coup2L*coup3L*coup4L*int1
  BO4dSRR=BO4dSRR - 4.*chargefactor*coup1R*coup2R*coup3R*coup4R*int1
  BO4dSRL=BO4dSRL - 4.*chargefactor*coup1R*coup2R*coup3L*coup4L*int1
  BO4dSLR=BO4dSLR - 4.*chargefactor*coup1L*coup2L*coup3R*coup4R*int1
  BO4dVRR=BO4dVRR+chargefactor*coup1R*coup2L*coup3R*coup4L*int2
  BO4dVLL=BO4dVLL+chargefactor*coup1L*coup2R*coup3L*coup4R*int2
  BO4dVRL=BO4dVRL+chargefactor*coup1R*coup2L*coup3L*coup4R*int2
  BO4dVLR=BO4dVLR+chargefactor*coup1L*coup2R*coup3R*coup4L*int2
  BO4dTLL=BO4dTLL - 1.*chargefactor*coup1L*coup2L*coup3L*coup4L*int1
  BO4dTLR=BO4dTLR+0.
  BO4dTRL=BO4dTRL+0.
  BO4dTRR=BO4dTRR - 1.*chargefactor*coup1R*coup2R*coup3R*coup4R*int1
  End if 
End if 
    End Do 
  End Do 


 ! Fd,hh,bar[Fd],VZ
chargefactor = 1 
! Generic diagram: FVSF,  InsertionOrder: 1
Do i1=1,3
    Do i3=1,3
If ((MFd2(i1).gt.mf_l2(3)).Or.(Mhh2.gt.mf_l2(3)).Or.(MFd2(i3).gt.mf_l2(3)).Or.(MVZ2.gt.mf_l2(3))) Then
If (.not.OnlySM) Then 
coup1L = cplcFdFdVZL(i1,gt1)
coup1R = cplcFdFdVZR(i1,gt1)
coup2L = cplcFdFdhhL(gt2,i1)
coup2R = cplcFdFdhhR(gt2,i1)
coup3L = cplcFdFdVZL(i3,gt3)
coup3R = cplcFdFdVZR(i3,gt3)
coup4L = cplcFdFdhhL(gt4,i3)
coup4R = cplcFdFdhhR(gt4,i3)
mF1 = MFd(i1)
mF12 = MFd2(i1)
mV1 = MVZ
mV12 = MVZ2
mF2 = MFd(i3)
mF22 = MFd2(i3)
mS2 = Mhh
mS22 = Mhh2
  int1=D00check(mF12, mF22, mS22, mV12)
  int2=MMD0(mF1, mF2, mF12, mF22, mS22, mV12)
  BO4dSLL=BO4dSLL - 4.*chargefactor*coup1L*coup2L*coup3L*coup4L*int1
  BO4dSRR=BO4dSRR - 4.*chargefactor*coup1R*coup2R*coup3R*coup4R*int1
  BO4dSRL=BO4dSRL - 4.*chargefactor*coup1R*coup2R*coup3L*coup4L*int1
  BO4dSLR=BO4dSLR - 4.*chargefactor*coup1L*coup2L*coup3R*coup4R*int1
  BO4dVRR=BO4dVRR+chargefactor*coup1R*coup2L*coup3R*coup4L*int2
  BO4dVLL=BO4dVLL+chargefactor*coup1L*coup2R*coup3L*coup4R*int2
  BO4dVRL=BO4dVRL+chargefactor*coup1R*coup2L*coup3L*coup4R*int2
  BO4dVLR=BO4dVLR+chargefactor*coup1L*coup2R*coup3R*coup4L*int2
  BO4dTLL=BO4dTLL - 1.*chargefactor*coup1L*coup2L*coup3L*coup4L*int1
  BO4dTLR=BO4dTLR+0.
  BO4dTRL=BO4dTRL+0.
  BO4dTRR=BO4dTRR - 1.*chargefactor*coup1R*coup2R*coup3R*coup4R*int1
  End if 
End if 
    End Do 
  End Do 


 ! Fd,VZ,bar[Fd],VZ
chargefactor = 1 
! Generic diagram: FVVF,  InsertionOrder: 1
Do i1=1,3
    Do i3=1,3
If ((MFd2(i1).gt.mf_l2(3)).Or.(MVZ2.gt.mf_l2(3)).Or.(MFd2(i3).gt.mf_l2(3)).Or.(MVZ2.gt.mf_l2(3))) Then
If (((i1.lt.4).and.(i3.lt.4)).or.(.not.OnlySM)) Then 
coup1L = cplcFdFdVZL(i1,gt1)
coup1R = cplcFdFdVZR(i1,gt1)
coup2L = cplcFdFdVZL(gt2,i1)
coup2R = cplcFdFdVZR(gt2,i1)
coup3L = cplcFdFdVZL(i3,gt3)
coup3R = cplcFdFdVZR(i3,gt3)
coup4L = cplcFdFdVZL(gt4,i3)
coup4R = cplcFdFdVZR(gt4,i3)
mF1 = MFd(i1)
mF12 = MFd2(i1)
mV1 = MVZ
mV12 = MVZ2
mF2 = MFd(i3)
mF22 = MFd2(i3)
mV2 = MVZ
mV22 = MVZ2
  int1=D00check(mF12, mF22, mV22, mV12)
  int2=MMD0(mF1, mF2, mF12, mF22, mV22, mV12)
  BO4dSLL=BO4dSLL - 4.*chargefactor*coup1L*coup2R*coup3L*coup4R*int2
  BO4dSRR=BO4dSRR - 4.*chargefactor*coup1R*coup2L*coup3R*coup4L*int2
  BO4dSRL=BO4dSRL - 4.*chargefactor*coup1R*coup2L*coup3L*coup4R*int2
  BO4dSLR=BO4dSLR - 4.*chargefactor*coup1L*coup2R*coup3R*coup4L*int2
  BO4dVRR=BO4dVRR+16.*chargefactor*coup1R*coup2R*coup3R*coup4R*int1
  BO4dVLL=BO4dVLL+16.*chargefactor*coup1L*coup2L*coup3L*coup4L*int1
  BO4dVRL=BO4dVRL+4.*chargefactor*coup1R*coup2R*coup3L*coup4L*int1
  BO4dVLR=BO4dVLR+4.*chargefactor*coup1L*coup2L*coup3R*coup4R*int1
  BO4dTLL=BO4dTLL - 1.*chargefactor*coup1L*coup2R*coup3L*coup4R*int2
  BO4dTLR=BO4dTLR+0.
  BO4dTRL=BO4dTRL+0.
  BO4dTRR=BO4dTRR - 1.*chargefactor*coup1R*coup2L*coup3R*coup4L*int2
  End if 
End if 
    End Do 
  End Do 


 ! Fd,Ah,Fd,Ah
chargefactor = 1 
! Generic diagram: FSSF,  InsertionOrder: 2
Do i1=1,3
    Do i3=1,3
If ((MFd2(i1).gt.mf_l2(3)).Or.(MAh2.gt.mf_l2(3)).Or.(MFd2(i3).gt.mf_l2(3)).Or.(MAh2.gt.mf_l2(3))) Then
If (((i1.lt.4).and.(i3.lt.4)).or.(.not.OnlySM)) Then 
coup1L = cplcFdFdAhL(i1,gt1)
coup1R = cplcFdFdAhR(i1,gt1)
coup2L = cplcFdFdAhL(gt2,i1)
coup2R = cplcFdFdAhR(gt2,i1)
coup3L = cplcFdFdAhL(gt4,i3)
coup3R = cplcFdFdAhR(gt4,i3)
coup4L = cplcFdFdAhL(i3,gt3)
coup4R = cplcFdFdAhR(i3,gt3)
mF1 = MFd(i1)
mF12 = MFd2(i1)
mS1 = MAh
mS12 = MAh2
mF2 = MFd(i3)
mF22 = MFd2(i3)
mS2 = MAh
mS22 = MAh2
  int1=D00check(mF12, mF22, mS22, mS12)
  int2=MMD0(mF1, mF2, mF12, mF22, mS22, mS12)
  BO4dSLL=BO4dSLL - 1.*chargefactor*coup1L*coup2L*coup3L*coup4L*int2
  BO4dSRR=BO4dSRR - 1.*chargefactor*coup1R*coup2R*coup3R*coup4R*int2
  BO4dSRL=BO4dSRL - 1.*chargefactor*coup1R*coup2R*coup3L*coup4L*int2
  BO4dSLR=BO4dSLR - 1.*chargefactor*coup1L*coup2L*coup3R*coup4R*int2
  BO4dVRR=BO4dVRR - 1.*chargefactor*coup1R*coup2L*coup3L*coup4R*int1
  BO4dVLL=BO4dVLL - 1.*chargefactor*coup1L*coup2R*coup3R*coup4L*int1
  BO4dVRL=BO4dVRL - 1.*chargefactor*coup1R*coup2L*coup3R*coup4L*int1
  BO4dVLR=BO4dVLR - 1.*chargefactor*coup1L*coup2R*coup3L*coup4R*int1
  BO4dTLL=BO4dTLL+0.
  BO4dTLR=BO4dTLR+0.
  BO4dTRL=BO4dTRL+0.
  BO4dTRR=BO4dTRR+0.
  End if 
End if 
    End Do 
  End Do 


 ! Fd,hh,Fd,Ah
chargefactor = 1 
! Generic diagram: FSSF,  InsertionOrder: 2
Do i1=1,3
    Do i3=1,3
If ((MFd2(i1).gt.mf_l2(3)).Or.(Mhh2.gt.mf_l2(3)).Or.(MFd2(i3).gt.mf_l2(3)).Or.(MAh2.gt.mf_l2(3))) Then
If (.not.OnlySM) Then 
coup1L = cplcFdFdAhL(i1,gt1)
coup1R = cplcFdFdAhR(i1,gt1)
coup2L = cplcFdFdhhL(gt2,i1)
coup2R = cplcFdFdhhR(gt2,i1)
coup3L = cplcFdFdAhL(gt4,i3)
coup3R = cplcFdFdAhR(gt4,i3)
coup4L = cplcFdFdhhL(i3,gt3)
coup4R = cplcFdFdhhR(i3,gt3)
mF1 = MFd(i1)
mF12 = MFd2(i1)
mS1 = MAh
mS12 = MAh2
mF2 = MFd(i3)
mF22 = MFd2(i3)
mS2 = Mhh
mS22 = Mhh2
  int1=D00check(mF12, mF22, mS22, mS12)
  int2=MMD0(mF1, mF2, mF12, mF22, mS22, mS12)
  BO4dSLL=BO4dSLL - 1.*chargefactor*coup1L*coup2L*coup3L*coup4L*int2
  BO4dSRR=BO4dSRR - 1.*chargefactor*coup1R*coup2R*coup3R*coup4R*int2
  BO4dSRL=BO4dSRL - 1.*chargefactor*coup1R*coup2R*coup3L*coup4L*int2
  BO4dSLR=BO4dSLR - 1.*chargefactor*coup1L*coup2L*coup3R*coup4R*int2
  BO4dVRR=BO4dVRR - 1.*chargefactor*coup1R*coup2L*coup3L*coup4R*int1
  BO4dVLL=BO4dVLL - 1.*chargefactor*coup1L*coup2R*coup3R*coup4L*int1
  BO4dVRL=BO4dVRL - 1.*chargefactor*coup1R*coup2L*coup3R*coup4L*int1
  BO4dVLR=BO4dVLR - 1.*chargefactor*coup1L*coup2R*coup3L*coup4R*int1
  BO4dTLL=BO4dTLL+0.
  BO4dTLR=BO4dTLR+0.
  BO4dTRL=BO4dTRL+0.
  BO4dTRR=BO4dTRR+0.
  End if 
End if 
    End Do 
  End Do 


 ! Fd,VZ,Fd,Ah
chargefactor = 1 
! Generic diagram: FSVF,  InsertionOrder: 2
Do i1=1,3
    Do i3=1,3
If ((MFd2(i1).gt.mf_l2(3)).Or.(MVZ2.gt.mf_l2(3)).Or.(MFd2(i3).gt.mf_l2(3)).Or.(MAh2.gt.mf_l2(3))) Then
If (((i1.lt.4).and.(i3.lt.4)).or.(.not.OnlySM)) Then 
coup1L = cplcFdFdAhL(i1,gt1)
coup1R = cplcFdFdAhR(i1,gt1)
coup2L = cplcFdFdVZL(gt2,i1)
coup2R = cplcFdFdVZR(gt2,i1)
coup3L = cplcFdFdAhL(gt4,i3)
coup3R = cplcFdFdAhR(gt4,i3)
coup4L = cplcFdFdVZL(i3,gt3)
coup4R = cplcFdFdVZR(i3,gt3)
mF1 = MFd(i1)
mF12 = MFd2(i1)
mS1 = MAh
mS12 = MAh2
mF2 = MFd(i3)
mF22 = MFd2(i3)
mV2 = MVZ
mV22 = MVZ2
  int1=C0D0check(mF22, mV22, mS12, mF12)
  int2=D00check(mF12, mF22, mV22, mS12)
  int3=MMD0(mF1, mF2, mF12, mF22, mV22, mS12)
  BO4dSLL=BO4dSLL+2.*chargefactor*coup1L*coup2R*coup3L*coup4L*(int1 - 2.*int2)
  BO4dSRR=BO4dSRR+2.*chargefactor*coup1R*coup2L*coup3R*coup4R*(int1 - 2.*int2)
  BO4dSRL=BO4dSRL+2.*chargefactor*coup1R*coup2L*coup3L*coup4L*(int1 - 2.*int2)
  BO4dSLR=BO4dSLR+2.*chargefactor*coup1L*coup2R*coup3R*coup4R*(int1 - 2.*int2)
  BO4dVRR=BO4dVRR+chargefactor*coup1R*coup2R*coup3L*coup4R*int3
  BO4dVLL=BO4dVLL+chargefactor*coup1L*coup2L*coup3R*coup4L*int3
  BO4dVRL=BO4dVRL+chargefactor*coup1R*coup2R*coup3R*coup4L*int3
  BO4dVLR=BO4dVLR+chargefactor*coup1L*coup2L*coup3L*coup4R*int3
  BO4dTLL=BO4dTLL - 1.*chargefactor*coup1L*coup2R*coup3L*coup4L*int2
  BO4dTLR=BO4dTLR+0.
  BO4dTRL=BO4dTRL+0.
  BO4dTRR=BO4dTRR - 1.*chargefactor*coup1R*coup2L*coup3R*coup4R*int2
  End if 
End if 
    End Do 
  End Do 


 ! Fd,Ah,Fd,hh
chargefactor = 1 
! Generic diagram: FSSF,  InsertionOrder: 2
Do i1=1,3
    Do i3=1,3
If ((MFd2(i1).gt.mf_l2(3)).Or.(MAh2.gt.mf_l2(3)).Or.(MFd2(i3).gt.mf_l2(3)).Or.(Mhh2.gt.mf_l2(3))) Then
If (.not.OnlySM) Then 
coup1L = cplcFdFdhhL(i1,gt1)
coup1R = cplcFdFdhhR(i1,gt1)
coup2L = cplcFdFdAhL(gt2,i1)
coup2R = cplcFdFdAhR(gt2,i1)
coup3L = cplcFdFdhhL(gt4,i3)
coup3R = cplcFdFdhhR(gt4,i3)
coup4L = cplcFdFdAhL(i3,gt3)
coup4R = cplcFdFdAhR(i3,gt3)
mF1 = MFd(i1)
mF12 = MFd2(i1)
mS1 = Mhh
mS12 = Mhh2
mF2 = MFd(i3)
mF22 = MFd2(i3)
mS2 = MAh
mS22 = MAh2
  int1=D00check(mF12, mF22, mS22, mS12)
  int2=MMD0(mF1, mF2, mF12, mF22, mS22, mS12)
  BO4dSLL=BO4dSLL - 1.*chargefactor*coup1L*coup2L*coup3L*coup4L*int2
  BO4dSRR=BO4dSRR - 1.*chargefactor*coup1R*coup2R*coup3R*coup4R*int2
  BO4dSRL=BO4dSRL - 1.*chargefactor*coup1R*coup2R*coup3L*coup4L*int2
  BO4dSLR=BO4dSLR - 1.*chargefactor*coup1L*coup2L*coup3R*coup4R*int2
  BO4dVRR=BO4dVRR - 1.*chargefactor*coup1R*coup2L*coup3L*coup4R*int1
  BO4dVLL=BO4dVLL - 1.*chargefactor*coup1L*coup2R*coup3R*coup4L*int1
  BO4dVRL=BO4dVRL - 1.*chargefactor*coup1R*coup2L*coup3R*coup4L*int1
  BO4dVLR=BO4dVLR - 1.*chargefactor*coup1L*coup2R*coup3L*coup4R*int1
  BO4dTLL=BO4dTLL+0.
  BO4dTLR=BO4dTLR+0.
  BO4dTRL=BO4dTRL+0.
  BO4dTRR=BO4dTRR+0.
  End if 
End if 
    End Do 
  End Do 


 ! Fd,hh,Fd,hh
chargefactor = 1 
! Generic diagram: FSSF,  InsertionOrder: 2
Do i1=1,3
    Do i3=1,3
If ((MFd2(i1).gt.mf_l2(3)).Or.(Mhh2.gt.mf_l2(3)).Or.(MFd2(i3).gt.mf_l2(3)).Or.(Mhh2.gt.mf_l2(3))) Then
If (.not.OnlySM) Then 
coup1L = cplcFdFdhhL(i1,gt1)
coup1R = cplcFdFdhhR(i1,gt1)
coup2L = cplcFdFdhhL(gt2,i1)
coup2R = cplcFdFdhhR(gt2,i1)
coup3L = cplcFdFdhhL(gt4,i3)
coup3R = cplcFdFdhhR(gt4,i3)
coup4L = cplcFdFdhhL(i3,gt3)
coup4R = cplcFdFdhhR(i3,gt3)
mF1 = MFd(i1)
mF12 = MFd2(i1)
mS1 = Mhh
mS12 = Mhh2
mF2 = MFd(i3)
mF22 = MFd2(i3)
mS2 = Mhh
mS22 = Mhh2
  int1=D00check(mF12, mF22, mS22, mS12)
  int2=MMD0(mF1, mF2, mF12, mF22, mS22, mS12)
  BO4dSLL=BO4dSLL - 1.*chargefactor*coup1L*coup2L*coup3L*coup4L*int2
  BO4dSRR=BO4dSRR - 1.*chargefactor*coup1R*coup2R*coup3R*coup4R*int2
  BO4dSRL=BO4dSRL - 1.*chargefactor*coup1R*coup2R*coup3L*coup4L*int2
  BO4dSLR=BO4dSLR - 1.*chargefactor*coup1L*coup2L*coup3R*coup4R*int2
  BO4dVRR=BO4dVRR - 1.*chargefactor*coup1R*coup2L*coup3L*coup4R*int1
  BO4dVLL=BO4dVLL - 1.*chargefactor*coup1L*coup2R*coup3R*coup4L*int1
  BO4dVRL=BO4dVRL - 1.*chargefactor*coup1R*coup2L*coup3R*coup4L*int1
  BO4dVLR=BO4dVLR - 1.*chargefactor*coup1L*coup2R*coup3L*coup4R*int1
  BO4dTLL=BO4dTLL+0.
  BO4dTLR=BO4dTLR+0.
  BO4dTRL=BO4dTRL+0.
  BO4dTRR=BO4dTRR+0.
  End if 
End if 
    End Do 
  End Do 


 ! Fd,VZ,Fd,hh
chargefactor = 1 
! Generic diagram: FSVF,  InsertionOrder: 2
Do i1=1,3
    Do i3=1,3
If ((MFd2(i1).gt.mf_l2(3)).Or.(MVZ2.gt.mf_l2(3)).Or.(MFd2(i3).gt.mf_l2(3)).Or.(Mhh2.gt.mf_l2(3))) Then
If (.not.OnlySM) Then 
coup1L = cplcFdFdhhL(i1,gt1)
coup1R = cplcFdFdhhR(i1,gt1)
coup2L = cplcFdFdVZL(gt2,i1)
coup2R = cplcFdFdVZR(gt2,i1)
coup3L = cplcFdFdhhL(gt4,i3)
coup3R = cplcFdFdhhR(gt4,i3)
coup4L = cplcFdFdVZL(i3,gt3)
coup4R = cplcFdFdVZR(i3,gt3)
mF1 = MFd(i1)
mF12 = MFd2(i1)
mS1 = Mhh
mS12 = Mhh2
mF2 = MFd(i3)
mF22 = MFd2(i3)
mV2 = MVZ
mV22 = MVZ2
  int1=C0D0check(mF22, mV22, mS12, mF12)
  int2=D00check(mF12, mF22, mV22, mS12)
  int3=MMD0(mF1, mF2, mF12, mF22, mV22, mS12)
  BO4dSLL=BO4dSLL+2.*chargefactor*coup1L*coup2R*coup3L*coup4L*(int1 - 2.*int2)
  BO4dSRR=BO4dSRR+2.*chargefactor*coup1R*coup2L*coup3R*coup4R*(int1 - 2.*int2)
  BO4dSRL=BO4dSRL+2.*chargefactor*coup1R*coup2L*coup3L*coup4L*(int1 - 2.*int2)
  BO4dSLR=BO4dSLR+2.*chargefactor*coup1L*coup2R*coup3R*coup4R*(int1 - 2.*int2)
  BO4dVRR=BO4dVRR+chargefactor*coup1R*coup2R*coup3L*coup4R*int3
  BO4dVLL=BO4dVLL+chargefactor*coup1L*coup2L*coup3R*coup4L*int3
  BO4dVRL=BO4dVRL+chargefactor*coup1R*coup2R*coup3R*coup4L*int3
  BO4dVLR=BO4dVLR+chargefactor*coup1L*coup2L*coup3L*coup4R*int3
  BO4dTLL=BO4dTLL - 1.*chargefactor*coup1L*coup2R*coup3L*coup4L*int2
  BO4dTLR=BO4dTLR+0.
  BO4dTRL=BO4dTRL+0.
  BO4dTRR=BO4dTRR - 1.*chargefactor*coup1R*coup2L*coup3R*coup4R*int2
  End if 
End if 
    End Do 
  End Do 


 ! Fu,Hp,Fu,Hp
chargefactor = 1 
! Generic diagram: FSSF,  InsertionOrder: 2
Do i1=1,3
    Do i3=1,3
If ((MFu2(i1).gt.mf_l2(3)).Or.(MHp2.gt.mf_l2(3)).Or.(MFu2(i3).gt.mf_l2(3)).Or.(MHp2.gt.mf_l2(3))) Then
If (((i1.lt.4).and.(i3.lt.4)).or.(.not.OnlySM)) Then 
coup1L = cplcFuFdHpL(i1,gt1)
coup1R = cplcFuFdHpR(i1,gt1)
coup2L = cplcFdFucHpL(gt2,i1)
coup2R = cplcFdFucHpR(gt2,i1)
coup3L = cplcFdFucHpL(gt4,i3)
coup3R = cplcFdFucHpR(gt4,i3)
coup4L = cplcFuFdHpL(i3,gt3)
coup4R = cplcFuFdHpR(i3,gt3)
mF1 = MFu(i1)
mF12 = MFu2(i1)
mS1 = MHp
mS12 = MHp2
mF2 = MFu(i3)
mF22 = MFu2(i3)
mS2 = MHp
mS22 = MHp2
  int1=D00check(mF12, mF22, mS22, mS12)
  int2=MMD0(mF1, mF2, mF12, mF22, mS22, mS12)
  BO4dSLL=BO4dSLL - 1.*chargefactor*coup1L*coup2L*coup3L*coup4L*int2
  BO4dSRR=BO4dSRR - 1.*chargefactor*coup1R*coup2R*coup3R*coup4R*int2
  BO4dSRL=BO4dSRL - 1.*chargefactor*coup1R*coup2R*coup3L*coup4L*int2
  BO4dSLR=BO4dSLR - 1.*chargefactor*coup1L*coup2L*coup3R*coup4R*int2
  BO4dVRR=BO4dVRR - 1.*chargefactor*coup1R*coup2L*coup3L*coup4R*int1
  BO4dVLL=BO4dVLL - 1.*chargefactor*coup1L*coup2R*coup3R*coup4L*int1
  BO4dVRL=BO4dVRL - 1.*chargefactor*coup1R*coup2L*coup3R*coup4L*int1
  BO4dVLR=BO4dVLR - 1.*chargefactor*coup1L*coup2R*coup3L*coup4R*int1
  BO4dTLL=BO4dTLL+0.
  BO4dTLR=BO4dTLR+0.
  BO4dTRL=BO4dTRL+0.
  BO4dTRR=BO4dTRR+0.
  End if 
End if 
    End Do 
  End Do 


 ! Fu,VWp,Fu,Hp
chargefactor = 1 
! Generic diagram: FSVF,  InsertionOrder: 2
Do i1=1,3
    Do i3=1,3
If ((MFu2(i1).gt.mf_l2(3)).Or.(MVWp2.gt.mf_l2(3)).Or.(MFu2(i3).gt.mf_l2(3)).Or.(MHp2.gt.mf_l2(3))) Then
If (((i1.lt.4).and.(i3.lt.4)).or.(.not.OnlySM)) Then 
coup1L = cplcFuFdHpL(i1,gt1)
coup1R = cplcFuFdHpR(i1,gt1)
coup2L = cplcFdFucVWpL(gt2,i1)
coup2R = cplcFdFucVWpR(gt2,i1)
coup3L = cplcFdFucHpL(gt4,i3)
coup3R = cplcFdFucHpR(gt4,i3)
coup4L = cplcFuFdVWpL(i3,gt3)
coup4R = cplcFuFdVWpR(i3,gt3)
mF1 = MFu(i1)
mF12 = MFu2(i1)
mS1 = MHp
mS12 = MHp2
mF2 = MFu(i3)
mF22 = MFu2(i3)
mV2 = MVWp
mV22 = MVWp2
  int1=C0D0check(mF22, mV22, mS12, mF12)
  int2=D00check(mF12, mF22, mV22, mS12)
  int3=MMD0(mF1, mF2, mF12, mF22, mV22, mS12)
  BO4dSLL=BO4dSLL+2.*chargefactor*coup1L*coup2R*coup3L*coup4L*(int1 - 2.*int2)
  BO4dSRR=BO4dSRR+2.*chargefactor*coup1R*coup2L*coup3R*coup4R*(int1 - 2.*int2)
  BO4dSRL=BO4dSRL+2.*chargefactor*coup1R*coup2L*coup3L*coup4L*(int1 - 2.*int2)
  BO4dSLR=BO4dSLR+2.*chargefactor*coup1L*coup2R*coup3R*coup4R*(int1 - 2.*int2)
  BO4dVRR=BO4dVRR+chargefactor*coup1R*coup2R*coup3L*coup4R*int3
  BO4dVLL=BO4dVLL+chargefactor*coup1L*coup2L*coup3R*coup4L*int3
  BO4dVRL=BO4dVRL+chargefactor*coup1R*coup2R*coup3R*coup4L*int3
  BO4dVLR=BO4dVLR+chargefactor*coup1L*coup2L*coup3L*coup4R*int3
  BO4dTLL=BO4dTLL - 1.*chargefactor*coup1L*coup2R*coup3L*coup4L*int2
  BO4dTLR=BO4dTLR+0.
  BO4dTRL=BO4dTRL+0.
  BO4dTRR=BO4dTRR - 1.*chargefactor*coup1R*coup2L*coup3R*coup4R*int2
  End if 
End if 
    End Do 
  End Do 


 ! Fu,Hp,Fu,VWp
chargefactor = 1 
! Generic diagram: FVSF,  InsertionOrder: 2
Do i1=1,3
    Do i3=1,3
If ((MFu2(i1).gt.mf_l2(3)).Or.(MHp2.gt.mf_l2(3)).Or.(MFu2(i3).gt.mf_l2(3)).Or.(MVWp2.gt.mf_l2(3))) Then
If (((i1.lt.4).and.(i3.lt.4)).or.(.not.OnlySM)) Then 
coup1L = cplcFuFdVWpL(i1,gt1)
coup1R = cplcFuFdVWpR(i1,gt1)
coup2L = cplcFdFucHpL(gt2,i1)
coup2R = cplcFdFucHpR(gt2,i1)
coup3L = cplcFdFucVWpL(gt4,i3)
coup3R = cplcFdFucVWpR(gt4,i3)
coup4L = cplcFuFdHpL(i3,gt3)
coup4R = cplcFuFdHpR(i3,gt3)
mF1 = MFu(i1)
mF12 = MFu2(i1)
mV1 = MVWp
mV12 = MVWp2
mF2 = MFu(i3)
mF22 = MFu2(i3)
mS2 = MHp
mS22 = MHp2
  int1=C0D0check(mF22, mS22, mV12, mF12)
  int2=D00check(mF12, mF22, mS22, mV12)
  int3=MMD0(mF1, mF2, mF12, mF22, mS22, mV12)
  BO4dSLL=BO4dSLL+2.*chargefactor*coup1L*coup2L*coup3R*coup4L*(int1 - 2.*int2)
  BO4dSRR=BO4dSRR+2.*chargefactor*coup1R*coup2R*coup3L*coup4R*(int1 - 2.*int2)
  BO4dSRL=BO4dSRL+2.*chargefactor*coup1R*coup2R*coup3R*coup4L*(int1 - 2.*int2)
  BO4dSLR=BO4dSLR+2.*chargefactor*coup1L*coup2L*coup3L*coup4R*(int1 - 2.*int2)
  BO4dVRR=BO4dVRR+chargefactor*coup1R*coup2L*coup3R*coup4R*int3
  BO4dVLL=BO4dVLL+chargefactor*coup1L*coup2R*coup3L*coup4L*int3
  BO4dVRL=BO4dVRL+chargefactor*coup1R*coup2L*coup3L*coup4L*int3
  BO4dVLR=BO4dVLR+chargefactor*coup1L*coup2R*coup3R*coup4R*int3
  BO4dTLL=BO4dTLL - 1.*chargefactor*coup1L*coup2L*coup3R*coup4L*int2
  BO4dTLR=BO4dTLR+0.
  BO4dTRL=BO4dTRL+0.
  BO4dTRR=BO4dTRR - 1.*chargefactor*coup1R*coup2R*coup3L*coup4R*int2
  End if 
End if 
    End Do 
  End Do 


 ! Fu,VWp,Fu,VWp
chargefactor = 1 
! Generic diagram: FVVF,  InsertionOrder: 2
Do i1=1,3
    Do i3=1,3
If ((MFu2(i1).gt.mf_l2(3)).Or.(MVWp2.gt.mf_l2(3)).Or.(MFu2(i3).gt.mf_l2(3)).Or.(MVWp2.gt.mf_l2(3))) Then
If (((i1.lt.4).and.(i3.lt.4)).or.(.not.OnlySM)) Then 
coup1L = cplcFuFdVWpL(i1,gt1)
coup1R = cplcFuFdVWpR(i1,gt1)
coup2L = cplcFdFucVWpL(gt2,i1)
coup2R = cplcFdFucVWpR(gt2,i1)
coup3L = cplcFdFucVWpL(gt4,i3)
coup3R = cplcFdFucVWpR(gt4,i3)
coup4L = cplcFuFdVWpL(i3,gt3)
coup4R = cplcFuFdVWpR(i3,gt3)
mF1 = MFu(i1)
mF12 = MFu2(i1)
mV1 = MVWp
mV12 = MVWp2
mF2 = MFu(i3)
mF22 = MFu2(i3)
mV2 = MVWp
mV22 = MVWp2
  int1=C0D0check(mF22, mV22, mV12, mF12)
  int2=D00check(mF12, mF22, mV22, mV12)
  int3=MMD0(mF1, mF2, mF12, mF22, mV22, mV12)
  BO4dSLL=BO4dSLL - 4.*chargefactor*coup1L*coup2R*coup3R*coup4L*int3
  BO4dSRR=BO4dSRR - 4.*chargefactor*coup1R*coup2L*coup3L*coup4R*int3
  BO4dSRL=BO4dSRL - 4.*chargefactor*coup1R*coup2L*coup3R*coup4L*int3
  BO4dSLR=BO4dSLR - 4.*chargefactor*coup1L*coup2R*coup3L*coup4R*int3
  BO4dVRR=BO4dVRR - 4.*chargefactor*coup1R*coup2R*coup3R*coup4R*(int1 -               & 
&  3.*int2)
  BO4dVLL=BO4dVLL - 4.*chargefactor*coup1L*coup2L*coup3L*coup4L*(int1 -               & 
&  3.*int2)
  BO4dVRL=BO4dVRL - 4.*chargefactor*coup1R*coup2R*coup3L*coup4L*int1
  BO4dVLR=BO4dVLR - 4.*chargefactor*coup1L*coup2L*coup3R*coup4R*int1
  BO4dTLL=BO4dTLL+chargefactor*coup1L*coup2R*coup3R*coup4L*int3
  BO4dTLR=BO4dTLR+0.
  BO4dTRL=BO4dTRL+0.
  BO4dTRR=BO4dTRR+chargefactor*coup1R*coup2L*coup3L*coup4R*int3
  End if 
End if 
    End Do 
  End Do 


 ! Fd,Ah,Fd,VZ
chargefactor = 1 
! Generic diagram: FVSF,  InsertionOrder: 2
Do i1=1,3
    Do i3=1,3
If ((MFd2(i1).gt.mf_l2(3)).Or.(MAh2.gt.mf_l2(3)).Or.(MFd2(i3).gt.mf_l2(3)).Or.(MVZ2.gt.mf_l2(3))) Then
If (((i1.lt.4).and.(i3.lt.4)).or.(.not.OnlySM)) Then 
coup1L = cplcFdFdVZL(i1,gt1)
coup1R = cplcFdFdVZR(i1,gt1)
coup2L = cplcFdFdAhL(gt2,i1)
coup2R = cplcFdFdAhR(gt2,i1)
coup3L = cplcFdFdVZL(gt4,i3)
coup3R = cplcFdFdVZR(gt4,i3)
coup4L = cplcFdFdAhL(i3,gt3)
coup4R = cplcFdFdAhR(i3,gt3)
mF1 = MFd(i1)
mF12 = MFd2(i1)
mV1 = MVZ
mV12 = MVZ2
mF2 = MFd(i3)
mF22 = MFd2(i3)
mS2 = MAh
mS22 = MAh2
  int1=C0D0check(mF22, mS22, mV12, mF12)
  int2=D00check(mF12, mF22, mS22, mV12)
  int3=MMD0(mF1, mF2, mF12, mF22, mS22, mV12)
  BO4dSLL=BO4dSLL+2.*chargefactor*coup1L*coup2L*coup3R*coup4L*(int1 - 2.*int2)
  BO4dSRR=BO4dSRR+2.*chargefactor*coup1R*coup2R*coup3L*coup4R*(int1 - 2.*int2)
  BO4dSRL=BO4dSRL+2.*chargefactor*coup1R*coup2R*coup3R*coup4L*(int1 - 2.*int2)
  BO4dSLR=BO4dSLR+2.*chargefactor*coup1L*coup2L*coup3L*coup4R*(int1 - 2.*int2)
  BO4dVRR=BO4dVRR+chargefactor*coup1R*coup2L*coup3R*coup4R*int3
  BO4dVLL=BO4dVLL+chargefactor*coup1L*coup2R*coup3L*coup4L*int3
  BO4dVRL=BO4dVRL+chargefactor*coup1R*coup2L*coup3L*coup4L*int3
  BO4dVLR=BO4dVLR+chargefactor*coup1L*coup2R*coup3R*coup4R*int3
  BO4dTLL=BO4dTLL - 1.*chargefactor*coup1L*coup2L*coup3R*coup4L*int2
  BO4dTLR=BO4dTLR+0.
  BO4dTRL=BO4dTRL+0.
  BO4dTRR=BO4dTRR - 1.*chargefactor*coup1R*coup2R*coup3L*coup4R*int2
  End if 
End if 
    End Do 
  End Do 


 ! Fd,hh,Fd,VZ
chargefactor = 1 
! Generic diagram: FVSF,  InsertionOrder: 2
Do i1=1,3
    Do i3=1,3
If ((MFd2(i1).gt.mf_l2(3)).Or.(Mhh2.gt.mf_l2(3)).Or.(MFd2(i3).gt.mf_l2(3)).Or.(MVZ2.gt.mf_l2(3))) Then
If (.not.OnlySM) Then 
coup1L = cplcFdFdVZL(i1,gt1)
coup1R = cplcFdFdVZR(i1,gt1)
coup2L = cplcFdFdhhL(gt2,i1)
coup2R = cplcFdFdhhR(gt2,i1)
coup3L = cplcFdFdVZL(gt4,i3)
coup3R = cplcFdFdVZR(gt4,i3)
coup4L = cplcFdFdhhL(i3,gt3)
coup4R = cplcFdFdhhR(i3,gt3)
mF1 = MFd(i1)
mF12 = MFd2(i1)
mV1 = MVZ
mV12 = MVZ2
mF2 = MFd(i3)
mF22 = MFd2(i3)
mS2 = Mhh
mS22 = Mhh2
  int1=C0D0check(mF22, mS22, mV12, mF12)
  int2=D00check(mF12, mF22, mS22, mV12)
  int3=MMD0(mF1, mF2, mF12, mF22, mS22, mV12)
  BO4dSLL=BO4dSLL+2.*chargefactor*coup1L*coup2L*coup3R*coup4L*(int1 - 2.*int2)
  BO4dSRR=BO4dSRR+2.*chargefactor*coup1R*coup2R*coup3L*coup4R*(int1 - 2.*int2)
  BO4dSRL=BO4dSRL+2.*chargefactor*coup1R*coup2R*coup3R*coup4L*(int1 - 2.*int2)
  BO4dSLR=BO4dSLR+2.*chargefactor*coup1L*coup2L*coup3L*coup4R*(int1 - 2.*int2)
  BO4dVRR=BO4dVRR+chargefactor*coup1R*coup2L*coup3R*coup4R*int3
  BO4dVLL=BO4dVLL+chargefactor*coup1L*coup2R*coup3L*coup4L*int3
  BO4dVRL=BO4dVRL+chargefactor*coup1R*coup2L*coup3L*coup4L*int3
  BO4dVLR=BO4dVLR+chargefactor*coup1L*coup2R*coup3R*coup4R*int3
  BO4dTLL=BO4dTLL - 1.*chargefactor*coup1L*coup2L*coup3R*coup4L*int2
  BO4dTLR=BO4dTLR+0.
  BO4dTRL=BO4dTRL+0.
  BO4dTRR=BO4dTRR - 1.*chargefactor*coup1R*coup2R*coup3L*coup4R*int2
  End if 
End if 
    End Do 
  End Do 


 ! Fd,VZ,Fd,VZ
chargefactor = 1 
! Generic diagram: FVVF,  InsertionOrder: 2
Do i1=1,3
    Do i3=1,3
If ((MFd2(i1).gt.mf_l2(3)).Or.(MVZ2.gt.mf_l2(3)).Or.(MFd2(i3).gt.mf_l2(3)).Or.(MVZ2.gt.mf_l2(3))) Then
If (((i1.lt.4).and.(i3.lt.4)).or.(.not.OnlySM)) Then 
coup1L = cplcFdFdVZL(i1,gt1)
coup1R = cplcFdFdVZR(i1,gt1)
coup2L = cplcFdFdVZL(gt2,i1)
coup2R = cplcFdFdVZR(gt2,i1)
coup3L = cplcFdFdVZL(gt4,i3)
coup3R = cplcFdFdVZR(gt4,i3)
coup4L = cplcFdFdVZL(i3,gt3)
coup4R = cplcFdFdVZR(i3,gt3)
mF1 = MFd(i1)
mF12 = MFd2(i1)
mV1 = MVZ
mV12 = MVZ2
mF2 = MFd(i3)
mF22 = MFd2(i3)
mV2 = MVZ
mV22 = MVZ2
  int1=C0D0check(mF22, mV22, mV12, mF12)
  int2=D00check(mF12, mF22, mV22, mV12)
  int3=MMD0(mF1, mF2, mF12, mF22, mV22, mV12)
  BO4dSLL=BO4dSLL - 4.*chargefactor*coup1L*coup2R*coup3R*coup4L*int3
  BO4dSRR=BO4dSRR - 4.*chargefactor*coup1R*coup2L*coup3L*coup4R*int3
  BO4dSRL=BO4dSRL - 4.*chargefactor*coup1R*coup2L*coup3R*coup4L*int3
  BO4dSLR=BO4dSLR - 4.*chargefactor*coup1L*coup2R*coup3L*coup4R*int3
  BO4dVRR=BO4dVRR - 4.*chargefactor*coup1R*coup2R*coup3R*coup4R*(int1 -               & 
&  3.*int2)
  BO4dVLL=BO4dVLL - 4.*chargefactor*coup1L*coup2L*coup3L*coup4L*(int1 -               & 
&  3.*int2)
  BO4dVRL=BO4dVRL - 4.*chargefactor*coup1R*coup2R*coup3L*coup4L*int1
  BO4dVLR=BO4dVLR - 4.*chargefactor*coup1L*coup2L*coup3R*coup4R*int1
  BO4dTLL=BO4dTLL+chargefactor*coup1L*coup2R*coup3R*coup4L*int3
  BO4dTLR=BO4dTLR+0.
  BO4dTRL=BO4dTRL+0.
  BO4dTRR=BO4dTRR+chargefactor*coup1R*coup2L*coup3L*coup4R*int3
  End if 
End if 
    End Do 
  End Do 


 ! Ah,bar[Fd],Ah,bar[Fd]
! Vanishing contribution because of color flow 

! Ah,bar[Fd],hh,bar[Fd]
! Vanishing contribution because of color flow 

! Ah,bar[Fd],VZ,bar[Fd]
! Vanishing contribution because of color flow 

! hh,bar[Fd],Ah,bar[Fd]
! Vanishing contribution because of color flow 

! hh,bar[Fd],hh,bar[Fd]
! Vanishing contribution because of color flow 

! hh,bar[Fd],VZ,bar[Fd]
! Vanishing contribution because of color flow 

! VZ,bar[Fd],Ah,bar[Fd]
! Vanishing contribution because of color flow 

! VZ,bar[Fd],hh,bar[Fd]
! Vanishing contribution because of color flow 

! VZ,bar[Fd],VZ,bar[Fd]
! Vanishing contribution because of color flow 

! conj[Hp],bar[Fu],conj[Hp],bar[Fu]
! Vanishing contribution because of color flow 

! conj[Hp],bar[Fu],conj[VWp],bar[Fu]
! Vanishing contribution because of color flow 

! conj[VWp],bar[Fu],conj[Hp],bar[Fu]
! Vanishing contribution because of color flow 

! conj[VWp],bar[Fu],conj[VWp],bar[Fu]
! Vanishing contribution because of color flow 

! Fd,Ah,bar[Fd],Ah
! Vanishing contribution because of color flow 

! Fd,hh,bar[Fd],Ah
! Vanishing contribution because of color flow 

! Fd,VZ,bar[Fd],Ah
! Vanishing contribution because of color flow 

! Fd,Ah,bar[Fd],hh
! Vanishing contribution because of color flow 

! Fd,hh,bar[Fd],hh
! Vanishing contribution because of color flow 

! Fd,VZ,bar[Fd],hh
! Vanishing contribution because of color flow 

! Fd,Ah,bar[Fd],VZ
! Vanishing contribution because of color flow 

! Fd,hh,bar[Fd],VZ
! Vanishing contribution because of color flow 

! Fd,VZ,bar[Fd],VZ
! Vanishing contribution because of color flow 

BO4dSLL=oo16pi2*BO4dSLL 
BO4dSRR=oo16pi2*BO4dSRR 
BO4dSRL=oo16pi2*BO4dSRL 
BO4dSLR=oo16pi2*BO4dSLR 
BO4dVRR=oo16pi2*BO4dVRR 
BO4dVLL=oo16pi2*BO4dVLL 
BO4dVRL=oo16pi2*BO4dVRL 
BO4dVLR=oo16pi2*BO4dVLR 
BO4dTLL=oo16pi2*BO4dTLL 
BO4dTLR=oo16pi2*BO4dTLR 
BO4dTRL=oo16pi2*BO4dTRL 
BO4dTRR=oo16pi2*BO4dTRR 
Iname=Iname-1

End Subroutine CalculateBox4d 

Subroutine CalculateTreeS4d(gt1,gt2,gt3,gt4,OnlySM,MAh,MAh2,MFd,MFd2,MFu,             & 
& MFu2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,cplAhAhhh,cplAhcHpVWp,cplAhhhVZ,            & 
& cplAhHpcVWp,cplcFdFdAhL,cplcFdFdAhR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVGL,               & 
& cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,cplcFdFucHpL,              & 
& cplcFdFucHpR,cplcFdFucVWpL,cplcFdFucVWpR,cplcFuFdHpL,cplcFuFdHpR,cplcFuFdVWpL,         & 
& cplcFuFdVWpR,cplcFuFuAhL,cplcFuFuAhR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVGL,              & 
& cplcFuFuVGR,cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZL,cplcFuFuVZR,cplcHpVPVWp,               & 
& cplcHpVWpVZ,cplcVWpVPVWp,cplcVWpVWpVZ,cplhhcHpVWp,cplhhcVWpVWp,cplhhhhhh,              & 
& cplhhHpcHp,cplhhHpcVWp,cplhhVZVZ,cplHpcHpVP,cplHpcHpVZ,cplHpcVWpVP,cplHpcVWpVZ,        & 
& TSO4dSLL,TSO4dSRR,TSO4dSRL,TSO4dSLR,TSO4dVRR,TSO4dVLL,TSO4dVRL,TSO4dVLR,               & 
& TSO4dTLL,TSO4dTLR,TSO4dTRL,TSO4dTRR)

! ---------------------------------------------------------------- 
! Code based on automatically generated SARAH extensions by 'PreSARAH' 
! Expressions for amplitudes are obtained by FeynArts/FormCalc 
! Based on user input for process TreeS4d 
! 'PreSARAH' output has been generated  at 11:24 on 15.12.2015 
! ---------------------------------------------------------------- 
 
Implicit None 
Real(dp),Intent(in) :: MAh,MAh2,MFd(3),MFd2(3),MFu(3),MFu2(3),Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2

Complex(dp),Intent(in) :: cplAhAhhh,cplAhcHpVWp,cplAhhhVZ,cplAhHpcVWp,cplcFdFdAhL(3,3),cplcFdFdAhR(3,3),        & 
& cplcFdFdhhL(3,3),cplcFdFdhhR(3,3),cplcFdFdVGL(3,3),cplcFdFdVGR(3,3),cplcFdFdVPL(3,3),  & 
& cplcFdFdVPR(3,3),cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),cplcFdFucHpL(3,3),cplcFdFucHpR(3,3),& 
& cplcFdFucVWpL(3,3),cplcFdFucVWpR(3,3),cplcFuFdHpL(3,3),cplcFuFdHpR(3,3),               & 
& cplcFuFdVWpL(3,3),cplcFuFdVWpR(3,3),cplcFuFuAhL(3,3),cplcFuFuAhR(3,3),cplcFuFuhhL(3,3),& 
& cplcFuFuhhR(3,3),cplcFuFuVGL(3,3),cplcFuFuVGR(3,3),cplcFuFuVPL(3,3),cplcFuFuVPR(3,3),  & 
& cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),cplcHpVPVWp,cplcHpVWpVZ,cplcVWpVPVWp,cplcVWpVWpVZ,   & 
& cplhhcHpVWp,cplhhcVWpVWp,cplhhhhhh,cplhhHpcHp,cplhhHpcVWp,cplhhVZVZ,cplHpcHpVP,        & 
& cplHpcHpVZ,cplHpcVWpVP,cplHpcVWpVZ

Integer,Intent(in) :: gt1, gt2,gt3,gt4 
Logical, Intent(in) :: OnlySM 
Integer :: iprop, i1, i2, i3, i4 
Real(dp) :: MassEx1,MassEx2,MassEx3,MassEx4, MassEx12,MassEx22,MassEx32,MassEx42 
Complex(dp), Intent(out) :: TSO4dSLL 
Complex(dp), Intent(out) :: TSO4dSRR 
Complex(dp), Intent(out) :: TSO4dSRL 
Complex(dp), Intent(out) :: TSO4dSLR 
Complex(dp), Intent(out) :: TSO4dVRR 
Complex(dp), Intent(out) :: TSO4dVLL 
Complex(dp), Intent(out) :: TSO4dVRL 
Complex(dp), Intent(out) :: TSO4dVLR 
Complex(dp), Intent(out) :: TSO4dTLL 
Complex(dp), Intent(out) :: TSO4dTLR 
Complex(dp), Intent(out) :: TSO4dTRL 
Complex(dp), Intent(out) :: TSO4dTRR 
Complex(dp) :: vertex1L, vertex1R, vertex2L, vertex2R 
Real(dp) ::  MP, MP2, IMP2, IMP, MFin, MFin2, IMFin, IMFin2, Finite  
Real(dp) ::  MS1, MS12, MS2, MS22, MF1, MF12, MF2, MF22, MV1, MV12, MV2, MV22  
Complex(dp) ::  chargefactor  
Complex(dp) ::  coup1L, coup1R, coup2L, coup2R, coup3L, coup3R, coup3, coup4L, coup4R 

Complex(dp) ::  int1,int2,int3,int4,int5,int6,int7,int8 

Iname=Iname+1 
NameOfUnit(Iname)='CalculateTreeS4d' 

Finite=1._dp 
MassEx1=MFd(gt1)  
MassEx12=MFd2(gt1) 
MassEx2=MFd(gt2)  
MassEx22=MFd2(gt2) 
MassEx3=MFd(gt3)  
MassEx32=MFd2(gt3) 
MassEx4=MFd(gt4)  
MassEx42=MFd2(gt4) 
! ------------------------------ 
 ! Amplitudes for external states 
 ! {DownQuark, bar[DownQuark], DownQuark, bar[DownQuark]} 
 ! ------------------------------ 
 
TSO4dSLL=0._dp 
TSO4dSRR=0._dp 
TSO4dSRL=0._dp 
TSO4dSLR=0._dp 
TSO4dVRR=0._dp 
TSO4dVLL=0._dp 
TSO4dVRL=0._dp 
TSO4dVLR=0._dp 
TSO4dTLL=0._dp 
TSO4dTLR=0._dp 
TSO4dTRL=0._dp 
TSO4dTRR=0._dp 
!---------------------------------------- 
! Scalar Tree Contributions            
!---------------------------------------- 
! -- Ah - Tree            
! Propagator: VZ
! InsertionOrder: 1
chargefactor = 1 
If ((OnlySM).or.(.not.OnlySM)) Then 
coup1L = cplcFdFdAhL(gt2,gt1)
coup1R = cplcFdFdAhR(gt2,gt1)
coup2L = cplcFdFdAhL(gt4,gt3)
coup2R = cplcFdFdAhR(gt4,gt3)
! Propagator and inverse propagator mass 
MP = MAh
MP2 = MAh2
IMP = 1._dp/MP  
IMP2 = 1._dp/MP2 
! Amplitude 
  TSO4dSLL=TSO4dSLL+ coup1L*coup2L*IMP2
  TSO4dSRR=TSO4dSRR+ coup1R*coup2R*IMP2
  TSO4dSRL=TSO4dSRL+ coup1R*coup2L*IMP2
  TSO4dSLR=TSO4dSLR+ coup1L*coup2R*IMP2
  TSO4dVRR=TSO4dVRR+ 0.
  TSO4dVLL=TSO4dVLL+ 0.
  TSO4dVRL=TSO4dVRL+ 0.
  TSO4dVLR=TSO4dVLR+ 0.
  TSO4dTLL=TSO4dTLL+ 0.
  TSO4dTLR=TSO4dTLR+ 0.
  TSO4dTRL=TSO4dTRL+ 0.
  TSO4dTRR=TSO4dTRR+ 0.
 End if 


 ! Propagator: VZ
! InsertionOrder: 3
chargefactor = 1 
If ((OnlySM).or.(.not.OnlySM)) Then 
coup1L = cplcFdFdAhL(gt4,gt1)
coup1R = cplcFdFdAhR(gt4,gt1)
coup2L = cplcFdFdAhL(gt2,gt3)
coup2R = cplcFdFdAhR(gt2,gt3)
! Propagator and inverse propagator mass 
MP = MAh
MP2 = MAh2
IMP = 1._dp/MP  
IMP2 = 1._dp/MP2 
! Amplitude 
  TSO4dSLL=TSO4dSLL-0.5*coup1L*coup2L*IMP2
  TSO4dSRR=TSO4dSRR-0.5*coup1R*coup2R*IMP2
  TSO4dSRL=TSO4dSRL+ 0.
  TSO4dSLR=TSO4dSLR+ 0.
  TSO4dVRR=TSO4dVRR+ 0.
  TSO4dVLL=TSO4dVLL+ 0.
  TSO4dVRL=TSO4dVRL-0.5*coup1R*coup2L*IMP2
  TSO4dVLR=TSO4dVLR-0.5*coup1L*coup2R*IMP2
  TSO4dTLL=TSO4dTLL+ 0.125*coup1L*coup2L*IMP2
  TSO4dTLR=TSO4dTLR+ 0.
  TSO4dTRL=TSO4dTRL+ 0.
  TSO4dTRR=TSO4dTRR+ 0.125*coup1R*coup2R*IMP2
 End if 


 ! -- hh - Tree            
! Propagator: VZ
! InsertionOrder: 1
chargefactor = 1 
If (.not.OnlySM) Then 
coup1L = cplcFdFdhhL(gt2,gt1)
coup1R = cplcFdFdhhR(gt2,gt1)
coup2L = cplcFdFdhhL(gt4,gt3)
coup2R = cplcFdFdhhR(gt4,gt3)
! Propagator and inverse propagator mass 
MP = Mhh
MP2 = Mhh2
IMP = 1._dp/MP  
IMP2 = 1._dp/MP2 
! Amplitude 
  TSO4dSLL=TSO4dSLL+ coup1L*coup2L*IMP2
  TSO4dSRR=TSO4dSRR+ coup1R*coup2R*IMP2
  TSO4dSRL=TSO4dSRL+ coup1R*coup2L*IMP2
  TSO4dSLR=TSO4dSLR+ coup1L*coup2R*IMP2
  TSO4dVRR=TSO4dVRR+ 0.
  TSO4dVLL=TSO4dVLL+ 0.
  TSO4dVRL=TSO4dVRL+ 0.
  TSO4dVLR=TSO4dVLR+ 0.
  TSO4dTLL=TSO4dTLL+ 0.
  TSO4dTLR=TSO4dTLR+ 0.
  TSO4dTRL=TSO4dTRL+ 0.
  TSO4dTRR=TSO4dTRR+ 0.
 End if 


 ! Propagator: VZ
! InsertionOrder: 3
chargefactor = 1 
If (.not.OnlySM) Then 
coup1L = cplcFdFdhhL(gt4,gt1)
coup1R = cplcFdFdhhR(gt4,gt1)
coup2L = cplcFdFdhhL(gt2,gt3)
coup2R = cplcFdFdhhR(gt2,gt3)
! Propagator and inverse propagator mass 
MP = Mhh
MP2 = Mhh2
IMP = 1._dp/MP  
IMP2 = 1._dp/MP2 
! Amplitude 
  TSO4dSLL=TSO4dSLL-0.5*coup1L*coup2L*IMP2
  TSO4dSRR=TSO4dSRR-0.5*coup1R*coup2R*IMP2
  TSO4dSRL=TSO4dSRL+ 0.
  TSO4dSLR=TSO4dSLR+ 0.
  TSO4dVRR=TSO4dVRR+ 0.
  TSO4dVLL=TSO4dVLL+ 0.
  TSO4dVRL=TSO4dVRL-0.5*coup1R*coup2L*IMP2
  TSO4dVLR=TSO4dVLR-0.5*coup1L*coup2R*IMP2
  TSO4dTLL=TSO4dTLL+ 0.125*coup1L*coup2L*IMP2
  TSO4dTLR=TSO4dTLR+ 0.
  TSO4dTRL=TSO4dTRL+ 0.
  TSO4dTRR=TSO4dTRR+ 0.125*coup1R*coup2R*IMP2
 End if 


 Iname=Iname-1

End Subroutine CalculateTreeS4d 

Subroutine CalculateTreeV4d(gt1,gt2,gt3,gt4,OnlySM,MAh,MAh2,MFd,MFd2,MFu,             & 
& MFu2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,cplAhAhhh,cplAhcHpVWp,cplAhhhVZ,            & 
& cplAhHpcVWp,cplcFdFdAhL,cplcFdFdAhR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVGL,               & 
& cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,cplcFdFucHpL,              & 
& cplcFdFucHpR,cplcFdFucVWpL,cplcFdFucVWpR,cplcFuFdHpL,cplcFuFdHpR,cplcFuFdVWpL,         & 
& cplcFuFdVWpR,cplcFuFuAhL,cplcFuFuAhR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVGL,              & 
& cplcFuFuVGR,cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZL,cplcFuFuVZR,cplcHpVPVWp,               & 
& cplcHpVWpVZ,cplcVWpVPVWp,cplcVWpVWpVZ,cplhhcHpVWp,cplhhcVWpVWp,cplhhhhhh,              & 
& cplhhHpcHp,cplhhHpcVWp,cplhhVZVZ,cplHpcHpVP,cplHpcHpVZ,cplHpcVWpVP,cplHpcVWpVZ,        & 
& TVO4dSLL,TVO4dSRR,TVO4dSRL,TVO4dSLR,TVO4dVRR,TVO4dVLL,TVO4dVRL,TVO4dVLR,               & 
& TVO4dTLL,TVO4dTLR,TVO4dTRL,TVO4dTRR)

! ---------------------------------------------------------------- 
! Code based on automatically generated SARAH extensions by 'PreSARAH' 
! Expressions for amplitudes are obtained by FeynArts/FormCalc 
! Based on user input for process TreeV4d 
! 'PreSARAH' output has been generated  at 11:24 on 15.12.2015 
! ---------------------------------------------------------------- 
 
Implicit None 
Real(dp),Intent(in) :: MAh,MAh2,MFd(3),MFd2(3),MFu(3),MFu2(3),Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2

Complex(dp),Intent(in) :: cplAhAhhh,cplAhcHpVWp,cplAhhhVZ,cplAhHpcVWp,cplcFdFdAhL(3,3),cplcFdFdAhR(3,3),        & 
& cplcFdFdhhL(3,3),cplcFdFdhhR(3,3),cplcFdFdVGL(3,3),cplcFdFdVGR(3,3),cplcFdFdVPL(3,3),  & 
& cplcFdFdVPR(3,3),cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),cplcFdFucHpL(3,3),cplcFdFucHpR(3,3),& 
& cplcFdFucVWpL(3,3),cplcFdFucVWpR(3,3),cplcFuFdHpL(3,3),cplcFuFdHpR(3,3),               & 
& cplcFuFdVWpL(3,3),cplcFuFdVWpR(3,3),cplcFuFuAhL(3,3),cplcFuFuAhR(3,3),cplcFuFuhhL(3,3),& 
& cplcFuFuhhR(3,3),cplcFuFuVGL(3,3),cplcFuFuVGR(3,3),cplcFuFuVPL(3,3),cplcFuFuVPR(3,3),  & 
& cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),cplcHpVPVWp,cplcHpVWpVZ,cplcVWpVPVWp,cplcVWpVWpVZ,   & 
& cplhhcHpVWp,cplhhcVWpVWp,cplhhhhhh,cplhhHpcHp,cplhhHpcVWp,cplhhVZVZ,cplHpcHpVP,        & 
& cplHpcHpVZ,cplHpcVWpVP,cplHpcVWpVZ

Integer,Intent(in) :: gt1, gt2,gt3,gt4 
Logical, Intent(in) :: OnlySM 
Integer :: iprop, i1, i2, i3, i4 
Real(dp) :: MassEx1,MassEx2,MassEx3,MassEx4, MassEx12,MassEx22,MassEx32,MassEx42 
Complex(dp), Intent(out) :: TVO4dSLL 
Complex(dp), Intent(out) :: TVO4dSRR 
Complex(dp), Intent(out) :: TVO4dSRL 
Complex(dp), Intent(out) :: TVO4dSLR 
Complex(dp), Intent(out) :: TVO4dVRR 
Complex(dp), Intent(out) :: TVO4dVLL 
Complex(dp), Intent(out) :: TVO4dVRL 
Complex(dp), Intent(out) :: TVO4dVLR 
Complex(dp), Intent(out) :: TVO4dTLL 
Complex(dp), Intent(out) :: TVO4dTLR 
Complex(dp), Intent(out) :: TVO4dTRL 
Complex(dp), Intent(out) :: TVO4dTRR 
Complex(dp) :: vertex1L, vertex1R, vertex2L, vertex2R 
Real(dp) ::  MP, MP2, IMP2, IMP, MFin, MFin2, IMFin, IMFin2, Finite  
Real(dp) ::  MS1, MS12, MS2, MS22, MF1, MF12, MF2, MF22, MV1, MV12, MV2, MV22  
Complex(dp) ::  chargefactor  
Complex(dp) ::  coup1L, coup1R, coup2L, coup2R, coup3L, coup3R, coup3, coup4L, coup4R 

Complex(dp) ::  int1,int2,int3,int4,int5,int6,int7,int8 

Iname=Iname+1 
NameOfUnit(Iname)='CalculateTreeV4d' 

Finite=1._dp 
MassEx1=MFd(gt1)  
MassEx12=MFd2(gt1) 
MassEx2=MFd(gt2)  
MassEx22=MFd2(gt2) 
MassEx3=MFd(gt3)  
MassEx32=MFd2(gt3) 
MassEx4=MFd(gt4)  
MassEx42=MFd2(gt4) 
! ------------------------------ 
 ! Amplitudes for external states 
 ! {DownQuark, bar[DownQuark], DownQuark, bar[DownQuark]} 
 ! ------------------------------ 
 
TVO4dSLL=0._dp 
TVO4dSRR=0._dp 
TVO4dSRL=0._dp 
TVO4dSLR=0._dp 
TVO4dVRR=0._dp 
TVO4dVLL=0._dp 
TVO4dVRL=0._dp 
TVO4dVLR=0._dp 
TVO4dTLL=0._dp 
TVO4dTLR=0._dp 
TVO4dTRL=0._dp 
TVO4dTRR=0._dp 
!---------------------------------------- 
! Vector Tree Contributions            
!---------------------------------------- 
! -- VZ - Tree            
! Propagator: VZ
! InsertionOrder: 1
chargefactor = 1 
If ((OnlySM).or.(.not.OnlySM)) Then 
coup1L = cplcFdFdVZL(gt2,gt1)
coup1R = cplcFdFdVZR(gt2,gt1)
coup2L = cplcFdFdVZL(gt4,gt3)
coup2R = cplcFdFdVZR(gt4,gt3)
! Propagator and inverse propagator mass 
MP = MVZ
MP2 = MVZ2
IMP = 1._dp/MP  
IMP2 = 1._dp/MP2 
! Amplitude 
  TVO4dSLL=TVO4dSLL+ 0.
  TVO4dSRR=TVO4dSRR+ 0.
  TVO4dSRL=TVO4dSRL+ 0.
  TVO4dSLR=TVO4dSLR+ 0.
  TVO4dVRR=TVO4dVRR-1.*coup1R*coup2R*IMP2
  TVO4dVLL=TVO4dVLL-1.*coup1L*coup2L*IMP2
  TVO4dVRL=TVO4dVRL-1.*coup1R*coup2L*IMP2
  TVO4dVLR=TVO4dVLR-1.*coup1L*coup2R*IMP2
  TVO4dTLL=TVO4dTLL+ 0.
  TVO4dTLR=TVO4dTLR+ 0.
  TVO4dTRL=TVO4dTRL+ 0.
  TVO4dTRR=TVO4dTRR+ 0.
 End if 


 ! Propagator: VZ
! InsertionOrder: 3
chargefactor = 1 
If ((OnlySM).or.(.not.OnlySM)) Then 
coup1L = cplcFdFdVZL(gt4,gt1)
coup1R = cplcFdFdVZR(gt4,gt1)
coup2L = cplcFdFdVZL(gt2,gt3)
coup2R = cplcFdFdVZR(gt2,gt3)
! Propagator and inverse propagator mass 
MP = MVZ
MP2 = MVZ2
IMP = 1._dp/MP  
IMP2 = 1._dp/MP2 
! Amplitude 
  TVO4dSLL=TVO4dSLL+ 0.
  TVO4dSRR=TVO4dSRR+ 0.
  TVO4dSRL=TVO4dSRL+ 2.*coup1R*coup2L*IMP2
  TVO4dSLR=TVO4dSLR+ 2.*coup1L*coup2R*IMP2
  TVO4dVRR=TVO4dVRR-1.*coup1R*coup2R*IMP2
  TVO4dVLL=TVO4dVLL-1.*coup1L*coup2L*IMP2
  TVO4dVRL=TVO4dVRL+ 0.
  TVO4dVLR=TVO4dVLR+ 0.
  TVO4dTLL=TVO4dTLL+ 0.
  TVO4dTLR=TVO4dTLR+ 0.
  TVO4dTRL=TVO4dTRL+ 0.
  TVO4dTRR=TVO4dTRR+ 0.
 End if 


 Iname=Iname-1

End Subroutine CalculateTreeV4d 

Subroutine CalculateA2q(gt1,gt2,gt3,OnlySM,MAh,MAh2,MFd,MFd2,MFu,MFu2,Mhh,            & 
& Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,cplAhAhhh,cplAhcHpVWp,cplAhhhVZ,cplAhHpcVWp,         & 
& cplcFdFdAhL,cplcFdFdAhR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZR,               & 
& cplcFdFucHpL,cplcFdFucHpR,cplcFdFucVWpL,cplcFdFucVWpR,cplcFuFdHpL,cplcFuFdHpR,         & 
& cplcFuFdVWpL,cplcFuFdVWpR,cplcFuFuAhL,cplcFuFuAhR,OAh2qSL,OAh2qSR)

! ---------------------------------------------------------------- 
! Code based on automatically generated SARAH extensions by 'PreSARAH' 
! Expressions for amplitudes are obtained by FeynArts/FormCalc 
! Based on user input for process A2q 
! 'PreSARAH' output has been generated  at 11:59 on 3.4.2014 
! ---------------------------------------------------------------- 
 
Implicit None 
Real(dp),Intent(in) :: MAh,MAh2,MFd(3),MFd2(3),MFu(3),MFu2(3),Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2

Complex(dp),Intent(in) :: cplAhAhhh,cplAhcHpVWp,cplAhhhVZ,cplAhHpcVWp,cplcFdFdAhL(3,3),cplcFdFdAhR(3,3),        & 
& cplcFdFdhhL(3,3),cplcFdFdhhR(3,3),cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),cplcFdFucHpL(3,3), & 
& cplcFdFucHpR(3,3),cplcFdFucVWpL(3,3),cplcFdFucVWpR(3,3),cplcFuFdHpL(3,3),              & 
& cplcFuFdHpR(3,3),cplcFuFdVWpL(3,3),cplcFuFdVWpR(3,3),cplcFuFuAhL(3,3),cplcFuFuAhR(3,3)

Integer,Intent(in) :: gt1, gt2,gt3 
Integer :: gt4 
Logical, Intent(in) :: OnlySM 
Integer :: iprop, i1, i2, i3, i4 
Real(dp) :: MassEx1,MassEx2,MassEx3,MassEx12,MassEx22,MassEx32 
Complex(dp), Intent(out) :: OAh2qSL 
Complex(dp), Intent(out) :: OAh2qSR 
Real(dp) ::  MP, MP2, IMP2, IMP, MFin, MFin2, IMFin, IMFin2, Finite  
Real(dp) ::  MS1, MS12, MS2, MS22, MF1, MF12, MF2, MF22, MV1, MV12, MV2, MV22  
Complex(dp) ::  chargefactor  
Complex(dp) ::  coup1L, coup1R, coup2L, coup2R, coup3L, coup3R, coup3, coup4L, coup4R 

Complex(dp) ::  int1,int2,int3,int4,int5,int6,int7,int8 

Iname=Iname+1 
NameOfUnit(Iname)='CalculateA2q' 

Finite=1._dp 
MassEx1=MFd(gt1)  
MassEx12=MFd2(gt1) 
MassEx2=MFd(gt2)  
MassEx22=MFd2(gt2) 
MassEx3=MAh  
MassEx32=MAh2 
! ------------------------------ 
 ! Amplitudes for external states 
 ! {DownQuark, bar[DownQuark], PseudoScalar} 
 ! ------------------------------ 
 
OAh2qSL=0._dp 
OAh2qSR=0._dp 
!---------------------------------------- 
! Tree Contributions                      
!---------------------------------------- 
chargefactor = 1 
If ((OnlySM).or.(.not.OnlySM)) Then 
coup1L = cplcFdFdAhL(gt2,gt1)
coup1R = cplcFdFdAhR(gt2,gt1)
! Amplitude 
  OAh2qSL=OAh2qSL+ 0.
  OAh2qSR=OAh2qSR+ 0.
 End if 


 !---------------------------------------- 
! Wave Contributions                      
!---------------------------------------- 
! Loop particles: Ah,Fd, Internal fermion: bar[Fd]
! Generic diagram: SFF,  InsertionOrder: 1
chargefactor = 1 
  Do i2=1,3
    Do i3=1,3
If ((MAh2.gt.mf_l2(3)).Or.(MFd2(i2).gt.mf_l2(3))) Then
If (((i2.lt.4).and.(i3.lt.4)).or.(.not.OnlySM)) Then 
coup1L = cplcFdFdAhL(i2,gt1)
coup1R = cplcFdFdAhR(i2,gt1)
coup2L = cplcFdFdAhL(i3,i2)
coup2R = cplcFdFdAhR(i3,i2)
coup3L = cplcFdFdAhL(gt2,i3)
coup3R = cplcFdFdAhR(gt2,i3)
! Masses in loop
mS1 = MAh
mS12 = MAh2
mF1 = MFd(i2)
mF12 = MFd2(i2)
! Mass of internal fermion 
MFin = MFd(i3)-MFd(gt1)
MFin2 = MFd2(i3)-MFd2(gt1)
If (Abs(MFin).gt.10E-10_dp) Then 
MFin = MFd(i3)
MFin2 = MFd2(i3)
! Amplitude 
  int1=B0(MassEx12, mF12, mS12)
  int2=B1(MassEx12, mF12, mS12)
  OAh2qSL=OAh2qSL+(chargefactor*coup3L*(coup1L*coup2R*int2*MassEx12 - 1.*coup1R*coup2R*int1*MassEx1*mF1 +& 
&  coup1R*coup2L*int2*MassEx1*MFin - 1.*coup1L*coup2L*int1*mF1*MFin))/(MassEx12 -        & 
&  1.*MFin2)
  OAh2qSR=OAh2qSR+(chargefactor*coup3R*(coup1R*coup2L*int2*MassEx12 - 1.*coup1L*coup2L*int1*MassEx1*mF1 +& 
&  coup1L*coup2R*int2*MassEx1*MFin - 1.*coup1R*coup2R*int1*mF1*MFin))/(MassEx12 -        & 
&  1.*MFin2)
     End if 
  End if 
End if 
   End Do 
  End Do 


 ! Loop particles: hh,Fd, Internal fermion: bar[Fd]
! Generic diagram: SFF,  InsertionOrder: 1
chargefactor = 1 
  Do i2=1,3
    Do i3=1,3
If ((Mhh2.gt.mf_l2(3)).Or.(MFd2(i2).gt.mf_l2(3))) Then
If (.not.OnlySM) Then 
coup1L = cplcFdFdhhL(i2,gt1)
coup1R = cplcFdFdhhR(i2,gt1)
coup2L = cplcFdFdhhL(i3,i2)
coup2R = cplcFdFdhhR(i3,i2)
coup3L = cplcFdFdAhL(gt2,i3)
coup3R = cplcFdFdAhR(gt2,i3)
! Masses in loop
mS1 = Mhh
mS12 = Mhh2
mF1 = MFd(i2)
mF12 = MFd2(i2)
! Mass of internal fermion 
MFin = MFd(i3)-MFd(gt1)
MFin2 = MFd2(i3)-MFd2(gt1)
If (Abs(MFin).gt.10E-10_dp) Then 
MFin = MFd(i3)
MFin2 = MFd2(i3)
! Amplitude 
  int1=B0(MassEx12, mF12, mS12)
  int2=B1(MassEx12, mF12, mS12)
  OAh2qSL=OAh2qSL+(chargefactor*coup3L*(coup1L*coup2R*int2*MassEx12 - 1.*coup1R*coup2R*int1*MassEx1*mF1 +& 
&  coup1R*coup2L*int2*MassEx1*MFin - 1.*coup1L*coup2L*int1*mF1*MFin))/(MassEx12 -        & 
&  1.*MFin2)
  OAh2qSR=OAh2qSR+(chargefactor*coup3R*(coup1R*coup2L*int2*MassEx12 - 1.*coup1L*coup2L*int1*MassEx1*mF1 +& 
&  coup1L*coup2R*int2*MassEx1*MFin - 1.*coup1R*coup2R*int1*mF1*MFin))/(MassEx12 -        & 
&  1.*MFin2)
     End if 
  End if 
End if 
   End Do 
  End Do 


 ! Loop particles: Hp,Fu, Internal fermion: bar[Fd]
! Generic diagram: SFF,  InsertionOrder: 1
chargefactor = 1 
  Do i2=1,3
    Do i3=1,3
If ((MHp2.gt.mf_l2(3)).Or.(MFu2(i2).gt.mf_l2(3))) Then
If (((i2.lt.4).and.(i3.lt.4)).or.(.not.OnlySM)) Then 
coup1L = cplcFuFdHpL(i2,gt1)
coup1R = cplcFuFdHpR(i2,gt1)
coup2L = cplcFdFucHpL(i3,i2)
coup2R = cplcFdFucHpR(i3,i2)
coup3L = cplcFdFdAhL(gt2,i3)
coup3R = cplcFdFdAhR(gt2,i3)
! Masses in loop
mS1 = MHp
mS12 = MHp2
mF1 = MFu(i2)
mF12 = MFu2(i2)
! Mass of internal fermion 
MFin = MFd(i3)-MFd(gt1)
MFin2 = MFd2(i3)-MFd2(gt1)
If (Abs(MFin).gt.10E-10_dp) Then 
MFin = MFd(i3)
MFin2 = MFd2(i3)
! Amplitude 
  int1=B0(MassEx12, mF12, mS12)
  int2=B1(MassEx12, mF12, mS12)
  OAh2qSL=OAh2qSL+(chargefactor*coup3L*(coup1L*coup2R*int2*MassEx12 - 1.*coup1R*coup2R*int1*MassEx1*mF1 +& 
&  coup1R*coup2L*int2*MassEx1*MFin - 1.*coup1L*coup2L*int1*mF1*MFin))/(MassEx12 -        & 
&  1.*MFin2)
  OAh2qSR=OAh2qSR+(chargefactor*coup3R*(coup1R*coup2L*int2*MassEx12 - 1.*coup1L*coup2L*int1*MassEx1*mF1 +& 
&  coup1L*coup2R*int2*MassEx1*MFin - 1.*coup1R*coup2R*int1*mF1*MFin))/(MassEx12 -        & 
&  1.*MFin2)
     End if 
  End if 
End if 
   End Do 
  End Do 


 ! Loop particles: VWp,Fu, Internal fermion: bar[Fd]
! Generic diagram: VFF,  InsertionOrder: 1
chargefactor = 1 
  Do i2=1,3
    Do i3=1,3
If ((MVWp2.gt.mf_l2(3)).Or.(MFu2(i2).gt.mf_l2(3))) Then
If (((i2.lt.4).and.(i3.lt.4)).or.(.not.OnlySM)) Then 
coup1L = cplcFuFdVWpL(i2,gt1)
coup1R = cplcFuFdVWpR(i2,gt1)
coup2L = cplcFdFucVWpL(i3,i2)
coup2R = cplcFdFucVWpR(i3,i2)
coup3L = cplcFdFdAhL(gt2,i3)
coup3R = cplcFdFdAhR(gt2,i3)
! Masses in loop
mV1 = MVWp
mV12 = MVWp2
mF1 = MFu(i2)
mF12 = MFu2(i2)
! Mass of internal fermion 
MFin = MFd(i3)-MFd(gt1)
MFin2 = MFd2(i3)-MFd2(gt1)
If (Abs(MFin).gt.10E-10_dp) Then 
MFin = MFd(i3)
MFin2 = MFd2(i3)
! Amplitude 
  int1=B0(MassEx12, mF12, mV12)
  int2=B1(MassEx12, mF12, mV12)
  OAh2qSL=OAh2qSL+(chargefactor*coup3L*(coup1R*MassEx1*(-2.*coup2L*(Finite - 2.*int1) & 
& *mF1 + coup2R*(Finite + 2.*int2)*MFin) + coup1L*(coup2L*(Finite + 2.*int2)             & 
& *MassEx12 - 2.*coup2R*(Finite - 2.*int1)*mF1*MFin)))/(MassEx12 - 1.*MFin2)
  OAh2qSR=OAh2qSR+(chargefactor*coup3R*(coup1L*MassEx1*(-2.*coup2R*(Finite - 2.*int1) & 
& *mF1 + coup2L*(Finite + 2.*int2)*MFin) + coup1R*(coup2R*(Finite + 2.*int2)             & 
& *MassEx12 - 2.*coup2L*(Finite - 2.*int1)*mF1*MFin)))/(MassEx12 - 1.*MFin2)
     End if 
  End if 
End if 
   End Do 
  End Do 


 ! Loop particles: VZ,Fd, Internal fermion: bar[Fd]
! Generic diagram: VFF,  InsertionOrder: 1
chargefactor = 1 
  Do i2=1,3
    Do i3=1,3
If ((MVZ2.gt.mf_l2(3)).Or.(MFd2(i2).gt.mf_l2(3))) Then
If (((i2.lt.4).and.(i3.lt.4)).or.(.not.OnlySM)) Then 
coup1L = cplcFdFdVZL(i2,gt1)
coup1R = cplcFdFdVZR(i2,gt1)
coup2L = cplcFdFdVZL(i3,i2)
coup2R = cplcFdFdVZR(i3,i2)
coup3L = cplcFdFdAhL(gt2,i3)
coup3R = cplcFdFdAhR(gt2,i3)
! Masses in loop
mV1 = MVZ
mV12 = MVZ2
mF1 = MFd(i2)
mF12 = MFd2(i2)
! Mass of internal fermion 
MFin = MFd(i3)-MFd(gt1)
MFin2 = MFd2(i3)-MFd2(gt1)
If (Abs(MFin).gt.10E-10_dp) Then 
MFin = MFd(i3)
MFin2 = MFd2(i3)
! Amplitude 
  int1=B0(MassEx12, mF12, mV12)
  int2=B1(MassEx12, mF12, mV12)
  OAh2qSL=OAh2qSL+(chargefactor*coup3L*(coup1R*MassEx1*(-2.*coup2L*(Finite - 2.*int1) & 
& *mF1 + coup2R*(Finite + 2.*int2)*MFin) + coup1L*(coup2L*(Finite + 2.*int2)             & 
& *MassEx12 - 2.*coup2R*(Finite - 2.*int1)*mF1*MFin)))/(MassEx12 - 1.*MFin2)
  OAh2qSR=OAh2qSR+(chargefactor*coup3R*(coup1L*MassEx1*(-2.*coup2R*(Finite - 2.*int1) & 
& *mF1 + coup2L*(Finite + 2.*int2)*MFin) + coup1R*(coup2R*(Finite + 2.*int2)             & 
& *MassEx12 - 2.*coup2L*(Finite - 2.*int1)*mF1*MFin)))/(MassEx12 - 1.*MFin2)
     End if 
  End if 
End if 
   End Do 
  End Do 


 ! Loop particles: Fd,Ah, Internal fermion: Fd
! Generic diagram: FSF,  InsertionOrder: 2
chargefactor = 1 
Do i1=1,3
    Do i3=1,3
If ((MFd2(i1).gt.mf_l2(3)).Or.(MAh2.gt.mf_l2(3))) Then
If (((i1.lt.4).and.(i3.lt.4)).or.(.not.OnlySM)) Then 
coup3L = cplcFdFdAhL(i3,gt1)
coup3R = cplcFdFdAhR(i3,gt1)
coup2L = cplcFdFdAhL(i1,i3)
coup2R = cplcFdFdAhR(i1,i3)
coup1L = cplcFdFdAhL(gt2,i1)
coup1R = cplcFdFdAhR(gt2,i1)
! Masses in loop
mF1 = MFd(i1)
mF12 = MFd2(i1)
mS1 = MAh
mS12 = MAh2
! Mass of internal fermion 
MFin = MFd(i3)-MFd(gt2)
MFin2 = MFd2(i3)-MFd2(gt2)
If (Abs(MFin).gt.10E-10_dp) Then 
MFin = MFd(i3)
MFin2 = MFd2(i3)
! Amplitude 
  int1=B0(MassEx22, mF12, mS12)
  int2=B1(MassEx22, mF12, mS12)
  OAh2qSL=OAh2qSL+(chargefactor*coup3L*(coup1L*coup2R*int2*MassEx22 - 1.*coup1R*coup2R*int1*MassEx2*mF1 +& 
&  coup1R*coup2L*int2*MassEx2*MFin - 1.*coup1L*coup2L*int1*mF1*MFin))/(MassEx22 -        & 
&  1.*MFin2)
  OAh2qSR=OAh2qSR+(chargefactor*coup3R*(coup1R*coup2L*int2*MassEx22 - 1.*coup1L*coup2L*int1*MassEx2*mF1 +& 
&  coup1L*coup2R*int2*MassEx2*MFin - 1.*coup1R*coup2R*int1*mF1*MFin))/(MassEx22 -        & 
&  1.*MFin2)
     End if 
  End if 
End if 
    End Do 
  End Do 


 ! Loop particles: Fd,hh, Internal fermion: Fd
! Generic diagram: FSF,  InsertionOrder: 2
chargefactor = 1 
Do i1=1,3
    Do i3=1,3
If ((MFd2(i1).gt.mf_l2(3)).Or.(Mhh2.gt.mf_l2(3))) Then
If (.not.OnlySM) Then 
coup3L = cplcFdFdAhL(i3,gt1)
coup3R = cplcFdFdAhR(i3,gt1)
coup2L = cplcFdFdhhL(i1,i3)
coup2R = cplcFdFdhhR(i1,i3)
coup1L = cplcFdFdhhL(gt2,i1)
coup1R = cplcFdFdhhR(gt2,i1)
! Masses in loop
mF1 = MFd(i1)
mF12 = MFd2(i1)
mS1 = Mhh
mS12 = Mhh2
! Mass of internal fermion 
MFin = MFd(i3)-MFd(gt2)
MFin2 = MFd2(i3)-MFd2(gt2)
If (Abs(MFin).gt.10E-10_dp) Then 
MFin = MFd(i3)
MFin2 = MFd2(i3)
! Amplitude 
  int1=B0(MassEx22, mF12, mS12)
  int2=B1(MassEx22, mF12, mS12)
  OAh2qSL=OAh2qSL+(chargefactor*coup3L*(coup1L*coup2R*int2*MassEx22 - 1.*coup1R*coup2R*int1*MassEx2*mF1 +& 
&  coup1R*coup2L*int2*MassEx2*MFin - 1.*coup1L*coup2L*int1*mF1*MFin))/(MassEx22 -        & 
&  1.*MFin2)
  OAh2qSR=OAh2qSR+(chargefactor*coup3R*(coup1R*coup2L*int2*MassEx22 - 1.*coup1L*coup2L*int1*MassEx2*mF1 +& 
&  coup1L*coup2R*int2*MassEx2*MFin - 1.*coup1R*coup2R*int1*mF1*MFin))/(MassEx22 -        & 
&  1.*MFin2)
     End if 
  End if 
End if 
    End Do 
  End Do 


 ! Loop particles: Fu,Hp, Internal fermion: Fd
! Generic diagram: FSF,  InsertionOrder: 2
chargefactor = 1 
Do i1=1,3
    Do i3=1,3
If ((MFu2(i1).gt.mf_l2(3)).Or.(MHp2.gt.mf_l2(3))) Then
If (((i1.lt.4).and.(i3.lt.4)).or.(.not.OnlySM)) Then 
coup3L = cplcFdFdAhL(i3,gt1)
coup3R = cplcFdFdAhR(i3,gt1)
coup2L = cplcFuFdHpL(i1,i3)
coup2R = cplcFuFdHpR(i1,i3)
coup1L = cplcFdFucHpL(gt2,i1)
coup1R = cplcFdFucHpR(gt2,i1)
! Masses in loop
mF1 = MFu(i1)
mF12 = MFu2(i1)
mS1 = MHp
mS12 = MHp2
! Mass of internal fermion 
MFin = MFd(i3)-MFd(gt2)
MFin2 = MFd2(i3)-MFd2(gt2)
If (Abs(MFin).gt.10E-10_dp) Then 
MFin = MFd(i3)
MFin2 = MFd2(i3)
! Amplitude 
  int1=B0(MassEx22, mF12, mS12)
  int2=B1(MassEx22, mF12, mS12)
  OAh2qSL=OAh2qSL+(chargefactor*coup3L*(coup1L*coup2R*int2*MassEx22 - 1.*coup1R*coup2R*int1*MassEx2*mF1 +& 
&  coup1R*coup2L*int2*MassEx2*MFin - 1.*coup1L*coup2L*int1*mF1*MFin))/(MassEx22 -        & 
&  1.*MFin2)
  OAh2qSR=OAh2qSR+(chargefactor*coup3R*(coup1R*coup2L*int2*MassEx22 - 1.*coup1L*coup2L*int1*MassEx2*mF1 +& 
&  coup1L*coup2R*int2*MassEx2*MFin - 1.*coup1R*coup2R*int1*mF1*MFin))/(MassEx22 -        & 
&  1.*MFin2)
     End if 
  End if 
End if 
    End Do 
  End Do 


 ! Loop particles: Fu,VWp, Internal fermion: Fd
! Generic diagram: FVF,  InsertionOrder: 2
chargefactor = 1 
Do i1=1,3
    Do i3=1,3
If ((MFu2(i1).gt.mf_l2(3)).Or.(MVWp2.gt.mf_l2(3))) Then
If (((i1.lt.4).and.(i3.lt.4)).or.(.not.OnlySM)) Then 
coup3L = cplcFdFdAhL(i3,gt1)
coup3R = cplcFdFdAhR(i3,gt1)
coup2L = cplcFuFdVWpL(i1,i3)
coup2R = cplcFuFdVWpR(i1,i3)
coup1L = cplcFdFucVWpL(gt2,i1)
coup1R = cplcFdFucVWpR(gt2,i1)
! Masses in loop
mF1 = MFu(i1)
mF12 = MFu2(i1)
mV1 = MVWp
mV12 = MVWp2
! Mass of internal fermion 
MFin = MFd(i3)-MFd(gt2)
MFin2 = MFd2(i3)-MFd2(gt2)
If (Abs(MFin).gt.10E-10_dp) Then 
MFin = MFd(i3)
MFin2 = MFd2(i3)
! Amplitude 
  int1=B0(MassEx22, mF12, mV12)
  int2=B1(MassEx22, mF12, mV12)
  OAh2qSL=OAh2qSL+(chargefactor*coup3L*(coup1L*MassEx2*(-2.*coup2R*(Finite - 2.*int1) & 
& *mF1 + coup2L*(Finite + 2.*int2)*MFin) + coup1R*(coup2R*(Finite + 2.*int2)             & 
& *MassEx22 - 2.*coup2L*(Finite - 2.*int1)*mF1*MFin)))/(MassEx22 - 1.*MFin2)
  OAh2qSR=OAh2qSR+(chargefactor*coup3R*(coup1R*MassEx2*(-2.*coup2L*(Finite - 2.*int1) & 
& *mF1 + coup2R*(Finite + 2.*int2)*MFin) + coup1L*(coup2L*(Finite + 2.*int2)             & 
& *MassEx22 - 2.*coup2R*(Finite - 2.*int1)*mF1*MFin)))/(MassEx22 - 1.*MFin2)
     End if 
  End if 
End if 
    End Do 
  End Do 


 ! Loop particles: Fd,VZ, Internal fermion: Fd
! Generic diagram: FVF,  InsertionOrder: 2
chargefactor = 1 
Do i1=1,3
    Do i3=1,3
If ((MFd2(i1).gt.mf_l2(3)).Or.(MVZ2.gt.mf_l2(3))) Then
If (((i1.lt.4).and.(i3.lt.4)).or.(.not.OnlySM)) Then 
coup3L = cplcFdFdAhL(i3,gt1)
coup3R = cplcFdFdAhR(i3,gt1)
coup2L = cplcFdFdVZL(i1,i3)
coup2R = cplcFdFdVZR(i1,i3)
coup1L = cplcFdFdVZL(gt2,i1)
coup1R = cplcFdFdVZR(gt2,i1)
! Masses in loop
mF1 = MFd(i1)
mF12 = MFd2(i1)
mV1 = MVZ
mV12 = MVZ2
! Mass of internal fermion 
MFin = MFd(i3)-MFd(gt2)
MFin2 = MFd2(i3)-MFd2(gt2)
If (Abs(MFin).gt.10E-10_dp) Then 
MFin = MFd(i3)
MFin2 = MFd2(i3)
! Amplitude 
  int1=B0(MassEx22, mF12, mV12)
  int2=B1(MassEx22, mF12, mV12)
  OAh2qSL=OAh2qSL+(chargefactor*coup3L*(coup1L*MassEx2*(-2.*coup2R*(Finite - 2.*int1) & 
& *mF1 + coup2L*(Finite + 2.*int2)*MFin) + coup1R*(coup2R*(Finite + 2.*int2)             & 
& *MassEx22 - 2.*coup2L*(Finite - 2.*int1)*mF1*MFin)))/(MassEx22 - 1.*MFin2)
  OAh2qSR=OAh2qSR+(chargefactor*coup3R*(coup1R*MassEx2*(-2.*coup2L*(Finite - 2.*int1) & 
& *mF1 + coup2R*(Finite + 2.*int2)*MFin) + coup1L*(coup2L*(Finite + 2.*int2)             & 
& *MassEx22 - 2.*coup2R*(Finite - 2.*int1)*mF1*MFin)))/(MassEx22 - 1.*MFin2)
     End if 
  End if 
End if 
    End Do 
  End Do 


 !---------------------------------------- 
! Triangle Contributions                  
!---------------------------------------- 
! Loop particles: Ah,Fd,Fd
! Generic diagram: SFF,  InsertionOrder: 1
chargefactor = 1 
  Do i2=1,3
    Do i3=1,3
If ((MAh2.gt.mf_l2(3)).Or.(MFd2(i2).gt.mf_l2(3)).Or.(MFd2(i3).gt.mf_l2(3))) Then
If (((i2.lt.4).and.(i3.lt.4)).or.(.not.OnlySM)) Then 
coup1L = cplcFdFdAhL(i2,gt1)
coup1R = cplcFdFdAhR(i2,gt1)
coup2L = cplcFdFdAhL(gt2,i3)
coup2R = cplcFdFdAhR(gt2,i3)
coup3L = cplcFdFdAhL(i3,i2)
coup3R = cplcFdFdAhR(i3,i2)
! Masses in loop
mS1 = MAh
mS12 = MAh2
mF1 = MFd(i2)
mF12 = MFd2(i2)
mF2 = MFd(i3)
mF22 = MFd2(i3)
! Amplitude 
  int1=B0(0._dp, mF12, mF22)
  int2=C0m(mF22, mF12, mS12)
  int3=C1m(mF22, mF12, mS12)
  int4=C2m(mF22, mF12, mS12)
  OAh2qSL=OAh2qSL+chargefactor*(coup1R*MassEx1*(coup2R*coup3L*int4*MassEx2 -          & 
&  1.*coup2L*(coup3R*int3*mF1 + coup3L*(int2 + int3)*mF2)) + coup1L*(coup2R*MassEx2*(coup3L*(int3 + int4)& 
& *mF1 + coup3R*(int2 + int3 + int4)*mF2) - 1.*coup2L*(coup3L*int2*mF1*mF2 +             & 
&  coup3R*(int1 + int3*MassEx12 - 1.*int2*MassEx22 - 1.*int3*MassEx22 - 1.*int4*MassEx22 + int2*mS12))))
  OAh2qSR=OAh2qSR+chargefactor*(coup1L*MassEx1*(coup2L*coup3R*int4*MassEx2 -          & 
&  1.*coup2R*(coup3L*int3*mF1 + coup3R*(int2 + int3)*mF2)) + coup1R*(coup2L*MassEx2*(coup3R*(int3 + int4)& 
& *mF1 + coup3L*(int2 + int3 + int4)*mF2) - 1.*coup2R*(coup3R*int2*mF1*mF2 +             & 
&  coup3L*(int1 + int3*MassEx12 - 1.*int2*MassEx22 - 1.*int3*MassEx22 - 1.*int4*MassEx22 + int2*mS12))))
  End if 
End if 
   End Do 
  End Do 


 ! Loop particles: hh,Fd,Fd
! Generic diagram: SFF,  InsertionOrder: 1
chargefactor = 1 
  Do i2=1,3
    Do i3=1,3
If ((Mhh2.gt.mf_l2(3)).Or.(MFd2(i2).gt.mf_l2(3)).Or.(MFd2(i3).gt.mf_l2(3))) Then
If (.not.OnlySM) Then 
coup1L = cplcFdFdhhL(i2,gt1)
coup1R = cplcFdFdhhR(i2,gt1)
coup2L = cplcFdFdhhL(gt2,i3)
coup2R = cplcFdFdhhR(gt2,i3)
coup3L = cplcFdFdAhL(i3,i2)
coup3R = cplcFdFdAhR(i3,i2)
! Masses in loop
mS1 = Mhh
mS12 = Mhh2
mF1 = MFd(i2)
mF12 = MFd2(i2)
mF2 = MFd(i3)
mF22 = MFd2(i3)
! Amplitude 
  int1=B0(0._dp, mF12, mF22)
  int2=C0m(mF22, mF12, mS12)
  int3=C1m(mF22, mF12, mS12)
  int4=C2m(mF22, mF12, mS12)
  OAh2qSL=OAh2qSL+chargefactor*(coup1R*MassEx1*(coup2R*coup3L*int4*MassEx2 -          & 
&  1.*coup2L*(coup3R*int3*mF1 + coup3L*(int2 + int3)*mF2)) + coup1L*(coup2R*MassEx2*(coup3L*(int3 + int4)& 
& *mF1 + coup3R*(int2 + int3 + int4)*mF2) - 1.*coup2L*(coup3L*int2*mF1*mF2 +             & 
&  coup3R*(int1 + int3*MassEx12 - 1.*int2*MassEx22 - 1.*int3*MassEx22 - 1.*int4*MassEx22 + int2*mS12))))
  OAh2qSR=OAh2qSR+chargefactor*(coup1L*MassEx1*(coup2L*coup3R*int4*MassEx2 -          & 
&  1.*coup2R*(coup3L*int3*mF1 + coup3R*(int2 + int3)*mF2)) + coup1R*(coup2L*MassEx2*(coup3R*(int3 + int4)& 
& *mF1 + coup3L*(int2 + int3 + int4)*mF2) - 1.*coup2R*(coup3R*int2*mF1*mF2 +             & 
&  coup3L*(int1 + int3*MassEx12 - 1.*int2*MassEx22 - 1.*int3*MassEx22 - 1.*int4*MassEx22 + int2*mS12))))
  End if 
End if 
   End Do 
  End Do 


 ! Loop particles: Hp,Fu,Fu
! Generic diagram: SFF,  InsertionOrder: 1
chargefactor = 1 
  Do i2=1,3
    Do i3=1,3
If ((MHp2.gt.mf_l2(3)).Or.(MFu2(i2).gt.mf_l2(3)).Or.(MFu2(i3).gt.mf_l2(3))) Then
If (((i2.lt.4).and.(i3.lt.4)).or.(.not.OnlySM)) Then 
coup1L = cplcFuFdHpL(i2,gt1)
coup1R = cplcFuFdHpR(i2,gt1)
coup2L = cplcFdFucHpL(gt2,i3)
coup2R = cplcFdFucHpR(gt2,i3)
coup3L = cplcFuFuAhL(i3,i2)
coup3R = cplcFuFuAhR(i3,i2)
! Masses in loop
mS1 = MHp
mS12 = MHp2
mF1 = MFu(i2)
mF12 = MFu2(i2)
mF2 = MFu(i3)
mF22 = MFu2(i3)
! Amplitude 
  int1=B0(0._dp, mF12, mF22)
  int2=C0m(mF22, mF12, mS12)
  int3=C1m(mF22, mF12, mS12)
  int4=C2m(mF22, mF12, mS12)
  OAh2qSL=OAh2qSL+chargefactor*(coup1R*MassEx1*(coup2R*coup3L*int4*MassEx2 -          & 
&  1.*coup2L*(coup3R*int3*mF1 + coup3L*(int2 + int3)*mF2)) + coup1L*(coup2R*MassEx2*(coup3L*(int3 + int4)& 
& *mF1 + coup3R*(int2 + int3 + int4)*mF2) - 1.*coup2L*(coup3L*int2*mF1*mF2 +             & 
&  coup3R*(int1 + int3*MassEx12 - 1.*int2*MassEx22 - 1.*int3*MassEx22 - 1.*int4*MassEx22 + int2*mS12))))
  OAh2qSR=OAh2qSR+chargefactor*(coup1L*MassEx1*(coup2L*coup3R*int4*MassEx2 -          & 
&  1.*coup2R*(coup3L*int3*mF1 + coup3R*(int2 + int3)*mF2)) + coup1R*(coup2L*MassEx2*(coup3R*(int3 + int4)& 
& *mF1 + coup3L*(int2 + int3 + int4)*mF2) - 1.*coup2R*(coup3R*int2*mF1*mF2 +             & 
&  coup3L*(int1 + int3*MassEx12 - 1.*int2*MassEx22 - 1.*int3*MassEx22 - 1.*int4*MassEx22 + int2*mS12))))
  End if 
End if 
   End Do 
  End Do 


 ! Loop particles: VWp,Fu,Fu
! Generic diagram: VFF,  InsertionOrder: 1
chargefactor = 1 
  Do i2=1,3
    Do i3=1,3
If ((MVWp2.gt.mf_l2(3)).Or.(MFu2(i2).gt.mf_l2(3)).Or.(MFu2(i3).gt.mf_l2(3))) Then
If (((i2.lt.4).and.(i3.lt.4)).or.(.not.OnlySM)) Then 
coup1L = cplcFuFdVWpL(i2,gt1)
coup1R = cplcFuFdVWpR(i2,gt1)
coup2L = cplcFdFucVWpL(gt2,i3)
coup2R = cplcFdFucVWpR(gt2,i3)
coup3L = cplcFuFuAhL(i3,i2)
coup3R = cplcFuFuAhR(i3,i2)
! Masses in loop
mV1 = MVWp
mV12 = MVWp2
mF1 = MFu(i2)
mF12 = MFu2(i2)
mF2 = MFu(i3)
mF22 = MFu2(i3)
! Amplitude 
  int1=B0(0._dp, mF12, mF22)
  int2=C0m(mF22, mF12, mV12)
  int3=C1m(mF22, mF12, mV12)
  int4=C2m(mF22, mF12, mV12)
  OAh2qSL=OAh2qSL+2.*chargefactor*(-1.*coup1R*coup2R*MassEx1*(coup3L*int3*mF1 +       & 
&  coup3R*(int2 + int3)*mF2) + coup1L*(coup2L*MassEx2*(coup3R*(int3 + int4)              & 
& *mF1 + coup3L*(int2 + int3 + int4)*mF2) + coup2R*(2.*coup3R*int2*mF1*mF2 -             & 
&  1.*coup3L*(Finite - 2.*int1 - 2.*int3*MassEx12 + 2.*int2*MassEx22 + 2.*int3*MassEx22 + 2.*int4*MassEx22 - 2.*int2*mV12))))
  OAh2qSR=OAh2qSR+2.*chargefactor*(-1.*coup1L*coup2L*MassEx1*(coup3R*int3*mF1 +       & 
&  coup3L*(int2 + int3)*mF2) + coup1R*(coup2R*MassEx2*(coup3L*(int3 + int4)              & 
& *mF1 + coup3R*(int2 + int3 + int4)*mF2) + coup2L*(2.*coup3L*int2*mF1*mF2 -             & 
&  1.*coup3R*(Finite - 2.*int1 - 2.*int3*MassEx12 + 2.*int2*MassEx22 + 2.*int3*MassEx22 + 2.*int4*MassEx22 - 2.*int2*mV12))))
  End if 
End if 
   End Do 
  End Do 


 ! Loop particles: VZ,Fd,Fd
! Generic diagram: VFF,  InsertionOrder: 1
chargefactor = 1 
  Do i2=1,3
    Do i3=1,3
If ((MVZ2.gt.mf_l2(3)).Or.(MFd2(i2).gt.mf_l2(3)).Or.(MFd2(i3).gt.mf_l2(3))) Then
If (((i2.lt.4).and.(i3.lt.4)).or.(.not.OnlySM)) Then 
coup1L = cplcFdFdVZL(i2,gt1)
coup1R = cplcFdFdVZR(i2,gt1)
coup2L = cplcFdFdVZL(gt2,i3)
coup2R = cplcFdFdVZR(gt2,i3)
coup3L = cplcFdFdAhL(i3,i2)
coup3R = cplcFdFdAhR(i3,i2)
! Masses in loop
mV1 = MVZ
mV12 = MVZ2
mF1 = MFd(i2)
mF12 = MFd2(i2)
mF2 = MFd(i3)
mF22 = MFd2(i3)
! Amplitude 
  int1=B0(0._dp, mF12, mF22)
  int2=C0m(mF22, mF12, mV12)
  int3=C1m(mF22, mF12, mV12)
  int4=C2m(mF22, mF12, mV12)
  OAh2qSL=OAh2qSL+2.*chargefactor*(-1.*coup1R*coup2R*MassEx1*(coup3L*int3*mF1 +       & 
&  coup3R*(int2 + int3)*mF2) + coup1L*(coup2L*MassEx2*(coup3R*(int3 + int4)              & 
& *mF1 + coup3L*(int2 + int3 + int4)*mF2) + coup2R*(2.*coup3R*int2*mF1*mF2 -             & 
&  1.*coup3L*(Finite - 2.*int1 - 2.*int3*MassEx12 + 2.*int2*MassEx22 + 2.*int3*MassEx22 + 2.*int4*MassEx22 - 2.*int2*mV12))))
  OAh2qSR=OAh2qSR+2.*chargefactor*(-1.*coup1L*coup2L*MassEx1*(coup3R*int3*mF1 +       & 
&  coup3L*(int2 + int3)*mF2) + coup1R*(coup2R*MassEx2*(coup3L*(int3 + int4)              & 
& *mF1 + coup3R*(int2 + int3 + int4)*mF2) + coup2L*(2.*coup3L*int2*mF1*mF2 -             & 
&  1.*coup3R*(Finite - 2.*int1 - 2.*int3*MassEx12 + 2.*int2*MassEx22 + 2.*int3*MassEx22 + 2.*int4*MassEx22 - 2.*int2*mV12))))
  End if 
End if 
   End Do 
  End Do 


 ! Loop particles: bar[Fd],hh,Ah
! Generic diagram: FSS,  InsertionOrder: 1
chargefactor = 1 
Do i1=1,3
If ((MFd2(i1).gt.mf_l2(3)).Or.(Mhh2.gt.mf_l2(3)).Or.(MAh2.gt.mf_l2(3))) Then
If (.not.OnlySM) Then 
coup1L = cplcFdFdhhL(i1,gt1)
coup1R = cplcFdFdhhR(i1,gt1)
coup2L = cplcFdFdAhL(gt2,i1)
coup2R = cplcFdFdAhR(gt2,i1)
coup3 = cplAhAhhh
! Masses in loop
mF1 = MFd(i1)
mF12 = MFd2(i1)
mS1 = Mhh
mS12 = Mhh2
mS2 = MAh
mS22 = MAh2
! Amplitude 
  int1=C0m(mF12, mS22, mS12)
  int2=C1m(mF12, mS22, mS12)
  int3=C2m(mF12, mS22, mS12)
  OAh2qSL=OAh2qSL+chargefactor*coup3*(coup1R*coup2L*int3*MassEx1 + coup1L*coup2R*int2*MassEx2 -& 
&  1.*coup1L*coup2L*int1*mF1)
  OAh2qSR=OAh2qSR+chargefactor*coup3*(coup1L*coup2R*int3*MassEx1 + coup1R*coup2L*int2*MassEx2 -& 
&  1.*coup1R*coup2R*int1*mF1)
  End if 
End if 
    End Do 


 ! Loop particles: bar[Fd],Ah,hh
! Generic diagram: FSS,  InsertionOrder: 1
chargefactor = 1 
Do i1=1,3
If ((MFd2(i1).gt.mf_l2(3)).Or.(MAh2.gt.mf_l2(3)).Or.(Mhh2.gt.mf_l2(3))) Then
If (.not.OnlySM) Then 
coup1L = cplcFdFdAhL(i1,gt1)
coup1R = cplcFdFdAhR(i1,gt1)
coup2L = cplcFdFdhhL(gt2,i1)
coup2R = cplcFdFdhhR(gt2,i1)
coup3 = cplAhAhhh
! Masses in loop
mF1 = MFd(i1)
mF12 = MFd2(i1)
mS1 = MAh
mS12 = MAh2
mS2 = Mhh
mS22 = Mhh2
! Amplitude 
  int1=C0m(mF12, mS22, mS12)
  int2=C1m(mF12, mS22, mS12)
  int3=C2m(mF12, mS22, mS12)
  OAh2qSL=OAh2qSL+chargefactor*coup3*(coup1R*coup2L*int3*MassEx1 + coup1L*coup2R*int2*MassEx2 -& 
&  1.*coup1L*coup2L*int1*mF1)
  OAh2qSR=OAh2qSR+chargefactor*coup3*(coup1L*coup2R*int3*MassEx1 + coup1R*coup2L*int2*MassEx2 -& 
&  1.*coup1R*coup2R*int1*mF1)
  End if 
End if 
    End Do 


 ! Loop particles: bar[Fd],VZ,hh
! Generic diagram: FVS,  InsertionOrder: 1
chargefactor = 1 
Do i1=1,3
If ((MFd2(i1).gt.mf_l2(3)).Or.(MVZ2.gt.mf_l2(3)).Or.(Mhh2.gt.mf_l2(3))) Then
If (.not.OnlySM) Then 
coup1L = cplcFdFdVZL(i1,gt1)
coup1R = cplcFdFdVZR(i1,gt1)
coup2L = cplcFdFdhhL(gt2,i1)
coup2R = cplcFdFdhhR(gt2,i1)
coup3 = -cplAhhhVZ
! Masses in loop
mF1 = MFd(i1)
mF12 = MFd2(i1)
mV1 = MVZ
mV12 = MVZ2
mS2 = Mhh
mS22 = Mhh2
! Amplitude 
  int1=B0(0._dp, mS22, mV12)
  int2=C0m(mF12, mS22, mV12)
  int3=C1m(mF12, mS22, mV12)
  int4=C2m(mF12, mS22, mV12)
  OAh2qSL=OAh2qSL+chargefactor*coup3*(coup1R*MassEx1*(coup2R*(int3 + 2.*int4)         & 
& *MassEx2 + coup2L*(-1.*int2 + int4)*mF1) + coup1L*(coup2R*(2.*int2 + int3)             & 
& *MassEx2*mF1 - 1.*coup2L*(int1 - 1.*int4*MassEx12 + 2.*int3*MassEx22 + int2*mF12)))
  OAh2qSR=OAh2qSR+chargefactor*coup3*(coup1L*MassEx1*(coup2L*(int3 + 2.*int4)         & 
& *MassEx2 + coup2R*(-1.*int2 + int4)*mF1) + coup1R*(coup2L*(2.*int2 + int3)             & 
& *MassEx2*mF1 - 1.*coup2R*(int1 - 1.*int4*MassEx12 + 2.*int3*MassEx22 + int2*mF12)))
  End if 
End if 
    End Do 


 ! Loop particles: bar[Fd],hh,VZ
! Generic diagram: FSV,  InsertionOrder: 1
chargefactor = 1 
Do i1=1,3
If ((MFd2(i1).gt.mf_l2(3)).Or.(Mhh2.gt.mf_l2(3)).Or.(MVZ2.gt.mf_l2(3))) Then
If (.not.OnlySM) Then 
coup1L = cplcFdFdhhL(i1,gt1)
coup1R = cplcFdFdhhR(i1,gt1)
coup2L = cplcFdFdVZL(gt2,i1)
coup2R = cplcFdFdVZR(gt2,i1)
coup3 = -cplAhhhVZ
! Masses in loop
mF1 = MFd(i1)
mF12 = MFd2(i1)
mS1 = Mhh
mS12 = Mhh2
mV2 = MVZ
mV22 = MVZ2
! Amplitude 
  int1=B0(0._dp, mS12, mV22)
  int2=C0m(mF12, mV22, mS12)
  int3=C1m(mF12, mV22, mS12)
  int4=C2m(mF12, mV22, mS12)
  OAh2qSL=OAh2qSL+chargefactor*coup3*(-1.*coup1R*MassEx1*(coup2L*(2.*int3 +           & 
&  int4)*MassEx2 + coup2R*(2.*int2 + int4)*mF1) + coup1L*(coup2L*(int2 - 1.*int3)        & 
& *MassEx2*mF1 + coup2R*(int1 + 2.*int4*MassEx12 - 1.*int3*MassEx22 + int2*mF12)))
  OAh2qSR=OAh2qSR+chargefactor*coup3*(-1.*coup1L*MassEx1*(coup2R*(2.*int3 +           & 
&  int4)*MassEx2 + coup2L*(2.*int2 + int4)*mF1) + coup1R*(coup2R*(int2 - 1.*int3)        & 
& *MassEx2*mF1 + coup2L*(int1 + 2.*int4*MassEx12 - 1.*int3*MassEx22 + int2*mF12)))
  End if 
End if 
    End Do 


 ! Loop particles: bar[Fu],conj[VWp],conj[Hp]
! Generic diagram: FVS,  InsertionOrder: 1
chargefactor = 1 
Do i1=1,3
If ((MFu2(i1).gt.mf_l2(3)).Or.(MVWp2.gt.mf_l2(3)).Or.(MHp2.gt.mf_l2(3))) Then
If (((i1.lt.4)).or.(.not.OnlySM)) Then 
coup1L = cplcFuFdVWpL(i1,gt1)
coup1R = cplcFuFdVWpR(i1,gt1)
coup2L = cplcFdFucHpL(gt2,i1)
coup2R = cplcFdFucHpR(gt2,i1)
coup3 = -cplAhHpcVWp
! Masses in loop
mF1 = MFu(i1)
mF12 = MFu2(i1)
mV1 = MVWp
mV12 = MVWp2
mS2 = MHp
mS22 = MHp2
! Amplitude 
  int1=B0(0._dp, mS22, mV12)
  int2=C0m(mF12, mS22, mV12)
  int3=C1m(mF12, mS22, mV12)
  int4=C2m(mF12, mS22, mV12)
  OAh2qSL=OAh2qSL+chargefactor*coup3*(coup1R*MassEx1*(coup2R*(int3 + 2.*int4)         & 
& *MassEx2 + coup2L*(-1.*int2 + int4)*mF1) + coup1L*(coup2R*(2.*int2 + int3)             & 
& *MassEx2*mF1 - 1.*coup2L*(int1 - 1.*int4*MassEx12 + 2.*int3*MassEx22 + int2*mF12)))
  OAh2qSR=OAh2qSR+chargefactor*coup3*(coup1L*MassEx1*(coup2L*(int3 + 2.*int4)         & 
& *MassEx2 + coup2R*(-1.*int2 + int4)*mF1) + coup1R*(coup2L*(2.*int2 + int3)             & 
& *MassEx2*mF1 - 1.*coup2R*(int1 - 1.*int4*MassEx12 + 2.*int3*MassEx22 + int2*mF12)))
  End if 
End if 
    End Do 


 ! Loop particles: bar[Fu],conj[Hp],conj[VWp]
! Generic diagram: FSV,  InsertionOrder: 1
chargefactor = 1 
Do i1=1,3
If ((MFu2(i1).gt.mf_l2(3)).Or.(MHp2.gt.mf_l2(3)).Or.(MVWp2.gt.mf_l2(3))) Then
If (((i1.lt.4)).or.(.not.OnlySM)) Then 
coup1L = cplcFuFdHpL(i1,gt1)
coup1R = cplcFuFdHpR(i1,gt1)
coup2L = cplcFdFucVWpL(gt2,i1)
coup2R = cplcFdFucVWpR(gt2,i1)
coup3 = -cplAhcHpVWp
! Masses in loop
mF1 = MFu(i1)
mF12 = MFu2(i1)
mS1 = MHp
mS12 = MHp2
mV2 = MVWp
mV22 = MVWp2
! Amplitude 
  int1=B0(0._dp, mS12, mV22)
  int2=C0m(mF12, mV22, mS12)
  int3=C1m(mF12, mV22, mS12)
  int4=C2m(mF12, mV22, mS12)
  OAh2qSL=OAh2qSL+chargefactor*coup3*(-1.*coup1R*MassEx1*(coup2L*(2.*int3 +           & 
&  int4)*MassEx2 + coup2R*(2.*int2 + int4)*mF1) + coup1L*(coup2L*(int2 - 1.*int3)        & 
& *MassEx2*mF1 + coup2R*(int1 + 2.*int4*MassEx12 - 1.*int3*MassEx22 + int2*mF12)))
  OAh2qSR=OAh2qSR+chargefactor*coup3*(-1.*coup1L*MassEx1*(coup2R*(2.*int3 +           & 
&  int4)*MassEx2 + coup2L*(2.*int2 + int4)*mF1) + coup1R*(coup2R*(int2 - 1.*int3)        & 
& *MassEx2*mF1 + coup2L*(int1 + 2.*int4*MassEx12 - 1.*int3*MassEx22 + int2*mF12)))
  End if 
End if 
    End Do 


 OAh2qSL=oo16pi2*OAh2qSL 
OAh2qSR=oo16pi2*OAh2qSR 
Iname=Iname-1

End Subroutine CalculateA2q 

Subroutine CalculateTreeSdulv(gt1,gt2,gt3,gt4,OnlySM,MAh,MAh2,MFd,MFd2,               & 
& MFe,MFe2,MFu,MFu2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,cplAhcHpVWp,cplAhHpcVWp,       & 
& cplcFdFdAhL,cplcFdFdAhR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZR,               & 
& cplcFdFucHpL,cplcFdFucHpR,cplcFdFucVWpL,cplcFdFucVWpR,cplcFeFeAhL,cplcFeFeAhR,         & 
& cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,cplcFeFeVZR,cplcFeFvcHpL,cplcFeFvcHpR,             & 
& cplcFeFvcVWpL,cplcFeFvcVWpR,cplcFuFdHpL,cplcFuFdHpR,cplcFuFdVWpL,cplcFuFdVWpR,         & 
& cplcFuFuAhL,cplcFuFuAhR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZL,cplcFuFuVZR,               & 
& cplcFvFeHpL,cplcFvFeHpR,cplcFvFeVWpL,cplcFvFeVWpR,cplcFvFvVZL,cplcFvFvVZR,             & 
& cplcHpVWpVZ,cplcVWpVWpVZ,cplhhcHpVWp,cplhhcVWpVWp,cplhhHpcHp,cplhhHpcVWp,              & 
& cplHpcHpVZ,cplHpcVWpVZ,TSOdulvSLL,TSOdulvSRR,TSOdulvSRL,TSOdulvSLR,TSOdulvVRR,         & 
& TSOdulvVLL,TSOdulvVRL,TSOdulvVLR)

! ---------------------------------------------------------------- 
! Code based on automatically generated SARAH extensions by 'PreSARAH' 
! Expressions for amplitudes are obtained by FeynArts/FormCalc 
! Based on user input for process TreeSdulv 
! 'PreSARAH' output has been generated  at 15:42 on 16.12.2015 
! ---------------------------------------------------------------- 
 
Implicit None 
Real(dp),Intent(in) :: MAh,MAh2,MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),Mhh,Mhh2,MHp,MHp2,              & 
& MVWp,MVWp2,MVZ,MVZ2

Complex(dp),Intent(in) :: cplAhcHpVWp,cplAhHpcVWp,cplcFdFdAhL(3,3),cplcFdFdAhR(3,3),cplcFdFdhhL(3,3),           & 
& cplcFdFdhhR(3,3),cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),cplcFdFucHpL(3,3),cplcFdFucHpR(3,3),& 
& cplcFdFucVWpL(3,3),cplcFdFucVWpR(3,3),cplcFeFeAhL(3,3),cplcFeFeAhR(3,3),               & 
& cplcFeFehhL(3,3),cplcFeFehhR(3,3),cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),cplcFeFvcHpL(3,3), & 
& cplcFeFvcHpR(3,3),cplcFeFvcVWpL(3,3),cplcFeFvcVWpR(3,3),cplcFuFdHpL(3,3),              & 
& cplcFuFdHpR(3,3),cplcFuFdVWpL(3,3),cplcFuFdVWpR(3,3),cplcFuFuAhL(3,3),cplcFuFuAhR(3,3),& 
& cplcFuFuhhL(3,3),cplcFuFuhhR(3,3),cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),cplcFvFeHpL(3,3),  & 
& cplcFvFeHpR(3,3),cplcFvFeVWpL(3,3),cplcFvFeVWpR(3,3),cplcFvFvVZL(3,3),cplcFvFvVZR(3,3),& 
& cplcHpVWpVZ,cplcVWpVWpVZ,cplhhcHpVWp,cplhhcVWpVWp,cplhhHpcHp,cplhhHpcVWp,              & 
& cplHpcHpVZ,cplHpcVWpVZ

Integer,Intent(in) :: gt1, gt2,gt3,gt4 
Logical, Intent(in) :: OnlySM 
Integer :: iprop, i1, i2, i3, i4 
Real(dp) :: MassEx1,MassEx2,MassEx3,MassEx4, MassEx12,MassEx22,MassEx32,MassEx42 
Complex(dp), Intent(out) :: TSOdulvSLL 
Complex(dp), Intent(out) :: TSOdulvSRR 
Complex(dp), Intent(out) :: TSOdulvSRL 
Complex(dp), Intent(out) :: TSOdulvSLR 
Complex(dp), Intent(out) :: TSOdulvVRR 
Complex(dp), Intent(out) :: TSOdulvVLL 
Complex(dp), Intent(out) :: TSOdulvVRL 
Complex(dp), Intent(out) :: TSOdulvVLR 
Complex(dp) :: vertex1L, vertex1R, vertex2L, vertex2R 
Real(dp) ::  MP, MP2, IMP2, IMP, MFin, MFin2, IMFin, IMFin2, Finite  
Real(dp) ::  MS1, MS12, MS2, MS22, MF1, MF12, MF2, MF22, MV1, MV12, MV2, MV22  
Complex(dp) ::  chargefactor  
Complex(dp) ::  coup1L, coup1R, coup2L, coup2R, coup3L, coup3R, coup3, coup4L, coup4R 

Complex(dp) ::  int1,int2,int3,int4,int5,int6,int7,int8 

Iname=Iname+1 
NameOfUnit(Iname)='CalculateTreeSdulv' 

Finite=1._dp 
MassEx1=MFd(gt1)  
MassEx12=MFd2(gt1) 
MassEx2=MFu(gt2)  
MassEx22=MFu2(gt2) 
MassEx3=0._dp  
MassEx32=0._dp 
MassEx4=MFe(gt4)  
MassEx42=MFe2(gt4) 
! ------------------------------ 
 ! Amplitudes for external states 
 ! {DownQuark, bar[UpQuark], Neutrino, bar[ChargedLepton]} 
 ! ------------------------------ 
 
TSOdulvSLL=0._dp 
TSOdulvSRR=0._dp 
TSOdulvSRL=0._dp 
TSOdulvSLR=0._dp 
TSOdulvVRR=0._dp 
TSOdulvVLL=0._dp 
TSOdulvVRL=0._dp 
TSOdulvVLR=0._dp 
!---------------------------------------- 
! Scalar Tree Contributions            
!---------------------------------------- 
! -- Hp - Tree            
! Propagator: VZ
! InsertionOrder: 1
chargefactor = 1 
If ((OnlySM).or.(.not.OnlySM)) Then 
coup1L = cplcFuFdHpL(gt2,gt1)
coup1R = cplcFuFdHpR(gt2,gt1)
coup2L = cplcFeFvcHpL(gt4,gt3)
coup2R = cplcFeFvcHpR(gt4,gt3)
! Propagator and inverse propagator mass 
MP = MHp
MP2 = MHp2
IMP = 1._dp/MP  
IMP2 = 1._dp/MP2 
! Amplitude 
  TSOdulvSLL=TSOdulvSLL+ coup1L*coup2L*IMP2
  TSOdulvSRR=TSOdulvSRR+ coup1R*coup2R*IMP2
  TSOdulvSRL=TSOdulvSRL+ coup1R*coup2L*IMP2
  TSOdulvSLR=TSOdulvSLR+ coup1L*coup2R*IMP2
  TSOdulvVRR=TSOdulvVRR+ 0.
  TSOdulvVLL=TSOdulvVLL+ 0.
  TSOdulvVRL=TSOdulvVRL+ 0.
  TSOdulvVLR=TSOdulvVLR+ 0.
 End if 


 Iname=Iname-1

End Subroutine CalculateTreeSdulv 

Subroutine CalculateTreeVdulv(gt1,gt2,gt3,gt4,OnlySM,MAh,MAh2,MFd,MFd2,               & 
& MFe,MFe2,MFu,MFu2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,cplAhcHpVWp,cplAhHpcVWp,       & 
& cplcFdFdAhL,cplcFdFdAhR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZR,               & 
& cplcFdFucHpL,cplcFdFucHpR,cplcFdFucVWpL,cplcFdFucVWpR,cplcFeFeAhL,cplcFeFeAhR,         & 
& cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,cplcFeFeVZR,cplcFeFvcHpL,cplcFeFvcHpR,             & 
& cplcFeFvcVWpL,cplcFeFvcVWpR,cplcFuFdHpL,cplcFuFdHpR,cplcFuFdVWpL,cplcFuFdVWpR,         & 
& cplcFuFuAhL,cplcFuFuAhR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZL,cplcFuFuVZR,               & 
& cplcFvFeHpL,cplcFvFeHpR,cplcFvFeVWpL,cplcFvFeVWpR,cplcFvFvVZL,cplcFvFvVZR,             & 
& cplcHpVWpVZ,cplcVWpVWpVZ,cplhhcHpVWp,cplhhcVWpVWp,cplhhHpcHp,cplhhHpcVWp,              & 
& cplHpcHpVZ,cplHpcVWpVZ,TVOdulvSLL,TVOdulvSRR,TVOdulvSRL,TVOdulvSLR,TVOdulvVRR,         & 
& TVOdulvVLL,TVOdulvVRL,TVOdulvVLR)

! ---------------------------------------------------------------- 
! Code based on automatically generated SARAH extensions by 'PreSARAH' 
! Expressions for amplitudes are obtained by FeynArts/FormCalc 
! Based on user input for process TreeVdulv 
! 'PreSARAH' output has been generated  at 15:42 on 16.12.2015 
! ---------------------------------------------------------------- 
 
Implicit None 
Real(dp),Intent(in) :: MAh,MAh2,MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),Mhh,Mhh2,MHp,MHp2,              & 
& MVWp,MVWp2,MVZ,MVZ2

Complex(dp),Intent(in) :: cplAhcHpVWp,cplAhHpcVWp,cplcFdFdAhL(3,3),cplcFdFdAhR(3,3),cplcFdFdhhL(3,3),           & 
& cplcFdFdhhR(3,3),cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),cplcFdFucHpL(3,3),cplcFdFucHpR(3,3),& 
& cplcFdFucVWpL(3,3),cplcFdFucVWpR(3,3),cplcFeFeAhL(3,3),cplcFeFeAhR(3,3),               & 
& cplcFeFehhL(3,3),cplcFeFehhR(3,3),cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),cplcFeFvcHpL(3,3), & 
& cplcFeFvcHpR(3,3),cplcFeFvcVWpL(3,3),cplcFeFvcVWpR(3,3),cplcFuFdHpL(3,3),              & 
& cplcFuFdHpR(3,3),cplcFuFdVWpL(3,3),cplcFuFdVWpR(3,3),cplcFuFuAhL(3,3),cplcFuFuAhR(3,3),& 
& cplcFuFuhhL(3,3),cplcFuFuhhR(3,3),cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),cplcFvFeHpL(3,3),  & 
& cplcFvFeHpR(3,3),cplcFvFeVWpL(3,3),cplcFvFeVWpR(3,3),cplcFvFvVZL(3,3),cplcFvFvVZR(3,3),& 
& cplcHpVWpVZ,cplcVWpVWpVZ,cplhhcHpVWp,cplhhcVWpVWp,cplhhHpcHp,cplhhHpcVWp,              & 
& cplHpcHpVZ,cplHpcVWpVZ

Integer,Intent(in) :: gt1, gt2,gt3,gt4 
Logical, Intent(in) :: OnlySM 
Integer :: iprop, i1, i2, i3, i4 
Real(dp) :: MassEx1,MassEx2,MassEx3,MassEx4, MassEx12,MassEx22,MassEx32,MassEx42 
Complex(dp), Intent(out) :: TVOdulvSLL 
Complex(dp), Intent(out) :: TVOdulvSRR 
Complex(dp), Intent(out) :: TVOdulvSRL 
Complex(dp), Intent(out) :: TVOdulvSLR 
Complex(dp), Intent(out) :: TVOdulvVRR 
Complex(dp), Intent(out) :: TVOdulvVLL 
Complex(dp), Intent(out) :: TVOdulvVRL 
Complex(dp), Intent(out) :: TVOdulvVLR 
Complex(dp) :: vertex1L, vertex1R, vertex2L, vertex2R 
Real(dp) ::  MP, MP2, IMP2, IMP, MFin, MFin2, IMFin, IMFin2, Finite  
Real(dp) ::  MS1, MS12, MS2, MS22, MF1, MF12, MF2, MF22, MV1, MV12, MV2, MV22  
Complex(dp) ::  chargefactor  
Complex(dp) ::  coup1L, coup1R, coup2L, coup2R, coup3L, coup3R, coup3, coup4L, coup4R 

Complex(dp) ::  int1,int2,int3,int4,int5,int6,int7,int8 

Iname=Iname+1 
NameOfUnit(Iname)='CalculateTreeVdulv' 

Finite=1._dp 
MassEx1=MFd(gt1)  
MassEx12=MFd2(gt1) 
MassEx2=MFu(gt2)  
MassEx22=MFu2(gt2) 
MassEx3=0._dp  
MassEx32=0._dp 
MassEx4=MFe(gt4)  
MassEx42=MFe2(gt4) 
! ------------------------------ 
 ! Amplitudes for external states 
 ! {DownQuark, bar[UpQuark], Neutrino, bar[ChargedLepton]} 
 ! ------------------------------ 
 
TVOdulvSLL=0._dp 
TVOdulvSRR=0._dp 
TVOdulvSRL=0._dp 
TVOdulvSLR=0._dp 
TVOdulvVRR=0._dp 
TVOdulvVLL=0._dp 
TVOdulvVRL=0._dp 
TVOdulvVLR=0._dp 
!---------------------------------------- 
! Vector Tree Contributions            
!---------------------------------------- 
! -- VWp - Tree            
! Propagator: VZ
! InsertionOrder: 1
chargefactor = 1 
If ((OnlySM).or.(.not.OnlySM)) Then 
coup1L = cplcFuFdVWpL(gt2,gt1)
coup1R = cplcFuFdVWpR(gt2,gt1)
coup2L = cplcFeFvcVWpL(gt4,gt3)
coup2R = cplcFeFvcVWpR(gt4,gt3)
! Propagator and inverse propagator mass 
MP = MVWp
MP2 = MVWp2
IMP = 1._dp/MP  
IMP2 = 1._dp/MP2 
! Amplitude 
  TVOdulvSLL=TVOdulvSLL+ 0.
  TVOdulvSRR=TVOdulvSRR+ 0.
  TVOdulvSRL=TVOdulvSRL+ 0.
  TVOdulvSLR=TVOdulvSLR+ 0.
  TVOdulvVRR=TVOdulvVRR+ coup1R*coup2L*IMP2
  TVOdulvVLL=TVOdulvVLL+ coup1L*coup2R*IMP2
  TVOdulvVRL=TVOdulvVRL+ coup1R*coup2R*IMP2
  TVOdulvVLR=TVOdulvVLR+ coup1L*coup2L*IMP2
 End if 


 Iname=Iname-1

End Subroutine CalculateTreeVdulv 

Subroutine CalculateGamma2Q(gt1,gt2,gt3,OnlySM,MAh,MAh2,MFd,MFd2,MFu,MFu2,            & 
& Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,cplcFdFdAhL,cplcFdFdAhR,cplcFdFdhhL,             & 
& cplcFdFdhhR,cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,cplcFdFucHpL,              & 
& cplcFdFucHpR,cplcFdFucVWpL,cplcFdFucVWpR,cplcFuFdHpL,cplcFuFdHpR,cplcFuFdVWpL,         & 
& cplcFuFdVWpR,cplcFuFuVPL,cplcFuFuVPR,cplcHpVPVWp,cplcVWpVPVWp,cplHpcHpVP,              & 
& cplHpcVWpVP,OA2qSL,OA2qSR,OA2qVL,OA2qVR)

! ---------------------------------------------------------------- 
! Code based on automatically generated SARAH extensions by 'PreSARAH' 
! Expressions for amplitudes are obtained by FeynArts/FormCalc 
! Based on user input for process Gamma2Q 
! 'PreSARAH' output has been generated  at 15:35 on 16.12.2015 
! ---------------------------------------------------------------- 
 
Implicit None 
Real(dp),Intent(in) :: MAh,MAh2,MFd(3),MFd2(3),MFu(3),MFu2(3),Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2

Complex(dp),Intent(in) :: cplcFdFdAhL(3,3),cplcFdFdAhR(3,3),cplcFdFdhhL(3,3),cplcFdFdhhR(3,3),cplcFdFdVPL(3,3), & 
& cplcFdFdVPR(3,3),cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),cplcFdFucHpL(3,3),cplcFdFucHpR(3,3),& 
& cplcFdFucVWpL(3,3),cplcFdFucVWpR(3,3),cplcFuFdHpL(3,3),cplcFuFdHpR(3,3),               & 
& cplcFuFdVWpL(3,3),cplcFuFdVWpR(3,3),cplcFuFuVPL(3,3),cplcFuFuVPR(3,3),cplcHpVPVWp,     & 
& cplcVWpVPVWp,cplHpcHpVP,cplHpcVWpVP

Integer,Intent(in) :: gt1, gt2,gt3 
Integer :: gt4 
Logical, Intent(in) :: OnlySM 
Integer :: iprop, i1, i2, i3, i4 
Real(dp) :: MassEx1,MassEx2,MassEx3,MassEx12,MassEx22,MassEx32 
Complex(dp), Intent(out) :: OA2qSL 
Complex(dp), Intent(out) :: OA2qSR 
Complex(dp), Intent(out) :: OA2qVL 
Complex(dp), Intent(out) :: OA2qVR 
Real(dp) ::  MP, MP2, IMP2, IMP, MFin, MFin2, IMFin, IMFin2, Finite  
Real(dp) ::  MS1, MS12, MS2, MS22, MF1, MF12, MF2, MF22, MV1, MV12, MV2, MV22  
Complex(dp) ::  chargefactor  
Complex(dp) ::  coup1L, coup1R, coup2L, coup2R, coup3L, coup3R, coup3, coup4L, coup4R 

Complex(dp) ::  int1,int2,int3,int4,int5,int6,int7,int8 

Iname=Iname+1 
NameOfUnit(Iname)='CalculateGamma2Q' 

Finite=1._dp 
MassEx1=MFd(gt1)  
MassEx12=MFd2(gt1) 
MassEx2=MFd(gt2)  
MassEx22=MFd2(gt2) 
MassEx3=0._dp  
MassEx32=0._dp 
! ------------------------------ 
 ! Amplitudes for external states 
 ! {bar[BottomQuark], BottomQuark, Photon} 
 ! ------------------------------ 
 
OA2qSL=0._dp 
OA2qSR=0._dp 
OA2qVL=0._dp 
OA2qVR=0._dp 
!---------------------------------------- 
! Tree Contributions                      
!---------------------------------------- 
chargefactor = 1 
If ((OnlySM).or.(.not.OnlySM)) Then 
coup1L = cplcFdFdVPL(gt1,gt2)
coup1R = cplcFdFdVPR(gt1,gt2)
! Amplitude 
  OA2qSL=OA2qSL+ 0.
  OA2qSR=OA2qSR+ 0.
  OA2qVL=OA2qVL+ 0.
  OA2qVR=OA2qVR+ 0.
 End if 


 !---------------------------------------- 
! Wave Contributions                      
!---------------------------------------- 
! Loop particles: Ah,bar[Fd], Internal fermion: Fd
! Generic diagram: SFF,  InsertionOrder: 1
chargefactor = 1 
  Do i2=1,3
    Do i3=1,3
If ((MAh2.gt.mf_l2(3)).Or.(MFd2(i2).gt.mf_l2(3))) Then
If (((i2.lt.4).and.(i3.lt.4)).or.(.not.OnlySM)) Then 
coup1L = cplcFdFdAhL(gt1,i2)
coup1R = cplcFdFdAhR(gt1,i2)
coup2L = cplcFdFdAhL(i2,i3)
coup2R = cplcFdFdAhR(i2,i3)
coup3L = -cplcFdFdVPR(i3,gt2)
coup3R = -cplcFdFdVPL(i3,gt2)
! Masses in loop
mS1 = MAh
mS12 = MAh2
mF1 = MFd(i2)
mF12 = MFd2(i2)
! Mass of internal fermion 
MFin = MFd(i3)-MFd(gt1)
MFin2 = MFd2(i3)-MFd2(gt1)
If (Abs(MFin).gt.10E-10_dp) Then 
MFin = MFd(i3)
MFin2 = MFd2(i3)
! Amplitude 
  int1=B0(MassEx12, mF12, mS12)
  int2=B1(MassEx12, mF12, mS12)
  OA2qSL=OA2qSL+0.
  OA2qSR=OA2qSR+0.
  OA2qVL=OA2qVL+(chargefactor*coup3L*(-1.*coup1L*coup2R*int2*MassEx12 +               & 
&  coup1R*coup2R*int1*MassEx1*mF1 - 1.*coup1R*coup2L*int2*MassEx1*MFin + coup1L*coup2L*int1*mF1*MFin))& 
& /(MassEx12 - 1.*MFin2)
  OA2qVR=OA2qVR+(chargefactor*coup3R*(-1.*coup1R*coup2L*int2*MassEx12 +               & 
&  coup1L*coup2L*int1*MassEx1*mF1 - 1.*coup1L*coup2R*int2*MassEx1*MFin + coup1R*coup2R*int1*mF1*MFin))& 
& /(MassEx12 - 1.*MFin2)
     End if 
  End if 
End if 
   End Do 
  End Do 


 ! Loop particles: Fd,hh, Internal fermion: Fd
! Generic diagram: FSF,  InsertionOrder: 1
chargefactor = 1 
Do i1=1,3
    Do i3=1,3
If ((MFd2(i1).gt.mf_l2(3)).Or.(Mhh2.gt.mf_l2(3))) Then
If (.not.OnlySM) Then 
coup1L = cplcFdFdhhL(gt1,i1)
coup1R = cplcFdFdhhR(gt1,i1)
coup2L = cplcFdFdhhL(i1,i3)
coup2R = cplcFdFdhhR(i1,i3)
coup3L = -cplcFdFdVPR(i3,gt2)
coup3R = -cplcFdFdVPL(i3,gt2)
! Masses in loop
mF1 = MFd(i1)
mF12 = MFd2(i1)
mS1 = Mhh
mS12 = Mhh2
! Mass of internal fermion 
MFin = MFd(i3)-MFd(gt1)
MFin2 = MFd2(i3)-MFd2(gt1)
If (Abs(MFin).gt.10E-10_dp) Then 
MFin = MFd(i3)
MFin2 = MFd2(i3)
! Amplitude 
  int1=B0(MassEx12, mF12, mS12)
  int2=B1(MassEx12, mF12, mS12)
  OA2qSL=OA2qSL+0.
  OA2qSR=OA2qSR+0.
  OA2qVL=OA2qVL+(chargefactor*coup3L*(-1.*coup1L*coup2R*int2*MassEx12 +               & 
&  coup1R*coup2R*int1*MassEx1*mF1 - 1.*coup1R*coup2L*int2*MassEx1*MFin + coup1L*coup2L*int1*mF1*MFin))& 
& /(MassEx12 - 1.*MFin2)
  OA2qVR=OA2qVR+(chargefactor*coup3R*(-1.*coup1R*coup2L*int2*MassEx12 +               & 
&  coup1L*coup2L*int1*MassEx1*mF1 - 1.*coup1L*coup2R*int2*MassEx1*MFin + coup1R*coup2R*int1*mF1*MFin))& 
& /(MassEx12 - 1.*MFin2)
     End if 
  End if 
End if 
    End Do 
  End Do 


 ! Loop particles: Fd,VZ, Internal fermion: Fd
! Generic diagram: FVF,  InsertionOrder: 1
chargefactor = 1 
Do i1=1,3
    Do i3=1,3
If ((MFd2(i1).gt.mf_l2(3)).Or.(MVZ2.gt.mf_l2(3))) Then
If (((i1.lt.4).and.(i3.lt.4)).or.(.not.OnlySM)) Then 
coup1L = -cplcFdFdVZR(gt1,i1)
coup1R = -cplcFdFdVZL(gt1,i1)
coup2L = -cplcFdFdVZR(i1,i3)
coup2R = -cplcFdFdVZL(i1,i3)
coup3L = -cplcFdFdVPR(i3,gt2)
coup3R = -cplcFdFdVPL(i3,gt2)
! Masses in loop
mF1 = MFd(i1)
mF12 = MFd2(i1)
mV1 = MVZ
mV12 = MVZ2
! Mass of internal fermion 
MFin = MFd(i3)-MFd(gt1)
MFin2 = MFd2(i3)-MFd2(gt1)
If (Abs(MFin).gt.10E-10_dp) Then 
MFin = MFd(i3)
MFin2 = MFd2(i3)
! Amplitude 
  int1=B0(MassEx12, mF12, mV12)
  int2=B1(MassEx12, mF12, mV12)
  OA2qSL=OA2qSL+0.
  OA2qSR=OA2qSR+0.
  OA2qVL=OA2qVL+(-1.*chargefactor*coup3L*(coup1R*MassEx1*(-2.*coup2L*(Finite - 2.*int1)& 
& *mF1 + coup2R*(Finite + 2.*int2)*MFin) + coup1L*(coup2L*(Finite + 2.*int2)             & 
& *MassEx12 - 2.*coup2R*(Finite - 2.*int1)*mF1*MFin)))/(MassEx12 - 1.*MFin2)
  OA2qVR=OA2qVR+(-1.*chargefactor*coup3R*(coup1L*MassEx1*(-2.*coup2R*(Finite - 2.*int1)& 
& *mF1 + coup2L*(Finite + 2.*int2)*MFin) + coup1R*(coup2R*(Finite + 2.*int2)             & 
& *MassEx12 - 2.*coup2L*(Finite - 2.*int1)*mF1*MFin)))/(MassEx12 - 1.*MFin2)
     End if 
  End if 
End if 
    End Do 
  End Do 


 ! Loop particles: Fu,Hp, Internal fermion: Fd
! Generic diagram: FSF,  InsertionOrder: 1
chargefactor = 1 
Do i1=1,3
    Do i3=1,3
If ((MFu2(i1).gt.mf_l2(3)).Or.(MHp2.gt.mf_l2(3))) Then
If (((i1.lt.4).and.(i3.lt.4)).or.(.not.OnlySM)) Then 
coup1L = cplcFdFucHpL(gt1,i1)
coup1R = cplcFdFucHpR(gt1,i1)
coup2L = cplcFuFdHpL(i1,i3)
coup2R = cplcFuFdHpR(i1,i3)
coup3L = -cplcFdFdVPR(i3,gt2)
coup3R = -cplcFdFdVPL(i3,gt2)
! Masses in loop
mF1 = MFu(i1)
mF12 = MFu2(i1)
mS1 = MHp
mS12 = MHp2
! Mass of internal fermion 
MFin = MFd(i3)-MFd(gt1)
MFin2 = MFd2(i3)-MFd2(gt1)
If (Abs(MFin).gt.10E-10_dp) Then 
MFin = MFd(i3)
MFin2 = MFd2(i3)
! Amplitude 
  int1=B0(MassEx12, mF12, mS12)
  int2=B1(MassEx12, mF12, mS12)
  OA2qSL=OA2qSL+0.
  OA2qSR=OA2qSR+0.
  OA2qVL=OA2qVL+(chargefactor*coup3L*(-1.*coup1L*coup2R*int2*MassEx12 +               & 
&  coup1R*coup2R*int1*MassEx1*mF1 - 1.*coup1R*coup2L*int2*MassEx1*MFin + coup1L*coup2L*int1*mF1*MFin))& 
& /(MassEx12 - 1.*MFin2)
  OA2qVR=OA2qVR+(chargefactor*coup3R*(-1.*coup1R*coup2L*int2*MassEx12 +               & 
&  coup1L*coup2L*int1*MassEx1*mF1 - 1.*coup1L*coup2R*int2*MassEx1*MFin + coup1R*coup2R*int1*mF1*MFin))& 
& /(MassEx12 - 1.*MFin2)
     End if 
  End if 
End if 
    End Do 
  End Do 


 ! Loop particles: Fu,VWp, Internal fermion: Fd
! Generic diagram: FVF,  InsertionOrder: 1
chargefactor = 1 
Do i1=1,3
    Do i3=1,3
If ((MFu2(i1).gt.mf_l2(3)).Or.(MVWp2.gt.mf_l2(3))) Then
If (((i1.lt.4).and.(i3.lt.4)).or.(.not.OnlySM)) Then 
coup1L = -cplcFdFucVWpR(gt1,i1)
coup1R = -cplcFdFucVWpL(gt1,i1)
coup2L = -cplcFuFdVWpR(i1,i3)
coup2R = -cplcFuFdVWpL(i1,i3)
coup3L = -cplcFdFdVPR(i3,gt2)
coup3R = -cplcFdFdVPL(i3,gt2)
! Masses in loop
mF1 = MFu(i1)
mF12 = MFu2(i1)
mV1 = MVWp
mV12 = MVWp2
! Mass of internal fermion 
MFin = MFd(i3)-MFd(gt1)
MFin2 = MFd2(i3)-MFd2(gt1)
If (Abs(MFin).gt.10E-10_dp) Then 
MFin = MFd(i3)
MFin2 = MFd2(i3)
! Amplitude 
  int1=B0(MassEx12, mF12, mV12)
  int2=B1(MassEx12, mF12, mV12)
  OA2qSL=OA2qSL+0.
  OA2qSR=OA2qSR+0.
  OA2qVL=OA2qVL+(-1.*chargefactor*coup3L*(coup1R*MassEx1*(-2.*coup2L*(Finite - 2.*int1)& 
& *mF1 + coup2R*(Finite + 2.*int2)*MFin) + coup1L*(coup2L*(Finite + 2.*int2)             & 
& *MassEx12 - 2.*coup2R*(Finite - 2.*int1)*mF1*MFin)))/(MassEx12 - 1.*MFin2)
  OA2qVR=OA2qVR+(-1.*chargefactor*coup3R*(coup1L*MassEx1*(-2.*coup2R*(Finite - 2.*int1)& 
& *mF1 + coup2L*(Finite + 2.*int2)*MFin) + coup1R*(coup2R*(Finite + 2.*int2)             & 
& *MassEx12 - 2.*coup2L*(Finite - 2.*int1)*mF1*MFin)))/(MassEx12 - 1.*MFin2)
     End if 
  End if 
End if 
    End Do 
  End Do 


 ! Loop particles: bar[Fd],Ah, Internal fermion: bar[Fd]
! Generic diagram: FSF,  InsertionOrder: 2
chargefactor = 1 
Do i1=1,3
    Do i3=1,3
If ((MFd2(i1).gt.mf_l2(3)).Or.(MAh2.gt.mf_l2(3))) Then
If (((i1.lt.4).and.(i3.lt.4)).or.(.not.OnlySM)) Then 
coup3L = -cplcFdFdVPR(gt1,i3)
coup3R = -cplcFdFdVPL(gt1,i3)
coup2L = cplcFdFdAhL(i3,i1)
coup2R = cplcFdFdAhR(i3,i1)
coup1L = cplcFdFdAhL(i1,gt2)
coup1R = cplcFdFdAhR(i1,gt2)
! Masses in loop
mF1 = MFd(i1)
mF12 = MFd2(i1)
mS1 = MAh
mS12 = MAh2
! Mass of internal fermion 
MFin = MFd(i3)-MFd(gt2)
MFin2 = MFd2(i3)-MFd2(gt2)
If (Abs(MFin).gt.10E-10_dp) Then 
MFin = MFd(i3)
MFin2 = MFd2(i3)
! Amplitude 
  int1=B0(MassEx22, mF12, mS12)
  int2=B1(MassEx22, mF12, mS12)
  OA2qSL=OA2qSL+0.
  OA2qSR=OA2qSR+0.
  OA2qVL=OA2qVL+(chargefactor*coup3L*(-1.*coup1R*coup2L*int2*MassEx22 +               & 
&  coup1L*coup2L*int1*MassEx2*mF1 - 1.*coup1L*coup2R*int2*MassEx2*MFin + coup1R*coup2R*int1*mF1*MFin))& 
& /(MassEx22 - 1.*MFin2)
  OA2qVR=OA2qVR+(chargefactor*coup3R*(-1.*coup1L*coup2R*int2*MassEx22 +               & 
&  coup1R*coup2R*int1*MassEx2*mF1 - 1.*coup1R*coup2L*int2*MassEx2*MFin + coup1L*coup2L*int1*mF1*MFin))& 
& /(MassEx22 - 1.*MFin2)
     End if 
  End if 
End if 
    End Do 
  End Do 


 ! Loop particles: hh,Fd, Internal fermion: bar[Fd]
! Generic diagram: SFF,  InsertionOrder: 2
chargefactor = 1 
  Do i2=1,3
    Do i3=1,3
If ((Mhh2.gt.mf_l2(3)).Or.(MFd2(i2).gt.mf_l2(3))) Then
If (.not.OnlySM) Then 
coup3L = -cplcFdFdVPR(gt1,i3)
coup3R = -cplcFdFdVPL(gt1,i3)
coup2L = cplcFdFdhhL(i3,i2)
coup2R = cplcFdFdhhR(i3,i2)
coup1L = cplcFdFdhhL(i2,gt2)
coup1R = cplcFdFdhhR(i2,gt2)
! Masses in loop
mS1 = Mhh
mS12 = Mhh2
mF1 = MFd(i2)
mF12 = MFd2(i2)
! Mass of internal fermion 
MFin = MFd(i3)-MFd(gt2)
MFin2 = MFd2(i3)-MFd2(gt2)
If (Abs(MFin).gt.10E-10_dp) Then 
MFin = MFd(i3)
MFin2 = MFd2(i3)
! Amplitude 
  int1=B0(MassEx22, mF12, mS12)
  int2=B1(MassEx22, mF12, mS12)
  OA2qSL=OA2qSL+0.
  OA2qSR=OA2qSR+0.
  OA2qVL=OA2qVL+(chargefactor*coup3L*(-1.*coup1R*coup2L*int2*MassEx22 +               & 
&  coup1L*coup2L*int1*MassEx2*mF1 - 1.*coup1L*coup2R*int2*MassEx2*MFin + coup1R*coup2R*int1*mF1*MFin))& 
& /(MassEx22 - 1.*MFin2)
  OA2qVR=OA2qVR+(chargefactor*coup3R*(-1.*coup1L*coup2R*int2*MassEx22 +               & 
&  coup1R*coup2R*int1*MassEx2*mF1 - 1.*coup1R*coup2L*int2*MassEx2*MFin + coup1L*coup2L*int1*mF1*MFin))& 
& /(MassEx22 - 1.*MFin2)
     End if 
  End if 
End if 
   End Do 
  End Do 


 ! Loop particles: VZ,Fd, Internal fermion: bar[Fd]
! Generic diagram: VFF,  InsertionOrder: 2
chargefactor = 1 
  Do i2=1,3
    Do i3=1,3
If ((MVZ2.gt.mf_l2(3)).Or.(MFd2(i2).gt.mf_l2(3))) Then
If (((i2.lt.4).and.(i3.lt.4)).or.(.not.OnlySM)) Then 
coup3L = -cplcFdFdVPR(gt1,i3)
coup3R = -cplcFdFdVPL(gt1,i3)
coup2L = -cplcFdFdVZR(i3,i2)
coup2R = -cplcFdFdVZL(i3,i2)
coup1L = -cplcFdFdVZR(i2,gt2)
coup1R = -cplcFdFdVZL(i2,gt2)
! Masses in loop
mV1 = MVZ
mV12 = MVZ2
mF1 = MFd(i2)
mF12 = MFd2(i2)
! Mass of internal fermion 
MFin = MFd(i3)-MFd(gt2)
MFin2 = MFd2(i3)-MFd2(gt2)
If (Abs(MFin).gt.10E-10_dp) Then 
MFin = MFd(i3)
MFin2 = MFd2(i3)
! Amplitude 
  int1=B0(MassEx22, mF12, mV12)
  int2=B1(MassEx22, mF12, mV12)
  OA2qSL=OA2qSL+0.
  OA2qSR=OA2qSR+0.
  OA2qVL=OA2qVL+(-1.*chargefactor*coup3L*(coup1R*MassEx2*(-2.*coup2L*(Finite - 2.*int1)& 
& *mF1 + coup2R*(Finite + 2.*int2)*MFin) + coup1L*(coup2L*(Finite + 2.*int2)             & 
& *MassEx22 - 2.*coup2R*(Finite - 2.*int1)*mF1*MFin)))/(MassEx22 - 1.*MFin2)
  OA2qVR=OA2qVR+(-1.*chargefactor*coup3R*(coup1L*MassEx2*(-2.*coup2R*(Finite - 2.*int1)& 
& *mF1 + coup2L*(Finite + 2.*int2)*MFin) + coup1R*(coup2R*(Finite + 2.*int2)             & 
& *MassEx22 - 2.*coup2L*(Finite - 2.*int1)*mF1*MFin)))/(MassEx22 - 1.*MFin2)
     End if 
  End if 
End if 
   End Do 
  End Do 


 ! Loop particles: Hp,Fu, Internal fermion: bar[Fd]
! Generic diagram: SFF,  InsertionOrder: 2
chargefactor = 1 
  Do i2=1,3
    Do i3=1,3
If ((MHp2.gt.mf_l2(3)).Or.(MFu2(i2).gt.mf_l2(3))) Then
If (((i2.lt.4).and.(i3.lt.4)).or.(.not.OnlySM)) Then 
coup3L = -cplcFdFdVPR(gt1,i3)
coup3R = -cplcFdFdVPL(gt1,i3)
coup2L = cplcFdFucHpL(i3,i2)
coup2R = cplcFdFucHpR(i3,i2)
coup1L = cplcFuFdHpL(i2,gt2)
coup1R = cplcFuFdHpR(i2,gt2)
! Masses in loop
mS1 = MHp
mS12 = MHp2
mF1 = MFu(i2)
mF12 = MFu2(i2)
! Mass of internal fermion 
MFin = MFd(i3)-MFd(gt2)
MFin2 = MFd2(i3)-MFd2(gt2)
If (Abs(MFin).gt.10E-10_dp) Then 
MFin = MFd(i3)
MFin2 = MFd2(i3)
! Amplitude 
  int1=B0(MassEx22, mF12, mS12)
  int2=B1(MassEx22, mF12, mS12)
  OA2qSL=OA2qSL+0.
  OA2qSR=OA2qSR+0.
  OA2qVL=OA2qVL+(chargefactor*coup3L*(-1.*coup1R*coup2L*int2*MassEx22 +               & 
&  coup1L*coup2L*int1*MassEx2*mF1 - 1.*coup1L*coup2R*int2*MassEx2*MFin + coup1R*coup2R*int1*mF1*MFin))& 
& /(MassEx22 - 1.*MFin2)
  OA2qVR=OA2qVR+(chargefactor*coup3R*(-1.*coup1L*coup2R*int2*MassEx22 +               & 
&  coup1R*coup2R*int1*MassEx2*mF1 - 1.*coup1R*coup2L*int2*MassEx2*MFin + coup1L*coup2L*int1*mF1*MFin))& 
& /(MassEx22 - 1.*MFin2)
     End if 
  End if 
End if 
   End Do 
  End Do 


 ! Loop particles: VWp,Fu, Internal fermion: bar[Fd]
! Generic diagram: VFF,  InsertionOrder: 2
chargefactor = 1 
  Do i2=1,3
    Do i3=1,3
If ((MVWp2.gt.mf_l2(3)).Or.(MFu2(i2).gt.mf_l2(3))) Then
If (((i2.lt.4).and.(i3.lt.4)).or.(.not.OnlySM)) Then 
coup3L = -cplcFdFdVPR(gt1,i3)
coup3R = -cplcFdFdVPL(gt1,i3)
coup2L = -cplcFdFucVWpR(i3,i2)
coup2R = -cplcFdFucVWpL(i3,i2)
coup1L = -cplcFuFdVWpR(i2,gt2)
coup1R = -cplcFuFdVWpL(i2,gt2)
! Masses in loop
mV1 = MVWp
mV12 = MVWp2
mF1 = MFu(i2)
mF12 = MFu2(i2)
! Mass of internal fermion 
MFin = MFd(i3)-MFd(gt2)
MFin2 = MFd2(i3)-MFd2(gt2)
If (Abs(MFin).gt.10E-10_dp) Then 
MFin = MFd(i3)
MFin2 = MFd2(i3)
! Amplitude 
  int1=B0(MassEx22, mF12, mV12)
  int2=B1(MassEx22, mF12, mV12)
  OA2qSL=OA2qSL+0.
  OA2qSR=OA2qSR+0.
  OA2qVL=OA2qVL+(-1.*chargefactor*coup3L*(coup1R*MassEx2*(-2.*coup2L*(Finite - 2.*int1)& 
& *mF1 + coup2R*(Finite + 2.*int2)*MFin) + coup1L*(coup2L*(Finite + 2.*int2)             & 
& *MassEx22 - 2.*coup2R*(Finite - 2.*int1)*mF1*MFin)))/(MassEx22 - 1.*MFin2)
  OA2qVR=OA2qVR+(-1.*chargefactor*coup3R*(coup1L*MassEx2*(-2.*coup2R*(Finite - 2.*int1)& 
& *mF1 + coup2L*(Finite + 2.*int2)*MFin) + coup1R*(coup2R*(Finite + 2.*int2)             & 
& *MassEx22 - 2.*coup2L*(Finite - 2.*int1)*mF1*MFin)))/(MassEx22 - 1.*MFin2)
     End if 
  End if 
End if 
   End Do 
  End Do 


 !---------------------------------------- 
! Triangle Contributions                  
!---------------------------------------- 
! Loop particles: Ah,bar[Fd],bar[Fd]
! Generic diagram: SFF,  InsertionOrder: 1
chargefactor = 1 
  Do i2=1,3
    Do i3=1,3
If ((MAh2.gt.mf_l2(3)).Or.(MFd2(i2).gt.mf_l2(3)).Or.(MFd2(i3).gt.mf_l2(3))) Then
If (((i2.lt.4).and.(i3.lt.4)).or.(.not.OnlySM)) Then 
coup1L = cplcFdFdAhL(gt1,i2)
coup1R = cplcFdFdAhR(gt1,i2)
coup2L = cplcFdFdAhL(i3,gt2)
coup2R = cplcFdFdAhR(i3,gt2)
coup3L = -cplcFdFdVPR(i2,i3)
coup3R = -cplcFdFdVPL(i2,i3)
! Masses in loop
mS1 = MAh
mS12 = MAh2
mF1 = MFd(i2)
mF12 = MFd2(i2)
mF2 = MFd(i3)
mF22 = MFd2(i3)
! Amplitude 
  int1=B0(0._dp, mF12, mF22)
  int2=C00g(mF22, mF12, mS12)
  int3=C0C1C2(mF22, mF12, mS12)
  int4=C0g(mF22, mF12, mS12)
  int5=C12g(mF22, mF12, mS12)
  int6=C1g(mF22, mF12, mS12)
  int7=C2C12C22(mF22, mF12, mS12)
  int8=C2g(mF22, mF12, mS12)
  OA2qSL=OA2qSL+2.*chargefactor*(coup1R*coup2L*coup3L*int5*MassEx1 - 1.*coup1L*(coup2R*coup3R*int7*MassEx2 +& 
&  coup2L*coup3L*int6*mF1 - 1.*coup2L*coup3R*int3*mF2))
  OA2qSR=OA2qSR+2.*chargefactor*(coup1L*coup2R*coup3R*int5*MassEx1 - 1.*coup1R*(coup2L*coup3L*int7*MassEx2 +& 
&  coup2R*coup3R*int6*mF1 - 1.*coup2R*coup3L*int3*mF2))
  OA2qVL=OA2qVL+chargefactor*(2.*coup1R*MassEx1*(-1.*coup2L*coup3L*int8*MassEx2 +     & 
&  coup2R*(-1.*coup3R*int6*mF1 + coup3L*(int4 + int6)*mF2)) + coup1L*(2.*coup2L*MassEx2*(-& 
& 1.*coup3L*(int6 + int8)*mF1 + coup3R*(int4 + int6 + int8)*mF2) + coup2R*(2.*coup3L*int4*mF1*mF2 +& 
&  coup3R*(-1.*int1 + 2.*int2 - 1.*int6*MassEx12 + int4*MassEx22 + int6*MassEx22 + int8*MassEx22 - 1.*int4*mS12))))
  OA2qVR=OA2qVR+chargefactor*(2.*coup1L*MassEx1*(-1.*coup2R*coup3R*int8*MassEx2 +     & 
&  coup2L*(-1.*coup3L*int6*mF1 + coup3R*(int4 + int6)*mF2)) + coup1R*(2.*coup2R*MassEx2*(-& 
& 1.*coup3R*(int6 + int8)*mF1 + coup3L*(int4 + int6 + int8)*mF2) + coup2L*(2.*coup3R*int4*mF1*mF2 +& 
&  coup3L*(-1.*int1 + 2.*int2 - 1.*int6*MassEx12 + int4*MassEx22 + int6*MassEx22 + int8*MassEx22 - 1.*int4*mS12))))
  End if 
End if 
   End Do 
  End Do 


 ! Loop particles: Fu,Hp,Hp
! Generic diagram: FSS,  InsertionOrder: 1
chargefactor = 1 
Do i1=1,3
If ((MFu2(i1).gt.mf_l2(3)).Or.(MHp2.gt.mf_l2(3)).Or.(MHp2.gt.mf_l2(3))) Then
If (((i1.lt.4)).or.(.not.OnlySM)) Then 
coup1L = cplcFdFucHpL(gt1,i1)
coup1R = cplcFdFucHpR(gt1,i1)
coup2L = cplcFuFdHpL(i1,gt2)
coup2R = cplcFuFdHpR(i1,gt2)
coup3 = -cplHpcHpVP
! Masses in loop
mF1 = MFu(i1)
mF12 = MFu2(i1)
mS1 = MHp
mS12 = MHp2
mS2 = MHp
mS22 = MHp2
! Amplitude 
  int1=C00g(mF12, mS22, mS12)
  int2=C0C1C2(mF12, mS22, mS12)
  int3=C1C12C11(mF12, mS22, mS12)
  int4=C2C12C22(mF12, mS22, mS12)
  OA2qSL=OA2qSL+2.*chargefactor*coup3*(coup1R*coup2L*int4*MassEx1 + coup1L*coup2R*int3*MassEx2 -& 
&  1.*coup1L*coup2L*int2*mF1)
  OA2qSR=OA2qSR+2.*chargefactor*coup3*(coup1L*coup2R*int4*MassEx1 + coup1R*coup2L*int3*MassEx2 -& 
&  1.*coup1R*coup2R*int2*mF1)
  OA2qVL=OA2qVL - 2.*chargefactor*coup1L*coup2R*coup3*int1
  OA2qVR=OA2qVR - 2.*chargefactor*coup1R*coup2L*coup3*int1
  End if 
End if 
    End Do 


 ! Loop particles: Fu,VWp,Hp
! Generic diagram: FVS,  InsertionOrder: 1
chargefactor = 1 
Do i1=1,3
If ((MFu2(i1).gt.mf_l2(3)).Or.(MVWp2.gt.mf_l2(3)).Or.(MHp2.gt.mf_l2(3))) Then
If (((i1.lt.4)).or.(.not.OnlySM)) Then 
coup1L = -cplcFdFucVWpR(gt1,i1)
coup1R = -cplcFdFucVWpL(gt1,i1)
coup2L = cplcFuFdHpL(i1,gt2)
coup2R = cplcFuFdHpR(i1,gt2)
coup3 = cplcHpVPVWp
! Masses in loop
mF1 = MFu(i1)
mF12 = MFu2(i1)
mV1 = MVWp
mV12 = MVWp2
mS2 = MHp
mS22 = MHp2
! Amplitude 
  int1=C0g(mF12, mS22, mV12)
  int2=C1g(mF12, mS22, mV12)
  int3=C2g(mF12, mS22, mV12)
  OA2qSL=OA2qSL - 2.*chargefactor*coup1L*coup2L*coup3*int3
  OA2qSR=OA2qSR - 2.*chargefactor*coup1R*coup2R*coup3*int3
  OA2qVL=OA2qVL - 1.*chargefactor*coup3*(coup1R*coup2R*int3*MassEx1 - 1.*coup1L*coup2L*int2*MassEx2 +& 
&  coup1L*coup2R*int1*mF1)
  OA2qVR=OA2qVR - 1.*chargefactor*coup3*(coup1L*coup2L*int3*MassEx1 - 1.*coup1R*coup2R*int2*MassEx2 +& 
&  coup1R*coup2L*int1*mF1)
  End if 
End if 
    End Do 


 ! Loop particles: Fu,Hp,VWp
! Generic diagram: FSV,  InsertionOrder: 1
chargefactor = 1 
Do i1=1,3
If ((MFu2(i1).gt.mf_l2(3)).Or.(MHp2.gt.mf_l2(3)).Or.(MVWp2.gt.mf_l2(3))) Then
If (((i1.lt.4)).or.(.not.OnlySM)) Then 
coup1L = cplcFdFucHpL(gt1,i1)
coup1R = cplcFdFucHpR(gt1,i1)
coup2L = -cplcFuFdVWpR(i1,gt2)
coup2R = -cplcFuFdVWpL(i1,gt2)
coup3 = cplHpcVWpVP
! Masses in loop
mF1 = MFu(i1)
mF12 = MFu2(i1)
mS1 = MHp
mS12 = MHp2
mV2 = MVWp
mV22 = MVWp2
! Amplitude 
  int1=C0g(mF12, mV22, mS12)
  int2=C1g(mF12, mV22, mS12)
  int3=C2g(mF12, mV22, mS12)
  OA2qSL=OA2qSL - 2.*chargefactor*coup1L*coup2R*coup3*int2
  OA2qSR=OA2qSR - 2.*chargefactor*coup1R*coup2L*coup3*int2
  OA2qVL=OA2qVL+chargefactor*coup3*(coup1R*coup2L*int3*MassEx1 - 1.*coup1L*(coup2R*int2*MassEx2 +& 
&  coup2L*int1*mF1))
  OA2qVR=OA2qVR+chargefactor*coup3*(coup1L*coup2R*int3*MassEx1 - 1.*coup1R*(coup2L*int2*MassEx2 +& 
&  coup2R*int1*mF1))
  End if 
End if 
    End Do 


 ! Loop particles: Fu,VWp,VWp
! Generic diagram: FVV,  InsertionOrder: 1
chargefactor = 1 
Do i1=1,3
If ((MFu2(i1).gt.mf_l2(3)).Or.(MVWp2.gt.mf_l2(3)).Or.(MVWp2.gt.mf_l2(3))) Then
If (((i1.lt.4)).or.(.not.OnlySM)) Then 
coup1L = -cplcFdFucVWpR(gt1,i1)
coup1R = -cplcFdFucVWpL(gt1,i1)
coup2L = -cplcFuFdVWpR(i1,gt2)
coup2R = -cplcFuFdVWpL(i1,gt2)
coup3 = cplcVWpVPVWp
! Masses in loop
mF1 = MFu(i1)
mF12 = MFu2(i1)
mV1 = MVWp
mV12 = MVWp2
mV2 = MVWp
mV22 = MVWp2
! Amplitude 
  int1=B0(0._dp, mV12, mV22)
  int2=C00g(mF12, mV22, mV12)
  int3=C0g(mF12, mV22, mV12)
  int4=C12C11C2(mF12, mV22, mV12)
  int5=C12C22C1(mF12, mV22, mV12)
  int6=C1C2(mF12, mV22, mV12)
  int7=C1g(mF12, mV22, mV12)
  int8=C2g(mF12, mV22, mV12)
  OA2qSL=OA2qSL+2.*chargefactor*coup3*(coup1R*coup2R*int5*MassEx1 + coup1L*coup2L*int4*MassEx2 +& 
&  3.*coup1L*coup2R*int6*mF1)
  OA2qSR=OA2qSR+2.*chargefactor*coup3*(coup1L*coup2L*int5*MassEx1 + coup1R*coup2R*int4*MassEx2 +& 
&  3.*coup1R*coup2L*int6*mF1)
  OA2qVL=OA2qVL+chargefactor*coup3*(-6.*coup1R*MassEx1*(coup2R*(int7 + int8)          & 
& *MassEx2 + coup2L*int3*mF1) - 1.*coup1L*(6.*coup2R*int3*MassEx2*mF1 + coup2L*(-        & 
& 1.*Finite + 2.*int1 + 4.*int2 + int8*MassEx12 + int7*MassEx22 + 2.*int3*mF12)))
  OA2qVR=OA2qVR+chargefactor*coup3*(-6.*coup1L*MassEx1*(coup2L*(int7 + int8)          & 
& *MassEx2 + coup2R*int3*mF1) - 1.*coup1R*(6.*coup2L*int3*MassEx2*mF1 + coup2R*(-        & 
& 1.*Finite + 2.*int1 + 4.*int2 + int8*MassEx12 + int7*MassEx22 + 2.*int3*mF12)))
  End if 
End if 
    End Do 


 ! Loop particles: hh,bar[Fd],bar[Fd]
! Generic diagram: SFF,  InsertionOrder: 1
chargefactor = 1 
  Do i2=1,3
    Do i3=1,3
If ((Mhh2.gt.mf_l2(3)).Or.(MFd2(i2).gt.mf_l2(3)).Or.(MFd2(i3).gt.mf_l2(3))) Then
If (.not.OnlySM) Then 
coup1L = cplcFdFdhhL(gt1,i2)
coup1R = cplcFdFdhhR(gt1,i2)
coup2L = cplcFdFdhhL(i3,gt2)
coup2R = cplcFdFdhhR(i3,gt2)
coup3L = -cplcFdFdVPR(i2,i3)
coup3R = -cplcFdFdVPL(i2,i3)
! Masses in loop
mS1 = Mhh
mS12 = Mhh2
mF1 = MFd(i2)
mF12 = MFd2(i2)
mF2 = MFd(i3)
mF22 = MFd2(i3)
! Amplitude 
  int1=B0(0._dp, mF12, mF22)
  int2=C00g(mF22, mF12, mS12)
  int3=C0C1C2(mF22, mF12, mS12)
  int4=C0g(mF22, mF12, mS12)
  int5=C12g(mF22, mF12, mS12)
  int6=C1g(mF22, mF12, mS12)
  int7=C2C12C22(mF22, mF12, mS12)
  int8=C2g(mF22, mF12, mS12)
  OA2qSL=OA2qSL+2.*chargefactor*(coup1R*coup2L*coup3L*int5*MassEx1 - 1.*coup1L*(coup2R*coup3R*int7*MassEx2 +& 
&  coup2L*coup3L*int6*mF1 - 1.*coup2L*coup3R*int3*mF2))
  OA2qSR=OA2qSR+2.*chargefactor*(coup1L*coup2R*coup3R*int5*MassEx1 - 1.*coup1R*(coup2L*coup3L*int7*MassEx2 +& 
&  coup2R*coup3R*int6*mF1 - 1.*coup2R*coup3L*int3*mF2))
  OA2qVL=OA2qVL+chargefactor*(2.*coup1R*MassEx1*(-1.*coup2L*coup3L*int8*MassEx2 +     & 
&  coup2R*(-1.*coup3R*int6*mF1 + coup3L*(int4 + int6)*mF2)) + coup1L*(2.*coup2L*MassEx2*(-& 
& 1.*coup3L*(int6 + int8)*mF1 + coup3R*(int4 + int6 + int8)*mF2) + coup2R*(2.*coup3L*int4*mF1*mF2 +& 
&  coup3R*(-1.*int1 + 2.*int2 - 1.*int6*MassEx12 + int4*MassEx22 + int6*MassEx22 + int8*MassEx22 - 1.*int4*mS12))))
  OA2qVR=OA2qVR+chargefactor*(2.*coup1L*MassEx1*(-1.*coup2R*coup3R*int8*MassEx2 +     & 
&  coup2L*(-1.*coup3L*int6*mF1 + coup3R*(int4 + int6)*mF2)) + coup1R*(2.*coup2R*MassEx2*(-& 
& 1.*coup3R*(int6 + int8)*mF1 + coup3L*(int4 + int6 + int8)*mF2) + coup2L*(2.*coup3R*int4*mF1*mF2 +& 
&  coup3L*(-1.*int1 + 2.*int2 - 1.*int6*MassEx12 + int4*MassEx22 + int6*MassEx22 + int8*MassEx22 - 1.*int4*mS12))))
  End if 
End if 
   End Do 
  End Do 


 ! Loop particles: VZ,bar[Fd],bar[Fd]
! Generic diagram: VFF,  InsertionOrder: 1
chargefactor = 1 
  Do i2=1,3
    Do i3=1,3
If ((MVZ2.gt.mf_l2(3)).Or.(MFd2(i2).gt.mf_l2(3)).Or.(MFd2(i3).gt.mf_l2(3))) Then
If (((i2.lt.4).and.(i3.lt.4)).or.(.not.OnlySM)) Then 
coup1L = -cplcFdFdVZR(gt1,i2)
coup1R = -cplcFdFdVZL(gt1,i2)
coup2L = -cplcFdFdVZR(i3,gt2)
coup2R = -cplcFdFdVZL(i3,gt2)
coup3L = -cplcFdFdVPR(i2,i3)
coup3R = -cplcFdFdVPL(i2,i3)
! Masses in loop
mV1 = MVZ
mV12 = MVZ2
mF1 = MFd(i2)
mF12 = MFd2(i2)
mF2 = MFd(i3)
mF22 = MFd2(i3)
! Amplitude 
  int1=B0(0._dp, mF12, mF22)
  int2=C00g(mF22, mF12, mV12)
  int3=C0g(mF22, mF12, mV12)
  int4=C12C22(mF22, mF12, mV12)
  int5=C1g(mF22, mF12, mV12)
  int6=C2C12(mF22, mF12, mV12)
  int7=C2g(mF22, mF12, mV12)
  OA2qSL=OA2qSL - 4.*chargefactor*(-1.*coup1R*coup2R*coup3R*int6*MassEx1 +            & 
&  coup1L*(coup2L*coup3L*int4*MassEx2 + coup2R*int7*(coup3R*mF1 + coup3L*mF2)))
  OA2qSR=OA2qSR+chargefactor*(4.*coup1L*coup2L*coup3L*int6*MassEx1 - 4.*coup1R*(coup2R*coup3R*int4*MassEx2 +& 
&  coup2L*int7*(coup3L*mF1 + coup3R*mF2)))
  OA2qVL=OA2qVL+chargefactor*(4.*coup1R*coup2R*coup3R*int7*MassEx1*MassEx2 +          & 
&  coup1L*coup2L*(4.*coup3R*int3*mF1*mF2 + coup3L*(Finite - 2.*int1 + 4.*int2 -          & 
&  2.*int5*MassEx12 + 2.*int3*MassEx22 + 2.*int5*MassEx22 + 2.*int7*MassEx22 -           & 
&  2.*int3*mV12)))
  OA2qVR=OA2qVR+chargefactor*(4.*coup1L*coup2L*coup3L*int7*MassEx1*MassEx2 +          & 
&  coup1R*coup2R*(4.*coup3L*int3*mF1*mF2 + coup3R*(Finite - 2.*int1 + 4.*int2 -          & 
&  2.*int5*MassEx12 + 2.*int3*MassEx22 + 2.*int5*MassEx22 + 2.*int7*MassEx22 -           & 
&  2.*int3*mV12)))
  End if 
End if 
   End Do 
  End Do 


 ! Loop particles: conj[Hp],bar[Fu],bar[Fu]
! Generic diagram: SFF,  InsertionOrder: 1
chargefactor = 1 
  Do i2=1,3
    Do i3=1,3
If ((MHp2.gt.mf_l2(3)).Or.(MFu2(i2).gt.mf_l2(3)).Or.(MFu2(i3).gt.mf_l2(3))) Then
If (((i2.lt.4).and.(i3.lt.4)).or.(.not.OnlySM)) Then 
coup1L = cplcFdFucHpL(gt1,i2)
coup1R = cplcFdFucHpR(gt1,i2)
coup2L = cplcFuFdHpL(i3,gt2)
coup2R = cplcFuFdHpR(i3,gt2)
coup3L = -cplcFuFuVPR(i2,i3)
coup3R = -cplcFuFuVPL(i2,i3)
! Masses in loop
mS1 = MHp
mS12 = MHp2
mF1 = MFu(i2)
mF12 = MFu2(i2)
mF2 = MFu(i3)
mF22 = MFu2(i3)
! Amplitude 
  int1=B0(0._dp, mF12, mF22)
  int2=C00g(mF22, mF12, mS12)
  int3=C0C1C2(mF22, mF12, mS12)
  int4=C0g(mF22, mF12, mS12)
  int5=C12g(mF22, mF12, mS12)
  int6=C1g(mF22, mF12, mS12)
  int7=C2C12C22(mF22, mF12, mS12)
  int8=C2g(mF22, mF12, mS12)
  OA2qSL=OA2qSL+2.*chargefactor*(coup1R*coup2L*coup3L*int5*MassEx1 - 1.*coup1L*(coup2R*coup3R*int7*MassEx2 +& 
&  coup2L*coup3L*int6*mF1 - 1.*coup2L*coup3R*int3*mF2))
  OA2qSR=OA2qSR+2.*chargefactor*(coup1L*coup2R*coup3R*int5*MassEx1 - 1.*coup1R*(coup2L*coup3L*int7*MassEx2 +& 
&  coup2R*coup3R*int6*mF1 - 1.*coup2R*coup3L*int3*mF2))
  OA2qVL=OA2qVL+chargefactor*(2.*coup1R*MassEx1*(-1.*coup2L*coup3L*int8*MassEx2 +     & 
&  coup2R*(-1.*coup3R*int6*mF1 + coup3L*(int4 + int6)*mF2)) + coup1L*(2.*coup2L*MassEx2*(-& 
& 1.*coup3L*(int6 + int8)*mF1 + coup3R*(int4 + int6 + int8)*mF2) + coup2R*(2.*coup3L*int4*mF1*mF2 +& 
&  coup3R*(-1.*int1 + 2.*int2 - 1.*int6*MassEx12 + int4*MassEx22 + int6*MassEx22 + int8*MassEx22 - 1.*int4*mS12))))
  OA2qVR=OA2qVR+chargefactor*(2.*coup1L*MassEx1*(-1.*coup2R*coup3R*int8*MassEx2 +     & 
&  coup2L*(-1.*coup3L*int6*mF1 + coup3R*(int4 + int6)*mF2)) + coup1R*(2.*coup2R*MassEx2*(-& 
& 1.*coup3R*(int6 + int8)*mF1 + coup3L*(int4 + int6 + int8)*mF2) + coup2L*(2.*coup3R*int4*mF1*mF2 +& 
&  coup3L*(-1.*int1 + 2.*int2 - 1.*int6*MassEx12 + int4*MassEx22 + int6*MassEx22 + int8*MassEx22 - 1.*int4*mS12))))
  End if 
End if 
   End Do 
  End Do 


 ! Loop particles: conj[VWp],bar[Fu],bar[Fu]
! Generic diagram: VFF,  InsertionOrder: 1
chargefactor = 1 
  Do i2=1,3
    Do i3=1,3
If ((MVWp2.gt.mf_l2(3)).Or.(MFu2(i2).gt.mf_l2(3)).Or.(MFu2(i3).gt.mf_l2(3))) Then
If (((i2.lt.4).and.(i3.lt.4)).or.(.not.OnlySM)) Then 
coup1L = -cplcFdFucVWpR(gt1,i2)
coup1R = -cplcFdFucVWpL(gt1,i2)
coup2L = -cplcFuFdVWpR(i3,gt2)
coup2R = -cplcFuFdVWpL(i3,gt2)
coup3L = -cplcFuFuVPR(i2,i3)
coup3R = -cplcFuFuVPL(i2,i3)
! Masses in loop
mV1 = MVWp
mV12 = MVWp2
mF1 = MFu(i2)
mF12 = MFu2(i2)
mF2 = MFu(i3)
mF22 = MFu2(i3)
! Amplitude 
  int1=B0(0._dp, mF12, mF22)
  int2=C00g(mF22, mF12, mV12)
  int3=C0g(mF22, mF12, mV12)
  int4=C12C22(mF22, mF12, mV12)
  int5=C1g(mF22, mF12, mV12)
  int6=C2C12(mF22, mF12, mV12)
  int7=C2g(mF22, mF12, mV12)
  OA2qSL=OA2qSL - 4.*chargefactor*(-1.*coup1R*coup2R*coup3R*int6*MassEx1 +            & 
&  coup1L*(coup2L*coup3L*int4*MassEx2 + coup2R*int7*(coup3R*mF1 + coup3L*mF2)))
  OA2qSR=OA2qSR+chargefactor*(4.*coup1L*coup2L*coup3L*int6*MassEx1 - 4.*coup1R*(coup2R*coup3R*int4*MassEx2 +& 
&  coup2L*int7*(coup3L*mF1 + coup3R*mF2)))
  OA2qVL=OA2qVL+chargefactor*(4.*coup1R*coup2R*coup3R*int7*MassEx1*MassEx2 +          & 
&  coup1L*coup2L*(4.*coup3R*int3*mF1*mF2 + coup3L*(Finite - 2.*int1 + 4.*int2 -          & 
&  2.*int5*MassEx12 + 2.*int3*MassEx22 + 2.*int5*MassEx22 + 2.*int7*MassEx22 -           & 
&  2.*int3*mV12)))
  OA2qVR=OA2qVR+chargefactor*(4.*coup1L*coup2L*coup3L*int7*MassEx1*MassEx2 +          & 
&  coup1R*coup2R*(4.*coup3L*int3*mF1*mF2 + coup3R*(Finite - 2.*int1 + 4.*int2 -          & 
&  2.*int5*MassEx12 + 2.*int3*MassEx22 + 2.*int5*MassEx22 + 2.*int7*MassEx22 -           & 
&  2.*int3*mV12)))
  End if 
End if 
   End Do 
  End Do 


 OA2qSL=oo16pi2*OA2qSL 
OA2qSR=oo16pi2*OA2qSR 
OA2qVL=oo16pi2*OA2qVL 
OA2qVR=oo16pi2*OA2qVR 
Iname=Iname-1

End Subroutine CalculateGamma2Q 

Subroutine CalculateGluon2Q(gt1,gt2,gt3,OnlySM,MAh,MAh2,MFd,MFd2,MFu,MFu2,            & 
& Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,cplcFdFdAhL,cplcFdFdAhR,cplcFdFdhhL,             & 
& cplcFdFdhhR,cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVZL,cplcFdFdVZR,cplcFdFucHpL,              & 
& cplcFdFucHpR,cplcFdFucVWpL,cplcFdFucVWpR,cplcFuFdHpL,cplcFuFdHpR,cplcFuFdVWpL,         & 
& cplcFuFdVWpR,cplcFuFuVGL,cplcFuFuVGR,OG2qSL,OG2qSR)

! ---------------------------------------------------------------- 
! Code based on automatically generated SARAH extensions by 'PreSARAH' 
! Expressions for amplitudes are obtained by FeynArts/FormCalc 
! Based on user input for process Gluon2Q 
! 'PreSARAH' output has been generated  at 11:48 on 2.2.2015 
! ---------------------------------------------------------------- 
 
Implicit None 
Real(dp),Intent(in) :: MAh,MAh2,MFd(3),MFd2(3),MFu(3),MFu2(3),Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2

Complex(dp),Intent(in) :: cplcFdFdAhL(3,3),cplcFdFdAhR(3,3),cplcFdFdhhL(3,3),cplcFdFdhhR(3,3),cplcFdFdVGL(3,3), & 
& cplcFdFdVGR(3,3),cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),cplcFdFucHpL(3,3),cplcFdFucHpR(3,3),& 
& cplcFdFucVWpL(3,3),cplcFdFucVWpR(3,3),cplcFuFdHpL(3,3),cplcFuFdHpR(3,3),               & 
& cplcFuFdVWpL(3,3),cplcFuFdVWpR(3,3),cplcFuFuVGL(3,3),cplcFuFuVGR(3,3)

Integer,Intent(in) :: gt1, gt2,gt3 
Integer :: gt4 
Logical, Intent(in) :: OnlySM 
Integer :: iprop, i1, i2, i3, i4 
Real(dp) :: MassEx1,MassEx2,MassEx3,MassEx12,MassEx22,MassEx32 
Complex(dp), Intent(out) :: OG2qSL 
Complex(dp), Intent(out) :: OG2qSR 
Real(dp) ::  MP, MP2, IMP2, IMP, MFin, MFin2, IMFin, IMFin2, Finite  
Real(dp) ::  MS1, MS12, MS2, MS22, MF1, MF12, MF2, MF22, MV1, MV12, MV2, MV22  
Complex(dp) ::  chargefactor  
Complex(dp) ::  coup1L, coup1R, coup2L, coup2R, coup3L, coup3R, coup3, coup4L, coup4R 

Complex(dp) ::  int1,int2,int3,int4,int5,int6,int7,int8 

Iname=Iname+1 
NameOfUnit(Iname)='CalculateGluon2Q' 

Finite=1._dp 
MassEx1=MFd(gt1)  
MassEx12=MFd2(gt1) 
MassEx2=MFd(gt2)  
MassEx22=MFd2(gt2) 
MassEx3=0._dp  
MassEx32=0._dp 
! ------------------------------ 
 ! Amplitudes for external states 
 ! {bar[BottomQuark], BottomQuark, Gluon} 
 ! ------------------------------ 
 
OG2qSL=0._dp 
OG2qSR=0._dp 
!---------------------------------------- 
! Tree Contributions                      
!---------------------------------------- 
chargefactor = 1 
If ((OnlySM).or.(.not.OnlySM)) Then 
coup1L = cplcFdFdVGL(gt1,gt2)
coup1R = cplcFdFdVGR(gt1,gt2)
! Amplitude 
  OG2qSL=OG2qSL+ 0.
  OG2qSR=OG2qSR+ 0.
 End if 


 !---------------------------------------- 
! Wave Contributions                      
!---------------------------------------- 
! Loop particles: Ah,bar[Fd], Internal fermion: Fd
! Generic diagram: SFF,  InsertionOrder: 1
chargefactor = 1 
  Do i2=1,3
    Do i3=1,3
If ((MAh2.gt.mf_l2(3)).Or.(MFd2(i2).gt.mf_l2(3))) Then
If (((i2.lt.4).and.(i3.lt.4)).or.(.not.OnlySM)) Then 
coup1L = cplcFdFdAhL(gt1,i2)
coup1R = cplcFdFdAhR(gt1,i2)
coup2L = cplcFdFdAhL(i2,i3)
coup2R = cplcFdFdAhR(i2,i3)
coup3L = -cplcFdFdVGR(i3,gt2)
coup3R = -cplcFdFdVGL(i3,gt2)
! Masses in loop
mS1 = MAh
mS12 = MAh2
mF1 = MFd(i2)
mF12 = MFd2(i2)
! Mass of internal fermion 
MFin = MFd(i3)-MFd(gt1)
MFin2 = MFd2(i3)-MFd2(gt1)
If (Abs(MFin).gt.10E-10_dp) Then 
MFin = MFd(i3)
MFin2 = MFd2(i3)
! Amplitude 
  OG2qSL=OG2qSL+0.
  OG2qSR=OG2qSR+0.
     End if 
  End if 
End if 
   End Do 
  End Do 


 ! Loop particles: Fd,hh, Internal fermion: Fd
! Generic diagram: FSF,  InsertionOrder: 1
chargefactor = 1 
Do i1=1,3
    Do i3=1,3
If ((MFd2(i1).gt.mf_l2(3)).Or.(Mhh2.gt.mf_l2(3))) Then
If (.not.OnlySM) Then 
coup1L = cplcFdFdhhL(gt1,i1)
coup1R = cplcFdFdhhR(gt1,i1)
coup2L = cplcFdFdhhL(i1,i3)
coup2R = cplcFdFdhhR(i1,i3)
coup3L = -cplcFdFdVGR(i3,gt2)
coup3R = -cplcFdFdVGL(i3,gt2)
! Masses in loop
mF1 = MFd(i1)
mF12 = MFd2(i1)
mS1 = Mhh
mS12 = Mhh2
! Mass of internal fermion 
MFin = MFd(i3)-MFd(gt1)
MFin2 = MFd2(i3)-MFd2(gt1)
If (Abs(MFin).gt.10E-10_dp) Then 
MFin = MFd(i3)
MFin2 = MFd2(i3)
! Amplitude 
  OG2qSL=OG2qSL+0.
  OG2qSR=OG2qSR+0.
     End if 
  End if 
End if 
    End Do 
  End Do 


 ! Loop particles: Fd,VZ, Internal fermion: Fd
! Generic diagram: FVF,  InsertionOrder: 1
chargefactor = 1 
Do i1=1,3
    Do i3=1,3
If ((MFd2(i1).gt.mf_l2(3)).Or.(MVZ2.gt.mf_l2(3))) Then
If (((i1.lt.4).and.(i3.lt.4)).or.(.not.OnlySM)) Then 
coup1L = -cplcFdFdVZR(gt1,i1)
coup1R = -cplcFdFdVZL(gt1,i1)
coup2L = -cplcFdFdVZR(i1,i3)
coup2R = -cplcFdFdVZL(i1,i3)
coup3L = -cplcFdFdVGR(i3,gt2)
coup3R = -cplcFdFdVGL(i3,gt2)
! Masses in loop
mF1 = MFd(i1)
mF12 = MFd2(i1)
mV1 = MVZ
mV12 = MVZ2
! Mass of internal fermion 
MFin = MFd(i3)-MFd(gt1)
MFin2 = MFd2(i3)-MFd2(gt1)
If (Abs(MFin).gt.10E-10_dp) Then 
MFin = MFd(i3)
MFin2 = MFd2(i3)
! Amplitude 
  OG2qSL=OG2qSL+0.
  OG2qSR=OG2qSR+0.
     End if 
  End if 
End if 
    End Do 
  End Do 


 ! Loop particles: Fu,Hp, Internal fermion: Fd
! Generic diagram: FSF,  InsertionOrder: 1
chargefactor = 1 
Do i1=1,3
    Do i3=1,3
If ((MFu2(i1).gt.mf_l2(3)).Or.(MHp2.gt.mf_l2(3))) Then
If (((i1.lt.4).and.(i3.lt.4)).or.(.not.OnlySM)) Then 
coup1L = cplcFdFucHpL(gt1,i1)
coup1R = cplcFdFucHpR(gt1,i1)
coup2L = cplcFuFdHpL(i1,i3)
coup2R = cplcFuFdHpR(i1,i3)
coup3L = -cplcFdFdVGR(i3,gt2)
coup3R = -cplcFdFdVGL(i3,gt2)
! Masses in loop
mF1 = MFu(i1)
mF12 = MFu2(i1)
mS1 = MHp
mS12 = MHp2
! Mass of internal fermion 
MFin = MFd(i3)-MFd(gt1)
MFin2 = MFd2(i3)-MFd2(gt1)
If (Abs(MFin).gt.10E-10_dp) Then 
MFin = MFd(i3)
MFin2 = MFd2(i3)
! Amplitude 
  OG2qSL=OG2qSL+0.
  OG2qSR=OG2qSR+0.
     End if 
  End if 
End if 
    End Do 
  End Do 


 ! Loop particles: Fu,VWp, Internal fermion: Fd
! Generic diagram: FVF,  InsertionOrder: 1
chargefactor = 1 
Do i1=1,3
    Do i3=1,3
If ((MFu2(i1).gt.mf_l2(3)).Or.(MVWp2.gt.mf_l2(3))) Then
If (((i1.lt.4).and.(i3.lt.4)).or.(.not.OnlySM)) Then 
coup1L = -cplcFdFucVWpR(gt1,i1)
coup1R = -cplcFdFucVWpL(gt1,i1)
coup2L = -cplcFuFdVWpR(i1,i3)
coup2R = -cplcFuFdVWpL(i1,i3)
coup3L = -cplcFdFdVGR(i3,gt2)
coup3R = -cplcFdFdVGL(i3,gt2)
! Masses in loop
mF1 = MFu(i1)
mF12 = MFu2(i1)
mV1 = MVWp
mV12 = MVWp2
! Mass of internal fermion 
MFin = MFd(i3)-MFd(gt1)
MFin2 = MFd2(i3)-MFd2(gt1)
If (Abs(MFin).gt.10E-10_dp) Then 
MFin = MFd(i3)
MFin2 = MFd2(i3)
! Amplitude 
  OG2qSL=OG2qSL+0.
  OG2qSR=OG2qSR+0.
     End if 
  End if 
End if 
    End Do 
  End Do 


 ! Loop particles: bar[Fd],Ah, Internal fermion: bar[Fd]
! Generic diagram: FSF,  InsertionOrder: 2
chargefactor = 1 
Do i1=1,3
    Do i3=1,3
If ((MFd2(i1).gt.mf_l2(3)).Or.(MAh2.gt.mf_l2(3))) Then
If (((i1.lt.4).and.(i3.lt.4)).or.(.not.OnlySM)) Then 
coup3L = -cplcFdFdVGR(gt1,i3)
coup3R = -cplcFdFdVGL(gt1,i3)
coup2L = cplcFdFdAhL(i3,i1)
coup2R = cplcFdFdAhR(i3,i1)
coup1L = cplcFdFdAhL(i1,gt2)
coup1R = cplcFdFdAhR(i1,gt2)
! Masses in loop
mF1 = MFd(i1)
mF12 = MFd2(i1)
mS1 = MAh
mS12 = MAh2
! Mass of internal fermion 
MFin = MFd(i3)-MFd(gt2)
MFin2 = MFd2(i3)-MFd2(gt2)
If (Abs(MFin).gt.10E-10_dp) Then 
MFin = MFd(i3)
MFin2 = MFd2(i3)
! Amplitude 
  OG2qSL=OG2qSL+0.
  OG2qSR=OG2qSR+0.
     End if 
  End if 
End if 
    End Do 
  End Do 


 ! Loop particles: hh,Fd, Internal fermion: bar[Fd]
! Generic diagram: SFF,  InsertionOrder: 2
chargefactor = 1 
  Do i2=1,3
    Do i3=1,3
If ((Mhh2.gt.mf_l2(3)).Or.(MFd2(i2).gt.mf_l2(3))) Then
If (.not.OnlySM) Then 
coup3L = -cplcFdFdVGR(gt1,i3)
coup3R = -cplcFdFdVGL(gt1,i3)
coup2L = cplcFdFdhhL(i3,i2)
coup2R = cplcFdFdhhR(i3,i2)
coup1L = cplcFdFdhhL(i2,gt2)
coup1R = cplcFdFdhhR(i2,gt2)
! Masses in loop
mS1 = Mhh
mS12 = Mhh2
mF1 = MFd(i2)
mF12 = MFd2(i2)
! Mass of internal fermion 
MFin = MFd(i3)-MFd(gt2)
MFin2 = MFd2(i3)-MFd2(gt2)
If (Abs(MFin).gt.10E-10_dp) Then 
MFin = MFd(i3)
MFin2 = MFd2(i3)
! Amplitude 
  OG2qSL=OG2qSL+0.
  OG2qSR=OG2qSR+0.
     End if 
  End if 
End if 
   End Do 
  End Do 


 ! Loop particles: VZ,Fd, Internal fermion: bar[Fd]
! Generic diagram: VFF,  InsertionOrder: 2
chargefactor = 1 
  Do i2=1,3
    Do i3=1,3
If ((MVZ2.gt.mf_l2(3)).Or.(MFd2(i2).gt.mf_l2(3))) Then
If (((i2.lt.4).and.(i3.lt.4)).or.(.not.OnlySM)) Then 
coup3L = -cplcFdFdVGR(gt1,i3)
coup3R = -cplcFdFdVGL(gt1,i3)
coup2L = -cplcFdFdVZR(i3,i2)
coup2R = -cplcFdFdVZL(i3,i2)
coup1L = -cplcFdFdVZR(i2,gt2)
coup1R = -cplcFdFdVZL(i2,gt2)
! Masses in loop
mV1 = MVZ
mV12 = MVZ2
mF1 = MFd(i2)
mF12 = MFd2(i2)
! Mass of internal fermion 
MFin = MFd(i3)-MFd(gt2)
MFin2 = MFd2(i3)-MFd2(gt2)
If (Abs(MFin).gt.10E-10_dp) Then 
MFin = MFd(i3)
MFin2 = MFd2(i3)
! Amplitude 
  OG2qSL=OG2qSL+0.
  OG2qSR=OG2qSR+0.
     End if 
  End if 
End if 
   End Do 
  End Do 


 ! Loop particles: Hp,Fu, Internal fermion: bar[Fd]
! Generic diagram: SFF,  InsertionOrder: 2
chargefactor = 1 
  Do i2=1,3
    Do i3=1,3
If ((MHp2.gt.mf_l2(3)).Or.(MFu2(i2).gt.mf_l2(3))) Then
If (((i2.lt.4).and.(i3.lt.4)).or.(.not.OnlySM)) Then 
coup3L = -cplcFdFdVGR(gt1,i3)
coup3R = -cplcFdFdVGL(gt1,i3)
coup2L = cplcFdFucHpL(i3,i2)
coup2R = cplcFdFucHpR(i3,i2)
coup1L = cplcFuFdHpL(i2,gt2)
coup1R = cplcFuFdHpR(i2,gt2)
! Masses in loop
mS1 = MHp
mS12 = MHp2
mF1 = MFu(i2)
mF12 = MFu2(i2)
! Mass of internal fermion 
MFin = MFd(i3)-MFd(gt2)
MFin2 = MFd2(i3)-MFd2(gt2)
If (Abs(MFin).gt.10E-10_dp) Then 
MFin = MFd(i3)
MFin2 = MFd2(i3)
! Amplitude 
  OG2qSL=OG2qSL+0.
  OG2qSR=OG2qSR+0.
     End if 
  End if 
End if 
   End Do 
  End Do 


 ! Loop particles: VWp,Fu, Internal fermion: bar[Fd]
! Generic diagram: VFF,  InsertionOrder: 2
chargefactor = 1 
  Do i2=1,3
    Do i3=1,3
If ((MVWp2.gt.mf_l2(3)).Or.(MFu2(i2).gt.mf_l2(3))) Then
If (((i2.lt.4).and.(i3.lt.4)).or.(.not.OnlySM)) Then 
coup3L = -cplcFdFdVGR(gt1,i3)
coup3R = -cplcFdFdVGL(gt1,i3)
coup2L = -cplcFdFucVWpR(i3,i2)
coup2R = -cplcFdFucVWpL(i3,i2)
coup1L = -cplcFuFdVWpR(i2,gt2)
coup1R = -cplcFuFdVWpL(i2,gt2)
! Masses in loop
mV1 = MVWp
mV12 = MVWp2
mF1 = MFu(i2)
mF12 = MFu2(i2)
! Mass of internal fermion 
MFin = MFd(i3)-MFd(gt2)
MFin2 = MFd2(i3)-MFd2(gt2)
If (Abs(MFin).gt.10E-10_dp) Then 
MFin = MFd(i3)
MFin2 = MFd2(i3)
! Amplitude 
  OG2qSL=OG2qSL+0.
  OG2qSR=OG2qSR+0.
     End if 
  End if 
End if 
   End Do 
  End Do 


 !---------------------------------------- 
! Triangle Contributions                  
!---------------------------------------- 
! Loop particles: Ah,bar[Fd],bar[Fd]
! Generic diagram: SFF,  InsertionOrder: 1
chargefactor = 1 
  Do i2=1,3
    Do i3=1,3
If ((MAh2.gt.mf_l2(3)).Or.(MFd2(i2).gt.mf_l2(3)).Or.(MFd2(i3).gt.mf_l2(3))) Then
If (((i2.lt.4).and.(i3.lt.4)).or.(.not.OnlySM)) Then 
coup1L = cplcFdFdAhL(gt1,i2)
coup1R = cplcFdFdAhR(gt1,i2)
coup2L = cplcFdFdAhL(i3,gt2)
coup2R = cplcFdFdAhR(i3,gt2)
coup3L = -cplcFdFdVGR(i2,i3)
coup3R = -cplcFdFdVGL(i2,i3)
! Masses in loop
mS1 = MAh
mS12 = MAh2
mF1 = MFd(i2)
mF12 = MFd2(i2)
mF2 = MFd(i3)
mF22 = MFd2(i3)
! Amplitude 
  int1=C0C1C2(mF22, mF12, mS12)
  int2=C12g(mF22, mF12, mS12)
  int3=C1g(mF22, mF12, mS12)
  int4=C2C12C22(mF22, mF12, mS12)
  OG2qSL=OG2qSL+2.*chargefactor*(coup1R*coup2L*coup3L*int2*MassEx1 - 1.*coup1L*(coup2R*coup3R*int4*MassEx2 +& 
&  coup2L*coup3L*int3*mF1 - 1.*coup2L*coup3R*int1*mF2))
  OG2qSR=OG2qSR+2.*chargefactor*(coup1L*coup2R*coup3R*int2*MassEx1 - 1.*coup1R*(coup2L*coup3L*int4*MassEx2 +& 
&  coup2R*coup3R*int3*mF1 - 1.*coup2R*coup3L*int1*mF2))
  End if 
End if 
   End Do 
  End Do 


 ! Loop particles: hh,bar[Fd],bar[Fd]
! Generic diagram: SFF,  InsertionOrder: 1
chargefactor = 1 
  Do i2=1,3
    Do i3=1,3
If ((Mhh2.gt.mf_l2(3)).Or.(MFd2(i2).gt.mf_l2(3)).Or.(MFd2(i3).gt.mf_l2(3))) Then
If (.not.OnlySM) Then 
coup1L = cplcFdFdhhL(gt1,i2)
coup1R = cplcFdFdhhR(gt1,i2)
coup2L = cplcFdFdhhL(i3,gt2)
coup2R = cplcFdFdhhR(i3,gt2)
coup3L = -cplcFdFdVGR(i2,i3)
coup3R = -cplcFdFdVGL(i2,i3)
! Masses in loop
mS1 = Mhh
mS12 = Mhh2
mF1 = MFd(i2)
mF12 = MFd2(i2)
mF2 = MFd(i3)
mF22 = MFd2(i3)
! Amplitude 
  int1=C0C1C2(mF22, mF12, mS12)
  int2=C12g(mF22, mF12, mS12)
  int3=C1g(mF22, mF12, mS12)
  int4=C2C12C22(mF22, mF12, mS12)
  OG2qSL=OG2qSL+2.*chargefactor*(coup1R*coup2L*coup3L*int2*MassEx1 - 1.*coup1L*(coup2R*coup3R*int4*MassEx2 +& 
&  coup2L*coup3L*int3*mF1 - 1.*coup2L*coup3R*int1*mF2))
  OG2qSR=OG2qSR+2.*chargefactor*(coup1L*coup2R*coup3R*int2*MassEx1 - 1.*coup1R*(coup2L*coup3L*int4*MassEx2 +& 
&  coup2R*coup3R*int3*mF1 - 1.*coup2R*coup3L*int1*mF2))
  End if 
End if 
   End Do 
  End Do 


 ! Loop particles: VZ,bar[Fd],bar[Fd]
! Generic diagram: VFF,  InsertionOrder: 1
chargefactor = 1 
  Do i2=1,3
    Do i3=1,3
If ((MVZ2.gt.mf_l2(3)).Or.(MFd2(i2).gt.mf_l2(3)).Or.(MFd2(i3).gt.mf_l2(3))) Then
If (((i2.lt.4).and.(i3.lt.4)).or.(.not.OnlySM)) Then 
coup1L = -cplcFdFdVZR(gt1,i2)
coup1R = -cplcFdFdVZL(gt1,i2)
coup2L = -cplcFdFdVZR(i3,gt2)
coup2R = -cplcFdFdVZL(i3,gt2)
coup3L = -cplcFdFdVGR(i2,i3)
coup3R = -cplcFdFdVGL(i2,i3)
! Masses in loop
mV1 = MVZ
mV12 = MVZ2
mF1 = MFd(i2)
mF12 = MFd2(i2)
mF2 = MFd(i3)
mF22 = MFd2(i3)
! Amplitude 
  int1=C12C22(mF22, mF12, mV12)
  int2=C2C12(mF22, mF12, mV12)
  int3=C2g(mF22, mF12, mV12)
  OG2qSL=OG2qSL - 4.*chargefactor*(-1.*coup1R*coup2R*coup3R*int2*MassEx1 +            & 
&  coup1L*(coup2L*coup3L*int1*MassEx2 + coup2R*int3*(coup3R*mF1 + coup3L*mF2)))
  OG2qSR=OG2qSR+chargefactor*(4.*coup1L*coup2L*coup3L*int2*MassEx1 - 4.*coup1R*(coup2R*coup3R*int1*MassEx2 +& 
&  coup2L*int3*(coup3L*mF1 + coup3R*mF2)))
  End if 
End if 
   End Do 
  End Do 


 ! Loop particles: conj[Hp],bar[Fu],bar[Fu]
! Generic diagram: SFF,  InsertionOrder: 1
chargefactor = 1 
  Do i2=1,3
    Do i3=1,3
If ((MHp2.gt.mf_l2(3)).Or.(MFu2(i2).gt.mf_l2(3)).Or.(MFu2(i3).gt.mf_l2(3))) Then
If (((i2.lt.4).and.(i3.lt.4)).or.(.not.OnlySM)) Then 
coup1L = cplcFdFucHpL(gt1,i2)
coup1R = cplcFdFucHpR(gt1,i2)
coup2L = cplcFuFdHpL(i3,gt2)
coup2R = cplcFuFdHpR(i3,gt2)
coup3L = -cplcFuFuVGR(i2,i3)
coup3R = -cplcFuFuVGL(i2,i3)
! Masses in loop
mS1 = MHp
mS12 = MHp2
mF1 = MFu(i2)
mF12 = MFu2(i2)
mF2 = MFu(i3)
mF22 = MFu2(i3)
! Amplitude 
  int1=C0C1C2(mF22, mF12, mS12)
  int2=C12g(mF22, mF12, mS12)
  int3=C1g(mF22, mF12, mS12)
  int4=C2C12C22(mF22, mF12, mS12)
  OG2qSL=OG2qSL+2.*chargefactor*(coup1R*coup2L*coup3L*int2*MassEx1 - 1.*coup1L*(coup2R*coup3R*int4*MassEx2 +& 
&  coup2L*coup3L*int3*mF1 - 1.*coup2L*coup3R*int1*mF2))
  OG2qSR=OG2qSR+2.*chargefactor*(coup1L*coup2R*coup3R*int2*MassEx1 - 1.*coup1R*(coup2L*coup3L*int4*MassEx2 +& 
&  coup2R*coup3R*int3*mF1 - 1.*coup2R*coup3L*int1*mF2))
  End if 
End if 
   End Do 
  End Do 


 ! Loop particles: conj[VWp],bar[Fu],bar[Fu]
! Generic diagram: VFF,  InsertionOrder: 1
chargefactor = 1 
  Do i2=1,3
    Do i3=1,3
If ((MVWp2.gt.mf_l2(3)).Or.(MFu2(i2).gt.mf_l2(3)).Or.(MFu2(i3).gt.mf_l2(3))) Then
If (((i2.lt.4).and.(i3.lt.4)).or.(.not.OnlySM)) Then 
coup1L = -cplcFdFucVWpR(gt1,i2)
coup1R = -cplcFdFucVWpL(gt1,i2)
coup2L = -cplcFuFdVWpR(i3,gt2)
coup2R = -cplcFuFdVWpL(i3,gt2)
coup3L = -cplcFuFuVGR(i2,i3)
coup3R = -cplcFuFuVGL(i2,i3)
! Masses in loop
mV1 = MVWp
mV12 = MVWp2
mF1 = MFu(i2)
mF12 = MFu2(i2)
mF2 = MFu(i3)
mF22 = MFu2(i3)
! Amplitude 
  int1=C12C22(mF22, mF12, mV12)
  int2=C2C12(mF22, mF12, mV12)
  int3=C2g(mF22, mF12, mV12)
  OG2qSL=OG2qSL - 4.*chargefactor*(-1.*coup1R*coup2R*coup3R*int2*MassEx1 +            & 
&  coup1L*(coup2L*coup3L*int1*MassEx2 + coup2R*int3*(coup3R*mF1 + coup3L*mF2)))
  OG2qSR=OG2qSR+chargefactor*(4.*coup1L*coup2L*coup3L*int2*MassEx1 - 4.*coup1R*(coup2R*coup3R*int1*MassEx2 +& 
&  coup2L*int3*(coup3L*mF1 + coup3R*mF2)))
  End if 
End if 
   End Do 
  End Do 


 OG2qSL=oo16pi2*OG2qSL 
OG2qSR=oo16pi2*OG2qSR 
Iname=Iname-1

End Subroutine CalculateGluon2Q 

Subroutine CalculateH2q(gt1,gt2,gt3,OnlySM,MAh,MAh2,MFd,MFd2,MFu,MFu2,Mhh,            & 
& Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,cplAhAhhh,cplAhhhVZ,cplcFdFdAhL,cplcFdFdAhR,         & 
& cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZR,cplcFdFucHpL,cplcFdFucHpR,             & 
& cplcFdFucVWpL,cplcFdFucVWpR,cplcFuFdHpL,cplcFuFdHpR,cplcFuFdVWpL,cplcFuFdVWpR,         & 
& cplcFuFuhhL,cplcFuFuhhR,cplhhcHpVWp,cplhhcVWpVWp,cplhhhhhh,cplhhHpcHp,cplhhHpcVWp,     & 
& cplhhVZVZ,OH2qSL,OH2qSR)

! ---------------------------------------------------------------- 
! Code based on automatically generated SARAH extensions by 'PreSARAH' 
! Expressions for amplitudes are obtained by FeynArts/FormCalc 
! Based on user input for process H2q 
! 'PreSARAH' output has been generated  at 10:50 on 14.1.2016 
! ---------------------------------------------------------------- 
 
Implicit None 
Real(dp),Intent(in) :: MAh,MAh2,MFd(3),MFd2(3),MFu(3),MFu2(3),Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2

Complex(dp),Intent(in) :: cplAhAhhh,cplAhhhVZ,cplcFdFdAhL(3,3),cplcFdFdAhR(3,3),cplcFdFdhhL(3,3),               & 
& cplcFdFdhhR(3,3),cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),cplcFdFucHpL(3,3),cplcFdFucHpR(3,3),& 
& cplcFdFucVWpL(3,3),cplcFdFucVWpR(3,3),cplcFuFdHpL(3,3),cplcFuFdHpR(3,3),               & 
& cplcFuFdVWpL(3,3),cplcFuFdVWpR(3,3),cplcFuFuhhL(3,3),cplcFuFuhhR(3,3),cplhhcHpVWp,     & 
& cplhhcVWpVWp,cplhhhhhh,cplhhHpcHp,cplhhHpcVWp,cplhhVZVZ

Integer,Intent(in) :: gt1, gt2,gt3 
Integer :: gt4 
Logical, Intent(in) :: OnlySM 
Integer :: iprop, i1, i2, i3, i4 
Real(dp) :: MassEx1,MassEx2,MassEx3,MassEx12,MassEx22,MassEx32 
Complex(dp), Intent(out) :: OH2qSL 
Complex(dp), Intent(out) :: OH2qSR 
Real(dp) ::  MP, MP2, IMP2, IMP, MFin, MFin2, IMFin, IMFin2, Finite  
Real(dp) ::  MS1, MS12, MS2, MS22, MF1, MF12, MF2, MF22, MV1, MV12, MV2, MV22  
Complex(dp) ::  chargefactor  
Complex(dp) ::  coup1L, coup1R, coup2L, coup2R, coup3L, coup3R, coup3, coup4L, coup4R 

Complex(dp) ::  int1,int2,int3,int4,int5,int6,int7,int8 

Iname=Iname+1 
NameOfUnit(Iname)='CalculateH2q' 

Finite=1._dp 
MassEx1=MFd(gt1)  
MassEx12=MFd2(gt1) 
MassEx2=MFd(gt2)  
MassEx22=MFd2(gt2) 
MassEx3=Mhh  
MassEx32=Mhh2 
! ------------------------------ 
 ! Amplitudes for external states 
 ! {DownQuark, bar[DownQuark], HiggsBoson} 
 ! ------------------------------ 
 
OH2qSL=0._dp 
OH2qSR=0._dp 
!---------------------------------------- 
! Tree Contributions                      
!---------------------------------------- 
chargefactor = 1 
If ((OnlySM).or.(.not.OnlySM)) Then 
coup1L = cplcFdFdhhL(gt2,gt1)
coup1R = cplcFdFdhhR(gt2,gt1)
! Amplitude 
  OH2qSL=OH2qSL+ 0.
  OH2qSR=OH2qSR+ 0.
 End if 


 !---------------------------------------- 
! Wave Contributions                      
!---------------------------------------- 
! Loop particles: Ah,Fd, Internal fermion: bar[Fd]
! Generic diagram: SFF,  InsertionOrder: 1
chargefactor = 1 
  Do i2=1,3
    Do i3=1,3
If ((MAh2.gt.mf_l2(3)).Or.(MFd2(i2).gt.mf_l2(3))) Then
If (((i2.lt.4).and.(i3.lt.4)).or.(.not.OnlySM)) Then 
coup1L = cplcFdFdAhL(i2,gt1)
coup1R = cplcFdFdAhR(i2,gt1)
coup2L = cplcFdFdAhL(i3,i2)
coup2R = cplcFdFdAhR(i3,i2)
coup3L = cplcFdFdhhL(gt2,i3)
coup3R = cplcFdFdhhR(gt2,i3)
! Masses in loop
mS1 = MAh
mS12 = MAh2
mF1 = MFd(i2)
mF12 = MFd2(i2)
! Mass of internal fermion 
MFin = MFd(i3)-MFd(gt1)
MFin2 = MFd2(i3)-MFd2(gt1)
If (Abs(MFin).gt.10E-10_dp) Then 
MFin = MFd(i3)
MFin2 = MFd2(i3)
! Amplitude 
  int1=B0(MassEx12, mF12, mS12)
  int2=B1(MassEx12, mF12, mS12)
  OH2qSL=OH2qSL+(chargefactor*coup3L*(coup1L*coup2R*int2*MassEx12 - 1.*coup1R*coup2R*int1*MassEx1*mF1 +& 
&  coup1R*coup2L*int2*MassEx1*MFin - 1.*coup1L*coup2L*int1*mF1*MFin))/(MassEx12 -        & 
&  1.*MFin2)
  OH2qSR=OH2qSR+(chargefactor*coup3R*(coup1R*coup2L*int2*MassEx12 - 1.*coup1L*coup2L*int1*MassEx1*mF1 +& 
&  coup1L*coup2R*int2*MassEx1*MFin - 1.*coup1R*coup2R*int1*mF1*MFin))/(MassEx12 -        & 
&  1.*MFin2)
     End if 
  End if 
End if 
   End Do 
  End Do 


 ! Loop particles: hh,Fd, Internal fermion: bar[Fd]
! Generic diagram: SFF,  InsertionOrder: 1
chargefactor = 1 
  Do i2=1,3
    Do i3=1,3
If ((Mhh2.gt.mf_l2(3)).Or.(MFd2(i2).gt.mf_l2(3))) Then
If (.not.OnlySM) Then 
coup1L = cplcFdFdhhL(i2,gt1)
coup1R = cplcFdFdhhR(i2,gt1)
coup2L = cplcFdFdhhL(i3,i2)
coup2R = cplcFdFdhhR(i3,i2)
coup3L = cplcFdFdhhL(gt2,i3)
coup3R = cplcFdFdhhR(gt2,i3)
! Masses in loop
mS1 = Mhh
mS12 = Mhh2
mF1 = MFd(i2)
mF12 = MFd2(i2)
! Mass of internal fermion 
MFin = MFd(i3)-MFd(gt1)
MFin2 = MFd2(i3)-MFd2(gt1)
If (Abs(MFin).gt.10E-10_dp) Then 
MFin = MFd(i3)
MFin2 = MFd2(i3)
! Amplitude 
  int1=B0(MassEx12, mF12, mS12)
  int2=B1(MassEx12, mF12, mS12)
  OH2qSL=OH2qSL+(chargefactor*coup3L*(coup1L*coup2R*int2*MassEx12 - 1.*coup1R*coup2R*int1*MassEx1*mF1 +& 
&  coup1R*coup2L*int2*MassEx1*MFin - 1.*coup1L*coup2L*int1*mF1*MFin))/(MassEx12 -        & 
&  1.*MFin2)
  OH2qSR=OH2qSR+(chargefactor*coup3R*(coup1R*coup2L*int2*MassEx12 - 1.*coup1L*coup2L*int1*MassEx1*mF1 +& 
&  coup1L*coup2R*int2*MassEx1*MFin - 1.*coup1R*coup2R*int1*mF1*MFin))/(MassEx12 -        & 
&  1.*MFin2)
     End if 
  End if 
End if 
   End Do 
  End Do 


 ! Loop particles: Hp,Fu, Internal fermion: bar[Fd]
! Generic diagram: SFF,  InsertionOrder: 1
chargefactor = 1 
  Do i2=1,3
    Do i3=1,3
If ((MHp2.gt.mf_l2(3)).Or.(MFu2(i2).gt.mf_l2(3))) Then
If (((i2.lt.4).and.(i3.lt.4)).or.(.not.OnlySM)) Then 
coup1L = cplcFuFdHpL(i2,gt1)
coup1R = cplcFuFdHpR(i2,gt1)
coup2L = cplcFdFucHpL(i3,i2)
coup2R = cplcFdFucHpR(i3,i2)
coup3L = cplcFdFdhhL(gt2,i3)
coup3R = cplcFdFdhhR(gt2,i3)
! Masses in loop
mS1 = MHp
mS12 = MHp2
mF1 = MFu(i2)
mF12 = MFu2(i2)
! Mass of internal fermion 
MFin = MFd(i3)-MFd(gt1)
MFin2 = MFd2(i3)-MFd2(gt1)
If (Abs(MFin).gt.10E-10_dp) Then 
MFin = MFd(i3)
MFin2 = MFd2(i3)
! Amplitude 
  int1=B0(MassEx12, mF12, mS12)
  int2=B1(MassEx12, mF12, mS12)
  OH2qSL=OH2qSL+(chargefactor*coup3L*(coup1L*coup2R*int2*MassEx12 - 1.*coup1R*coup2R*int1*MassEx1*mF1 +& 
&  coup1R*coup2L*int2*MassEx1*MFin - 1.*coup1L*coup2L*int1*mF1*MFin))/(MassEx12 -        & 
&  1.*MFin2)
  OH2qSR=OH2qSR+(chargefactor*coup3R*(coup1R*coup2L*int2*MassEx12 - 1.*coup1L*coup2L*int1*MassEx1*mF1 +& 
&  coup1L*coup2R*int2*MassEx1*MFin - 1.*coup1R*coup2R*int1*mF1*MFin))/(MassEx12 -        & 
&  1.*MFin2)
     End if 
  End if 
End if 
   End Do 
  End Do 


 ! Loop particles: VWp,Fu, Internal fermion: bar[Fd]
! Generic diagram: VFF,  InsertionOrder: 1
chargefactor = 1 
  Do i2=1,3
    Do i3=1,3
If ((MVWp2.gt.mf_l2(3)).Or.(MFu2(i2).gt.mf_l2(3))) Then
If (((i2.lt.4).and.(i3.lt.4)).or.(.not.OnlySM)) Then 
coup1L = cplcFuFdVWpL(i2,gt1)
coup1R = cplcFuFdVWpR(i2,gt1)
coup2L = cplcFdFucVWpL(i3,i2)
coup2R = cplcFdFucVWpR(i3,i2)
coup3L = cplcFdFdhhL(gt2,i3)
coup3R = cplcFdFdhhR(gt2,i3)
! Masses in loop
mV1 = MVWp
mV12 = MVWp2
mF1 = MFu(i2)
mF12 = MFu2(i2)
! Mass of internal fermion 
MFin = MFd(i3)-MFd(gt1)
MFin2 = MFd2(i3)-MFd2(gt1)
If (Abs(MFin).gt.10E-10_dp) Then 
MFin = MFd(i3)
MFin2 = MFd2(i3)
! Amplitude 
  int1=B0(MassEx12, mF12, mV12)
  int2=B1(MassEx12, mF12, mV12)
  OH2qSL=OH2qSL+(chargefactor*coup3L*(coup1R*MassEx1*(-2.*coup2L*(Finite - 2.*int1)   & 
& *mF1 + coup2R*(Finite + 2.*int2)*MFin) + coup1L*(coup2L*(Finite + 2.*int2)             & 
& *MassEx12 - 2.*coup2R*(Finite - 2.*int1)*mF1*MFin)))/(MassEx12 - 1.*MFin2)
  OH2qSR=OH2qSR+(chargefactor*coup3R*(coup1L*MassEx1*(-2.*coup2R*(Finite - 2.*int1)   & 
& *mF1 + coup2L*(Finite + 2.*int2)*MFin) + coup1R*(coup2R*(Finite + 2.*int2)             & 
& *MassEx12 - 2.*coup2L*(Finite - 2.*int1)*mF1*MFin)))/(MassEx12 - 1.*MFin2)
     End if 
  End if 
End if 
   End Do 
  End Do 


 ! Loop particles: VZ,Fd, Internal fermion: bar[Fd]
! Generic diagram: VFF,  InsertionOrder: 1
chargefactor = 1 
  Do i2=1,3
    Do i3=1,3
If ((MVZ2.gt.mf_l2(3)).Or.(MFd2(i2).gt.mf_l2(3))) Then
If (((i2.lt.4).and.(i3.lt.4)).or.(.not.OnlySM)) Then 
coup1L = cplcFdFdVZL(i2,gt1)
coup1R = cplcFdFdVZR(i2,gt1)
coup2L = cplcFdFdVZL(i3,i2)
coup2R = cplcFdFdVZR(i3,i2)
coup3L = cplcFdFdhhL(gt2,i3)
coup3R = cplcFdFdhhR(gt2,i3)
! Masses in loop
mV1 = MVZ
mV12 = MVZ2
mF1 = MFd(i2)
mF12 = MFd2(i2)
! Mass of internal fermion 
MFin = MFd(i3)-MFd(gt1)
MFin2 = MFd2(i3)-MFd2(gt1)
If (Abs(MFin).gt.10E-10_dp) Then 
MFin = MFd(i3)
MFin2 = MFd2(i3)
! Amplitude 
  int1=B0(MassEx12, mF12, mV12)
  int2=B1(MassEx12, mF12, mV12)
  OH2qSL=OH2qSL+(chargefactor*coup3L*(coup1R*MassEx1*(-2.*coup2L*(Finite - 2.*int1)   & 
& *mF1 + coup2R*(Finite + 2.*int2)*MFin) + coup1L*(coup2L*(Finite + 2.*int2)             & 
& *MassEx12 - 2.*coup2R*(Finite - 2.*int1)*mF1*MFin)))/(MassEx12 - 1.*MFin2)
  OH2qSR=OH2qSR+(chargefactor*coup3R*(coup1L*MassEx1*(-2.*coup2R*(Finite - 2.*int1)   & 
& *mF1 + coup2L*(Finite + 2.*int2)*MFin) + coup1R*(coup2R*(Finite + 2.*int2)             & 
& *MassEx12 - 2.*coup2L*(Finite - 2.*int1)*mF1*MFin)))/(MassEx12 - 1.*MFin2)
     End if 
  End if 
End if 
   End Do 
  End Do 


 ! Loop particles: Fd,Ah, Internal fermion: Fd
! Generic diagram: FSF,  InsertionOrder: 2
chargefactor = 1 
Do i1=1,3
    Do i3=1,3
If ((MFd2(i1).gt.mf_l2(3)).Or.(MAh2.gt.mf_l2(3))) Then
If (((i1.lt.4).and.(i3.lt.4)).or.(.not.OnlySM)) Then 
coup3L = cplcFdFdhhL(i3,gt1)
coup3R = cplcFdFdhhR(i3,gt1)
coup2L = cplcFdFdAhL(i1,i3)
coup2R = cplcFdFdAhR(i1,i3)
coup1L = cplcFdFdAhL(gt2,i1)
coup1R = cplcFdFdAhR(gt2,i1)
! Masses in loop
mF1 = MFd(i1)
mF12 = MFd2(i1)
mS1 = MAh
mS12 = MAh2
! Mass of internal fermion 
MFin = MFd(i3)-MFd(gt2)
MFin2 = MFd2(i3)-MFd2(gt2)
If (Abs(MFin).gt.10E-10_dp) Then 
MFin = MFd(i3)
MFin2 = MFd2(i3)
! Amplitude 
  int1=B0(MassEx22, mF12, mS12)
  int2=B1(MassEx22, mF12, mS12)
  OH2qSL=OH2qSL+(chargefactor*coup3L*(coup1L*coup2R*int2*MassEx22 - 1.*coup1R*coup2R*int1*MassEx2*mF1 +& 
&  coup1R*coup2L*int2*MassEx2*MFin - 1.*coup1L*coup2L*int1*mF1*MFin))/(MassEx22 -        & 
&  1.*MFin2)
  OH2qSR=OH2qSR+(chargefactor*coup3R*(coup1R*coup2L*int2*MassEx22 - 1.*coup1L*coup2L*int1*MassEx2*mF1 +& 
&  coup1L*coup2R*int2*MassEx2*MFin - 1.*coup1R*coup2R*int1*mF1*MFin))/(MassEx22 -        & 
&  1.*MFin2)
     End if 
  End if 
End if 
    End Do 
  End Do 


 ! Loop particles: Fd,hh, Internal fermion: Fd
! Generic diagram: FSF,  InsertionOrder: 2
chargefactor = 1 
Do i1=1,3
    Do i3=1,3
If ((MFd2(i1).gt.mf_l2(3)).Or.(Mhh2.gt.mf_l2(3))) Then
If (.not.OnlySM) Then 
coup3L = cplcFdFdhhL(i3,gt1)
coup3R = cplcFdFdhhR(i3,gt1)
coup2L = cplcFdFdhhL(i1,i3)
coup2R = cplcFdFdhhR(i1,i3)
coup1L = cplcFdFdhhL(gt2,i1)
coup1R = cplcFdFdhhR(gt2,i1)
! Masses in loop
mF1 = MFd(i1)
mF12 = MFd2(i1)
mS1 = Mhh
mS12 = Mhh2
! Mass of internal fermion 
MFin = MFd(i3)-MFd(gt2)
MFin2 = MFd2(i3)-MFd2(gt2)
If (Abs(MFin).gt.10E-10_dp) Then 
MFin = MFd(i3)
MFin2 = MFd2(i3)
! Amplitude 
  int1=B0(MassEx22, mF12, mS12)
  int2=B1(MassEx22, mF12, mS12)
  OH2qSL=OH2qSL+(chargefactor*coup3L*(coup1L*coup2R*int2*MassEx22 - 1.*coup1R*coup2R*int1*MassEx2*mF1 +& 
&  coup1R*coup2L*int2*MassEx2*MFin - 1.*coup1L*coup2L*int1*mF1*MFin))/(MassEx22 -        & 
&  1.*MFin2)
  OH2qSR=OH2qSR+(chargefactor*coup3R*(coup1R*coup2L*int2*MassEx22 - 1.*coup1L*coup2L*int1*MassEx2*mF1 +& 
&  coup1L*coup2R*int2*MassEx2*MFin - 1.*coup1R*coup2R*int1*mF1*MFin))/(MassEx22 -        & 
&  1.*MFin2)
     End if 
  End if 
End if 
    End Do 
  End Do 


 ! Loop particles: Fu,Hp, Internal fermion: Fd
! Generic diagram: FSF,  InsertionOrder: 2
chargefactor = 1 
Do i1=1,3
    Do i3=1,3
If ((MFu2(i1).gt.mf_l2(3)).Or.(MHp2.gt.mf_l2(3))) Then
If (((i1.lt.4).and.(i3.lt.4)).or.(.not.OnlySM)) Then 
coup3L = cplcFdFdhhL(i3,gt1)
coup3R = cplcFdFdhhR(i3,gt1)
coup2L = cplcFuFdHpL(i1,i3)
coup2R = cplcFuFdHpR(i1,i3)
coup1L = cplcFdFucHpL(gt2,i1)
coup1R = cplcFdFucHpR(gt2,i1)
! Masses in loop
mF1 = MFu(i1)
mF12 = MFu2(i1)
mS1 = MHp
mS12 = MHp2
! Mass of internal fermion 
MFin = MFd(i3)-MFd(gt2)
MFin2 = MFd2(i3)-MFd2(gt2)
If (Abs(MFin).gt.10E-10_dp) Then 
MFin = MFd(i3)
MFin2 = MFd2(i3)
! Amplitude 
  int1=B0(MassEx22, mF12, mS12)
  int2=B1(MassEx22, mF12, mS12)
  OH2qSL=OH2qSL+(chargefactor*coup3L*(coup1L*coup2R*int2*MassEx22 - 1.*coup1R*coup2R*int1*MassEx2*mF1 +& 
&  coup1R*coup2L*int2*MassEx2*MFin - 1.*coup1L*coup2L*int1*mF1*MFin))/(MassEx22 -        & 
&  1.*MFin2)
  OH2qSR=OH2qSR+(chargefactor*coup3R*(coup1R*coup2L*int2*MassEx22 - 1.*coup1L*coup2L*int1*MassEx2*mF1 +& 
&  coup1L*coup2R*int2*MassEx2*MFin - 1.*coup1R*coup2R*int1*mF1*MFin))/(MassEx22 -        & 
&  1.*MFin2)
     End if 
  End if 
End if 
    End Do 
  End Do 


 ! Loop particles: Fu,VWp, Internal fermion: Fd
! Generic diagram: FVF,  InsertionOrder: 2
chargefactor = 1 
Do i1=1,3
    Do i3=1,3
If ((MFu2(i1).gt.mf_l2(3)).Or.(MVWp2.gt.mf_l2(3))) Then
If (((i1.lt.4).and.(i3.lt.4)).or.(.not.OnlySM)) Then 
coup3L = cplcFdFdhhL(i3,gt1)
coup3R = cplcFdFdhhR(i3,gt1)
coup2L = cplcFuFdVWpL(i1,i3)
coup2R = cplcFuFdVWpR(i1,i3)
coup1L = cplcFdFucVWpL(gt2,i1)
coup1R = cplcFdFucVWpR(gt2,i1)
! Masses in loop
mF1 = MFu(i1)
mF12 = MFu2(i1)
mV1 = MVWp
mV12 = MVWp2
! Mass of internal fermion 
MFin = MFd(i3)-MFd(gt2)
MFin2 = MFd2(i3)-MFd2(gt2)
If (Abs(MFin).gt.10E-10_dp) Then 
MFin = MFd(i3)
MFin2 = MFd2(i3)
! Amplitude 
  int1=B0(MassEx22, mF12, mV12)
  int2=B1(MassEx22, mF12, mV12)
  OH2qSL=OH2qSL+(chargefactor*coup3L*(coup1L*MassEx2*(-2.*coup2R*(Finite - 2.*int1)   & 
& *mF1 + coup2L*(Finite + 2.*int2)*MFin) + coup1R*(coup2R*(Finite + 2.*int2)             & 
& *MassEx22 - 2.*coup2L*(Finite - 2.*int1)*mF1*MFin)))/(MassEx22 - 1.*MFin2)
  OH2qSR=OH2qSR+(chargefactor*coup3R*(coup1R*MassEx2*(-2.*coup2L*(Finite - 2.*int1)   & 
& *mF1 + coup2R*(Finite + 2.*int2)*MFin) + coup1L*(coup2L*(Finite + 2.*int2)             & 
& *MassEx22 - 2.*coup2R*(Finite - 2.*int1)*mF1*MFin)))/(MassEx22 - 1.*MFin2)
     End if 
  End if 
End if 
    End Do 
  End Do 


 ! Loop particles: Fd,VZ, Internal fermion: Fd
! Generic diagram: FVF,  InsertionOrder: 2
chargefactor = 1 
Do i1=1,3
    Do i3=1,3
If ((MFd2(i1).gt.mf_l2(3)).Or.(MVZ2.gt.mf_l2(3))) Then
If (((i1.lt.4).and.(i3.lt.4)).or.(.not.OnlySM)) Then 
coup3L = cplcFdFdhhL(i3,gt1)
coup3R = cplcFdFdhhR(i3,gt1)
coup2L = cplcFdFdVZL(i1,i3)
coup2R = cplcFdFdVZR(i1,i3)
coup1L = cplcFdFdVZL(gt2,i1)
coup1R = cplcFdFdVZR(gt2,i1)
! Masses in loop
mF1 = MFd(i1)
mF12 = MFd2(i1)
mV1 = MVZ
mV12 = MVZ2
! Mass of internal fermion 
MFin = MFd(i3)-MFd(gt2)
MFin2 = MFd2(i3)-MFd2(gt2)
If (Abs(MFin).gt.10E-10_dp) Then 
MFin = MFd(i3)
MFin2 = MFd2(i3)
! Amplitude 
  int1=B0(MassEx22, mF12, mV12)
  int2=B1(MassEx22, mF12, mV12)
  OH2qSL=OH2qSL+(chargefactor*coup3L*(coup1L*MassEx2*(-2.*coup2R*(Finite - 2.*int1)   & 
& *mF1 + coup2L*(Finite + 2.*int2)*MFin) + coup1R*(coup2R*(Finite + 2.*int2)             & 
& *MassEx22 - 2.*coup2L*(Finite - 2.*int1)*mF1*MFin)))/(MassEx22 - 1.*MFin2)
  OH2qSR=OH2qSR+(chargefactor*coup3R*(coup1R*MassEx2*(-2.*coup2L*(Finite - 2.*int1)   & 
& *mF1 + coup2R*(Finite + 2.*int2)*MFin) + coup1L*(coup2L*(Finite + 2.*int2)             & 
& *MassEx22 - 2.*coup2R*(Finite - 2.*int1)*mF1*MFin)))/(MassEx22 - 1.*MFin2)
     End if 
  End if 
End if 
    End Do 
  End Do 


 !---------------------------------------- 
! Triangle Contributions                  
!---------------------------------------- 
! Loop particles: Ah,Fd,Fd
! Generic diagram: SFF,  InsertionOrder: 1
chargefactor = 1 
  Do i2=1,3
    Do i3=1,3
If ((MAh2.gt.mf_l2(3)).Or.(MFd2(i2).gt.mf_l2(3)).Or.(MFd2(i3).gt.mf_l2(3))) Then
If (((i2.lt.4).and.(i3.lt.4)).or.(.not.OnlySM)) Then 
coup1L = cplcFdFdAhL(i2,gt1)
coup1R = cplcFdFdAhR(i2,gt1)
coup2L = cplcFdFdAhL(gt2,i3)
coup2R = cplcFdFdAhR(gt2,i3)
coup3L = cplcFdFdhhL(i3,i2)
coup3R = cplcFdFdhhR(i3,i2)
! Masses in loop
mS1 = MAh
mS12 = MAh2
mF1 = MFd(i2)
mF12 = MFd2(i2)
mF2 = MFd(i3)
mF22 = MFd2(i3)
! Amplitude 
  int1=B0(0._dp, mF12, mF22)
  int2=C0g(mF22, mF12, mS12)
  int3=C1g(mF22, mF12, mS12)
  int4=C2g(mF22, mF12, mS12)
  OH2qSL=OH2qSL+chargefactor*(-2.*coup1R*MassEx1*(-1.*coup2R*coup3L*int4*MassEx2 +    & 
&  coup2L*(coup3R*int3*mF1 + coup3L*(int2 + int3)*mF2)) + coup1L*(2.*coup2R*MassEx2*(coup3L*(int3 + int4)& 
& *mF1 + coup3R*(int2 + int3 + int4)*mF2) + coup2L*(-2.*coup3L*int2*mF1*mF2 +            & 
&  coup3R*(-1.*int1 - 1.*int3*MassEx12 + int2*MassEx22 + int3*MassEx22 + int4*MassEx22 - 1.*int2*mS12))))
  OH2qSR=OH2qSR+chargefactor*(2.*coup1L*MassEx1*(coup2L*coup3R*int4*MassEx2 -         & 
&  1.*coup2R*(coup3L*int3*mF1 + coup3R*(int2 + int3)*mF2)) + coup1R*(2.*coup2L*MassEx2*(coup3R*(int3 + int4)& 
& *mF1 + coup3L*(int2 + int3 + int4)*mF2) + coup2R*(-2.*coup3R*int2*mF1*mF2 +            & 
&  coup3L*(-1.*int1 - 1.*int3*MassEx12 + int2*MassEx22 + int3*MassEx22 + int4*MassEx22 - 1.*int2*mS12))))
  End if 
End if 
   End Do 
  End Do 


 ! Loop particles: hh,Fd,Fd
! Generic diagram: SFF,  InsertionOrder: 1
chargefactor = 1 
  Do i2=1,3
    Do i3=1,3
If ((Mhh2.gt.mf_l2(3)).Or.(MFd2(i2).gt.mf_l2(3)).Or.(MFd2(i3).gt.mf_l2(3))) Then
If (.not.OnlySM) Then 
coup1L = cplcFdFdhhL(i2,gt1)
coup1R = cplcFdFdhhR(i2,gt1)
coup2L = cplcFdFdhhL(gt2,i3)
coup2R = cplcFdFdhhR(gt2,i3)
coup3L = cplcFdFdhhL(i3,i2)
coup3R = cplcFdFdhhR(i3,i2)
! Masses in loop
mS1 = Mhh
mS12 = Mhh2
mF1 = MFd(i2)
mF12 = MFd2(i2)
mF2 = MFd(i3)
mF22 = MFd2(i3)
! Amplitude 
  int1=B0(0._dp, mF12, mF22)
  int2=C0g(mF22, mF12, mS12)
  int3=C1g(mF22, mF12, mS12)
  int4=C2g(mF22, mF12, mS12)
  OH2qSL=OH2qSL+chargefactor*(-2.*coup1R*MassEx1*(-1.*coup2R*coup3L*int4*MassEx2 +    & 
&  coup2L*(coup3R*int3*mF1 + coup3L*(int2 + int3)*mF2)) + coup1L*(2.*coup2R*MassEx2*(coup3L*(int3 + int4)& 
& *mF1 + coup3R*(int2 + int3 + int4)*mF2) + coup2L*(-2.*coup3L*int2*mF1*mF2 +            & 
&  coup3R*(-1.*int1 - 1.*int3*MassEx12 + int2*MassEx22 + int3*MassEx22 + int4*MassEx22 - 1.*int2*mS12))))
  OH2qSR=OH2qSR+chargefactor*(2.*coup1L*MassEx1*(coup2L*coup3R*int4*MassEx2 -         & 
&  1.*coup2R*(coup3L*int3*mF1 + coup3R*(int2 + int3)*mF2)) + coup1R*(2.*coup2L*MassEx2*(coup3R*(int3 + int4)& 
& *mF1 + coup3L*(int2 + int3 + int4)*mF2) + coup2R*(-2.*coup3R*int2*mF1*mF2 +            & 
&  coup3L*(-1.*int1 - 1.*int3*MassEx12 + int2*MassEx22 + int3*MassEx22 + int4*MassEx22 - 1.*int2*mS12))))
  End if 
End if 
   End Do 
  End Do 


 ! Loop particles: Hp,Fu,Fu
! Generic diagram: SFF,  InsertionOrder: 1
chargefactor = 1 
  Do i2=1,3
    Do i3=1,3
If ((MHp2.gt.mf_l2(3)).Or.(MFu2(i2).gt.mf_l2(3)).Or.(MFu2(i3).gt.mf_l2(3))) Then
If (((i2.lt.4).and.(i3.lt.4)).or.(.not.OnlySM)) Then 
coup1L = cplcFuFdHpL(i2,gt1)
coup1R = cplcFuFdHpR(i2,gt1)
coup2L = cplcFdFucHpL(gt2,i3)
coup2R = cplcFdFucHpR(gt2,i3)
coup3L = cplcFuFuhhL(i3,i2)
coup3R = cplcFuFuhhR(i3,i2)
! Masses in loop
mS1 = MHp
mS12 = MHp2
mF1 = MFu(i2)
mF12 = MFu2(i2)
mF2 = MFu(i3)
mF22 = MFu2(i3)
! Amplitude 
  int1=B0(0._dp, mF12, mF22)
  int2=C0g(mF22, mF12, mS12)
  int3=C1g(mF22, mF12, mS12)
  int4=C2g(mF22, mF12, mS12)
  OH2qSL=OH2qSL+chargefactor*(-2.*coup1R*MassEx1*(-1.*coup2R*coup3L*int4*MassEx2 +    & 
&  coup2L*(coup3R*int3*mF1 + coup3L*(int2 + int3)*mF2)) + coup1L*(2.*coup2R*MassEx2*(coup3L*(int3 + int4)& 
& *mF1 + coup3R*(int2 + int3 + int4)*mF2) + coup2L*(-2.*coup3L*int2*mF1*mF2 +            & 
&  coup3R*(-1.*int1 - 1.*int3*MassEx12 + int2*MassEx22 + int3*MassEx22 + int4*MassEx22 - 1.*int2*mS12))))
  OH2qSR=OH2qSR+chargefactor*(2.*coup1L*MassEx1*(coup2L*coup3R*int4*MassEx2 -         & 
&  1.*coup2R*(coup3L*int3*mF1 + coup3R*(int2 + int3)*mF2)) + coup1R*(2.*coup2L*MassEx2*(coup3R*(int3 + int4)& 
& *mF1 + coup3L*(int2 + int3 + int4)*mF2) + coup2R*(-2.*coup3R*int2*mF1*mF2 +            & 
&  coup3L*(-1.*int1 - 1.*int3*MassEx12 + int2*MassEx22 + int3*MassEx22 + int4*MassEx22 - 1.*int2*mS12))))
  End if 
End if 
   End Do 
  End Do 


 ! Loop particles: VWp,Fu,Fu
! Generic diagram: VFF,  InsertionOrder: 1
chargefactor = 1 
  Do i2=1,3
    Do i3=1,3
If ((MVWp2.gt.mf_l2(3)).Or.(MFu2(i2).gt.mf_l2(3)).Or.(MFu2(i3).gt.mf_l2(3))) Then
If (((i2.lt.4).and.(i3.lt.4)).or.(.not.OnlySM)) Then 
coup1L = cplcFuFdVWpL(i2,gt1)
coup1R = cplcFuFdVWpR(i2,gt1)
coup2L = cplcFdFucVWpL(gt2,i3)
coup2R = cplcFdFucVWpR(gt2,i3)
coup3L = cplcFuFuhhL(i3,i2)
coup3R = cplcFuFuhhR(i3,i2)
! Masses in loop
mV1 = MVWp
mV12 = MVWp2
mF1 = MFu(i2)
mF12 = MFu2(i2)
mF2 = MFu(i3)
mF22 = MFu2(i3)
! Amplitude 
  int1=B0(0._dp, mF12, mF22)
  int2=C0g(mF22, mF12, mV12)
  int3=C1g(mF22, mF12, mV12)
  int4=C2g(mF22, mF12, mV12)
  OH2qSL=OH2qSL+chargefactor*(-4.*coup1R*coup2R*MassEx1*(coup3L*int3*mF1 +            & 
&  coup3R*(int2 + int3)*mF2) + coup1L*(4.*coup2L*MassEx2*(coup3R*(int3 + int4)           & 
& *mF1 + coup3L*(int2 + int3 + int4)*mF2) + coup2R*(8.*coup3R*int2*mF1*mF2 -             & 
&  2.*coup3L*(Finite - 2.*int1 - 2.*int3*MassEx12 + 2.*int2*MassEx22 + 2.*int3*MassEx22 + 2.*int4*MassEx22 - 2.*int2*mV12))))
  OH2qSR=OH2qSR+chargefactor*(-4.*coup1L*coup2L*MassEx1*(coup3R*int3*mF1 +            & 
&  coup3L*(int2 + int3)*mF2) + coup1R*(4.*coup2R*MassEx2*(coup3L*(int3 + int4)           & 
& *mF1 + coup3R*(int2 + int3 + int4)*mF2) + coup2L*(8.*coup3L*int2*mF1*mF2 -             & 
&  2.*coup3R*(Finite - 2.*int1 - 2.*int3*MassEx12 + 2.*int2*MassEx22 + 2.*int3*MassEx22 + 2.*int4*MassEx22 - 2.*int2*mV12))))
  End if 
End if 
   End Do 
  End Do 


 ! Loop particles: VZ,Fd,Fd
! Generic diagram: VFF,  InsertionOrder: 1
chargefactor = 1 
  Do i2=1,3
    Do i3=1,3
If ((MVZ2.gt.mf_l2(3)).Or.(MFd2(i2).gt.mf_l2(3)).Or.(MFd2(i3).gt.mf_l2(3))) Then
If (((i2.lt.4).and.(i3.lt.4)).or.(.not.OnlySM)) Then 
coup1L = cplcFdFdVZL(i2,gt1)
coup1R = cplcFdFdVZR(i2,gt1)
coup2L = cplcFdFdVZL(gt2,i3)
coup2R = cplcFdFdVZR(gt2,i3)
coup3L = cplcFdFdhhL(i3,i2)
coup3R = cplcFdFdhhR(i3,i2)
! Masses in loop
mV1 = MVZ
mV12 = MVZ2
mF1 = MFd(i2)
mF12 = MFd2(i2)
mF2 = MFd(i3)
mF22 = MFd2(i3)
! Amplitude 
  int1=B0(0._dp, mF12, mF22)
  int2=C0g(mF22, mF12, mV12)
  int3=C1g(mF22, mF12, mV12)
  int4=C2g(mF22, mF12, mV12)
  OH2qSL=OH2qSL+chargefactor*(-4.*coup1R*coup2R*MassEx1*(coup3L*int3*mF1 +            & 
&  coup3R*(int2 + int3)*mF2) + coup1L*(4.*coup2L*MassEx2*(coup3R*(int3 + int4)           & 
& *mF1 + coup3L*(int2 + int3 + int4)*mF2) + coup2R*(8.*coup3R*int2*mF1*mF2 -             & 
&  2.*coup3L*(Finite - 2.*int1 - 2.*int3*MassEx12 + 2.*int2*MassEx22 + 2.*int3*MassEx22 + 2.*int4*MassEx22 - 2.*int2*mV12))))
  OH2qSR=OH2qSR+chargefactor*(-4.*coup1L*coup2L*MassEx1*(coup3R*int3*mF1 +            & 
&  coup3L*(int2 + int3)*mF2) + coup1R*(4.*coup2R*MassEx2*(coup3L*(int3 + int4)           & 
& *mF1 + coup3R*(int2 + int3 + int4)*mF2) + coup2L*(8.*coup3L*int2*mF1*mF2 -             & 
&  2.*coup3R*(Finite - 2.*int1 - 2.*int3*MassEx12 + 2.*int2*MassEx22 + 2.*int3*MassEx22 + 2.*int4*MassEx22 - 2.*int2*mV12))))
  End if 
End if 
   End Do 
  End Do 


 ! Loop particles: bar[Fd],Ah,Ah
! Generic diagram: FSS,  InsertionOrder: 1
chargefactor = 1 
Do i1=1,3
If ((MFd2(i1).gt.mf_l2(3)).Or.(MAh2.gt.mf_l2(3)).Or.(MAh2.gt.mf_l2(3))) Then
If (((i1.lt.4)).or.(.not.OnlySM)) Then 
coup1L = cplcFdFdAhL(i1,gt1)
coup1R = cplcFdFdAhR(i1,gt1)
coup2L = cplcFdFdAhL(gt2,i1)
coup2R = cplcFdFdAhR(gt2,i1)
coup3 = cplAhAhhh
! Masses in loop
mF1 = MFd(i1)
mF12 = MFd2(i1)
mS1 = MAh
mS12 = MAh2
mS2 = MAh
mS22 = MAh2
! Amplitude 
  int1=C0g(mF12, mS22, mS12)
  int2=C1g(mF12, mS22, mS12)
  int3=C2g(mF12, mS22, mS12)
  OH2qSL=OH2qSL+chargefactor*coup3*(coup1R*coup2L*int3*MassEx1 + coup1L*coup2R*int2*MassEx2 -& 
&  1.*coup1L*coup2L*int1*mF1)
  OH2qSR=OH2qSR+chargefactor*coup3*(coup1L*coup2R*int3*MassEx1 + coup1R*coup2L*int2*MassEx2 -& 
&  1.*coup1R*coup2R*int1*mF1)
  End if 
End if 
    End Do 


 ! Loop particles: bar[Fd],VZ,Ah
! Generic diagram: FVS,  InsertionOrder: 1
chargefactor = 1 
Do i1=1,3
If ((MFd2(i1).gt.mf_l2(3)).Or.(MVZ2.gt.mf_l2(3)).Or.(MAh2.gt.mf_l2(3))) Then
If (((i1.lt.4)).or.(.not.OnlySM)) Then 
coup1L = cplcFdFdVZL(i1,gt1)
coup1R = cplcFdFdVZR(i1,gt1)
coup2L = cplcFdFdAhL(gt2,i1)
coup2R = cplcFdFdAhR(gt2,i1)
coup3 = cplAhhhVZ
! Masses in loop
mF1 = MFd(i1)
mF12 = MFd2(i1)
mV1 = MVZ
mV12 = MVZ2
mS2 = MAh
mS22 = MAh2
! Amplitude 
  int1=B0(0._dp, mS22, mV12)
  int2=C0g(mF12, mS22, mV12)
  int3=C1g(mF12, mS22, mV12)
  int4=C2g(mF12, mS22, mV12)
  OH2qSL=OH2qSL+chargefactor*coup3*(2.*coup1R*MassEx1*(coup2R*(int3 + 2.*int4)        & 
& *MassEx2 + coup2L*(-1.*int2 + int4)*mF1) + coup1L*(2.*coup2R*(2.*int2 + int3)          & 
& *MassEx2*mF1 - 1.*coup2L*(int1 - 1.*int4*MassEx12 + 2.*int3*MassEx22 + int2*mF12)))
  OH2qSR=OH2qSR+chargefactor*coup3*(2.*coup1L*MassEx1*(coup2L*(int3 + 2.*int4)        & 
& *MassEx2 + coup2R*(-1.*int2 + int4)*mF1) + coup1R*(2.*coup2L*(2.*int2 + int3)          & 
& *MassEx2*mF1 - 1.*coup2R*(int1 - 1.*int4*MassEx12 + 2.*int3*MassEx22 + int2*mF12)))
  End if 
End if 
    End Do 


 ! Loop particles: bar[Fd],hh,hh
! Generic diagram: FSS,  InsertionOrder: 1
chargefactor = 1 
Do i1=1,3
If ((MFd2(i1).gt.mf_l2(3)).Or.(Mhh2.gt.mf_l2(3)).Or.(Mhh2.gt.mf_l2(3))) Then
If (.not.OnlySM) Then 
coup1L = cplcFdFdhhL(i1,gt1)
coup1R = cplcFdFdhhR(i1,gt1)
coup2L = cplcFdFdhhL(gt2,i1)
coup2R = cplcFdFdhhR(gt2,i1)
coup3 = cplhhhhhh
! Masses in loop
mF1 = MFd(i1)
mF12 = MFd2(i1)
mS1 = Mhh
mS12 = Mhh2
mS2 = Mhh
mS22 = Mhh2
! Amplitude 
  int1=C0g(mF12, mS22, mS12)
  int2=C1g(mF12, mS22, mS12)
  int3=C2g(mF12, mS22, mS12)
  OH2qSL=OH2qSL+chargefactor*coup3*(coup1R*coup2L*int3*MassEx1 + coup1L*coup2R*int2*MassEx2 -& 
&  1.*coup1L*coup2L*int1*mF1)
  OH2qSR=OH2qSR+chargefactor*coup3*(coup1L*coup2R*int3*MassEx1 + coup1R*coup2L*int2*MassEx2 -& 
&  1.*coup1R*coup2R*int1*mF1)
  End if 
End if 
    End Do 


 ! Loop particles: bar[Fd],Ah,VZ
! Generic diagram: FSV,  InsertionOrder: 1
chargefactor = 1 
Do i1=1,3
If ((MFd2(i1).gt.mf_l2(3)).Or.(MAh2.gt.mf_l2(3)).Or.(MVZ2.gt.mf_l2(3))) Then
If (((i1.lt.4)).or.(.not.OnlySM)) Then 
coup1L = cplcFdFdAhL(i1,gt1)
coup1R = cplcFdFdAhR(i1,gt1)
coup2L = cplcFdFdVZL(gt2,i1)
coup2R = cplcFdFdVZR(gt2,i1)
coup3 = cplAhhhVZ
! Masses in loop
mF1 = MFd(i1)
mF12 = MFd2(i1)
mS1 = MAh
mS12 = MAh2
mV2 = MVZ
mV22 = MVZ2
! Amplitude 
  int1=B0(0._dp, mS12, mV22)
  int2=C0g(mF12, mV22, mS12)
  int3=C1g(mF12, mV22, mS12)
  int4=C2g(mF12, mV22, mS12)
  OH2qSL=OH2qSL+chargefactor*coup3*(-2.*coup1R*MassEx1*(coup2L*(2.*int3 +             & 
&  int4)*MassEx2 + coup2R*(2.*int2 + int4)*mF1) + coup1L*(2.*coup2L*(int2 -              & 
&  1.*int3)*MassEx2*mF1 + coup2R*(int1 + 2.*int4*MassEx12 - 1.*int3*MassEx22 +           & 
&  int2*mF12)))
  OH2qSR=OH2qSR+chargefactor*coup3*(-2.*coup1L*MassEx1*(coup2R*(2.*int3 +             & 
&  int4)*MassEx2 + coup2L*(2.*int2 + int4)*mF1) + coup1R*(2.*coup2R*(int2 -              & 
&  1.*int3)*MassEx2*mF1 + coup2L*(int1 + 2.*int4*MassEx12 - 1.*int3*MassEx22 +           & 
&  int2*mF12)))
  End if 
End if 
    End Do 


 ! Loop particles: bar[Fd],VZ,VZ
! Generic diagram: FVV,  InsertionOrder: 1
chargefactor = 1 
Do i1=1,3
If ((MFd2(i1).gt.mf_l2(3)).Or.(MVZ2.gt.mf_l2(3)).Or.(MVZ2.gt.mf_l2(3))) Then
If (((i1.lt.4)).or.(.not.OnlySM)) Then 
coup1L = cplcFdFdVZL(i1,gt1)
coup1R = cplcFdFdVZR(i1,gt1)
coup2L = cplcFdFdVZL(gt2,i1)
coup2R = cplcFdFdVZR(gt2,i1)
coup3 = cplhhVZVZ
! Masses in loop
mF1 = MFd(i1)
mF12 = MFd2(i1)
mV1 = MVZ
mV12 = MVZ2
mV2 = MVZ
mV22 = MVZ2
! Amplitude 
  int1=C0g(mF12, mV22, mV12)
  int2=C1g(mF12, mV22, mV12)
  int3=C2g(mF12, mV22, mV12)
  OH2qSL=OH2qSL - 2.*chargefactor*coup3*(coup1R*coup2R*int3*MassEx1 + coup1L*coup2L*int2*MassEx2 +& 
&  2.*coup1L*coup2R*int1*mF1)
  OH2qSR=OH2qSR - 2.*chargefactor*coup3*(coup1L*coup2L*int3*MassEx1 + coup1R*coup2R*int2*MassEx2 +& 
&  2.*coup1R*coup2L*int1*mF1)
  End if 
End if 
    End Do 


 ! Loop particles: bar[Fu],conj[Hp],conj[Hp]
! Generic diagram: FSS,  InsertionOrder: 1
chargefactor = 1 
Do i1=1,3
If ((MFu2(i1).gt.mf_l2(3)).Or.(MHp2.gt.mf_l2(3)).Or.(MHp2.gt.mf_l2(3))) Then
If (((i1.lt.4)).or.(.not.OnlySM)) Then 
coup1L = cplcFuFdHpL(i1,gt1)
coup1R = cplcFuFdHpR(i1,gt1)
coup2L = cplcFdFucHpL(gt2,i1)
coup2R = cplcFdFucHpR(gt2,i1)
coup3 = cplhhHpcHp
! Masses in loop
mF1 = MFu(i1)
mF12 = MFu2(i1)
mS1 = MHp
mS12 = MHp2
mS2 = MHp
mS22 = MHp2
! Amplitude 
  int1=C0g(mF12, mS22, mS12)
  int2=C1g(mF12, mS22, mS12)
  int3=C2g(mF12, mS22, mS12)
  OH2qSL=OH2qSL+chargefactor*coup3*(coup1R*coup2L*int3*MassEx1 + coup1L*coup2R*int2*MassEx2 -& 
&  1.*coup1L*coup2L*int1*mF1)
  OH2qSR=OH2qSR+chargefactor*coup3*(coup1L*coup2R*int3*MassEx1 + coup1R*coup2L*int2*MassEx2 -& 
&  1.*coup1R*coup2R*int1*mF1)
  End if 
End if 
    End Do 


 ! Loop particles: bar[Fu],conj[VWp],conj[Hp]
! Generic diagram: FVS,  InsertionOrder: 1
chargefactor = 1 
Do i1=1,3
If ((MFu2(i1).gt.mf_l2(3)).Or.(MVWp2.gt.mf_l2(3)).Or.(MHp2.gt.mf_l2(3))) Then
If (((i1.lt.4)).or.(.not.OnlySM)) Then 
coup1L = cplcFuFdVWpL(i1,gt1)
coup1R = cplcFuFdVWpR(i1,gt1)
coup2L = cplcFdFucHpL(gt2,i1)
coup2R = cplcFdFucHpR(gt2,i1)
coup3 = -cplhhHpcVWp
! Masses in loop
mF1 = MFu(i1)
mF12 = MFu2(i1)
mV1 = MVWp
mV12 = MVWp2
mS2 = MHp
mS22 = MHp2
! Amplitude 
  int1=B0(0._dp, mS22, mV12)
  int2=C0g(mF12, mS22, mV12)
  int3=C1g(mF12, mS22, mV12)
  int4=C2g(mF12, mS22, mV12)
  OH2qSL=OH2qSL+chargefactor*coup3*(2.*coup1R*MassEx1*(coup2R*(int3 + 2.*int4)        & 
& *MassEx2 + coup2L*(-1.*int2 + int4)*mF1) + coup1L*(2.*coup2R*(2.*int2 + int3)          & 
& *MassEx2*mF1 - 1.*coup2L*(int1 - 1.*int4*MassEx12 + 2.*int3*MassEx22 + int2*mF12)))
  OH2qSR=OH2qSR+chargefactor*coup3*(2.*coup1L*MassEx1*(coup2L*(int3 + 2.*int4)        & 
& *MassEx2 + coup2R*(-1.*int2 + int4)*mF1) + coup1R*(2.*coup2L*(2.*int2 + int3)          & 
& *MassEx2*mF1 - 1.*coup2R*(int1 - 1.*int4*MassEx12 + 2.*int3*MassEx22 + int2*mF12)))
  End if 
End if 
    End Do 


 ! Loop particles: bar[Fu],conj[Hp],conj[VWp]
! Generic diagram: FSV,  InsertionOrder: 1
chargefactor = 1 
Do i1=1,3
If ((MFu2(i1).gt.mf_l2(3)).Or.(MHp2.gt.mf_l2(3)).Or.(MVWp2.gt.mf_l2(3))) Then
If (((i1.lt.4)).or.(.not.OnlySM)) Then 
coup1L = cplcFuFdHpL(i1,gt1)
coup1R = cplcFuFdHpR(i1,gt1)
coup2L = cplcFdFucVWpL(gt2,i1)
coup2R = cplcFdFucVWpR(gt2,i1)
coup3 = -cplhhcHpVWp
! Masses in loop
mF1 = MFu(i1)
mF12 = MFu2(i1)
mS1 = MHp
mS12 = MHp2
mV2 = MVWp
mV22 = MVWp2
! Amplitude 
  int1=B0(0._dp, mS12, mV22)
  int2=C0g(mF12, mV22, mS12)
  int3=C1g(mF12, mV22, mS12)
  int4=C2g(mF12, mV22, mS12)
  OH2qSL=OH2qSL+chargefactor*coup3*(-2.*coup1R*MassEx1*(coup2L*(2.*int3 +             & 
&  int4)*MassEx2 + coup2R*(2.*int2 + int4)*mF1) + coup1L*(2.*coup2L*(int2 -              & 
&  1.*int3)*MassEx2*mF1 + coup2R*(int1 + 2.*int4*MassEx12 - 1.*int3*MassEx22 +           & 
&  int2*mF12)))
  OH2qSR=OH2qSR+chargefactor*coup3*(-2.*coup1L*MassEx1*(coup2R*(2.*int3 +             & 
&  int4)*MassEx2 + coup2L*(2.*int2 + int4)*mF1) + coup1R*(2.*coup2R*(int2 -              & 
&  1.*int3)*MassEx2*mF1 + coup2L*(int1 + 2.*int4*MassEx12 - 1.*int3*MassEx22 +           & 
&  int2*mF12)))
  End if 
End if 
    End Do 


 ! Loop particles: bar[Fu],conj[VWp],conj[VWp]
! Generic diagram: FVV,  InsertionOrder: 1
chargefactor = 1 
Do i1=1,3
If ((MFu2(i1).gt.mf_l2(3)).Or.(MVWp2.gt.mf_l2(3)).Or.(MVWp2.gt.mf_l2(3))) Then
If (((i1.lt.4)).or.(.not.OnlySM)) Then 
coup1L = cplcFuFdVWpL(i1,gt1)
coup1R = cplcFuFdVWpR(i1,gt1)
coup2L = cplcFdFucVWpL(gt2,i1)
coup2R = cplcFdFucVWpR(gt2,i1)
coup3 = cplhhcVWpVWp
! Masses in loop
mF1 = MFu(i1)
mF12 = MFu2(i1)
mV1 = MVWp
mV12 = MVWp2
mV2 = MVWp
mV22 = MVWp2
! Amplitude 
  int1=C0g(mF12, mV22, mV12)
  int2=C1g(mF12, mV22, mV12)
  int3=C2g(mF12, mV22, mV12)
  OH2qSL=OH2qSL - 2.*chargefactor*coup3*(coup1R*coup2R*int3*MassEx1 + coup1L*coup2L*int2*MassEx2 +& 
&  2.*coup1L*coup2R*int1*mF1)
  OH2qSR=OH2qSR - 2.*chargefactor*coup3*(coup1L*coup2L*int3*MassEx1 + coup1R*coup2R*int2*MassEx2 +& 
&  2.*coup1R*coup2L*int1*mF1)
  End if 
End if 
    End Do 


 OH2qSL=oo16pi2*OH2qSL 
OH2qSR=oo16pi2*OH2qSR 
Iname=Iname-1

End Subroutine CalculateH2q 

Real(dp) Function C00g(m1, m2, m3)
Implicit None
Real(dp), Intent(in) :: m1, m2, m3
Real(dp) :: eps=1E-10_dp, large = 1E+5_dp

C00g = C00_3m(m1,m2,m3)

End Function C00g

Real(dp) Function C0g(m1in,m2in,m3in) 
Real(dp),Intent(in)::m1in,m2in,m3in 
Real(dp)::eps=1E-10_dp,large=0._dp,epsR=1E-03_dp 
Real(dp)::m1,m2,r 

!  C0

If (Abs(m1in-m2in)/Abs(m1in+m2in).lt.eps) Then! m1==m2 
 m1=m1in
 m2=m3in
   If (m1.gt.m2) Then 
     r=m2/m1 
     If ((1._dp-r).lt.epsR) Then  ! Taylor
        C0g=-1/(2._dp*m1) + (-1 + r)/(6._dp*m1) - (-1 + r)**2/(12._dp*m1)
     Elseif (Abs(r).lt.eps) Then 
        C0g=-(1/m1)
     Else 
        C0g=(-1 + r - r*Log(r))/(m1*(-1 + r)**2)
     End if 
   Else 
     r=m1/m2 
     If ((1._dp-r).lt.epsR) Then 
        C0g=-1/(2._dp*m2) + (-1 + r)/(3._dp*m2) - (-1 + r)**2/(4._dp*m2)
     Elseif (Abs(r).lt.eps) Then 
        C0g=1._dp
     Else 
        C0g=(1 - r + Log(r))/(m2*(-1 + r)**2)
    End if 
   End if 

Else if (Abs(m2in-m3in)/Abs(m2in+m3in).lt.eps) Then! m2==m3 
 m1=m1in 
 m2=m3in 
   If (m1.gt.m2) Then 
     r=m2/m1 
     If ((1._dp-r).lt.epsR) Then 
        C0g=-1/(2._dp*m1) + (-1 + r)/(3._dp*m1) - (-1 + r)**2/(4._dp*m1)
     Elseif (Abs(r).lt.eps) Then 
        C0g=1._dp
     Else 
        C0g=(1 - r + Log(r))/(m1*(-1 + r)**2)
     End if 
   Else 
     r=m1/m2 
     If ((1._dp-r).lt.epsR) Then 
        C0g=-1/(2._dp*m2) + (-1 + r)/(6._dp*m2) - (-1 + r)**2/(12._dp*m2)
     Elseif (Abs(r).lt.eps) Then 
        C0g=-(1/m2)
     Else 
        C0g=(-1 + r - r*Log(r))/(m2*(-1 + r)**2)
     End if 
  End if 

Else!! Different masses are not possible! 
   C0g =0._dp 
End if 
 
End Function C0g 


Real(dp) Function C1g(m1in,m2in,m3in) 
Real(dp),Intent(in)::m1in,m2in,m3in 
Real(dp)::eps=1E-10_dp,large=0._dp,epsR=1E-03_dp 
Real(dp)::m1,m2,r 

!  C1

If (Abs(m1in-m2in)/Abs(m1in+m2in).lt.eps) Then! m1==m2 
 m1=m1in
 m2=m3in
   If (m1.gt.m2) Then 
     r=m2/m1 
     If ((1._dp-r).lt.epsR) Then  ! Taylor
        C1g=1/(6._dp*m1) - (-1 + r)/(24._dp*m1) + (-1 + r)**2/(60._dp*m1)
     Elseif (Abs(r).lt.eps) Then 
        C1g=1/(4._dp*m1)
     Else 
        C1g=(-1 + (4 - 3*r)*r + 2*r**2*Log(r))/(4._dp*m1*(-1 + r)**3)
     End if 
   Else 
     r=m1/m2 
     If ((1._dp-r).lt.epsR) Then 
        C1g=1/(6._dp*m2) - (-1 + r)/(8._dp*m2) + (-1 + r)**2/(10._dp*m2)
     Elseif (Abs(r).lt.eps) Then 
        C1g=large
     Else 
        C1g=(3 - 4*r + r**2 + 2*Log(r))/(4._dp*m2*(-1 + r)**3)
    End if 
   End if 

Else if (Abs(m2in-m3in)/Abs(m2in+m3in).lt.eps) Then! m2==m3 
 m1=m1in 
 m2=m3in 
   If (m1.gt.m2) Then 
     r=m2/m1 
     If ((1._dp-r).lt.epsR) Then 
        C1g=1/(6._dp*m1) - (-1 + r)/(8._dp*m1) + (-1 + r)**2/(10._dp*m1)
     Elseif (Abs(r).lt.eps) Then 
        C1g=large
     Else 
        C1g=(3 - 4*r + r**2 + 2*Log(r))/(4._dp*m1*(-1 + r)**3)
     End if 
   Else 
     r=m1/m2 
     If ((1._dp-r).lt.epsR) Then 
        C1g=1/(6._dp*m2) - (-1 + r)/(24._dp*m2) + (-1 + r)**2/(60._dp*m2)
     Elseif (Abs(r).lt.eps) Then 
        C1g=1/(4._dp*m2)
     Else 
        C1g=(-1 + (4 - 3*r)*r + 2*r**2*Log(r))/(4._dp*m2*(-1 + r)**3)
     End if 
  End if 

Else!! Different masses are not possible! 
   C1g =0._dp 
End if 
 
End Function C1g 


Real(dp) Function C2g(m1in,m2in,m3in) 
Real(dp),Intent(in)::m1in,m2in,m3in 
Real(dp)::eps=1E-10_dp,large=0._dp,epsR=1E-03_dp 
Real(dp)::m1,m2,r 

!  C2

If (Abs(m1in-m2in)/Abs(m1in+m2in).lt.eps) Then! m1==m2 
 m1=m1in
 m2=m3in
   If (m1.gt.m2) Then 
     r=m2/m1 
     If ((1._dp-r).lt.epsR) Then  ! Taylor
        C2g=1/(6._dp*m1) - (-1 + r)/(12._dp*m1) + (-1 + r)**2/(20._dp*m1)
     Elseif (Abs(r).lt.eps) Then 
        C2g=1/(2._dp*m1)
     Else 
        C2g=(-1 + r**2 - 2*r*Log(r))/(2._dp*m1*(-1 + r)**3)
     End if 
   Else 
     r=m1/m2 
     If ((1._dp-r).lt.epsR) Then 
        C2g=1/(6._dp*m2) - (-1 + r)/(12._dp*m2) + (-1 + r)**2/(20._dp*m2)
     Elseif (Abs(r).lt.eps) Then 
        C2g=1/(2._dp*m2)
     Else 
        C2g=(-1 + r**2 - 2*r*Log(r))/(2._dp*m2*(-1 + r)**3)
    End if 
   End if 

Else if (Abs(m2in-m3in)/Abs(m2in+m3in).lt.eps) Then! m2==m3 
 m1=m1in 
 m2=m3in 
   If (m1.gt.m2) Then 
     r=m2/m1 
     If ((1._dp-r).lt.epsR) Then 
        C2g=1/(6._dp*m1) - (-1 + r)/(8._dp*m1) + (-1 + r)**2/(10._dp*m1)
     Elseif (Abs(r).lt.eps) Then 
        C2g=large
     Else 
        C2g=(3 - 4*r + r**2 + 2*Log(r))/(4._dp*m1*(-1 + r)**3)
     End if 
   Else 
     r=m1/m2 
     If ((1._dp-r).lt.epsR) Then 
        C2g=1/(6._dp*m2) - (-1 + r)/(24._dp*m2) + (-1 + r)**2/(60._dp*m2)
     Elseif (Abs(r).lt.eps) Then 
        C2g=1/(4._dp*m2)
     Else 
        C2g=(-1 + (4 - 3*r)*r + 2*r**2*Log(r))/(4._dp*m2*(-1 + r)**3)
     End if 
  End if 

Else!! Different masses are not possible! 
   C2g =0._dp 
End if 
 
End Function C2g 


Real(dp) Function C11g(m1in,m2in,m3in) 
Real(dp),Intent(in)::m1in,m2in,m3in 
Real(dp)::eps=1E-10_dp,large=0._dp,epsR=1E-03_dp 
Real(dp)::m1,m2,r 

!  C11

If (Abs(m1in-m2in)/Abs(m1in+m2in).lt.eps) Then! m1==m2 
 m1=m1in
 m2=m3in
   If (m1.gt.m2) Then 
     r=m2/m1 
     If ((1._dp-r).lt.epsR) Then  ! Taylor
        C11g=-1/(12._dp*m1) + (-1 + r)/(60._dp*m1) - (-1 + r)**2/(180._dp*m1)
     Elseif (Abs(r).lt.eps) Then 
        C11g=-1/(9._dp*m1)
     Else 
        C11g=((-1 + r)*(2 + r*(-7 + 11*r)) - 6*r**3*Log(r))/(18._dp*m1*(-1 + r)**4)
     End if 
   Else 
     r=m1/m2 
     If ((1._dp-r).lt.epsR) Then 
        C11g=-1/(12._dp*m2) + (-1 + r)/(15._dp*m2) - (-1 + r)**2/(18._dp*m2)
     Elseif (Abs(r).lt.eps) Then 
        C11g=large
     Else 
        C11g=(-((-1 + r)*(11 + r*(-7 + 2*r))) + 6*Log(r))/(18._dp*m2*(-1 + r)**4)
    End if 
   End if 

Else if (Abs(m2in-m3in)/Abs(m2in+m3in).lt.eps) Then! m2==m3 
 m1=m1in 
 m2=m3in 
   If (m1.gt.m2) Then 
     r=m2/m1 
     If ((1._dp-r).lt.epsR) Then 
        C11g=-1/(12._dp*m1) + (-1 + r)/(15._dp*m1) - (-1 + r)**2/(18._dp*m1)
     Elseif (Abs(r).lt.eps) Then 
        C11g=large
     Else 
        C11g=(-((-1 + r)*(11 + r*(-7 + 2*r))) + 6*Log(r))/(18._dp*m1*(-1 + r)**4)
     End if 
   Else 
     r=m1/m2 
     If ((1._dp-r).lt.epsR) Then 
        C11g=-1/(12._dp*m2) + (-1 + r)/(60._dp*m2) - (-1 + r)**2/(180._dp*m2)
     Elseif (Abs(r).lt.eps) Then 
        C11g=-1/(9._dp*m2)
     Else 
        C11g=((-1 + r)*(2 + r*(-7 + 11*r)) - 6*r**3*Log(r))/(18._dp*m2*(-1 + r)**4)
     End if 
  End if 

Else!! Different masses are not possible! 
   C11g =0._dp 
End if 
 
End Function C11g 


Real(dp) Function C12g(m1in,m2in,m3in) 
Real(dp),Intent(in)::m1in,m2in,m3in 
Real(dp)::eps=1E-10_dp,large=0._dp,epsR=1E-03_dp 
Real(dp)::m1,m2,r 

!  C12

If (Abs(m1in-m2in)/Abs(m1in+m2in).lt.eps) Then! m1==m2 
 m1=m1in
 m2=m3in
   If (m1.gt.m2) Then 
     r=m2/m1 
     If ((1._dp-r).lt.epsR) Then  ! Taylor
        C12g=-1/(24._dp*m1) + (-1 + r)/(60._dp*m1) - (-1 + r)**2/(120._dp*m1)
     Elseif (Abs(r).lt.eps) Then 
        C12g=-1/(12._dp*m1)
     Else 
        C12g=(-((-1 + r)*(-1 + r*(5 + 2*r))) + 6*r**2*Log(r))/(12._dp*m1*(-1 + r)**4)
     End if 
   Else 
     r=m1/m2 
     If ((1._dp-r).lt.epsR) Then 
        C12g=-1/(24._dp*m2) + (-1 + r)/(40._dp*m2) - (-1 + r)**2/(60._dp*m2)
     Elseif (Abs(r).lt.eps) Then 
        C12g=-1/(6._dp*m2)
     Else 
        C12g=-(2 + r*(3 + (-6 + r)*r) + 6*r*Log(r))/(12._dp*m2*(-1 + r)**4)
    End if 
   End if 

Else if (Abs(m2in-m3in)/Abs(m2in+m3in).lt.eps) Then! m2==m3 
 m1=m1in 
 m2=m3in 
   If (m1.gt.m2) Then 
     r=m2/m1 
     If ((1._dp-r).lt.epsR) Then 
        C12g=-1/(24._dp*m1) + (-1 + r)/(30._dp*m1) - (-1 + r)**2/(36._dp*m1)
     Elseif (Abs(r).lt.eps) Then 
        C12g=large
     Else 
        C12g=(-((-1 + r)*(11 + r*(-7 + 2*r))) + 6*Log(r))/(36._dp*m1*(-1 + r)**4)
     End if 
   Else 
     r=m1/m2 
     If ((1._dp-r).lt.epsR) Then 
        C12g=-1/(24._dp*m2) + (-1 + r)/(120._dp*m2) - (-1 + r)**2/(360._dp*m2)
     Elseif (Abs(r).lt.eps) Then 
        C12g=-1/(18._dp*m2)
     Else 
        C12g=((-1 + r)*(2 + r*(-7 + 11*r)) - 6*r**3*Log(r))/(36._dp*m2*(-1 + r)**4)
     End if 
  End if 

Else!! Different masses are not possible! 
   C12g =0._dp 
End if 
 
End Function C12g 


Real(dp) Function C22g(m1in,m2in,m3in) 
Real(dp),Intent(in)::m1in,m2in,m3in 
Real(dp)::eps=1E-10_dp,large=0._dp,epsR=1E-03_dp 
Real(dp)::m1,m2,r 

!  C22

If (Abs(m1in-m2in)/Abs(m1in+m2in).lt.eps) Then! m1==m2 
 m1=m1in
 m2=m3in
   If (m1.gt.m2) Then 
     r=m2/m1 
     If ((1._dp-r).lt.epsR) Then  ! Taylor
        C22g=-1/(12._dp*m1) + (-1 + r)/(20._dp*m1) - (-1 + r)**2/(30._dp*m1)
     Elseif (Abs(r).lt.eps) Then 
        C22g=-1/(3._dp*m1)
     Else 
        C22g=-(2 + r*(3 + (-6 + r)*r) + 6*r*Log(r))/(6._dp*m1*(-1 + r)**4)
     End if 
   Else 
     r=m1/m2 
     If ((1._dp-r).lt.epsR) Then 
        C22g=-1/(12._dp*m2) + (-1 + r)/(30._dp*m2) - (-1 + r)**2/(60._dp*m2)
     Elseif (Abs(r).lt.eps) Then 
        C22g=-1/(6._dp*m2)
     Else 
        C22g=(-((-1 + r)*(-1 + r*(5 + 2*r))) + 6*r**2*Log(r))/(6._dp*m2*(-1 + r)**4)
    End if 
   End if 

Else if (Abs(m2in-m3in)/Abs(m2in+m3in).lt.eps) Then! m2==m3 
 m1=m1in 
 m2=m3in 
   If (m1.gt.m2) Then 
     r=m2/m1 
     If ((1._dp-r).lt.epsR) Then 
        C22g=-1/(12._dp*m1) + (-1 + r)/(15._dp*m1) - (-1 + r)**2/(18._dp*m1)
     Elseif (Abs(r).lt.eps) Then 
        C22g=large
     Else 
        C22g=(-((-1 + r)*(11 + r*(-7 + 2*r))) + 6*Log(r))/(18._dp*m1*(-1 + r)**4)
     End if 
   Else 
     r=m1/m2 
     If ((1._dp-r).lt.epsR) Then 
        C22g=-1/(12._dp*m2) + (-1 + r)/(60._dp*m2) - (-1 + r)**2/(180._dp*m2)
     Elseif (Abs(r).lt.eps) Then 
        C22g=-1/(9._dp*m2)
     Else 
        C22g=((-1 + r)*(2 + r*(-7 + 11*r)) - 6*r**3*Log(r))/(18._dp*m2*(-1 + r)**4)
     End if 
  End if 

Else!! Different masses are not possible! 
   C22g =0._dp 
End if 
 
End Function C22g 


Real(dp) Function C2C12C22(m1in,m2in,m3in) 
Real(dp),Intent(in)::m1in,m2in,m3in 
Real(dp)::eps=1E-10_dp,large=0._dp,epsR=1E-03_dp 
Real(dp)::m1,m2,r 

!  C12 + C2 + C22

If (Abs(m1in-m2in)/Abs(m1in+m2in).lt.eps) Then! m1==m2 
 m1=m1in
 m2=m3in
   If (m1.gt.m2) Then 
     r=m2/m1 
     If ((1._dp-r).lt.epsR) Then  ! Taylor
        C2C12C22=1/(24._dp*m1) - (-1 + r)/(60._dp*m1) + (-1 + r)**2/(120._dp*m1)
     Elseif (Abs(r).lt.eps) Then 
        C2C12C22=1/(12._dp*m1)
     Else 
        C2C12C22=((-1 + r)*(-1 + r*(5 + 2*r)) - 6*r**2*Log(r))/(12._dp*m1*(-1 + r)**4)
     End if 
   Else 
     r=m1/m2 
     If ((1._dp-r).lt.epsR) Then 
        C2C12C22=1/(24._dp*m2) - (-1 + r)/(40._dp*m2) + (-1 + r)**2/(60._dp*m2)
     Elseif (Abs(r).lt.eps) Then 
        C2C12C22=1/(6._dp*m2)
     Else 
        C2C12C22=(2 + r*(3 + (-6 + r)*r) + 6*r*Log(r))/(12._dp*m2*(-1 + r)**4)
    End if 
   End if 

Else if (Abs(m2in-m3in)/Abs(m2in+m3in).lt.eps) Then! m2==m3 
 m1=m1in 
 m2=m3in 
   If (m1.gt.m2) Then 
     r=m2/m1 
     If ((1._dp-r).lt.epsR) Then 
        C2C12C22=1/(24._dp*m1) - (-1 + r)/(40._dp*m1) + (-1 + r)**2/(60._dp*m1)
     Elseif (Abs(r).lt.eps) Then 
        C2C12C22=1/(6._dp*m1)
     Else 
        C2C12C22=(2 + r*(3 + (-6 + r)*r) + 6*r*Log(r))/(12._dp*m1*(-1 + r)**4)
     End if 
   Else 
     r=m1/m2 
     If ((1._dp-r).lt.epsR) Then 
        C2C12C22=1/(24._dp*m2) - (-1 + r)/(60._dp*m2) + (-1 + r)**2/(120._dp*m2)
     Elseif (Abs(r).lt.eps) Then 
        C2C12C22=1/(12._dp*m2)
     Else 
        C2C12C22=((-1 + r)*(-1 + r*(5 + 2*r)) - 6*r**2*Log(r))/(12._dp*m2*(-1 + r)**4)
     End if 
  End if 

Else!! Different masses are not possible! 
   C2C12C22 =0._dp 
End if 
 
End Function C2C12C22 


Real(dp) Function C1C12C11(m1in,m2in,m3in) 
Real(dp),Intent(in)::m1in,m2in,m3in 
Real(dp)::eps=1E-10_dp,large=0._dp,epsR=1E-03_dp 
Real(dp)::m1,m2,r 

!  C1 + C11 + C12

If (Abs(m1in-m2in)/Abs(m1in+m2in).lt.eps) Then! m1==m2 
 m1=m1in
 m2=m3in
   If (m1.gt.m2) Then 
     r=m2/m1 
     If ((1._dp-r).lt.epsR) Then  ! Taylor
        C1C12C11=1/(24._dp*m1) - (-1 + r)/(120._dp*m1) + (-1 + r)**2/(360._dp*m1)
     Elseif (Abs(r).lt.eps) Then 
        C1C12C11=1/(18._dp*m1)
     Else 
        C1C12C11=(-((-1 + r)*(2 + r*(-7 + 11*r))) + 6*r**3*Log(r))/(36._dp*m1*(-1 + r)**4)
     End if 
   Else 
     r=m1/m2 
     If ((1._dp-r).lt.epsR) Then 
        C1C12C11=1/(24._dp*m2) - (-1 + r)/(30._dp*m2) + (-1 + r)**2/(36._dp*m2)
     Elseif (Abs(r).lt.eps) Then 
        C1C12C11=large
     Else 
        C1C12C11=((-1 + r)*(11 + r*(-7 + 2*r)) - 6*Log(r))/(36._dp*m2*(-1 + r)**4)
    End if 
   End if 

Else if (Abs(m2in-m3in)/Abs(m2in+m3in).lt.eps) Then! m2==m3 
 m1=m1in 
 m2=m3in 
   If (m1.gt.m2) Then 
     r=m2/m1 
     If ((1._dp-r).lt.epsR) Then 
        C1C12C11=1/(24._dp*m1) - (-1 + r)/(40._dp*m1) + (-1 + r)**2/(60._dp*m1)
     Elseif (Abs(r).lt.eps) Then 
        C1C12C11=1/(6._dp*m1)
     Else 
        C1C12C11=(2 + r*(3 + (-6 + r)*r) + 6*r*Log(r))/(12._dp*m1*(-1 + r)**4)
     End if 
   Else 
     r=m1/m2 
     If ((1._dp-r).lt.epsR) Then 
        C1C12C11=1/(24._dp*m2) - (-1 + r)/(60._dp*m2) + (-1 + r)**2/(120._dp*m2)
     Elseif (Abs(r).lt.eps) Then 
        C1C12C11=1/(12._dp*m2)
     Else 
        C1C12C11=((-1 + r)*(-1 + r*(5 + 2*r)) - 6*r**2*Log(r))/(12._dp*m2*(-1 + r)**4)
     End if 
  End if 

Else!! Different masses are not possible! 
   C1C12C11 =0._dp 
End if 
 
End Function C1C12C11 


Real(dp) Function C0C1C2(m1in,m2in,m3in) 
Real(dp),Intent(in)::m1in,m2in,m3in 
Real(dp)::eps=1E-10_dp,large=0._dp,epsR=1E-03_dp 
Real(dp)::m1,m2,r 

!  C0 + C1 + C2

If (Abs(m1in-m2in)/Abs(m1in+m2in).lt.eps) Then! m1==m2 
 m1=m1in
 m2=m3in
   If (m1.gt.m2) Then 
     r=m2/m1 
     If ((1._dp-r).lt.epsR) Then  ! Taylor
        C0C1C2=-1/(6._dp*m1) + (-1 + r)/(24._dp*m1) - (-1 + r)**2/(60._dp*m1)
     Elseif (Abs(r).lt.eps) Then 
        C0C1C2=-1/(4._dp*m1)
     Else 
        C0C1C2=(1 - 4*r + 3*r**2 - 2*r**2*Log(r))/(4._dp*m1*(-1 + r)**3)
     End if 
   Else 
     r=m1/m2 
     If ((1._dp-r).lt.epsR) Then 
        C0C1C2=-1/(6._dp*m2) + (-1 + r)/(8._dp*m2) - (-1 + r)**2/(10._dp*m2)
     Elseif (Abs(r).lt.eps) Then 
        C0C1C2=large
     Else 
        C0C1C2=-(3 - 4*r + r**2 + 2*Log(r))/(4._dp*m2*(-1 + r)**3)
    End if 
   End if 

Else if (Abs(m2in-m3in)/Abs(m2in+m3in).lt.eps) Then! m2==m3 
 m1=m1in 
 m2=m3in 
   If (m1.gt.m2) Then 
     r=m2/m1 
     If ((1._dp-r).lt.epsR) Then 
        C0C1C2=-1/(6._dp*m1) + (-1 + r)/(12._dp*m1) - (-1 + r)**2/(20._dp*m1)
     Elseif (Abs(r).lt.eps) Then 
        C0C1C2=-1/(2._dp*m1)
     Else 
        C0C1C2=(1 - r**2 + 2*r*Log(r))/(2._dp*m1*(-1 + r)**3)
     End if 
   Else 
     r=m1/m2 
     If ((1._dp-r).lt.epsR) Then 
        C0C1C2=-1/(6._dp*m2) + (-1 + r)/(12._dp*m2) - (-1 + r)**2/(20._dp*m2)
     Elseif (Abs(r).lt.eps) Then 
        C0C1C2=-1/(2._dp*m2)
     Else 
        C0C1C2=(1 - r**2 + 2*r*Log(r))/(2._dp*m2*(-1 + r)**3)
     End if 
  End if 

Else!! Different masses are not possible! 
   C0C1C2 =0._dp 
End if 
 
End Function C0C1C2 


Real(dp) Function C12C11C2(m1in,m2in,m3in) 
Real(dp),Intent(in)::m1in,m2in,m3in 
Real(dp)::eps=1E-10_dp,large=0._dp,epsR=1E-03_dp 
Real(dp)::m1,m2,r 

!  2 C11 + 2 C12 - C2

If (Abs(m1in-m2in)/Abs(m1in+m2in).lt.eps) Then! m1==m2 
 m1=m1in
 m2=m3in
   If (m1.gt.m2) Then 
     r=m2/m1 
     If ((1._dp-r).lt.epsR) Then  ! Taylor
        C12C11C2=-5/(12._dp*m1) + (3*(-1 + r))/(20._dp*m1) - (7*(-1 + r)**2)/(90._dp*m1)
     Elseif (Abs(r).lt.eps) Then 
        C12C11C2=-8/(9._dp*m1)
     Else 
        C12C11C2=((-1 + r)*(16 + r*(-29 + 7*r)) - 6*r*(3 + 2*(-3 + r)*r)*Log(r))/(18._dp*m1*(-1 + r)**4)
     End if 
   Else 
     r=m1/m2 
     If ((1._dp-r).lt.epsR) Then 
        C12C11C2=-5/(12._dp*m2) + (4*(-1 + r))/(15._dp*m2) - (7*(-1 + r)**2)/(36._dp*m2)
     Elseif (Abs(r).lt.eps) Then 
        C12C11C2=large
     Else 
        C12C11C2=(-((-1 + r)*(7 + r*(-29 + 16*r))) + 6*(2 + 3*(-2 + r)*r)*Log(r))/(18._dp*m2*(-1 + r)**4)
    End if 
   End if 

Else if (Abs(m2in-m3in)/Abs(m2in+m3in).lt.eps) Then! m2==m3 
 m1=m1in 
 m2=m3in 
   If (m1.gt.m2) Then 
     r=m2/m1 
     If ((1._dp-r).lt.epsR) Then 
        C12C11C2=-5/(12._dp*m1) + (13*(-1 + r))/(40._dp*m1) - (4*(-1 + r)**2)/(15._dp*m1)
     Elseif (Abs(r).lt.eps) Then 
        C12C11C2=large
     Else 
        C12C11C2=-((-1 + r)*(31 + r*(-26 + 7*r)) + 6*(-3 + r)*Log(r))/(12._dp*m1*(-1 + r)**4)
     End if 
   Else 
     r=m1/m2 
     If ((1._dp-r).lt.epsR) Then 
        C12C11C2=-5/(12._dp*m2) + (11*(-1 + r))/(120._dp*m2) - (-1 + r)**2/(30._dp*m2)
     Elseif (Abs(r).lt.eps) Then 
        C12C11C2=-7/(12._dp*m2)
     Else 
        C12C11C2=((-1 + r)*(7 + r*(-26 + 31*r)) + 6*(1 - 3*r)*r**2*Log(r))/(12._dp*m2*(-1 + r)**4)
     End if 
  End if 

Else!! Different masses are not possible! 
   C12C11C2 =0._dp 
End if 
 
End Function C12C11C2 


Real(dp) Function C12C22C1(m1in,m2in,m3in) 
Real(dp),Intent(in)::m1in,m2in,m3in 
Real(dp)::eps=1E-10_dp,large=0._dp,epsR=1E-03_dp 
Real(dp)::m1,m2,r 

!  -C1 + 2 C12 + 2 C22

If (Abs(m1in-m2in)/Abs(m1in+m2in).lt.eps) Then! m1==m2 
 m1=m1in
 m2=m3in
   If (m1.gt.m2) Then 
     r=m2/m1 
     If ((1._dp-r).lt.epsR) Then  ! Taylor
        C12C22C1=-5/(12._dp*m1) + (7*(-1 + r))/(40._dp*m1) - (-1 + r)**2/(10._dp*m1)
     Elseif (Abs(r).lt.eps) Then 
        C12C22C1=-13/(12._dp*m1)
     Else 
        C12C22C1=((-1 + r)*(13 + (-2 + r)*r) - 6*r*(4 + (-3 + r)*r)*Log(r))/(12._dp*m1*(-1 + r)**4)
     End if 
   Else 
     r=m1/m2 
     If ((1._dp-r).lt.epsR) Then 
        C12C22C1=-5/(12._dp*m2) + (29*(-1 + r))/(120._dp*m2) - (-1 + r)**2/(6._dp*m2)
     Elseif (Abs(r).lt.eps) Then 
        C12C22C1=large
     Else 
        C12C22C1=(-((-1 + r)*(1 + r*(-2 + 13*r))) + 6*(1 + r*(-3 + 4*r))*Log(r))/(12._dp*m2*(-1 + r)**4)
    End if 
   End if 

Else if (Abs(m2in-m3in)/Abs(m2in+m3in).lt.eps) Then! m2==m3 
 m1=m1in 
 m2=m3in 
   If (m1.gt.m2) Then 
     r=m2/m1 
     If ((1._dp-r).lt.epsR) Then 
        C12C22C1=-5/(12._dp*m1) + (13*(-1 + r))/(40._dp*m1) - (4*(-1 + r)**2)/(15._dp*m1)
     Elseif (Abs(r).lt.eps) Then 
        C12C22C1=large
     Else 
        C12C22C1=-((-1 + r)*(31 + r*(-26 + 7*r)) + 6*(-3 + r)*Log(r))/(12._dp*m1*(-1 + r)**4)
     End if 
   Else 
     r=m1/m2 
     If ((1._dp-r).lt.epsR) Then 
        C12C22C1=-5/(12._dp*m2) + (11*(-1 + r))/(120._dp*m2) - (-1 + r)**2/(30._dp*m2)
     Elseif (Abs(r).lt.eps) Then 
        C12C22C1=-7/(12._dp*m2)
     Else 
        C12C22C1=((-1 + r)*(7 + r*(-26 + 31*r)) + 6*(1 - 3*r)*r**2*Log(r))/(12._dp*m2*(-1 + r)**4)
     End if 
  End if 

Else!! Different masses are not possible! 
   C12C22C1 =0._dp 
End if 
 
End Function C12C22C1 


Real(dp) Function C12C22(m1in,m2in,m3in) 
Real(dp),Intent(in)::m1in,m2in,m3in 
Real(dp)::eps=1E-10_dp,large=0._dp,epsR=1E-03_dp 
Real(dp)::m1,m2,r 

!  C12 + C22

If (Abs(m1in-m2in)/Abs(m1in+m2in).lt.eps) Then! m1==m2 
 m1=m1in
 m2=m3in
   If (m1.gt.m2) Then 
     r=m2/m1 
     If ((1._dp-r).lt.epsR) Then  ! Taylor
        C12C22=-1/(8._dp*m1) + (-1 + r)/(15._dp*m1) - (-1 + r)**2/(24._dp*m1)
     Elseif (Abs(r).lt.eps) Then 
        C12C22=-5/(12._dp*m1)
     Else 
        C12C22=(-5 + (9 - 4*r)*r**2 + 6*(-2 + r)*r*Log(r))/(12._dp*m1*(-1 + r)**4)
     End if 
   Else 
     r=m1/m2 
     If ((1._dp-r).lt.epsR) Then 
        C12C22=-1/(8._dp*m2) + (7*(-1 + r))/(120._dp*m2) - (-1 + r)**2/(30._dp*m2)
     Elseif (Abs(r).lt.eps) Then 
        C12C22=-1/(3._dp*m2)
     Else 
        C12C22=(-4 + 9*r - 5*r**3 + 6*r*(-1 + 2*r)*Log(r))/(12._dp*m2*(-1 + r)**4)
    End if 
   End if 

Else if (Abs(m2in-m3in)/Abs(m2in+m3in).lt.eps) Then! m2==m3 
 m1=m1in 
 m2=m3in 
   If (m1.gt.m2) Then 
     r=m2/m1 
     If ((1._dp-r).lt.epsR) Then 
        C12C22=-1/(8._dp*m1) + (-1 + r)/(10._dp*m1) - (-1 + r)**2/(12._dp*m1)
     Elseif (Abs(r).lt.eps) Then 
        C12C22=large
     Else 
        C12C22=(-((-1 + r)*(11 + r*(-7 + 2*r))) + 6*Log(r))/(12._dp*m1*(-1 + r)**4)
     End if 
   Else 
     r=m1/m2 
     If ((1._dp-r).lt.epsR) Then 
        C12C22=-1/(8._dp*m2) + (-1 + r)/(40._dp*m2) - (-1 + r)**2/(120._dp*m2)
     Elseif (Abs(r).lt.eps) Then 
        C12C22=-1/(6._dp*m2)
     Else 
        C12C22=((-1 + r)*(2 + r*(-7 + 11*r)) - 6*r**3*Log(r))/(12._dp*m2*(-1 + r)**4)
     End if 
  End if 

Else!! Different masses are not possible! 
   C12C22 =0._dp 
End if 
 
End Function C12C22 


Real(dp) Function C2C12(m1in,m2in,m3in) 
Real(dp),Intent(in)::m1in,m2in,m3in 
Real(dp)::eps=1E-10_dp,large=0._dp,epsR=1E-03_dp 
Real(dp)::m1,m2,r 

!  C12 + C2

If (Abs(m1in-m2in)/Abs(m1in+m2in).lt.eps) Then! m1==m2 
 m1=m1in
 m2=m3in
   If (m1.gt.m2) Then 
     r=m2/m1 
     If ((1._dp-r).lt.epsR) Then  ! Taylor
        C2C12=1/(8._dp*m1) - (-1 + r)/(15._dp*m1) + (-1 + r)**2/(24._dp*m1)
     Elseif (Abs(r).lt.eps) Then 
        C2C12=5/(12._dp*m1)
     Else 
        C2C12=(5 + r**2*(-9 + 4*r) - 6*(-2 + r)*r*Log(r))/(12._dp*m1*(-1 + r)**4)
     End if 
   Else 
     r=m1/m2 
     If ((1._dp-r).lt.epsR) Then 
        C2C12=1/(8._dp*m2) - (7*(-1 + r))/(120._dp*m2) + (-1 + r)**2/(30._dp*m2)
     Elseif (Abs(r).lt.eps) Then 
        C2C12=1/(3._dp*m2)
     Else 
        C2C12=(4 - 9*r + 5*r**3 + 6*(1 - 2*r)*r*Log(r))/(12._dp*m2*(-1 + r)**4)
    End if 
   End if 

Else if (Abs(m2in-m3in)/Abs(m2in+m3in).lt.eps) Then! m2==m3 
 m1=m1in 
 m2=m3in 
   If (m1.gt.m2) Then 
     r=m2/m1 
     If ((1._dp-r).lt.epsR) Then 
        C2C12=1/(8._dp*m1) - (11*(-1 + r))/(120._dp*m1) + (13*(-1 + r)**2)/(180._dp*m1)
     Elseif (Abs(r).lt.eps) Then 
        C2C12=large
     Else 
        C2C12=((-1 + r)*(16 + r*(-29 + 7*r)) + 6*(-2 + 3*r)*Log(r))/(36._dp*m1*(-1 + r)**4)
     End if 
   Else 
     r=m1/m2 
     If ((1._dp-r).lt.epsR) Then 
        C2C12=1/(8._dp*m2) - (-1 + r)/(30._dp*m2) + (-1 + r)**2/(72._dp*m2)
     Elseif (Abs(r).lt.eps) Then 
        C2C12=7/(36._dp*m2)
     Else 
        C2C12=(-((-1 + r)*(7 + r*(-29 + 16*r))) + 6*r**2*(-3 + 2*r)*Log(r))/(36._dp*m2*(-1 + r)**4)
     End if 
  End if 

Else!! Different masses are not possible! 
   C2C12 =0._dp 
End if 
 
End Function C2C12 


Real(dp) Function C1C2(m1in,m2in,m3in) 
Real(dp),Intent(in)::m1in,m2in,m3in 
Real(dp)::eps=1E-10_dp,large=0._dp,epsR=1E-03_dp 
Real(dp)::m1,m2,r 

!  C1 + C2

If (Abs(m1in-m2in)/Abs(m1in+m2in).lt.eps) Then! m1==m2 
 m1=m1in
 m2=m3in
   If (m1.gt.m2) Then 
     r=m2/m1 
     If ((1._dp-r).lt.epsR) Then  ! Taylor
        C1C2=1/(3._dp*m1) - (-1 + r)/(8._dp*m1) + (-1 + r)**2/(15._dp*m1)
     Elseif (Abs(r).lt.eps) Then 
        C1C2=3/(4._dp*m1)
     Else 
        C1C2=-(3 - 4*r + r**2 - 2*(-2 + r)*r*Log(r))/(4._dp*m1*(-1 + r)**3)
     End if 
   Else 
     r=m1/m2 
     If ((1._dp-r).lt.epsR) Then 
        C1C2=1/(3._dp*m2) - (5*(-1 + r))/(24._dp*m2) + (3*(-1 + r)**2)/(20._dp*m2)
     Elseif (Abs(r).lt.eps) Then 
        C1C2=large
     Else 
        C1C2=(1 - 4*r + 3*r**2 + (2 - 4*r)*Log(r))/(4._dp*m2*(-1 + r)**3)
    End if 
   End if 

Else if (Abs(m2in-m3in)/Abs(m2in+m3in).lt.eps) Then! m2==m3 
 m1=m1in 
 m2=m3in 
   If (m1.gt.m2) Then 
     r=m2/m1 
     If ((1._dp-r).lt.epsR) Then 
        C1C2=1/(3._dp*m1) - (-1 + r)/(4._dp*m1) + (-1 + r)**2/(5._dp*m1)
     Elseif (Abs(r).lt.eps) Then 
        C1C2=large
     Else 
        C1C2=(3 - 4*r + r**2 + 2*Log(r))/(2._dp*m1*(-1 + r)**3)
     End if 
   Else 
     r=m1/m2 
     If ((1._dp-r).lt.epsR) Then 
        C1C2=1/(3._dp*m2) - (-1 + r)/(12._dp*m2) + (-1 + r)**2/(30._dp*m2)
     Elseif (Abs(r).lt.eps) Then 
        C1C2=1/(2._dp*m2)
     Else 
        C1C2=(-1 + (4 - 3*r)*r + 2*r**2*Log(r))/(2._dp*m2*(-1 + r)**3)
     End if 
  End if 

Else!! Different masses are not possible! 
   C1C2 =0._dp 
End if 
 
End Function C1C2 
End Module FlavorKit_QFV_SM 
