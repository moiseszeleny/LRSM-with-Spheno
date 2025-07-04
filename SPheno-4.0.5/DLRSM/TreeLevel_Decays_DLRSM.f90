! ------------------------------------------------------------------------------  
! This file was automatically created by SARAH version 4.15.3 
! SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223,
!           1405.1434, 1411.0675, 1503.03098, 1703.09237, 1706.05372, 1805.07306  
! (c) Florian Staub, Mark Goodsell and Werner Porod 2020  
! ------------------------------------------------------------------------------  
! File created at 21:29 on 17.6.2025   
! ----------------------------------------------------------------------  
 
 
Module TreeLevelDecays_DLRSM
 
Use Control 
Use DecayFunctions 
Use Settings 
Use LoopCouplings_DLRSM 
Use CouplingsForDecays_DLRSM 
Use Model_Data_DLRSM 
Use Mathematics, Only: Li2 
 
 Contains 
 
  
Subroutine FuTwoBodyDecay(i_in,deltaM,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,            & 
& MFv,MFv2,Mhh,Mhh2,MHpm,MHpm2,MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,MVZR2,            & 
& PhiW,TW,UC,ZDR,ZER,UP,ZUR,ZDL,ZEL,ZUL,ZH,ZM,ZW,ZZ,gBL,g2,g3,LAM2,LAM1,RHO1,            & 
& RHO2,ALP2,ALP1,ALP3,LAM5,LAM6,LAM3,LAM4,Y,YQ1,YQ2,Yt,YL,YR,Mux,MU12,MU22,              & 
& k1,vR,gPartial,gT,BR)

Implicit None 
 
Real(dp),Intent(in) :: gBL,g2,g3,LAM2,LAM1,RHO1,RHO2,ALP2,ALP1,ALP3,LAM5,LAM6,LAM3,LAM4,MU12,MU22,           & 
& k1,vR,MAh(4),MAh2(4),MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),MFv(9),              & 
& MFv2(9),Mhh(4),Mhh2(4),MHpm(4),MHpm2(4),MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,            & 
& MVZR,MVZR2,PhiW,TW,UC(4,4),UP(4,4),ZH(4,4),ZZ(3,3)

Complex(dp),Intent(in) :: Y(3,3),YQ1(3,3),YQ2(3,3),Yt(3,3),YL(3,3),YR(3,3),Mux(3,3),ZDR(3,3),ZER(3,3),          & 
& ZUR(3,3),ZDL(3,3),ZEL(3,3),ZUL(3,3),ZM(9,9),ZW(4,4)

Complex(dp) :: cplcFuFuAhL(3,3,4),cplcFuFuAhR(3,3,4),cplcFuFdcHpmL(3,3,4),cplcFuFdcHpmR(3,3,4),      & 
& cplcFuFdcVWLmL(3,3),cplcFuFdcVWLmR(3,3),cplcFuFdcVWRmL(3,3),cplcFuFdcVWRmR(3,3),       & 
& cplcFuFuhhL(3,3,4),cplcFuFuhhR(3,3,4),cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),               & 
& cplcFuFuVZRL(3,3),cplcFuFuVZRR(3,3)

Integer, Intent(in) :: i_in 
Real(dp), Intent(inout) :: gPartial(:,:), gT(:) 
Real(dp), Intent(in) :: deltaM 
Real(dp), Optional, Intent(inout) :: BR(:,:) 
Integer :: i1, i2, i3, i4, i_start, i_end, i_count, gt1, gt2, gt3, gt4 
Real(dp) :: gam, m_in, m1out, m2out, coupReal 
Complex(dp) :: coupC, coupR, coupL, coup 
 
Iname = Iname + 1 
NameOfUnit(Iname) = 'FuTwoBodyDecay'
 
If (i_in.Lt.0) Then 
  i_start = 1 
  i_end = 3
  gT = 0._dp 
  gPartial = 0._dp 
Else If ( (i_in.Ge.1).And.(i_in.Le.3) ) Then 
  i_start = i_in 
  i_end = i_in 
  gT(i_in) = 0._dp 
  gPartial(i_in,:) = 0._dp 
Else 
  If (ErrorLevel.Ge.-1) Then 
     Write(ErrCan,*) 'Problem in subroutine '//NameOfUnit(Iname) 
     Write(ErrCan,*) 'Value of i_in out of range, (i_in,i_max) = ', i_in,3

     Write(*,*) 'Problem in subroutine '//NameOfUnit(Iname) 
     Write(*,*) 'Value of i_in out of range, (i_in,i_max) = ', i_in,3

  End If 
  If (ErrorLevel.Gt.0) Call TerminateProgram 
  If (Present(BR)) BR = 0._dp 
  Iname = Iname -1 
  Return 
End If 
 
Do i1=i_start,i_end 
m_in = MFu(i1) 
If (m_in.Eq.0._dp) Cycle 
Call CouplingsFor_Fu_decays_2B(m_in,i1,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,           & 
& MFv,MFv2,Mhh,Mhh2,MHpm,MHpm2,MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,MVZR2,            & 
& PhiW,TW,UC,ZDR,ZER,UP,ZUR,ZDL,ZEL,ZUL,ZH,ZM,ZW,ZZ,gBL,g2,g3,LAM2,LAM1,RHO1,            & 
& RHO2,ALP2,ALP1,ALP3,LAM5,LAM6,LAM3,LAM4,Y,YQ1,YQ2,Yt,YL,YR,Mux,MU12,MU22,              & 
& k1,vR,cplcFuFuAhL,cplcFuFuAhR,cplcFuFdcHpmL,cplcFuFdcHpmR,cplcFuFdcVWLmL,              & 
& cplcFuFdcVWLmR,cplcFuFdcVWRmL,cplcFuFdcVWRmR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZL,      & 
& cplcFuFuVZR,cplcFuFuVZRL,cplcFuFuVZRR,deltaM)

i_count = 1 

 
! ----------------------------------------------
! Fu, Ah
! ----------------------------------------------

 
Do gt1= 1, 3
  Do gt2=3, 4
m1out = MFu(gt1)
m2out = MAh(gt2)
coupL = cplcFuFuAhL(i1,gt1,gt2)
coupR = cplcFuFuAhR(i1,gt1,gt2)
Call FermionToFermionScalar(m_in,m1out,m2out,coupL,coupR,gam) 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 
End Do 
 

 
! ----------------------------------------------
! Fd, conj[Hpm]
! ----------------------------------------------

 
Do gt1= 1, 3
  Do gt2=3, 4
m1out = MFd(gt1)
m2out = MHpm(gt2)
coupL = cplcFuFdcHpmL(i1,gt1,gt2)
coupR = cplcFuFdcHpmR(i1,gt1,gt2)
Call FermionToFermionScalar(m_in,m1out,m2out,coupL,coupR,gam) 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
If (gt1.eq.3) Then 
  BR_tHb = gPartial(i1,i_count) 
End if 
i_count = i_count +1 
  End Do 
End Do 
 

 
! ----------------------------------------------
! Fd, conj[VWLm]
! ----------------------------------------------

 
Do gt1= 1, 3
m1out = MFd(gt1)
m2out = MVWLm
coupL = cplcFuFdcVWLmL(i1,gt1)
coupR = cplcFuFdcVWLmR(i1,gt1)
Call FermionToFermionVectorBoson(m_in,m1out,m2out,coupL,coupR,gam) 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
If (gt1.eq.3) Then 
  BR_tWb = gPartial(i1,i_count) 
End if 
i_count = i_count +1 
  End Do 

 
! ----------------------------------------------
! Fd, conj[VWRm]
! ----------------------------------------------

 
Do gt1= 1, 3
m1out = MFd(gt1)
m2out = MVWRm
coupL = cplcFuFdcVWRmL(i1,gt1)
coupR = cplcFuFdcVWRmR(i1,gt1)
Call FermionToFermionVectorBoson(m_in,m1out,m2out,coupL,coupR,gam) 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 

 
! ----------------------------------------------
! Fu, hh
! ----------------------------------------------

 
Do gt1= 1, 3
  Do gt2=1, 4
m1out = MFu(gt1)
m2out = Mhh(gt2)
coupL = cplcFuFuhhL(i1,gt1,gt2)
coupR = cplcFuFuhhR(i1,gt1,gt2)
Call FermionToFermionScalar(m_in,m1out,m2out,coupL,coupR,gam) 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 
End Do 
 

 
! ----------------------------------------------
! Fu, VZ
! ----------------------------------------------

 
Do gt1= 1, 3
m1out = MFu(gt1)
m2out = MVZ
coupL = cplcFuFuVZL(i1,gt1)
coupR = cplcFuFuVZR(i1,gt1)
Call FermionToFermionVectorBoson(m_in,m1out,m2out,coupL,coupR,gam) 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 

 
! ----------------------------------------------
! Fu, VZR
! ----------------------------------------------

 
Do gt1= 1, 3
m1out = MFu(gt1)
m2out = MVZR
coupL = cplcFuFuVZRL(i1,gt1)
coupR = cplcFuFuVZRR(i1,gt1)
Call FermionToFermionVectorBoson(m_in,m1out,m2out,coupL,coupR,gam) 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 
If ((Present(BR)).And.(gT(i1).Eq.0)) Then 
  BR(i1,:) = 0._dp 
Else If (Present(BR)) Then 
  BR(i1,:) = gPartial(i1,:)/gT(i1) 
End if 
 
End Do 
 
Iname = Iname - 1 
 
End Subroutine FuTwoBodyDecay
 
 
Subroutine FeTwoBodyDecay(i_in,deltaM,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,            & 
& MFv,MFv2,Mhh,Mhh2,MHpm,MHpm2,MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,MVZR2,            & 
& PhiW,TW,UC,ZDR,ZER,UP,ZUR,ZDL,ZEL,ZUL,ZH,ZM,ZW,ZZ,gBL,g2,g3,LAM2,LAM1,RHO1,            & 
& RHO2,ALP2,ALP1,ALP3,LAM5,LAM6,LAM3,LAM4,Y,YQ1,YQ2,Yt,YL,YR,Mux,MU12,MU22,              & 
& k1,vR,gPartial,gT,BR)

Implicit None 
 
Real(dp),Intent(in) :: gBL,g2,g3,LAM2,LAM1,RHO1,RHO2,ALP2,ALP1,ALP3,LAM5,LAM6,LAM3,LAM4,MU12,MU22,           & 
& k1,vR,MAh(4),MAh2(4),MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),MFv(9),              & 
& MFv2(9),Mhh(4),Mhh2(4),MHpm(4),MHpm2(4),MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,            & 
& MVZR,MVZR2,PhiW,TW,UC(4,4),UP(4,4),ZH(4,4),ZZ(3,3)

Complex(dp),Intent(in) :: Y(3,3),YQ1(3,3),YQ2(3,3),Yt(3,3),YL(3,3),YR(3,3),Mux(3,3),ZDR(3,3),ZER(3,3),          & 
& ZUR(3,3),ZDL(3,3),ZEL(3,3),ZUL(3,3),ZM(9,9),ZW(4,4)

Complex(dp) :: cplcFeFeAhL(3,3,4),cplcFeFeAhR(3,3,4),cplcFeFehhL(3,3,4),cplcFeFehhR(3,3,4),          & 
& cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),cplcFeFeVZRL(3,3),cplcFeFeVZRR(3,3),cplcFeFvHpmL(3,9,4),& 
& cplcFeFvHpmR(3,9,4),cplcFeFvVWLmL(3,9),cplcFeFvVWLmR(3,9),cplcFeFvVWRmL(3,9),          & 
& cplcFeFvVWRmR(3,9)

Integer, Intent(in) :: i_in 
Real(dp), Intent(inout) :: gPartial(:,:), gT(:) 
Real(dp), Intent(in) :: deltaM 
Real(dp), Optional, Intent(inout) :: BR(:,:) 
Integer :: i1, i2, i3, i4, i_start, i_end, i_count, gt1, gt2, gt3, gt4 
Real(dp) :: gam, m_in, m1out, m2out, coupReal 
Complex(dp) :: coupC, coupR, coupL, coup 
 
Iname = Iname + 1 
NameOfUnit(Iname) = 'FeTwoBodyDecay'
 
If (i_in.Lt.0) Then 
  i_start = 1 
  i_end = 3
  gT = 0._dp 
  gPartial = 0._dp 
Else If ( (i_in.Ge.1).And.(i_in.Le.3) ) Then 
  i_start = i_in 
  i_end = i_in 
  gT(i_in) = 0._dp 
  gPartial(i_in,:) = 0._dp 
Else 
  If (ErrorLevel.Ge.-1) Then 
     Write(ErrCan,*) 'Problem in subroutine '//NameOfUnit(Iname) 
     Write(ErrCan,*) 'Value of i_in out of range, (i_in,i_max) = ', i_in,3

     Write(*,*) 'Problem in subroutine '//NameOfUnit(Iname) 
     Write(*,*) 'Value of i_in out of range, (i_in,i_max) = ', i_in,3

  End If 
  If (ErrorLevel.Gt.0) Call TerminateProgram 
  If (Present(BR)) BR = 0._dp 
  Iname = Iname -1 
  Return 
End If 
 
Do i1=i_start,i_end 
m_in = MFe(i1) 
If (m_in.Eq.0._dp) Cycle 
Call CouplingsFor_Fe_decays_2B(m_in,i1,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,           & 
& MFv,MFv2,Mhh,Mhh2,MHpm,MHpm2,MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,MVZR2,            & 
& PhiW,TW,UC,ZDR,ZER,UP,ZUR,ZDL,ZEL,ZUL,ZH,ZM,ZW,ZZ,gBL,g2,g3,LAM2,LAM1,RHO1,            & 
& RHO2,ALP2,ALP1,ALP3,LAM5,LAM6,LAM3,LAM4,Y,YQ1,YQ2,Yt,YL,YR,Mux,MU12,MU22,              & 
& k1,vR,cplcFeFeAhL,cplcFeFeAhR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,cplcFeFeVZR,         & 
& cplcFeFeVZRL,cplcFeFeVZRR,cplcFeFvHpmL,cplcFeFvHpmR,cplcFeFvVWLmL,cplcFeFvVWLmR,       & 
& cplcFeFvVWRmL,cplcFeFvVWRmR,deltaM)

i_count = 1 

 
! ----------------------------------------------
! Fe, Ah
! ----------------------------------------------

 
Do gt1= 1, 3
  Do gt2=3, 4
m1out = MFe(gt1)
m2out = MAh(gt2)
coupL = cplcFeFeAhL(i1,gt1,gt2)
coupR = cplcFeFeAhR(i1,gt1,gt2)
Call FermionToFermionScalar(m_in,m1out,m2out,coupL,coupR,gam) 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 
End Do 
 

 
! ----------------------------------------------
! Fe, hh
! ----------------------------------------------

 
Do gt1= 1, 3
  Do gt2=1, 4
