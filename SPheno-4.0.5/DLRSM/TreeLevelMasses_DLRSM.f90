! ------------------------------------------------------------------------------  
! This file was automatically created by SARAH version 4.15.3 
! SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223,
!           1405.1434, 1411.0675, 1503.03098, 1703.09237, 1706.05372, 1805.07306  
! (c) Florian Staub, Mark Goodsell and Werner Porod 2020  
! ------------------------------------------------------------------------------  
! File created at 20:03 on 28.5.2025   
! ----------------------------------------------------------------------  
 
 
Module TreeLevelMasses_DLRSM 
 
Use Control 
Use Mathematics 
Use MathematicsQP 
Use Settings 
Use Model_Data_DLRSM 

 
Logical :: SignOfMassChanged =.False.  
Logical :: SignOfMuChanged =.False.  
Contains 
 
Subroutine TreeMasses(MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,               & 
& Mhh2,MHpm,MHpm2,MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,MVZR2,PhiW,TW,UC,              & 
& ZDR,ZER,UP,ZUR,ZDL,ZEL,ZUL,ZH,ZM,ZW,ZZ,k1,k2,vR,vL,gBL,g2,g3,LAM2,LAM1,ALP1,           & 
& RHO1,RHO2,ALP2,ALP3,LAM5,LAM3,LAM4,LAM6,Y,YQ1,YQ2,Yt,MU12,MU22,GenerationMixing,kont)

Implicit None 
 
Real(dp),Intent(in) :: gBL,g2,g3,LAM2,LAM1,ALP1,RHO1,RHO2,ALP2,ALP3,LAM5,LAM3,LAM4,LAM6,MU12,MU22

Complex(dp),Intent(in) :: Y(3,3),YQ1(3,3),YQ2(3,3),Yt(3,3)

Real(dp),Intent(out) :: MAh(4),MAh2(4),MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),MFv(9),MFv2(9),           & 
& Mhh(4),Mhh2(4),MHpm(4),MHpm2(4),MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,               & 
& MVZR2,PhiW,TW,UC(4,4),UP(4,4),ZH(4,4)

Complex(dp),Intent(out) :: ZDR(3,3),ZER(3,3),ZUR(3,3),ZDL(3,3),ZEL(3,3),ZUL(3,3),ZM(9,9),ZW(4,4),ZZ(3,3)

Real(dp),Intent(in) :: k1,k2,vR,vL

Logical, Intent(in) :: GenerationMixing 
Integer, Intent(inout) :: kont 
Integer :: i1,i2,i3,i4,j1,j2,j3,kontSave 
Iname = Iname + 1 
NameOfUnit(Iname) = 'TreeMassesDLRSM'
 
kont = 0 
Call CalculateVPVZVZR(gBL,g2,k1,k2,vR,vL,ZZ,MVZ,MVZR,MVZ2,MVZR2,kont)

Call CalculateVWLmVWRm(g2,k1,k2,vR,vL,ZW,MVWLm,MVWRm,MVWLm2,MVWRm2,PhiW,kont)

Call CalculateMhh(MU12,MU22,LAM2,LAM1,ALP1,RHO1,RHO2,ALP2,LAM3,LAM6,k1,               & 
& k2,vR,vL,ZH,Mhh,Mhh2,kont)

kontSave = kont 
Call CalculateMAh(gBL,g2,MU12,MU22,LAM2,LAM1,ALP1,RHO1,RHO2,ALP2,LAM3,LAM4,           & 
& LAM6,k1,k2,vR,vL,ZZ,UP,MAh,MAh2,kont)

kont = kontSave 
kontSave = kont 
Call CalculateMHpm(g2,MU12,MU22,LAM2,LAM1,ALP1,RHO1,RHO2,ALP2,ALP3,LAM5,              & 
& LAM3,LAM4,LAM6,k1,k2,vR,vL,PhiW,UC,MHpm,MHpm2,kont)

kont = kontSave 
Call CalculateMFd(YQ1,YQ2,k1,k2,ZDL,ZDR,MFd,kont)

MFd2 = MFd**2 
Call CalculateMFu(YQ1,YQ2,k1,k2,ZUL,ZUR,MFu,kont)

MFu2 = MFu**2 
Call CalculateMFe(Y,Yt,k1,k2,ZEL,ZER,MFe,kont)

MFe2 = MFe**2 
Call CalculateMFv(Y,Yt,k1,k2,ZM,MFv,kont)

MFv2 = MFv**2 

 
 Call SortGoldstones(MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,            & 
& MHpm,MHpm2,MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,MVZR2,PhiW,TW,UC,ZDR,               & 
& ZER,UP,ZUR,ZDL,ZEL,ZUL,ZH,ZM,ZW,ZZ,kont)

If (SignOfMassChanged) Then  
 If (.Not.IgnoreNegativeMasses) Then 
  Write(*,*) " Stopping calculation because of negative mass squared." 
  Call TerminateProgram 
 Else 
  SignOfMassChanged= .False. 
  kont=0  
 End If 
End If 
If (SignOfMuChanged) Then 
 If (.Not.IgnoreMuSignFlip) Then 
  Write(*,*) " Stopping calculation because of negative mass squared in tadpoles." 
  Call TerminateProgram 
 Else 
  SignOfMuChanged= .False. 
  kont=0 
 End If 
End If 

 ! -------------------------------- 
! Setting Goldstone masses 
! -------------------------------- 
 
MAh(1)=MVZ*sqrt(RXiZ)
MAh2(1)=MVZ2*RXiZ
MAh(2)=MVZR*sqrt(RXiZR)
MAh2(2)=MVZR2*RXiZR
MHpm(1)=MVWLm*sqrt(RXiWLm)
MHpm2(1)=MVWLm2*RXiWLm
MHpm(2)=MVWRm*sqrt(RXiWRm)
MHpm2(2)=MVWRm2*RXiWRm
PhiW = ACos(Sqrt(Abs(ZW(1,1))**2 + Abs(ZW(1,2))**2))
TW = ASin(Abs(ZZ(2,1)))
Iname = Iname - 1 
 
End Subroutine  TreeMasses 
 
 
Subroutine RunningFermionMasses(MFeIN,MFe2IN,MFdIN,MFd2IN,MFuIN,MFu2IN,               & 
& k1,k2,vR,vL,gBL,g2,g3,LAM2,LAM1,ALP1,RHO1,RHO2,ALP2,ALP3,LAM5,LAM3,LAM4,               & 
& LAM6,Y,YQ1,YQ2,Yt,MU12,MU22,kont)

Implicit None 
 
Integer, Intent(inout) :: kont 
Real(dp),Intent(in) :: gBL,g2,g3,LAM2,LAM1,ALP1,RHO1,RHO2,ALP2,ALP3,LAM5,LAM3,LAM4,LAM6,MU12,MU22

Complex(dp),Intent(in) :: Y(3,3),YQ1(3,3),YQ2(3,3),Yt(3,3)

Real(dp),Intent(in) :: k1,k2,vR,vL

Real(dp),Intent(inout) :: MFeIN(3),MFe2IN(3),MFdIN(3),MFd2IN(3),MFuIN(3),MFu2IN(3)

Real(dp) :: MFe(3),MFe2(3),MFd(3),MFd2(3),MFu(3),MFu2(3)

Call CalculateMFe(Y,Yt,k1,k2,ZEL,ZER,MFe,kont)

MFe2 = MFe**2 
MFeIN(1:2) = MFe(1:2) 
MFe2IN(1:2) = MFe2(1:2) 
Call CalculateMFd(YQ1,YQ2,k1,k2,ZDL,ZDR,MFd,kont)

MFd2 = MFd**2 
MFdIN(1:2) = MFd(1:2) 
MFd2IN(1:2) = MFd2(1:2) 
Call CalculateMFu(YQ1,YQ2,k1,k2,ZUL,ZUR,MFu,kont)

MFu2 = MFu**2 
MFuIN(1:2) = MFu(1:2) 
MFu2IN(1:2) = MFu2(1:2) 
End Subroutine RunningFermionMasses 

Subroutine TreeMassesEffPot(MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,             & 
& Mhh,Mhh2,MHpm,MHpm2,MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,MVZR2,PhiW,TW,             & 
& UC,ZDR,ZER,UP,ZUR,ZDL,ZEL,ZUL,ZH,ZM,ZW,ZZ,k1,k2,vR,vL,gBL,g2,g3,LAM2,LAM1,             & 
& ALP1,RHO1,RHO2,ALP2,ALP3,LAM5,LAM3,LAM4,LAM6,Y,YQ1,YQ2,Yt,MU12,MU22,GenerationMixing,kont)

Implicit None 
 
Real(dp),Intent(in) :: gBL,g2,g3,LAM2,LAM1,ALP1,RHO1,RHO2,ALP2,ALP3,LAM5,LAM3,LAM4,LAM6,MU12,MU22

Complex(dp),Intent(in) :: Y(3,3),YQ1(3,3),YQ2(3,3),Yt(3,3)

Real(dp),Intent(out) :: MAh(4),MAh2(4),MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),MFv(9),MFv2(9),           & 
& Mhh(4),Mhh2(4),MHpm(4),MHpm2(4),MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,               & 
& MVZR2,PhiW,TW,UC(4,4),UP(4,4),ZH(4,4)

Complex(dp),Intent(out) :: ZDR(3,3),ZER(3,3),ZUR(3,3),ZDL(3,3),ZEL(3,3),ZUL(3,3),ZM(9,9),ZW(4,4),ZZ(3,3)

Real(dp),Intent(in) :: k1,k2,vR,vL

Logical, Intent(in) :: GenerationMixing 
Integer, Intent(inout) :: kont 
Integer :: i1,i2,i3,i4,j1,j2,j3,kontSave 
Iname = Iname + 1 
NameOfUnit(Iname) = 'TreeMassesDLRSM'
 
kont = 0 
Call CalculateVPVZVZREffPot(gBL,g2,k1,k2,vR,vL,ZZ,MVZ,MVZR,MVZ2,MVZR2,kont)

Call CalculateVWLmVWRmEffPot(g2,k1,k2,vR,vL,ZW,MVWLm,MVWRm,MVWLm2,MVWRm2,             & 
& PhiW,kont)

Call CalculateMhhEffPot(MU12,MU22,LAM2,LAM1,ALP1,RHO1,RHO2,ALP2,LAM3,LAM6,            & 
& k1,k2,vR,vL,ZH,Mhh,Mhh2,kont)

kontSave = kont 
Call CalculateMAhEffPot(gBL,g2,MU12,MU22,LAM2,LAM1,ALP1,RHO1,RHO2,ALP2,               & 
& LAM3,LAM4,LAM6,k1,k2,vR,vL,ZZ,UP,MAh,MAh2,kont)

kont = kontSave 
kontSave = kont 
Call CalculateMHpmEffPot(g2,MU12,MU22,LAM2,LAM1,ALP1,RHO1,RHO2,ALP2,ALP3,             & 
& LAM5,LAM3,LAM4,LAM6,k1,k2,vR,vL,PhiW,UC,MHpm,MHpm2,kont)

kont = kontSave 
Call CalculateMFdEffPot(YQ1,YQ2,k1,k2,ZDL,ZDR,MFd,kont)

MFd2 = MFd**2 
Call CalculateMFuEffPot(YQ1,YQ2,k1,k2,ZUL,ZUR,MFu,kont)

MFu2 = MFu**2 
Call CalculateMFeEffPot(Y,Yt,k1,k2,ZEL,ZER,MFe,kont)

MFe2 = MFe**2 
Call CalculateMFvEffPot(Y,Yt,k1,k2,ZM,MFv,kont)

MFv2 = MFv**2 

 
 If (SignOfMassChanged) Then  
 If (.Not.IgnoreNegativeMasses) Then 
  Write(*,*) " Stopping calculation because of negative mass squared." 
  Call TerminateProgram 
 Else 
  SignOfMassChanged= .False. 
  kont=0  
 End If 
End If 
If (SignOfMuChanged) Then 
 If (.Not.IgnoreMuSignFlip) Then 
  Write(*,*) " Stopping calculation because of negative mass squared in tadpoles." 
  Call TerminateProgram 
 Else 
  SignOfMuChanged= .False. 
  kont=0 
 End If 
End If 
Iname = Iname - 1 
 
End Subroutine  TreeMassesEffPot 
 
 
Subroutine CalculateMhh(MU12,MU22,LAM2,LAM1,ALP1,RHO1,RHO2,ALP2,LAM3,LAM6,            & 
& k1,k2,vR,vL,ZH,Mhh,Mhh2,kont)

Real(dp), Intent(in) :: MU12,MU22,LAM2,LAM1,ALP1,RHO1,RHO2,ALP2,LAM3,LAM6,k1,k2,vR,vL

Integer, Intent(inout) :: kont 
Integer :: i1,i2,i3,i4, ierr 
Integer :: j1,j2,j3,j4, pos 
Real(dp), Intent(out) :: Mhh(4), Mhh2(4) 
Real(dp), Intent(out) :: ZH(4,4) 
 
Real(dp) :: mat(4,4)  

Real(dp) ::  test(2) 

Iname = Iname + 1 
NameOfUnit(Iname) = 'CalculateMhh'
 
mat(1,1) = 0._dp 
mat(1,1) = mat(1,1)-3*k1**2*LAM1
mat(1,1) = mat(1,1)-(k2**2*LAM1)
mat(1,1) = mat(1,1)-3*k1**2*LAM2
mat(1,1) = mat(1,1)-4*k2**2*LAM3
mat(1,1) = mat(1,1)-2*k2**2*LAM6
mat(1,1) = mat(1,1)+MU12
mat(1,1) = mat(1,1)-1._dp/2._dp*(ALP1*vL**2)
mat(1,1) = mat(1,1)-1._dp/2._dp*(ALP1*vR**2)
mat(1,2) = 0._dp 
mat(1,2) = mat(1,2)-2*k1*k2*LAM1
mat(1,2) = mat(1,2)-8*k1*k2*LAM3
mat(1,2) = mat(1,2)-4*k1*k2*LAM6
mat(1,3) = 0._dp 
mat(1,3) = mat(1,3)-(ALP1*k1*vR)
mat(1,4) = 0._dp 
mat(1,4) = mat(1,4)-(ALP1*k1*vL)
mat(2,2) = 0._dp 
mat(2,2) = mat(2,2)-(k1**2*LAM1)
mat(2,2) = mat(2,2)-3*k2**2*LAM1
mat(2,2) = mat(2,2)-3*k2**2*LAM2
mat(2,2) = mat(2,2)-4*k1**2*LAM3
mat(2,2) = mat(2,2)-2*k1**2*LAM6
mat(2,2) = mat(2,2)+MU12
mat(2,2) = mat(2,2)-1._dp/2._dp*(ALP1*vL**2)
mat(2,2) = mat(2,2)-1._dp/2._dp*(ALP2*vL**2)
mat(2,2) = mat(2,2)-1._dp/2._dp*(ALP1*vR**2)
mat(2,2) = mat(2,2)-1._dp/2._dp*(ALP2*vR**2)
mat(2,3) = 0._dp 
mat(2,3) = mat(2,3)-(ALP1*k2*vR)
mat(2,3) = mat(2,3)-(ALP2*k2*vR)
mat(2,4) = 0._dp 
mat(2,4) = mat(2,4)-(ALP1*k2*vL)
mat(2,4) = mat(2,4)-(ALP2*k2*vL)
mat(3,3) = 0._dp 
mat(3,3) = mat(3,3)-1._dp/2._dp*(ALP1*k1**2)
mat(3,3) = mat(3,3)-1._dp/2._dp*(ALP1*k2**2)
mat(3,3) = mat(3,3)-1._dp/2._dp*(ALP2*k2**2)
mat(3,3) = mat(3,3)+MU22
mat(3,3) = mat(3,3)-1._dp/2._dp*(RHO2*vL**2)
mat(3,3) = mat(3,3)-3*RHO1*vR**2
mat(3,4) = 0._dp 
mat(3,4) = mat(3,4)-(RHO2*vL*vR)
mat(4,4) = 0._dp 
mat(4,4) = mat(4,4)-1._dp/2._dp*(ALP1*k1**2)
mat(4,4) = mat(4,4)-1._dp/2._dp*(ALP1*k2**2)
mat(4,4) = mat(4,4)-1._dp/2._dp*(ALP2*k2**2)
mat(4,4) = mat(4,4)+MU22
mat(4,4) = mat(4,4)-3*RHO1*vL**2
mat(4,4) = mat(4,4)-1._dp/2._dp*(RHO2*vR**2)

 
 Do i1=2,4
  Do i2 = 1, i1-1 
  mat(i1,i2) = mat(i2,i1) 
  End do 
End do 

 
Call EigenSystem(mat,Mhh2,ZH,ierr,test) 
 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Then 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
    Call TerminateProgram 
  End If 
  ierr = 0 
End If 
 
If ((ierr.Ne.0.).And.(ErrorLevel.Ge.-1)) Then 
  Write(10,*) 'Warning from Subroutine '//NameOfUnit(Iname) 
  Write(10,*) 'Diagonalization failed, ierr : ',ierr 
  kont = ierr 
  Iname = Iname - 1 
  Return 
End If 


Do i1=1,4
  If (Abs(Mhh2(i1)).Le.MaxMassNumericalZero) Mhh2(i1) = 1.E-10_dp 
  If (Mhh2(i1).ne.Mhh2(i1)) Then 
      Write(*,*) 'NaN appearing in '//NameOfUnit(Iname) 
      Call TerminateProgram 
    End If 
  If (Mhh2(i1).Ge.0._dp) Then 
  Mhh(i1)=Sqrt(Mhh2(i1) ) 
  Else 
    If (ErrorLevel.Ge.0) Then 
      Write(10,*) 'Warning from Subroutine '//NameOfUnit(Iname) 
      Write(10,*) 'a mass squarred is negative: ',i1,Mhh2(i1) 
    End If 
  Mhh(i1) = 1._dp 
     Write(ErrCan,*) 'Warning from routine '//NameOfUnit(Iname) 
     Write(ErrCan,*) 'in the calculation of the masses' 
     Write(ErrCan,*) 'occurred a negative mass squared!' 
     Write(ErrCan,*) i1,Mhh2(i1) 
     Write(*,*) 'Warning from routine '//NameOfUnit(Iname) 
     Write(*,*) 'in the calculation of the masses' 
     Write(*,*) 'occurred a negative mass squared!' 
     Write(*,*) i1,Mhh2(i1) 
  Mhh2(i1) = 1._dp 
   SignOfMassChanged = .True. 
! kont = -104 
 End if 
End Do 
Iname = Iname - 1 
 
End Subroutine CalculateMhh 

Subroutine CalculateMAh(gBL,g2,MU12,MU22,LAM2,LAM1,ALP1,RHO1,RHO2,ALP2,               & 
& LAM3,LAM4,LAM6,k1,k2,vR,vL,ZZ,UP,MAh,MAh2,kont)

Real(dp), Intent(in) :: gBL,g2,MU12,MU22,LAM2,LAM1,ALP1,RHO1,RHO2,ALP2,LAM3,LAM4,LAM6,k1,k2,vR,vL

Complex(dp), Intent(in) :: ZZ(3,3)

Integer, Intent(inout) :: kont 
Integer :: i1,i2,i3,i4, ierr 
Integer :: j1,j2,j3,j4, pos 
Real(dp), Intent(out) :: MAh(4), MAh2(4) 
Real(dp), Intent(out) :: UP(4,4) 
 
Real(dp) :: mat(4,4)  

Real(dp) ::  test(2) 

Iname = Iname + 1 
NameOfUnit(Iname) = 'CalculateMAh'
 
mat(1,1) = 0._dp 
mat(1,1) = mat(1,1)-(k1**2*LAM1)
mat(1,1) = mat(1,1)-(k2**2*LAM1)
mat(1,1) = mat(1,1)-(k1**2*LAM2)
mat(1,1) = mat(1,1)+2*k2**2*LAM4
mat(1,1) = mat(1,1)+2*k2**2*LAM6
mat(1,1) = mat(1,1)+MU12
mat(1,1) = mat(1,1)-1._dp/2._dp*(ALP1*vL**2)
mat(1,1) = mat(1,1)-1._dp/2._dp*(ALP1*vR**2)
mat(1,1) = mat(1,1)+(g2**2*k1**2*Conjg(ZZ(2,2))*RXiZ*ZZ(2,2))/4._dp
mat(1,1) = mat(1,1)-1._dp/4._dp*(g2**2*k1**2*Conjg(ZZ(3,2))*RXiZ*ZZ(2,2))
mat(1,1) = mat(1,1)+(g2**2*k1**2*Conjg(ZZ(2,3))*RXiZR*ZZ(2,3))/4._dp
mat(1,1) = mat(1,1)-1._dp/4._dp*(g2**2*k1**2*Conjg(ZZ(3,3))*RXiZR*ZZ(2,3))
mat(1,1) = mat(1,1)-1._dp/4._dp*(g2**2*k1**2*Conjg(ZZ(2,2))*RXiZ*ZZ(3,2))
mat(1,1) = mat(1,1)+(g2**2*k1**2*Conjg(ZZ(3,2))*RXiZ*ZZ(3,2))/4._dp
mat(1,1) = mat(1,1)-1._dp/4._dp*(g2**2*k1**2*Conjg(ZZ(2,3))*RXiZR*ZZ(3,3))
mat(1,1) = mat(1,1)+(g2**2*k1**2*Conjg(ZZ(3,3))*RXiZR*ZZ(3,3))/4._dp
mat(1,2) = 0._dp 
mat(1,2) = mat(1,2)+4*k1*k2*LAM3
mat(1,2) = mat(1,2)+2*k1*k2*LAM4
mat(1,2) = mat(1,2)+4*k1*k2*LAM6
mat(1,2) = mat(1,2)-1._dp/4._dp*(g2**2*k1*k2*Conjg(ZZ(2,2))*RXiZ*ZZ(2,2))
mat(1,2) = mat(1,2)+(g2**2*k1*k2*Conjg(ZZ(3,2))*RXiZ*ZZ(2,2))/4._dp
mat(1,2) = mat(1,2)-1._dp/4._dp*(g2**2*k1*k2*Conjg(ZZ(2,3))*RXiZR*ZZ(2,3))
mat(1,2) = mat(1,2)+(g2**2*k1*k2*Conjg(ZZ(3,3))*RXiZR*ZZ(2,3))/4._dp
mat(1,2) = mat(1,2)+(g2**2*k1*k2*Conjg(ZZ(2,2))*RXiZ*ZZ(3,2))/4._dp
mat(1,2) = mat(1,2)-1._dp/4._dp*(g2**2*k1*k2*Conjg(ZZ(3,2))*RXiZ*ZZ(3,2))
mat(1,2) = mat(1,2)+(g2**2*k1*k2*Conjg(ZZ(2,3))*RXiZR*ZZ(3,3))/4._dp
mat(1,2) = mat(1,2)-1._dp/4._dp*(g2**2*k1*k2*Conjg(ZZ(3,3))*RXiZR*ZZ(3,3))
mat(1,3) = 0._dp 
mat(1,3) = mat(1,3)+(g2*gBL*k1*vR*Conjg(ZZ(2,2))*RXiZ*ZZ(1,2))/4._dp
mat(1,3) = mat(1,3)-1._dp/4._dp*(g2*gBL*k1*vR*Conjg(ZZ(3,2))*RXiZ*ZZ(1,2))
mat(1,3) = mat(1,3)+(g2*gBL*k1*vR*Conjg(ZZ(2,3))*RXiZR*ZZ(1,3))/4._dp
mat(1,3) = mat(1,3)-1._dp/4._dp*(g2*gBL*k1*vR*Conjg(ZZ(3,3))*RXiZR*ZZ(1,3))
mat(1,3) = mat(1,3)+(g2*gBL*k1*vR*Conjg(ZZ(1,2))*RXiZ*ZZ(2,2))/4._dp
mat(1,3) = mat(1,3)-1._dp/8._dp*(g2**2*k1*vR*Conjg(ZZ(3,2))*RXiZ*ZZ(2,2))
mat(1,3) = mat(1,3)+(g2*gBL*k1*vR*Conjg(ZZ(1,3))*RXiZR*ZZ(2,3))/4._dp
mat(1,3) = mat(1,3)-1._dp/8._dp*(g2**2*k1*vR*Conjg(ZZ(3,3))*RXiZR*ZZ(2,3))
mat(1,3) = mat(1,3)-1._dp/4._dp*(g2*gBL*k1*vR*Conjg(ZZ(1,2))*RXiZ*ZZ(3,2))
mat(1,3) = mat(1,3)-1._dp/8._dp*(g2**2*k1*vR*Conjg(ZZ(2,2))*RXiZ*ZZ(3,2))
mat(1,3) = mat(1,3)+(g2**2*k1*vR*Conjg(ZZ(3,2))*RXiZ*ZZ(3,2))/4._dp
mat(1,3) = mat(1,3)-1._dp/4._dp*(g2*gBL*k1*vR*Conjg(ZZ(1,3))*RXiZR*ZZ(3,3))
mat(1,3) = mat(1,3)-1._dp/8._dp*(g2**2*k1*vR*Conjg(ZZ(2,3))*RXiZR*ZZ(3,3))
mat(1,3) = mat(1,3)+(g2**2*k1*vR*Conjg(ZZ(3,3))*RXiZR*ZZ(3,3))/4._dp
mat(1,4) = 0._dp 
mat(1,4) = mat(1,4)+(g2*gBL*k1*vL*Conjg(ZZ(2,2))*RXiZ*ZZ(1,2))/4._dp
mat(1,4) = mat(1,4)-1._dp/4._dp*(g2*gBL*k1*vL*Conjg(ZZ(3,2))*RXiZ*ZZ(1,2))
mat(1,4) = mat(1,4)+(g2*gBL*k1*vL*Conjg(ZZ(2,3))*RXiZR*ZZ(1,3))/4._dp
mat(1,4) = mat(1,4)-1._dp/4._dp*(g2*gBL*k1*vL*Conjg(ZZ(3,3))*RXiZR*ZZ(1,3))
mat(1,4) = mat(1,4)+(g2*gBL*k1*vL*Conjg(ZZ(1,2))*RXiZ*ZZ(2,2))/4._dp
mat(1,4) = mat(1,4)-1._dp/4._dp*(g2**2*k1*vL*Conjg(ZZ(2,2))*RXiZ*ZZ(2,2))
mat(1,4) = mat(1,4)+(g2**2*k1*vL*Conjg(ZZ(3,2))*RXiZ*ZZ(2,2))/8._dp
mat(1,4) = mat(1,4)+(g2*gBL*k1*vL*Conjg(ZZ(1,3))*RXiZR*ZZ(2,3))/4._dp
mat(1,4) = mat(1,4)-1._dp/4._dp*(g2**2*k1*vL*Conjg(ZZ(2,3))*RXiZR*ZZ(2,3))
mat(1,4) = mat(1,4)+(g2**2*k1*vL*Conjg(ZZ(3,3))*RXiZR*ZZ(2,3))/8._dp
mat(1,4) = mat(1,4)-1._dp/4._dp*(g2*gBL*k1*vL*Conjg(ZZ(1,2))*RXiZ*ZZ(3,2))
mat(1,4) = mat(1,4)+(g2**2*k1*vL*Conjg(ZZ(2,2))*RXiZ*ZZ(3,2))/8._dp
mat(1,4) = mat(1,4)-1._dp/4._dp*(g2*gBL*k1*vL*Conjg(ZZ(1,3))*RXiZR*ZZ(3,3))
mat(1,4) = mat(1,4)+(g2**2*k1*vL*Conjg(ZZ(2,3))*RXiZR*ZZ(3,3))/8._dp
mat(2,2) = 0._dp 
mat(2,2) = mat(2,2)-(k1**2*LAM1)
mat(2,2) = mat(2,2)-(k2**2*LAM1)
mat(2,2) = mat(2,2)-(k2**2*LAM2)
mat(2,2) = mat(2,2)+2*k1**2*LAM4
mat(2,2) = mat(2,2)+2*k1**2*LAM6
mat(2,2) = mat(2,2)+MU12
mat(2,2) = mat(2,2)-1._dp/2._dp*(ALP1*vL**2)
mat(2,2) = mat(2,2)-1._dp/2._dp*(ALP2*vL**2)
mat(2,2) = mat(2,2)-1._dp/2._dp*(ALP1*vR**2)
mat(2,2) = mat(2,2)-1._dp/2._dp*(ALP2*vR**2)
mat(2,2) = mat(2,2)+(g2**2*k2**2*Conjg(ZZ(2,2))*RXiZ*ZZ(2,2))/4._dp
mat(2,2) = mat(2,2)-1._dp/4._dp*(g2**2*k2**2*Conjg(ZZ(3,2))*RXiZ*ZZ(2,2))
mat(2,2) = mat(2,2)+(g2**2*k2**2*Conjg(ZZ(2,3))*RXiZR*ZZ(2,3))/4._dp
mat(2,2) = mat(2,2)-1._dp/4._dp*(g2**2*k2**2*Conjg(ZZ(3,3))*RXiZR*ZZ(2,3))
mat(2,2) = mat(2,2)-1._dp/4._dp*(g2**2*k2**2*Conjg(ZZ(2,2))*RXiZ*ZZ(3,2))
mat(2,2) = mat(2,2)+(g2**2*k2**2*Conjg(ZZ(3,2))*RXiZ*ZZ(3,2))/4._dp
mat(2,2) = mat(2,2)-1._dp/4._dp*(g2**2*k2**2*Conjg(ZZ(2,3))*RXiZR*ZZ(3,3))
mat(2,2) = mat(2,2)+(g2**2*k2**2*Conjg(ZZ(3,3))*RXiZR*ZZ(3,3))/4._dp
mat(2,3) = 0._dp 
mat(2,3) = mat(2,3)-1._dp/4._dp*(g2*gBL*k2*vR*Conjg(ZZ(2,2))*RXiZ*ZZ(1,2))
mat(2,3) = mat(2,3)+(g2*gBL*k2*vR*Conjg(ZZ(3,2))*RXiZ*ZZ(1,2))/4._dp
mat(2,3) = mat(2,3)-1._dp/4._dp*(g2*gBL*k2*vR*Conjg(ZZ(2,3))*RXiZR*ZZ(1,3))
mat(2,3) = mat(2,3)+(g2*gBL*k2*vR*Conjg(ZZ(3,3))*RXiZR*ZZ(1,3))/4._dp
mat(2,3) = mat(2,3)-1._dp/4._dp*(g2*gBL*k2*vR*Conjg(ZZ(1,2))*RXiZ*ZZ(2,2))
mat(2,3) = mat(2,3)+(g2**2*k2*vR*Conjg(ZZ(3,2))*RXiZ*ZZ(2,2))/8._dp
mat(2,3) = mat(2,3)-1._dp/4._dp*(g2*gBL*k2*vR*Conjg(ZZ(1,3))*RXiZR*ZZ(2,3))
mat(2,3) = mat(2,3)+(g2**2*k2*vR*Conjg(ZZ(3,3))*RXiZR*ZZ(2,3))/8._dp
mat(2,3) = mat(2,3)+(g2*gBL*k2*vR*Conjg(ZZ(1,2))*RXiZ*ZZ(3,2))/4._dp
mat(2,3) = mat(2,3)+(g2**2*k2*vR*Conjg(ZZ(2,2))*RXiZ*ZZ(3,2))/8._dp
mat(2,3) = mat(2,3)-1._dp/4._dp*(g2**2*k2*vR*Conjg(ZZ(3,2))*RXiZ*ZZ(3,2))
mat(2,3) = mat(2,3)+(g2*gBL*k2*vR*Conjg(ZZ(1,3))*RXiZR*ZZ(3,3))/4._dp
mat(2,3) = mat(2,3)+(g2**2*k2*vR*Conjg(ZZ(2,3))*RXiZR*ZZ(3,3))/8._dp
mat(2,3) = mat(2,3)-1._dp/4._dp*(g2**2*k2*vR*Conjg(ZZ(3,3))*RXiZR*ZZ(3,3))
mat(2,4) = 0._dp 
mat(2,4) = mat(2,4)-1._dp/4._dp*(g2*gBL*k2*vL*Conjg(ZZ(2,2))*RXiZ*ZZ(1,2))
mat(2,4) = mat(2,4)+(g2*gBL*k2*vL*Conjg(ZZ(3,2))*RXiZ*ZZ(1,2))/4._dp
mat(2,4) = mat(2,4)-1._dp/4._dp*(g2*gBL*k2*vL*Conjg(ZZ(2,3))*RXiZR*ZZ(1,3))
mat(2,4) = mat(2,4)+(g2*gBL*k2*vL*Conjg(ZZ(3,3))*RXiZR*ZZ(1,3))/4._dp
mat(2,4) = mat(2,4)-1._dp/4._dp*(g2*gBL*k2*vL*Conjg(ZZ(1,2))*RXiZ*ZZ(2,2))
mat(2,4) = mat(2,4)+(g2**2*k2*vL*Conjg(ZZ(2,2))*RXiZ*ZZ(2,2))/4._dp
mat(2,4) = mat(2,4)-1._dp/8._dp*(g2**2*k2*vL*Conjg(ZZ(3,2))*RXiZ*ZZ(2,2))
mat(2,4) = mat(2,4)-1._dp/4._dp*(g2*gBL*k2*vL*Conjg(ZZ(1,3))*RXiZR*ZZ(2,3))
mat(2,4) = mat(2,4)+(g2**2*k2*vL*Conjg(ZZ(2,3))*RXiZR*ZZ(2,3))/4._dp
mat(2,4) = mat(2,4)-1._dp/8._dp*(g2**2*k2*vL*Conjg(ZZ(3,3))*RXiZR*ZZ(2,3))
mat(2,4) = mat(2,4)+(g2*gBL*k2*vL*Conjg(ZZ(1,2))*RXiZ*ZZ(3,2))/4._dp
mat(2,4) = mat(2,4)-1._dp/8._dp*(g2**2*k2*vL*Conjg(ZZ(2,2))*RXiZ*ZZ(3,2))
mat(2,4) = mat(2,4)+(g2*gBL*k2*vL*Conjg(ZZ(1,3))*RXiZR*ZZ(3,3))/4._dp
mat(2,4) = mat(2,4)-1._dp/8._dp*(g2**2*k2*vL*Conjg(ZZ(2,3))*RXiZR*ZZ(3,3))
mat(3,3) = 0._dp 
mat(3,3) = mat(3,3)-1._dp/2._dp*(ALP1*k1**2)
mat(3,3) = mat(3,3)-1._dp/2._dp*(ALP1*k2**2)
mat(3,3) = mat(3,3)-1._dp/2._dp*(ALP2*k2**2)
mat(3,3) = mat(3,3)+MU22
mat(3,3) = mat(3,3)-1._dp/2._dp*(RHO2*vL**2)
mat(3,3) = mat(3,3)-(RHO1*vR**2)
mat(3,3) = mat(3,3)+gBL**2*vR**2*Conjg(ZZ(1,2))*RXiZ*ZZ(1,2)
mat(3,3) = mat(3,3)-1._dp/2._dp*(g2*gBL*vR**2*Conjg(ZZ(3,2))*RXiZ*ZZ(1,2))
mat(3,3) = mat(3,3)+gBL**2*vR**2*Conjg(ZZ(1,3))*RXiZR*ZZ(1,3)
mat(3,3) = mat(3,3)-1._dp/2._dp*(g2*gBL*vR**2*Conjg(ZZ(3,3))*RXiZR*ZZ(1,3))
mat(3,3) = mat(3,3)-1._dp/2._dp*(g2*gBL*vR**2*Conjg(ZZ(1,2))*RXiZ*ZZ(3,2))
mat(3,3) = mat(3,3)+(g2**2*vR**2*Conjg(ZZ(3,2))*RXiZ*ZZ(3,2))/4._dp
mat(3,3) = mat(3,3)-1._dp/2._dp*(g2*gBL*vR**2*Conjg(ZZ(1,3))*RXiZR*ZZ(3,3))
mat(3,3) = mat(3,3)+(g2**2*vR**2*Conjg(ZZ(3,3))*RXiZR*ZZ(3,3))/4._dp
mat(3,4) = 0._dp 
mat(3,4) = mat(3,4)+gBL**2*vL*vR*Conjg(ZZ(1,2))*RXiZ*ZZ(1,2)
mat(3,4) = mat(3,4)-1._dp/4._dp*(g2*gBL*vL*vR*Conjg(ZZ(2,2))*RXiZ*ZZ(1,2))
mat(3,4) = mat(3,4)-1._dp/4._dp*(g2*gBL*vL*vR*Conjg(ZZ(3,2))*RXiZ*ZZ(1,2))
mat(3,4) = mat(3,4)+gBL**2*vL*vR*Conjg(ZZ(1,3))*RXiZR*ZZ(1,3)
mat(3,4) = mat(3,4)-1._dp/4._dp*(g2*gBL*vL*vR*Conjg(ZZ(2,3))*RXiZR*ZZ(1,3))
mat(3,4) = mat(3,4)-1._dp/4._dp*(g2*gBL*vL*vR*Conjg(ZZ(3,3))*RXiZR*ZZ(1,3))
mat(3,4) = mat(3,4)-1._dp/4._dp*(g2*gBL*vL*vR*Conjg(ZZ(1,2))*RXiZ*ZZ(2,2))
mat(3,4) = mat(3,4)+(g2**2*vL*vR*Conjg(ZZ(3,2))*RXiZ*ZZ(2,2))/8._dp
mat(3,4) = mat(3,4)-1._dp/4._dp*(g2*gBL*vL*vR*Conjg(ZZ(1,3))*RXiZR*ZZ(2,3))
mat(3,4) = mat(3,4)+(g2**2*vL*vR*Conjg(ZZ(3,3))*RXiZR*ZZ(2,3))/8._dp
mat(3,4) = mat(3,4)-1._dp/4._dp*(g2*gBL*vL*vR*Conjg(ZZ(1,2))*RXiZ*ZZ(3,2))
mat(3,4) = mat(3,4)+(g2**2*vL*vR*Conjg(ZZ(2,2))*RXiZ*ZZ(3,2))/8._dp
mat(3,4) = mat(3,4)-1._dp/4._dp*(g2*gBL*vL*vR*Conjg(ZZ(1,3))*RXiZR*ZZ(3,3))
mat(3,4) = mat(3,4)+(g2**2*vL*vR*Conjg(ZZ(2,3))*RXiZR*ZZ(3,3))/8._dp
mat(4,4) = 0._dp 
mat(4,4) = mat(4,4)-1._dp/2._dp*(ALP1*k1**2)
mat(4,4) = mat(4,4)-1._dp/2._dp*(ALP1*k2**2)
mat(4,4) = mat(4,4)-1._dp/2._dp*(ALP2*k2**2)
mat(4,4) = mat(4,4)+MU22
mat(4,4) = mat(4,4)-(RHO1*vL**2)
mat(4,4) = mat(4,4)-1._dp/2._dp*(RHO2*vR**2)
mat(4,4) = mat(4,4)+gBL**2*vL**2*Conjg(ZZ(1,2))*RXiZ*ZZ(1,2)
mat(4,4) = mat(4,4)-1._dp/2._dp*(g2*gBL*vL**2*Conjg(ZZ(2,2))*RXiZ*ZZ(1,2))
mat(4,4) = mat(4,4)+gBL**2*vL**2*Conjg(ZZ(1,3))*RXiZR*ZZ(1,3)
mat(4,4) = mat(4,4)-1._dp/2._dp*(g2*gBL*vL**2*Conjg(ZZ(2,3))*RXiZR*ZZ(1,3))
mat(4,4) = mat(4,4)-1._dp/2._dp*(g2*gBL*vL**2*Conjg(ZZ(1,2))*RXiZ*ZZ(2,2))
mat(4,4) = mat(4,4)+(g2**2*vL**2*Conjg(ZZ(2,2))*RXiZ*ZZ(2,2))/4._dp
mat(4,4) = mat(4,4)-1._dp/2._dp*(g2*gBL*vL**2*Conjg(ZZ(1,3))*RXiZR*ZZ(2,3))
mat(4,4) = mat(4,4)+(g2**2*vL**2*Conjg(ZZ(2,3))*RXiZR*ZZ(2,3))/4._dp

 
 Do i1=2,4
  Do i2 = 1, i1-1 
  mat(i1,i2) = mat(i2,i1) 
  End do 