m1out = MFe(gt1)
m2out = Mhh(gt2)
coupL = cplcFeFehhL(i1,gt1,gt2)
coupR = cplcFeFehhR(i1,gt1,gt2)
Call FermionToFermionScalar(m_in,m1out,m2out,coupL,coupR,gam) 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 
End Do 
 

 
! ----------------------------------------------
! Fe, VZ
! ----------------------------------------------

 
Do gt1= 1, 3
m1out = MFe(gt1)
m2out = MVZ
coupL = cplcFeFeVZL(i1,gt1)
coupR = cplcFeFeVZR(i1,gt1)
Call FermionToFermionVectorBoson(m_in,m1out,m2out,coupL,coupR,gam) 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 

 
! ----------------------------------------------
! Fe, VZR
! ----------------------------------------------

 
Do gt1= 1, 3
m1out = MFe(gt1)
m2out = MVZR
coupL = cplcFeFeVZRL(i1,gt1)
coupR = cplcFeFeVZRR(i1,gt1)
Call FermionToFermionVectorBoson(m_in,m1out,m2out,coupL,coupR,gam) 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 

 
! ----------------------------------------------
! Fv, Hpm
! ----------------------------------------------

 
Do gt1= 1, 9
  Do gt2=3, 4
m1out = MFv(gt1)
m2out = MHpm(gt2)
coupL = cplcFeFvHpmL(i1,gt1,gt2)
coupR = cplcFeFvHpmR(i1,gt1,gt2)
Call FermionToFermionScalar(m_in,m1out,m2out,coupL,coupR,gam) 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 
End Do 
 

 
! ----------------------------------------------
! Fv, VWLm
! ----------------------------------------------

 
Do gt1= 1, 9
m1out = MFv(gt1)
m2out = MVWLm
coupL = cplcFeFvVWLmL(i1,gt1)
coupR = cplcFeFvVWLmR(i1,gt1)
Call FermionToFermionVectorBoson(m_in,m1out,m2out,coupL,coupR,gam) 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 

 
! ----------------------------------------------
! Fv, VWRm
! ----------------------------------------------

 
Do gt1= 1, 9
m1out = MFv(gt1)
m2out = MVWRm
coupL = cplcFeFvVWRmL(i1,gt1)
coupR = cplcFeFvVWRmR(i1,gt1)
Call FermionToFermionVectorBoson(m_in,m1out,m2out,coupL,coupR,gam) 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 
If ((Present(BR)).And.(gT(i1).Eq.0)) Then 
  BR(i1,:) = 0._dp 
Else If (Present(BR)) Then 
  BR(i1,:) = gPartial(i1,:)/gT(i1) 
End if 
 
End Do 
 
Iname = Iname - 1 
 
End Subroutine FeTwoBodyDecay
 
 
Subroutine FdTwoBodyDecay(i_in,deltaM,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,            & 
& MFv,MFv2,Mhh,Mhh2,MHpm,MHpm2,MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,MVZR2,            & 
& PhiW,TW,UC,ZDR,ZER,UP,ZUR,ZDL,ZEL,ZUL,ZH,ZM,ZW,ZZ,gBL,g2,g3,LAM2,LAM1,RHO1,            & 
& RHO2,ALP2,ALP1,ALP3,LAM5,LAM6,LAM3,LAM4,Y,YQ1,YQ2,Yt,YL,YR,Mux,MU12,MU22,              & 
& k1,vR,gPartial,gT,BR)

Implicit None 
 
Real(dp),Intent(in) :: gBL,g2,g3,LAM2,LAM1,RHO1,RHO2,ALP2,ALP1,ALP3,LAM5,LAM6,LAM3,LAM4,MU12,MU22,           & 
& k1,vR,MAh(4),MAh2(4),MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),MFv(9),              & 
& MFv2(9),Mhh(4),Mhh2(4),MHpm(4),MHpm2(4),MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,            & 
& MVZR,MVZR2,PhiW,TW,UC(4,4),UP(4,4),ZH(4,4),ZZ(3,3)

Complex(dp),Intent(in) :: Y(3,3),YQ1(3,3),YQ2(3,3),Yt(3,3),YL(3,3),YR(3,3),Mux(3,3),ZDR(3,3),ZER(3,3),          & 
& ZUR(3,3),ZDL(3,3),ZEL(3,3),ZUL(3,3),ZM(9,9),ZW(4,4)

Complex(dp) :: cplcFdFdAhL(3,3,4),cplcFdFdAhR(3,3,4),cplcFdFdhhL(3,3,4),cplcFdFdhhR(3,3,4),          & 
& cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),cplcFdFdVZRL(3,3),cplcFdFdVZRR(3,3),cplcFdFuHpmL(3,3,4),& 
& cplcFdFuHpmR(3,3,4),cplcFdFuVWLmL(3,3),cplcFdFuVWLmR(3,3),cplcFdFuVWRmL(3,3),          & 
& cplcFdFuVWRmR(3,3)

Integer, Intent(in) :: i_in 
Real(dp), Intent(inout) :: gPartial(:,:), gT(:) 
Real(dp), Intent(in) :: deltaM 
Real(dp), Optional, Intent(inout) :: BR(:,:) 
Integer :: i1, i2, i3, i4, i_start, i_end, i_count, gt1, gt2, gt3, gt4 
Real(dp) :: gam, m_in, m1out, m2out, coupReal 
Complex(dp) :: coupC, coupR, coupL, coup 
 
Iname = Iname + 1 
NameOfUnit(Iname) = 'FdTwoBodyDecay'
 
If (i_in.Lt.0) Then 
  i_start = 1 
  i_end = 3
  gT = 0._dp 
  gPartial = 0._dp 
Else If ( (i_in.Ge.1).And.(i_in.Le.3) ) Then 
  i_start = i_in 
  i_end = i_in 
  gT(i_in) = 0._dp 
  gPartial(i_in,:) = 0._dp 
Else 
  If (ErrorLevel.Ge.-1) Then 
     Write(ErrCan,*) 'Problem in subroutine '//NameOfUnit(Iname) 
     Write(ErrCan,*) 'Value of i_in out of range, (i_in,i_max) = ', i_in,3

     Write(*,*) 'Problem in subroutine '//NameOfUnit(Iname) 
     Write(*,*) 'Value of i_in out of range, (i_in,i_max) = ', i_in,3

  End If 
  If (ErrorLevel.Gt.0) Call TerminateProgram 
  If (Present(BR)) BR = 0._dp 
  Iname = Iname -1 
  Return 
End If 
 
Do i1=i_start,i_end 
m_in = MFd(i1) 
If (m_in.Eq.0._dp) Cycle 
Call CouplingsFor_Fd_decays_2B(m_in,i1,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,           & 
& MFv,MFv2,Mhh,Mhh2,MHpm,MHpm2,MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,MVZR2,            & 
& PhiW,TW,UC,ZDR,ZER,UP,ZUR,ZDL,ZEL,ZUL,ZH,ZM,ZW,ZZ,gBL,g2,g3,LAM2,LAM1,RHO1,            & 
& RHO2,ALP2,ALP1,ALP3,LAM5,LAM6,LAM3,LAM4,Y,YQ1,YQ2,Yt,YL,YR,Mux,MU12,MU22,              & 
& k1,vR,cplcFdFdAhL,cplcFdFdAhR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZR,         & 
& cplcFdFdVZRL,cplcFdFdVZRR,cplcFdFuHpmL,cplcFdFuHpmR,cplcFdFuVWLmL,cplcFdFuVWLmR,       & 
& cplcFdFuVWRmL,cplcFdFuVWRmR,deltaM)

i_count = 1 

 
! ----------------------------------------------
! Fd, Ah
! ----------------------------------------------

 
Do gt1= 1, 3
  Do gt2=3, 4
m1out = MFd(gt1)
m2out = MAh(gt2)
coupL = cplcFdFdAhL(i1,gt1,gt2)
coupR = cplcFdFdAhR(i1,gt1,gt2)
Call FermionToFermionScalar(m_in,m1out,m2out,coupL,coupR,gam) 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 
End Do 
 

 
! ----------------------------------------------
! Fd, hh
! ----------------------------------------------

 
Do gt1= 1, 3
  Do gt2=1, 4
m1out = MFd(gt1)
m2out = Mhh(gt2)
coupL = cplcFdFdhhL(i1,gt1,gt2)
coupR = cplcFdFdhhR(i1,gt1,gt2)
Call FermionToFermionScalar(m_in,m1out,m2out,coupL,coupR,gam) 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 
End Do 
 

 
! ----------------------------------------------
! Fd, VZ
! ----------------------------------------------

 
Do gt1= 1, 3
m1out = MFd(gt1)
m2out = MVZ
coupL = cplcFdFdVZL(i1,gt1)
coupR = cplcFdFdVZR(i1,gt1)
Call FermionToFermionVectorBoson(m_in,m1out,m2out,coupL,coupR,gam) 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 

 
! ----------------------------------------------
! Fd, VZR
! ----------------------------------------------

 
Do gt1= 1, 3
m1out = MFd(gt1)
m2out = MVZR
coupL = cplcFdFdVZRL(i1,gt1)
coupR = cplcFdFdVZRR(i1,gt1)
Call FermionToFermionVectorBoson(m_in,m1out,m2out,coupL,coupR,gam) 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 

 
! ----------------------------------------------
! Fu, Hpm
! ----------------------------------------------

 
Do gt1= 1, 3
  Do gt2=3, 4
m1out = MFu(gt1)
m2out = MHpm(gt2)
coupL = cplcFdFuHpmL(i1,gt1,gt2)
coupR = cplcFdFuHpmR(i1,gt1,gt2)
Call FermionToFermionScalar(m_in,m1out,m2out,coupL,coupR,gam) 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 
End Do 
 

 
! ----------------------------------------------
! Fu, VWLm
! ----------------------------------------------

 
Do gt1= 1, 3
m1out = MFu(gt1)
m2out = MVWLm
coupL = cplcFdFuVWLmL(i1,gt1)
coupR = cplcFdFuVWLmR(i1,gt1)
Call FermionToFermionVectorBoson(m_in,m1out,m2out,coupL,coupR,gam) 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 

 
! ----------------------------------------------
! Fu, VWRm
! ----------------------------------------------

 
Do gt1= 1, 3
m1out = MFu(gt1)
m2out = MVWRm
coupL = cplcFdFuVWRmL(i1,gt1)
coupR = cplcFdFuVWRmR(i1,gt1)
Call FermionToFermionVectorBoson(m_in,m1out,m2out,coupL,coupR,gam) 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 
If ((Present(BR)).And.(gT(i1).Eq.0)) Then 
  BR(i1,:) = 0._dp 
Else If (Present(BR)) Then 
  BR(i1,:) = gPartial(i1,:)/gT(i1) 
End if 
 
End Do 
 
Iname = Iname - 1 
 
End Subroutine FdTwoBodyDecay
 
 
Subroutine hhTwoBodyDecay(i_in,deltaM,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,            & 
& MFv,MFv2,Mhh,Mhh2,MHpm,MHpm2,MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,MVZR2,            & 
& PhiW,TW,UC,ZDR,ZER,UP,ZUR,ZDL,ZEL,ZUL,ZH,ZM,ZW,ZZ,gBL,g2,g3,LAM2,LAM1,RHO1,            & 
& RHO2,ALP2,ALP1,ALP3,LAM5,LAM6,LAM3,LAM4,Y,YQ1,YQ2,Yt,YL,YR,Mux,MU12,MU22,              & 
& k1,vR,gPartial,gT,BR)

Implicit None 
 
Real(dp),Intent(in) :: gBL,g2,g3,LAM2,LAM1,RHO1,RHO2,ALP2,ALP1,ALP3,LAM5,LAM6,LAM3,LAM4,MU12,MU22,           & 
& k1,vR,MAh(4),MAh2(4),MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),MFv(9),              & 
& MFv2(9),Mhh(4),Mhh2(4),MHpm(4),MHpm2(4),MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,            & 
& MVZR,MVZR2,PhiW,TW,UC(4,4),UP(4,4),ZH(4,4),ZZ(3,3)

Complex(dp),Intent(in) :: Y(3,3),YQ1(3,3),YQ2(3,3),Yt(3,3),YL(3,3),YR(3,3),Mux(3,3),ZDR(3,3),ZER(3,3),          & 
& ZUR(3,3),ZDL(3,3),ZEL(3,3),ZUL(3,3),ZM(9,9),ZW(4,4)

Complex(dp) :: cplHiggsPP(4),cplHiggsGG(4),cplHiggsZZvirt(4),cplHiggsWWvirt(4),cplAhAhhh(4,4,4),     & 
& cplAhhhVZ(4,4),cplAhhhVZR(4,4),cplcFdFdhhL(3,3,4),cplcFdFdhhR(3,3,4),cplcFeFehhL(3,3,4),& 
& cplcFeFehhR(3,3,4),cplcFuFuhhL(3,3,4),cplcFuFuhhR(3,3,4),cplFvFvhhL(9,9,4),            & 
& cplFvFvhhR(9,9,4),cplhhhhhh(4,4,4),cplhhHpmcHpm(4,4,4),cplhhHpmcVWLm(4,4),             & 
& cplhhHpmcVWRm(4,4),cplhhcVWLmVWLm(4),cplhhcVWRmVWLm(4),cplhhcVWRmVWRm(4),              & 
& cplhhVZVZ(4),cplhhVZVZR(4),cplhhVZRVZR(4)

Integer, Intent(in) :: i_in 
Real(dp), Intent(inout) :: gPartial(:,:), gT(:) 
Real(dp), Intent(in) :: deltaM 
Real(dp), Optional, Intent(inout) :: BR(:,:) 
Integer :: i1, i2, i3, i4, i_start, i_end, i_count, gt1, gt2, gt3, gt4 
Real(dp) :: gam, m_in, m1out, m2out, coupReal 
Complex(dp) :: coupC, coupR, coupL, coup 
 
Real(dp) :: alpha3 
Iname = Iname + 1 
NameOfUnit(Iname) = 'hhTwoBodyDecay'
 
If (i_in.Lt.0) Then 
  i_start = 1 
  i_end = 4
  gT = 0._dp 
  gPartial = 0._dp 
Else If ( (i_in.Ge.1).And.(i_in.Le.4) ) Then 
  i_start = i_in 
  i_end = i_in 
  gT(i_in) = 0._dp 
  gPartial(i_in,:) = 0._dp 
Else 
  If (ErrorLevel.Ge.-1) Then 
     Write(ErrCan,*) 'Problem in subroutine '//NameOfUnit(Iname) 
     Write(ErrCan,*) 'Value of i_in out of range, (i_in,i_max) = ', i_in,4

     Write(*,*) 'Problem in subroutine '//NameOfUnit(Iname) 
     Write(*,*) 'Value of i_in out of range, (i_in,i_max) = ', i_in,4

  End If 
  If (ErrorLevel.Gt.0) Call TerminateProgram 
  If (Present(BR)) BR = 0._dp 
  Iname = Iname -1 
  Return 
End If 
 
Do i1=i_start,i_end 
m_in = Mhh(i1) 
If (m_in.Eq.0._dp) Cycle 
Call CouplingsFor_hh_decays_2B(m_in,i1,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,           & 
& MFv,MFv2,Mhh,Mhh2,MHpm,MHpm2,MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,MVZR2,            & 
& PhiW,TW,UC,ZDR,ZER,UP,ZUR,ZDL,ZEL,ZUL,ZH,ZM,ZW,ZZ,gBL,g2,g3,LAM2,LAM1,RHO1,            & 
& RHO2,ALP2,ALP1,ALP3,LAM5,LAM6,LAM3,LAM4,Y,YQ1,YQ2,Yt,YL,YR,Mux,MU12,MU22,              & 
& k1,vR,cplHiggsPP,cplHiggsGG,cplHiggsZZvirt,cplHiggsWWvirt,cplAhAhhh,cplAhhhVZ,         & 
& cplAhhhVZR,cplcFdFdhhL,cplcFdFdhhR,cplcFeFehhL,cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,    & 
& cplFvFvhhL,cplFvFvhhR,cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWLm,cplhhHpmcVWRm,              & 
& cplhhcVWLmVWLm,cplhhcVWRmVWLm,cplhhcVWRmVWRm,cplhhVZVZ,cplhhVZVZR,cplhhVZRVZR,deltaM)

i_count = 1 

 
! ----------------------------------------------
! VP, VP
! ----------------------------------------------

 
m1out = 0._dp
m2out = 0._dp
gam = G_F * m_in**3 * oosqrt2 * oo128pi3 * Abs(cplHiggsPP(i1))**2 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 

 
! ----------------------------------------------
! VG, VG
! ----------------------------------------------

 
m1out = 0._dp
m2out = 0._dp
gam = G_F * m_in**3 * oosqrt2 * oo36pi3 * Abs(cplHiggsGG(i1))**2 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 

 
! ----------------------------------------------
! VZ, VZ
! ----------------------------------------------

 
m1out = MVZ
m2out = MVZ
If (m_in.le.2._dp*m1out) Then 
coupReal = cplHiggsZZvirt(i1)
Call ScalarToVectorBosonsVR(m_in,m1out,coupReal,gam) 
Else 
gam = 0._dp 
End if 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 

 
! ----------------------------------------------
! VWLm, VWLm
! ----------------------------------------------

 
m1out = MVWLm
m2out = MVWLm
If (m_in.le.2._dp*m1out) Then 
coupReal = cplHiggsWWvirt(i1)
Call ScalarToVectorBosonsVR(m_in,m1out,coupReal,gam) 
Else 
gam = 0._dp 
End if 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 

 
! ----------------------------------------------
! Ah, Ah
! ----------------------------------------------

 
Do gt1= 3, 4
  Do gt2= gt1, 4
m1out = MAh(gt1)
m2out = MAh(gt2)
coup = cplAhAhhh(gt1,gt2,i1)
Call ScalarToTwoScalars(m_in,m1out,m2out,coup,gam) 
If (gt1.ne.gt2) gam = 2._dp*gam 
gPartial(i1,i_count) = 1._dp/2._dp*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
If (gt1.eq.gt2) Then 
  BRHAA(i1,gt1) = gPartial(i1,i_count) 
End if 
  BRHAAijk(i1,gt1,gt2) = gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 
End Do 
 

 
! ----------------------------------------------
! Ah, VZ
! ----------------------------------------------

 
Do gt1= 3, 4
m1out = MAh(gt1)
m2out = MVZ
coup = cplAhhhVZ(gt1,i1)
Call ScalarToScalarVectorBoson(m_in,m1out,m2out,coup,gam) 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
  BRHAZ(i1,gt1) = gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 

 
! ----------------------------------------------
! Ah, VZR
! ----------------------------------------------

 
Do gt1= 3, 4
m1out = MAh(gt1)
m2out = MVZR
coup = cplAhhhVZR(gt1,i1)
Call ScalarToScalarVectorBoson(m_in,m1out,m2out,coup,gam) 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 

 
! ----------------------------------------------
! bar[Fd], Fd
! ----------------------------------------------

 
Do gt1= 1, 3
  Do gt2=1, 3
m1out = MFd(gt1)
m2out = MFd(gt2)
coupL = cplcFdFdhhL(gt1,gt2,i1)
coupR = cplcFdFdhhR(gt1,gt2,i1)
Call ScalarToTwoFermions(m_in,m1out,m2out,coupL,coupR,gam) 
gPartial(i1,i_count) = 3*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 
End Do 
 

 
! ----------------------------------------------
! bar[Fe], Fe
! ----------------------------------------------

 
Do gt1= 1, 3
  Do gt2=1, 3
m1out = MFe(gt1)
m2out = MFe(gt2)
coupL = cplcFeFehhL(gt1,gt2,i1)
coupR = cplcFeFehhR(gt1,gt2,i1)
Call ScalarToTwoFermions(m_in,m1out,m2out,coupL,coupR,gam) 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 
End Do 
 

 
! ----------------------------------------------
! bar[Fu], Fu
! ----------------------------------------------

 
Do gt1= 1, 3
  Do gt2=1, 3
m1out = MFu(gt1)
m2out = MFu(gt2)
coupL = cplcFuFuhhL(gt1,gt2,i1)
coupR = cplcFuFuhhR(gt1,gt2,i1)
Call ScalarToTwoFermions(m_in,m1out,m2out,coupL,coupR,gam) 
gPartial(i1,i_count) = 3*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 
End Do 
 

 
! ----------------------------------------------
! Fv, Fv
! ----------------------------------------------

 
Do gt1= 1, 9
  Do gt2= gt1, 9
m1out = MFv(gt1)
m2out = MFv(gt2)
coupL = cplFvFvhhL(gt1,gt2,i1)
coupR = cplFvFvhhR(gt1,gt2,i1)
Call ScalarToTwoFermions(m_in,m1out,m2out,coupL,coupR,gam) 
If (gt1.ne.gt2) gam = 2._dp*gam 
gPartial(i1,i_count) = 1._dp/2._dp*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 
End Do 
 

 
! ----------------------------------------------
! hh, hh
! ----------------------------------------------

 
Do gt1= 1, 4
  Do gt2= gt1, 4
m1out = Mhh(gt1)
m2out = Mhh(gt2)
coup = cplhhhhhh(i1,gt1,gt2)
Call ScalarToTwoScalars(m_in,m1out,m2out,coup,gam) 
If (gt1.ne.gt2) gam = 2._dp*gam 
gPartial(i1,i_count) = 1._dp/2._dp*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
If (gt1.eq.gt2) Then 
  BRHHH(i1,gt1) = gPartial(i1,i_count) 
End if 
  BRHHHijk(i1,gt1,gt2) = gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 
End Do 
 

 
! ----------------------------------------------
! conj[Hpm], Hpm
! ----------------------------------------------

 
Do gt1= 3, 4
  Do gt2=3, 4
m1out = MHpm(gt1)
m2out = MHpm(gt2)
coup = cplhhHpmcHpm(i1,gt2,gt1)
Call ScalarToTwoScalars(m_in,m1out,m2out,coup,gam) 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 
End Do 
 

 
! ----------------------------------------------
! Hpm, conj[VWLm]
! ----------------------------------------------

 
Do gt1= 3, 4
m1out = MHpm(gt1)
m2out = MVWLm
coup = cplhhHpmcVWLm(i1,gt1)
Call ScalarToScalarVectorBoson(m_in,m1out,m2out,coup,gam) 
gPartial(i1,i_count) = 2*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
  BRHHpW(i1,gt2) = gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 

 
! ----------------------------------------------
! Hpm, conj[VWRm]
! ----------------------------------------------

 
Do gt1= 3, 4
m1out = MHpm(gt1)
m2out = MVWRm
coup = cplhhHpmcVWRm(i1,gt1)
Call ScalarToScalarVectorBoson(m_in,m1out,m2out,coup,gam) 
gPartial(i1,i_count) = 2*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 

 
! ----------------------------------------------
! VWLm, conj[VWLm]
! ----------------------------------------------

 
m1out = MVWLm
m2out = MVWLm
coup = cplhhcVWLmVWLm(i1)
Call ScalarToTwoVectorBosons(m_in,m1out,m2out,coup,gam) 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 

 
! ----------------------------------------------
! VWLm, conj[VWRm]
! ----------------------------------------------

 
m1out = MVWLm
m2out = MVWRm
coup = cplhhcVWRmVWLm(i1)
Call ScalarToTwoVectorBosons(m_in,m1out,m2out,coup,gam) 
gPartial(i1,i_count) = 2*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 

 
! ----------------------------------------------
! VWRm, conj[VWRm]
! ----------------------------------------------

 
m1out = MVWRm
m2out = MVWRm
coup = cplhhcVWRmVWRm(i1)
Call ScalarToTwoVectorBosons(m_in,m1out,m2out,coup,gam) 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 

 
! ----------------------------------------------
! VZ, VZ
! ----------------------------------------------

 
m1out = MVZ
m2out = MVZ
coup = cplhhVZVZ(i1)
Call ScalarToTwoVectorBosons(m_in,m1out,m2out,coup,gam) 
gPartial(i1,i_count) = 1._dp/2._dp*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 

 
! ----------------------------------------------
! VZ, VZR
! ----------------------------------------------

 
m1out = MVZ
m2out = MVZR
coup = cplhhVZVZR(i1)
Call ScalarToTwoVectorBosons(m_in,m1out,m2out,coup,gam) 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 

 
! ----------------------------------------------
! VZR, VZR
! ----------------------------------------------

 
m1out = MVZR
m2out = MVZR
coup = cplhhVZRVZR(i1)
Call ScalarToTwoVectorBosons(m_in,m1out,m2out,coup,gam) 
gPartial(i1,i_count) = 1._dp/2._dp*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
If ((Present(BR)).And.(gT(i1).Eq.0)) Then 
  BR(i1,:) = 0._dp 
Else If (Present(BR)) Then 
  BR(i1,:) = gPartial(i1,:)/gT(i1) 
End if 
 
End Do 
 
Iname = Iname - 1 
 
Contains 
 
  Real(dp) Function FFqcd(mf, mA, alpha_s)
  Implicit None
   Real(dp) , Intent(in) :: mf, mA, alpha_s
   Real(dp) :: fac, beta, beta2, ratio, R_beta_1, Ln_R_beta_1, Ln_beta

   FFqcd = 0._dp
   ratio = mf / mA
   If (ratio.Ge.0.5_dp) Return ! decay is kinematically forbitten

   If (ratio.Ge.0.495_dp) Return ! Coloumb singularity

    beta2 = 1._dp - 4._dp * ratio**2
    beta = Sqrt(beta2)
    
    R_beta_1 = (1. - beta) / (1._dp + beta)
    Ln_beta = Log(beta)
    Ln_R_beta_1 = Log(R_beta_1)

    fac = (3._dp + 34._dp * beta2 - 13._dp * beta**4) / (16._dp * beta**3)  &
      &     * (-Ln_R_beta_1)                                                &
      & + 0.375_dp * (7._dp - beta2) - 3._dp * Log(4._dp/(1._dp - beta**2)) &
      & - 4._dp * Ln_beta                                                   &
      & + (1._dp + beta**2)                                                 &
      &       * ( 4._dp * Li2(R_beta_1) + 2._dp * Li2(- R_beta_1)           &
      &         + Ln_R_beta_1 * ( 3._dp * Log(2._dp/(1._dp + beta))         &
      &                         + 2._dp * Ln_beta )  ) / beta

    fac = fac - 3._dp * Log(ratio)  ! absorb large logarithms in mass

    FFqcd = 1._dp + 5._dp * alpha_s * fac * oo3pi 

  End  Function FFqcd
End Subroutine hhTwoBodyDecay
 
 
Subroutine FvTwoBodyDecay(i_in,deltaM,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,            & 
& MFv,MFv2,Mhh,Mhh2,MHpm,MHpm2,MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,MVZR2,            & 
& PhiW,TW,UC,ZDR,ZER,UP,ZUR,ZDL,ZEL,ZUL,ZH,ZM,ZW,ZZ,gBL,g2,g3,LAM2,LAM1,RHO1,            & 
& RHO2,ALP2,ALP1,ALP3,LAM5,LAM6,LAM3,LAM4,Y,YQ1,YQ2,Yt,YL,YR,Mux,MU12,MU22,              & 
& k1,vR,gPartial,gT,BR)

Implicit None 
 
Real(dp),Intent(in) :: gBL,g2,g3,LAM2,LAM1,RHO1,RHO2,ALP2,ALP1,ALP3,LAM5,LAM6,LAM3,LAM4,MU12,MU22,           & 
& k1,vR,MAh(4),MAh2(4),MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),MFv(9),              & 
& MFv2(9),Mhh(4),Mhh2(4),MHpm(4),MHpm2(4),MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,            & 
& MVZR,MVZR2,PhiW,TW,UC(4,4),UP(4,4),ZH(4,4),ZZ(3,3)

Complex(dp),Intent(in) :: Y(3,3),YQ1(3,3),YQ2(3,3),Yt(3,3),YL(3,3),YR(3,3),Mux(3,3),ZDR(3,3),ZER(3,3),          & 
& ZUR(3,3),ZDL(3,3),ZEL(3,3),ZUL(3,3),ZM(9,9),ZW(4,4)

Complex(dp) :: cplFvFvAhL(9,9,4),cplFvFvAhR(9,9,4),cplFvFecHpmL(9,3,4),cplFvFecHpmR(9,3,4),          & 
& cplFvFecVWLmL(9,3),cplFvFecVWLmR(9,3),cplFvFecVWRmL(9,3),cplFvFecVWRmR(9,3),           & 
& cplFvFvhhL(9,9,4),cplFvFvhhR(9,9,4),cplFvFvVZL(9,9),cplFvFvVZR(9,9),cplFvFvVZRL(9,9),  & 
& cplFvFvVZRR(9,9)

Integer, Intent(in) :: i_in 
Real(dp), Intent(inout) :: gPartial(:,:), gT(:) 
Real(dp), Intent(in) :: deltaM 
Real(dp), Optional, Intent(inout) :: BR(:,:) 
Integer :: i1, i2, i3, i4, i_start, i_end, i_count, gt1, gt2, gt3, gt4 
Real(dp) :: gam, m_in, m1out, m2out, coupReal 
Complex(dp) :: coupC, coupR, coupL, coup 
 
Iname = Iname + 1 
NameOfUnit(Iname) = 'FvTwoBodyDecay'
 
If (i_in.Lt.0) Then 
  i_start = 1 
  i_end = 9
  gT = 0._dp 
  gPartial = 0._dp 
Else If ( (i_in.Ge.1).And.(i_in.Le.9) ) Then 
  i_start = i_in 
  i_end = i_in 
  gT(i_in) = 0._dp 
  gPartial(i_in,:) = 0._dp 
Else 
  If (ErrorLevel.Ge.-1) Then 
     Write(ErrCan,*) 'Problem in subroutine '//NameOfUnit(Iname) 
     Write(ErrCan,*) 'Value of i_in out of range, (i_in,i_max) = ', i_in,9

     Write(*,*) 'Problem in subroutine '//NameOfUnit(Iname) 
     Write(*,*) 'Value of i_in out of range, (i_in,i_max) = ', i_in,9

  End If 
  If (ErrorLevel.Gt.0) Call TerminateProgram 
  If (Present(BR)) BR = 0._dp 
  Iname = Iname -1 
  Return 
End If 
 