End do 

 
Call EigenSystem(mat,MAh2,UP,ierr,test) 
 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Then 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
    Call TerminateProgram 
  End If 
  ierr = 0 
End If 
 
If ((ierr.Ne.0.).And.(ErrorLevel.Ge.-1)) Then 
  Write(10,*) 'Warning from Subroutine '//NameOfUnit(Iname) 
  Write(10,*) 'Diagonalization failed, ierr : ',ierr 
  kont = ierr 
  Iname = Iname - 1 
  Return 
End If 


Do i1=1,4
  If (Abs(MAh2(i1)).Le.MaxMassNumericalZero) MAh2(i1) = 1.E-10_dp 
  If (MAh2(i1).ne.MAh2(i1)) Then 
      Write(*,*) 'NaN appearing in '//NameOfUnit(Iname) 
      Call TerminateProgram 
    End If 
  If (MAh2(i1).Ge.0._dp) Then 
  MAh(i1)=Sqrt(MAh2(i1) ) 
  Else 
    If (ErrorLevel.Ge.0) Then 
      Write(10,*) 'Warning from Subroutine '//NameOfUnit(Iname) 
      Write(10,*) 'a mass squarred is negative: ',i1,MAh2(i1) 
    End If 
  MAh(i1) = 1._dp 
     Write(ErrCan,*) 'Warning from routine '//NameOfUnit(Iname) 
     Write(ErrCan,*) 'in the calculation of the masses' 
     Write(ErrCan,*) 'occurred a negative mass squared!' 
     Write(ErrCan,*) i1,MAh2(i1) 
     Write(*,*) 'Warning from routine '//NameOfUnit(Iname) 
     Write(*,*) 'in the calculation of the masses' 
     Write(*,*) 'occurred a negative mass squared!' 
     Write(*,*) i1,MAh2(i1) 
  MAh2(i1) = 1._dp 
   SignOfMassChanged = .True. 
! kont = -104 
 End if 
End Do 
Iname = Iname - 1 
 
End Subroutine CalculateMAh 

Subroutine CalculateMHpm(g2,MU12,MU22,LAM2,LAM1,ALP1,RHO1,RHO2,ALP2,ALP3,             & 
& LAM5,LAM3,LAM4,LAM6,k1,k2,vR,vL,PhiW,UC,MHpm,MHpm2,kont)

Real(dp), Intent(in) :: g2,MU12,MU22,LAM2,LAM1,ALP1,RHO1,RHO2,ALP2,ALP3,LAM5,LAM3,LAM4,LAM6,k1,               & 
& k2,vR,vL,PhiW

Integer, Intent(inout) :: kont 
Integer :: i1,i2,i3,i4, ierr 
Integer :: j1,j2,j3,j4, pos 
Real(dp), Intent(out) :: MHpm(4), MHpm2(4) 
Real(dp), Intent(out) :: UC(4,4) 
 
Real(dp) :: mat(4,4)  

Real(dp) ::  test(2) 

Iname = Iname + 1 
NameOfUnit(Iname) = 'CalculateMHpm'
 
mat(1,1) = 0._dp 
mat(1,1) = mat(1,1)-(k1**2*LAM1)
mat(1,1) = mat(1,1)-(k2**2*LAM1)
mat(1,1) = mat(1,1)-(k1**2*LAM2)
mat(1,1) = mat(1,1)-(k2**2*LAM2)
mat(1,1) = mat(1,1)+(k1**2*LAM5)/2._dp
mat(1,1) = mat(1,1)+MU12
mat(1,1) = mat(1,1)-1._dp/2._dp*(ALP1*vL**2)
mat(1,1) = mat(1,1)-1._dp/2._dp*(ALP1*vR**2)
mat(1,1) = mat(1,1)-1._dp/2._dp*(ALP2*vR**2)
mat(1,1) = mat(1,1)+(g2**2*k2**2*Cos(PhiW)**2*RXiWLm)/4._dp
mat(1,1) = mat(1,1)+(g2**2*k1**2*Cos(PhiW)**2*RXiWRm)/4._dp
mat(1,1) = mat(1,1)-1._dp/2._dp*(g2**2*k1*k2*Cos(PhiW)*RXiWLm*Sin(PhiW))
mat(1,1) = mat(1,1)+(g2**2*k1*k2*Cos(PhiW)*RXiWRm*Sin(PhiW))/2._dp
mat(1,1) = mat(1,1)+(g2**2*k1**2*RXiWLm*Sin(PhiW)**2)/4._dp
mat(1,1) = mat(1,1)+(g2**2*k2**2*RXiWRm*Sin(PhiW)**2)/4._dp
mat(1,2) = 0._dp 
mat(1,2) = mat(1,2)-(k1*k2*LAM2)
mat(1,2) = mat(1,2)+4*k1*k2*LAM3
mat(1,2) = mat(1,2)-(k1*k2*LAM4)
mat(1,2) = mat(1,2)+2*k1*k2*LAM6
mat(1,2) = mat(1,2)-1._dp/4._dp*(g2**2*k1*k2*Cos(PhiW)**2*RXiWLm)
mat(1,2) = mat(1,2)-1._dp/4._dp*(g2**2*k1*k2*Cos(PhiW)**2*RXiWRm)
mat(1,2) = mat(1,2)+(g2**2*k1**2*Cos(PhiW)*RXiWLm*Sin(PhiW))/4._dp
mat(1,2) = mat(1,2)+(g2**2*k2**2*Cos(PhiW)*RXiWLm*Sin(PhiW))/4._dp
mat(1,2) = mat(1,2)-1._dp/4._dp*(g2**2*k1**2*Cos(PhiW)*RXiWRm*Sin(PhiW))
mat(1,2) = mat(1,2)-1._dp/4._dp*(g2**2*k2**2*Cos(PhiW)*RXiWRm*Sin(PhiW))
mat(1,2) = mat(1,2)-1._dp/4._dp*(g2**2*k1*k2*RXiWLm*Sin(PhiW)**2)
mat(1,2) = mat(1,2)-1._dp/4._dp*(g2**2*k1*k2*RXiWRm*Sin(PhiW)**2)
mat(1,3) = 0._dp 
mat(1,3) = mat(1,3)-1._dp/2._dp*(ALP2*k1*vR)
mat(1,3) = mat(1,3)+(ALP3*k1*vR)/2._dp
mat(1,3) = mat(1,3)-1._dp/4._dp*(g2**2*k1*vR*Cos(PhiW)**2*RXiWRm)
mat(1,3) = mat(1,3)+(g2**2*k2*vR*Cos(PhiW)*RXiWLm*Sin(PhiW))/4._dp
mat(1,3) = mat(1,3)-1._dp/4._dp*(g2**2*k2*vR*Cos(PhiW)*RXiWRm*Sin(PhiW))
mat(1,3) = mat(1,3)-1._dp/4._dp*(g2**2*k1*vR*RXiWLm*Sin(PhiW)**2)
mat(1,4) = 0._dp 
mat(1,4) = mat(1,4)-1._dp/2._dp*(ALP2*k2*vL)
mat(1,4) = mat(1,4)+(g2**2*k2*vL*Cos(PhiW)**2*RXiWLm)/4._dp
mat(1,4) = mat(1,4)-1._dp/4._dp*(g2**2*k1*vL*Cos(PhiW)*RXiWLm*Sin(PhiW))
mat(1,4) = mat(1,4)+(g2**2*k1*vL*Cos(PhiW)*RXiWRm*Sin(PhiW))/4._dp
mat(1,4) = mat(1,4)+(g2**2*k2*vL*RXiWRm*Sin(PhiW)**2)/4._dp
mat(2,2) = 0._dp 
mat(2,2) = mat(2,2)-(k1**2*LAM1)
mat(2,2) = mat(2,2)-(k2**2*LAM1)
mat(2,2) = mat(2,2)-(k1**2*LAM2)
mat(2,2) = mat(2,2)-(k2**2*LAM2)
mat(2,2) = mat(2,2)+(k2**2*LAM5)/2._dp
mat(2,2) = mat(2,2)+MU12
mat(2,2) = mat(2,2)-1._dp/2._dp*(ALP1*vL**2)
mat(2,2) = mat(2,2)-1._dp/2._dp*(ALP2*vL**2)
mat(2,2) = mat(2,2)-1._dp/2._dp*(ALP1*vR**2)
mat(2,2) = mat(2,2)-1._dp/2._dp*(ALP3*vR**2)
mat(2,2) = mat(2,2)-1._dp/2._dp*(ALP3*vL**2*epsTensor(1,rig1))
mat(2,2) = mat(2,2)+(g2**2*k1**2*Cos(PhiW)**2*RXiWLm)/4._dp
mat(2,2) = mat(2,2)+(g2**2*k2**2*Cos(PhiW)**2*RXiWRm)/4._dp
mat(2,2) = mat(2,2)-1._dp/2._dp*(g2**2*k1*k2*Cos(PhiW)*RXiWLm*Sin(PhiW))
mat(2,2) = mat(2,2)+(g2**2*k1*k2*Cos(PhiW)*RXiWRm*Sin(PhiW))/2._dp
mat(2,2) = mat(2,2)+(g2**2*k2**2*RXiWLm*Sin(PhiW)**2)/4._dp
mat(2,2) = mat(2,2)+(g2**2*k1**2*RXiWRm*Sin(PhiW)**2)/4._dp
mat(2,3) = 0._dp 
mat(2,3) = mat(2,3)-1._dp/2._dp*(ALP2*k2*vR)
mat(2,3) = mat(2,3)+(g2**2*k2*vR*Cos(PhiW)**2*RXiWRm)/4._dp
mat(2,3) = mat(2,3)-1._dp/4._dp*(g2**2*k1*vR*Cos(PhiW)*RXiWLm*Sin(PhiW))
mat(2,3) = mat(2,3)+(g2**2*k1*vR*Cos(PhiW)*RXiWRm*Sin(PhiW))/4._dp
mat(2,3) = mat(2,3)+(g2**2*k2*vR*RXiWLm*Sin(PhiW)**2)/4._dp
mat(2,4) = 0._dp 
mat(2,4) = mat(2,4)-1._dp/2._dp*(ALP2*k1*vL)
mat(2,4) = mat(2,4)-1._dp/2._dp*(ALP3*k1*vL*epsTensor(1,rig1))
mat(2,4) = mat(2,4)-1._dp/4._dp*(g2**2*k1*vL*Cos(PhiW)**2*RXiWLm)
mat(2,4) = mat(2,4)+(g2**2*k2*vL*Cos(PhiW)*RXiWLm*Sin(PhiW))/4._dp
mat(2,4) = mat(2,4)-1._dp/4._dp*(g2**2*k2*vL*Cos(PhiW)*RXiWRm*Sin(PhiW))
mat(2,4) = mat(2,4)-1._dp/4._dp*(g2**2*k1*vL*RXiWRm*Sin(PhiW)**2)
mat(3,3) = 0._dp 
mat(3,3) = mat(3,3)-1._dp/2._dp*(ALP1*k1**2)
mat(3,3) = mat(3,3)-1._dp/2._dp*(ALP2*k1**2)
mat(3,3) = mat(3,3)-1._dp/2._dp*(ALP1*k2**2)
mat(3,3) = mat(3,3)+MU22
mat(3,3) = mat(3,3)-1._dp/2._dp*(RHO2*vL**2)
mat(3,3) = mat(3,3)-(RHO1*vR**2)
mat(3,3) = mat(3,3)+(g2**2*vR**2*Cos(PhiW)**2*RXiWRm)/4._dp
mat(3,3) = mat(3,3)+(g2**2*vR**2*RXiWLm*Sin(PhiW)**2)/4._dp
mat(3,4) = 0._dp 
mat(3,4) = mat(3,4)+(g2**2*vL*vR*Cos(PhiW)*RXiWLm*Sin(PhiW))/4._dp
mat(3,4) = mat(3,4)-1._dp/4._dp*(g2**2*vL*vR*Cos(PhiW)*RXiWRm*Sin(PhiW))
mat(4,4) = 0._dp 
mat(4,4) = mat(4,4)-1._dp/2._dp*(ALP1*k1**2)
mat(4,4) = mat(4,4)-1._dp/2._dp*(ALP2*k1**2)
mat(4,4) = mat(4,4)-1._dp/2._dp*(ALP1*k2**2)
mat(4,4) = mat(4,4)+MU22
mat(4,4) = mat(4,4)-(RHO1*vL**2)
mat(4,4) = mat(4,4)-1._dp/2._dp*(RHO2*vR**2)
mat(4,4) = mat(4,4)+(g2**2*vL**2*Cos(PhiW)**2*RXiWLm)/4._dp
mat(4,4) = mat(4,4)+(g2**2*vL**2*RXiWRm*Sin(PhiW)**2)/4._dp

 
 Do i1=2,4
  Do i2 = 1, i1-1 
  mat(i1,i2) = mat(i2,i1) 
  End do 
End do 

 
Call EigenSystem(mat,MHpm2,UC,ierr,test) 
 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Then 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
    Call TerminateProgram 
  End If 
  ierr = 0 
End If 
 
If ((ierr.Ne.0.).And.(ErrorLevel.Ge.-1)) Then 
  Write(10,*) 'Warning from Subroutine '//NameOfUnit(Iname) 
  Write(10,*) 'Diagonalization failed, ierr : ',ierr 
  kont = ierr 
  Iname = Iname - 1 
  Return 
End If 


Do i1=1,4
  If (Abs(MHpm2(i1)).Le.MaxMassNumericalZero) MHpm2(i1) = 1.E-10_dp 
  If (MHpm2(i1).ne.MHpm2(i1)) Then 
      Write(*,*) 'NaN appearing in '//NameOfUnit(Iname) 
      Call TerminateProgram 
    End If 
  If (MHpm2(i1).Ge.0._dp) Then 
  MHpm(i1)=Sqrt(MHpm2(i1) ) 
  Else 
    If (ErrorLevel.Ge.0) Then 
      Write(10,*) 'Warning from Subroutine '//NameOfUnit(Iname) 
      Write(10,*) 'a mass squarred is negative: ',i1,MHpm2(i1) 
    End If 
  MHpm(i1) = 1._dp 
     Write(ErrCan,*) 'Warning from routine '//NameOfUnit(Iname) 
     Write(ErrCan,*) 'in the calculation of the masses' 
     Write(ErrCan,*) 'occurred a negative mass squared!' 
     Write(ErrCan,*) i1,MHpm2(i1) 
     Write(*,*) 'Warning from routine '//NameOfUnit(Iname) 
     Write(*,*) 'in the calculation of the masses' 
     Write(*,*) 'occurred a negative mass squared!' 
     Write(*,*) i1,MHpm2(i1) 
  MHpm2(i1) = 1._dp 
   SignOfMassChanged = .True. 
! kont = -104 
 End if 
End Do 
Iname = Iname - 1 
 
End Subroutine CalculateMHpm 

Subroutine CalculateMFd(YQ1,YQ2,k1,k2,ZDL,ZDR,MFd,kont)

Real(dp),Intent(in) :: k1,k2

Complex(dp),Intent(in) :: YQ1(3,3),YQ2(3,3)

Integer, Intent(inout) :: kont 
Integer :: i1,i2,i3,i4, ierr 
Integer :: j1,j2,j3,j4 
Real(dp), Intent(out) :: MFd(3) 
 Complex(dp), Intent(out) :: ZDL(3,3), ZDR(3,3) 
 
 Complex(dp) :: mat(3,3)=0._dp, mat2(3,3)=0._dp, phaseM 

Complex(dp) :: ZDL2(3,3), ZDR2(3,3) 
 
 Real(dp) :: ZDL1(3,3), ZDR1(3,3), test(2), MFd2(3) 
 
 Iname = Iname + 1 
NameOfUnit(Iname) = 'CalculateMFd'
 
MFd = 0._dp 
ZDL = 0._dp 
ZDR = 0._dp 
mat(1,1) = 0._dp 
mat(1,1) = mat(1,1)+(k2*Conjg(YQ1(1,1)))/sqrt(2._dp)
mat(1,1) = mat(1,1)+(k1*Conjg(YQ2(1,1)))/sqrt(2._dp)
mat(1,2) = 0._dp 
mat(1,2) = mat(1,2)+(k2*Conjg(YQ1(1,2)))/sqrt(2._dp)
mat(1,2) = mat(1,2)+(k1*Conjg(YQ2(1,2)))/sqrt(2._dp)
mat(1,3) = 0._dp 
mat(1,3) = mat(1,3)+(k2*Conjg(YQ1(1,3)))/sqrt(2._dp)
mat(1,3) = mat(1,3)+(k1*Conjg(YQ2(1,3)))/sqrt(2._dp)
mat(2,1) = 0._dp 
mat(2,1) = mat(2,1)+(k2*Conjg(YQ1(2,1)))/sqrt(2._dp)
mat(2,1) = mat(2,1)+(k1*Conjg(YQ2(2,1)))/sqrt(2._dp)
mat(2,2) = 0._dp 
mat(2,2) = mat(2,2)+(k2*Conjg(YQ1(2,2)))/sqrt(2._dp)
mat(2,2) = mat(2,2)+(k1*Conjg(YQ2(2,2)))/sqrt(2._dp)
mat(2,3) = 0._dp 
mat(2,3) = mat(2,3)+(k2*Conjg(YQ1(2,3)))/sqrt(2._dp)
mat(2,3) = mat(2,3)+(k1*Conjg(YQ2(2,3)))/sqrt(2._dp)
mat(3,1) = 0._dp 
mat(3,1) = mat(3,1)+(k2*Conjg(YQ1(3,1)))/sqrt(2._dp)
mat(3,1) = mat(3,1)+(k1*Conjg(YQ2(3,1)))/sqrt(2._dp)
mat(3,2) = 0._dp 
mat(3,2) = mat(3,2)+(k2*Conjg(YQ1(3,2)))/sqrt(2._dp)
mat(3,2) = mat(3,2)+(k1*Conjg(YQ2(3,2)))/sqrt(2._dp)
mat(3,3) = 0._dp 
mat(3,3) = mat(3,3)+(k2*Conjg(YQ1(3,3)))/sqrt(2._dp)
mat(3,3) = mat(3,3)+(k1*Conjg(YQ2(3,3)))/sqrt(2._dp)

 
mat2 = Matmul(Transpose(Conjg(mat)),mat) 
If (Maxval(Abs(Aimag(mat2))).Eq.0._dp) Then 
Call EigenSystem(Real(mat2,dp),MFd2,ZDR1,ierr,test) 
ZDR2 = ZDR1 
Else 
Call EigenSystem(mat2,MFd2,ZDR2,ierr,test) 
 End If 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Then 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
    Call TerminateProgram 
  End If 
  ierr = 0 