Do i1=i_start,i_end 
m_in = MFv(i1) 
If (m_in.Eq.0._dp) Cycle 
Call CouplingsFor_Fv_decays_2B(m_in,i1,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,           & 
& MFv,MFv2,Mhh,Mhh2,MHpm,MHpm2,MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,MVZR2,            & 
& PhiW,TW,UC,ZDR,ZER,UP,ZUR,ZDL,ZEL,ZUL,ZH,ZM,ZW,ZZ,gBL,g2,g3,LAM2,LAM1,RHO1,            & 
& RHO2,ALP2,ALP1,ALP3,LAM5,LAM6,LAM3,LAM4,Y,YQ1,YQ2,Yt,YL,YR,Mux,MU12,MU22,              & 
& k1,vR,cplFvFvAhL,cplFvFvAhR,cplFvFecHpmL,cplFvFecHpmR,cplFvFecVWLmL,cplFvFecVWLmR,     & 
& cplFvFecVWRmL,cplFvFecVWRmR,cplFvFvhhL,cplFvFvhhR,cplFvFvVZL,cplFvFvVZR,               & 
& cplFvFvVZRL,cplFvFvVZRR,deltaM)

i_count = 1 

 
! ----------------------------------------------
! Fv, Ah
! ----------------------------------------------

 
Do gt1= 1, 9
  Do gt2=3, 4
m1out = MFv(gt1)
m2out = MAh(gt2)
coupL = cplFvFvAhL(i1,gt1,gt2)
coupR = cplFvFvAhR(i1,gt1,gt2)
Call FermionToFermionScalar(m_in,m1out,m2out,coupL,coupR,gam) 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 
End Do 
 

 
! ----------------------------------------------
! Fe, conj[Hpm]
! ----------------------------------------------

 
Do gt1= 1, 3
  Do gt2=3, 4
m1out = MFe(gt1)
m2out = MHpm(gt2)
coupL = cplFvFecHpmL(i1,gt1,gt2)
coupR = cplFvFecHpmR(i1,gt1,gt2)
Call FermionToFermionScalar(m_in,m1out,m2out,coupL,coupR,gam) 
gPartial(i1,i_count) = 2*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 
End Do 
 

 
! ----------------------------------------------
! Fe, conj[VWLm]
! ----------------------------------------------

 
Do gt1= 1, 3
m1out = MFe(gt1)
m2out = MVWLm
coupL = cplFvFecVWLmL(i1,gt1)
coupR = cplFvFecVWLmR(i1,gt1)
Call FermionToFermionVectorBoson(m_in,m1out,m2out,coupL,coupR,gam) 
gPartial(i1,i_count) = 2*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 

 
! ----------------------------------------------
! Fe, conj[VWRm]
! ----------------------------------------------

 
Do gt1= 1, 3
m1out = MFe(gt1)
m2out = MVWRm
coupL = cplFvFecVWRmL(i1,gt1)
coupR = cplFvFecVWRmR(i1,gt1)
Call FermionToFermionVectorBoson(m_in,m1out,m2out,coupL,coupR,gam) 
gPartial(i1,i_count) = 2*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 

 
! ----------------------------------------------
! Fv, hh
! ----------------------------------------------

 
Do gt1= 1, 9
  Do gt2=1, 4
m1out = MFv(gt1)
m2out = Mhh(gt2)
coupL = cplFvFvhhL(i1,gt1,gt2)
coupR = cplFvFvhhR(i1,gt1,gt2)
Call FermionToFermionScalar(m_in,m1out,m2out,coupL,coupR,gam) 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 
End Do 
 

 
! ----------------------------------------------
! Fv, VZ
! ----------------------------------------------

 
Do gt1= 1, 9
m1out = MFv(gt1)
m2out = MVZ
coupL = cplFvFvVZL(i1,gt1)
coupR = cplFvFvVZR(i1,gt1)
Call FermionToFermionVectorBoson(m_in,m1out,m2out,coupL,coupR,gam) 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 

 
! ----------------------------------------------
! Fv, VZR
! ----------------------------------------------

 
Do gt1= 1, 9
m1out = MFv(gt1)
m2out = MVZR
coupL = cplFvFvVZRL(i1,gt1)
coupR = cplFvFvVZRR(i1,gt1)
Call FermionToFermionVectorBoson(m_in,m1out,m2out,coupL,coupR,gam) 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 
If ((Present(BR)).And.(gT(i1).Eq.0)) Then 
  BR(i1,:) = 0._dp 
Else If (Present(BR)) Then 
  BR(i1,:) = gPartial(i1,:)/gT(i1) 
End if 
 
End Do 
 
Iname = Iname - 1 
 
End Subroutine FvTwoBodyDecay
 
 
Subroutine VZTwoBodyDecay(i_in,deltaM,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,            & 
& MFv,MFv2,Mhh,Mhh2,MHpm,MHpm2,MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,MVZR2,            & 
& PhiW,TW,UC,ZDR,ZER,UP,ZUR,ZDL,ZEL,ZUL,ZH,ZM,ZW,ZZ,gBL,g2,g3,LAM2,LAM1,RHO1,            & 
& RHO2,ALP2,ALP1,ALP3,LAM5,LAM6,LAM3,LAM4,Y,YQ1,YQ2,Yt,YL,YR,Mux,MU12,MU22,              & 
& k1,vR,gPartial,gT,BR)

Implicit None 
 
Real(dp),Intent(in) :: gBL,g2,g3,LAM2,LAM1,RHO1,RHO2,ALP2,ALP1,ALP3,LAM5,LAM6,LAM3,LAM4,MU12,MU22,           & 
& k1,vR,MAh(4),MAh2(4),MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),MFv(9),              & 
& MFv2(9),Mhh(4),Mhh2(4),MHpm(4),MHpm2(4),MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,            & 
& MVZR,MVZR2,PhiW,TW,UC(4,4),UP(4,4),ZH(4,4),ZZ(3,3)

Complex(dp),Intent(in) :: Y(3,3),YQ1(3,3),YQ2(3,3),Yt(3,3),YL(3,3),YR(3,3),Mux(3,3),ZDR(3,3),ZER(3,3),          & 
& ZUR(3,3),ZDL(3,3),ZEL(3,3),ZUL(3,3),ZM(9,9),ZW(4,4)

Complex(dp) :: cplAhhhVZ(4,4),cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),   & 
& cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),cplFvFvVZL(9,9),cplFvFvVZR(9,9),cplhhVZVZ(4),        & 
& cplhhVZVZR(4),cplHpmcHpmVZ(4,4),cplHpmcVWLmVZ(4),cplHpmcVWRmVZ(4),cplcVWLmVWLmVZ,      & 
& cplcVWRmVWLmVZ,cplcVWRmVWRmVZ

Integer, Intent(in) :: i_in 
Real(dp), Intent(inout) :: gPartial(:,:), gT 
Real(dp), Intent(in) :: deltaM 
Real(dp), Optional, Intent(inout) :: BR(:,:) 
Integer :: i1, i2, i3, i4, i_start, i_end, i_count, gt1, gt2, gt3, gt4 
Real(dp) :: gam, m_in, m1out, m2out, coupReal 
Complex(dp) :: coupC, coupR, coupL, coup 
 
Iname = Iname + 1 
NameOfUnit(Iname) = 'VZTwoBodyDecay'
 
If (i_in.Lt.0) Then 
  i_start = 1 
  i_end = 1 
  gT = 0._dp 
  gPartial = 0._dp 
Else 
  If (ErrorLevel.Ge.-1) Then 
     Write(ErrCan,*) 'Problem in subroutine '//NameOfUnit(Iname) 
     Write(ErrCan,*) 'Value of i_in out of range, (i_in,i_max) = ', i_in,1

     Write(*,*) 'Problem in subroutine '//NameOfUnit(Iname) 
     Write(*,*) 'Value of i_in out of range, (i_in,i_max) = ', i_in,1

  End If 
  If (ErrorLevel.Gt.0) Call TerminateProgram 
  If (Present(BR)) BR = 0._dp 
  Iname = Iname -1 
  Return 
End If 
 
i1=1 
m_in = MVZ 
Call CouplingsFor_VZ_decays_2B(m_in,i1,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,           & 
& MFv,MFv2,Mhh,Mhh2,MHpm,MHpm2,MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,MVZR2,            & 
& PhiW,TW,UC,ZDR,ZER,UP,ZUR,ZDL,ZEL,ZUL,ZH,ZM,ZW,ZZ,gBL,g2,g3,LAM2,LAM1,RHO1,            & 
& RHO2,ALP2,ALP1,ALP3,LAM5,LAM6,LAM3,LAM4,Y,YQ1,YQ2,Yt,YL,YR,Mux,MU12,MU22,              & 
& k1,vR,cplAhhhVZ,cplcFdFdVZL,cplcFdFdVZR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuVZL,           & 
& cplcFuFuVZR,cplFvFvVZL,cplFvFvVZR,cplhhVZVZ,cplhhVZVZR,cplHpmcHpmVZ,cplHpmcVWLmVZ,     & 
& cplHpmcVWRmVZ,cplcVWLmVWLmVZ,cplcVWRmVWLmVZ,cplcVWRmVWRmVZ,deltaM)

i_count = 1 

 
! ----------------------------------------------
! hh, Ah
! ----------------------------------------------

 
Do gt1= 1, 4
  Do gt2=3, 4
m1out = Mhh(gt1)
m2out = MAh(gt2)
coup = cplAhhhVZ(gt2,gt1)
Call VectorBosonToTwoScalars(m_in,m1out,m2out,1,coup,gam) 
gPartial(1,i_count) = 1*gam 
gT = gT + gPartial(1,i_count) 
i_count = i_count +1 
  End Do 
End Do 
 

 
! ----------------------------------------------
! bar[Fd], Fd
! ----------------------------------------------

 
Do gt1= 1, 3
  Do gt2=1, 3
m1out = MFd(gt1)
m2out = MFd(gt2)
coupL = cplcFdFdVZL(gt1,gt2)
coupR = cplcFdFdVZR(gt1,gt2)
Call VectorBosonToTwoFermions(m_in,m1out,m2out,1,coupL,coupR,gam) 
gPartial(1,i_count) = 3*gam 
gT = gT + gPartial(1,i_count) 
i_count = i_count +1 
  End Do 
End Do 
 

 
! ----------------------------------------------
! bar[Fe], Fe
! ----------------------------------------------

 
Do gt1= 1, 3
  Do gt2=1, 3
m1out = MFe(gt1)
m2out = MFe(gt2)
coupL = cplcFeFeVZL(gt1,gt2)
coupR = cplcFeFeVZR(gt1,gt2)
Call VectorBosonToTwoFermions(m_in,m1out,m2out,1,coupL,coupR,gam) 
gPartial(1,i_count) = 1*gam 
gT = gT + gPartial(1,i_count) 
i_count = i_count +1 
  End Do 
End Do 
 

 
! ----------------------------------------------
! bar[Fu], Fu
! ----------------------------------------------

 
Do gt1= 1, 3
  Do gt2=1, 3
m1out = MFu(gt1)
m2out = MFu(gt2)
coupL = cplcFuFuVZL(gt1,gt2)
coupR = cplcFuFuVZR(gt1,gt2)
Call VectorBosonToTwoFermions(m_in,m1out,m2out,1,coupL,coupR,gam) 
gPartial(1,i_count) = 3*gam 
gT = gT + gPartial(1,i_count) 
i_count = i_count +1 
  End Do 
End Do 
 

 
! ----------------------------------------------
! Fv, Fv
! ----------------------------------------------

 
Do gt1= 1, 9
  Do gt2= gt1, 9
m1out = MFv(gt1)
m2out = MFv(gt2)
coupL = cplFvFvVZL(gt1,gt2)
coupR = cplFvFvVZR(gt1,gt2)
Call VectorBosonToTwoFermions(m_in,m1out,m2out,1,coupL,coupR,gam) 
If (gt1.ne.gt2) gam = 2._dp*gam 
gPartial(1,i_count) = 1._dp/2._dp*gam 
gT = gT + gPartial(1,i_count) 
i_count = i_count +1 
  End Do 
End Do 
 

 
! ----------------------------------------------
! hh, VZ
! ----------------------------------------------

 
Do gt1= 1, 4
m1out = Mhh(gt1)
m2out = MVZ
coup = cplhhVZVZ(gt1)
Call VectorBosonToScalarAndVectorBoson(m_in,m1out,m2out,coup,gam) 
gPartial(1,i_count) = 1*gam 
gT = gT + gPartial(1,i_count) 
i_count = i_count +1 
  End Do 

 
! ----------------------------------------------
! hh, VZR
! ----------------------------------------------

 
Do gt1= 1, 4
m1out = Mhh(gt1)
m2out = MVZR
coup = cplhhVZVZR(gt1)
Call VectorBosonToScalarAndVectorBoson(m_in,m1out,m2out,coup,gam) 
gPartial(1,i_count) = 1*gam 
gT = gT + gPartial(1,i_count) 
i_count = i_count +1 
  End Do 

 
! ----------------------------------------------
! conj[Hpm], Hpm
! ----------------------------------------------

 
Do gt1= 3, 4
  Do gt2=3, 4
m1out = MHpm(gt1)
m2out = MHpm(gt2)
coup = cplHpmcHpmVZ(gt2,gt1)
Call VectorBosonToTwoScalars(m_in,m1out,m2out,1,coup,gam) 
gPartial(1,i_count) = 1*gam 
gT = gT + gPartial(1,i_count) 
i_count = i_count +1 
  End Do 
End Do 
 

 
! ----------------------------------------------
! Hpm, conj[VWLm]
! ----------------------------------------------

 
Do gt1= 3, 4
m1out = MHpm(gt1)
m2out = MVWLm
coup = cplHpmcVWLmVZ(gt1)
Call VectorBosonToScalarAndVectorBoson(m_in,m1out,m2out,coup,gam) 
gPartial(1,i_count) = 2*gam 
gT = gT + gPartial(1,i_count) 
i_count = i_count +1 
  End Do 

 
! ----------------------------------------------
! Hpm, conj[VWRm]
! ----------------------------------------------

 
Do gt1= 3, 4
m1out = MHpm(gt1)
m2out = MVWRm
coup = cplHpmcVWRmVZ(gt1)
Call VectorBosonToScalarAndVectorBoson(m_in,m1out,m2out,coup,gam) 
gPartial(1,i_count) = 2*gam 
gT = gT + gPartial(1,i_count) 
i_count = i_count +1 
  End Do 

 
! ----------------------------------------------
! VWLm, conj[VWLm]
! ----------------------------------------------

 
m1out = MVWLm
m2out = MVWLm
coup = cplcVWLmVWLmVZ
Call VectorBosonToTwoVectorBosons(m_in,m1out,m2out,coup,gam) 
gPartial(1,i_count) = 1*gam 
gT = gT + gPartial(1,i_count) 
i_count = i_count +1 

 
! ----------------------------------------------
! VWLm, conj[VWRm]
! ----------------------------------------------

 
m1out = MVWLm
m2out = MVWRm
coup = cplcVWRmVWLmVZ
Call VectorBosonToTwoVectorBosons(m_in,m1out,m2out,coup,gam) 
gPartial(1,i_count) = 2*gam 
gT = gT + gPartial(1,i_count) 
i_count = i_count +1 

 
! ----------------------------------------------
! VWRm, conj[VWRm]
! ----------------------------------------------

 
m1out = MVWRm
m2out = MVWRm
coup = cplcVWRmVWRmVZ
Call VectorBosonToTwoVectorBosons(m_in,m1out,m2out,coup,gam) 
gPartial(1,i_count) = 1*gam 
gT = gT + gPartial(1,i_count) 
i_count = i_count +1 
If ((Present(BR)).And.(gT.Eq.0)) Then 
  BR(1,:) = 0._dp 