End If 
 
mat2 = Matmul(mat,Transpose(Conjg(mat))) 
If (Maxval(Abs(Aimag(mat2))).Eq.0._dp) Then 
Call EigenSystem (Real(mat2,dp),MFd2,ZDL1,ierr,test) 
                  
                  
ZDL2 = ZDL1 
Else 
Call EigenSystem(mat2,MFd2,ZDL2,ierr,test) 
 
 
End If 
ZDL2 = Conjg(ZDL2) 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Then 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
    Call TerminateProgram 
  End If 
  ierr = 0 
End If 
 
mat2 = Matmul(Matmul( Conjg(ZDL2),mat),Transpose( Conjg(ZDR2))) 
Do i1=1,3
If (Abs(mat2(i1,i1)).gt.0._dp) Then 
phaseM = mat2(i1,i1) / Abs(mat2(i1,i1)) 
ZDR2(i1,:) = phaseM *ZDR2(i1,:) 
 End if 
End Do 
 
Do i1=1,3
If (Abs(ZDR2(i1,i1)).gt.0._dp) Then 
phaseM = ZDR2(i1,i1) / Abs(ZDR2(i1,i1)) 
ZDR2(i1,:) = Conjg(phaseM) *ZDR2(i1,:) 
 ZDL2(i1,:) = phaseM *ZDL2(i1,:) 
 End if 
  If (MFd2(i1).ne.MFd2(i1)) Then 
      Write(*,*) 'NaN appearing in '//NameOfUnit(Iname) 
      Call TerminateProgram 
    End If 
  If (Abs(MFd2(i1)).Le.MaxMassNumericalZero) MFd2(i1) = Abs(MFd2(i1))+1.E-10_dp 
  If (MFd2(i1).Le.0._dp) Then 
    If (ErrorLevel.Ge.0) Then 
      Write(10,*) 'Warning from Subroutine '//NameOfUnit(Iname) 
      Write(10,*) 'a mass squarred is negative: ',i1,MFd2(i1) 
      Write(*,*) 'Warning from Subroutine '//NameOfUnit(Iname) 
      Write(*,*) 'a mass squarred is negative: ',i1,MFd2(i1) 
      Call TerminateProgram 
    End If 
     Write(ErrCan,*) 'Warning from routine '//NameOfUnit(Iname) 
     Write(ErrCan,*) 'in the calculation of the masses' 
     Write(ErrCan,*) 'occurred a negative mass squared!' 
     Write(ErrCan,*) i1,MFd2(i1) 
     Write(*,*) 'Warning from routine '//NameOfUnit(Iname) 
     Write(*,*) 'in the calculation of the masses' 
     Write(*,*) 'occurred a negative mass squared!' 
     Write(*,*) i1,MFd2(i1) 
  MFd2(i1) = 1._dp 
   SignOfMassChanged = .True. 
! kont = -104 
 End if 
End Do 
 
If (ierr.Ne.0.) Then 
  Write(ErrCan,*) 'Warning from Subroutine CalculateMFd, ierr =',ierr 
  kont = ierr 
  Iname = Iname - 1 
  Return 
End If 


MFd = Sqrt( MFd2 ) 
ZDL = ZDL2 
ZDR = ZDR2 
Iname = Iname - 1 
 
End Subroutine CalculateMFd 

Subroutine CalculateMFu(YQ1,YQ2,k1,k2,ZUL,ZUR,MFu,kont)

Real(dp),Intent(in) :: k1,k2

Complex(dp),Intent(in) :: YQ1(3,3),YQ2(3,3)

Integer, Intent(inout) :: kont 
Integer :: i1,i2,i3,i4, ierr 
Integer :: j1,j2,j3,j4 
Real(dp), Intent(out) :: MFu(3) 
 Complex(dp), Intent(out) :: ZUL(3,3), ZUR(3,3) 
 
 Complex(dp) :: mat(3,3)=0._dp, mat2(3,3)=0._dp, phaseM 

Complex(dp) :: ZUL2(3,3), ZUR2(3,3) 
 
 Real(dp) :: ZUL1(3,3), ZUR1(3,3), test(2), MFu2(3) 
 
 Iname = Iname + 1 
NameOfUnit(Iname) = 'CalculateMFu'
 
MFu = 0._dp 
ZUL = 0._dp 
ZUR = 0._dp 
mat(1,1) = 0._dp 
mat(1,1) = mat(1,1)+(k1*Conjg(YQ1(1,1)))/sqrt(2._dp)
mat(1,1) = mat(1,1)+(k2*Conjg(YQ2(1,1)))/sqrt(2._dp)
mat(1,2) = 0._dp 
mat(1,2) = mat(1,2)+(k1*Conjg(YQ1(1,2)))/sqrt(2._dp)
mat(1,2) = mat(1,2)+(k2*Conjg(YQ2(1,2)))/sqrt(2._dp)
mat(1,3) = 0._dp 
mat(1,3) = mat(1,3)+(k1*Conjg(YQ1(1,3)))/sqrt(2._dp)
mat(1,3) = mat(1,3)+(k2*Conjg(YQ2(1,3)))/sqrt(2._dp)
mat(2,1) = 0._dp 
mat(2,1) = mat(2,1)+(k1*Conjg(YQ1(2,1)))/sqrt(2._dp)
mat(2,1) = mat(2,1)+(k2*Conjg(YQ2(2,1)))/sqrt(2._dp)
mat(2,2) = 0._dp 
mat(2,2) = mat(2,2)+(k1*Conjg(YQ1(2,2)))/sqrt(2._dp)
mat(2,2) = mat(2,2)+(k2*Conjg(YQ2(2,2)))/sqrt(2._dp)
mat(2,3) = 0._dp 
mat(2,3) = mat(2,3)+(k1*Conjg(YQ1(2,3)))/sqrt(2._dp)
mat(2,3) = mat(2,3)+(k2*Conjg(YQ2(2,3)))/sqrt(2._dp)
mat(3,1) = 0._dp 
mat(3,1) = mat(3,1)+(k1*Conjg(YQ1(3,1)))/sqrt(2._dp)
mat(3,1) = mat(3,1)+(k2*Conjg(YQ2(3,1)))/sqrt(2._dp)
mat(3,2) = 0._dp 
mat(3,2) = mat(3,2)+(k1*Conjg(YQ1(3,2)))/sqrt(2._dp)
mat(3,2) = mat(3,2)+(k2*Conjg(YQ2(3,2)))/sqrt(2._dp)
mat(3,3) = 0._dp 
mat(3,3) = mat(3,3)+(k1*Conjg(YQ1(3,3)))/sqrt(2._dp)
mat(3,3) = mat(3,3)+(k2*Conjg(YQ2(3,3)))/sqrt(2._dp)

 
mat2 = Matmul(Transpose(Conjg(mat)),mat) 
If (Maxval(Abs(Aimag(mat2))).Eq.0._dp) Then 
Call EigenSystem(Real(mat2,dp),MFu2,ZUR1,ierr,test) 
ZUR2 = ZUR1 
Else 
Call EigenSystem(mat2,MFu2,ZUR2,ierr,test) 
 End If 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Then 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
    Call TerminateProgram 
  End If 
  ierr = 0 
End If 
 
mat2 = Matmul(mat,Transpose(Conjg(mat))) 
If (Maxval(Abs(Aimag(mat2))).Eq.0._dp) Then 
Call EigenSystem (Real(mat2,dp),MFu2,ZUL1,ierr,test) 
                  
                  
ZUL2 = ZUL1 
Else 
Call EigenSystem(mat2,MFu2,ZUL2,ierr,test) 
 
 
End If 
ZUL2 = Conjg(ZUL2) 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Then 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
    Call TerminateProgram 
  End If 
  ierr = 0 
End If 
 
mat2 = Matmul(Matmul( Conjg(ZUL2),mat),Transpose( Conjg(ZUR2))) 
Do i1=1,3
If (Abs(mat2(i1,i1)).gt.0._dp) Then 
phaseM = mat2(i1,i1) / Abs(mat2(i1,i1)) 
ZUR2(i1,:) = phaseM *ZUR2(i1,:) 
 End if 
End Do 
 
Do i1=1,3
If (Abs(ZUR2(i1,i1)).gt.0._dp) Then 
phaseM = ZUR2(i1,i1) / Abs(ZUR2(i1,i1)) 
ZUR2(i1,:) = Conjg(phaseM) *ZUR2(i1,:) 
 ZUL2(i1,:) = phaseM *ZUL2(i1,:) 
 End if 
  If (MFu2(i1).ne.MFu2(i1)) Then 
      Write(*,*) 'NaN appearing in '//NameOfUnit(Iname) 
      Call TerminateProgram 
    End If 
  If (Abs(MFu2(i1)).Le.MaxMassNumericalZero) MFu2(i1) = Abs(MFu2(i1))+1.E-10_dp 
  If (MFu2(i1).Le.0._dp) Then 
    If (ErrorLevel.Ge.0) Then 
      Write(10,*) 'Warning from Subroutine '//NameOfUnit(Iname) 
      Write(10,*) 'a mass squarred is negative: ',i1,MFu2(i1) 
      Write(*,*) 'Warning from Subroutine '//NameOfUnit(Iname) 
      Write(*,*) 'a mass squarred is negative: ',i1,MFu2(i1) 
      Call TerminateProgram 
    End If 
     Write(ErrCan,*) 'Warning from routine '//NameOfUnit(Iname) 
     Write(ErrCan,*) 'in the calculation of the masses' 
     Write(ErrCan,*) 'occurred a negative mass squared!' 
     Write(ErrCan,*) i1,MFu2(i1) 
     Write(*,*) 'Warning from routine '//NameOfUnit(Iname) 
     Write(*,*) 'in the calculation of the masses' 
     Write(*,*) 'occurred a negative mass squared!' 
     Write(*,*) i1,MFu2(i1) 
  MFu2(i1) = 1._dp 
   SignOfMassChanged = .True. 
! kont = -104 
 End if 
End Do 
 
If (ierr.Ne.0.) Then 
  Write(ErrCan,*) 'Warning from Subroutine CalculateMFu, ierr =',ierr 
  kont = ierr 
  Iname = Iname - 1 
  Return 
End If 


MFu = Sqrt( MFu2 ) 
ZUL = ZUL2 
ZUR = ZUR2 
Iname = Iname - 1 
 
End Subroutine CalculateMFu 

Subroutine CalculateMFe(Y,Yt,k1,k2,ZEL,ZER,MFe,kont)

Real(dp),Intent(in) :: k1,k2

Complex(dp),Intent(in) :: Y(3,3),Yt(3,3)

Integer, Intent(inout) :: kont 
Integer :: i1,i2,i3,i4, ierr 
Integer :: j1,j2,j3,j4 
Real(dp), Intent(out) :: MFe(3) 
 Complex(dp), Intent(out) :: ZEL(3,3), ZER(3,3) 
 
 Complex(dp) :: mat(3,3)=0._dp, mat2(3,3)=0._dp, phaseM 

Complex(dp) :: ZEL2(3,3), ZER2(3,3) 
 
 Real(dp) :: ZEL1(3,3), ZER1(3,3), test(2), MFe2(3) 
 
 Iname = Iname + 1 
NameOfUnit(Iname) = 'CalculateMFe'
 
MFe = 0._dp 
ZEL = 0._dp 
ZER = 0._dp 
mat(1,1) = 0._dp 
mat(1,1) = mat(1,1)+(k2*Conjg(Y(1,1)))/sqrt(2._dp)
mat(1,1) = mat(1,1)+(k1*Conjg(Yt(1,1)))/sqrt(2._dp)
mat(1,2) = 0._dp 
mat(1,2) = mat(1,2)+(k2*Conjg(Y(1,2)))/sqrt(2._dp)
mat(1,2) = mat(1,2)+(k1*Conjg(Yt(1,2)))/sqrt(2._dp)
mat(1,3) = 0._dp 
mat(1,3) = mat(1,3)+(k2*Conjg(Y(1,3)))/sqrt(2._dp)
mat(1,3) = mat(1,3)+(k1*Conjg(Yt(1,3)))/sqrt(2._dp)
mat(2,1) = 0._dp 
mat(2,1) = mat(2,1)+(k2*Conjg(Y(2,1)))/sqrt(2._dp)
mat(2,1) = mat(2,1)+(k1*Conjg(Yt(2,1)))/sqrt(2._dp)
mat(2,2) = 0._dp 
mat(2,2) = mat(2,2)+(k2*Conjg(Y(2,2)))/sqrt(2._dp)
mat(2,2) = mat(2,2)+(k1*Conjg(Yt(2,2)))/sqrt(2._dp)
mat(2,3) = 0._dp 
mat(2,3) = mat(2,3)+(k2*Conjg(Y(2,3)))/sqrt(2._dp)
mat(2,3) = mat(2,3)+(k1*Conjg(Yt(2,3)))/sqrt(2._dp)
mat(3,1) = 0._dp 
mat(3,1) = mat(3,1)+(k2*Conjg(Y(3,1)))/sqrt(2._dp)
mat(3,1) = mat(3,1)+(k1*Conjg(Yt(3,1)))/sqrt(2._dp)
mat(3,2) = 0._dp 
mat(3,2) = mat(3,2)+(k2*Conjg(Y(3,2)))/sqrt(2._dp)
mat(3,2) = mat(3,2)+(k1*Conjg(Yt(3,2)))/sqrt(2._dp)
mat(3,3) = 0._dp 
mat(3,3) = mat(3,3)+(k2*Conjg(Y(3,3)))/sqrt(2._dp)
mat(3,3) = mat(3,3)+(k1*Conjg(Yt(3,3)))/sqrt(2._dp)

 
mat2 = Matmul(Transpose(Conjg(mat)),mat) 
If (Maxval(Abs(Aimag(mat2))).Eq.0._dp) Then 
Call EigenSystem(Real(mat2,dp),MFe2,ZER1,ierr,test) 
ZER2 = ZER1 
Else 
Call EigenSystem(mat2,MFe2,ZER2,ierr,test) 
 End If 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Then 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
    Call TerminateProgram 
  End If 
  ierr = 0 
End If 
 
mat2 = Matmul(mat,Transpose(Conjg(mat))) 
If (Maxval(Abs(Aimag(mat2))).Eq.0._dp) Then 
Call EigenSystem (Real(mat2,dp),MFe2,ZEL1,ierr,test) 
                  
                  
ZEL2 = ZEL1 
Else 
Call EigenSystem(mat2,MFe2,ZEL2,ierr,test) 
 
 
End If 
ZEL2 = Conjg(ZEL2) 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Then 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
    Call TerminateProgram 
  End If 
  ierr = 0 
End If 
 
mat2 = Matmul(Matmul( Conjg(ZEL2),mat),Transpose( Conjg(ZER2))) 
Do i1=1,3
If (Abs(mat2(i1,i1)).gt.0._dp) Then 
phaseM = mat2(i1,i1) / Abs(mat2(i1,i1)) 
ZER2(i1,:) = phaseM *ZER2(i1,:) 
 End if 
End Do 
 
Do i1=1,3
If (Abs(ZER2(i1,i1)).gt.0._dp) Then 
phaseM = ZER2(i1,i1) / Abs(ZER2(i1,i1)) 
ZER2(i1,:) = Conjg(phaseM) *ZER2(i1,:) 
 ZEL2(i1,:) = phaseM *ZEL2(i1,:) 
 End if 
  If (MFe2(i1).ne.MFe2(i1)) Then 
      Write(*,*) 'NaN appearing in '//NameOfUnit(Iname) 
      Call TerminateProgram 
    End If 
  If (Abs(MFe2(i1)).Le.MaxMassNumericalZero) MFe2(i1) = Abs(MFe2(i1))+1.E-10_dp 
  If (MFe2(i1).Le.0._dp) Then 
    If (ErrorLevel.Ge.0) Then 
      Write(10,*) 'Warning from Subroutine '//NameOfUnit(Iname) 
      Write(10,*) 'a mass squarred is negative: ',i1,MFe2(i1) 
      Write(*,*) 'Warning from Subroutine '//NameOfUnit(Iname) 
      Write(*,*) 'a mass squarred is negative: ',i1,MFe2(i1) 
      Call TerminateProgram 
    End If 
     Write(ErrCan,*) 'Warning from routine '//NameOfUnit(Iname) 
     Write(ErrCan,*) 'in the calculation of the masses' 
     Write(ErrCan,*) 'occurred a negative mass squared!' 
     Write(ErrCan,*) i1,MFe2(i1) 
     Write(*,*) 'Warning from routine '//NameOfUnit(Iname) 
     Write(*,*) 'in the calculation of the masses' 
     Write(*,*) 'occurred a negative mass squared!' 
     Write(*,*) i1,MFe2(i1) 
  MFe2(i1) = 1._dp 
   SignOfMassChanged = .True. 
! kont = -104 
 End if 
End Do 
 
If (ierr.Ne.0.) Then 
  Write(ErrCan,*) 'Warning from Subroutine CalculateMFe, ierr =',ierr 
  kont = ierr 
  Iname = Iname - 1 
  Return 
End If 


MFe = Sqrt( MFe2 ) 
ZEL = ZEL2 
ZER = ZER2 
Iname = Iname - 1 
 
End Subroutine CalculateMFe 

Subroutine CalculateMFv(Y,Yt,k1,k2,ZM,MFv,kont)

Real(dp) ,Intent(in) :: k1,k2

Complex(dp) ,Intent(in) :: Y(3,3),Yt(3,3)

Integer, Intent(inout) :: kont 
Integer :: i1,i2,i3,i4, ierr, pos 
Integer :: j1,j2,j3,j4 
Logical :: SecondDiagonalisationNeeded 
Real(dp), Intent(out) :: MFv(9) 
Complex(dp), Intent(out) ::  ZM(9,9) 
                              
Complex(dp) :: mat(9,9), mat2(9,9), phaseM, E9(9) 