Else If (Present(BR)) Then 
  BR(1,:) = gPartial(1,:)/gT 
End if 
 
Iname = Iname - 1 
 
End Subroutine VZTwoBodyDecay
 
 
Subroutine VZRTwoBodyDecay(i_in,deltaM,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,           & 
& MFv,MFv2,Mhh,Mhh2,MHpm,MHpm2,MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,MVZR2,            & 
& PhiW,TW,UC,ZDR,ZER,UP,ZUR,ZDL,ZEL,ZUL,ZH,ZM,ZW,ZZ,gBL,g2,g3,LAM2,LAM1,RHO1,            & 
& RHO2,ALP2,ALP1,ALP3,LAM5,LAM6,LAM3,LAM4,Y,YQ1,YQ2,Yt,YL,YR,Mux,MU12,MU22,              & 
& k1,vR,gPartial,gT,BR)

Implicit None 
 
Real(dp),Intent(in) :: gBL,g2,g3,LAM2,LAM1,RHO1,RHO2,ALP2,ALP1,ALP3,LAM5,LAM6,LAM3,LAM4,MU12,MU22,           & 
& k1,vR,MAh(4),MAh2(4),MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),MFv(9),              & 
& MFv2(9),Mhh(4),Mhh2(4),MHpm(4),MHpm2(4),MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,            & 
& MVZR,MVZR2,PhiW,TW,UC(4,4),UP(4,4),ZH(4,4),ZZ(3,3)

Complex(dp),Intent(in) :: Y(3,3),YQ1(3,3),YQ2(3,3),Yt(3,3),YL(3,3),YR(3,3),Mux(3,3),ZDR(3,3),ZER(3,3),          & 
& ZUR(3,3),ZDL(3,3),ZEL(3,3),ZUL(3,3),ZM(9,9),ZW(4,4)

Complex(dp) :: cplAhhhVZR(4,4),cplcFdFdVZRL(3,3),cplcFdFdVZRR(3,3),cplcFeFeVZRL(3,3),cplcFeFeVZRR(3,3),& 
& cplcFuFuVZRL(3,3),cplcFuFuVZRR(3,3),cplFvFvVZRL(9,9),cplFvFvVZRR(9,9),cplhhVZVZR(4),   & 
& cplhhVZRVZR(4),cplHpmcHpmVZR(4,4),cplHpmcVWLmVZR(4),cplHpmcVWRmVZR(4),cplcVWLmVWLmVZR, & 
& cplcVWRmVWLmVZR,cplcVWRmVWRmVZR

Integer, Intent(in) :: i_in 
Real(dp), Intent(inout) :: gPartial(:,:), gT 
Real(dp), Intent(in) :: deltaM 
Real(dp), Optional, Intent(inout) :: BR(:,:) 
Integer :: i1, i2, i3, i4, i_start, i_end, i_count, gt1, gt2, gt3, gt4 
Real(dp) :: gam, m_in, m1out, m2out, coupReal 
Complex(dp) :: coupC, coupR, coupL, coup 
 
Iname = Iname + 1 
NameOfUnit(Iname) = 'VZRTwoBodyDecay'
 
If (i_in.Lt.0) Then 
  i_start = 1 
  i_end = 1 
  gT = 0._dp 
  gPartial = 0._dp 
Else 
  If (ErrorLevel.Ge.-1) Then 
     Write(ErrCan,*) 'Problem in subroutine '//NameOfUnit(Iname) 
     Write(ErrCan,*) 'Value of i_in out of range, (i_in,i_max) = ', i_in,1

     Write(*,*) 'Problem in subroutine '//NameOfUnit(Iname) 
     Write(*,*) 'Value of i_in out of range, (i_in,i_max) = ', i_in,1

  End If 
  If (ErrorLevel.Gt.0) Call TerminateProgram 
  If (Present(BR)) BR = 0._dp 
  Iname = Iname -1 
  Return 
End If 
 
i1=1 
m_in = MVZR 
Call CouplingsFor_VZR_decays_2B(m_in,i1,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,               & 
& MFu2,MFv,MFv2,Mhh,Mhh2,MHpm,MHpm2,MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,             & 
& MVZR2,PhiW,TW,UC,ZDR,ZER,UP,ZUR,ZDL,ZEL,ZUL,ZH,ZM,ZW,ZZ,gBL,g2,g3,LAM2,LAM1,           & 
& RHO1,RHO2,ALP2,ALP1,ALP3,LAM5,LAM6,LAM3,LAM4,Y,YQ1,YQ2,Yt,YL,YR,Mux,MU12,              & 
& MU22,k1,vR,cplAhhhVZR,cplcFdFdVZRL,cplcFdFdVZRR,cplcFeFeVZRL,cplcFeFeVZRR,             & 
& cplcFuFuVZRL,cplcFuFuVZRR,cplFvFvVZRL,cplFvFvVZRR,cplhhVZVZR,cplhhVZRVZR,              & 
& cplHpmcHpmVZR,cplHpmcVWLmVZR,cplHpmcVWRmVZR,cplcVWLmVWLmVZR,cplcVWRmVWLmVZR,           & 
& cplcVWRmVWRmVZR,deltaM)

i_count = 1 

 
! ----------------------------------------------
! hh, Ah
! ----------------------------------------------

 
Do gt1= 1, 4
  Do gt2=3, 4
m1out = Mhh(gt1)
m2out = MAh(gt2)
coup = cplAhhhVZR(gt2,gt1)
Call VectorBosonToTwoScalars(m_in,m1out,m2out,1,coup,gam) 
gPartial(1,i_count) = 1*gam 
gT = gT + gPartial(1,i_count) 
i_count = i_count +1 
  End Do 
End Do 
 

 
! ----------------------------------------------
! bar[Fd], Fd
! ----------------------------------------------

 
Do gt1= 1, 3
  Do gt2=1, 3
m1out = MFd(gt1)
m2out = MFd(gt2)
coupL = cplcFdFdVZRL(gt1,gt2)
coupR = cplcFdFdVZRR(gt1,gt2)
Call VectorBosonToTwoFermions(m_in,m1out,m2out,1,coupL,coupR,gam) 
gPartial(1,i_count) = 3*gam 
gT = gT + gPartial(1,i_count) 
i_count = i_count +1 
  End Do 
End Do 
 

 
! ----------------------------------------------
! bar[Fe], Fe
! ----------------------------------------------

 
Do gt1= 1, 3
  Do gt2=1, 3
m1out = MFe(gt1)
m2out = MFe(gt2)
coupL = cplcFeFeVZRL(gt1,gt2)
coupR = cplcFeFeVZRR(gt1,gt2)
Call VectorBosonToTwoFermions(m_in,m1out,m2out,1,coupL,coupR,gam) 
gPartial(1,i_count) = 1*gam 
gT = gT + gPartial(1,i_count) 
i_count = i_count +1 
  End Do 
End Do 
 

 
! ----------------------------------------------
! bar[Fu], Fu
! ----------------------------------------------

 
Do gt1= 1, 3
  Do gt2=1, 3
m1out = MFu(gt1)
m2out = MFu(gt2)
coupL = cplcFuFuVZRL(gt1,gt2)
coupR = cplcFuFuVZRR(gt1,gt2)
Call VectorBosonToTwoFermions(m_in,m1out,m2out,1,coupL,coupR,gam) 
gPartial(1,i_count) = 3*gam 
gT = gT + gPartial(1,i_count) 
i_count = i_count +1 
  End Do 
End Do 
 

 
! ----------------------------------------------
! Fv, Fv
! ----------------------------------------------

 
Do gt1= 1, 9
  Do gt2= gt1, 9
m1out = MFv(gt1)
m2out = MFv(gt2)
coupL = cplFvFvVZRL(gt1,gt2)
coupR = cplFvFvVZRR(gt1,gt2)
Call VectorBosonToTwoFermions(m_in,m1out,m2out,1,coupL,coupR,gam) 
If (gt1.ne.gt2) gam = 2._dp*gam 
gPartial(1,i_count) = 1._dp/2._dp*gam 
gT = gT + gPartial(1,i_count) 
i_count = i_count +1 
  End Do 
End Do 
 

 
! ----------------------------------------------
! hh, VZ
! ----------------------------------------------

 
Do gt1= 1, 4
m1out = Mhh(gt1)
m2out = MVZ
coup = cplhhVZVZR(gt1)
Call VectorBosonToScalarAndVectorBoson(m_in,m1out,m2out,coup,gam) 
gPartial(1,i_count) = 1*gam 
gT = gT + gPartial(1,i_count) 
i_count = i_count +1 
  End Do 

 
! ----------------------------------------------
! hh, VZR
! ----------------------------------------------

 
Do gt1= 1, 4
m1out = Mhh(gt1)
m2out = MVZR
coup = cplhhVZRVZR(gt1)
Call VectorBosonToScalarAndVectorBoson(m_in,m1out,m2out,coup,gam) 
gPartial(1,i_count) = 1*gam 
gT = gT + gPartial(1,i_count) 
i_count = i_count +1 
  End Do 

 
! ----------------------------------------------
! conj[Hpm], Hpm
! ----------------------------------------------

 
Do gt1= 3, 4
  Do gt2=3, 4
m1out = MHpm(gt1)
m2out = MHpm(gt2)
coup = cplHpmcHpmVZR(gt2,gt1)
Call VectorBosonToTwoScalars(m_in,m1out,m2out,1,coup,gam) 
gPartial(1,i_count) = 1*gam 
gT = gT + gPartial(1,i_count) 
i_count = i_count +1 
  End Do 
End Do 
 

 
! ----------------------------------------------
! Hpm, conj[VWLm]
! ----------------------------------------------

 
Do gt1= 3, 4
m1out = MHpm(gt1)
m2out = MVWLm
coup = cplHpmcVWLmVZR(gt1)
Call VectorBosonToScalarAndVectorBoson(m_in,m1out,m2out,coup,gam) 
gPartial(1,i_count) = 2*gam 
gT = gT + gPartial(1,i_count) 
i_count = i_count +1 
  End Do 

 
! ----------------------------------------------
! Hpm, conj[VWRm]
! ----------------------------------------------

 
Do gt1= 3, 4
m1out = MHpm(gt1)
m2out = MVWRm
coup = cplHpmcVWRmVZR(gt1)
Call VectorBosonToScalarAndVectorBoson(m_in,m1out,m2out,coup,gam) 
gPartial(1,i_count) = 2*gam 
gT = gT + gPartial(1,i_count) 
i_count = i_count +1 
  End Do 

 
! ----------------------------------------------
! VWLm, conj[VWLm]
! ----------------------------------------------

 
m1out = MVWLm
m2out = MVWLm
coup = cplcVWLmVWLmVZR
Call VectorBosonToTwoVectorBosons(m_in,m1out,m2out,coup,gam) 
gPartial(1,i_count) = 1*gam 
gT = gT + gPartial(1,i_count) 
i_count = i_count +1 

 
! ----------------------------------------------
! VWLm, conj[VWRm]
! ----------------------------------------------

 
m1out = MVWLm
m2out = MVWRm
coup = cplcVWRmVWLmVZR
Call VectorBosonToTwoVectorBosons(m_in,m1out,m2out,coup,gam) 
gPartial(1,i_count) = 2*gam 
gT = gT + gPartial(1,i_count) 
i_count = i_count +1 

 
! ----------------------------------------------
! VWRm, conj[VWRm]
! ----------------------------------------------

 
m1out = MVWRm
m2out = MVWRm
coup = cplcVWRmVWRmVZR
Call VectorBosonToTwoVectorBosons(m_in,m1out,m2out,coup,gam) 
gPartial(1,i_count) = 1*gam 
gT = gT + gPartial(1,i_count) 
i_count = i_count +1 
If ((Present(BR)).And.(gT.Eq.0)) Then 
  BR(1,:) = 0._dp 
Else If (Present(BR)) Then 
  BR(1,:) = gPartial(1,:)/gT 
End if 
 
Iname = Iname - 1 
 
End Subroutine VZRTwoBodyDecay
 
 
Subroutine HpmTwoBodyDecay(i_in,deltaM,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,           & 
& MFv,MFv2,Mhh,Mhh2,MHpm,MHpm2,MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,MVZR2,            & 
& PhiW,TW,UC,ZDR,ZER,UP,ZUR,ZDL,ZEL,ZUL,ZH,ZM,ZW,ZZ,gBL,g2,g3,LAM2,LAM1,RHO1,            & 
& RHO2,ALP2,ALP1,ALP3,LAM5,LAM6,LAM3,LAM4,Y,YQ1,YQ2,Yt,YL,YR,Mux,MU12,MU22,              & 
& k1,vR,gPartial,gT,BR)

Implicit None 
 
Real(dp),Intent(in) :: gBL,g2,g3,LAM2,LAM1,RHO1,RHO2,ALP2,ALP1,ALP3,LAM5,LAM6,LAM3,LAM4,MU12,MU22,           & 
& k1,vR,MAh(4),MAh2(4),MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),MFv(9),              & 
& MFv2(9),Mhh(4),Mhh2(4),MHpm(4),MHpm2(4),MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,            & 
& MVZR,MVZR2,PhiW,TW,UC(4,4),UP(4,4),ZH(4,4),ZZ(3,3)

Complex(dp),Intent(in) :: Y(3,3),YQ1(3,3),YQ2(3,3),Yt(3,3),YL(3,3),YR(3,3),Mux(3,3),ZDR(3,3),ZER(3,3),          & 
& ZUR(3,3),ZDL(3,3),ZEL(3,3),ZUL(3,3),ZM(9,9),ZW(4,4)

Complex(dp) :: cplAhHpmcHpm(4,4,4),cplAhcHpmVWLm(4,4),cplAhcHpmVWRm(4,4),cplcFuFdcHpmL(3,3,4),       & 
& cplcFuFdcHpmR(3,3,4),cplFvFecHpmL(9,3,4),cplFvFecHpmR(9,3,4),cplhhHpmcHpm(4,4,4),      & 
& cplhhcHpmVWLm(4,4),cplhhcHpmVWRm(4,4),cplHpmcHpmVZ(4,4),cplHpmcHpmVZR(4,4),            & 
& cplcHpmVWLmVZ(4),cplcHpmVWLmVZR(4),cplcHpmVWRmVZ(4),cplcHpmVWRmVZR(4)

Integer, Intent(in) :: i_in 
Real(dp), Intent(inout) :: gPartial(:,:), gT(:) 
Real(dp), Intent(in) :: deltaM 
Real(dp), Optional, Intent(inout) :: BR(:,:) 
Integer :: i1, i2, i3, i4, i_start, i_end, i_count, gt1, gt2, gt3, gt4 
Real(dp) :: gam, m_in, m1out, m2out, coupReal 
Complex(dp) :: coupC, coupR, coupL, coup 
 
Iname = Iname + 1 
NameOfUnit(Iname) = 'HpmTwoBodyDecay'
 
If (i_in.Lt.0) Then 
  i_start = 3 
  i_end = 4
  gT = 0._dp 
  gPartial = 0._dp 
Else If ( (i_in.Ge.1).And.(i_in.Le.4) ) Then 
  i_start = i_in 
  i_end = i_in 
  gT(i_in) = 0._dp 
  gPartial(i_in,:) = 0._dp 
Else 
  If (ErrorLevel.Ge.-1) Then 
     Write(ErrCan,*) 'Problem in subroutine '//NameOfUnit(Iname) 
     Write(ErrCan,*) 'Value of i_in out of range, (i_in,i_max) = ', i_in,4

     Write(*,*) 'Problem in subroutine '//NameOfUnit(Iname) 
     Write(*,*) 'Value of i_in out of range, (i_in,i_max) = ', i_in,4

  End If 
  If (ErrorLevel.Gt.0) Call TerminateProgram 
  If (Present(BR)) BR = 0._dp 
  Iname = Iname -1 
  Return 
End If 
 
Do i1=i_start,i_end 
m_in = MHpm(i1) 
If (m_in.Eq.0._dp) Cycle 
Call CouplingsFor_Hpm_decays_2B(m_in,i1,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,               & 
& MFu2,MFv,MFv2,Mhh,Mhh2,MHpm,MHpm2,MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,             & 
& MVZR2,PhiW,TW,UC,ZDR,ZER,UP,ZUR,ZDL,ZEL,ZUL,ZH,ZM,ZW,ZZ,gBL,g2,g3,LAM2,LAM1,           & 
& RHO1,RHO2,ALP2,ALP1,ALP3,LAM5,LAM6,LAM3,LAM4,Y,YQ1,YQ2,Yt,YL,YR,Mux,MU12,              & 
& MU22,k1,vR,cplAhHpmcHpm,cplAhcHpmVWLm,cplAhcHpmVWRm,cplcFuFdcHpmL,cplcFuFdcHpmR,       & 
& cplFvFecHpmL,cplFvFecHpmR,cplhhHpmcHpm,cplhhcHpmVWLm,cplhhcHpmVWRm,cplHpmcHpmVZ,       & 
& cplHpmcHpmVZR,cplcHpmVWLmVZ,cplcHpmVWLmVZR,cplcHpmVWRmVZ,cplcHpmVWRmVZR,deltaM)

i_count = 1 

 
! ----------------------------------------------
! Hpm, Ah
! ----------------------------------------------

 
Do gt1= 3, 4
  Do gt2=3, 4
m1out = MHpm(gt1)
m2out = MAh(gt2)
coup = cplAhHpmcHpm(gt2,gt1,i1)
Call ScalarToTwoScalars(m_in,m1out,m2out,coup,gam) 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 
End Do 
 

 
! ----------------------------------------------
! Ah, VWLm
! ----------------------------------------------

 
Do gt1= 3, 4
m1out = MAh(gt1)
m2out = MVWLm
coup = cplAhcHpmVWLm(gt1,i1)
Call ScalarToScalarVectorBoson(m_in,m1out,m2out,coup,gam) 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
  BR_HpAW(i1,gt1) = gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 

 
! ----------------------------------------------
! Ah, VWRm
! ----------------------------------------------

 
Do gt1= 3, 4
m1out = MAh(gt1)
m2out = MVWRm
coup = cplAhcHpmVWRm(gt1,i1)
Call ScalarToScalarVectorBoson(m_in,m1out,m2out,coup,gam) 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 

 
! ----------------------------------------------
! bar[Fu], Fd
! ----------------------------------------------

 
Do gt1= 1, 3
  Do gt2=1, 3
m1out = MFu(gt1)
m2out = MFd(gt2)
coupL = cplcFuFdcHpmL(gt1,gt2,i1)
coupR = cplcFuFdcHpmR(gt1,gt2,i1)
Call ScalarToTwoFermions(m_in,m1out,m2out,coupL,coupR,gam) 
gPartial(i1,i_count) = 3*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
If ((gt1.eq.2).and.(gt2.eq.3)) Then 
  BR_Hcb(i1) = gPartial(i1,i_count) 
End if 
If ((gt1.eq.2).and.(gt2.eq.2)) Then 
  BR_Hcs(i1) = gPartial(i1,i_count) 
End if 
If ((gt1.eq.3).and.(gt2.eq.3)) Then 
  BR_HpTB(i1) = gPartial(i1,i_count) 
End if 
i_count = i_count +1 
  End Do 
End Do 
 

 
! ----------------------------------------------
! Fv, Fe
! ----------------------------------------------

 
Do gt1= 1, 9
  Do gt2=1, 3
m1out = MFv(gt1)
m2out = MFe(gt2)
coupL = cplFvFecHpmL(gt1,gt2,i1)
coupR = cplFvFecHpmR(gt1,gt2,i1)
Call ScalarToTwoFermions(m_in,m1out,m2out,coupL,coupR,gam) 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
If ((gt1.eq.gt2).and.(gt1.eq.3)) Then 
  BR_Htaunu(i1) = gPartial(i1,i_count) 
End if 
i_count = i_count +1 
  End Do 
End Do 
 

 
! ----------------------------------------------
! Hpm, hh
! ----------------------------------------------

 
Do gt1= 3, 4
  Do gt2=1, 4
m1out = MHpm(gt1)
m2out = Mhh(gt2)
coup = cplhhHpmcHpm(gt2,gt1,i1)
Call ScalarToTwoScalars(m_in,m1out,m2out,coup,gam) 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 
End Do 
 

 
! ----------------------------------------------
! hh, VWLm
! ----------------------------------------------

 
Do gt1= 1, 4
m1out = Mhh(gt1)
m2out = MVWLm
coup = cplhhcHpmVWLm(gt1,i1)
Call ScalarToScalarVectorBoson(m_in,m1out,m2out,coup,gam) 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
  BR_HpHW(i1,gt1) = gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 

 
! ----------------------------------------------
! hh, VWRm
! ----------------------------------------------

 
Do gt1= 1, 4
m1out = Mhh(gt1)
m2out = MVWRm
coup = cplhhcHpmVWRm(gt1,i1)
Call ScalarToScalarVectorBoson(m_in,m1out,m2out,coup,gam) 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 

 
! ----------------------------------------------
! Hpm, VZ
! ----------------------------------------------

 
Do gt1= 3, 4
m1out = MHpm(gt1)
m2out = MVZ
coup = cplHpmcHpmVZ(gt1,i1)
Call ScalarToScalarVectorBoson(m_in,m1out,m2out,coup,gam) 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 

 
! ----------------------------------------------
! Hpm, VZR
! ----------------------------------------------

 
Do gt1= 3, 4
m1out = MHpm(gt1)
m2out = MVZR
coup = cplHpmcHpmVZR(gt1,i1)
Call ScalarToScalarVectorBoson(m_in,m1out,m2out,coup,gam) 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 

 
! ----------------------------------------------
! VWLm, VZ
! ----------------------------------------------

 
m1out = MVWLm
m2out = MVZ
coup = cplcHpmVWLmVZ(i1)
Call ScalarToTwoVectorBosons(m_in,m1out,m2out,coup,gam) 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
  BR_HpWZ(i1) = gPartial(i1,i_count) 
i_count = i_count +1 

 
! ----------------------------------------------
! VWLm, VZR
! ----------------------------------------------

 
m1out = MVWLm
m2out = MVZR
coup = cplcHpmVWLmVZR(i1)
Call ScalarToTwoVectorBosons(m_in,m1out,m2out,coup,gam) 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 

 
! ----------------------------------------------
! VWRm, VZ
! ----------------------------------------------

 
m1out = MVWRm
m2out = MVZ
coup = cplcHpmVWRmVZ(i1)
Call ScalarToTwoVectorBosons(m_in,m1out,m2out,coup,gam) 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 

 
! ----------------------------------------------
! VWRm, VZR
! ----------------------------------------------

 
m1out = MVWRm
m2out = MVZR
coup = cplcHpmVWRmVZR(i1)
Call ScalarToTwoVectorBosons(m_in,m1out,m2out,coup,gam) 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
If ((Present(BR)).And.(gT(i1).Eq.0)) Then 
  BR(i1,:) = 0._dp 
Else If (Present(BR)) Then 
  BR(i1,:) = gPartial(i1,:)/gT(i1) 
End if 
 
End Do 
 
Iname = Iname - 1 
 
End Subroutine HpmTwoBodyDecay
 
 
Subroutine AhTwoBodyDecay(i_in,deltaM,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,            & 
& MFv,MFv2,Mhh,Mhh2,MHpm,MHpm2,MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,MVZR2,            & 
& PhiW,TW,UC,ZDR,ZER,UP,ZUR,ZDL,ZEL,ZUL,ZH,ZM,ZW,ZZ,gBL,g2,g3,LAM2,LAM1,RHO1,            & 
& RHO2,ALP2,ALP1,ALP3,LAM5,LAM6,LAM3,LAM4,Y,YQ1,YQ2,Yt,YL,YR,Mux,MU12,MU22,              & 
& k1,vR,gPartial,gT,BR)

Implicit None 
 
Real(dp),Intent(in) :: gBL,g2,g3,LAM2,LAM1,RHO1,RHO2,ALP2,ALP1,ALP3,LAM5,LAM6,LAM3,LAM4,MU12,MU22,           & 
& k1,vR,MAh(4),MAh2(4),MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),MFv(9),              & 
& MFv2(9),Mhh(4),Mhh2(4),MHpm(4),MHpm2(4),MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,            & 
& MVZR,MVZR2,PhiW,TW,UC(4,4),UP(4,4),ZH(4,4),ZZ(3,3)

Complex(dp),Intent(in) :: Y(3,3),YQ1(3,3),YQ2(3,3),Yt(3,3),YL(3,3),YR(3,3),Mux(3,3),ZDR(3,3),ZER(3,3),          & 
& ZUR(3,3),ZDL(3,3),ZEL(3,3),ZUL(3,3),ZM(9,9),ZW(4,4)

Complex(dp) :: cplPseudoHiggsPP(4),cplPseudoHiggsGG(4),cplAhAhhh(4,4,4),cplcFdFdAhL(3,3,4),          & 
& cplcFdFdAhR(3,3,4),cplcFeFeAhL(3,3,4),cplcFeFeAhR(3,3,4),cplcFuFuAhL(3,3,4),           & 
& cplcFuFuAhR(3,3,4),cplFvFvAhL(9,9,4),cplFvFvAhR(9,9,4),cplAhhhVZ(4,4),cplAhhhVZR(4,4), & 
& cplAhHpmcHpm(4,4,4),cplAhHpmcVWLm(4,4),cplAhHpmcVWRm(4,4),cplAhcVWRmVWLm(4)

Integer, Intent(in) :: i_in 
Real(dp), Intent(inout) :: gPartial(:,:), gT(:) 
Real(dp), Intent(in) :: deltaM 
Real(dp), Optional, Intent(inout) :: BR(:,:) 
Integer :: i1, i2, i3, i4, i_start, i_end, i_count, gt1, gt2, gt3, gt4 
Real(dp) :: gam, m_in, m1out, m2out, coupReal 
Complex(dp) :: coupC, coupR, coupL, coup 
 
Real(dp) :: alpha3 
Iname = Iname + 1 
NameOfUnit(Iname) = 'AhTwoBodyDecay'
 
If (i_in.Lt.0) Then 
  i_start = 3 
  i_end = 4
  gT = 0._dp 
  gPartial = 0._dp 
Else If ( (i_in.Ge.1).And.(i_in.Le.4) ) Then 
  i_start = i_in 
  i_end = i_in 
  gT(i_in) = 0._dp 
  gPartial(i_in,:) = 0._dp 
Else 
  If (ErrorLevel.Ge.-1) Then 
     Write(ErrCan,*) 'Problem in subroutine '//NameOfUnit(Iname) 
     Write(ErrCan,*) 'Value of i_in out of range, (i_in,i_max) = ', i_in,4

     Write(*,*) 'Problem in subroutine '//NameOfUnit(Iname) 
     Write(*,*) 'Value of i_in out of range, (i_in,i_max) = ', i_in,4

  End If 
  If (ErrorLevel.Gt.0) Call TerminateProgram 
  If (Present(BR)) BR = 0._dp 
  Iname = Iname -1 
  Return 
End If 
 
Do i1=i_start,i_end 
m_in = MAh(i1) 
If (m_in.Eq.0._dp) Cycle 
Call CouplingsFor_Ah_decays_2B(m_in,i1,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,           & 
& MFv,MFv2,Mhh,Mhh2,MHpm,MHpm2,MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,MVZR2,            & 
& PhiW,TW,UC,ZDR,ZER,UP,ZUR,ZDL,ZEL,ZUL,ZH,ZM,ZW,ZZ,gBL,g2,g3,LAM2,LAM1,RHO1,            & 
& RHO2,ALP2,ALP1,ALP3,LAM5,LAM6,LAM3,LAM4,Y,YQ1,YQ2,Yt,YL,YR,Mux,MU12,MU22,              & 
& k1,vR,cplPseudoHiggsPP,cplPseudoHiggsGG,cplAhAhhh,cplcFdFdAhL,cplcFdFdAhR,             & 
& cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplFvFvAhL,cplFvFvAhR,cplAhhhVZ,       & 
& cplAhhhVZR,cplAhHpmcHpm,cplAhHpmcVWLm,cplAhHpmcVWRm,cplAhcVWRmVWLm,deltaM)

i_count = 1 

 
! ----------------------------------------------
! VP, VP
! ----------------------------------------------

 
m1out = 0._dp
m2out = 0._dp
gam = G_F * m_in**3 * oosqrt2 * oo128pi3 * Abs(cplPseudoHiggsPP(i1))**2 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 

 
! ----------------------------------------------
! VG, VG
! ----------------------------------------------

 
m1out = 0._dp
m2out = 0._dp
gam = G_F * m_in**3 * oosqrt2 * oo36pi3 * Abs(cplPseudoHiggsGG(i1))**2 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 

 
! ----------------------------------------------
! hh, Ah
! ----------------------------------------------

 
Do gt1= 1, 4
  Do gt2=3, 4
m1out = Mhh(gt1)
m2out = MAh(gt2)
coup = cplAhAhhh(i1,gt2,gt1)
Call ScalarToTwoScalars(m_in,m1out,m2out,coup,gam) 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
  BRAHAijk(i1,gt1,gt2) = gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 
End Do 
 

 
! ----------------------------------------------
! bar[Fd], Fd
! ----------------------------------------------

 
Do gt1= 1, 3
  Do gt2=1, 3
m1out = MFd(gt1)
m2out = MFd(gt2)
coupL = cplcFdFdAhL(gt1,gt2,i1)
coupR = cplcFdFdAhR(gt1,gt2,i1)
Call ScalarToTwoFermions(m_in,m1out,m2out,coupL,coupR,gam) 
gPartial(i1,i_count) = 3*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 
End Do 
 

 
! ----------------------------------------------
! bar[Fe], Fe
! ----------------------------------------------

 
Do gt1= 1, 3
  Do gt2=1, 3