Real(dp) :: ZMa(9,9), test(2), eig(9) 

Iname = Iname + 1 
NameOfUnit(Iname) = 'CalculateMFv'
 
mat(1,1) = 0._dp 
mat(1,2) = 0._dp 
mat(1,3) = 0._dp 
mat(1,4) = 0._dp 
mat(1,4) = mat(1,4)+(k1*Conjg(Y(1,1)))/sqrt(2._dp)
mat(1,4) = mat(1,4)+(k2*Conjg(Yt(1,1)))/sqrt(2._dp)
mat(1,5) = 0._dp 
mat(1,5) = mat(1,5)+(k1*Conjg(Y(1,2)))/sqrt(2._dp)
mat(1,5) = mat(1,5)+(k2*Conjg(Yt(1,2)))/sqrt(2._dp)
mat(1,6) = 0._dp 
mat(1,6) = mat(1,6)+(k1*Conjg(Y(1,3)))/sqrt(2._dp)
mat(1,6) = mat(1,6)+(k2*Conjg(Yt(1,3)))/sqrt(2._dp)
mat(1,7) = 0._dp 
mat(1,8) = 0._dp 
mat(1,9) = 0._dp 
mat(2,2) = 0._dp 
mat(2,3) = 0._dp 
mat(2,4) = 0._dp 
mat(2,4) = mat(2,4)+(k1*Conjg(Y(2,1)))/sqrt(2._dp)
mat(2,4) = mat(2,4)+(k2*Conjg(Yt(2,1)))/sqrt(2._dp)
mat(2,5) = 0._dp 
mat(2,5) = mat(2,5)+(k1*Conjg(Y(2,2)))/sqrt(2._dp)
mat(2,5) = mat(2,5)+(k2*Conjg(Yt(2,2)))/sqrt(2._dp)
mat(2,6) = 0._dp 
mat(2,6) = mat(2,6)+(k1*Conjg(Y(2,3)))/sqrt(2._dp)
mat(2,6) = mat(2,6)+(k2*Conjg(Yt(2,3)))/sqrt(2._dp)
mat(2,7) = 0._dp 
mat(2,8) = 0._dp 
mat(2,9) = 0._dp 
mat(3,3) = 0._dp 
mat(3,4) = 0._dp 
mat(3,4) = mat(3,4)+(k1*Conjg(Y(3,1)))/sqrt(2._dp)
mat(3,4) = mat(3,4)+(k2*Conjg(Yt(3,1)))/sqrt(2._dp)
mat(3,5) = 0._dp 
mat(3,5) = mat(3,5)+(k1*Conjg(Y(3,2)))/sqrt(2._dp)
mat(3,5) = mat(3,5)+(k2*Conjg(Yt(3,2)))/sqrt(2._dp)
mat(3,6) = 0._dp 
mat(3,6) = mat(3,6)+(k1*Conjg(Y(3,3)))/sqrt(2._dp)
mat(3,6) = mat(3,6)+(k2*Conjg(Yt(3,3)))/sqrt(2._dp)
mat(3,7) = 0._dp 
mat(3,8) = 0._dp 
mat(3,9) = 0._dp 
mat(4,4) = 0._dp 
mat(4,5) = 0._dp 
mat(4,6) = 0._dp 
mat(4,7) = 0._dp 
mat(4,8) = 0._dp 
mat(4,9) = 0._dp 
mat(5,5) = 0._dp 
mat(5,6) = 0._dp 
mat(5,7) = 0._dp 
mat(5,8) = 0._dp 
mat(5,9) = 0._dp 
mat(6,6) = 0._dp 
mat(6,7) = 0._dp 
mat(6,8) = 0._dp 
mat(6,9) = 0._dp 
mat(7,7) = 0._dp 
mat(7,8) = 0._dp 
mat(7,9) = 0._dp 
mat(8,8) = 0._dp 
mat(8,9) = 0._dp 
mat(9,9) = 0._dp 

 
 Do i1=2,9
  Do i2 = 1, i1-1 
  mat(i1,i2) = mat(i2,i1) 
  End do 
End do 

 
If (Maxval(Abs(Aimag(mat))).Eq.0._dp) Then 
Call EigenSystemQP(Real(mat,dp),Eig,ZMa,ierr,test) 
 
   Do i1=1,9
   If ((Eig(i1).Lt.0._dp).or.(Abs(eig(i1)).lt.1E-15)) Then 
    MFv(i1) = - Eig(i1) 
    ZM(i1,:) = (0._dp,1._dp)*ZMa(i1,:) 
   Else 
    MFv(i1) = Eig(i1) 
    ZM(i1,:) = ZMa(i1,:)
    End If 
   End Do 
 
Do i1=1,8
  Do i2=i1+1,9
    If (MFv(i1).Gt.MFv(i2)) Then 
      Eig(1) = MFv(i1) 
      MFv(i1) = MFv(i2) 
      MFv(i2) =  Eig(1) 
      E9 = ZM(i1,:) 
      ZM(i1,:) = ZM(i2,:) 
      ZM(i2,:) = E9
    End If 
   End Do 
End Do 
 
Else 
 
mat2 = Matmul( Transpose(Conjg( mat) ), mat ) 
Call EigensystemQP(mat2, Eig, ZM, ierr, test) 
mat2 = Matmul( Conjg(ZM), Matmul( mat, Transpose( Conjg(ZM)))) 
! Special efforts are needed for matrices like the Higgsinos one 
SecondDiagonalisationNeeded = .False. 
Do i1=1,9-1
If (MaxVal(Abs(mat2(i1,(i1+1):9))).gt.Abs(mat2(i1,i1))) SecondDiagonalisationNeeded = .True. 

  If (Eig(i1).ne.Eig(i1)) Then 
      Write(*,*) 'NaN appearing in '//NameOfUnit(Iname) 
      Call TerminateProgram 
    End If 
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
     Write(*,*) 'Warning from routine '//NameOfUnit(Iname) 
     Write(*,*) 'in the calculation of the masses' 
     Write(*,*) 'occurred a negative mass squared!' 
     Write(*,*) i1,Eig(i1) 
  Eig(i1) = 1._dp 
   SignOfMassChanged = .True. 
! kont = -104 
 End if 
End do 
If (SecondDiagonalisationNeeded) Then 
Call EigenSystemQP(Real(mat2,dp),Eig,ZMa,ierr,test) 
 
     ZM = MatMul(ZM,ZMa)
  Do i1=1,9
   If ((Eig(i1).Lt.0._dp).or.(Abs(eig(i1)).lt.1E-15)) Then 
    MFv(i1) = - Eig(i1) 
    ZM(i1,:) = (0._dp,1._dp)*ZMa(i1,:) 
   Else 
    MFv(i1) = Eig(i1) 
    ZM(i1,:) = ZMa(i1,:)
    End If 
   End Do 
 
Else 
Do i1=1,9
  If (Eig(i1).ne.Eig(i1)) Then 
      Write(*,*) 'NaN appearing in '//NameOfUnit(Iname) 
      Call TerminateProgram 
    End If 
If (Abs(mat2(i1,i1)).gt.0._dp) Then 
  phaseM = Sqrt( mat2(i1,i1) / Abs(mat2(i1,i1))) 
  ZM(i1,:)= phaseM * ZM(i1,:) 
End if 
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
     Write(*,*) 'Warning from routine '//NameOfUnit(Iname) 
     Write(*,*) 'in the calculation of the masses' 
     Write(*,*) 'occurred a negative mass squared!' 
     Write(*,*) i1,Eig(i1) 
  Eig(i1) = 1._dp 
   SignOfMassChanged = .True. 
! kont = -104 
 End if 
End Do 
MFv = Sqrt( Eig ) 
 
End if ! Second diagonalisation 
End If 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Then 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
    Call TerminateProgram 
  End If 
  ierr = 0 
End If 
 
If (ierr.Ne.0.) Then 
  Write(ErrCan,*) 'Warning from Subroutine CalculateMFv, ierr =',ierr 
  kont = ierr 
  Iname = Iname - 1 
  Return 
End If 


Iname = Iname - 1 
 
End Subroutine CalculateMFv 

Subroutine CalculateVPVZVZR(gBL,g2,k1,k2,vR,vL,ZZ,MVZ,MVZR,MVZ2,MVZR2,kont)

Real(dp), Intent(in) :: gBL,g2,k1,k2,vR,vL

Integer, Intent(inout) :: kont 
Integer :: i1,i2,i3,i4, ierr 
Integer :: j1,j2,j3,j4 
Real(dp), Intent(out) :: MVZ, MVZ2
Real(dp), Intent(out) :: MVZR, MVZR2
Real(dp) :: VPVZVZR2(3),VPVZVZR(3)  

Complex(dp), Intent(out) :: ZZ(3,3) 
 
Complex(dp) :: mat(3,3)  

Real(dp) ::  test(2) 

Iname = Iname + 1 
NameOfUnit(Iname) = 'CalculateVPVZVZR'
 
mat(1,1) = 0._dp 
mat(1,1) = mat(1,1)+gBL**2*vL**2
mat(1,1) = mat(1,1)+gBL**2*vR**2
mat(1,2) = 0._dp 
mat(1,2) = mat(1,2)-1._dp/2._dp*(g2*gBL*vL**2)
mat(1,3) = 0._dp 
mat(1,3) = mat(1,3)-1._dp/2._dp*(g2*gBL*vR**2)
mat(2,2) = 0._dp 
mat(2,2) = mat(2,2)+(g2**2*k1**2)/4._dp
mat(2,2) = mat(2,2)+(g2**2*k2**2)/4._dp
mat(2,2) = mat(2,2)+(g2**2*vL**2)/4._dp
mat(2,3) = 0._dp 
mat(2,3) = mat(2,3)-1._dp/4._dp*(g2**2*k1**2)
mat(2,3) = mat(2,3)-1._dp/4._dp*(g2**2*k2**2)
mat(3,3) = 0._dp 
mat(3,3) = mat(3,3)+(g2**2*k1**2)/4._dp
mat(3,3) = mat(3,3)+(g2**2*k2**2)/4._dp
mat(3,3) = mat(3,3)+(g2**2*vR**2)/4._dp

 
 Do i1=2,3
  Do i2 = 1, i1-1 
  mat(i1,i2) = Conjg(mat(i2,i1)) 
  End do 
End do 

 
Call EigenSystem(mat,VPVZVZR2,ZZ,ierr,test) 
 
 
ZZ = Transpose(ZZ) 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Then 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
    Call TerminateProgram 
  End If 
  ierr = 0 
End If 
 
If ((ierr.Ne.0.).And.(ErrorLevel.Ge.-1)) Then 
  Write(10,*) 'Warning from Subroutine '//NameOfUnit(Iname) 
  Write(10,*) 'Diagonalization failed, ierr : ',ierr 
  kont = ierr 
  Iname = Iname - 1 
  Return 
End If 


Do i1=1,3
  If (Abs(VPVZVZR2(i1)).Le.1.E-10_dp*(Maxval(VPVZVZR2))) VPVZVZR2(i1) = 1.E-10_dp 
  If (VPVZVZR2(i1).ne.VPVZVZR2(i1)) Then 
      Write(*,*) 'NaN appearing in '//NameOfUnit(Iname) 
      Call TerminateProgram 
    End If 
  If (VPVZVZR2(i1).Ge.0._dp) Then 
  VPVZVZR(i1) =Sqrt(VPVZVZR2(i1) ) 
  Else 
    If (ErrorLevel.Ge.0) Then 
      Write(10,*) 'Warning from Subroutine '//NameOfUnit(Iname) 
      Write(10,*) 'a mass squarred is negative: ',i1,VPVZVZR2(i1) 
    End If 
  VPVZVZR(i1)= 1._dp 
  VPVZVZR2(i1)= 1._dp  
     Write(ErrCan,*) 'Warning from routine '//NameOfUnit(Iname) 
     Write(ErrCan,*) 'in the calculation of the masses' 
     Write(ErrCan,*) 'occurred a negative mass squared!' 
     Write(ErrCan,*) i1,VPVZVZR2(i1) 
     Write(*,*) 'Warning from routine '//NameOfUnit(Iname) 
     Write(*,*) 'in the calculation of the masses' 
     Write(*,*) 'occurred a negative mass squared!' 
     Write(*,*) i1,VPVZVZR2(i1) 
  VPVZVZR(i1)= 1._dp 
  VPVZVZR2(i1) = 1._dp  
   SignOfMassChanged = .True. 
! kont = -104 
 End if 
End Do 
 
MVZ = VPVZVZR(2) 
MVZ2 = VPVZVZR2(2) 
MVZR = VPVZVZR(3) 
MVZR2 = VPVZVZR2(3) 

 Iname = Iname - 1 
 
End Subroutine CalculateVPVZVZR 

Subroutine CalculateVWLmVWRm(g2,k1,k2,vR,vL,ZW,MVWLm,MVWRm,MVWLm2,MVWRm2,             & 
& PhiW,kont)

Real(dp), Intent(in) :: g2,k1,k2,vR,vL

Real(dp), Intent(out) :: PhiW

Integer, Intent(inout) :: kont 
Integer :: i1,i2,i3,i4, ierr 
Integer :: j1,j2,j3,j4 
Real(dp), Intent(out) :: MVWLm, MVWLm2
Real(dp), Intent(out) :: MVWRm, MVWRm2
Real(dp) :: VWLmVWRm2(4),VWLmVWRm(4)  

Complex(dp), Intent(out) :: ZW(4,4) 
 
Complex(dp) :: mat(4,4)  

Real(dp) ::  test(2) 

Iname = Iname + 1 
NameOfUnit(Iname) = 'CalculateVWLmVWRm'
 
mat(1,1) = 0._dp 
mat(1,1) = mat(1,1)+(g2**2*k1**2)/4._dp
mat(1,1) = mat(1,1)+(g2**2*k2**2)/4._dp
mat(1,1) = mat(1,1)+(g2**2*vL**2)/4._dp
mat(1,2) = 0._dp 
mat(1,3) = 0._dp 
mat(1,3) = mat(1,3)-1._dp/2._dp*(g2**2*k1*k2)
mat(1,4) = 0._dp 
mat(2,2) = 0._dp 
mat(2,2) = mat(2,2)+(g2**2*k1**2)/4._dp
mat(2,2) = mat(2,2)+(g2**2*k2**2)/4._dp
mat(2,2) = mat(2,2)+(g2**2*vL**2)/4._dp
mat(2,3) = 0._dp 
mat(2,4) = 0._dp 
mat(2,4) = mat(2,4)-1._dp/2._dp*(g2**2*k1*k2)
mat(3,3) = 0._dp 
mat(3,3) = mat(3,3)+(g2**2*k1**2)/4._dp
mat(3,3) = mat(3,3)+(g2**2*k2**2)/4._dp
mat(3,3) = mat(3,3)+(g2**2*vR**2)/4._dp
mat(3,4) = 0._dp 
mat(4,4) = 0._dp 
mat(4,4) = mat(4,4)+(g2**2*k1**2)/4._dp
mat(4,4) = mat(4,4)+(g2**2*k2**2)/4._dp
mat(4,4) = mat(4,4)+(g2**2*vR**2)/4._dp

 
 Do i1=2,4
  Do i2 = 1, i1-1 
  mat(i1,i2) = Conjg(mat(i2,i1)) 
  End do 
End do 

 
Call EigenSystem(mat,VWLmVWRm2,ZW,ierr,test) 
 
 
ZW = Transpose(ZW) 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Then 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
    Call TerminateProgram 
  End If 
  ierr = 0 
End If 
 
If ((ierr.Ne.0.).And.(ErrorLevel.Ge.-1)) Then 
  Write(10,*) 'Warning from Subroutine '//NameOfUnit(Iname) 
  Write(10,*) 'Diagonalization failed, ierr : ',ierr 
  kont = ierr 
  Iname = Iname - 1 
  Return 
End If 


Do i1=1,4
  If (Abs(VWLmVWRm2(i1)).Le.1.E-10_dp*(Maxval(VWLmVWRm2))) VWLmVWRm2(i1) = 1.E-10_dp 
  If (VWLmVWRm2(i1).ne.VWLmVWRm2(i1)) Then 
      Write(*,*) 'NaN appearing in '//NameOfUnit(Iname) 
      Call TerminateProgram 
    End If 
  If (VWLmVWRm2(i1).Ge.0._dp) Then 
  VWLmVWRm(i1) =Sqrt(VWLmVWRm2(i1) ) 
  Else 
    If (ErrorLevel.Ge.0) Then 
      Write(10,*) 'Warning from Subroutine '//NameOfUnit(Iname) 
      Write(10,*) 'a mass squarred is negative: ',i1,VWLmVWRm2(i1) 
    End If 
  VWLmVWRm(i1)= 1._dp 
  VWLmVWRm2(i1)= 1._dp  
     Write(ErrCan,*) 'Warning from routine '//NameOfUnit(Iname) 
     Write(ErrCan,*) 'in the calculation of the masses' 
     Write(ErrCan,*) 'occurred a negative mass squared!' 
     Write(ErrCan,*) i1,VWLmVWRm2(i1) 
     Write(*,*) 'Warning from routine '//NameOfUnit(Iname) 
     Write(*,*) 'in the calculation of the masses' 
     Write(*,*) 'occurred a negative mass squared!' 
     Write(*,*) i1,VWLmVWRm2(i1) 
  VWLmVWRm(i1)= 1._dp 
  VWLmVWRm2(i1) = 1._dp  
   SignOfMassChanged = .True. 
! kont = -104 
 End if 
End Do 
 
MVWLm = VWLmVWRm(1) 
MVWLm2 = VWLmVWRm2(1) 
MVWRm = VWLmVWRm(3) 
MVWRm2 = VWLmVWRm2(3) 
PhiW = ACos(Sqrt(Abs(ZW(1,1))**2 + Abs(ZW(1,2))**2))

 Iname = Iname - 1 
 
End Subroutine CalculateVWLmVWRm 

Subroutine CalculateMhhEffPot(MU12,MU22,LAM2,LAM1,ALP1,RHO1,RHO2,ALP2,LAM3,           & 
& LAM6,k1,k2,vR,vL,ZH,Mhh,Mhh2,kont)

Real(dp), Intent(in) :: MU12,MU22,LAM2,LAM1,ALP1,RHO1,RHO2,ALP2,LAM3,LAM6,k1,k2,vR,vL

Integer, Intent(inout) :: kont 
Integer :: i1,i2,i3,i4, ierr 
Integer :: j1,j2,j3,j4, pos 
Real(dp), Intent(out) :: Mhh(4), Mhh2(4) 
Real(dp), Intent(out) :: ZH(4,4) 
 
Real(dp) :: mat(4,4)  

Real(dp) :: Mhh2temp(4), Q2 
Real(dp) :: ZHtemp(4,4),ZHtemp2(4,4) 
 
Real(dp) ::  test(2) 

Iname = Iname + 1 
NameOfUnit(Iname) = 'CalculateMhh'
 
mat(1,1) = 0._dp 
mat(1,1) = mat(1,1)-3*k1**2*LAM1
mat(1,1) = mat(1,1)-(k2**2*LAM1)
mat(1,1) = mat(1,1)-3*k1**2*LAM2
mat(1,1) = mat(1,1)-4*k2**2*LAM3
mat(1,1) = mat(1,1)-2*k2**2*LAM6
mat(1,1) = mat(1,1)+MU12
mat(1,1) = mat(1,1)-1._dp/2._dp*(ALP1*vL**2)
mat(1,1) = mat(1,1)-1._dp/2._dp*(ALP1*vR**2)
mat(1,2) = 0._dp 
mat(1,2) = mat(1,2)-2*k1*k2*LAM1
mat(1,2) = mat(1,2)-8*k1*k2*LAM3
mat(1,2) = mat(1,2)-4*k1*k2*LAM6
mat(1,3) = 0._dp 
mat(1,3) = mat(1,3)-(ALP1*k1*vR)
mat(1,4) = 0._dp 
mat(1,4) = mat(1,4)-(ALP1*k1*vL)
mat(2,2) = 0._dp 
mat(2,2) = mat(2,2)-(k1**2*LAM1)
mat(2,2) = mat(2,2)-3*k2**2*LAM1
mat(2,2) = mat(2,2)-3*k2**2*LAM2
mat(2,2) = mat(2,2)-4*k1**2*LAM3
mat(2,2) = mat(2,2)-2*k1**2*LAM6
mat(2,2) = mat(2,2)+MU12
mat(2,2) = mat(2,2)-1._dp/2._dp*(ALP1*vL**2)
mat(2,2) = mat(2,2)-1._dp/2._dp*(ALP2*vL**2)
mat(2,2) = mat(2,2)-1._dp/2._dp*(ALP1*vR**2)
mat(2,2) = mat(2,2)-1._dp/2._dp*(ALP2*vR**2)
mat(2,3) = 0._dp 
mat(2,3) = mat(2,3)-(ALP1*k2*vR)
mat(2,3) = mat(2,3)-(ALP2*k2*vR)
mat(2,4) = 0._dp 
mat(2,4) = mat(2,4)-(ALP1*k2*vL)
mat(2,4) = mat(2,4)-(ALP2*k2*vL)
mat(3,3) = 0._dp 
mat(3,3) = mat(3,3)-1._dp/2._dp*(ALP1*k1**2)
mat(3,3) = mat(3,3)-1._dp/2._dp*(ALP1*k2**2)
mat(3,3) = mat(3,3)-1._dp/2._dp*(ALP2*k2**2)
mat(3,3) = mat(3,3)+MU22
mat(3,3) = mat(3,3)-1._dp/2._dp*(RHO2*vL**2)
mat(3,3) = mat(3,3)-3*RHO1*vR**2
mat(3,4) = 0._dp 
mat(3,4) = mat(3,4)-(RHO2*vL*vR)
mat(4,4) = 0._dp 
mat(4,4) = mat(4,4)-1._dp/2._dp*(ALP1*k1**2)
mat(4,4) = mat(4,4)-1._dp/2._dp*(ALP1*k2**2)
mat(4,4) = mat(4,4)-1._dp/2._dp*(ALP2*k2**2)
mat(4,4) = mat(4,4)+MU22
mat(4,4) = mat(4,4)-3*RHO1*vL**2
mat(4,4) = mat(4,4)-1._dp/2._dp*(RHO2*vR**2)

 
 Do i1=2,4
  Do i2 = 1, i1-1 
  mat(i1,i2) = mat(i2,i1) 
  End do 
End do 

 
Call EigenSystem(mat,Mhh2,ZH,ierr,test) 
 
 
! Fix phases
Do i1=1,4
  pos=Maxloc(Abs(ZH(i1,:)),1)
  If (Real(ZH(i1,pos),dp).lt.0._dp) Then
    ZH(i1,:)=-ZH(i1,:)
  End if
End do
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Then 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
    Call TerminateProgram 
  End If 
  ierr = 0 
End If 
 
If ((ierr.Ne.0.).And.(ErrorLevel.Ge.-1)) Then 
  Write(10,*) 'Warning from Subroutine '//NameOfUnit(Iname) 
  Write(10,*) 'Diagonalization failed, ierr : ',ierr 
  kont = ierr 
  Iname = Iname - 1 
  Return 
End If 


Do i1=1,4
  If (Mhh2(i1).ne.Mhh2(i1)) Then 
      Write(*,*) 'NaN appearing in '//NameOfUnit(Iname) 
      Call TerminateProgram 
    End If 
  If (Mhh2(i1).Ge.0._dp) Then 
  Mhh(i1)=Sqrt(Mhh2(i1) ) 
  Else 
  Mhh(i1) = 1._dp 
! kont = -104 
 End if 
End Do 
Iname = Iname - 1 
 
End Subroutine CalculateMhhEffPot 

Subroutine CalculateMAhEffPot(gBL,g2,MU12,MU22,LAM2,LAM1,ALP1,RHO1,RHO2,              & 
& ALP2,LAM3,LAM4,LAM6,k1,k2,vR,vL,ZZ,UP,MAh,MAh2,kont)

Real(dp), Intent(in) :: gBL,g2,MU12,MU22,LAM2,LAM1,ALP1,RHO1,RHO2,ALP2,LAM3,LAM4,LAM6,k1,k2,vR,vL

Complex(dp), Intent(in) :: ZZ(3,3)

Integer, Intent(inout) :: kont 
Integer :: i1,i2,i3,i4, ierr, pos 
Integer :: j1,j2,j3,j4 
Real(dp), Intent(out) :: MAh(4), MAh2(4) 
Real(dp), Intent(out) :: UP(4,4) 
 
Real(dp) :: UPFIX(4,4) 
 
Real(dp) :: mat(4,4)  

Real(dp) ::  test(2), Q2 

Iname = Iname + 1 
NameOfUnit(Iname) = 'CalculateMAh'
 
mat(1,1) = 0._dp 
mat(1,1) = mat(1,1)-(k1**2*LAM1)
mat(1,1) = mat(1,1)-(k2**2*LAM1)
mat(1,1) = mat(1,1)-(k1**2*LAM2)
mat(1,1) = mat(1,1)+2*k2**2*LAM4
mat(1,1) = mat(1,1)+2*k2**2*LAM6
mat(1,1) = mat(1,1)+MU12
mat(1,1) = mat(1,1)-1._dp/2._dp*(ALP1*vL**2)
mat(1,1) = mat(1,1)-1._dp/2._dp*(ALP1*vR**2)
mat(1,2) = 0._dp 
mat(1,2) = mat(1,2)+4*k1*k2*LAM3
mat(1,2) = mat(1,2)+2*k1*k2*LAM4
mat(1,2) = mat(1,2)+4*k1*k2*LAM6
mat(1,3) = 0._dp 
mat(1,4) = 0._dp 
mat(2,2) = 0._dp 
mat(2,2) = mat(2,2)-(k1**2*LAM1)
mat(2,2) = mat(2,2)-(k2**2*LAM1)
mat(2,2) = mat(2,2)-(k2**2*LAM2)
mat(2,2) = mat(2,2)+2*k1**2*LAM4
mat(2,2) = mat(2,2)+2*k1**2*LAM6
mat(2,2) = mat(2,2)+MU12
mat(2,2) = mat(2,2)-1._dp/2._dp*(ALP1*vL**2)
mat(2,2) = mat(2,2)-1._dp/2._dp*(ALP2*vL**2)
mat(2,2) = mat(2,2)-1._dp/2._dp*(ALP1*vR**2)
mat(2,2) = mat(2,2)-1._dp/2._dp*(ALP2*vR**2)
mat(2,3) = 0._dp 
mat(2,4) = 0._dp 
mat(3,3) = 0._dp 
mat(3,3) = mat(3,3)-1._dp/2._dp*(ALP1*k1**2)
mat(3,3) = mat(3,3)-1._dp/2._dp*(ALP1*k2**2)
mat(3,3) = mat(3,3)-1._dp/2._dp*(ALP2*k2**2)
mat(3,3) = mat(3,3)+MU22
mat(3,3) = mat(3,3)-1._dp/2._dp*(RHO2*vL**2)
mat(3,3) = mat(3,3)-(RHO1*vR**2)
mat(3,4) = 0._dp 
mat(4,4) = 0._dp 
mat(4,4) = mat(4,4)-1._dp/2._dp*(ALP1*k1**2)
mat(4,4) = mat(4,4)-1._dp/2._dp*(ALP1*k2**2)
mat(4,4) = mat(4,4)-1._dp/2._dp*(ALP2*k2**2)
mat(4,4) = mat(4,4)+MU22
mat(4,4) = mat(4,4)-(RHO1*vL**2)
mat(4,4) = mat(4,4)-1._dp/2._dp*(RHO2*vR**2)

 
 Do i1=2,4
  Do i2 = 1, i1-1 
  mat(i1,i2) = mat(i2,i1) 
  End do 
End do 

 
Call EigenSystem(mat,MAh2,UP,ierr,test) 
 
 
! Fix phases
Do i1=1,4
  pos=Maxloc(Abs(UP(i1,:)),1)
  If (Real(UP(i1,pos),dp).lt.0._dp) Then
    UP(i1,:)=-UP(i1,:)
  End if
End do
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Then 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
    Call TerminateProgram 
  End If 
  ierr = 0 
End If 
 
If ((ierr.Ne.0.).And.(ErrorLevel.Ge.-1)) Then 
  Write(10,*) 'Warning from Subroutine '//NameOfUnit(Iname) 
  Write(10,*) 'Diagonalization failed, ierr : ',ierr 
  kont = ierr 
  Iname = Iname - 1 
  Return 
End If 


Do i1=1,4
  If (MAh2(i1).ne.MAh2(i1)) Then 
      Write(*,*) 'NaN appearing in '//NameOfUnit(Iname) 
      Call TerminateProgram 
    End If 
  If (MAh2(i1).Ge.0._dp) Then 
  MAh(i1)=Sqrt(MAh2(i1) ) 
  Else 
  MAh(i1) = 1._dp 
! kont = -104 
 End if 
End Do 
Iname = Iname - 1 
 
End Subroutine CalculateMAhEffPot 

Subroutine CalculateMHpmEffPot(g2,MU12,MU22,LAM2,LAM1,ALP1,RHO1,RHO2,ALP2,            & 
& ALP3,LAM5,LAM3,LAM4,LAM6,k1,k2,vR,vL,PhiW,UC,MHpm,MHpm2,kont)

Real(dp), Intent(in) :: g2,MU12,MU22,LAM2,LAM1,ALP1,RHO1,RHO2,ALP2,ALP3,LAM5,LAM3,LAM4,LAM6,k1,               & 
& k2,vR,vL,PhiW

Integer, Intent(inout) :: kont 
Integer :: i1,i2,i3,i4, ierr, pos 
Integer :: j1,j2,j3,j4 
Real(dp), Intent(out) :: MHpm(4), MHpm2(4) 
Real(dp), Intent(out) :: UC(4,4) 
 
Real(dp) :: UCFIX(4,4) 
 
Real(dp) :: mat(4,4)  

Real(dp) ::  test(2), Q2 

Iname = Iname + 1 
NameOfUnit(Iname) = 'CalculateMHpm'
 
mat(1,1) = 0._dp 
mat(1,1) = mat(1,1)-(k1**2*LAM1)
mat(1,1) = mat(1,1)-(k2**2*LAM1)
mat(1,1) = mat(1,1)-(k1**2*LAM2)
mat(1,1) = mat(1,1)-(k2**2*LAM2)
mat(1,1) = mat(1,1)+(k1**2*LAM5)/2._dp
mat(1,1) = mat(1,1)+MU12
mat(1,1) = mat(1,1)-1._dp/2._dp*(ALP1*vL**2)
mat(1,1) = mat(1,1)-1._dp/2._dp*(ALP1*vR**2)
mat(1,1) = mat(1,1)-1._dp/2._dp*(ALP2*vR**2)
mat(1,2) = 0._dp 
mat(1,2) = mat(1,2)-(k1*k2*LAM2)
mat(1,2) = mat(1,2)+4*k1*k2*LAM3
mat(1,2) = mat(1,2)-(k1*k2*LAM4)
mat(1,2) = mat(1,2)+2*k1*k2*LAM6
mat(1,3) = 0._dp 
mat(1,3) = mat(1,3)-1._dp/2._dp*(ALP2*k1*vR)
mat(1,3) = mat(1,3)+(ALP3*k1*vR)/2._dp
mat(1,4) = 0._dp 
mat(1,4) = mat(1,4)-1._dp/2._dp*(ALP2*k2*vL)
mat(2,2) = 0._dp 
mat(2,2) = mat(2,2)-(k1**2*LAM1)
mat(2,2) = mat(2,2)-(k2**2*LAM1)
mat(2,2) = mat(2,2)-(k1**2*LAM2)
mat(2,2) = mat(2,2)-(k2**2*LAM2)
mat(2,2) = mat(2,2)+(k2**2*LAM5)/2._dp
mat(2,2) = mat(2,2)+MU12
mat(2,2) = mat(2,2)-1._dp/2._dp*(ALP1*vL**2)
mat(2,2) = mat(2,2)-1._dp/2._dp*(ALP2*vL**2)
mat(2,2) = mat(2,2)-1._dp/2._dp*(ALP1*vR**2)
mat(2,2) = mat(2,2)-1._dp/2._dp*(ALP3*vR**2)
mat(2,2) = mat(2,2)-1._dp/2._dp*(ALP3*vL**2*epsTensor(1,rig1))
mat(2,3) = 0._dp 
mat(2,3) = mat(2,3)-1._dp/2._dp*(ALP2*k2*vR)
mat(2,4) = 0._dp 
mat(2,4) = mat(2,4)-1._dp/2._dp*(ALP2*k1*vL)
mat(2,4) = mat(2,4)-1._dp/2._dp*(ALP3*k1*vL*epsTensor(1,rig1))
mat(3,3) = 0._dp 
mat(3,3) = mat(3,3)-1._dp/2._dp*(ALP1*k1**2)
mat(3,3) = mat(3,3)-1._dp/2._dp*(ALP2*k1**2)
mat(3,3) = mat(3,3)-1._dp/2._dp*(ALP1*k2**2)
mat(3,3) = mat(3,3)+MU22
mat(3,3) = mat(3,3)-1._dp/2._dp*(RHO2*vL**2)
mat(3,3) = mat(3,3)-(RHO1*vR**2)
mat(3,4) = 0._dp 
mat(4,4) = 0._dp 
mat(4,4) = mat(4,4)-1._dp/2._dp*(ALP1*k1**2)
mat(4,4) = mat(4,4)-1._dp/2._dp*(ALP2*k1**2)
mat(4,4) = mat(4,4)-1._dp/2._dp*(ALP1*k2**2)
mat(4,4) = mat(4,4)+MU22
mat(4,4) = mat(4,4)-(RHO1*vL**2)
mat(4,4) = mat(4,4)-1._dp/2._dp*(RHO2*vR**2)

 
 Do i1=2,4
  Do i2 = 1, i1-1 
  mat(i1,i2) = mat(i2,i1) 
  End do 
End do 

 
Call EigenSystem(mat,MHpm2,UC,ierr,test) 
 
 
! Fix phases
Do i1=1,4
  pos=Maxloc(Abs(UC(i1,:)),1)
  If (Real(UC(i1,pos),dp).lt.0._dp) Then
    UC(i1,:)=-UC(i1,:)
  End if
End do
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Then 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
    Call TerminateProgram 
  End If 
  ierr = 0 
End If 
 
If ((ierr.Ne.0.).And.(ErrorLevel.Ge.-1)) Then 
  Write(10,*) 'Warning from Subroutine '//NameOfUnit(Iname) 
  Write(10,*) 'Diagonalization failed, ierr : ',ierr 
  kont = ierr 
  Iname = Iname - 1 
  Return 
End If 


Do i1=1,4
  If (MHpm2(i1).ne.MHpm2(i1)) Then 
      Write(*,*) 'NaN appearing in '//NameOfUnit(Iname) 
      Call TerminateProgram 
    End If 
  If (MHpm2(i1).Ge.0._dp) Then 
  MHpm(i1)=Sqrt(MHpm2(i1) ) 
  Else 
  MHpm(i1) = 1._dp 
! kont = -104 
 End if 
End Do 
Iname = Iname - 1 
 
End Subroutine CalculateMHpmEffPot 

Subroutine CalculateMFdEffPot(YQ1,YQ2,k1,k2,ZDL,ZDR,MFd,kont)

Real(dp),Intent(in) :: k1,k2

Complex(dp),Intent(in) :: YQ1(3,3),YQ2(3,3)

Integer, Intent(inout) :: kont 
Integer :: i1,i2,i3,i4, ierr 
Integer :: j1,j2,j3,j4 
Real(dp), Intent(out) :: MFd(3) 
 Complex(dp), Intent(out) :: ZDL(3,3), ZDR(3,3) 
 
 Complex(dp) :: mat(3,3)=0._dp, mat2(3,3)=0._dp, phaseM 

Complex(dp) :: ZDL2(3,3), ZDR2(3,3) 
 
 Real(dp) :: ZDL1(3,3), ZDR1(3,3), test(2), MFd2(3) 
 
 Iname = Iname + 1 
NameOfUnit(Iname) = 'CalculateMFd'
 
MFd = 0._dp 
ZDL = 0._dp 
ZDR = 0._dp 
mat(1,1) = 0._dp 
mat(1,1) = mat(1,1)+(k2*Conjg(YQ1(1,1)))/sqrt(2._dp)
mat(1,1) = mat(1,1)+(k1*Conjg(YQ2(1,1)))/sqrt(2._dp)
mat(1,2) = 0._dp 
mat(1,2) = mat(1,2)+(k2*Conjg(YQ1(1,2)))/sqrt(2._dp)
mat(1,2) = mat(1,2)+(k1*Conjg(YQ2(1,2)))/sqrt(2._dp)
mat(1,3) = 0._dp 
mat(1,3) = mat(1,3)+(k2*Conjg(YQ1(1,3)))/sqrt(2._dp)
mat(1,3) = mat(1,3)+(k1*Conjg(YQ2(1,3)))/sqrt(2._dp)
mat(2,1) = 0._dp 
mat(2,1) = mat(2,1)+(k2*Conjg(YQ1(2,1)))/sqrt(2._dp)
mat(2,1) = mat(2,1)+(k1*Conjg(YQ2(2,1)))/sqrt(2._dp)
mat(2,2) = 0._dp 
mat(2,2) = mat(2,2)+(k2*Conjg(YQ1(2,2)))/sqrt(2._dp)
mat(2,2) = mat(2,2)+(k1*Conjg(YQ2(2,2)))/sqrt(2._dp)
mat(2,3) = 0._dp 
mat(2,3) = mat(2,3)+(k2*Conjg(YQ1(2,3)))/sqrt(2._dp)
mat(2,3) = mat(2,3)+(k1*Conjg(YQ2(2,3)))/sqrt(2._dp)
mat(3,1) = 0._dp 
mat(3,1) = mat(3,1)+(k2*Conjg(YQ1(3,1)))/sqrt(2._dp)
mat(3,1) = mat(3,1)+(k1*Conjg(YQ2(3,1)))/sqrt(2._dp)
mat(3,2) = 0._dp 
mat(3,2) = mat(3,2)+(k2*Conjg(YQ1(3,2)))/sqrt(2._dp)
mat(3,2) = mat(3,2)+(k1*Conjg(YQ2(3,2)))/sqrt(2._dp)
mat(3,3) = 0._dp 
mat(3,3) = mat(3,3)+(k2*Conjg(YQ1(3,3)))/sqrt(2._dp)
mat(3,3) = mat(3,3)+(k1*Conjg(YQ2(3,3)))/sqrt(2._dp)

 
mat2 = Matmul(Transpose(Conjg(mat)),mat) 
If (Maxval(Abs(Aimag(mat2))).Eq.0._dp) Then 
Call EigenSystem(Real(mat2,dp),MFd2,ZDR1,ierr,test) 
ZDR2 = ZDR1 
Else 
Call EigenSystem(mat2,MFd2,ZDR2,ierr,test) 
 End If 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Then 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
    Call TerminateProgram 
  End If 
  ierr = 0 