m1out = MFe(gt1)
m2out = MFe(gt2)
coupL = cplcFeFeAhL(gt1,gt2,i1)
coupR = cplcFeFeAhR(gt1,gt2,i1)
Call ScalarToTwoFermions(m_in,m1out,m2out,coupL,coupR,gam) 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 
End Do 
 

 
! ----------------------------------------------
! bar[Fu], Fu
! ----------------------------------------------

 
Do gt1= 1, 3
  Do gt2=1, 3
m1out = MFu(gt1)
m2out = MFu(gt2)
coupL = cplcFuFuAhL(gt1,gt2,i1)
coupR = cplcFuFuAhR(gt1,gt2,i1)
Call ScalarToTwoFermions(m_in,m1out,m2out,coupL,coupR,gam) 
gPartial(i1,i_count) = 3*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 
End Do 
 

 
! ----------------------------------------------
! Fv, Fv
! ----------------------------------------------

 
Do gt1= 1, 9
  Do gt2= gt1, 9
m1out = MFv(gt1)
m2out = MFv(gt2)
coupL = cplFvFvAhL(gt1,gt2,i1)
coupR = cplFvFvAhR(gt1,gt2,i1)
Call ScalarToTwoFermions(m_in,m1out,m2out,coupL,coupR,gam) 
If (gt1.ne.gt2) gam = 2._dp*gam 
gPartial(i1,i_count) = 1._dp/2._dp*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 
End Do 
 

 
! ----------------------------------------------
! hh, VZ
! ----------------------------------------------

 
Do gt1= 1, 4
m1out = Mhh(gt1)
m2out = MVZ
coup = cplAhhhVZ(i1,gt1)
Call ScalarToScalarVectorBoson(m_in,m1out,m2out,coup,gam) 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
  BRAHZ(i1,gt1) = gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 

 
! ----------------------------------------------
! hh, VZR
! ----------------------------------------------

 
Do gt1= 1, 4
m1out = Mhh(gt1)
m2out = MVZR
coup = cplAhhhVZR(i1,gt1)
Call ScalarToScalarVectorBoson(m_in,m1out,m2out,coup,gam) 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 

 
! ----------------------------------------------
! conj[Hpm], Hpm
! ----------------------------------------------

 
Do gt1= 3, 4
  Do gt2=3, 4
m1out = MHpm(gt1)
m2out = MHpm(gt2)
coup = cplAhHpmcHpm(i1,gt2,gt1)
Call ScalarToTwoScalars(m_in,m1out,m2out,coup,gam) 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 
End Do 
 

 
! ----------------------------------------------
! Hpm, conj[VWLm]
! ----------------------------------------------

 
Do gt1= 3, 4
m1out = MHpm(gt1)
m2out = MVWLm
coup = cplAhHpmcVWLm(i1,gt1)
Call ScalarToScalarVectorBoson(m_in,m1out,m2out,coup,gam) 
gPartial(i1,i_count) = 2*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
  BRAHpW(i1,gt2) = gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 

 
! ----------------------------------------------
! Hpm, conj[VWRm]
! ----------------------------------------------

 
Do gt1= 3, 4
m1out = MHpm(gt1)
m2out = MVWRm
coup = cplAhHpmcVWRm(i1,gt1)
Call ScalarToScalarVectorBoson(m_in,m1out,m2out,coup,gam) 
gPartial(i1,i_count) = 2*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 

 
! ----------------------------------------------
! VWLm, conj[VWRm]
! ----------------------------------------------

 
m1out = MVWLm
m2out = MVWRm
coup = cplAhcVWRmVWLm(i1)
Call ScalarToTwoVectorBosons(m_in,m1out,m2out,coup,gam) 
gPartial(i1,i_count) = 2*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
If ((Present(BR)).And.(gT(i1).Eq.0)) Then 
  BR(i1,:) = 0._dp 
Else If (Present(BR)) Then 
  BR(i1,:) = gPartial(i1,:)/gT(i1) 
End if 
 
End Do 
 
Iname = Iname - 1 
 
Contains 
 
 Real(dp) Function FFqcd(mf, mA, alpha_s)
  implicit none
   Real(dp) , Intent(in) :: mf, mA, alpha_s
   Real(dp) :: fac, beta, beta2, ratio, R_beta_1, Ln_R_beta_1, Ln_beta

   FFqcd = 0._dp
   ratio = mf / mA
   if (ratio.ge.0.5_dp) return ! decay is kinematically forbitten

   if (ratio.ge.0.495_dp) return ! Coloumb singularity

    beta2 = 1._dp - 4._dp * ratio**2
    beta = Sqrt(beta2)
    
    R_beta_1 = (1. - beta) / (1._dp + beta)
    Ln_beta = Log(beta)
    Ln_R_beta_1 = Log(R_beta_1)

    fac = (19._dp + 2._dp * beta2 + 3._dp * beta**4) / (16._dp * beta)      &
      &     * (-Ln_R_beta_1)                                                &
      & + 0.375_dp * (7._dp - beta2) - 3._dp * Log(4._dp/(1._dp - beta**2)) &
      & - 4._dp * Ln_beta                                                   &
      & + (1._dp + beta**2)                                                 &
      &       * ( 4._dp * Li2(R_beta_1) + 2._dp * Li2(- R_beta_1)           &
      &         + Ln_R_beta_1 * ( 3._dp * Log(2._dp/(1._dp + beta))         &
      &                         + 2._dp * Ln_beta )  ) / beta
    fac =  fac - 3._dp * Log(ratio)  ! absorb large logarithms in mass

    FFqcd = 1._dp + 5._dp * alpha_s * fac * oo3pi 

  end  Function FFqcd
End Subroutine AhTwoBodyDecay
 
 
Subroutine VWLmTwoBodyDecay(i_in,deltaM,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,               & 
& MFu2,MFv,MFv2,Mhh,Mhh2,MHpm,MHpm2,MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,             & 
& MVZR2,PhiW,TW,UC,ZDR,ZER,UP,ZUR,ZDL,ZEL,ZUL,ZH,ZM,ZW,ZZ,gBL,g2,g3,LAM2,LAM1,           & 
& RHO1,RHO2,ALP2,ALP1,ALP3,LAM5,LAM6,LAM3,LAM4,Y,YQ1,YQ2,Yt,YL,YR,Mux,MU12,              & 
& MU22,k1,vR,gPartial,gT,BR)

Implicit None 
 
Real(dp),Intent(in) :: gBL,g2,g3,LAM2,LAM1,RHO1,RHO2,ALP2,ALP1,ALP3,LAM5,LAM6,LAM3,LAM4,MU12,MU22,           & 
& k1,vR,MAh(4),MAh2(4),MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),MFv(9),              & 
& MFv2(9),Mhh(4),Mhh2(4),MHpm(4),MHpm2(4),MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,            & 
& MVZR,MVZR2,PhiW,TW,UC(4,4),UP(4,4),ZH(4,4),ZZ(3,3)

Complex(dp),Intent(in) :: Y(3,3),YQ1(3,3),YQ2(3,3),Yt(3,3),YL(3,3),YR(3,3),Mux(3,3),ZDR(3,3),ZER(3,3),          & 
& ZUR(3,3),ZDL(3,3),ZEL(3,3),ZUL(3,3),ZM(9,9),ZW(4,4)

Complex(dp) :: cplAhHpmcVWLm(4,4),cplAhcVWLmVWRm(4),cplcFuFdcVWLmL(3,3),cplcFuFdcVWLmR(3,3),         & 
& cplFvFecVWLmL(9,3),cplFvFecVWLmR(9,3),cplhhHpmcVWLm(4,4),cplhhcVWLmVWLm(4),            & 
& cplhhcVWLmVWRm(4),cplHpmcVWLmVZ(4),cplHpmcVWLmVZR(4),cplcVWLmVWLmVZ,cplcVWLmVWLmVZR,   & 
& cplcVWLmVWRmVZ,cplcVWLmVWRmVZR

Integer, Intent(in) :: i_in 
Real(dp), Intent(inout) :: gPartial(:,:), gT 
Real(dp), Intent(in) :: deltaM 
Real(dp), Optional, Intent(inout) :: BR(:,:) 
Integer :: i1, i2, i3, i4, i_start, i_end, i_count, gt1, gt2, gt3, gt4 
Real(dp) :: gam, m_in, m1out, m2out, coupReal 
Complex(dp) :: coupC, coupR, coupL, coup 
 
Iname = Iname + 1 
NameOfUnit(Iname) = 'VWLmTwoBodyDecay'
 
If (i_in.Lt.0) Then 
  i_start = 1 
  i_end = 1 
  gT = 0._dp 
  gPartial = 0._dp 
Else 
  If (ErrorLevel.Ge.-1) Then 
     Write(ErrCan,*) 'Problem in subroutine '//NameOfUnit(Iname) 
     Write(ErrCan,*) 'Value of i_in out of range, (i_in,i_max) = ', i_in,1

     Write(*,*) 'Problem in subroutine '//NameOfUnit(Iname) 
     Write(*,*) 'Value of i_in out of range, (i_in,i_max) = ', i_in,1

  End If 
  If (ErrorLevel.Gt.0) Call TerminateProgram 
  If (Present(BR)) BR = 0._dp 
  Iname = Iname -1 
  Return 
End If 
 
i1=1 
m_in = MVWLm 
Call CouplingsFor_VWLm_decays_2B(m_in,i1,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,              & 
& MFu2,MFv,MFv2,Mhh,Mhh2,MHpm,MHpm2,MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,             & 
& MVZR2,PhiW,TW,UC,ZDR,ZER,UP,ZUR,ZDL,ZEL,ZUL,ZH,ZM,ZW,ZZ,gBL,g2,g3,LAM2,LAM1,           & 
& RHO1,RHO2,ALP2,ALP1,ALP3,LAM5,LAM6,LAM3,LAM4,Y,YQ1,YQ2,Yt,YL,YR,Mux,MU12,              & 
& MU22,k1,vR,cplAhHpmcVWLm,cplAhcVWLmVWRm,cplcFuFdcVWLmL,cplcFuFdcVWLmR,cplFvFecVWLmL,   & 
& cplFvFecVWLmR,cplhhHpmcVWLm,cplhhcVWLmVWLm,cplhhcVWLmVWRm,cplHpmcVWLmVZ,               & 
& cplHpmcVWLmVZR,cplcVWLmVWLmVZ,cplcVWLmVWLmVZR,cplcVWLmVWRmVZ,cplcVWLmVWRmVZR,deltaM)

i_count = 1 

 
! ----------------------------------------------
! Hpm, Ah
! ----------------------------------------------

 
Do gt1= 3, 4
  Do gt2=3, 4
m1out = MHpm(gt1)
m2out = MAh(gt2)
coup = cplAhHpmcVWLm(gt2,gt1)
Call VectorBosonToTwoScalars(m_in,m1out,m2out,1,coup,gam) 
gPartial(1,i_count) = 1*gam 
gT = gT + gPartial(1,i_count) 
i_count = i_count +1 
  End Do 
End Do 
 

 
! ----------------------------------------------
! Ah, VWRm
! ----------------------------------------------

 
Do gt1= 3, 4
m1out = MAh(gt1)
m2out = MVWRm
coup = cplAhcVWLmVWRm(gt1)
Call VectorBosonToScalarAndVectorBoson(m_in,m1out,m2out,coup,gam) 
gPartial(1,i_count) = 1*gam 
gT = gT + gPartial(1,i_count) 
i_count = i_count +1 
  End Do 

 
! ----------------------------------------------
! bar[Fu], Fd
! ----------------------------------------------

 
Do gt1= 1, 3
  Do gt2=1, 3
m1out = MFu(gt1)
m2out = MFd(gt2)
coupL = cplcFuFdcVWLmL(gt1,gt2)
coupR = cplcFuFdcVWLmR(gt1,gt2)
Call VectorBosonToTwoFermions(m_in,m1out,m2out,1,coupL,coupR,gam) 
gPartial(1,i_count) = 3*gam 
gT = gT + gPartial(1,i_count) 
i_count = i_count +1 
  End Do 
End Do 
 

 
! ----------------------------------------------
! Fv, Fe
! ----------------------------------------------

 
Do gt1= 1, 9
  Do gt2=1, 3
m1out = MFv(gt1)
m2out = MFe(gt2)
coupL = cplFvFecVWLmL(gt1,gt2)
coupR = cplFvFecVWLmR(gt1,gt2)
Call VectorBosonToTwoFermions(m_in,m1out,m2out,1,coupL,coupR,gam) 
gPartial(1,i_count) = 1*gam 
gT = gT + gPartial(1,i_count) 
i_count = i_count +1 
  End Do 
End Do 
 

 
! ----------------------------------------------
! Hpm, hh
! ----------------------------------------------

 
Do gt1= 3, 4
  Do gt2=1, 4
m1out = MHpm(gt1)
m2out = Mhh(gt2)
coup = cplhhHpmcVWLm(gt2,gt1)
Call VectorBosonToTwoScalars(m_in,m1out,m2out,1,coup,gam) 
gPartial(1,i_count) = 1*gam 
gT = gT + gPartial(1,i_count) 
i_count = i_count +1 
  End Do 
End Do 
 

 
! ----------------------------------------------
! hh, VWLm
! ----------------------------------------------

 
Do gt1= 1, 4
m1out = Mhh(gt1)
m2out = MVWLm
coup = cplhhcVWLmVWLm(gt1)
Call VectorBosonToScalarAndVectorBoson(m_in,m1out,m2out,coup,gam) 
gPartial(1,i_count) = 1*gam 
gT = gT + gPartial(1,i_count) 
i_count = i_count +1 
  End Do 

 
! ----------------------------------------------
! hh, VWRm
! ----------------------------------------------

 
Do gt1= 1, 4
m1out = Mhh(gt1)
m2out = MVWRm
coup = cplhhcVWLmVWRm(gt1)
Call VectorBosonToScalarAndVectorBoson(m_in,m1out,m2out,coup,gam) 
gPartial(1,i_count) = 1*gam 
gT = gT + gPartial(1,i_count) 
i_count = i_count +1 
  End Do 

 
! ----------------------------------------------
! Hpm, VZ
! ----------------------------------------------

 
Do gt1= 3, 4
m1out = MHpm(gt1)
m2out = MVZ
coup = cplHpmcVWLmVZ(gt1)
Call VectorBosonToScalarAndVectorBoson(m_in,m1out,m2out,coup,gam) 
gPartial(1,i_count) = 1*gam 
gT = gT + gPartial(1,i_count) 
i_count = i_count +1 
  End Do 

 
! ----------------------------------------------
! Hpm, VZR
! ----------------------------------------------

 
Do gt1= 3, 4
m1out = MHpm(gt1)
m2out = MVZR
coup = cplHpmcVWLmVZR(gt1)
Call VectorBosonToScalarAndVectorBoson(m_in,m1out,m2out,coup,gam) 
gPartial(1,i_count) = 1*gam 
gT = gT + gPartial(1,i_count) 
i_count = i_count +1 
  End Do 

 