End If 
 
mat2 = Matmul(mat,Transpose(Conjg(mat))) 
If (Maxval(Abs(Aimag(mat2))).Eq.0._dp) Then 
Call EigenSystem (Real(mat2,dp),MFd2,ZDL1,ierr,test) 
                  
                  
ZDL2 = ZDL1 
Else 
Call EigenSystem(mat2,MFd2,ZDL2,ierr,test) 
 
 
End If 
ZDL2 = Conjg(ZDL2) 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Then 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
    Call TerminateProgram 
  End If 
  ierr = 0 
End If 
 
mat2 = Matmul(Matmul( Conjg(ZDL2),mat),Transpose( Conjg(ZDR2))) 
Do i1=1,3
If (Abs(mat2(i1,i1)).gt.0._dp) Then 
phaseM = mat2(i1,i1) / Abs(mat2(i1,i1)) 
ZDR2(i1,:) = phaseM *ZDR2(i1,:) 
 End if 
End Do 
 
Do i1=1,3
If (Abs(ZDR2(i1,i1)).gt.0._dp) Then 
phaseM = ZDR2(i1,i1) / Abs(ZDR2(i1,i1)) 
ZDR2(i1,:) = Conjg(phaseM) *ZDR2(i1,:) 
 ZDL2(i1,:) = phaseM *ZDL2(i1,:) 
 End if 
  If (MFd2(i1).ne.MFd2(i1)) Then 
      Write(*,*) 'NaN appearing in '//NameOfUnit(Iname) 
      Call TerminateProgram 
    End If 
  If (Abs(MFd2(i1)).Le.MaxMassNumericalZero) MFd2(i1) = Abs(MFd2(i1))+1.E-10_dp 
  If (MFd2(i1).Le.0._dp) Then 
! kont = -104 
 End if 
End Do 
 
If (ierr.Ne.0.) Then 
  Write(ErrCan,*) 'Warning from Subroutine CalculateMFd, ierr =',ierr 
  kont = ierr 
  Iname = Iname - 1 
  Return 
End If 


MFd = Sqrt( MFd2 ) 
ZDL = ZDL2 
ZDR = ZDR2 
Iname = Iname - 1 
 
End Subroutine CalculateMFdEffPot 

Subroutine CalculateMFuEffPot(YQ1,YQ2,k1,k2,ZUL,ZUR,MFu,kont)

Real(dp),Intent(in) :: k1,k2

Complex(dp),Intent(in) :: YQ1(3,3),YQ2(3,3)

Integer, Intent(inout) :: kont 
Integer :: i1,i2,i3,i4, ierr 
Integer :: j1,j2,j3,j4 
Real(dp), Intent(out) :: MFu(3) 
 Complex(dp), Intent(out) :: ZUL(3,3), ZUR(3,3) 
 
 Complex(dp) :: mat(3,3)=0._dp, mat2(3,3)=0._dp, phaseM 

Complex(dp) :: ZUL2(3,3), ZUR2(3,3) 
 
 Real(dp) :: ZUL1(3,3), ZUR1(3,3), test(2), MFu2(3) 
 
 Iname = Iname + 1 
NameOfUnit(Iname) = 'CalculateMFu'
 
MFu = 0._dp 
ZUL = 0._dp 
ZUR = 0._dp 
mat(1,1) = 0._dp 
mat(1,1) = mat(1,1)+(k1*Conjg(YQ1(1,1)))/sqrt(2._dp)
mat(1,1) = mat(1,1)+(k2*Conjg(YQ2(1,1)))/sqrt(2._dp)
mat(1,2) = 0._dp 
mat(1,2) = mat(1,2)+(k1*Conjg(YQ1(1,2)))/sqrt(2._dp)
mat(1,2) = mat(1,2)+(k2*Conjg(YQ2(1,2)))/sqrt(2._dp)
mat(1,3) = 0._dp 
mat(1,3) = mat(1,3)+(k1*Conjg(YQ1(1,3)))/sqrt(2._dp)
mat(1,3) = mat(1,3)+(k2*Conjg(YQ2(1,3)))/sqrt(2._dp)
mat(2,1) = 0._dp 
mat(2,1) = mat(2,1)+(k1*Conjg(YQ1(2,1)))/sqrt(2._dp)
mat(2,1) = mat(2,1)+(k2*Conjg(YQ2(2,1)))/sqrt(2._dp)
mat(2,2) = 0._dp 
mat(2,2) = mat(2,2)+(k1*Conjg(YQ1(2,2)))/sqrt(2._dp)
mat(2,2) = mat(2,2)+(k2*Conjg(YQ2(2,2)))/sqrt(2._dp)
mat(2,3) = 0._dp 
mat(2,3) = mat(2,3)+(k1*Conjg(YQ1(2,3)))/sqrt(2._dp)
mat(2,3) = mat(2,3)+(k2*Conjg(YQ2(2,3)))/sqrt(2._dp)
mat(3,1) = 0._dp 
mat(3,1) = mat(3,1)+(k1*Conjg(YQ1(3,1)))/sqrt(2._dp)
mat(3,1) = mat(3,1)+(k2*Conjg(YQ2(3,1)))/sqrt(2._dp)
mat(3,2) = 0._dp 
mat(3,2) = mat(3,2)+(k1*Conjg(YQ1(3,2)))/sqrt(2._dp)
mat(3,2) = mat(3,2)+(k2*Conjg(YQ2(3,2)))/sqrt(2._dp)
mat(3,3) = 0._dp 
mat(3,3) = mat(3,3)+(k1*Conjg(YQ1(3,3)))/sqrt(2._dp)
mat(3,3) = mat(3,3)+(k2*Conjg(YQ2(3,3)))/sqrt(2._dp)

 
mat2 = Matmul(Transpose(Conjg(mat)),mat) 
If (Maxval(Abs(Aimag(mat2))).Eq.0._dp) Then 
Call EigenSystem(Real(mat2,dp),MFu2,ZUR1,ierr,test) 
ZUR2 = ZUR1 
Else 
Call EigenSystem(mat2,MFu2,ZUR2,ierr,test) 
 End If 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Then 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
    Call TerminateProgram 
  End If 
  ierr = 0 
End If 
 
mat2 = Matmul(mat,Transpose(Conjg(mat))) 
If (Maxval(Abs(Aimag(mat2))).Eq.0._dp) Then 
Call EigenSystem (Real(mat2,dp),MFu2,ZUL1,ierr,test) 
                  
                  
ZUL2 = ZUL1 
Else 
Call EigenSystem(mat2,MFu2,ZUL2,ierr,test) 
 
 
End If 
ZUL2 = Conjg(ZUL2) 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Then 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
    Call TerminateProgram 
  End If 
  ierr = 0 
End If 
 
mat2 = Matmul(Matmul( Conjg(ZUL2),mat),Transpose( Conjg(ZUR2))) 
Do i1=1,3
If (Abs(mat2(i1,i1)).gt.0._dp) Then 
phaseM = mat2(i1,i1) / Abs(mat2(i1,i1)) 
ZUR2(i1,:) = phaseM *ZUR2(i1,:) 
 End if 
End Do 
 
Do i1=1,3
If (Abs(ZUR2(i1,i1)).gt.0._dp) Then 
phaseM = ZUR2(i1,i1) / Abs(ZUR2(i1,i1)) 
ZUR2(i1,:) = Conjg(phaseM) *ZUR2(i1,:) 
 ZUL2(i1,:) = phaseM *ZUL2(i1,:) 
 End if 
  If (MFu2(i1).ne.MFu2(i1)) Then 
      Write(*,*) 'NaN appearing in '//NameOfUnit(Iname) 
      Call TerminateProgram 
    End If 
  If (Abs(MFu2(i1)).Le.MaxMassNumericalZero) MFu2(i1) = Abs(MFu2(i1))+1.E-10_dp 
  If (MFu2(i1).Le.0._dp) Then 
! kont = -104 
 End if 
End Do 
 
If (ierr.Ne.0.) Then 
  Write(ErrCan,*) 'Warning from Subroutine CalculateMFu, ierr =',ierr 
  kont = ierr 
  Iname = Iname - 1 
  Return 
End If 


MFu = Sqrt( MFu2 ) 
ZUL = ZUL2 
ZUR = ZUR2 
Iname = Iname - 1 
 
End Subroutine CalculateMFuEffPot 

Subroutine CalculateMFeEffPot(Y,Yt,k1,k2,ZEL,ZER,MFe,kont)

Real(dp),Intent(in) :: k1,k2

Complex(dp),Intent(in) :: Y(3,3),Yt(3,3)

Integer, Intent(inout) :: kont 
Integer :: i1,i2,i3,i4, ierr 
Integer :: j1,j2,j3,j4 
Real(dp), Intent(out) :: MFe(3) 
 Complex(dp), Intent(out) :: ZEL(3,3), ZER(3,3) 
 
 Complex(dp) :: mat(3,3)=0._dp, mat2(3,3)=0._dp, phaseM 

Complex(dp) :: ZEL2(3,3), ZER2(3,3) 
 
 Real(dp) :: ZEL1(3,3), ZER1(3,3), test(2), MFe2(3) 
 
 Iname = Iname + 1 
NameOfUnit(Iname) = 'CalculateMFe'
 
MFe = 0._dp 
ZEL = 0._dp 
ZER = 0._dp 
mat(1,1) = 0._dp 
mat(1,1) = mat(1,1)+(k2*Conjg(Y(1,1)))/sqrt(2._dp)
mat(1,1) = mat(1,1)+(k1*Conjg(Yt(1,1)))/sqrt(2._dp)
mat(1,2) = 0._dp 
mat(1,2) = mat(1,2)+(k2*Conjg(Y(1,2)))/sqrt(2._dp)
mat(1,2) = mat(1,2)+(k1*Conjg(Yt(1,2)))/sqrt(2._dp)
mat(1,3) = 0._dp 
mat(1,3) = mat(1,3)+(k2*Conjg(Y(1,3)))/sqrt(2._dp)
mat(1,3) = mat(1,3)+(k1*Conjg(Yt(1,3)))/sqrt(2._dp)
mat(2,1) = 0._dp 
mat(2,1) = mat(2,1)+(k2*Conjg(Y(2,1)))/sqrt(2._dp)
mat(2,1) = mat(2,1)+(k1*Conjg(Yt(2,1)))/sqrt(2._dp)
mat(2,2) = 0._dp 
mat(2,2) = mat(2,2)+(k2*Conjg(Y(2,2)))/sqrt(2._dp)
mat(2,2) = mat(2,2)+(k1*Conjg(Yt(2,2)))/sqrt(2._dp)
mat(2,3) = 0._dp 
mat(2,3) = mat(2,3)+(k2*Conjg(Y(2,3)))/sqrt(2._dp)
mat(2,3) = mat(2,3)+(k1*Conjg(Yt(2,3)))/sqrt(2._dp)
mat(3,1) = 0._dp 
mat(3,1) = mat(3,1)+(k2*Conjg(Y(3,1)))/sqrt(2._dp)
mat(3,1) = mat(3,1)+(k1*Conjg(Yt(3,1)))/sqrt(2._dp)
mat(3,2) = 0._dp 
mat(3,2) = mat(3,2)+(k2*Conjg(Y(3,2)))/sqrt(2._dp)
mat(3,2) = mat(3,2)+(k1*Conjg(Yt(3,2)))/sqrt(2._dp)
mat(3,3) = 0._dp 
mat(3,3) = mat(3,3)+(k2*Conjg(Y(3,3)))/sqrt(2._dp)
mat(3,3) = mat(3,3)+(k1*Conjg(Yt(3,3)))/sqrt(2._dp)

 
mat2 = Matmul(Transpose(Conjg(mat)),mat) 
If (Maxval(Abs(Aimag(mat2))).Eq.0._dp) Then 
Call EigenSystem(Real(mat2,dp),MFe2,ZER1,ierr,test) 
ZER2 = ZER1 
Else 
Call EigenSystem(mat2,MFe2,ZER2,ierr,test) 
 End If 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Then 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
    Call TerminateProgram 
  End If 
  ierr = 0 
End If 
 
mat2 = Matmul(mat,Transpose(Conjg(mat))) 
If (Maxval(Abs(Aimag(mat2))).Eq.0._dp) Then 
Call EigenSystem (Real(mat2,dp),MFe2,ZEL1,ierr,test) 
                  
                  
ZEL2 = ZEL1 
Else 
Call EigenSystem(mat2,MFe2,ZEL2,ierr,test) 
 
 
End If 
ZEL2 = Conjg(ZEL2) 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Then 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
    Call TerminateProgram 
  End If 
  ierr = 0 
End If 
 
mat2 = Matmul(Matmul( Conjg(ZEL2),mat),Transpose( Conjg(ZER2))) 
Do i1=1,3
If (Abs(mat2(i1,i1)).gt.0._dp) Then 
phaseM = mat2(i1,i1) / Abs(mat2(i1,i1)) 
ZER2(i1,:) = phaseM *ZER2(i1,:) 
 End if 
End Do 
 
Do i1=1,3
If (Abs(ZER2(i1,i1)).gt.0._dp) Then 
phaseM = ZER2(i1,i1) / Abs(ZER2(i1,i1)) 
ZER2(i1,:) = Conjg(phaseM) *ZER2(i1,:) 
 ZEL2(i1,:) = phaseM *ZEL2(i1,:) 
 End if 
  If (MFe2(i1).ne.MFe2(i1)) Then 
      Write(*,*) 'NaN appearing in '//NameOfUnit(Iname) 
      Call TerminateProgram 
    End If 
  If (Abs(MFe2(i1)).Le.MaxMassNumericalZero) MFe2(i1) = Abs(MFe2(i1))+1.E-10_dp 
  If (MFe2(i1).Le.0._dp) Then 
! kont = -104 
 End if 
End Do 
 
If (ierr.Ne.0.) Then 
  Write(ErrCan,*) 'Warning from Subroutine CalculateMFe, ierr =',ierr 
  kont = ierr 
  Iname = Iname - 1 
  Return 
End If 


MFe = Sqrt( MFe2 ) 
ZEL = ZEL2 
ZER = ZER2 
Iname = Iname - 1 
 
End Subroutine CalculateMFeEffPot 

Subroutine CalculateMFvEffPot(Y,Yt,k1,k2,ZM,MFv,kont)

Real(dp) ,Intent(in) :: k1,k2

Complex(dp) ,Intent(in) :: Y(3,3),Yt(3,3)

Integer, Intent(inout) :: kont 
Integer :: i1,i2,i3,i4, ierr, pos 
Integer :: j1,j2,j3,j4 
Logical :: SecondDiagonalisationNeeded 
Real(dp), Intent(out) :: MFv(9) 
Complex(dp), Intent(out) ::  ZM(9,9) 
                              
Complex(dp) :: mat(9,9), mat2(9,9), phaseM, E9(9) 

Real(dp) :: ZMa(9,9), test(2), eig(9) 

Iname = Iname + 1 
NameOfUnit(Iname) = 'CalculateMFv'
 
mat(1,1) = 0._dp 
mat(1,2) = 0._dp 
mat(1,3) = 0._dp 
mat(1,4) = 0._dp 
mat(1,4) = mat(1,4)+(k1*Conjg(Y(1,1)))/sqrt(2._dp)
mat(1,4) = mat(1,4)+(k2*Conjg(Yt(1,1)))/sqrt(2._dp)
mat(1,5) = 0._dp 
mat(1,5) = mat(1,5)+(k1*Conjg(Y(1,2)))/sqrt(2._dp)
mat(1,5) = mat(1,5)+(k2*Conjg(Yt(1,2)))/sqrt(2._dp)
mat(1,6) = 0._dp 
mat(1,6) = mat(1,6)+(k1*Conjg(Y(1,3)))/sqrt(2._dp)
mat(1,6) = mat(1,6)+(k2*Conjg(Yt(1,3)))/sqrt(2._dp)
mat(1,7) = 0._dp 
mat(1,8) = 0._dp 
mat(1,9) = 0._dp 
mat(2,2) = 0._dp 
mat(2,3) = 0._dp 
mat(2,4) = 0._dp 
mat(2,4) = mat(2,4)+(k1*Conjg(Y(2,1)))/sqrt(2._dp)
mat(2,4) = mat(2,4)+(k2*Conjg(Yt(2,1)))/sqrt(2._dp)
mat(2,5) = 0._dp 
mat(2,5) = mat(2,5)+(k1*Conjg(Y(2,2)))/sqrt(2._dp)
mat(2,5) = mat(2,5)+(k2*Conjg(Yt(2,2)))/sqrt(2._dp)
mat(2,6) = 0._dp 
mat(2,6) = mat(2,6)+(k1*Conjg(Y(2,3)))/sqrt(2._dp)
mat(2,6) = mat(2,6)+(k2*Conjg(Yt(2,3)))/sqrt(2._dp)
mat(2,7) = 0._dp 
mat(2,8) = 0._dp 
mat(2,9) = 0._dp 
mat(3,3) = 0._dp 
mat(3,4) = 0._dp 
mat(3,4) = mat(3,4)+(k1*Conjg(Y(3,1)))/sqrt(2._dp)
mat(3,4) = mat(3,4)+(k2*Conjg(Yt(3,1)))/sqrt(2._dp)
mat(3,5) = 0._dp 
mat(3,5) = mat(3,5)+(k1*Conjg(Y(3,2)))/sqrt(2._dp)
mat(3,5) = mat(3,5)+(k2*Conjg(Yt(3,2)))/sqrt(2._dp)
mat(3,6) = 0._dp 
mat(3,6) = mat(3,6)+(k1*Conjg(Y(3,3)))/sqrt(2._dp)
mat(3,6) = mat(3,6)+(k2*Conjg(Yt(3,3)))/sqrt(2._dp)
mat(3,7) = 0._dp 
mat(3,8) = 0._dp 
mat(3,9) = 0._dp 
mat(4,4) = 0._dp 
mat(4,5) = 0._dp 
mat(4,6) = 0._dp 
mat(4,7) = 0._dp 
mat(4,8) = 0._dp 
mat(4,9) = 0._dp 
mat(5,5) = 0._dp 
mat(5,6) = 0._dp 
mat(5,7) = 0._dp 
mat(5,8) = 0._dp 
mat(5,9) = 0._dp 
mat(6,6) = 0._dp 
mat(6,7) = 0._dp 
mat(6,8) = 0._dp 
mat(6,9) = 0._dp 
mat(7,7) = 0._dp 
mat(7,8) = 0._dp 
mat(7,9) = 0._dp 
mat(8,8) = 0._dp 
mat(8,9) = 0._dp 
mat(9,9) = 0._dp 

 
 Do i1=2,9
  Do i2 = 1, i1-1 
  mat(i1,i2) = mat(i2,i1) 
  End do 
End do 

 
If (Maxval(Abs(Aimag(mat))).Eq.0._dp) Then 
Call EigenSystemQP(Real(mat,dp),Eig,ZMa,ierr,test) 
 
   Do i1=1,9
   If ((Eig(i1).Lt.0._dp).or.(Abs(eig(i1)).lt.1E-15)) Then 
    MFv(i1) = - Eig(i1) 
    ZM(i1,:) = (0._dp,1._dp)*ZMa(i1,:) 
   Else 
    MFv(i1) = Eig(i1) 
    ZM(i1,:) = ZMa(i1,:)
    End If 
   End Do 
 
  Do i1=1,9
   pos=Maxloc(Abs(ZM(i1,:)),1) 
   If (Abs(Real(ZM(i1,pos),dp)).gt.Abs(Aimag(ZM(i1,pos)))) Then 
      If (Real(ZM(i1,pos),dp).lt.0._dp) Then 
        ZM(i1,:)=-ZM(i1,:) 
       End If 
    Else 
      If (Aimag(ZM(i1,pos)).lt.0._dp) Then 
        ZM(i1,:)=-ZM(i1,:) 
      End If 
    End If 
 End Do 
 
Do i1=1,8
  Do i2=i1+1,9
    If (MFv(i1).Gt.MFv(i2)) Then 
      Eig(1) = MFv(i1) 
      MFv(i1) = MFv(i2) 
      MFv(i2) =  Eig(1) 
      E9 = ZM(i1,:) 
      ZM(i1,:) = ZM(i2,:) 
      ZM(i2,:) = E9
    End If 
   End Do 
End Do 
 
Else 
 
mat2 = Matmul( Transpose(Conjg( mat) ), mat ) 
Call EigensystemQP(mat2, Eig, ZM, ierr, test) 
mat2 = Matmul( Conjg(ZM), Matmul( mat, Transpose( Conjg(ZM)))) 
! Special efforts are needed for matrices like the Higgsinos one 
SecondDiagonalisationNeeded = .False. 
Do i1=1,9-1
If (MaxVal(Abs(mat2(i1,(i1+1):9))).gt.Abs(mat2(i1,i1))) SecondDiagonalisationNeeded = .True. 

  If (Eig(i1).ne.Eig(i1)) Then 
      Write(*,*) 'NaN appearing in '//NameOfUnit(Iname) 
      Call TerminateProgram 
    End If 
  If ((Abs(Eig(i1)).Le.MaxMassNumericalZero).and.(Eig(i1).lt.0._dp)) Eig(i1) = Abs(Eig(i1))+1.E-10_dp 
  If (Eig(i1).Le.0._dp) Then 
! kont = -104 
 End if 
End do 
If (SecondDiagonalisationNeeded) Then 
Call EigenSystemQP(Real(mat2,dp),Eig,ZMa,ierr,test) 
 
     ZM = MatMul(ZM,ZMa)
  Do i1=1,9
   If ((Eig(i1).Lt.0._dp).or.(Abs(eig(i1)).lt.1E-15)) Then 
    MFv(i1) = - Eig(i1) 
    ZM(i1,:) = (0._dp,1._dp)*ZMa(i1,:) 
   Else 
    MFv(i1) = Eig(i1) 
    ZM(i1,:) = ZMa(i1,:)
    End If 
   End Do 
 
Else 
Do i1=1,9
  If (Eig(i1).ne.Eig(i1)) Then 
      Write(*,*) 'NaN appearing in '//NameOfUnit(Iname) 
      Call TerminateProgram 
    End If 
If (Abs(mat2(i1,i1)).gt.0._dp) Then 
  phaseM = Sqrt( mat2(i1,i1) / Abs(mat2(i1,i1))) 
  ZM(i1,:)= phaseM * ZM(i1,:) 
End if 
  If ((Abs(Eig(i1)).Le.MaxMassNumericalZero).and.(Eig(i1).lt.0._dp)) Eig(i1) = Abs(Eig(i1))+1.E-10_dp 
  If (Eig(i1).Le.0._dp) Then 
! kont = -104 
 End if 
End Do 
MFv = Sqrt( Eig ) 
 
End if ! Second diagonalisation 
End If 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Then 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
    Call TerminateProgram 
  End If 
  ierr = 0 
End If 
 
If (ierr.Ne.0.) Then 
  Write(ErrCan,*) 'Warning from Subroutine CalculateMFv, ierr =',ierr 
  kont = ierr 
  Iname = Iname - 1 
  Return 
End If 


Iname = Iname - 1 
 
End Subroutine CalculateMFvEffPot 

Subroutine CalculateVPVZVZREffPot(gBL,g2,k1,k2,vR,vL,ZZ,MVZ,MVZR,MVZ2,MVZR2,kont)

Real(dp), Intent(in) :: gBL,g2,k1,k2,vR,vL

Integer, Intent(inout) :: kont 
Integer :: i1,i2,i3,i4, ierr 
Integer :: j1,j2,j3,j4 
Real(dp), Intent(out) :: MVZ, MVZ2
Real(dp), Intent(out) :: MVZR, MVZR2
Real(dp) :: VPVZVZR2(3),VPVZVZR(3)  

Complex(dp), Intent(out) :: ZZ(3,3) 
 
Complex(dp) :: mat(3,3)  

Real(dp) ::  test(2) 

Iname = Iname + 1 
NameOfUnit(Iname) = 'CalculateVPVZVZR'
 
mat(1,1) = 0._dp 
mat(1,1) = mat(1,1)+gBL**2*vLFix**2
mat(1,1) = mat(1,1)+gBL**2*vRFix**2
mat(1,2) = 0._dp 
mat(1,2) = mat(1,2)-1._dp/2._dp*(g2*gBL*vLFix**2)
mat(1,3) = 0._dp 
mat(1,3) = mat(1,3)-1._dp/2._dp*(g2*gBL*vRFix**2)
mat(2,2) = 0._dp 
mat(2,2) = mat(2,2)+(g2**2*k1Fix**2)/4._dp
mat(2,2) = mat(2,2)+(g2**2*k2Fix**2)/4._dp
mat(2,2) = mat(2,2)+(g2**2*vLFix**2)/4._dp
mat(2,3) = 0._dp 
mat(2,3) = mat(2,3)-1._dp/4._dp*(g2**2*k1Fix**2)
mat(2,3) = mat(2,3)-1._dp/4._dp*(g2**2*k2Fix**2)
mat(3,3) = 0._dp 
mat(3,3) = mat(3,3)+(g2**2*k1Fix**2)/4._dp
mat(3,3) = mat(3,3)+(g2**2*k2Fix**2)/4._dp
mat(3,3) = mat(3,3)+(g2**2*vRFix**2)/4._dp

 
 Do i1=2,3
  Do i2 = 1, i1-1 
  mat(i1,i2) = Conjg(mat(i2,i1)) 
  End do 
End do 

 
Call EigenSystem(mat,VPVZVZR2,ZZ,ierr,test) 
 
 
ZZ = Transpose(ZZ) 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Then 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
    Call TerminateProgram 
  End If 
  ierr = 0 
End If 
 
If ((ierr.Ne.0.).And.(ErrorLevel.Ge.-1)) Then 
  Write(10,*) 'Warning from Subroutine '//NameOfUnit(Iname) 
  Write(10,*) 'Diagonalization failed, ierr : ',ierr 
  kont = ierr 
  Iname = Iname - 1 
  Return 
End If 


Do i1=1,3
  If (Abs(VPVZVZR2(i1)).Le.1.E-10_dp*(Maxval(VPVZVZR2))) VPVZVZR2(i1) = 1.E-10_dp 
  If (VPVZVZR2(i1).ne.VPVZVZR2(i1)) Then 
      Write(*,*) 'NaN appearing in '//NameOfUnit(Iname) 
      Call TerminateProgram 
    End If 
  If (VPVZVZR2(i1).Ge.0._dp) Then 
  VPVZVZR(i1) =Sqrt(VPVZVZR2(i1) ) 
  Else 
  VPVZVZR(i1)= 1._dp 
  VPVZVZR(i1)= 1._dp 
! kont = -104 
 End if 
End Do 
 
MVZ = VPVZVZR(2) 
MVZ2 = VPVZVZR2(2) 
MVZR = VPVZVZR(3) 
MVZR2 = VPVZVZR2(3) 

 Iname = Iname - 1 
 
End Subroutine CalculateVPVZVZREffPot 

Subroutine CalculateVWLmVWRmEffPot(g2,k1,k2,vR,vL,ZW,MVWLm,MVWRm,MVWLm2,              & 
& MVWRm2,PhiW,kont)

Real(dp), Intent(in) :: g2,k1,k2,vR,vL

Real(dp), Intent(out) :: PhiW

Integer, Intent(inout) :: kont 
Integer :: i1,i2,i3,i4, ierr 
Integer :: j1,j2,j3,j4 
Real(dp), Intent(out) :: MVWLm, MVWLm2
Real(dp), Intent(out) :: MVWRm, MVWRm2
Real(dp) :: VWLmVWRm2(4),VWLmVWRm(4)  

Complex(dp), Intent(out) :: ZW(4,4) 
 
Complex(dp) :: mat(4,4)  

Real(dp) ::  test(2) 

Iname = Iname + 1 
NameOfUnit(Iname) = 'CalculateVWLmVWRm'
 
mat(1,1) = 0._dp 
mat(1,1) = mat(1,1)+(g2**2*k1Fix**2)/4._dp
mat(1,1) = mat(1,1)+(g2**2*k2Fix**2)/4._dp
mat(1,1) = mat(1,1)+(g2**2*vLFix**2)/4._dp
mat(1,2) = 0._dp 
mat(1,3) = 0._dp 
mat(1,3) = mat(1,3)-1._dp/2._dp*(g2**2*k1Fix*k2Fix)
mat(1,4) = 0._dp 
mat(2,2) = 0._dp 
mat(2,2) = mat(2,2)+(g2**2*k1Fix**2)/4._dp
mat(2,2) = mat(2,2)+(g2**2*k2Fix**2)/4._dp
mat(2,2) = mat(2,2)+(g2**2*vLFix**2)/4._dp
mat(2,3) = 0._dp 
mat(2,4) = 0._dp 
mat(2,4) = mat(2,4)-1._dp/2._dp*(g2**2*k1Fix*k2Fix)
mat(3,3) = 0._dp 
mat(3,3) = mat(3,3)+(g2**2*k1Fix**2)/4._dp
mat(3,3) = mat(3,3)+(g2**2*k2Fix**2)/4._dp
mat(3,3) = mat(3,3)+(g2**2*vRFix**2)/4._dp
mat(3,4) = 0._dp 
mat(4,4) = 0._dp 
mat(4,4) = mat(4,4)+(g2**2*k1Fix**2)/4._dp
mat(4,4) = mat(4,4)+(g2**2*k2Fix**2)/4._dp
mat(4,4) = mat(4,4)+(g2**2*vRFix**2)/4._dp

 
 Do i1=2,4
  Do i2 = 1, i1-1 
  mat(i1,i2) = Conjg(mat(i2,i1)) 
  End do 
End do 

 
Call EigenSystem(mat,VWLmVWRm2,ZW,ierr,test) 
 
 
ZW = Transpose(ZW) 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Then 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
    Call TerminateProgram 
  End If 
  ierr = 0 
End If 
 
If ((ierr.Ne.0.).And.(ErrorLevel.Ge.-1)) Then 
  Write(10,*) 'Warning from Subroutine '//NameOfUnit(Iname) 
  Write(10,*) 'Diagonalization failed, ierr : ',ierr 
  kont = ierr 
  Iname = Iname - 1 
  Return 
End If 


Do i1=1,4
  If (Abs(VWLmVWRm2(i1)).Le.1.E-10_dp*(Maxval(VWLmVWRm2))) VWLmVWRm2(i1) = 1.E-10_dp 
  If (VWLmVWRm2(i1).ne.VWLmVWRm2(i1)) Then 
      Write(*,*) 'NaN appearing in '//NameOfUnit(Iname) 
      Call TerminateProgram 
    End If 
  If (VWLmVWRm2(i1).Ge.0._dp) Then 
  VWLmVWRm(i1) =Sqrt(VWLmVWRm2(i1) ) 
  Else 
  VWLmVWRm(i1)= 1._dp 
  VWLmVWRm(i1)= 1._dp 
! kont = -104 
 End if 
End Do 
 
MVWLm = VWLmVWRm(1) 
MVWLm2 = VWLmVWRm2(1) 
MVWRm = VWLmVWRm(3) 
MVWRm2 = VWLmVWRm2(3) 

 Iname = Iname - 1 
 
End Subroutine CalculateVWLmVWRmEffPot 

Subroutine TreeMassesSM(MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,MVWLm,MVWLm2,             & 
& MVWRm,MVWRm2,MVZ,MVZ2,MVZR,MVZR2,PhiW,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,ZM,ZW,ZZ,k1,             & 
& k2,vR,vL,gBL,g2,g3,LAM2,LAM1,ALP1,RHO1,RHO2,ALP2,ALP3,LAM5,LAM3,LAM4,LAM6,             & 
& Y,YQ1,YQ2,Yt,MU12,MU22,GenerationMixing,kont)

Implicit None 
 
Real(dp),Intent(in) :: gBL,g2,g3,LAM2,LAM1,ALP1,RHO1,RHO2,ALP2,ALP3,LAM5,LAM3,LAM4,LAM6,MU12,MU22

Complex(dp),Intent(in) :: Y(3,3),YQ1(3,3),YQ2(3,3),Yt(3,3)

Real(dp),Intent(out) :: MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),MFv(9),MFv2(9),MVWLm,MVWLm2,             & 
& MVWRm,MVWRm2,MVZ,MVZ2,MVZR,MVZR2,PhiW

Complex(dp),Intent(out) :: ZDR(3,3),ZER(3,3),ZUR(3,3),ZDL(3,3),ZEL(3,3),ZUL(3,3),ZM(9,9),ZW(4,4),ZZ(3,3)

Real(dp),Intent(in) :: k1,k2,vR,vL

Logical, Intent(in) :: GenerationMixing 
Integer, Intent(inout) :: kont 
Integer :: i1,i2,i3,i4,j1,j2,j3,kontSave 
Iname = Iname + 1 
NameOfUnit(Iname) = 'TreeMassesDLRSM'
 
kont = 0 
Call CalculateMFd(YQ1,YQ2,k1,k2,ZDL,ZDR,MFd,kont)

MFd2 = MFd**2 
Call CalculateMFu(YQ1,YQ2,k1,k2,ZUL,ZUR,MFu,kont)

MFu2 = MFu**2 
Call CalculateMFe(Y,Yt,k1,k2,ZEL,ZER,MFe,kont)

MFe2 = MFe**2 
Call CalculateMFv(Y,Yt,k1,k2,ZM,MFv,kont)

MFv2 = MFv**2 

 
 Call CalculateVPVZVZR(gBL,g2,k1,k2,vR,vL,ZZ,MVZ,MVZR,MVZ2,MVZR2,kont)

Call CalculateVWLmVWRm(g2,k1,k2,vR,vL,ZW,MVWLm,MVWRm,MVWLm2,MVWRm2,PhiW,kont)

Iname = Iname - 1 
 
End Subroutine  TreeMassesSM 
 
 
Subroutine SortGoldstones(MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,               & 
& Mhh,Mhh2,MHpm,MHpm2,MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,MVZR2,PhiW,TW,             & 
& UC,ZDR,ZER,UP,ZUR,ZDL,ZEL,ZUL,ZH,ZM,ZW,ZZ,kont)

Real(dp),Intent(inout) :: MAh(4),MAh2(4),MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),MFv(9),MFv2(9),           & 
& Mhh(4),Mhh2(4),MHpm(4),MHpm2(4),MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,               & 
& MVZR2,PhiW,TW,UC(4,4),UP(4,4),ZH(4,4)

Complex(dp),Intent(inout) :: ZDR(3,3),ZER(3,3),ZUR(3,3),ZDL(3,3),ZEL(3,3),ZUL(3,3),ZM(9,9),ZW(4,4),ZZ(3,3)

Integer, Intent(inout) :: kont 
Integer :: i1, i2, pos 
Real(dp) :: MAhtemp(4) 
Complex(dp) :: ZAhtemp(4,4) 
Real(dp) :: MHpmtemp(4) 
Complex(dp) :: ZHpmtemp(4,4) 


pos = MinLoc(Abs(MAh2-MVZ2*RXiZ),1) 
If (pos.ne.1) Then 
  MAhtemp = MAh2 
  ZAhtemp = UP 
  MAh2(1) = MAhtemp(pos) 
  UP(1,:) = ZAhtemp(pos,:) 
  MAh2(pos) = MAhtemp(1) 
  UP(pos,:) = ZAhtemp(1,:) 
End if 
pos = MinLoc(Abs(MAh2-MVZR2*RXiZR),1) 
If (pos.ne.2) Then 
  MAhtemp = MAh2 
  ZAhtemp = UP 
  MAh2(2) = MAhtemp(pos) 
  UP(2,:) = ZAhtemp(pos,:) 
  MAh2(pos) = MAhtemp(2) 
  UP(pos,:) = ZAhtemp(2,:) 
End if 

 ! Reorder the physical states by their mass 
Do i1=3,4
 pos = Minloc(MAh2(i1:4),1) + i1 -1  
If (pos.ne.i1) Then 
  MAhtemp = MAh2 
  ZAhtemp = UP 
  MAh2(i1) = MAhtemp(pos) 
  UP(i1,:) = ZAhtemp(pos,:) 
  MAh2(pos) = MAhtemp(i1) 
  UP(pos,:) = ZAhtemp(i1,:) 
End if 
End do 
MAh = sqrt(MAh2) 

 
 
pos = MinLoc(Abs(MHpm2-MVWLm2*RXiWLm),1) 
If (pos.ne.1) Then 
  MHpmtemp = MHpm2 
  ZHpmtemp = UC 
  MHpm2(1) = MHpmtemp(pos) 
  UC(1,:) = ZHpmtemp(pos,:) 
  MHpm2(pos) = MHpmtemp(1) 
  UC(pos,:) = ZHpmtemp(1,:) 
End if 
pos = MinLoc(Abs(MHpm2-MVWRm2*RXiWRm),1) 
If (pos.ne.2) Then 
  MHpmtemp = MHpm2 
  ZHpmtemp = UC 
  MHpm2(2) = MHpmtemp(pos) 
  UC(2,:) = ZHpmtemp(pos,:) 
  MHpm2(pos) = MHpmtemp(2) 
  UC(pos,:) = ZHpmtemp(2,:) 
End if 

 ! Reorder the physical states by their mass 
Do i1=3,4
 pos = Minloc(MHpm2(i1:4),1) + i1 -1  
If (pos.ne.i1) Then 
  MHpmtemp = MHpm2 
  ZHpmtemp = UC 
  MHpm2(i1) = MHpmtemp(pos) 
  UC(i1,:) = ZHpmtemp(pos,:) 
  MHpm2(pos) = MHpmtemp(i1) 
  UC(pos,:) = ZHpmtemp(i1,:) 
End if 
End do 
MHpm = sqrt(MHpm2) 

 
 
End subroutine SortGoldstones 


End Module TreeLevelMasses_DLRSM 
 