! ----------------------------------------------
! VWLm, VZ
! ----------------------------------------------

 
m1out = MVWLm
m2out = MVZ
coup = cplcVWLmVWLmVZ
Call VectorBosonToTwoVectorBosons(m_in,m1out,m2out,coup,gam) 
gPartial(1,i_count) = 1*gam 
gT = gT + gPartial(1,i_count) 
i_count = i_count +1 

 
! ----------------------------------------------
! VWLm, VZR
! ----------------------------------------------

 
m1out = MVWLm
m2out = MVZR
coup = cplcVWLmVWLmVZR
Call VectorBosonToTwoVectorBosons(m_in,m1out,m2out,coup,gam) 
gPartial(1,i_count) = 1*gam 
gT = gT + gPartial(1,i_count) 
i_count = i_count +1 

 
! ----------------------------------------------
! VWRm, VZ
! ----------------------------------------------

 
m1out = MVWRm
m2out = MVZ
coup = cplcVWLmVWRmVZ
Call VectorBosonToTwoVectorBosons(m_in,m1out,m2out,coup,gam) 
gPartial(1,i_count) = 1*gam 
gT = gT + gPartial(1,i_count) 
i_count = i_count +1 

 
! ----------------------------------------------
! VWRm, VZR
! ----------------------------------------------

 
m1out = MVWRm
m2out = MVZR
coup = cplcVWLmVWRmVZR
Call VectorBosonToTwoVectorBosons(m_in,m1out,m2out,coup,gam) 
gPartial(1,i_count) = 1*gam 
gT = gT + gPartial(1,i_count) 
i_count = i_count +1 
If ((Present(BR)).And.(gT.Eq.0)) Then 
  BR(1,:) = 0._dp 
Else If (Present(BR)) Then 
  BR(1,:) = gPartial(1,:)/gT 
End if 
 
Iname = Iname - 1 
 
End Subroutine VWLmTwoBodyDecay
 
 
Subroutine VWRmTwoBodyDecay(i_in,deltaM,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,               & 
& MFu2,MFv,MFv2,Mhh,Mhh2,MHpm,MHpm2,MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,             & 
& MVZR2,PhiW,TW,UC,ZDR,ZER,UP,ZUR,ZDL,ZEL,ZUL,ZH,ZM,ZW,ZZ,gBL,g2,g3,LAM2,LAM1,           & 
& RHO1,RHO2,ALP2,ALP1,ALP3,LAM5,LAM6,LAM3,LAM4,Y,YQ1,YQ2,Yt,YL,YR,Mux,MU12,              & 
& MU22,k1,vR,gPartial,gT,BR)

Implicit None 
 
Real(dp),Intent(in) :: gBL,g2,g3,LAM2,LAM1,RHO1,RHO2,ALP2,ALP1,ALP3,LAM5,LAM6,LAM3,LAM4,MU12,MU22,           & 
& k1,vR,MAh(4),MAh2(4),MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),MFv(9),              & 
& MFv2(9),Mhh(4),Mhh2(4),MHpm(4),MHpm2(4),MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,            & 
& MVZR,MVZR2,PhiW,TW,UC(4,4),UP(4,4),ZH(4,4),ZZ(3,3)

Complex(dp),Intent(in) :: Y(3,3),YQ1(3,3),YQ2(3,3),Yt(3,3),YL(3,3),YR(3,3),Mux(3,3),ZDR(3,3),ZER(3,3),          & 
& ZUR(3,3),ZDL(3,3),ZEL(3,3),ZUL(3,3),ZM(9,9),ZW(4,4)

Complex(dp) :: cplAhHpmcVWRm(4,4),cplAhcVWRmVWLm(4),cplcFuFdcVWRmL(3,3),cplcFuFdcVWRmR(3,3),         & 
& cplFvFecVWRmL(9,3),cplFvFecVWRmR(9,3),cplhhHpmcVWRm(4,4),cplhhcVWRmVWLm(4),            & 
& cplhhcVWRmVWRm(4),cplHpmcVWRmVZ(4),cplHpmcVWRmVZR(4),cplcVWRmVWLmVZ,cplcVWRmVWLmVZR,   & 
& cplcVWRmVWRmVZ,cplcVWRmVWRmVZR

Integer, Intent(in) :: i_in 
Real(dp), Intent(inout) :: gPartial(:,:), gT 
Real(dp), Intent(in) :: deltaM 
Real(dp), Optional, Intent(inout) :: BR(:,:) 
Integer :: i1, i2, i3, i4, i_start, i_end, i_count, gt1, gt2, gt3, gt4 
Real(dp) :: gam, m_in, m1out, m2out, coupReal 
Complex(dp) :: coupC, coupR, coupL, coup 
 
Iname = Iname + 1 
NameOfUnit(Iname) = 'VWRmTwoBodyDecay'
 
If (i_in.Lt.0) Then 
  i_start = 1 
  i_end = 1 
  gT = 0._dp 
  gPartial = 0._dp 
Else 
  If (ErrorLevel.Ge.-1) Then 
     Write(ErrCan,*) 'Problem in subroutine '//NameOfUnit(Iname) 
     Write(ErrCan,*) 'Value of i_in out of range, (i_in,i_max) = ', i_in,1

     Write(*,*) 'Problem in subroutine '//NameOfUnit(Iname) 
     Write(*,*) 'Value of i_in out of range, (i_in,i_max) = ', i_in,1

  End If 
  If (ErrorLevel.Gt.0) Call TerminateProgram 
  If (Present(BR)) BR = 0._dp 
  Iname = Iname -1 
  Return 
End If 
 
i1=1 
m_in = MVWRm 
Call CouplingsFor_VWRm_decays_2B(m_in,i1,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,              & 
& MFu2,MFv,MFv2,Mhh,Mhh2,MHpm,MHpm2,MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,             & 
& MVZR2,PhiW,TW,UC,ZDR,ZER,UP,ZUR,ZDL,ZEL,ZUL,ZH,ZM,ZW,ZZ,gBL,g2,g3,LAM2,LAM1,           & 
& RHO1,RHO2,ALP2,ALP1,ALP3,LAM5,LAM6,LAM3,LAM4,Y,YQ1,YQ2,Yt,YL,YR,Mux,MU12,              & 
& MU22,k1,vR,cplAhHpmcVWRm,cplAhcVWRmVWLm,cplcFuFdcVWRmL,cplcFuFdcVWRmR,cplFvFecVWRmL,   & 
& cplFvFecVWRmR,cplhhHpmcVWRm,cplhhcVWRmVWLm,cplhhcVWRmVWRm,cplHpmcVWRmVZ,               & 
& cplHpmcVWRmVZR,cplcVWRmVWLmVZ,cplcVWRmVWLmVZR,cplcVWRmVWRmVZ,cplcVWRmVWRmVZR,deltaM)

i_count = 1 

 
! ----------------------------------------------
! Hpm, Ah
! ----------------------------------------------

 
Do gt1= 3, 4
  Do gt2=3, 4
m1out = MHpm(gt1)
m2out = MAh(gt2)
coup = cplAhHpmcVWRm(gt2,gt1)
Call VectorBosonToTwoScalars(m_in,m1out,m2out,1,coup,gam) 
gPartial(1,i_count) = 1*gam 
gT = gT + gPartial(1,i_count) 
i_count = i_count +1 
  End Do 
End Do 
 

 
! ----------------------------------------------
! Ah, VWLm
! ----------------------------------------------

 
Do gt1= 3, 4
m1out = MAh(gt1)
m2out = MVWLm
coup = cplAhcVWRmVWLm(gt1)
Call VectorBosonToScalarAndVectorBoson(m_in,m1out,m2out,coup,gam) 
gPartial(1,i_count) = 1*gam 
gT = gT + gPartial(1,i_count) 
i_count = i_count +1 
  End Do 

 
! ----------------------------------------------
! bar[Fu], Fd
! ----------------------------------------------

 
Do gt1= 1, 3
  Do gt2=1, 3
m1out = MFu(gt1)
m2out = MFd(gt2)
coupL = cplcFuFdcVWRmL(gt1,gt2)
coupR = cplcFuFdcVWRmR(gt1,gt2)
Call VectorBosonToTwoFermions(m_in,m1out,m2out,1,coupL,coupR,gam) 
gPartial(1,i_count) = 3*gam 
gT = gT + gPartial(1,i_count) 
i_count = i_count +1 
  End Do 
End Do 
 

 
! ----------------------------------------------
! Fv, Fe
! ----------------------------------------------

 
Do gt1= 1, 9
  Do gt2=1, 3
m1out = MFv(gt1)
m2out = MFe(gt2)
coupL = cplFvFecVWRmL(gt1,gt2)
coupR = cplFvFecVWRmR(gt1,gt2)
Call VectorBosonToTwoFermions(m_in,m1out,m2out,1,coupL,coupR,gam) 
gPartial(1,i_count) = 1*gam 
gT = gT + gPartial(1,i_count) 
i_count = i_count +1 
  End Do 
End Do 
 

 
! ----------------------------------------------
! Hpm, hh
! ----------------------------------------------

 
Do gt1= 3, 4
  Do gt2=1, 4
m1out = MHpm(gt1)
m2out = Mhh(gt2)
coup = cplhhHpmcVWRm(gt2,gt1)
Call VectorBosonToTwoScalars(m_in,m1out,m2out,1,coup,gam) 
gPartial(1,i_count) = 1*gam 
gT = gT + gPartial(1,i_count) 
i_count = i_count +1 
  End Do 
End Do 
 

 
! ----------------------------------------------
! hh, VWLm
! ----------------------------------------------

 
Do gt1= 1, 4
m1out = Mhh(gt1)
m2out = MVWLm
coup = cplhhcVWRmVWLm(gt1)
Call VectorBosonToScalarAndVectorBoson(m_in,m1out,m2out,coup,gam) 
gPartial(1,i_count) = 1*gam 
gT = gT + gPartial(1,i_count) 
i_count = i_count +1 
  End Do 

 
! ----------------------------------------------
! hh, VWRm
! ----------------------------------------------

 
Do gt1= 1, 4
m1out = Mhh(gt1)
m2out = MVWRm
coup = cplhhcVWRmVWRm(gt1)
Call VectorBosonToScalarAndVectorBoson(m_in,m1out,m2out,coup,gam) 
gPartial(1,i_count) = 1*gam 
gT = gT + gPartial(1,i_count) 
i_count = i_count +1 
  End Do 

 
! ----------------------------------------------
! Hpm, VZ
! ----------------------------------------------

 
Do gt1= 3, 4
m1out = MHpm(gt1)
m2out = MVZ
coup = cplHpmcVWRmVZ(gt1)
Call VectorBosonToScalarAndVectorBoson(m_in,m1out,m2out,coup,gam) 
gPartial(1,i_count) = 1*gam 
gT = gT + gPartial(1,i_count) 
i_count = i_count +1 
  End Do 

 
! ----------------------------------------------
! Hpm, VZR
! ----------------------------------------------

 
Do gt1= 3, 4
m1out = MHpm(gt1)
m2out = MVZR
coup = cplHpmcVWRmVZR(gt1)
Call VectorBosonToScalarAndVectorBoson(m_in,m1out,m2out,coup,gam) 
gPartial(1,i_count) = 1*gam 
gT = gT + gPartial(1,i_count) 
i_count = i_count +1 
  End Do 

 
! ----------------------------------------------
! VWLm, VZ
! ----------------------------------------------

 
m1out = MVWLm
m2out = MVZ
coup = cplcVWRmVWLmVZ
Call VectorBosonToTwoVectorBosons(m_in,m1out,m2out,coup,gam) 
gPartial(1,i_count) = 1*gam 
gT = gT + gPartial(1,i_count) 
i_count = i_count +1 

 
! ----------------------------------------------
! VWLm, VZR
! ----------------------------------------------

 
m1out = MVWLm
m2out = MVZR
coup = cplcVWRmVWLmVZR
Call VectorBosonToTwoVectorBosons(m_in,m1out,m2out,coup,gam) 
gPartial(1,i_count) = 1*gam 
gT = gT + gPartial(1,i_count) 
i_count = i_count +1 

 
! ----------------------------------------------
! VWRm, VZ
! ----------------------------------------------

 
m1out = MVWRm
m2out = MVZ
coup = cplcVWRmVWRmVZ
Call VectorBosonToTwoVectorBosons(m_in,m1out,m2out,coup,gam) 
gPartial(1,i_count) = 1*gam 
gT = gT + gPartial(1,i_count) 
i_count = i_count +1 

 
! ----------------------------------------------
! VWRm, VZR
! ----------------------------------------------

 
m1out = MVWRm
m2out = MVZR
coup = cplcVWRmVWRmVZR
Call VectorBosonToTwoVectorBosons(m_in,m1out,m2out,coup,gam) 
gPartial(1,i_count) = 1*gam 
gT = gT + gPartial(1,i_count) 
i_count = i_count +1 
If ((Present(BR)).And.(gT.Eq.0)) Then 
  BR(1,:) = 0._dp 
Else If (Present(BR)) Then 
  BR(1,:) = gPartial(1,:)/gT 
End if 
 
Iname = Iname - 1 
 
End Subroutine VWRmTwoBodyDecay
 
 
Subroutine ScalarToTwoVectorbosonsNew(mS,mV1,mV2,coup,width)
  implicit none
   real(dp), intent(in) :: mS,mV1,mV2
   real(dp), intent(out) :: width
   complex(dp), intent(in) :: coup

   real(dp) :: mSsq,mV1sq, mV2sq,kappa

   if ( abs(mS).le.( abs(mV1)+abs(mV2) ) ) then
    width = 0._dp

   elseif (mV1.eq.0._dp) then
    write(ErrCan,*) 'Server warning, in subroutine ScalarToTwoVectorbosons'
    write(ErrCan,*) 'm_V1 = 0, setting width to 0'
    width = 0._dp

   elseif (mV2.eq.0._dp) then
    write(ErrCan,*) 'Server warning, in subroutine ScalarToTwoVectorbosons'
    write(ErrCan,*) 'm_V2 = 0, setting width to 0'
    width = 0._dp


   elseif (Abs(coup).eq.0._dp) then
    width = 0._dp

   else
    mSsq = mS * mS
    mV1sq = mV1**2
    mV2sq = mV2**2
    kappa = Sqrt( (mSsq-mV1sq-mV2sq)**2 - 4._dp * mV1sq*mV2sq )/(mS**3)
    width = coup**2/(4._dp*mV1sq*mV2sq)*(mV1sq**2 + 10._dp*mV1sq*mV2sq - &
             & 2._dp*(mV1sq+mV2sq)*mSsq + mV2sq**2 +mSsq**2)
    width = oo16Pi*width*kappa

   endif

  End Subroutine ScalarToTwoVectorbosonsNew

Subroutine FermionToFermionVectorBosonMassless(mFin,mFout,mV,coupL,coupR,width)
  implicit none
   real(dp), intent(in) :: mFin,mFout,mV
   real(dp), intent(out) :: width
   complex(dp), intent(in) :: coupL, coupR


   if ( abs(mFin).le.( abs(mFout)+abs(mV) ) ) then
    width = 0._dp

   else

    width = 0.5_dp*oo16Pi*(Abs(coupL)**2 + Abs(coupR)**2)*mFin**3


   endif

  End Subroutine FermionToFermionVectorBosonMassless

End Module TreeLevelDecays_DLRSM 
 
