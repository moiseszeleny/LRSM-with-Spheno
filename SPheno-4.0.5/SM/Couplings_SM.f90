! ------------------------------------------------------------------------------  
! This file was automatically created by SARAH version 4.15.3 
! SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223,
!           1405.1434, 1411.0675, 1503.03098, 1703.09237, 1706.05372, 1805.07306  
! (c) Florian Staub, Mark Goodsell and Werner Porod 2020  
! ------------------------------------------------------------------------------  
! File created at 15:41 on 18.6.2025   
! ----------------------------------------------------------------------  
 
 
Module Couplings_SM
 
Use Control 
Use Settings 
Use Model_Data_SM 
Use Mathematics, Only: CompareMatrices, Adjungate 
 
Contains 
 
 Subroutine AllCouplingsReallyAll(Lam,vvSM,g1,g2,TW,g3,Yd,ZDL,ZDR,Ye,ZEL,              & 
& ZER,Yu,ZUL,ZUR,cplAhAhhh,cplhhhhhh,cplhhHpcHp,cplAhAhAhAh,cplAhAhhhhh,cplAhAhHpcHp,    & 
& cplhhhhhhhh,cplhhhhHpcHp,cplHpHpcHpcHp,cplAhhhVZ,cplAhHpcVWp,cplAhcHpVWp,              & 
& cplhhHpcVWp,cplhhcHpVWp,cplHpcHpVP,cplHpcHpVZ,cplhhcVWpVWp,cplhhVZVZ,cplHpcVWpVP,      & 
& cplHpcVWpVZ,cplcHpVPVWp,cplcHpVWpVZ,cplAhAhcVWpVWp,cplAhAhVZVZ,cplAhHpcVWpVP,          & 
& cplAhHpcVWpVZ,cplAhcHpVPVWp,cplAhcHpVWpVZ,cplhhhhcVWpVWp,cplhhhhVZVZ,cplhhHpcVWpVP,    & 
& cplhhHpcVWpVZ,cplhhcHpVPVWp,cplhhcHpVWpVZ,cplHpcHpVPVP,cplHpcHpVPVZ,cplHpcHpcVWpVWp,   & 
& cplHpcHpVZVZ,cplVGVGVG,cplcVWpVPVWp,cplcVWpVWpVZ,cplcFdFdAhL,cplcFdFdAhR,              & 
& cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplcFdFdhhL,cplcFdFdhhR,               & 
& cplcFuFdHpL,cplcFuFdHpR,cplcFeFehhL,cplcFeFehhR,cplcFvFeHpL,cplcFvFeHpR,               & 
& cplcFuFuhhL,cplcFuFuhhR,cplcFdFucHpL,cplcFdFucHpR,cplcFeFvcHpL,cplcFeFvcHpR,           & 
& cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,cplcFuFdVWpL,cplcFuFdVWpR,             & 
& cplcFdFdVZL,cplcFdFdVZR,cplcFeFeVPL,cplcFeFeVPR,cplcFvFeVWpL,cplcFvFeVWpR,             & 
& cplcFeFeVZL,cplcFeFeVZR,cplcFuFuVGL,cplcFuFuVGR,cplcFuFuVPL,cplcFuFuVPR,               & 
& cplcFuFuVZL,cplcFuFuVZR,cplcFdFucVWpL,cplcFdFucVWpR,cplcFvFvVZL,cplcFvFvVZR,           & 
& cplcFeFvcVWpL,cplcFeFvcVWpR,cplVGVGVGVG1,cplVGVGVGVG2,cplVGVGVGVG3,cplcVWpVPVPVWp1,    & 
& cplcVWpVPVPVWp2,cplcVWpVPVPVWp3,cplcVWpVPVWpVZ1,cplcVWpVPVWpVZ2,cplcVWpVPVWpVZ3,       & 
& cplcVWpcVWpVWpVWp1,cplcVWpcVWpVWpVWp2,cplcVWpcVWpVWpVWp3,cplcVWpVWpVZVZ1,              & 
& cplcVWpVWpVZVZ2,cplcVWpVWpVZVZ3,cplcgGgGVG,cplcgWpgAVWp,cplcgWCgAcVWp,cplcgWpgWpVP,    & 
& cplcgWpgWpVZ,cplcgAgWpcVWp,cplcgZgWpcVWp,cplcgWCgWCVP,cplcgAgWCVWp,cplcgZgWCVWp,       & 
& cplcgWCgWCVZ,cplcgWpgZVWp,cplcgWCgZcVWp,cplcgWpgWpAh,cplcgWCgWCAh,cplcgZgAhh,          & 
& cplcgWpgAHp,cplcgWCgAcHp,cplcgWpgWphh,cplcgZgWpcHp,cplcgWCgWChh,cplcgZgWCHp,           & 
& cplcgZgZhh,cplcgWpgZHp,cplcgWCgZcHp)

Implicit None 
Real(dp), Intent(in) :: vvSM,g1,g2,TW,g3

Complex(dp), Intent(in) :: Lam,Yd(3,3),ZDL(3,3),ZDR(3,3),Ye(3,3),ZEL(3,3),ZER(3,3),Yu(3,3),ZUL(3,3),ZUR(3,3)

Complex(dp), Intent(out) :: cplAhAhhh,cplhhhhhh,cplhhHpcHp,cplAhAhAhAh,cplAhAhhhhh,cplAhAhHpcHp,cplhhhhhhhh,      & 
& cplhhhhHpcHp,cplHpHpcHpcHp,cplAhhhVZ,cplAhHpcVWp,cplAhcHpVWp,cplhhHpcVWp,              & 
& cplhhcHpVWp,cplHpcHpVP,cplHpcHpVZ,cplhhcVWpVWp,cplhhVZVZ,cplHpcVWpVP,cplHpcVWpVZ,      & 
& cplcHpVPVWp,cplcHpVWpVZ,cplAhAhcVWpVWp,cplAhAhVZVZ,cplAhHpcVWpVP,cplAhHpcVWpVZ,        & 
& cplAhcHpVPVWp,cplAhcHpVWpVZ,cplhhhhcVWpVWp,cplhhhhVZVZ,cplhhHpcVWpVP,cplhhHpcVWpVZ,    & 
& cplhhcHpVPVWp,cplhhcHpVWpVZ,cplHpcHpVPVP,cplHpcHpVPVZ,cplHpcHpcVWpVWp,cplHpcHpVZVZ,    & 
& cplVGVGVG,cplcVWpVPVWp,cplcVWpVWpVZ,cplcFdFdAhL(3,3),cplcFdFdAhR(3,3),cplcFeFeAhL(3,3),& 
& cplcFeFeAhR(3,3),cplcFuFuAhL(3,3),cplcFuFuAhR(3,3),cplcFdFdhhL(3,3),cplcFdFdhhR(3,3),  & 
& cplcFuFdHpL(3,3),cplcFuFdHpR(3,3),cplcFeFehhL(3,3),cplcFeFehhR(3,3),cplcFvFeHpL(3,3),  & 
& cplcFvFeHpR(3,3),cplcFuFuhhL(3,3),cplcFuFuhhR(3,3),cplcFdFucHpL(3,3),cplcFdFucHpR(3,3),& 
& cplcFeFvcHpL(3,3),cplcFeFvcHpR(3,3),cplcFdFdVGL(3,3),cplcFdFdVGR(3,3),cplcFdFdVPL(3,3),& 
& cplcFdFdVPR(3,3),cplcFuFdVWpL(3,3),cplcFuFdVWpR(3,3),cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),& 
& cplcFeFeVPL(3,3),cplcFeFeVPR(3,3),cplcFvFeVWpL(3,3),cplcFvFeVWpR(3,3),cplcFeFeVZL(3,3),& 
& cplcFeFeVZR(3,3),cplcFuFuVGL(3,3),cplcFuFuVGR(3,3),cplcFuFuVPL(3,3),cplcFuFuVPR(3,3),  & 
& cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),cplcFdFucVWpL(3,3),cplcFdFucVWpR(3,3),               & 
& cplcFvFvVZL(3,3),cplcFvFvVZR(3,3),cplcFeFvcVWpL(3,3),cplcFeFvcVWpR(3,3),               & 
& cplVGVGVGVG1,cplVGVGVGVG2,cplVGVGVGVG3,cplcVWpVPVPVWp1,cplcVWpVPVPVWp2,cplcVWpVPVPVWp3,& 
& cplcVWpVPVWpVZ1,cplcVWpVPVWpVZ2,cplcVWpVPVWpVZ3,cplcVWpcVWpVWpVWp1,cplcVWpcVWpVWpVWp2, & 
& cplcVWpcVWpVWpVWp3,cplcVWpVWpVZVZ1,cplcVWpVWpVZVZ2,cplcVWpVWpVZVZ3,cplcgGgGVG,         & 
& cplcgWpgAVWp,cplcgWCgAcVWp,cplcgWpgWpVP,cplcgWpgWpVZ,cplcgAgWpcVWp,cplcgZgWpcVWp,      & 
& cplcgWCgWCVP,cplcgAgWCVWp,cplcgZgWCVWp,cplcgWCgWCVZ,cplcgWpgZVWp,cplcgWCgZcVWp,        & 
& cplcgWpgWpAh,cplcgWCgWCAh,cplcgZgAhh,cplcgWpgAHp,cplcgWCgAcHp,cplcgWpgWphh,            & 
& cplcgZgWpcHp,cplcgWCgWChh,cplcgZgWCHp,cplcgZgZhh,cplcgWpgZHp,cplcgWCgZcHp

Integer :: gt1, gt2, gt3, gt4, ct1, ct2, ct3, ct4

Iname = Iname + 1 
NameOfUnit(Iname) = 'AllCouplingsReallyAll'
 
cplAhAhhh = 0._dp 
Call CouplingAhAhhhT(Lam,vvSM,cplAhAhhh)



cplhhhhhh = 0._dp 
Call CouplinghhhhhhT(Lam,vvSM,cplhhhhhh)



cplhhHpcHp = 0._dp 
Call CouplinghhHpcHpT(Lam,vvSM,cplhhHpcHp)



cplAhAhAhAh = 0._dp 
Call CouplingAhAhAhAhT(Lam,cplAhAhAhAh)



cplAhAhhhhh = 0._dp 
Call CouplingAhAhhhhhT(Lam,cplAhAhhhhh)



cplAhAhHpcHp = 0._dp 
Call CouplingAhAhHpcHpT(Lam,cplAhAhHpcHp)



cplhhhhhhhh = 0._dp 
Call CouplinghhhhhhhhT(Lam,cplhhhhhhhh)



cplhhhhHpcHp = 0._dp 
Call CouplinghhhhHpcHpT(Lam,cplhhhhHpcHp)



cplHpHpcHpcHp = 0._dp 
Call CouplingHpHpcHpcHpT(Lam,cplHpHpcHpcHp)



cplAhhhVZ = 0._dp 
Call CouplingAhhhVZT(g1,g2,TW,cplAhhhVZ)



cplAhHpcVWp = 0._dp 
Call CouplingAhHpcVWpT(g2,cplAhHpcVWp)



cplAhcHpVWp = 0._dp 
Call CouplingAhcHpVWpT(g2,cplAhcHpVWp)



cplhhHpcVWp = 0._dp 
Call CouplinghhHpcVWpT(g2,cplhhHpcVWp)



cplhhcHpVWp = 0._dp 
Call CouplinghhcHpVWpT(g2,cplhhcHpVWp)



cplHpcHpVP = 0._dp 
Call CouplingHpcHpVPT(g1,g2,TW,cplHpcHpVP)



cplHpcHpVZ = 0._dp 
Call CouplingHpcHpVZT(g1,g2,TW,cplHpcHpVZ)



cplhhcVWpVWp = 0._dp 
Call CouplinghhcVWpVWpT(g2,vvSM,cplhhcVWpVWp)



cplhhVZVZ = 0._dp 
Call CouplinghhVZVZT(g1,g2,vvSM,TW,cplhhVZVZ)



cplHpcVWpVP = 0._dp 
Call CouplingHpcVWpVPT(g1,g2,vvSM,TW,cplHpcVWpVP)



cplHpcVWpVZ = 0._dp 
Call CouplingHpcVWpVZT(g1,g2,vvSM,TW,cplHpcVWpVZ)



cplcHpVPVWp = 0._dp 
Call CouplingcHpVPVWpT(g1,g2,vvSM,TW,cplcHpVPVWp)



cplcHpVWpVZ = 0._dp 
Call CouplingcHpVWpVZT(g1,g2,vvSM,TW,cplcHpVWpVZ)



cplAhAhcVWpVWp = 0._dp 
Call CouplingAhAhcVWpVWpT(g2,cplAhAhcVWpVWp)



cplAhAhVZVZ = 0._dp 
Call CouplingAhAhVZVZT(g1,g2,TW,cplAhAhVZVZ)



cplAhHpcVWpVP = 0._dp 
Call CouplingAhHpcVWpVPT(g1,g2,TW,cplAhHpcVWpVP)



cplAhHpcVWpVZ = 0._dp 
Call CouplingAhHpcVWpVZT(g1,g2,TW,cplAhHpcVWpVZ)



cplAhcHpVPVWp = 0._dp 
Call CouplingAhcHpVPVWpT(g1,g2,TW,cplAhcHpVPVWp)



cplAhcHpVWpVZ = 0._dp 
Call CouplingAhcHpVWpVZT(g1,g2,TW,cplAhcHpVWpVZ)



cplhhhhcVWpVWp = 0._dp 
Call CouplinghhhhcVWpVWpT(g2,cplhhhhcVWpVWp)



cplhhhhVZVZ = 0._dp 
Call CouplinghhhhVZVZT(g1,g2,TW,cplhhhhVZVZ)



cplhhHpcVWpVP = 0._dp 
Call CouplinghhHpcVWpVPT(g1,g2,TW,cplhhHpcVWpVP)



cplhhHpcVWpVZ = 0._dp 
Call CouplinghhHpcVWpVZT(g1,g2,TW,cplhhHpcVWpVZ)



cplhhcHpVPVWp = 0._dp 
Call CouplinghhcHpVPVWpT(g1,g2,TW,cplhhcHpVPVWp)



cplhhcHpVWpVZ = 0._dp 
Call CouplinghhcHpVWpVZT(g1,g2,TW,cplhhcHpVWpVZ)



cplHpcHpVPVP = 0._dp 
Call CouplingHpcHpVPVPT(g1,g2,TW,cplHpcHpVPVP)



cplHpcHpVPVZ = 0._dp 
Call CouplingHpcHpVPVZT(g1,g2,TW,cplHpcHpVPVZ)



cplHpcHpcVWpVWp = 0._dp 
Call CouplingHpcHpcVWpVWpT(g2,cplHpcHpcVWpVWp)



cplHpcHpVZVZ = 0._dp 
Call CouplingHpcHpVZVZT(g1,g2,TW,cplHpcHpVZVZ)



cplVGVGVG = 0._dp 
Call CouplingVGVGVGT(g3,cplVGVGVG)



cplcVWpVPVWp = 0._dp 
Call CouplingcVWpVPVWpT(g2,TW,cplcVWpVPVWp)



cplcVWpVWpVZ = 0._dp 
Call CouplingcVWpVWpVZT(g2,TW,cplcVWpVWpVZ)



cplcFdFdAhL = 0._dp 
cplcFdFdAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFdAhT(gt1,gt2,Yd,ZDL,ZDR,cplcFdFdAhL(gt1,gt2),cplcFdFdAhR(gt1,gt2))

 End Do 
End Do 


cplcFeFeAhL = 0._dp 
cplcFeFeAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFeFeAhT(gt1,gt2,Ye,ZEL,ZER,cplcFeFeAhL(gt1,gt2),cplcFeFeAhR(gt1,gt2))

 End Do 
End Do 


cplcFuFuAhL = 0._dp 
cplcFuFuAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFuAhT(gt1,gt2,Yu,ZUL,ZUR,cplcFuFuAhL(gt1,gt2),cplcFuFuAhR(gt1,gt2))

 End Do 
End Do 


cplcFdFdhhL = 0._dp 
cplcFdFdhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFdhhT(gt1,gt2,Yd,ZDL,ZDR,cplcFdFdhhL(gt1,gt2),cplcFdFdhhR(gt1,gt2))

 End Do 
End Do 


cplcFuFdHpL = 0._dp 
cplcFuFdHpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFdHpT(gt1,gt2,Yu,Yd,ZDL,ZDR,ZUL,ZUR,cplcFuFdHpL(gt1,gt2)              & 
& ,cplcFuFdHpR(gt1,gt2))

 End Do 
End Do 


cplcFeFehhL = 0._dp 
cplcFeFehhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFeFehhT(gt1,gt2,Ye,ZEL,ZER,cplcFeFehhL(gt1,gt2),cplcFeFehhR(gt1,gt2))

 End Do 
End Do 


cplcFvFeHpL = 0._dp 
cplcFvFeHpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFvFeHpT(gt1,gt2,Ye,ZER,cplcFvFeHpL(gt1,gt2),cplcFvFeHpR(gt1,gt2))

 End Do 
End Do 


cplcFuFuhhL = 0._dp 
cplcFuFuhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFuhhT(gt1,gt2,Yu,ZUL,ZUR,cplcFuFuhhL(gt1,gt2),cplcFuFuhhR(gt1,gt2))

 End Do 
End Do 


cplcFdFucHpL = 0._dp 
cplcFdFucHpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFucHpT(gt1,gt2,Yu,Yd,ZDL,ZDR,ZUL,ZUR,cplcFdFucHpL(gt1,gt2)            & 
& ,cplcFdFucHpR(gt1,gt2))

 End Do 
End Do 


cplcFeFvcHpL = 0._dp 
cplcFeFvcHpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFeFvcHpT(gt1,gt2,Ye,ZER,cplcFeFvcHpL(gt1,gt2),cplcFeFvcHpR(gt1,gt2))

 End Do 
End Do 


cplcFdFdVGL = 0._dp 
cplcFdFdVGR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFdVGT(gt1,gt2,g3,cplcFdFdVGL(gt1,gt2),cplcFdFdVGR(gt1,gt2))

 End Do 
End Do 


cplcFdFdVPL = 0._dp 
cplcFdFdVPR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFdVPT(gt1,gt2,g1,g2,TW,cplcFdFdVPL(gt1,gt2),cplcFdFdVPR(gt1,gt2))

 End Do 
End Do 


cplcFuFdVWpL = 0._dp 
cplcFuFdVWpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFdVWpT(gt1,gt2,g2,ZDL,ZUL,cplcFuFdVWpL(gt1,gt2),cplcFuFdVWpR(gt1,gt2))

 End Do 
End Do 


cplcFdFdVZL = 0._dp 
cplcFdFdVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFdVZT(gt1,gt2,g1,g2,TW,cplcFdFdVZL(gt1,gt2),cplcFdFdVZR(gt1,gt2))

 End Do 
End Do 


cplcFeFeVPL = 0._dp 
cplcFeFeVPR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFeFeVPT(gt1,gt2,g1,g2,TW,cplcFeFeVPL(gt1,gt2),cplcFeFeVPR(gt1,gt2))

 End Do 
End Do 


cplcFvFeVWpL = 0._dp 
cplcFvFeVWpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFvFeVWpT(gt1,gt2,g2,ZEL,cplcFvFeVWpL(gt1,gt2),cplcFvFeVWpR(gt1,gt2))

 End Do 
End Do 


cplcFeFeVZL = 0._dp 
cplcFeFeVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFeFeVZT(gt1,gt2,g1,g2,TW,cplcFeFeVZL(gt1,gt2),cplcFeFeVZR(gt1,gt2))

 End Do 
End Do 


cplcFuFuVGL = 0._dp 
cplcFuFuVGR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFuVGT(gt1,gt2,g3,cplcFuFuVGL(gt1,gt2),cplcFuFuVGR(gt1,gt2))

 End Do 
End Do 


cplcFuFuVPL = 0._dp 
cplcFuFuVPR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFuVPT(gt1,gt2,g1,g2,TW,cplcFuFuVPL(gt1,gt2),cplcFuFuVPR(gt1,gt2))

 End Do 
End Do 


cplcFuFuVZL = 0._dp 
cplcFuFuVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFuVZT(gt1,gt2,g1,g2,TW,cplcFuFuVZL(gt1,gt2),cplcFuFuVZR(gt1,gt2))

 End Do 
End Do 


cplcFdFucVWpL = 0._dp 
cplcFdFucVWpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFucVWpT(gt1,gt2,g2,ZDL,ZUL,cplcFdFucVWpL(gt1,gt2),cplcFdFucVWpR(gt1,gt2))

 End Do 
End Do 


cplcFvFvVZL = 0._dp 
cplcFvFvVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFvFvVZT(gt1,gt2,g1,g2,TW,cplcFvFvVZL(gt1,gt2),cplcFvFvVZR(gt1,gt2))

 End Do 
End Do 


cplcFeFvcVWpL = 0._dp 
cplcFeFvcVWpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFeFvcVWpT(gt1,gt2,g2,ZEL,cplcFeFvcVWpL(gt1,gt2),cplcFeFvcVWpR(gt1,gt2))

 End Do 
End Do 


cplVGVGVGVG1 = 0._dp 
cplVGVGVGVG2 = 0._dp 
cplVGVGVGVG3 = 0._dp 
Call CouplingVGVGVGVGT(g3,cplVGVGVGVG1,cplVGVGVGVG2,cplVGVGVGVG3)



cplcVWpVPVPVWp1 = 0._dp 
cplcVWpVPVPVWp2 = 0._dp 
cplcVWpVPVPVWp3 = 0._dp 
Call CouplingcVWpVPVPVWpT(g2,TW,cplcVWpVPVPVWp1,cplcVWpVPVPVWp2,cplcVWpVPVPVWp3)



cplcVWpVPVWpVZ1 = 0._dp 
cplcVWpVPVWpVZ2 = 0._dp 
cplcVWpVPVWpVZ3 = 0._dp 
Call CouplingcVWpVPVWpVZT(g2,TW,cplcVWpVPVWpVZ1,cplcVWpVPVWpVZ2,cplcVWpVPVWpVZ3)



cplcVWpcVWpVWpVWp1 = 0._dp 
cplcVWpcVWpVWpVWp2 = 0._dp 
cplcVWpcVWpVWpVWp3 = 0._dp 
Call CouplingcVWpcVWpVWpVWpT(g2,cplcVWpcVWpVWpVWp1,cplcVWpcVWpVWpVWp2,cplcVWpcVWpVWpVWp3)



cplcVWpVWpVZVZ1 = 0._dp 
cplcVWpVWpVZVZ2 = 0._dp 
cplcVWpVWpVZVZ3 = 0._dp 
Call CouplingcVWpVWpVZVZT(g2,TW,cplcVWpVWpVZVZ1,cplcVWpVWpVZVZ2,cplcVWpVWpVZVZ3)



cplcgGgGVG = 0._dp 
Call CouplingcgGgGVGT(g3,cplcgGgGVG)



cplcgWpgAVWp = 0._dp 
Call CouplingcgWpgAVWpT(g2,TW,cplcgWpgAVWp)



cplcgWCgAcVWp = 0._dp 
Call CouplingcgWCgAcVWpT(g2,TW,cplcgWCgAcVWp)



cplcgWpgWpVP = 0._dp 
Call CouplingcgWpgWpVPT(g2,TW,cplcgWpgWpVP)



cplcgWpgWpVZ = 0._dp 
Call CouplingcgWpgWpVZT(g2,TW,cplcgWpgWpVZ)



cplcgAgWpcVWp = 0._dp 
Call CouplingcgAgWpcVWpT(g2,TW,cplcgAgWpcVWp)



cplcgZgWpcVWp = 0._dp 
Call CouplingcgZgWpcVWpT(g2,TW,cplcgZgWpcVWp)



cplcgWCgWCVP = 0._dp 
Call CouplingcgWCgWCVPT(g2,TW,cplcgWCgWCVP)



cplcgAgWCVWp = 0._dp 
Call CouplingcgAgWCVWpT(g2,TW,cplcgAgWCVWp)



cplcgZgWCVWp = 0._dp 
Call CouplingcgZgWCVWpT(g2,TW,cplcgZgWCVWp)



cplcgWCgWCVZ = 0._dp 
Call CouplingcgWCgWCVZT(g2,TW,cplcgWCgWCVZ)



cplcgWpgZVWp = 0._dp 
Call CouplingcgWpgZVWpT(g2,TW,cplcgWpgZVWp)



cplcgWCgZcVWp = 0._dp 
Call CouplingcgWCgZcVWpT(g2,TW,cplcgWCgZcVWp)



cplcgWpgWpAh = 0._dp 
Call CouplingcgWpgWpAhT(g2,vvSM,cplcgWpgWpAh)



cplcgWCgWCAh = 0._dp 
Call CouplingcgWCgWCAhT(g2,vvSM,cplcgWCgWCAh)



cplcgZgAhh = 0._dp 
Call CouplingcgZgAhhT(g1,g2,vvSM,TW,cplcgZgAhh)



cplcgWpgAHp = 0._dp 
Call CouplingcgWpgAHpT(g1,g2,vvSM,TW,cplcgWpgAHp)



cplcgWCgAcHp = 0._dp 
Call CouplingcgWCgAcHpT(g1,g2,vvSM,TW,cplcgWCgAcHp)



cplcgWpgWphh = 0._dp 
Call CouplingcgWpgWphhT(g2,vvSM,cplcgWpgWphh)



cplcgZgWpcHp = 0._dp 
Call CouplingcgZgWpcHpT(g1,g2,vvSM,TW,cplcgZgWpcHp)



cplcgWCgWChh = 0._dp 
Call CouplingcgWCgWChhT(g2,vvSM,cplcgWCgWChh)



cplcgZgWCHp = 0._dp 
Call CouplingcgZgWCHpT(g1,g2,vvSM,TW,cplcgZgWCHp)



cplcgZgZhh = 0._dp 
Call CouplingcgZgZhhT(g1,g2,vvSM,TW,cplcgZgZhh)



cplcgWpgZHp = 0._dp 
Call CouplingcgWpgZHpT(g1,g2,vvSM,TW,cplcgWpgZHp)



cplcgWCgZcHp = 0._dp 
Call CouplingcgWCgZcHpT(g1,g2,vvSM,TW,cplcgWCgZcHp)



Iname = Iname - 1 
End Subroutine AllCouplingsReallyAll

Subroutine AllCouplings(Lam,vvSM,g1,g2,TW,g3,Yd,ZDL,ZDR,Ye,ZEL,ZER,Yu,ZUL,            & 
& ZUR,cplAhAhhh,cplhhhhhh,cplhhHpcHp,cplAhhhVZ,cplAhHpcVWp,cplAhcHpVWp,cplhhHpcVWp,      & 
& cplhhcHpVWp,cplHpcHpVP,cplHpcHpVZ,cplhhcVWpVWp,cplhhVZVZ,cplHpcVWpVP,cplHpcVWpVZ,      & 
& cplcHpVPVWp,cplcHpVWpVZ,cplVGVGVG,cplcVWpVPVWp,cplcVWpVWpVZ,cplcFdFdAhL,               & 
& cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplcFdFdhhL,               & 
& cplcFdFdhhR,cplcFuFdHpL,cplcFuFdHpR,cplcFeFehhL,cplcFeFehhR,cplcFvFeHpL,               & 
& cplcFvFeHpR,cplcFuFuhhL,cplcFuFuhhR,cplcFdFucHpL,cplcFdFucHpR,cplcFeFvcHpL,            & 
& cplcFeFvcHpR,cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,cplcFuFdVWpL,             & 
& cplcFuFdVWpR,cplcFdFdVZL,cplcFdFdVZR,cplcFeFeVPL,cplcFeFeVPR,cplcFvFeVWpL,             & 
& cplcFvFeVWpR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuVGL,cplcFuFuVGR,cplcFuFuVPL,              & 
& cplcFuFuVPR,cplcFuFuVZL,cplcFuFuVZR,cplcFdFucVWpL,cplcFdFucVWpR,cplcFvFvVZL,           & 
& cplcFvFvVZR,cplcFeFvcVWpL,cplcFeFvcVWpR)

Implicit None 
Real(dp), Intent(in) :: vvSM,g1,g2,TW,g3

Complex(dp), Intent(in) :: Lam,Yd(3,3),ZDL(3,3),ZDR(3,3),Ye(3,3),ZEL(3,3),ZER(3,3),Yu(3,3),ZUL(3,3),ZUR(3,3)

Complex(dp), Intent(out) :: cplAhAhhh,cplhhhhhh,cplhhHpcHp,cplAhhhVZ,cplAhHpcVWp,cplAhcHpVWp,cplhhHpcVWp,         & 
& cplhhcHpVWp,cplHpcHpVP,cplHpcHpVZ,cplhhcVWpVWp,cplhhVZVZ,cplHpcVWpVP,cplHpcVWpVZ,      & 
& cplcHpVPVWp,cplcHpVWpVZ,cplVGVGVG,cplcVWpVPVWp,cplcVWpVWpVZ,cplcFdFdAhL(3,3),          & 
& cplcFdFdAhR(3,3),cplcFeFeAhL(3,3),cplcFeFeAhR(3,3),cplcFuFuAhL(3,3),cplcFuFuAhR(3,3),  & 
& cplcFdFdhhL(3,3),cplcFdFdhhR(3,3),cplcFuFdHpL(3,3),cplcFuFdHpR(3,3),cplcFeFehhL(3,3),  & 
& cplcFeFehhR(3,3),cplcFvFeHpL(3,3),cplcFvFeHpR(3,3),cplcFuFuhhL(3,3),cplcFuFuhhR(3,3),  & 
& cplcFdFucHpL(3,3),cplcFdFucHpR(3,3),cplcFeFvcHpL(3,3),cplcFeFvcHpR(3,3),               & 
& cplcFdFdVGL(3,3),cplcFdFdVGR(3,3),cplcFdFdVPL(3,3),cplcFdFdVPR(3,3),cplcFuFdVWpL(3,3), & 
& cplcFuFdVWpR(3,3),cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),cplcFeFeVPL(3,3),cplcFeFeVPR(3,3), & 
& cplcFvFeVWpL(3,3),cplcFvFeVWpR(3,3),cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),cplcFuFuVGL(3,3),& 
& cplcFuFuVGR(3,3),cplcFuFuVPL(3,3),cplcFuFuVPR(3,3),cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),  & 
& cplcFdFucVWpL(3,3),cplcFdFucVWpR(3,3),cplcFvFvVZL(3,3),cplcFvFvVZR(3,3),               & 
& cplcFeFvcVWpL(3,3),cplcFeFvcVWpR(3,3)

Integer :: gt1, gt2, gt3, gt4, ct1, ct2, ct3, ct4

Iname = Iname + 1 
NameOfUnit(Iname) = 'AllCouplings'
 
cplAhAhhh = 0._dp 
Call CouplingAhAhhhT(Lam,vvSM,cplAhAhhh)



cplhhhhhh = 0._dp 
Call CouplinghhhhhhT(Lam,vvSM,cplhhhhhh)



cplhhHpcHp = 0._dp 
Call CouplinghhHpcHpT(Lam,vvSM,cplhhHpcHp)



cplAhhhVZ = 0._dp 
Call CouplingAhhhVZT(g1,g2,TW,cplAhhhVZ)



cplAhHpcVWp = 0._dp 
Call CouplingAhHpcVWpT(g2,cplAhHpcVWp)



cplAhcHpVWp = 0._dp 
Call CouplingAhcHpVWpT(g2,cplAhcHpVWp)



cplhhHpcVWp = 0._dp 
Call CouplinghhHpcVWpT(g2,cplhhHpcVWp)



cplhhcHpVWp = 0._dp 
Call CouplinghhcHpVWpT(g2,cplhhcHpVWp)



cplHpcHpVP = 0._dp 
Call CouplingHpcHpVPT(g1,g2,TW,cplHpcHpVP)



cplHpcHpVZ = 0._dp 
Call CouplingHpcHpVZT(g1,g2,TW,cplHpcHpVZ)



cplhhcVWpVWp = 0._dp 
Call CouplinghhcVWpVWpT(g2,vvSM,cplhhcVWpVWp)



cplhhVZVZ = 0._dp 
Call CouplinghhVZVZT(g1,g2,vvSM,TW,cplhhVZVZ)



cplHpcVWpVP = 0._dp 
Call CouplingHpcVWpVPT(g1,g2,vvSM,TW,cplHpcVWpVP)



cplHpcVWpVZ = 0._dp 
Call CouplingHpcVWpVZT(g1,g2,vvSM,TW,cplHpcVWpVZ)



cplcHpVPVWp = 0._dp 
Call CouplingcHpVPVWpT(g1,g2,vvSM,TW,cplcHpVPVWp)



cplcHpVWpVZ = 0._dp 
Call CouplingcHpVWpVZT(g1,g2,vvSM,TW,cplcHpVWpVZ)



cplVGVGVG = 0._dp 
Call CouplingVGVGVGT(g3,cplVGVGVG)



cplcVWpVPVWp = 0._dp 
Call CouplingcVWpVPVWpT(g2,TW,cplcVWpVPVWp)



cplcVWpVWpVZ = 0._dp 
Call CouplingcVWpVWpVZT(g2,TW,cplcVWpVWpVZ)



cplcFdFdAhL = 0._dp 
cplcFdFdAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFdAhT(gt1,gt2,Yd,ZDL,ZDR,cplcFdFdAhL(gt1,gt2),cplcFdFdAhR(gt1,gt2))

 End Do 
End Do 


cplcFeFeAhL = 0._dp 
cplcFeFeAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFeFeAhT(gt1,gt2,Ye,ZEL,ZER,cplcFeFeAhL(gt1,gt2),cplcFeFeAhR(gt1,gt2))

 End Do 
End Do 


cplcFuFuAhL = 0._dp 
cplcFuFuAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFuAhT(gt1,gt2,Yu,ZUL,ZUR,cplcFuFuAhL(gt1,gt2),cplcFuFuAhR(gt1,gt2))

 End Do 
End Do 


cplcFdFdhhL = 0._dp 
cplcFdFdhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFdhhT(gt1,gt2,Yd,ZDL,ZDR,cplcFdFdhhL(gt1,gt2),cplcFdFdhhR(gt1,gt2))

 End Do 
End Do 


cplcFuFdHpL = 0._dp 
cplcFuFdHpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFdHpT(gt1,gt2,Yu,Yd,ZDL,ZDR,ZUL,ZUR,cplcFuFdHpL(gt1,gt2)              & 
& ,cplcFuFdHpR(gt1,gt2))

 End Do 
End Do 


cplcFeFehhL = 0._dp 
cplcFeFehhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFeFehhT(gt1,gt2,Ye,ZEL,ZER,cplcFeFehhL(gt1,gt2),cplcFeFehhR(gt1,gt2))

 End Do 
End Do 


cplcFvFeHpL = 0._dp 
cplcFvFeHpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFvFeHpT(gt1,gt2,Ye,ZER,cplcFvFeHpL(gt1,gt2),cplcFvFeHpR(gt1,gt2))

 End Do 
End Do 


cplcFuFuhhL = 0._dp 
cplcFuFuhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFuhhT(gt1,gt2,Yu,ZUL,ZUR,cplcFuFuhhL(gt1,gt2),cplcFuFuhhR(gt1,gt2))

 End Do 
End Do 


cplcFdFucHpL = 0._dp 
cplcFdFucHpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFucHpT(gt1,gt2,Yu,Yd,ZDL,ZDR,ZUL,ZUR,cplcFdFucHpL(gt1,gt2)            & 
& ,cplcFdFucHpR(gt1,gt2))

 End Do 
End Do 


cplcFeFvcHpL = 0._dp 
cplcFeFvcHpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFeFvcHpT(gt1,gt2,Ye,ZER,cplcFeFvcHpL(gt1,gt2),cplcFeFvcHpR(gt1,gt2))

 End Do 
End Do 


cplcFdFdVGL = 0._dp 
cplcFdFdVGR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFdVGT(gt1,gt2,g3,cplcFdFdVGL(gt1,gt2),cplcFdFdVGR(gt1,gt2))

 End Do 
End Do 


cplcFdFdVPL = 0._dp 
cplcFdFdVPR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFdVPT(gt1,gt2,g1,g2,TW,cplcFdFdVPL(gt1,gt2),cplcFdFdVPR(gt1,gt2))

 End Do 
End Do 


cplcFuFdVWpL = 0._dp 
cplcFuFdVWpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFdVWpT(gt1,gt2,g2,ZDL,ZUL,cplcFuFdVWpL(gt1,gt2),cplcFuFdVWpR(gt1,gt2))

 End Do 
End Do 


cplcFdFdVZL = 0._dp 
cplcFdFdVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFdVZT(gt1,gt2,g1,g2,TW,cplcFdFdVZL(gt1,gt2),cplcFdFdVZR(gt1,gt2))

 End Do 
End Do 


cplcFeFeVPL = 0._dp 
cplcFeFeVPR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFeFeVPT(gt1,gt2,g1,g2,TW,cplcFeFeVPL(gt1,gt2),cplcFeFeVPR(gt1,gt2))

 End Do 
End Do 


cplcFvFeVWpL = 0._dp 
cplcFvFeVWpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFvFeVWpT(gt1,gt2,g2,ZEL,cplcFvFeVWpL(gt1,gt2),cplcFvFeVWpR(gt1,gt2))

 End Do 
End Do 


cplcFeFeVZL = 0._dp 
cplcFeFeVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFeFeVZT(gt1,gt2,g1,g2,TW,cplcFeFeVZL(gt1,gt2),cplcFeFeVZR(gt1,gt2))

 End Do 
End Do 


cplcFuFuVGL = 0._dp 
cplcFuFuVGR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFuVGT(gt1,gt2,g3,cplcFuFuVGL(gt1,gt2),cplcFuFuVGR(gt1,gt2))

 End Do 
End Do 


cplcFuFuVPL = 0._dp 
cplcFuFuVPR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFuVPT(gt1,gt2,g1,g2,TW,cplcFuFuVPL(gt1,gt2),cplcFuFuVPR(gt1,gt2))

 End Do 
End Do 


cplcFuFuVZL = 0._dp 
cplcFuFuVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFuVZT(gt1,gt2,g1,g2,TW,cplcFuFuVZL(gt1,gt2),cplcFuFuVZR(gt1,gt2))

 End Do 
End Do 


cplcFdFucVWpL = 0._dp 
cplcFdFucVWpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFucVWpT(gt1,gt2,g2,ZDL,ZUL,cplcFdFucVWpL(gt1,gt2),cplcFdFucVWpR(gt1,gt2))

 End Do 
End Do 


cplcFvFvVZL = 0._dp 
cplcFvFvVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFvFvVZT(gt1,gt2,g1,g2,TW,cplcFvFvVZL(gt1,gt2),cplcFvFvVZR(gt1,gt2))

 End Do 
End Do 


cplcFeFvcVWpL = 0._dp 
cplcFeFvcVWpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFeFvcVWpT(gt1,gt2,g2,ZEL,cplcFeFvcVWpL(gt1,gt2),cplcFeFvcVWpR(gt1,gt2))

 End Do 
End Do 


Iname = Iname - 1 
End Subroutine AllCouplings

Subroutine CouplingAhAhhhT(Lam,vvSM,res)

Implicit None 

Real(dp), Intent(in) :: vvSM

Complex(dp), Intent(in) :: Lam

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhhh' 
 
res = 0._dp 
res = res-(vvSM*Lam)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhhhT  
 
 
Subroutine CouplinghhhhhhT(Lam,vvSM,res)

Implicit None 

Real(dp), Intent(in) :: vvSM

Complex(dp), Intent(in) :: Lam

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'Couplinghhhhhh' 
 
res = 0._dp 
res = res-3*vvSM*Lam
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhhhhhT  
 
 
Subroutine CouplinghhHpcHpT(Lam,vvSM,res)

Implicit None 

Real(dp), Intent(in) :: vvSM

Complex(dp), Intent(in) :: Lam

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhHpcHp' 
 
res = 0._dp 
res = res-(vvSM*Lam)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhHpcHpT  
 
 
Subroutine CouplingAhAhAhAhT(Lam,res)

Implicit None 

Complex(dp), Intent(in) :: Lam

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhAhAh' 
 
res = 0._dp 
res = res-3._dp*(Lam)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhAhAhT  
 
 
Subroutine CouplingAhAhhhhhT(Lam,res)

Implicit None 

Complex(dp), Intent(in) :: Lam

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhhhhh' 
 
res = 0._dp 
res = res-1._dp*(Lam)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhhhhhT  
 
 
Subroutine CouplingAhAhHpcHpT(Lam,res)

Implicit None 

Complex(dp), Intent(in) :: Lam

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhHpcHp' 
 
res = 0._dp 
res = res-1._dp*(Lam)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhHpcHpT  
 
 
Subroutine CouplinghhhhhhhhT(Lam,res)

Implicit None 

Complex(dp), Intent(in) :: Lam

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'Couplinghhhhhhhh' 
 
res = 0._dp 
res = res-3._dp*(Lam)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhhhhhhhT  
 
 
Subroutine CouplinghhhhHpcHpT(Lam,res)

Implicit None 

Complex(dp), Intent(in) :: Lam

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhhhHpcHp' 
 
res = 0._dp 
res = res-1._dp*(Lam)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhhhHpcHpT  
 
 
Subroutine CouplingHpHpcHpcHpT(Lam,res)

Implicit None 

Complex(dp), Intent(in) :: Lam

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingHpHpcHpcHp' 
 
res = 0._dp 
res = res-2._dp*(Lam)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingHpHpcHpcHpT  
 
 
Subroutine CouplingAhhhVZT(g1,g2,TW,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhhhVZ' 
 
res = 0._dp 
res = res+(g2*Cos(TW))/2._dp
res = res+(g1*Sin(TW))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhhhVZT  
 
 
Subroutine CouplingAhHpcVWpT(g2,res)

Implicit None 

Real(dp), Intent(in) :: g2

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhHpcVWp' 
 
res = 0._dp 
res = res-1._dp/2._dp*g2
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhHpcVWpT  
 
 
Subroutine CouplingAhcHpVWpT(g2,res)

Implicit None 

Real(dp), Intent(in) :: g2

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhcHpVWp' 
 
res = 0._dp 
res = res-1._dp/2._dp*g2
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhcHpVWpT  
 
 
Subroutine CouplinghhHpcVWpT(g2,res)

Implicit None 

Real(dp), Intent(in) :: g2

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhHpcVWp' 
 
res = 0._dp 
res = res-1._dp/2._dp*g2
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhHpcVWpT  
 
 
Subroutine CouplinghhcHpVWpT(g2,res)

Implicit None 

Real(dp), Intent(in) :: g2

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhcHpVWp' 
 
res = 0._dp 
res = res+g2/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhcHpVWpT  
 
 
Subroutine CouplingHpcHpVPT(g1,g2,TW,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingHpcHpVP' 
 
res = 0._dp 
res = res+(g1*Cos(TW))/2._dp
res = res+(g2*Sin(TW))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingHpcHpVPT  
 
 
Subroutine CouplingHpcHpVZT(g1,g2,TW,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingHpcHpVZ' 
 
res = 0._dp 
res = res+(g2*Cos(TW))/2._dp
res = res-1._dp/2._dp*(g1*Sin(TW))
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingHpcHpVZT  
 
 
Subroutine CouplinghhcVWpVWpT(g2,vvSM,res)

Implicit None 

Real(dp), Intent(in) :: g2,vvSM

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhcVWpVWp' 
 
res = 0._dp 
res = res+(g2**2*vvSM)/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhcVWpVWpT  
 
 
Subroutine CouplinghhVZVZT(g1,g2,vvSM,TW,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,vvSM,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhVZVZ' 
 
res = 0._dp 
res = res+(g2**2*vvSM*Cos(TW)**2)/2._dp
res = res+g1*g2*vvSM*Cos(TW)*Sin(TW)
res = res+(g1**2*vvSM*Sin(TW)**2)/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhVZVZT  
 
 
Subroutine CouplingHpcVWpVPT(g1,g2,vvSM,TW,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,vvSM,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingHpcVWpVP' 
 
res = 0._dp 
res = res+(g1*g2*vvSM*Cos(TW))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingHpcVWpVPT  
 
 
Subroutine CouplingHpcVWpVZT(g1,g2,vvSM,TW,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,vvSM,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingHpcVWpVZ' 
 
res = 0._dp 
res = res-1._dp/2._dp*(g1*g2*vvSM*Sin(TW))
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingHpcVWpVZT  
 
 
Subroutine CouplingcHpVPVWpT(g1,g2,vvSM,TW,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,vvSM,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcHpVPVWp' 
 
res = 0._dp 
res = res+(g1*g2*vvSM*Cos(TW))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcHpVPVWpT  
 
 
Subroutine CouplingcHpVWpVZT(g1,g2,vvSM,TW,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,vvSM,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcHpVWpVZ' 
 
res = 0._dp 
res = res-1._dp/2._dp*(g1*g2*vvSM*Sin(TW))
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcHpVWpVZT  
 
 
Subroutine CouplingAhAhcVWpVWpT(g2,res)

Implicit None 

Real(dp), Intent(in) :: g2

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhcVWpVWp' 
 
res = 0._dp 
res = res+g2**2/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhcVWpVWpT  
 
 
Subroutine CouplingAhAhVZVZT(g1,g2,TW,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhVZVZ' 
 
res = 0._dp 
res = res+(g2**2*Cos(TW)**2)/2._dp
res = res+g1*g2*Cos(TW)*Sin(TW)
res = res+(g1**2*Sin(TW)**2)/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhVZVZT  
 
 
Subroutine CouplingAhHpcVWpVPT(g1,g2,TW,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhHpcVWpVP' 
 
res = 0._dp 
res = res+(g1*g2*Cos(TW))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhHpcVWpVPT  
 
 
Subroutine CouplingAhHpcVWpVZT(g1,g2,TW,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhHpcVWpVZ' 
 
res = 0._dp 
res = res-1._dp/2._dp*(g1*g2*Sin(TW))
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhHpcVWpVZT  
 
 
Subroutine CouplingAhcHpVPVWpT(g1,g2,TW,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhcHpVPVWp' 
 
res = 0._dp 
res = res-1._dp/2._dp*(g1*g2*Cos(TW))
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhcHpVPVWpT  
 
 
Subroutine CouplingAhcHpVWpVZT(g1,g2,TW,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhcHpVWpVZ' 
 
res = 0._dp 
res = res+(g1*g2*Sin(TW))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhcHpVWpVZT  
 
 
Subroutine CouplinghhhhcVWpVWpT(g2,res)

Implicit None 

Real(dp), Intent(in) :: g2

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhhhcVWpVWp' 
 
res = 0._dp 
res = res+g2**2/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhhhcVWpVWpT  
 
 
Subroutine CouplinghhhhVZVZT(g1,g2,TW,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhhhVZVZ' 
 
res = 0._dp 
res = res+(g2**2*Cos(TW)**2)/2._dp
res = res+g1*g2*Cos(TW)*Sin(TW)
res = res+(g1**2*Sin(TW)**2)/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhhhVZVZT  
 
 
Subroutine CouplinghhHpcVWpVPT(g1,g2,TW,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhHpcVWpVP' 
 
res = 0._dp 
res = res+(g1*g2*Cos(TW))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhHpcVWpVPT  
 
 
Subroutine CouplinghhHpcVWpVZT(g1,g2,TW,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhHpcVWpVZ' 
 
res = 0._dp 
res = res-1._dp/2._dp*(g1*g2*Sin(TW))
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhHpcVWpVZT  
 
 
Subroutine CouplinghhcHpVPVWpT(g1,g2,TW,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhcHpVPVWp' 
 
res = 0._dp 
res = res+(g1*g2*Cos(TW))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhcHpVPVWpT  
 
 
Subroutine CouplinghhcHpVWpVZT(g1,g2,TW,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhcHpVWpVZ' 
 
res = 0._dp 
res = res-1._dp/2._dp*(g1*g2*Sin(TW))
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhcHpVWpVZT  
 
 
Subroutine CouplingHpcHpVPVPT(g1,g2,TW,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingHpcHpVPVP' 
 
res = 0._dp 
res = res+(g1**2*Cos(TW)**2)/2._dp
res = res+g1*g2*Cos(TW)*Sin(TW)
res = res+(g2**2*Sin(TW)**2)/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingHpcHpVPVPT  
 
 
Subroutine CouplingHpcHpVPVZT(g1,g2,TW,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingHpcHpVPVZ' 
 
res = 0._dp 
res = res+(g1*g2*Cos(2._dp*(TW)))/2._dp
res = res-1._dp/4._dp*(g1**2*Sin(2._dp*(TW)))
res = res+(g2**2*Sin(2._dp*(TW)))/4._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingHpcHpVPVZT  
 
 
Subroutine CouplingHpcHpcVWpVWpT(g2,res)

Implicit None 

Real(dp), Intent(in) :: g2

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingHpcHpcVWpVWp' 
 
res = 0._dp 
res = res+g2**2/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingHpcHpcVWpVWpT  
 
 
Subroutine CouplingHpcHpVZVZT(g1,g2,TW,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingHpcHpVZVZ' 
 
res = 0._dp 
res = res+(g2**2*Cos(TW)**2)/2._dp
res = res-(g1*g2*Cos(TW)*Sin(TW))
res = res+(g1**2*Sin(TW)**2)/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingHpcHpVZVZT  
 
 
Subroutine CouplingVGVGVGT(g3,res)

Implicit None 

Real(dp), Intent(in) :: g3

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingVGVGVG' 
 
res = 0._dp 
res = res+g3
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingVGVGVGT  
 
 
Subroutine CouplingcVWpVPVWpT(g2,TW,res)

Implicit None 

Real(dp), Intent(in) :: g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcVWpVPVWp' 
 
res = 0._dp 
res = res-(g2*Sin(TW))
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcVWpVPVWpT  
 
 
Subroutine CouplingcVWpVWpVZT(g2,TW,res)

Implicit None 

Real(dp), Intent(in) :: g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcVWpVWpVZ' 
 
res = 0._dp 
res = res+g2*Cos(TW)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcVWpVWpVZT  
 
 
Subroutine CouplingcFdFdAhT(gt1,gt2,Yd,ZDL,ZDR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Complex(dp), Intent(in) :: Yd(3,3),ZDL(3,3),ZDR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFdFdAh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(ZDR(gt1,j1))*Conjg(ZDL(gt2,j2))*Yd(j1,j2))/sqrt(2._dp))
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+(Conjg(Yd(j1,j2))*ZDR(gt2,j1)*ZDL(gt1,j2))/sqrt(2._dp)
End Do 
End Do 
resL = -(0.,1.)*resL 
 
resR = -(0.,1.)*resR 
 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFdFdAhT  
 
 
Subroutine CouplingcFeFeAhT(gt1,gt2,Ye,ZEL,ZER,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Complex(dp), Intent(in) :: Ye(3,3),ZEL(3,3),ZER(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFeFeAh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(ZER(gt1,j1))*Conjg(ZEL(gt2,j2))*Ye(j1,j2))/sqrt(2._dp))
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+(Conjg(Ye(j1,j2))*ZER(gt2,j1)*ZEL(gt1,j2))/sqrt(2._dp)
End Do 
End Do 
resL = -(0.,1.)*resL 
 
resR = -(0.,1.)*resR 
 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFeFeAhT  
 
 
Subroutine CouplingcFuFuAhT(gt1,gt2,Yu,ZUL,ZUR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Complex(dp), Intent(in) :: Yu(3,3),ZUL(3,3),ZUR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFuFuAh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(ZUR(gt1,j1))*Conjg(ZUL(gt2,j2))*Yu(j1,j2))/sqrt(2._dp)
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(Yu(j1,j2))*ZUR(gt2,j1)*ZUL(gt1,j2))/sqrt(2._dp))
End Do 
End Do 
resL = -(0.,1.)*resL 
 
resR = -(0.,1.)*resR 
 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFuFuAhT  
 
 
Subroutine CouplingcFdFdhhT(gt1,gt2,Yd,ZDL,ZDR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Complex(dp), Intent(in) :: Yd(3,3),ZDL(3,3),ZDR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFdFdhh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(ZDR(gt1,j1))*Conjg(ZDL(gt2,j2))*Yd(j1,j2))/sqrt(2._dp))
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(Yd(j1,j2))*ZDR(gt2,j1)*ZDL(gt1,j2))/sqrt(2._dp))
End Do 
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFdFdhhT  
 
 
Subroutine CouplingcFuFdHpT(gt1,gt2,Yu,Yd,ZDL,ZDR,ZUL,ZUR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Complex(dp), Intent(in) :: Yu(3,3),Yd(3,3),ZDL(3,3),ZDR(3,3),ZUL(3,3),ZUR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFuFdHp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+Conjg(ZUR(gt1,j1))*Conjg(ZDL(gt2,j2))*Yu(j1,j2)
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-(Conjg(Yd(j1,j2))*ZDR(gt2,j1)*ZUL(gt1,j2))
End Do 
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFuFdHpT  
 
 
Subroutine CouplingcFeFehhT(gt1,gt2,Ye,ZEL,ZER,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Complex(dp), Intent(in) :: Ye(3,3),ZEL(3,3),ZER(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFeFehh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(ZER(gt1,j1))*Conjg(ZEL(gt2,j2))*Ye(j1,j2))/sqrt(2._dp))
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(Ye(j1,j2))*ZER(gt2,j1)*ZEL(gt1,j2))/sqrt(2._dp))
End Do 
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFeFehhT  
 
 
Subroutine CouplingcFvFeHpT(gt1,gt2,Ye,ZER,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Complex(dp), Intent(in) :: Ye(3,3),ZER(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFvFeHp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
resR = 0._dp 
Do j1 = 1,3
resR = resR-(Conjg(Ye(j1,gt1))*ZER(gt2,j1))
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFvFeHpT  
 
 
Subroutine CouplingcFuFuhhT(gt1,gt2,Yu,ZUL,ZUR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Complex(dp), Intent(in) :: Yu(3,3),ZUL(3,3),ZUR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFuFuhh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(ZUR(gt1,j1))*Conjg(ZUL(gt2,j2))*Yu(j1,j2))/sqrt(2._dp))
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(Yu(j1,j2))*ZUR(gt2,j1)*ZUL(gt1,j2))/sqrt(2._dp))
End Do 
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFuFuhhT  
 
 
Subroutine CouplingcFdFucHpT(gt1,gt2,Yu,Yd,ZDL,ZDR,ZUL,ZUR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Complex(dp), Intent(in) :: Yu(3,3),Yd(3,3),ZDL(3,3),ZDR(3,3),ZUL(3,3),ZUR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFdFucHp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-(Conjg(ZDR(gt1,j1))*Conjg(ZUL(gt2,j2))*Yd(j1,j2))
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+Conjg(Yu(j1,j2))*ZUR(gt2,j1)*ZDL(gt1,j2)
End Do 
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFdFucHpT  
 
 
Subroutine CouplingcFeFvcHpT(gt1,gt2,Ye,ZER,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Complex(dp), Intent(in) :: Ye(3,3),ZER(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFeFvcHp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j1 = 1,3
resL = resL-(Conjg(ZER(gt1,j1))*Ye(j1,gt2))
End Do 
resR = 0._dp 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFeFvcHpT  
 
 
Subroutine CouplingcFdFdVGT(gt1,gt2,g3,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g3

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFdFdVG' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.eq.gt2)) Then 
resL = resL-1._dp*(g3)
End If 
resR = 0._dp 
If ((gt1.eq.gt2)) Then 
resR = resR-1._dp*(g3)
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFdFdVGT  
 
 
Subroutine CouplingcFdFdVPT(gt1,gt2,g1,g2,TW,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFdFdVP' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.eq.gt2)) Then 
resL = resL-1._dp/6._dp*(g1*Cos(TW))
End If 
If ((gt1.eq.gt2)) Then 
resL = resL+(g2*Sin(TW))/2._dp
End If 
resR = 0._dp 
If ((gt1.eq.gt2)) Then 
resR = resR+(g1*Cos(TW))/3._dp
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFdFdVPT  
 
 
Subroutine CouplingcFuFdVWpT(gt1,gt2,g2,ZDL,ZUL,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g2

Complex(dp), Intent(in) :: ZDL(3,3),ZUL(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFuFdVWp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j1 = 1,3
resL = resL-((g2*Conjg(ZDL(gt2,j1))*ZUL(gt1,j1))/sqrt(2._dp))
End Do 
resR = 0._dp 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFuFdVWpT  
 
 
Subroutine CouplingcFdFdVZT(gt1,gt2,g1,g2,TW,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFdFdVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.eq.gt2)) Then 
resL = resL+(g2*Cos(TW))/2._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL+(g1*Sin(TW))/6._dp
End If 
resR = 0._dp 
If ((gt1.eq.gt2)) Then 
resR = resR-1._dp/3._dp*(g1*Sin(TW))
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFdFdVZT  
 
 
Subroutine CouplingcFeFeVPT(gt1,gt2,g1,g2,TW,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFeFeVP' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.eq.gt2)) Then 
resL = resL+(g1*Cos(TW))/2._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL+(g2*Sin(TW))/2._dp
End If 
resR = 0._dp 
If ((gt1.eq.gt2)) Then 
resR = resR+g1*Cos(TW)
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFeFeVPT  
 
 
Subroutine CouplingcFvFeVWpT(gt1,gt2,g2,ZEL,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g2

Complex(dp), Intent(in) :: ZEL(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFvFeVWp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resL = resL-((g2*Conjg(ZEL(gt2,gt1)))/sqrt(2._dp))
End If 
resR = 0._dp 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFvFeVWpT  
 
 
Subroutine CouplingcFeFeVZT(gt1,gt2,g1,g2,TW,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFeFeVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.eq.gt2)) Then 
resL = resL+(g2*Cos(TW))/2._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL-1._dp/2._dp*(g1*Sin(TW))
End If 
resR = 0._dp 
If ((gt1.eq.gt2)) Then 
resR = resR-(g1*Sin(TW))
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFeFeVZT  
 
 
Subroutine CouplingcFuFuVGT(gt1,gt2,g3,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g3

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFuFuVG' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.eq.gt2)) Then 
resL = resL-1._dp*(g3)
End If 
resR = 0._dp 
If ((gt1.eq.gt2)) Then 
resR = resR-1._dp*(g3)
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFuFuVGT  
 
 
Subroutine CouplingcFuFuVPT(gt1,gt2,g1,g2,TW,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFuFuVP' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.eq.gt2)) Then 
resL = resL-1._dp/6._dp*(g1*Cos(TW))
End If 
If ((gt1.eq.gt2)) Then 
resL = resL-1._dp/2._dp*(g2*Sin(TW))
End If 
resR = 0._dp 
If ((gt1.eq.gt2)) Then 
resR = resR+(-2*g1*Cos(TW))/3._dp
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFuFuVPT  
 
 
Subroutine CouplingcFuFuVZT(gt1,gt2,g1,g2,TW,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFuFuVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.eq.gt2)) Then 
resL = resL-1._dp/2._dp*(g2*Cos(TW))
End If 
If ((gt1.eq.gt2)) Then 
resL = resL+(g1*Sin(TW))/6._dp
End If 
resR = 0._dp 
If ((gt1.eq.gt2)) Then 
resR = resR+(2*g1*Sin(TW))/3._dp
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFuFuVZT  
 
 
Subroutine CouplingcFdFucVWpT(gt1,gt2,g2,ZDL,ZUL,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g2

Complex(dp), Intent(in) :: ZDL(3,3),ZUL(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFdFucVWp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j1 = 1,3
resL = resL-((g2*Conjg(ZUL(gt2,j1))*ZDL(gt1,j1))/sqrt(2._dp))
End Do 
resR = 0._dp 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFdFucVWpT  
 
 
Subroutine CouplingcFvFvVZT(gt1,gt2,g1,g2,TW,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFvFvVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.eq.gt2)) Then 
resL = resL-1._dp/2._dp*(g2*Cos(TW))
End If 
If ((gt1.eq.gt2)) Then 
resL = resL-1._dp/2._dp*(g1*Sin(TW))
End If 
resR = 0._dp 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFvFvVZT  
 
 
Subroutine CouplingcFeFvcVWpT(gt1,gt2,g2,ZEL,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g2

Complex(dp), Intent(in) :: ZEL(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFeFvcVWp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt2.le.3).And.(gt2.ge.1)) Then 
resL = resL-((g2*ZEL(gt1,gt2))/sqrt(2._dp))
End If 
resR = 0._dp 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFeFvcVWpT  
 
 
Subroutine CouplingVGVGVGVGT(g3,res1,res2,res3)

Implicit None 

Real(dp), Intent(in) :: g3

Complex(dp), Intent(out) :: res1, res2, res3 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingVGVGVGVG' 
 
res1 = 0._dp 
res1 = res1-16*g3**2
res2 = 0._dp 
res3 = 0._dp 
res3 = res3+16*g3**2
If ((Real(res1,dp).ne.Real(res1,dp)).or.(Real(res2,dp).ne.Real(res2,dp)).or.(Real(res3,dp).ne.Real(res3,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingVGVGVGVGT  
 
 
Subroutine CouplingcVWpVPVPVWpT(g2,TW,res1,res2,res3)

Implicit None 

Real(dp), Intent(in) :: g2,TW

Complex(dp), Intent(out) :: res1, res2, res3 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcVWpVPVPVWp' 
 
res1 = 0._dp 
res1 = res1+g2**2*Sin(TW)**2
res2 = 0._dp 
res2 = res2+g2**2*Sin(TW)**2
res3 = 0._dp 
res3 = res3-2*g2**2*Sin(TW)**2
If ((Real(res1,dp).ne.Real(res1,dp)).or.(Real(res2,dp).ne.Real(res2,dp)).or.(Real(res3,dp).ne.Real(res3,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcVWpVPVPVWpT  
 
 
Subroutine CouplingcVWpVPVWpVZT(g2,TW,res1,res2,res3)

Implicit None 

Real(dp), Intent(in) :: g2,TW

Complex(dp), Intent(out) :: res1, res2, res3 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcVWpVPVWpVZ' 
 
res1 = 0._dp 
res1 = res1+g2**2*Cos(TW)*Sin(TW)
res2 = 0._dp 
res2 = res2-(g2**2*Sin(2._dp*(TW)))
res3 = 0._dp 
res3 = res3+g2**2*Cos(TW)*Sin(TW)
If ((Real(res1,dp).ne.Real(res1,dp)).or.(Real(res2,dp).ne.Real(res2,dp)).or.(Real(res3,dp).ne.Real(res3,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcVWpVPVWpVZT  
 
 
Subroutine CouplingcVWpcVWpVWpVWpT(g2,res1,res2,res3)

Implicit None 

Real(dp), Intent(in) :: g2

Complex(dp), Intent(out) :: res1, res2, res3 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcVWpcVWpVWpVWp' 
 
res1 = 0._dp 
res1 = res1+2*g2**2
res2 = 0._dp 
res2 = res2-g2**2
res3 = 0._dp 
res3 = res3-g2**2
If ((Real(res1,dp).ne.Real(res1,dp)).or.(Real(res2,dp).ne.Real(res2,dp)).or.(Real(res3,dp).ne.Real(res3,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcVWpcVWpVWpVWpT  
 
 
Subroutine CouplingcVWpVWpVZVZT(g2,TW,res1,res2,res3)

Implicit None 

Real(dp), Intent(in) :: g2,TW

Complex(dp), Intent(out) :: res1, res2, res3 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcVWpVWpVZVZ' 
 
res1 = 0._dp 
res1 = res1-2*g2**2*Cos(TW)**2
res2 = 0._dp 
res2 = res2+g2**2*Cos(TW)**2
res3 = 0._dp 
res3 = res3+g2**2*Cos(TW)**2
If ((Real(res1,dp).ne.Real(res1,dp)).or.(Real(res2,dp).ne.Real(res2,dp)).or.(Real(res3,dp).ne.Real(res3,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcVWpVWpVZVZT  
 
 
Subroutine CouplingcgGgGVGT(g3,res)

Implicit None 

Real(dp), Intent(in) :: g3

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgGgGVG' 
 
res = 0._dp 
res = res+g3
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgGgGVGT  
 
 
Subroutine CouplingcgWpgAVWpT(g2,TW,res)

Implicit None 

Real(dp), Intent(in) :: g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWpgAVWp' 
 
res = 0._dp 
res = res-(g2*Sin(TW))
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWpgAVWpT  
 
 
Subroutine CouplingcgWCgAcVWpT(g2,TW,res)

Implicit None 

Real(dp), Intent(in) :: g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWCgAcVWp' 
 
res = 0._dp 
res = res+g2*Sin(TW)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWCgAcVWpT  
 
 
Subroutine CouplingcgWpgWpVPT(g2,TW,res)

Implicit None 

Real(dp), Intent(in) :: g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWpgWpVP' 
 
res = 0._dp 
res = res+g2*Sin(TW)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWpgWpVPT  
 
 
Subroutine CouplingcgWpgWpVZT(g2,TW,res)

Implicit None 

Real(dp), Intent(in) :: g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWpgWpVZ' 
 
res = 0._dp 
res = res+g2*Cos(TW)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWpgWpVZT  
 
 
Subroutine CouplingcgAgWpcVWpT(g2,TW,res)

Implicit None 

Real(dp), Intent(in) :: g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgAgWpcVWp' 
 
res = 0._dp 
res = res-(g2*Sin(TW))
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgAgWpcVWpT  
 
 
Subroutine CouplingcgZgWpcVWpT(g2,TW,res)

Implicit None 

Real(dp), Intent(in) :: g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgZgWpcVWp' 
 
res = 0._dp 
res = res-(g2*Cos(TW))
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgZgWpcVWpT  
 
 
Subroutine CouplingcgWCgWCVPT(g2,TW,res)

Implicit None 

Real(dp), Intent(in) :: g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWCgWCVP' 
 
res = 0._dp 
res = res-(g2*Sin(TW))
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWCgWCVPT  
 
 
Subroutine CouplingcgAgWCVWpT(g2,TW,res)

Implicit None 

Real(dp), Intent(in) :: g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgAgWCVWp' 
 
res = 0._dp 
res = res+g2*Sin(TW)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgAgWCVWpT  
 
 
Subroutine CouplingcgZgWCVWpT(g2,TW,res)

Implicit None 

Real(dp), Intent(in) :: g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgZgWCVWp' 
 
res = 0._dp 
res = res+g2*Cos(TW)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgZgWCVWpT  
 
 
Subroutine CouplingcgWCgWCVZT(g2,TW,res)

Implicit None 

Real(dp), Intent(in) :: g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWCgWCVZ' 
 
res = 0._dp 
res = res-(g2*Cos(TW))
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWCgWCVZT  
 
 
Subroutine CouplingcgWpgZVWpT(g2,TW,res)

Implicit None 

Real(dp), Intent(in) :: g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWpgZVWp' 
 
res = 0._dp 
res = res-(g2*Cos(TW))
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWpgZVWpT  
 
 
Subroutine CouplingcgWCgZcVWpT(g2,TW,res)

Implicit None 

Real(dp), Intent(in) :: g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWCgZcVWp' 
 
res = 0._dp 
res = res+g2*Cos(TW)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWCgZcVWpT  
 
 
Subroutine CouplingcgWpgWpAhT(g2,vvSM,res)

Implicit None 

Real(dp), Intent(in) :: g2,vvSM

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWpgWpAh' 
 
res = 0._dp 
res = res+(g2**2*vvSM*RXiWp)/4._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWpgWpAhT  
 
 
Subroutine CouplingcgWCgWCAhT(g2,vvSM,res)

Implicit None 

Real(dp), Intent(in) :: g2,vvSM

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWCgWCAh' 
 
res = 0._dp 
res = res-1._dp/4._dp*(g2**2*vvSM*RXiWp)
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWCgWCAhT  
 
 
Subroutine CouplingcgZgAhhT(g1,g2,vvSM,TW,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,vvSM,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgZgAhh' 
 
res = 0._dp 
res = res+(g1*g2*vvSM*Cos(2._dp*(TW))*RXiZ)/4._dp
res = res+(g1**2*vvSM*RXiZ*Sin(2._dp*(TW)))/8._dp
res = res-1._dp/8._dp*(g2**2*vvSM*RXiZ*Sin(2._dp*(TW)))
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgZgAhhT  
 
 
Subroutine CouplingcgWpgAHpT(g1,g2,vvSM,TW,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,vvSM,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWpgAHp' 
 
res = 0._dp 
res = res-1._dp/4._dp*(g1*g2*vvSM*Cos(TW)*RXiWp)
res = res-1._dp/4._dp*(g2**2*vvSM*RXiWp*Sin(TW))
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWpgAHpT  
 
 
Subroutine CouplingcgWCgAcHpT(g1,g2,vvSM,TW,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,vvSM,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWCgAcHp' 
 
res = 0._dp 
res = res-1._dp/4._dp*(g1*g2*vvSM*Cos(TW)*RXiWp)
res = res-1._dp/4._dp*(g2**2*vvSM*RXiWp*Sin(TW))
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWCgAcHpT  
 
 
Subroutine CouplingcgWpgWphhT(g2,vvSM,res)

Implicit None 

Real(dp), Intent(in) :: g2,vvSM

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWpgWphh' 
 
res = 0._dp 
res = res-1._dp/4._dp*(g2**2*vvSM*RXiWp)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWpgWphhT  
 
 
Subroutine CouplingcgZgWpcHpT(g1,g2,vvSM,TW,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,vvSM,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgZgWpcHp' 
 
res = 0._dp 
res = res+(g2**2*vvSM*Cos(TW)*RXiZ)/4._dp
res = res+(g1*g2*vvSM*RXiZ*Sin(TW))/4._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgZgWpcHpT  
 
 
Subroutine CouplingcgWCgWChhT(g2,vvSM,res)

Implicit None 

Real(dp), Intent(in) :: g2,vvSM

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWCgWChh' 
 
res = 0._dp 
res = res-1._dp/4._dp*(g2**2*vvSM*RXiWp)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWCgWChhT  
 
 
Subroutine CouplingcgZgWCHpT(g1,g2,vvSM,TW,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,vvSM,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgZgWCHp' 
 
res = 0._dp 
res = res+(g2**2*vvSM*Cos(TW)*RXiZ)/4._dp
res = res+(g1*g2*vvSM*RXiZ*Sin(TW))/4._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgZgWCHpT  
 
 
Subroutine CouplingcgZgZhhT(g1,g2,vvSM,TW,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,vvSM,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgZgZhh' 
 
res = 0._dp 
res = res-1._dp/4._dp*(g2**2*vvSM*Cos(TW)**2*RXiZ)
res = res-1._dp/2._dp*(g1*g2*vvSM*Cos(TW)*RXiZ*Sin(TW))
res = res-1._dp/4._dp*(g1**2*vvSM*RXiZ*Sin(TW)**2)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgZgZhhT  
 
 
Subroutine CouplingcgWpgZHpT(g1,g2,vvSM,TW,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,vvSM,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWpgZHp' 
 
res = 0._dp 
res = res-1._dp/4._dp*(g2**2*vvSM*Cos(TW)*RXiWp)
res = res+(g1*g2*vvSM*RXiWp*Sin(TW))/4._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWpgZHpT  
 
 
Subroutine CouplingcgWCgZcHpT(g1,g2,vvSM,TW,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,vvSM,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWCgZcHp' 
 
res = 0._dp 
res = res-1._dp/4._dp*(g2**2*vvSM*Cos(TW)*RXiWp)
res = res+(g1*g2*vvSM*RXiWp*Sin(TW))/4._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWCgZcHpT  
 
 
Subroutine CouplingsForEffPot4(Lam,cplAhAhAhAh,cplAhAhhhhh,cplAhAhHpcHp,              & 
& cplhhhhhhhh,cplhhhhHpcHp,cplHpHpcHpcHp)

Implicit None 
Complex(dp), Intent(in) :: Lam

Complex(dp), Intent(out) :: cplAhAhAhAh,cplAhAhhhhh,cplAhAhHpcHp,cplhhhhhhhh,cplhhhhHpcHp,cplHpHpcHpcHp

Integer :: gt1, gt2, gt3, gt4, ct1, ct2, ct3, ct4

Iname = Iname + 1 
NameOfUnit(Iname) = 'CouplingsForEffPot4'
 
cplAhAhAhAh = 0._dp 
Call CouplingAhAhAhAh2L(Lam,cplAhAhAhAh)



cplAhAhhhhh = 0._dp 
Call CouplingAhAhhhhh2L(Lam,cplAhAhhhhh)



cplAhAhHpcHp = 0._dp 
Call CouplingAhAhHpcHp2L(Lam,cplAhAhHpcHp)



cplhhhhhhhh = 0._dp 
Call Couplinghhhhhhhh2L(Lam,cplhhhhhhhh)



cplhhhhHpcHp = 0._dp 
Call CouplinghhhhHpcHp2L(Lam,cplhhhhHpcHp)



cplHpHpcHpcHp = 0._dp 
Call CouplingHpHpcHpcHp2L(Lam,cplHpHpcHpcHp)



Iname = Iname - 1 
End Subroutine CouplingsForEffPot4

Subroutine CouplingsForEffPot3(Lam,vvSM,g3,Yd,ZDL,ZDR,Ye,ZEL,ZER,Yu,ZUL,              & 
& ZUR,cplAhAhhh,cplhhhhhh,cplhhHpcHp,cplVGVGVG,cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,      & 
& cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplcFdFdhhL,cplcFdFdhhR,cplcFuFdHpL,               & 
& cplcFuFdHpR,cplcFeFehhL,cplcFeFehhR,cplcFvFeHpL,cplcFvFeHpR,cplcFuFuhhL,               & 
& cplcFuFuhhR,cplcFdFucHpL,cplcFdFucHpR,cplcFeFvcHpL,cplcFeFvcHpR,cplcFdFdVGL,           & 
& cplcFdFdVGR,cplcFuFuVGL,cplcFuFuVGR)

Implicit None 
Real(dp), Intent(in) :: vvSM,g3

Complex(dp), Intent(in) :: Lam,Yd(3,3),ZDL(3,3),ZDR(3,3),Ye(3,3),ZEL(3,3),ZER(3,3),Yu(3,3),ZUL(3,3),ZUR(3,3)

Complex(dp), Intent(out) :: cplAhAhhh,cplhhhhhh,cplhhHpcHp,cplVGVGVG,cplcFdFdAhL(3,3),cplcFdFdAhR(3,3),           & 
& cplcFeFeAhL(3,3),cplcFeFeAhR(3,3),cplcFuFuAhL(3,3),cplcFuFuAhR(3,3),cplcFdFdhhL(3,3),  & 
& cplcFdFdhhR(3,3),cplcFuFdHpL(3,3),cplcFuFdHpR(3,3),cplcFeFehhL(3,3),cplcFeFehhR(3,3),  & 
& cplcFvFeHpL(3,3),cplcFvFeHpR(3,3),cplcFuFuhhL(3,3),cplcFuFuhhR(3,3),cplcFdFucHpL(3,3), & 
& cplcFdFucHpR(3,3),cplcFeFvcHpL(3,3),cplcFeFvcHpR(3,3),cplcFdFdVGL(3,3),cplcFdFdVGR(3,3),& 
& cplcFuFuVGL(3,3),cplcFuFuVGR(3,3)

Integer :: gt1, gt2, gt3, gt4, ct1, ct2, ct3, ct4

Iname = Iname + 1 
NameOfUnit(Iname) = 'CouplingsForEffPot3'
 
cplAhAhhh = 0._dp 
Call CouplingAhAhhh2L(Lam,vvSM,cplAhAhhh)



cplhhhhhh = 0._dp 
Call Couplinghhhhhh2L(Lam,vvSM,cplhhhhhh)



cplhhHpcHp = 0._dp 
Call CouplinghhHpcHp2L(Lam,vvSM,cplhhHpcHp)



cplVGVGVG = 0._dp 
Call CouplingVGVGVG2L(g3,cplVGVGVG)



cplcFdFdAhL = 0._dp 
cplcFdFdAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFdAh2L(gt1,gt2,Yd,ZDL,ZDR,cplcFdFdAhL(gt1,gt2),cplcFdFdAhR(gt1,gt2))

 End Do 
End Do 


cplcFeFeAhL = 0._dp 
cplcFeFeAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFeFeAh2L(gt1,gt2,Ye,ZEL,ZER,cplcFeFeAhL(gt1,gt2),cplcFeFeAhR(gt1,gt2))

 End Do 
End Do 


cplcFuFuAhL = 0._dp 
cplcFuFuAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFuAh2L(gt1,gt2,Yu,ZUL,ZUR,cplcFuFuAhL(gt1,gt2),cplcFuFuAhR(gt1,gt2))

 End Do 
End Do 


cplcFdFdhhL = 0._dp 
cplcFdFdhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFdhh2L(gt1,gt2,Yd,ZDL,ZDR,cplcFdFdhhL(gt1,gt2),cplcFdFdhhR(gt1,gt2))

 End Do 
End Do 


cplcFuFdHpL = 0._dp 
cplcFuFdHpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFdHp2L(gt1,gt2,Yu,Yd,ZDL,ZDR,ZUL,ZUR,cplcFuFdHpL(gt1,gt2)             & 
& ,cplcFuFdHpR(gt1,gt2))

 End Do 
End Do 


cplcFeFehhL = 0._dp 
cplcFeFehhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFeFehh2L(gt1,gt2,Ye,ZEL,ZER,cplcFeFehhL(gt1,gt2),cplcFeFehhR(gt1,gt2))

 End Do 
End Do 


cplcFvFeHpL = 0._dp 
cplcFvFeHpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFvFeHp2L(gt1,gt2,Ye,ZER,cplcFvFeHpL(gt1,gt2),cplcFvFeHpR(gt1,gt2))

 End Do 
End Do 


cplcFuFuhhL = 0._dp 
cplcFuFuhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFuhh2L(gt1,gt2,Yu,ZUL,ZUR,cplcFuFuhhL(gt1,gt2),cplcFuFuhhR(gt1,gt2))

 End Do 
End Do 


cplcFdFucHpL = 0._dp 
cplcFdFucHpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFucHp2L(gt1,gt2,Yu,Yd,ZDL,ZDR,ZUL,ZUR,cplcFdFucHpL(gt1,gt2)           & 
& ,cplcFdFucHpR(gt1,gt2))

 End Do 
End Do 


cplcFeFvcHpL = 0._dp 
cplcFeFvcHpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFeFvcHp2L(gt1,gt2,Ye,ZER,cplcFeFvcHpL(gt1,gt2),cplcFeFvcHpR(gt1,gt2))

 End Do 
End Do 


cplcFdFdVGL = 0._dp 
cplcFdFdVGR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFdVG2L(gt1,gt2,g3,cplcFdFdVGL(gt1,gt2),cplcFdFdVGR(gt1,gt2))

 End Do 
End Do 


cplcFuFuVGL = 0._dp 
cplcFuFuVGR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFuVG2L(gt1,gt2,g3,cplcFuFuVGL(gt1,gt2),cplcFuFuVGR(gt1,gt2))

 End Do 
End Do 


Iname = Iname - 1 
End Subroutine CouplingsForEffPot3

Subroutine CouplingAhAhAhAh2L(Lam,res)

Implicit None 

Complex(dp), Intent(in) :: Lam

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhAhAh' 
 
res = 0._dp 
res = res-3._dp*(Lam)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhAhAh2L  
 
 
Subroutine CouplingAhAhhhhh2L(Lam,res)

Implicit None 

Complex(dp), Intent(in) :: Lam

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhhhhh' 
 
res = 0._dp 
res = res-1._dp*(Lam)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhhhhh2L  
 
 
Subroutine CouplingAhAhHpcHp2L(Lam,res)

Implicit None 

Complex(dp), Intent(in) :: Lam

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhHpcHp' 
 
res = 0._dp 
res = res-1._dp*(Lam)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhHpcHp2L  
 
 
Subroutine Couplinghhhhhhhh2L(Lam,res)

Implicit None 

Complex(dp), Intent(in) :: Lam

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'Couplinghhhhhhhh' 
 
res = 0._dp 
res = res-3._dp*(Lam)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine Couplinghhhhhhhh2L  
 
 
Subroutine CouplinghhhhHpcHp2L(Lam,res)

Implicit None 

Complex(dp), Intent(in) :: Lam

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhhhHpcHp' 
 
res = 0._dp 
res = res-1._dp*(Lam)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhhhHpcHp2L  
 
 
Subroutine CouplingHpHpcHpcHp2L(Lam,res)

Implicit None 

Complex(dp), Intent(in) :: Lam

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingHpHpcHpcHp' 
 
res = 0._dp 
res = res-2._dp*(Lam)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingHpHpcHpcHp2L  
 
 
Subroutine CouplingAhAhhh2L(Lam,vvSM,res)

Implicit None 

Real(dp), Intent(in) :: vvSM

Complex(dp), Intent(in) :: Lam

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhhh' 
 
res = 0._dp 
res = res-(vvSM*Lam)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhhh2L  
 
 
Subroutine Couplinghhhhhh2L(Lam,vvSM,res)

Implicit None 

Real(dp), Intent(in) :: vvSM

Complex(dp), Intent(in) :: Lam

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'Couplinghhhhhh' 
 
res = 0._dp 
res = res-3*vvSM*Lam
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine Couplinghhhhhh2L  
 
 
Subroutine CouplinghhHpcHp2L(Lam,vvSM,res)

Implicit None 

Real(dp), Intent(in) :: vvSM

Complex(dp), Intent(in) :: Lam

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhHpcHp' 
 
res = 0._dp 
res = res-(vvSM*Lam)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhHpcHp2L  
 
 
Subroutine CouplingVGVGVG2L(g3,res)

Implicit None 

Real(dp), Intent(in) :: g3

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingVGVGVG' 
 
res = 0._dp 
res = res+g3
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingVGVGVG2L  
 
 
Subroutine CouplingcFdFdAh2L(gt1,gt2,Yd,ZDL,ZDR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Complex(dp), Intent(in) :: Yd(3,3),ZDL(3,3),ZDR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFdFdAh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(ZDR(gt1,j1))*Conjg(ZDL(gt2,j2))*Yd(j1,j2))/sqrt(2._dp))
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+(Conjg(Yd(j1,j2))*ZDR(gt2,j1)*ZDL(gt1,j2))/sqrt(2._dp)
End Do 
End Do 
resL = -(0.,1.)*resL 
 
resR = -(0.,1.)*resR 
 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFdFdAh2L  
 
 
Subroutine CouplingcFeFeAh2L(gt1,gt2,Ye,ZEL,ZER,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Complex(dp), Intent(in) :: Ye(3,3),ZEL(3,3),ZER(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFeFeAh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(ZER(gt1,j1))*Conjg(ZEL(gt2,j2))*Ye(j1,j2))/sqrt(2._dp))
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+(Conjg(Ye(j1,j2))*ZER(gt2,j1)*ZEL(gt1,j2))/sqrt(2._dp)
End Do 
End Do 
resL = -(0.,1.)*resL 
 
resR = -(0.,1.)*resR 
 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFeFeAh2L  
 
 
Subroutine CouplingcFuFuAh2L(gt1,gt2,Yu,ZUL,ZUR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Complex(dp), Intent(in) :: Yu(3,3),ZUL(3,3),ZUR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFuFuAh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(ZUR(gt1,j1))*Conjg(ZUL(gt2,j2))*Yu(j1,j2))/sqrt(2._dp)
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(Yu(j1,j2))*ZUR(gt2,j1)*ZUL(gt1,j2))/sqrt(2._dp))
End Do 
End Do 
resL = -(0.,1.)*resL 
 
resR = -(0.,1.)*resR 
 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFuFuAh2L  
 
 
Subroutine CouplingcFdFdhh2L(gt1,gt2,Yd,ZDL,ZDR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Complex(dp), Intent(in) :: Yd(3,3),ZDL(3,3),ZDR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFdFdhh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(ZDR(gt1,j1))*Conjg(ZDL(gt2,j2))*Yd(j1,j2))/sqrt(2._dp))
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(Yd(j1,j2))*ZDR(gt2,j1)*ZDL(gt1,j2))/sqrt(2._dp))
End Do 
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFdFdhh2L  
 
 
Subroutine CouplingcFuFdHp2L(gt1,gt2,Yu,Yd,ZDL,ZDR,ZUL,ZUR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Complex(dp), Intent(in) :: Yu(3,3),Yd(3,3),ZDL(3,3),ZDR(3,3),ZUL(3,3),ZUR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFuFdHp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+Conjg(ZUR(gt1,j1))*Conjg(ZDL(gt2,j2))*Yu(j1,j2)
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-(Conjg(Yd(j1,j2))*ZDR(gt2,j1)*ZUL(gt1,j2))
End Do 
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFuFdHp2L  
 
 
Subroutine CouplingcFeFehh2L(gt1,gt2,Ye,ZEL,ZER,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Complex(dp), Intent(in) :: Ye(3,3),ZEL(3,3),ZER(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFeFehh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(ZER(gt1,j1))*Conjg(ZEL(gt2,j2))*Ye(j1,j2))/sqrt(2._dp))
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(Ye(j1,j2))*ZER(gt2,j1)*ZEL(gt1,j2))/sqrt(2._dp))
End Do 
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFeFehh2L  
 
 
Subroutine CouplingcFvFeHp2L(gt1,gt2,Ye,ZER,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Complex(dp), Intent(in) :: Ye(3,3),ZER(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFvFeHp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
resR = 0._dp 
Do j1 = 1,3
resR = resR-(Conjg(Ye(j1,gt1))*ZER(gt2,j1))
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFvFeHp2L  
 
 
Subroutine CouplingcFuFuhh2L(gt1,gt2,Yu,ZUL,ZUR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Complex(dp), Intent(in) :: Yu(3,3),ZUL(3,3),ZUR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFuFuhh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(ZUR(gt1,j1))*Conjg(ZUL(gt2,j2))*Yu(j1,j2))/sqrt(2._dp))
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(Yu(j1,j2))*ZUR(gt2,j1)*ZUL(gt1,j2))/sqrt(2._dp))
End Do 
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFuFuhh2L  
 
 
Subroutine CouplingcFdFucHp2L(gt1,gt2,Yu,Yd,ZDL,ZDR,ZUL,ZUR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Complex(dp), Intent(in) :: Yu(3,3),Yd(3,3),ZDL(3,3),ZDR(3,3),ZUL(3,3),ZUR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFdFucHp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-(Conjg(ZDR(gt1,j1))*Conjg(ZUL(gt2,j2))*Yd(j1,j2))
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+Conjg(Yu(j1,j2))*ZUR(gt2,j1)*ZDL(gt1,j2)
End Do 
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFdFucHp2L  
 
 
Subroutine CouplingcFeFvcHp2L(gt1,gt2,Ye,ZER,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Complex(dp), Intent(in) :: Ye(3,3),ZER(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFeFvcHp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j1 = 1,3
resL = resL-(Conjg(ZER(gt1,j1))*Ye(j1,gt2))
End Do 
resR = 0._dp 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFeFvcHp2L  
 
 
Subroutine CouplingcFdFdVG2L(gt1,gt2,g3,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g3

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFdFdVG' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.eq.gt2)) Then 
resL = resL-1._dp*(g3)
End If 
resR = 0._dp 
If ((gt1.eq.gt2)) Then 
resR = resR-1._dp*(g3)
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFdFdVG2L  
 
 
Subroutine CouplingcFuFuVG2L(gt1,gt2,g3,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g3

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFuFuVG' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.eq.gt2)) Then 
resL = resL-1._dp*(g3)
End If 
resR = 0._dp 
If ((gt1.eq.gt2)) Then 
resR = resR-1._dp*(g3)
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFuFuVG2L  
 
 
Subroutine CouplingsFor2LPole3(Lam,vvSM,g3,Yd,ZDL,ZDR,Ye,ZEL,ZER,Yu,ZUL,              & 
& ZUR,cplAhAhhh,cplhhhhhh,cplhhHpcHp,cplVGVGVG,cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,      & 
& cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplcFdFdhhL,cplcFdFdhhR,cplcFuFdHpL,               & 
& cplcFuFdHpR,cplcFeFehhL,cplcFeFehhR,cplcFvFeHpL,cplcFvFeHpR,cplcFuFuhhL,               & 
& cplcFuFuhhR,cplcFdFucHpL,cplcFdFucHpR,cplcFeFvcHpL,cplcFeFvcHpR,cplcFdFdVGL,           & 
& cplcFdFdVGR,cplcFuFuVGL,cplcFuFuVGR)

Implicit None 
Real(dp), Intent(in) :: vvSM,g3

Complex(dp), Intent(in) :: Lam,Yd(3,3),ZDL(3,3),ZDR(3,3),Ye(3,3),ZEL(3,3),ZER(3,3),Yu(3,3),ZUL(3,3),ZUR(3,3)

Complex(dp), Intent(out) :: cplAhAhhh,cplhhhhhh,cplhhHpcHp,cplVGVGVG,cplcFdFdAhL(3,3),cplcFdFdAhR(3,3),           & 
& cplcFeFeAhL(3,3),cplcFeFeAhR(3,3),cplcFuFuAhL(3,3),cplcFuFuAhR(3,3),cplcFdFdhhL(3,3),  & 
& cplcFdFdhhR(3,3),cplcFuFdHpL(3,3),cplcFuFdHpR(3,3),cplcFeFehhL(3,3),cplcFeFehhR(3,3),  & 
& cplcFvFeHpL(3,3),cplcFvFeHpR(3,3),cplcFuFuhhL(3,3),cplcFuFuhhR(3,3),cplcFdFucHpL(3,3), & 
& cplcFdFucHpR(3,3),cplcFeFvcHpL(3,3),cplcFeFvcHpR(3,3),cplcFdFdVGL(3,3),cplcFdFdVGR(3,3),& 
& cplcFuFuVGL(3,3),cplcFuFuVGR(3,3)

Integer :: gt1, gt2, gt3, gt4, ct1, ct2, ct3, ct4

Iname = Iname + 1 
NameOfUnit(Iname) = 'CouplingsFor2LPole3'
 
cplAhAhhh = 0._dp 
Call CouplingAhAhhh2LP(Lam,vvSM,cplAhAhhh)



cplhhhhhh = 0._dp 
Call Couplinghhhhhh2LP(Lam,vvSM,cplhhhhhh)



cplhhHpcHp = 0._dp 
Call CouplinghhHpcHp2LP(Lam,vvSM,cplhhHpcHp)



cplVGVGVG = 0._dp 
Call CouplingVGVGVG2LP(g3,cplVGVGVG)



cplcFdFdAhL = 0._dp 
cplcFdFdAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFdAh2LP(gt1,gt2,Yd,ZDL,ZDR,cplcFdFdAhL(gt1,gt2),cplcFdFdAhR(gt1,gt2))

 End Do 
End Do 


cplcFeFeAhL = 0._dp 
cplcFeFeAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFeFeAh2LP(gt1,gt2,Ye,ZEL,ZER,cplcFeFeAhL(gt1,gt2),cplcFeFeAhR(gt1,gt2))

 End Do 
End Do 


cplcFuFuAhL = 0._dp 
cplcFuFuAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFuAh2LP(gt1,gt2,Yu,ZUL,ZUR,cplcFuFuAhL(gt1,gt2),cplcFuFuAhR(gt1,gt2))

 End Do 
End Do 


cplcFdFdhhL = 0._dp 
cplcFdFdhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFdhh2LP(gt1,gt2,Yd,ZDL,ZDR,cplcFdFdhhL(gt1,gt2),cplcFdFdhhR(gt1,gt2))

 End Do 
End Do 


cplcFuFdHpL = 0._dp 
cplcFuFdHpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFdHp2LP(gt1,gt2,Yu,Yd,ZDL,ZDR,ZUL,ZUR,cplcFuFdHpL(gt1,gt2)            & 
& ,cplcFuFdHpR(gt1,gt2))

 End Do 
End Do 


cplcFeFehhL = 0._dp 
cplcFeFehhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFeFehh2LP(gt1,gt2,Ye,ZEL,ZER,cplcFeFehhL(gt1,gt2),cplcFeFehhR(gt1,gt2))

 End Do 
End Do 


cplcFvFeHpL = 0._dp 
cplcFvFeHpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFvFeHp2LP(gt1,gt2,Ye,ZER,cplcFvFeHpL(gt1,gt2),cplcFvFeHpR(gt1,gt2))

 End Do 
End Do 


cplcFuFuhhL = 0._dp 
cplcFuFuhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFuhh2LP(gt1,gt2,Yu,ZUL,ZUR,cplcFuFuhhL(gt1,gt2),cplcFuFuhhR(gt1,gt2))

 End Do 
End Do 


cplcFdFucHpL = 0._dp 
cplcFdFucHpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFucHp2LP(gt1,gt2,Yu,Yd,ZDL,ZDR,ZUL,ZUR,cplcFdFucHpL(gt1,gt2)          & 
& ,cplcFdFucHpR(gt1,gt2))

 End Do 
End Do 


cplcFeFvcHpL = 0._dp 
cplcFeFvcHpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFeFvcHp2LP(gt1,gt2,Ye,ZER,cplcFeFvcHpL(gt1,gt2),cplcFeFvcHpR(gt1,gt2))

 End Do 
End Do 


cplcFdFdVGL = 0._dp 
cplcFdFdVGR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFdVG2LP(gt1,gt2,g3,cplcFdFdVGL(gt1,gt2),cplcFdFdVGR(gt1,gt2))

 End Do 
End Do 


cplcFuFuVGL = 0._dp 
cplcFuFuVGR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFuVG2LP(gt1,gt2,g3,cplcFuFuVGL(gt1,gt2),cplcFuFuVGR(gt1,gt2))

 End Do 
End Do 


Iname = Iname - 1 
End Subroutine CouplingsFor2LPole3

Subroutine CouplingAhAhhh2LP(Lam,vvSM,res)

Implicit None 

Real(dp), Intent(in) :: vvSM

Complex(dp), Intent(in) :: Lam

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhhh' 
 
res = 0._dp 
res = res-(vvSM*Lam)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhhh2LP  
 
 
Subroutine Couplinghhhhhh2LP(Lam,vvSM,res)

Implicit None 

Real(dp), Intent(in) :: vvSM

Complex(dp), Intent(in) :: Lam

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'Couplinghhhhhh' 
 
res = 0._dp 
res = res-3*vvSM*Lam
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine Couplinghhhhhh2LP  
 
 
Subroutine CouplinghhHpcHp2LP(Lam,vvSM,res)

Implicit None 

Real(dp), Intent(in) :: vvSM

Complex(dp), Intent(in) :: Lam

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhHpcHp' 
 
res = 0._dp 
res = res-(vvSM*Lam)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhHpcHp2LP  
 
 
Subroutine CouplingVGVGVG2LP(g3,res)

Implicit None 

Real(dp), Intent(in) :: g3

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingVGVGVG' 
 
res = 0._dp 
res = res+g3
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingVGVGVG2LP  
 
 
Subroutine CouplingcFdFdAh2LP(gt1,gt2,Yd,ZDL,ZDR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Complex(dp), Intent(in) :: Yd(3,3),ZDL(3,3),ZDR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFdFdAh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(ZDR(gt1,j1))*Conjg(ZDL(gt2,j2))*Yd(j1,j2))/sqrt(2._dp))
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+(Conjg(Yd(j1,j2))*ZDR(gt2,j1)*ZDL(gt1,j2))/sqrt(2._dp)
End Do 
End Do 
resL = -(0.,1.)*resL 
 
resR = -(0.,1.)*resR 
 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFdFdAh2LP  
 
 
Subroutine CouplingcFeFeAh2LP(gt1,gt2,Ye,ZEL,ZER,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Complex(dp), Intent(in) :: Ye(3,3),ZEL(3,3),ZER(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFeFeAh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(ZER(gt1,j1))*Conjg(ZEL(gt2,j2))*Ye(j1,j2))/sqrt(2._dp))
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+(Conjg(Ye(j1,j2))*ZER(gt2,j1)*ZEL(gt1,j2))/sqrt(2._dp)
End Do 
End Do 
resL = -(0.,1.)*resL 
 
resR = -(0.,1.)*resR 
 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFeFeAh2LP  
 
 
Subroutine CouplingcFuFuAh2LP(gt1,gt2,Yu,ZUL,ZUR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Complex(dp), Intent(in) :: Yu(3,3),ZUL(3,3),ZUR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFuFuAh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(ZUR(gt1,j1))*Conjg(ZUL(gt2,j2))*Yu(j1,j2))/sqrt(2._dp)
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(Yu(j1,j2))*ZUR(gt2,j1)*ZUL(gt1,j2))/sqrt(2._dp))
End Do 
End Do 
resL = -(0.,1.)*resL 
 
resR = -(0.,1.)*resR 
 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFuFuAh2LP  
 
 
Subroutine CouplingcFdFdhh2LP(gt1,gt2,Yd,ZDL,ZDR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Complex(dp), Intent(in) :: Yd(3,3),ZDL(3,3),ZDR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFdFdhh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(ZDR(gt1,j1))*Conjg(ZDL(gt2,j2))*Yd(j1,j2))/sqrt(2._dp))
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(Yd(j1,j2))*ZDR(gt2,j1)*ZDL(gt1,j2))/sqrt(2._dp))
End Do 
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFdFdhh2LP  
 
 
Subroutine CouplingcFuFdHp2LP(gt1,gt2,Yu,Yd,ZDL,ZDR,ZUL,ZUR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Complex(dp), Intent(in) :: Yu(3,3),Yd(3,3),ZDL(3,3),ZDR(3,3),ZUL(3,3),ZUR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFuFdHp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+Conjg(ZUR(gt1,j1))*Conjg(ZDL(gt2,j2))*Yu(j1,j2)
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-(Conjg(Yd(j1,j2))*ZDR(gt2,j1)*ZUL(gt1,j2))
End Do 
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFuFdHp2LP  
 
 
Subroutine CouplingcFeFehh2LP(gt1,gt2,Ye,ZEL,ZER,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Complex(dp), Intent(in) :: Ye(3,3),ZEL(3,3),ZER(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFeFehh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(ZER(gt1,j1))*Conjg(ZEL(gt2,j2))*Ye(j1,j2))/sqrt(2._dp))
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(Ye(j1,j2))*ZER(gt2,j1)*ZEL(gt1,j2))/sqrt(2._dp))
End Do 
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFeFehh2LP  
 
 
Subroutine CouplingcFvFeHp2LP(gt1,gt2,Ye,ZER,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Complex(dp), Intent(in) :: Ye(3,3),ZER(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFvFeHp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
resR = 0._dp 
Do j1 = 1,3
resR = resR-(Conjg(Ye(j1,gt1))*ZER(gt2,j1))
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFvFeHp2LP  
 
 
Subroutine CouplingcFuFuhh2LP(gt1,gt2,Yu,ZUL,ZUR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Complex(dp), Intent(in) :: Yu(3,3),ZUL(3,3),ZUR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFuFuhh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(ZUR(gt1,j1))*Conjg(ZUL(gt2,j2))*Yu(j1,j2))/sqrt(2._dp))
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(Yu(j1,j2))*ZUR(gt2,j1)*ZUL(gt1,j2))/sqrt(2._dp))
End Do 
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFuFuhh2LP  
 
 
Subroutine CouplingcFdFucHp2LP(gt1,gt2,Yu,Yd,ZDL,ZDR,ZUL,ZUR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Complex(dp), Intent(in) :: Yu(3,3),Yd(3,3),ZDL(3,3),ZDR(3,3),ZUL(3,3),ZUR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFdFucHp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-(Conjg(ZDR(gt1,j1))*Conjg(ZUL(gt2,j2))*Yd(j1,j2))
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+Conjg(Yu(j1,j2))*ZUR(gt2,j1)*ZDL(gt1,j2)
End Do 
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFdFucHp2LP  
 
 
Subroutine CouplingcFeFvcHp2LP(gt1,gt2,Ye,ZER,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Complex(dp), Intent(in) :: Ye(3,3),ZER(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFeFvcHp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j1 = 1,3
resL = resL-(Conjg(ZER(gt1,j1))*Ye(j1,gt2))
End Do 
resR = 0._dp 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFeFvcHp2LP  
 
 
Subroutine CouplingcFdFdVG2LP(gt1,gt2,g3,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g3

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFdFdVG' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.eq.gt2)) Then 
resL = resL-1._dp*(g3)
End If 
resR = 0._dp 
If ((gt1.eq.gt2)) Then 
resR = resR-1._dp*(g3)
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFdFdVG2LP  
 
 
Subroutine CouplingcFuFuVG2LP(gt1,gt2,g3,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g3

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFuFuVG' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.eq.gt2)) Then 
resL = resL-1._dp*(g3)
End If 
resR = 0._dp 
If ((gt1.eq.gt2)) Then 
resR = resR-1._dp*(g3)
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFuFuVG2LP  
 
 
Subroutine CouplingsFor2LPole4(Lam,cplAhAhAhAh,cplAhAhhhhh,cplAhAhHpcHp,              & 
& cplhhhhhhhh,cplhhhhHpcHp,cplHpHpcHpcHp)

Implicit None 
Complex(dp), Intent(in) :: Lam

Complex(dp), Intent(out) :: cplAhAhAhAh,cplAhAhhhhh,cplAhAhHpcHp,cplhhhhhhhh,cplhhhhHpcHp,cplHpHpcHpcHp

Integer :: gt1, gt2, gt3, gt4, ct1, ct2, ct3, ct4

Iname = Iname + 1 
NameOfUnit(Iname) = 'CouplingsFor2LPole4'
 
cplAhAhAhAh = 0._dp 
Call CouplingAhAhAhAh2LP(Lam,cplAhAhAhAh)



cplAhAhhhhh = 0._dp 
Call CouplingAhAhhhhh2LP(Lam,cplAhAhhhhh)



cplAhAhHpcHp = 0._dp 
Call CouplingAhAhHpcHp2LP(Lam,cplAhAhHpcHp)



cplhhhhhhhh = 0._dp 
Call Couplinghhhhhhhh2LP(Lam,cplhhhhhhhh)



cplhhhhHpcHp = 0._dp 
Call CouplinghhhhHpcHp2LP(Lam,cplhhhhHpcHp)



cplHpHpcHpcHp = 0._dp 
Call CouplingHpHpcHpcHp2LP(Lam,cplHpHpcHpcHp)



Iname = Iname - 1 
End Subroutine CouplingsFor2LPole4

Subroutine CouplingAhAhAhAh2LP(Lam,res)

Implicit None 

Complex(dp), Intent(in) :: Lam

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhAhAh' 
 
res = 0._dp 
res = res-3._dp*(Lam)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhAhAh2LP  
 
 
Subroutine CouplingAhAhhhhh2LP(Lam,res)

Implicit None 

Complex(dp), Intent(in) :: Lam

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhhhhh' 
 
res = 0._dp 
res = res-1._dp*(Lam)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhhhhh2LP  
 
 
Subroutine CouplingAhAhHpcHp2LP(Lam,res)

Implicit None 

Complex(dp), Intent(in) :: Lam

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhHpcHp' 
 
res = 0._dp 
res = res-1._dp*(Lam)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhHpcHp2LP  
 
 
Subroutine Couplinghhhhhhhh2LP(Lam,res)

Implicit None 

Complex(dp), Intent(in) :: Lam

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'Couplinghhhhhhhh' 
 
res = 0._dp 
res = res-3._dp*(Lam)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine Couplinghhhhhhhh2LP  
 
 
Subroutine CouplinghhhhHpcHp2LP(Lam,res)

Implicit None 

Complex(dp), Intent(in) :: Lam

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhhhHpcHp' 
 
res = 0._dp 
res = res-1._dp*(Lam)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhhhHpcHp2LP  
 
 
Subroutine CouplingHpHpcHpcHp2LP(Lam,res)

Implicit None 

Complex(dp), Intent(in) :: Lam

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingHpHpcHpcHp' 
 
res = 0._dp 
res = res-2._dp*(Lam)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingHpHpcHpcHp2LP  
 
 
Subroutine CouplingsForLoopMasses(Yd,ZDL,ZDR,g3,g1,g2,TW,Yu,ZUL,ZUR,Ye,               & 
& ZEL,ZER,vvSM,Lam,cplcUFdFdAhL,cplcUFdFdAhR,cplcUFdFdhhL,cplcUFdFdhhR,cplcUFdFdVGL,     & 
& cplcUFdFdVGR,cplcUFdFdVPL,cplcUFdFdVPR,cplcUFdFdVZL,cplcUFdFdVZR,cplcUFdFucHpL,        & 
& cplcUFdFucHpR,cplcUFdFucVWpL,cplcUFdFucVWpR,cplcUFuFuAhL,cplcUFuFuAhR,cplcUFuFdHpL,    & 
& cplcUFuFdHpR,cplcUFuFdVWpL,cplcUFuFdVWpR,cplcUFuFuhhL,cplcUFuFuhhR,cplcUFuFuVGL,       & 
& cplcUFuFuVGR,cplcUFuFuVPL,cplcUFuFuVPR,cplcUFuFuVZL,cplcUFuFuVZR,cplcUFeFeAhL,         & 
& cplcUFeFeAhR,cplcUFeFehhL,cplcUFeFehhR,cplcUFeFeVPL,cplcUFeFeVPR,cplcUFeFeVZL,         & 
& cplcUFeFeVZR,cplcUFeFvcHpL,cplcUFeFvcHpR,cplcUFeFvcVWpL,cplcUFeFvcVWpR,cplcUFvFeHpL,   & 
& cplcUFvFeHpR,cplcUFvFeVWpL,cplcUFvFeVWpR,cplcUFvFvVZL,cplcUFvFvVZR,cplAhcHpVWp,        & 
& cplcFdFucHpL,cplcFdFucHpR,cplcFeFvcHpL,cplcFeFvcHpR,cplcgZgWpcHp,cplcgWpgZHp,          & 
& cplcgWCgZcHp,cplcgZgWCHp,cplhhHpcHp,cplhhcHpVWp,cplHpcHpVP,cplHpcHpVZ,cplcHpVPVWp,     & 
& cplcHpVWpVZ,cplAhAhHpcHp,cplhhhhHpcHp,cplHpHpcHpcHp,cplHpcHpVPVP,cplHpcHpcVWpVWp,      & 
& cplHpcHpVZVZ,cplAhAhhh,cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,    & 
& cplcFuFuAhR,cplcgWpgWpAh,cplcgWCgWCAh,cplAhhhVZ,cplAhHpcVWp,cplAhAhAhAh,               & 
& cplAhAhhhhh,cplAhAhcVWpVWp,cplAhAhVZVZ,cplcFdFdhhL,cplcFdFdhhR,cplcFeFehhL,            & 
& cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,cplcgWpgWphh,cplcgWCgWChh,cplcgZgZhh,              & 
& cplhhhhhh,cplhhHpcVWp,cplhhcVWpVWp,cplhhVZVZ,cplhhhhhhhh,cplhhhhcVWpVWp,               & 
& cplhhhhVZVZ,cplcFdFdVGL,cplcFdFdVGR,cplcFuFuVGL,cplcFuFuVGR,cplcgGgGVG,cplVGVGVG,      & 
& cplVGVGVGVG1,cplVGVGVGVG2,cplVGVGVGVG3,cplcFdFdVPL,cplcFdFdVPR,cplcFeFeVPL,            & 
& cplcFeFeVPR,cplcFuFuVPL,cplcFuFuVPR,cplcgWpgWpVP,cplcgWCgWCVP,cplHpcVWpVP,             & 
& cplcVWpVPVWp,cplcVWpVPVPVWp1,cplcVWpVPVPVWp2,cplcVWpVPVPVWp3,cplcFdFdVZL,              & 
& cplcFdFdVZR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuVZL,cplcFuFuVZR,cplcFvFvVZL,               & 
& cplcFvFvVZR,cplcgWpgWpVZ,cplcgWCgWCVZ,cplHpcVWpVZ,cplcVWpVWpVZ,cplcVWpVWpVZVZ1,        & 
& cplcVWpVWpVZVZ2,cplcVWpVWpVZVZ3,cplcFdFucVWpL,cplcFdFucVWpR,cplcFeFvcVWpL,             & 
& cplcFeFvcVWpR,cplcgWCgAcVWp,cplcgAgWpcVWp,cplcgZgWpcVWp,cplcgWCgZcVWp,cplcVWpcVWpVWpVWp1,& 
& cplcVWpcVWpVWpVWp2,cplcVWpcVWpVWpVWp3,cplHpcHpVPVZ,cplcVWpVPVWpVZ1,cplcVWpVPVWpVZ2,    & 
& cplcVWpVPVWpVZ3)

Implicit None 
Real(dp), Intent(in) :: g3,g1,g2,TW,vvSM

Complex(dp), Intent(in) :: Yd(3,3),ZDL(3,3),ZDR(3,3),Yu(3,3),ZUL(3,3),ZUR(3,3),Ye(3,3),ZEL(3,3),ZER(3,3),Lam

Complex(dp), Intent(out) :: cplcUFdFdAhL(3,3),cplcUFdFdAhR(3,3),cplcUFdFdhhL(3,3),cplcUFdFdhhR(3,3),              & 
& cplcUFdFdVGL(3,3),cplcUFdFdVGR(3,3),cplcUFdFdVPL(3,3),cplcUFdFdVPR(3,3),               & 
& cplcUFdFdVZL(3,3),cplcUFdFdVZR(3,3),cplcUFdFucHpL(3,3),cplcUFdFucHpR(3,3),             & 
& cplcUFdFucVWpL(3,3),cplcUFdFucVWpR(3,3),cplcUFuFuAhL(3,3),cplcUFuFuAhR(3,3),           & 
& cplcUFuFdHpL(3,3),cplcUFuFdHpR(3,3),cplcUFuFdVWpL(3,3),cplcUFuFdVWpR(3,3),             & 
& cplcUFuFuhhL(3,3),cplcUFuFuhhR(3,3),cplcUFuFuVGL(3,3),cplcUFuFuVGR(3,3),               & 
& cplcUFuFuVPL(3,3),cplcUFuFuVPR(3,3),cplcUFuFuVZL(3,3),cplcUFuFuVZR(3,3),               & 
& cplcUFeFeAhL(3,3),cplcUFeFeAhR(3,3),cplcUFeFehhL(3,3),cplcUFeFehhR(3,3),               & 
& cplcUFeFeVPL(3,3),cplcUFeFeVPR(3,3),cplcUFeFeVZL(3,3),cplcUFeFeVZR(3,3),               & 
& cplcUFeFvcHpL(3,3),cplcUFeFvcHpR(3,3),cplcUFeFvcVWpL(3,3),cplcUFeFvcVWpR(3,3),         & 
& cplcUFvFeHpL(3,3),cplcUFvFeHpR(3,3),cplcUFvFeVWpL(3,3),cplcUFvFeVWpR(3,3),             & 
& cplcUFvFvVZL(3,3),cplcUFvFvVZR(3,3),cplAhcHpVWp,cplcFdFucHpL(3,3),cplcFdFucHpR(3,3),   & 
& cplcFeFvcHpL(3,3),cplcFeFvcHpR(3,3),cplcgZgWpcHp,cplcgWpgZHp,cplcgWCgZcHp,             & 
& cplcgZgWCHp,cplhhHpcHp,cplhhcHpVWp,cplHpcHpVP,cplHpcHpVZ,cplcHpVPVWp,cplcHpVWpVZ,      & 
& cplAhAhHpcHp,cplhhhhHpcHp,cplHpHpcHpcHp,cplHpcHpVPVP,cplHpcHpcVWpVWp,cplHpcHpVZVZ,     & 
& cplAhAhhh,cplcFdFdAhL(3,3),cplcFdFdAhR(3,3),cplcFeFeAhL(3,3),cplcFeFeAhR(3,3),         & 
& cplcFuFuAhL(3,3),cplcFuFuAhR(3,3),cplcgWpgWpAh,cplcgWCgWCAh,cplAhhhVZ,cplAhHpcVWp,     & 
& cplAhAhAhAh,cplAhAhhhhh,cplAhAhcVWpVWp,cplAhAhVZVZ,cplcFdFdhhL(3,3),cplcFdFdhhR(3,3),  & 
& cplcFeFehhL(3,3),cplcFeFehhR(3,3),cplcFuFuhhL(3,3),cplcFuFuhhR(3,3),cplcgWpgWphh,      & 
& cplcgWCgWChh,cplcgZgZhh,cplhhhhhh,cplhhHpcVWp,cplhhcVWpVWp,cplhhVZVZ,cplhhhhhhhh,      & 
& cplhhhhcVWpVWp,cplhhhhVZVZ,cplcFdFdVGL(3,3),cplcFdFdVGR(3,3),cplcFuFuVGL(3,3),         & 
& cplcFuFuVGR(3,3),cplcgGgGVG,cplVGVGVG,cplVGVGVGVG1,cplVGVGVGVG2,cplVGVGVGVG3,          & 
& cplcFdFdVPL(3,3),cplcFdFdVPR(3,3),cplcFeFeVPL(3,3),cplcFeFeVPR(3,3),cplcFuFuVPL(3,3),  & 
& cplcFuFuVPR(3,3),cplcgWpgWpVP,cplcgWCgWCVP,cplHpcVWpVP,cplcVWpVPVWp,cplcVWpVPVPVWp1,   & 
& cplcVWpVPVPVWp2,cplcVWpVPVPVWp3,cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),cplcFeFeVZL(3,3),    & 
& cplcFeFeVZR(3,3),cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),cplcFvFvVZL(3,3),cplcFvFvVZR(3,3),  & 
& cplcgWpgWpVZ,cplcgWCgWCVZ,cplHpcVWpVZ,cplcVWpVWpVZ,cplcVWpVWpVZVZ1,cplcVWpVWpVZVZ2,    & 
& cplcVWpVWpVZVZ3,cplcFdFucVWpL(3,3),cplcFdFucVWpR(3,3),cplcFeFvcVWpL(3,3),              & 
& cplcFeFvcVWpR(3,3),cplcgWCgAcVWp,cplcgAgWpcVWp,cplcgZgWpcVWp,cplcgWCgZcVWp,            & 
& cplcVWpcVWpVWpVWp1,cplcVWpcVWpVWpVWp2,cplcVWpcVWpVWpVWp3,cplHpcHpVPVZ,cplcVWpVPVWpVZ1, & 
& cplcVWpVPVWpVZ2,cplcVWpVPVWpVZ3

Integer :: gt1, gt2, gt3, gt4, ct1, ct2, ct3, ct4

Iname = Iname + 1 
NameOfUnit(Iname) = 'CouplingsForLoopMasses'
 
cplcUFdFdAhL = 0._dp 
cplcUFdFdAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcUFdFdAhL(gt1,gt2,Yd,ZDL,ZDR,cplcUFdFdAhL(gt1,gt2),cplcUFdFdAhR(gt1,gt2))

 End Do 
End Do 


cplcUFdFdhhL = 0._dp 
cplcUFdFdhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcUFdFdhhL(gt1,gt2,Yd,ZDL,ZDR,cplcUFdFdhhL(gt1,gt2),cplcUFdFdhhR(gt1,gt2))

 End Do 
End Do 


cplcUFdFdVGL = 0._dp 
cplcUFdFdVGR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcUFdFdVGL(gt1,gt2,g3,ZDL,ZDR,cplcUFdFdVGL(gt1,gt2),cplcUFdFdVGR(gt1,gt2))

 End Do 
End Do 


cplcUFdFdVPL = 0._dp 
cplcUFdFdVPR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcUFdFdVPL(gt1,gt2,g1,g2,ZDL,ZDR,TW,cplcUFdFdVPL(gt1,gt2),cplcUFdFdVPR(gt1,gt2))

 End Do 
End Do 


cplcUFdFdVZL = 0._dp 
cplcUFdFdVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcUFdFdVZL(gt1,gt2,g1,g2,ZDL,ZDR,TW,cplcUFdFdVZL(gt1,gt2),cplcUFdFdVZR(gt1,gt2))

 End Do 
End Do 


cplcUFdFucHpL = 0._dp 
cplcUFdFucHpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcUFdFucHpL(gt1,gt2,Yu,Yd,ZUL,ZUR,cplcUFdFucHpL(gt1,gt2),cplcUFdFucHpR(gt1,gt2))

 End Do 
End Do 


cplcUFdFucVWpL = 0._dp 
cplcUFdFucVWpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcUFdFucVWpL(gt1,gt2,g2,ZUL,cplcUFdFucVWpL(gt1,gt2),cplcUFdFucVWpR(gt1,gt2))

 End Do 
End Do 


cplcUFuFuAhL = 0._dp 
cplcUFuFuAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcUFuFuAhL(gt1,gt2,Yu,ZUL,ZUR,cplcUFuFuAhL(gt1,gt2),cplcUFuFuAhR(gt1,gt2))

 End Do 
End Do 


cplcUFuFdHpL = 0._dp 
cplcUFuFdHpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcUFuFdHpL(gt1,gt2,Yu,Yd,ZDL,ZDR,cplcUFuFdHpL(gt1,gt2),cplcUFuFdHpR(gt1,gt2))

 End Do 
End Do 


cplcUFuFdVWpL = 0._dp 
cplcUFuFdVWpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcUFuFdVWpL(gt1,gt2,g2,ZDL,cplcUFuFdVWpL(gt1,gt2),cplcUFuFdVWpR(gt1,gt2))

 End Do 
End Do 


cplcUFuFuhhL = 0._dp 
cplcUFuFuhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcUFuFuhhL(gt1,gt2,Yu,ZUL,ZUR,cplcUFuFuhhL(gt1,gt2),cplcUFuFuhhR(gt1,gt2))

 End Do 
End Do 


cplcUFuFuVGL = 0._dp 
cplcUFuFuVGR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcUFuFuVGL(gt1,gt2,g3,ZUL,ZUR,cplcUFuFuVGL(gt1,gt2),cplcUFuFuVGR(gt1,gt2))

 End Do 
End Do 


cplcUFuFuVPL = 0._dp 
cplcUFuFuVPR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcUFuFuVPL(gt1,gt2,g1,g2,ZUL,ZUR,TW,cplcUFuFuVPL(gt1,gt2),cplcUFuFuVPR(gt1,gt2))

 End Do 
End Do 


cplcUFuFuVZL = 0._dp 
cplcUFuFuVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcUFuFuVZL(gt1,gt2,g1,g2,ZUL,ZUR,TW,cplcUFuFuVZL(gt1,gt2),cplcUFuFuVZR(gt1,gt2))

 End Do 
End Do 


cplcUFeFeAhL = 0._dp 
cplcUFeFeAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcUFeFeAhL(gt1,gt2,Ye,ZEL,ZER,cplcUFeFeAhL(gt1,gt2),cplcUFeFeAhR(gt1,gt2))

 End Do 
End Do 


cplcUFeFehhL = 0._dp 
cplcUFeFehhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcUFeFehhL(gt1,gt2,Ye,ZEL,ZER,cplcUFeFehhL(gt1,gt2),cplcUFeFehhR(gt1,gt2))

 End Do 
End Do 


cplcUFeFeVPL = 0._dp 
cplcUFeFeVPR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcUFeFeVPL(gt1,gt2,g1,g2,ZEL,ZER,TW,cplcUFeFeVPL(gt1,gt2),cplcUFeFeVPR(gt1,gt2))

 End Do 
End Do 


cplcUFeFeVZL = 0._dp 
cplcUFeFeVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcUFeFeVZL(gt1,gt2,g1,g2,ZEL,ZER,TW,cplcUFeFeVZL(gt1,gt2),cplcUFeFeVZR(gt1,gt2))

 End Do 
End Do 


cplcUFeFvcHpL = 0._dp 
cplcUFeFvcHpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcUFeFvcHpL(gt1,gt2,Ye,cplcUFeFvcHpL(gt1,gt2),cplcUFeFvcHpR(gt1,gt2))

 End Do 
End Do 


cplcUFeFvcVWpL = 0._dp 
cplcUFeFvcVWpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcUFeFvcVWpL(gt1,gt2,g2,cplcUFeFvcVWpL(gt1,gt2),cplcUFeFvcVWpR(gt1,gt2))

 End Do 
End Do 


cplcUFvFeHpL = 0._dp 
cplcUFvFeHpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcUFvFeHpL(gt1,gt2,Ye,ZER,cplcUFvFeHpL(gt1,gt2),cplcUFvFeHpR(gt1,gt2))

 End Do 
End Do 


cplcUFvFeVWpL = 0._dp 
cplcUFvFeVWpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcUFvFeVWpL(gt1,gt2,g2,ZEL,cplcUFvFeVWpL(gt1,gt2),cplcUFvFeVWpR(gt1,gt2))

 End Do 
End Do 


cplcUFvFvVZL = 0._dp 
cplcUFvFvVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcUFvFvVZL(gt1,gt2,g1,g2,TW,cplcUFvFvVZL(gt1,gt2),cplcUFvFvVZR(gt1,gt2))

 End Do 
End Do 


cplAhcHpVWp = 0._dp 
Call CouplingAhcHpVWpL(g2,cplAhcHpVWp)



cplcFdFucHpL = 0._dp 
cplcFdFucHpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFucHpL(gt1,gt2,Yu,Yd,ZDL,ZDR,ZUL,ZUR,cplcFdFucHpL(gt1,gt2)            & 
& ,cplcFdFucHpR(gt1,gt2))

 End Do 
End Do 


cplcFeFvcHpL = 0._dp 
cplcFeFvcHpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFeFvcHpL(gt1,gt2,Ye,ZER,cplcFeFvcHpL(gt1,gt2),cplcFeFvcHpR(gt1,gt2))

 End Do 
End Do 


cplcgZgWpcHp = 0._dp 
Call CouplingcgZgWpcHpL(g1,g2,vvSM,TW,cplcgZgWpcHp)



cplcgWpgZHp = 0._dp 
Call CouplingcgWpgZHpL(g1,g2,vvSM,TW,cplcgWpgZHp)



cplcgWCgZcHp = 0._dp 
Call CouplingcgWCgZcHpL(g1,g2,vvSM,TW,cplcgWCgZcHp)



cplcgZgWCHp = 0._dp 
Call CouplingcgZgWCHpL(g1,g2,vvSM,TW,cplcgZgWCHp)



cplhhHpcHp = 0._dp 
Call CouplinghhHpcHpL(Lam,vvSM,cplhhHpcHp)



cplhhcHpVWp = 0._dp 
Call CouplinghhcHpVWpL(g2,cplhhcHpVWp)



cplHpcHpVP = 0._dp 
Call CouplingHpcHpVPL(g1,g2,TW,cplHpcHpVP)



cplHpcHpVZ = 0._dp 
Call CouplingHpcHpVZL(g1,g2,TW,cplHpcHpVZ)



cplcHpVPVWp = 0._dp 
Call CouplingcHpVPVWpL(g1,g2,vvSM,TW,cplcHpVPVWp)



cplcHpVWpVZ = 0._dp 
Call CouplingcHpVWpVZL(g1,g2,vvSM,TW,cplcHpVWpVZ)



cplAhAhHpcHp = 0._dp 
Call CouplingAhAhHpcHpL(Lam,cplAhAhHpcHp)



cplhhhhHpcHp = 0._dp 
Call CouplinghhhhHpcHpL(Lam,cplhhhhHpcHp)



cplHpHpcHpcHp = 0._dp 
Call CouplingHpHpcHpcHpL(Lam,cplHpHpcHpcHp)



cplHpcHpVPVP = 0._dp 
Call CouplingHpcHpVPVPL(g1,g2,TW,cplHpcHpVPVP)



cplHpcHpcVWpVWp = 0._dp 
Call CouplingHpcHpcVWpVWpL(g2,cplHpcHpcVWpVWp)



cplHpcHpVZVZ = 0._dp 
Call CouplingHpcHpVZVZL(g1,g2,TW,cplHpcHpVZVZ)



cplAhAhhh = 0._dp 
Call CouplingAhAhhhL(Lam,vvSM,cplAhAhhh)



cplcFdFdAhL = 0._dp 
cplcFdFdAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFdAhL(gt1,gt2,Yd,ZDL,ZDR,cplcFdFdAhL(gt1,gt2),cplcFdFdAhR(gt1,gt2))

 End Do 
End Do 


cplcFeFeAhL = 0._dp 
cplcFeFeAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFeFeAhL(gt1,gt2,Ye,ZEL,ZER,cplcFeFeAhL(gt1,gt2),cplcFeFeAhR(gt1,gt2))

 End Do 
End Do 


cplcFuFuAhL = 0._dp 
cplcFuFuAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFuAhL(gt1,gt2,Yu,ZUL,ZUR,cplcFuFuAhL(gt1,gt2),cplcFuFuAhR(gt1,gt2))

 End Do 
End Do 


cplcgWpgWpAh = 0._dp 
Call CouplingcgWpgWpAhL(g2,vvSM,cplcgWpgWpAh)



cplcgWCgWCAh = 0._dp 
Call CouplingcgWCgWCAhL(g2,vvSM,cplcgWCgWCAh)



cplAhhhVZ = 0._dp 
Call CouplingAhhhVZL(g1,g2,TW,cplAhhhVZ)



cplAhHpcVWp = 0._dp 
Call CouplingAhHpcVWpL(g2,cplAhHpcVWp)



cplAhAhAhAh = 0._dp 
Call CouplingAhAhAhAhL(Lam,cplAhAhAhAh)



cplAhAhhhhh = 0._dp 
Call CouplingAhAhhhhhL(Lam,cplAhAhhhhh)



cplAhAhcVWpVWp = 0._dp 
Call CouplingAhAhcVWpVWpL(g2,cplAhAhcVWpVWp)



cplAhAhVZVZ = 0._dp 
Call CouplingAhAhVZVZL(g1,g2,TW,cplAhAhVZVZ)



cplcFdFdhhL = 0._dp 
cplcFdFdhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFdhhL(gt1,gt2,Yd,ZDL,ZDR,cplcFdFdhhL(gt1,gt2),cplcFdFdhhR(gt1,gt2))

 End Do 
End Do 


cplcFeFehhL = 0._dp 
cplcFeFehhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFeFehhL(gt1,gt2,Ye,ZEL,ZER,cplcFeFehhL(gt1,gt2),cplcFeFehhR(gt1,gt2))

 End Do 
End Do 


cplcFuFuhhL = 0._dp 
cplcFuFuhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFuhhL(gt1,gt2,Yu,ZUL,ZUR,cplcFuFuhhL(gt1,gt2),cplcFuFuhhR(gt1,gt2))

 End Do 
End Do 


cplcgWpgWphh = 0._dp 
Call CouplingcgWpgWphhL(g2,vvSM,cplcgWpgWphh)



cplcgWCgWChh = 0._dp 
Call CouplingcgWCgWChhL(g2,vvSM,cplcgWCgWChh)



cplcgZgZhh = 0._dp 
Call CouplingcgZgZhhL(g1,g2,vvSM,TW,cplcgZgZhh)



cplhhhhhh = 0._dp 
Call CouplinghhhhhhL(Lam,vvSM,cplhhhhhh)



cplhhHpcVWp = 0._dp 
Call CouplinghhHpcVWpL(g2,cplhhHpcVWp)



cplhhcVWpVWp = 0._dp 
Call CouplinghhcVWpVWpL(g2,vvSM,cplhhcVWpVWp)



cplhhVZVZ = 0._dp 
Call CouplinghhVZVZL(g1,g2,vvSM,TW,cplhhVZVZ)



cplhhhhhhhh = 0._dp 
Call CouplinghhhhhhhhL(Lam,cplhhhhhhhh)



cplhhhhcVWpVWp = 0._dp 
Call CouplinghhhhcVWpVWpL(g2,cplhhhhcVWpVWp)



cplhhhhVZVZ = 0._dp 
Call CouplinghhhhVZVZL(g1,g2,TW,cplhhhhVZVZ)



cplcFdFdVGL = 0._dp 
cplcFdFdVGR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFdVGL(gt1,gt2,g3,cplcFdFdVGL(gt1,gt2),cplcFdFdVGR(gt1,gt2))

 End Do 
End Do 


cplcFuFuVGL = 0._dp 
cplcFuFuVGR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFuVGL(gt1,gt2,g3,cplcFuFuVGL(gt1,gt2),cplcFuFuVGR(gt1,gt2))

 End Do 
End Do 


cplcgGgGVG = 0._dp 
Call CouplingcgGgGVGL(g3,cplcgGgGVG)



cplVGVGVG = 0._dp 
Call CouplingVGVGVGL(g3,cplVGVGVG)



cplVGVGVGVG1 = 0._dp 
cplVGVGVGVG2 = 0._dp 
cplVGVGVGVG3 = 0._dp 
Call CouplingVGVGVGVGL(g3,cplVGVGVGVG1,cplVGVGVGVG2,cplVGVGVGVG3)



cplcFdFdVPL = 0._dp 
cplcFdFdVPR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFdVPL(gt1,gt2,g1,g2,TW,cplcFdFdVPL(gt1,gt2),cplcFdFdVPR(gt1,gt2))

 End Do 
End Do 


cplcFeFeVPL = 0._dp 
cplcFeFeVPR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFeFeVPL(gt1,gt2,g1,g2,TW,cplcFeFeVPL(gt1,gt2),cplcFeFeVPR(gt1,gt2))

 End Do 
End Do 


cplcFuFuVPL = 0._dp 
cplcFuFuVPR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFuVPL(gt1,gt2,g1,g2,TW,cplcFuFuVPL(gt1,gt2),cplcFuFuVPR(gt1,gt2))

 End Do 
End Do 


cplcgWpgWpVP = 0._dp 
Call CouplingcgWpgWpVPL(g2,TW,cplcgWpgWpVP)



cplcgWCgWCVP = 0._dp 
Call CouplingcgWCgWCVPL(g2,TW,cplcgWCgWCVP)



cplHpcVWpVP = 0._dp 
Call CouplingHpcVWpVPL(g1,g2,vvSM,TW,cplHpcVWpVP)



cplcVWpVPVWp = 0._dp 
Call CouplingcVWpVPVWpL(g2,TW,cplcVWpVPVWp)



cplcVWpVPVPVWp1 = 0._dp 
cplcVWpVPVPVWp2 = 0._dp 
cplcVWpVPVPVWp3 = 0._dp 
Call CouplingcVWpVPVPVWpL(g2,TW,cplcVWpVPVPVWp1,cplcVWpVPVPVWp2,cplcVWpVPVPVWp3)



cplcFdFdVZL = 0._dp 
cplcFdFdVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFdVZL(gt1,gt2,g1,g2,TW,cplcFdFdVZL(gt1,gt2),cplcFdFdVZR(gt1,gt2))

 End Do 
End Do 


cplcFeFeVZL = 0._dp 
cplcFeFeVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFeFeVZL(gt1,gt2,g1,g2,TW,cplcFeFeVZL(gt1,gt2),cplcFeFeVZR(gt1,gt2))

 End Do 
End Do 


cplcFuFuVZL = 0._dp 
cplcFuFuVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFuVZL(gt1,gt2,g1,g2,TW,cplcFuFuVZL(gt1,gt2),cplcFuFuVZR(gt1,gt2))

 End Do 
End Do 


cplcFvFvVZL = 0._dp 
cplcFvFvVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFvFvVZL(gt1,gt2,g1,g2,TW,cplcFvFvVZL(gt1,gt2),cplcFvFvVZR(gt1,gt2))

 End Do 
End Do 


cplcgWpgWpVZ = 0._dp 
Call CouplingcgWpgWpVZL(g2,TW,cplcgWpgWpVZ)



cplcgWCgWCVZ = 0._dp 
Call CouplingcgWCgWCVZL(g2,TW,cplcgWCgWCVZ)



cplHpcVWpVZ = 0._dp 
Call CouplingHpcVWpVZL(g1,g2,vvSM,TW,cplHpcVWpVZ)



cplcVWpVWpVZ = 0._dp 
Call CouplingcVWpVWpVZL(g2,TW,cplcVWpVWpVZ)



cplcVWpVWpVZVZ1 = 0._dp 
cplcVWpVWpVZVZ2 = 0._dp 
cplcVWpVWpVZVZ3 = 0._dp 
Call CouplingcVWpVWpVZVZL(g2,TW,cplcVWpVWpVZVZ1,cplcVWpVWpVZVZ2,cplcVWpVWpVZVZ3)



cplcFdFucVWpL = 0._dp 
cplcFdFucVWpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFucVWpL(gt1,gt2,g2,ZDL,ZUL,cplcFdFucVWpL(gt1,gt2),cplcFdFucVWpR(gt1,gt2))

 End Do 
End Do 


cplcFeFvcVWpL = 0._dp 
cplcFeFvcVWpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFeFvcVWpL(gt1,gt2,g2,ZEL,cplcFeFvcVWpL(gt1,gt2),cplcFeFvcVWpR(gt1,gt2))

 End Do 
End Do 


cplcgWCgAcVWp = 0._dp 
Call CouplingcgWCgAcVWpL(g2,TW,cplcgWCgAcVWp)



cplcgAgWpcVWp = 0._dp 
Call CouplingcgAgWpcVWpL(g2,TW,cplcgAgWpcVWp)



cplcgZgWpcVWp = 0._dp 
Call CouplingcgZgWpcVWpL(g2,TW,cplcgZgWpcVWp)



cplcgWCgZcVWp = 0._dp 
Call CouplingcgWCgZcVWpL(g2,TW,cplcgWCgZcVWp)



cplcVWpcVWpVWpVWp1 = 0._dp 
cplcVWpcVWpVWpVWp2 = 0._dp 
cplcVWpcVWpVWpVWp3 = 0._dp 
Call CouplingcVWpcVWpVWpVWpL(g2,cplcVWpcVWpVWpVWp1,cplcVWpcVWpVWpVWp2,cplcVWpcVWpVWpVWp3)



cplHpcHpVPVZ = 0._dp 
Call CouplingHpcHpVPVZL(g1,g2,TW,cplHpcHpVPVZ)



cplcVWpVPVWpVZ1 = 0._dp 
cplcVWpVPVWpVZ2 = 0._dp 
cplcVWpVPVWpVZ3 = 0._dp 
Call CouplingcVWpVPVWpVZL(g2,TW,cplcVWpVPVWpVZ1,cplcVWpVPVWpVZ2,cplcVWpVPVWpVZ3)



Iname = Iname - 1 
End Subroutine CouplingsForLoopMasses

Subroutine CouplingcUFdFdAhL(gt1,gt2,Yd,ZDL,ZDR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Complex(dp), Intent(in) :: Yd(3,3),ZDL(3,3),ZDR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcUFdFdAh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
Do j2 = 1,3
resL = resL-((Conjg(ZDL(gt2,j2))*Yd(gt1,j2))/sqrt(2._dp))
End Do 
End If 
resR = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
Do j1 = 1,3
resR = resR+(Conjg(Yd(j1,gt1))*ZDR(gt2,j1))/sqrt(2._dp)
End Do 
End If 
resL = -(0.,1.)*resL 
 
resR = -(0.,1.)*resR 
 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcUFdFdAhL  
 
 
Subroutine CouplingcUFdFdhhL(gt1,gt2,Yd,ZDL,ZDR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Complex(dp), Intent(in) :: Yd(3,3),ZDL(3,3),ZDR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcUFdFdhh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
Do j2 = 1,3
resL = resL-((Conjg(ZDL(gt2,j2))*Yd(gt1,j2))/sqrt(2._dp))
End Do 
End If 
resR = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
Do j1 = 1,3
resR = resR-((Conjg(Yd(j1,gt1))*ZDR(gt2,j1))/sqrt(2._dp))
End Do 
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcUFdFdhhL  
 
 
Subroutine CouplingcUFdFdVGL(gt1,gt2,g3,ZDL,ZDR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g3

Complex(dp), Intent(in) :: ZDL(3,3),ZDR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcUFdFdVG' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resL = resL-(g3*Conjg(ZDL(gt2,gt1)))
End If 
resR = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resR = resR-(g3*ZDR(gt2,gt1))
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcUFdFdVGL  
 
 
Subroutine CouplingcUFdFdVPL(gt1,gt2,g1,g2,ZDL,ZDR,TW,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(in) :: ZDL(3,3),ZDR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcUFdFdVP' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resL = resL-1._dp/6._dp*(g1*Conjg(ZDL(gt2,gt1))*Cos(TW))
End If 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resL = resL+(g2*Conjg(ZDL(gt2,gt1))*Sin(TW))/2._dp
End If 
resR = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resR = resR+(g1*Cos(TW)*ZDR(gt2,gt1))/3._dp
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcUFdFdVPL  
 
 
Subroutine CouplingcUFdFdVZL(gt1,gt2,g1,g2,ZDL,ZDR,TW,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(in) :: ZDL(3,3),ZDR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcUFdFdVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resL = resL+(g2*Conjg(ZDL(gt2,gt1))*Cos(TW))/2._dp
End If 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resL = resL+(g1*Conjg(ZDL(gt2,gt1))*Sin(TW))/6._dp
End If 
resR = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resR = resR-1._dp/3._dp*(g1*Sin(TW)*ZDR(gt2,gt1))
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcUFdFdVZL  
 
 
Subroutine CouplingcUFdFucHpL(gt1,gt2,Yu,Yd,ZUL,ZUR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Complex(dp), Intent(in) :: Yu(3,3),Yd(3,3),ZUL(3,3),ZUR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcUFdFucHp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
Do j2 = 1,3
resL = resL-(Conjg(ZUL(gt2,j2))*Yd(gt1,j2))
End Do 
End If 
resR = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
Do j1 = 1,3
resR = resR+Conjg(Yu(j1,gt1))*ZUR(gt2,j1)
End Do 
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcUFdFucHpL  
 
 
Subroutine CouplingcUFdFucVWpL(gt1,gt2,g2,ZUL,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g2

Complex(dp), Intent(in) :: ZUL(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcUFdFucVWp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resL = resL-((g2*Conjg(ZUL(gt2,gt1)))/sqrt(2._dp))
End If 
resR = 0._dp 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcUFdFucVWpL  
 
 
Subroutine CouplingcUFuFuAhL(gt1,gt2,Yu,ZUL,ZUR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Complex(dp), Intent(in) :: Yu(3,3),ZUL(3,3),ZUR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcUFuFuAh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
Do j2 = 1,3
resL = resL+(Conjg(ZUL(gt2,j2))*Yu(gt1,j2))/sqrt(2._dp)
End Do 
End If 
resR = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
Do j1 = 1,3
resR = resR-((Conjg(Yu(j1,gt1))*ZUR(gt2,j1))/sqrt(2._dp))
End Do 
End If 
resL = -(0.,1.)*resL 
 
resR = -(0.,1.)*resR 
 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcUFuFuAhL  
 
 
Subroutine CouplingcUFuFdHpL(gt1,gt2,Yu,Yd,ZDL,ZDR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Complex(dp), Intent(in) :: Yu(3,3),Yd(3,3),ZDL(3,3),ZDR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcUFuFdHp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
Do j2 = 1,3
resL = resL+Conjg(ZDL(gt2,j2))*Yu(gt1,j2)
End Do 
End If 
resR = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
Do j1 = 1,3
resR = resR-(Conjg(Yd(j1,gt1))*ZDR(gt2,j1))
End Do 
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcUFuFdHpL  
 
 
Subroutine CouplingcUFuFdVWpL(gt1,gt2,g2,ZDL,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g2

Complex(dp), Intent(in) :: ZDL(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcUFuFdVWp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resL = resL-((g2*Conjg(ZDL(gt2,gt1)))/sqrt(2._dp))
End If 
resR = 0._dp 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcUFuFdVWpL  
 
 
Subroutine CouplingcUFuFuhhL(gt1,gt2,Yu,ZUL,ZUR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Complex(dp), Intent(in) :: Yu(3,3),ZUL(3,3),ZUR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcUFuFuhh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
Do j2 = 1,3
resL = resL-((Conjg(ZUL(gt2,j2))*Yu(gt1,j2))/sqrt(2._dp))
End Do 
End If 
resR = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
Do j1 = 1,3
resR = resR-((Conjg(Yu(j1,gt1))*ZUR(gt2,j1))/sqrt(2._dp))
End Do 
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcUFuFuhhL  
 
 
Subroutine CouplingcUFuFuVGL(gt1,gt2,g3,ZUL,ZUR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g3

Complex(dp), Intent(in) :: ZUL(3,3),ZUR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcUFuFuVG' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resL = resL-(g3*Conjg(ZUL(gt2,gt1)))
End If 
resR = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resR = resR-(g3*ZUR(gt2,gt1))
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcUFuFuVGL  
 
 
Subroutine CouplingcUFuFuVPL(gt1,gt2,g1,g2,ZUL,ZUR,TW,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(in) :: ZUL(3,3),ZUR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcUFuFuVP' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resL = resL-1._dp/6._dp*(g1*Conjg(ZUL(gt2,gt1))*Cos(TW))
End If 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resL = resL-1._dp/2._dp*(g2*Conjg(ZUL(gt2,gt1))*Sin(TW))
End If 
resR = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resR = resR+(-2*g1*Cos(TW)*ZUR(gt2,gt1))/3._dp
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcUFuFuVPL  
 
 
Subroutine CouplingcUFuFuVZL(gt1,gt2,g1,g2,ZUL,ZUR,TW,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(in) :: ZUL(3,3),ZUR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcUFuFuVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resL = resL-1._dp/2._dp*(g2*Conjg(ZUL(gt2,gt1))*Cos(TW))
End If 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resL = resL+(g1*Conjg(ZUL(gt2,gt1))*Sin(TW))/6._dp
End If 
resR = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resR = resR+(2*g1*Sin(TW)*ZUR(gt2,gt1))/3._dp
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcUFuFuVZL  
 
 
Subroutine CouplingcUFeFeAhL(gt1,gt2,Ye,ZEL,ZER,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Complex(dp), Intent(in) :: Ye(3,3),ZEL(3,3),ZER(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcUFeFeAh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
Do j2 = 1,3
resL = resL-((Conjg(ZEL(gt2,j2))*Ye(gt1,j2))/sqrt(2._dp))
End Do 
End If 
resR = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
Do j1 = 1,3
resR = resR+(Conjg(Ye(j1,gt1))*ZER(gt2,j1))/sqrt(2._dp)
End Do 
End If 
resL = -(0.,1.)*resL 
 
resR = -(0.,1.)*resR 
 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcUFeFeAhL  
 
 
Subroutine CouplingcUFeFehhL(gt1,gt2,Ye,ZEL,ZER,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Complex(dp), Intent(in) :: Ye(3,3),ZEL(3,3),ZER(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcUFeFehh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
Do j2 = 1,3
resL = resL-((Conjg(ZEL(gt2,j2))*Ye(gt1,j2))/sqrt(2._dp))
End Do 
End If 
resR = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
Do j1 = 1,3
resR = resR-((Conjg(Ye(j1,gt1))*ZER(gt2,j1))/sqrt(2._dp))
End Do 
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcUFeFehhL  
 
 
Subroutine CouplingcUFeFeVPL(gt1,gt2,g1,g2,ZEL,ZER,TW,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(in) :: ZEL(3,3),ZER(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcUFeFeVP' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resL = resL+(g1*Conjg(ZEL(gt2,gt1))*Cos(TW))/2._dp
End If 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resL = resL+(g2*Conjg(ZEL(gt2,gt1))*Sin(TW))/2._dp
End If 
resR = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resR = resR+g1*Cos(TW)*ZER(gt2,gt1)
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcUFeFeVPL  
 
 
Subroutine CouplingcUFeFeVZL(gt1,gt2,g1,g2,ZEL,ZER,TW,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(in) :: ZEL(3,3),ZER(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcUFeFeVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resL = resL+(g2*Conjg(ZEL(gt2,gt1))*Cos(TW))/2._dp
End If 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resL = resL-1._dp/2._dp*(g1*Conjg(ZEL(gt2,gt1))*Sin(TW))
End If 
resR = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resR = resR-(g1*Sin(TW)*ZER(gt2,gt1))
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcUFeFeVZL  
 
 
Subroutine CouplingcUFeFvcHpL(gt1,gt2,Ye,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Complex(dp), Intent(in) :: Ye(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcUFeFvcHp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resL = resL-Ye(gt1,gt2)
End If 
resR = 0._dp 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcUFeFvcHpL  
 
 
Subroutine CouplingcUFeFvcVWpL(gt1,gt2,g2,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g2

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcUFeFvcVWp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.eq.gt2).And.(gt2.le.3).And.(gt2.ge.1)) Then 
resL = resL-(g2/sqrt(2._dp))
End If 
resR = 0._dp 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcUFeFvcVWpL  
 
 
Subroutine CouplingcUFvFeHpL(gt1,gt2,Ye,ZER,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Complex(dp), Intent(in) :: Ye(3,3),ZER(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcUFvFeHp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
resR = 0._dp 
Do j1 = 1,3
resR = resR-(Conjg(Ye(j1,gt1))*ZER(gt2,j1))
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcUFvFeHpL  
 
 
Subroutine CouplingcUFvFeVWpL(gt1,gt2,g2,ZEL,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g2

Complex(dp), Intent(in) :: ZEL(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcUFvFeVWp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resL = resL-((g2*Conjg(ZEL(gt2,gt1)))/sqrt(2._dp))
End If 
resR = 0._dp 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcUFvFeVWpL  
 
 
Subroutine CouplingcUFvFvVZL(gt1,gt2,g1,g2,TW,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcUFvFvVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.eq.gt2)) Then 
resL = resL-1._dp/2._dp*(g2*Cos(TW))
End If 
If ((gt1.eq.gt2)) Then 
resL = resL-1._dp/2._dp*(g1*Sin(TW))
End If 
resR = 0._dp 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcUFvFvVZL  
 
 
Subroutine CouplingAhcHpVWpL(g2,res)

Implicit None 

Real(dp), Intent(in) :: g2

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhcHpVWp' 
 
res = 0._dp 
res = res-1._dp/2._dp*g2
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhcHpVWpL  
 
 
Subroutine CouplingcFdFucHpL(gt1,gt2,Yu,Yd,ZDL,ZDR,ZUL,ZUR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Complex(dp), Intent(in) :: Yu(3,3),Yd(3,3),ZDL(3,3),ZDR(3,3),ZUL(3,3),ZUR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFdFucHp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-(Conjg(ZDR(gt1,j1))*Conjg(ZUL(gt2,j2))*Yd(j1,j2))
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+Conjg(Yu(j1,j2))*ZUR(gt2,j1)*ZDL(gt1,j2)
End Do 
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFdFucHpL  
 
 
Subroutine CouplingcFeFvcHpL(gt1,gt2,Ye,ZER,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Complex(dp), Intent(in) :: Ye(3,3),ZER(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFeFvcHp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j1 = 1,3
resL = resL-(Conjg(ZER(gt1,j1))*Ye(j1,gt2))
End Do 
resR = 0._dp 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFeFvcHpL  
 
 
Subroutine CouplingcgZgWpcHpL(g1,g2,vvSM,TW,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,vvSM,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgZgWpcHp' 
 
res = 0._dp 
res = res+(g2**2*vvSM*Cos(TW)*RXiZ)/4._dp
res = res+(g1*g2*vvSM*RXiZ*Sin(TW))/4._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgZgWpcHpL  
 
 
Subroutine CouplingcgWpgZHpL(g1,g2,vvSM,TW,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,vvSM,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWpgZHp' 
 
res = 0._dp 
res = res-1._dp/4._dp*(g2**2*vvSM*Cos(TW)*RXiWp)
res = res+(g1*g2*vvSM*RXiWp*Sin(TW))/4._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWpgZHpL  
 
 
Subroutine CouplingcgWCgZcHpL(g1,g2,vvSM,TW,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,vvSM,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWCgZcHp' 
 
res = 0._dp 
res = res-1._dp/4._dp*(g2**2*vvSM*Cos(TW)*RXiWp)
res = res+(g1*g2*vvSM*RXiWp*Sin(TW))/4._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWCgZcHpL  
 
 
Subroutine CouplingcgZgWCHpL(g1,g2,vvSM,TW,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,vvSM,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgZgWCHp' 
 
res = 0._dp 
res = res+(g2**2*vvSM*Cos(TW)*RXiZ)/4._dp
res = res+(g1*g2*vvSM*RXiZ*Sin(TW))/4._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgZgWCHpL  
 
 
Subroutine CouplinghhHpcHpL(Lam,vvSM,res)

Implicit None 

Real(dp), Intent(in) :: vvSM

Complex(dp), Intent(in) :: Lam

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhHpcHp' 
 
res = 0._dp 
res = res-(vvSM*Lam)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhHpcHpL  
 
 
Subroutine CouplinghhcHpVWpL(g2,res)

Implicit None 

Real(dp), Intent(in) :: g2

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhcHpVWp' 
 
res = 0._dp 
res = res+g2/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhcHpVWpL  
 
 
Subroutine CouplingHpcHpVPL(g1,g2,TW,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingHpcHpVP' 
 
res = 0._dp 
res = res+(g1*Cos(TW))/2._dp
res = res+(g2*Sin(TW))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingHpcHpVPL  
 
 
Subroutine CouplingHpcHpVZL(g1,g2,TW,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingHpcHpVZ' 
 
res = 0._dp 
res = res+(g2*Cos(TW))/2._dp
res = res-1._dp/2._dp*(g1*Sin(TW))
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingHpcHpVZL  
 
 
Subroutine CouplingcHpVPVWpL(g1,g2,vvSM,TW,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,vvSM,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcHpVPVWp' 
 
res = 0._dp 
res = res+(g1*g2*vvSM*Cos(TW))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcHpVPVWpL  
 
 
Subroutine CouplingcHpVWpVZL(g1,g2,vvSM,TW,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,vvSM,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcHpVWpVZ' 
 
res = 0._dp 
res = res-1._dp/2._dp*(g1*g2*vvSM*Sin(TW))
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcHpVWpVZL  
 
 
Subroutine CouplingAhAhHpcHpL(Lam,res)

Implicit None 

Complex(dp), Intent(in) :: Lam

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhHpcHp' 
 
res = 0._dp 
res = res-1._dp*(Lam)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhHpcHpL  
 
 
Subroutine CouplinghhhhHpcHpL(Lam,res)

Implicit None 

Complex(dp), Intent(in) :: Lam

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhhhHpcHp' 
 
res = 0._dp 
res = res-1._dp*(Lam)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhhhHpcHpL  
 
 
Subroutine CouplingHpHpcHpcHpL(Lam,res)

Implicit None 

Complex(dp), Intent(in) :: Lam

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingHpHpcHpcHp' 
 
res = 0._dp 
res = res-2._dp*(Lam)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingHpHpcHpcHpL  
 
 
Subroutine CouplingHpcHpVPVPL(g1,g2,TW,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingHpcHpVPVP' 
 
res = 0._dp 
res = res+(g1**2*Cos(TW)**2)/2._dp
res = res+g1*g2*Cos(TW)*Sin(TW)
res = res+(g2**2*Sin(TW)**2)/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingHpcHpVPVPL  
 
 
Subroutine CouplingHpcHpcVWpVWpL(g2,res)

Implicit None 

Real(dp), Intent(in) :: g2

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingHpcHpcVWpVWp' 
 
res = 0._dp 
res = res+g2**2/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingHpcHpcVWpVWpL  
 
 
Subroutine CouplingHpcHpVZVZL(g1,g2,TW,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingHpcHpVZVZ' 
 
res = 0._dp 
res = res+(g2**2*Cos(TW)**2)/2._dp
res = res-(g1*g2*Cos(TW)*Sin(TW))
res = res+(g1**2*Sin(TW)**2)/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingHpcHpVZVZL  
 
 
Subroutine CouplingAhAhhhL(Lam,vvSM,res)

Implicit None 

Real(dp), Intent(in) :: vvSM

Complex(dp), Intent(in) :: Lam

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhhh' 
 
res = 0._dp 
res = res-(vvSM*Lam)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhhhL  
 
 
Subroutine CouplingcFdFdAhL(gt1,gt2,Yd,ZDL,ZDR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Complex(dp), Intent(in) :: Yd(3,3),ZDL(3,3),ZDR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFdFdAh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(ZDR(gt1,j1))*Conjg(ZDL(gt2,j2))*Yd(j1,j2))/sqrt(2._dp))
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+(Conjg(Yd(j1,j2))*ZDR(gt2,j1)*ZDL(gt1,j2))/sqrt(2._dp)
End Do 
End Do 
resL = -(0.,1.)*resL 
 
resR = -(0.,1.)*resR 
 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFdFdAhL  
 
 
Subroutine CouplingcFeFeAhL(gt1,gt2,Ye,ZEL,ZER,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Complex(dp), Intent(in) :: Ye(3,3),ZEL(3,3),ZER(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFeFeAh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(ZER(gt1,j1))*Conjg(ZEL(gt2,j2))*Ye(j1,j2))/sqrt(2._dp))
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+(Conjg(Ye(j1,j2))*ZER(gt2,j1)*ZEL(gt1,j2))/sqrt(2._dp)
End Do 
End Do 
resL = -(0.,1.)*resL 
 
resR = -(0.,1.)*resR 
 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFeFeAhL  
 
 
Subroutine CouplingcFuFuAhL(gt1,gt2,Yu,ZUL,ZUR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Complex(dp), Intent(in) :: Yu(3,3),ZUL(3,3),ZUR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFuFuAh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(ZUR(gt1,j1))*Conjg(ZUL(gt2,j2))*Yu(j1,j2))/sqrt(2._dp)
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(Yu(j1,j2))*ZUR(gt2,j1)*ZUL(gt1,j2))/sqrt(2._dp))
End Do 
End Do 
resL = -(0.,1.)*resL 
 
resR = -(0.,1.)*resR 
 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFuFuAhL  
 
 
Subroutine CouplingcgWpgWpAhL(g2,vvSM,res)

Implicit None 

Real(dp), Intent(in) :: g2,vvSM

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWpgWpAh' 
 
res = 0._dp 
res = res+(g2**2*vvSM*RXiWp)/4._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWpgWpAhL  
 
 
Subroutine CouplingcgWCgWCAhL(g2,vvSM,res)

Implicit None 

Real(dp), Intent(in) :: g2,vvSM

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWCgWCAh' 
 
res = 0._dp 
res = res-1._dp/4._dp*(g2**2*vvSM*RXiWp)
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWCgWCAhL  
 
 
Subroutine CouplingAhhhVZL(g1,g2,TW,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhhhVZ' 
 
res = 0._dp 
res = res+(g2*Cos(TW))/2._dp
res = res+(g1*Sin(TW))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhhhVZL  
 
 
Subroutine CouplingAhHpcVWpL(g2,res)

Implicit None 

Real(dp), Intent(in) :: g2

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhHpcVWp' 
 
res = 0._dp 
res = res-1._dp/2._dp*g2
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhHpcVWpL  
 
 
Subroutine CouplingAhAhAhAhL(Lam,res)

Implicit None 

Complex(dp), Intent(in) :: Lam

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhAhAh' 
 
res = 0._dp 
res = res-3._dp*(Lam)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhAhAhL  
 
 
Subroutine CouplingAhAhhhhhL(Lam,res)

Implicit None 

Complex(dp), Intent(in) :: Lam

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhhhhh' 
 
res = 0._dp 
res = res-1._dp*(Lam)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhhhhhL  
 
 
Subroutine CouplingAhAhcVWpVWpL(g2,res)

Implicit None 

Real(dp), Intent(in) :: g2

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhcVWpVWp' 
 
res = 0._dp 
res = res+g2**2/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhcVWpVWpL  
 
 
Subroutine CouplingAhAhVZVZL(g1,g2,TW,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhVZVZ' 
 
res = 0._dp 
res = res+(g2**2*Cos(TW)**2)/2._dp
res = res+g1*g2*Cos(TW)*Sin(TW)
res = res+(g1**2*Sin(TW)**2)/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhVZVZL  
 
 
Subroutine CouplingcFdFdhhL(gt1,gt2,Yd,ZDL,ZDR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Complex(dp), Intent(in) :: Yd(3,3),ZDL(3,3),ZDR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFdFdhh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(ZDR(gt1,j1))*Conjg(ZDL(gt2,j2))*Yd(j1,j2))/sqrt(2._dp))
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(Yd(j1,j2))*ZDR(gt2,j1)*ZDL(gt1,j2))/sqrt(2._dp))
End Do 
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFdFdhhL  
 
 
Subroutine CouplingcFeFehhL(gt1,gt2,Ye,ZEL,ZER,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Complex(dp), Intent(in) :: Ye(3,3),ZEL(3,3),ZER(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFeFehh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(ZER(gt1,j1))*Conjg(ZEL(gt2,j2))*Ye(j1,j2))/sqrt(2._dp))
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(Ye(j1,j2))*ZER(gt2,j1)*ZEL(gt1,j2))/sqrt(2._dp))
End Do 
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFeFehhL  
 
 
Subroutine CouplingcFuFuhhL(gt1,gt2,Yu,ZUL,ZUR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Complex(dp), Intent(in) :: Yu(3,3),ZUL(3,3),ZUR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFuFuhh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(ZUR(gt1,j1))*Conjg(ZUL(gt2,j2))*Yu(j1,j2))/sqrt(2._dp))
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(Yu(j1,j2))*ZUR(gt2,j1)*ZUL(gt1,j2))/sqrt(2._dp))
End Do 
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFuFuhhL  
 
 
Subroutine CouplingcgWpgWphhL(g2,vvSM,res)

Implicit None 

Real(dp), Intent(in) :: g2,vvSM

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWpgWphh' 
 
res = 0._dp 
res = res-1._dp/4._dp*(g2**2*vvSM*RXiWp)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWpgWphhL  
 
 
Subroutine CouplingcgWCgWChhL(g2,vvSM,res)

Implicit None 

Real(dp), Intent(in) :: g2,vvSM

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWCgWChh' 
 
res = 0._dp 
res = res-1._dp/4._dp*(g2**2*vvSM*RXiWp)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWCgWChhL  
 
 
Subroutine CouplingcgZgZhhL(g1,g2,vvSM,TW,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,vvSM,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgZgZhh' 
 
res = 0._dp 
res = res-1._dp/4._dp*(g2**2*vvSM*Cos(TW)**2*RXiZ)
res = res-1._dp/2._dp*(g1*g2*vvSM*Cos(TW)*RXiZ*Sin(TW))
res = res-1._dp/4._dp*(g1**2*vvSM*RXiZ*Sin(TW)**2)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgZgZhhL  
 
 
Subroutine CouplinghhhhhhL(Lam,vvSM,res)

Implicit None 

Real(dp), Intent(in) :: vvSM

Complex(dp), Intent(in) :: Lam

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'Couplinghhhhhh' 
 
res = 0._dp 
res = res-3*vvSM*Lam
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhhhhhL  
 
 
Subroutine CouplinghhHpcVWpL(g2,res)

Implicit None 

Real(dp), Intent(in) :: g2

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhHpcVWp' 
 
res = 0._dp 
res = res-1._dp/2._dp*g2
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhHpcVWpL  
 
 
Subroutine CouplinghhcVWpVWpL(g2,vvSM,res)

Implicit None 

Real(dp), Intent(in) :: g2,vvSM

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhcVWpVWp' 
 
res = 0._dp 
res = res+(g2**2*vvSM)/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhcVWpVWpL  
 
 
Subroutine CouplinghhVZVZL(g1,g2,vvSM,TW,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,vvSM,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhVZVZ' 
 
res = 0._dp 
res = res+(g2**2*vvSM*Cos(TW)**2)/2._dp
res = res+g1*g2*vvSM*Cos(TW)*Sin(TW)
res = res+(g1**2*vvSM*Sin(TW)**2)/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhVZVZL  
 
 
Subroutine CouplinghhhhhhhhL(Lam,res)

Implicit None 

Complex(dp), Intent(in) :: Lam

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'Couplinghhhhhhhh' 
 
res = 0._dp 
res = res-3._dp*(Lam)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhhhhhhhL  
 
 
Subroutine CouplinghhhhcVWpVWpL(g2,res)

Implicit None 

Real(dp), Intent(in) :: g2

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhhhcVWpVWp' 
 
res = 0._dp 
res = res+g2**2/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhhhcVWpVWpL  
 
 
Subroutine CouplinghhhhVZVZL(g1,g2,TW,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhhhVZVZ' 
 
res = 0._dp 
res = res+(g2**2*Cos(TW)**2)/2._dp
res = res+g1*g2*Cos(TW)*Sin(TW)
res = res+(g1**2*Sin(TW)**2)/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhhhVZVZL  
 
 
Subroutine CouplingcFdFdVGL(gt1,gt2,g3,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g3

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFdFdVG' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.eq.gt2)) Then 
resL = resL-1._dp*(g3)
End If 
resR = 0._dp 
If ((gt1.eq.gt2)) Then 
resR = resR-1._dp*(g3)
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFdFdVGL  
 
 
Subroutine CouplingcFuFuVGL(gt1,gt2,g3,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g3

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFuFuVG' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.eq.gt2)) Then 
resL = resL-1._dp*(g3)
End If 
resR = 0._dp 
If ((gt1.eq.gt2)) Then 
resR = resR-1._dp*(g3)
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFuFuVGL  
 
 
Subroutine CouplingcgGgGVGL(g3,res)

Implicit None 

Real(dp), Intent(in) :: g3

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgGgGVG' 
 
res = 0._dp 
res = res+g3
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgGgGVGL  
 
 
Subroutine CouplingVGVGVGL(g3,res)

Implicit None 

Real(dp), Intent(in) :: g3

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingVGVGVG' 
 
res = 0._dp 
res = res+g3
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingVGVGVGL  
 
 
Subroutine CouplingVGVGVGVGL(g3,res1,res2,res3)

Implicit None 

Real(dp), Intent(in) :: g3

Complex(dp), Intent(out) :: res1, res2, res3 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingVGVGVGVG' 
 
res1 = 0._dp 
res1 = res1-16*g3**2
res2 = 0._dp 
res3 = 0._dp 
res3 = res3+16*g3**2
If ((Real(res1,dp).ne.Real(res1,dp)).or.(Real(res2,dp).ne.Real(res2,dp)).or.(Real(res3,dp).ne.Real(res3,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingVGVGVGVGL  
 
 
Subroutine CouplingcFdFdVPL(gt1,gt2,g1,g2,TW,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFdFdVP' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.eq.gt2)) Then 
resL = resL-1._dp/6._dp*(g1*Cos(TW))
End If 
If ((gt1.eq.gt2)) Then 
resL = resL+(g2*Sin(TW))/2._dp
End If 
resR = 0._dp 
If ((gt1.eq.gt2)) Then 
resR = resR+(g1*Cos(TW))/3._dp
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFdFdVPL  
 
 
Subroutine CouplingcFeFeVPL(gt1,gt2,g1,g2,TW,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFeFeVP' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.eq.gt2)) Then 
resL = resL+(g1*Cos(TW))/2._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL+(g2*Sin(TW))/2._dp
End If 
resR = 0._dp 
If ((gt1.eq.gt2)) Then 
resR = resR+g1*Cos(TW)
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFeFeVPL  
 
 
Subroutine CouplingcFuFuVPL(gt1,gt2,g1,g2,TW,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFuFuVP' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.eq.gt2)) Then 
resL = resL-1._dp/6._dp*(g1*Cos(TW))
End If 
If ((gt1.eq.gt2)) Then 
resL = resL-1._dp/2._dp*(g2*Sin(TW))
End If 
resR = 0._dp 
If ((gt1.eq.gt2)) Then 
resR = resR+(-2*g1*Cos(TW))/3._dp
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFuFuVPL  
 
 
Subroutine CouplingcgWpgWpVPL(g2,TW,res)

Implicit None 

Real(dp), Intent(in) :: g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWpgWpVP' 
 
res = 0._dp 
res = res+g2*Sin(TW)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWpgWpVPL  
 
 
Subroutine CouplingcgWCgWCVPL(g2,TW,res)

Implicit None 

Real(dp), Intent(in) :: g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWCgWCVP' 
 
res = 0._dp 
res = res-(g2*Sin(TW))
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWCgWCVPL  
 
 
Subroutine CouplingHpcVWpVPL(g1,g2,vvSM,TW,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,vvSM,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingHpcVWpVP' 
 
res = 0._dp 
res = res+(g1*g2*vvSM*Cos(TW))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingHpcVWpVPL  
 
 
Subroutine CouplingcVWpVPVWpL(g2,TW,res)

Implicit None 

Real(dp), Intent(in) :: g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcVWpVPVWp' 
 
res = 0._dp 
res = res-(g2*Sin(TW))
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcVWpVPVWpL  
 
 
Subroutine CouplingcVWpVPVPVWpL(g2,TW,res1,res2,res3)

Implicit None 

Real(dp), Intent(in) :: g2,TW

Complex(dp), Intent(out) :: res1, res2, res3 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcVWpVPVPVWp' 
 
res1 = 0._dp 
res1 = res1+g2**2*Sin(TW)**2
res2 = 0._dp 
res2 = res2+g2**2*Sin(TW)**2
res3 = 0._dp 
res3 = res3-2*g2**2*Sin(TW)**2
If ((Real(res1,dp).ne.Real(res1,dp)).or.(Real(res2,dp).ne.Real(res2,dp)).or.(Real(res3,dp).ne.Real(res3,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcVWpVPVPVWpL  
 
 
Subroutine CouplingcFdFdVZL(gt1,gt2,g1,g2,TW,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFdFdVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.eq.gt2)) Then 
resL = resL+(g2*Cos(TW))/2._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL+(g1*Sin(TW))/6._dp
End If 
resR = 0._dp 
If ((gt1.eq.gt2)) Then 
resR = resR-1._dp/3._dp*(g1*Sin(TW))
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFdFdVZL  
 
 
Subroutine CouplingcFeFeVZL(gt1,gt2,g1,g2,TW,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFeFeVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.eq.gt2)) Then 
resL = resL+(g2*Cos(TW))/2._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL-1._dp/2._dp*(g1*Sin(TW))
End If 
resR = 0._dp 
If ((gt1.eq.gt2)) Then 
resR = resR-(g1*Sin(TW))
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFeFeVZL  
 
 
Subroutine CouplingcFuFuVZL(gt1,gt2,g1,g2,TW,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFuFuVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.eq.gt2)) Then 
resL = resL-1._dp/2._dp*(g2*Cos(TW))
End If 
If ((gt1.eq.gt2)) Then 
resL = resL+(g1*Sin(TW))/6._dp
End If 
resR = 0._dp 
If ((gt1.eq.gt2)) Then 
resR = resR+(2*g1*Sin(TW))/3._dp
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFuFuVZL  
 
 
Subroutine CouplingcFvFvVZL(gt1,gt2,g1,g2,TW,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFvFvVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.eq.gt2)) Then 
resL = resL-1._dp/2._dp*(g2*Cos(TW))
End If 
If ((gt1.eq.gt2)) Then 
resL = resL-1._dp/2._dp*(g1*Sin(TW))
End If 
resR = 0._dp 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFvFvVZL  
 
 
Subroutine CouplingcgWpgWpVZL(g2,TW,res)

Implicit None 

Real(dp), Intent(in) :: g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWpgWpVZ' 
 
res = 0._dp 
res = res+g2*Cos(TW)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWpgWpVZL  
 
 
Subroutine CouplingcgWCgWCVZL(g2,TW,res)

Implicit None 

Real(dp), Intent(in) :: g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWCgWCVZ' 
 
res = 0._dp 
res = res-(g2*Cos(TW))
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWCgWCVZL  
 
 
Subroutine CouplingHpcVWpVZL(g1,g2,vvSM,TW,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,vvSM,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingHpcVWpVZ' 
 
res = 0._dp 
res = res-1._dp/2._dp*(g1*g2*vvSM*Sin(TW))
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingHpcVWpVZL  
 
 
Subroutine CouplingcVWpVWpVZL(g2,TW,res)

Implicit None 

Real(dp), Intent(in) :: g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcVWpVWpVZ' 
 
res = 0._dp 
res = res+g2*Cos(TW)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcVWpVWpVZL  
 
 
Subroutine CouplingcVWpVWpVZVZL(g2,TW,res1,res2,res3)

Implicit None 

Real(dp), Intent(in) :: g2,TW

Complex(dp), Intent(out) :: res1, res2, res3 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcVWpVWpVZVZ' 
 
res1 = 0._dp 
res1 = res1-2*g2**2*Cos(TW)**2
res2 = 0._dp 
res2 = res2+g2**2*Cos(TW)**2
res3 = 0._dp 
res3 = res3+g2**2*Cos(TW)**2
If ((Real(res1,dp).ne.Real(res1,dp)).or.(Real(res2,dp).ne.Real(res2,dp)).or.(Real(res3,dp).ne.Real(res3,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcVWpVWpVZVZL  
 
 
Subroutine CouplingcFdFucVWpL(gt1,gt2,g2,ZDL,ZUL,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g2

Complex(dp), Intent(in) :: ZDL(3,3),ZUL(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFdFucVWp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j1 = 1,3
resL = resL-((g2*Conjg(ZUL(gt2,j1))*ZDL(gt1,j1))/sqrt(2._dp))
End Do 
resR = 0._dp 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFdFucVWpL  
 
 
Subroutine CouplingcFeFvcVWpL(gt1,gt2,g2,ZEL,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g2

Complex(dp), Intent(in) :: ZEL(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFeFvcVWp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt2.le.3).And.(gt2.ge.1)) Then 
resL = resL-((g2*ZEL(gt1,gt2))/sqrt(2._dp))
End If 
resR = 0._dp 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFeFvcVWpL  
 
 
Subroutine CouplingcgWCgAcVWpL(g2,TW,res)

Implicit None 

Real(dp), Intent(in) :: g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWCgAcVWp' 
 
res = 0._dp 
res = res+g2*Sin(TW)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWCgAcVWpL  
 
 
Subroutine CouplingcgAgWpcVWpL(g2,TW,res)

Implicit None 

Real(dp), Intent(in) :: g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgAgWpcVWp' 
 
res = 0._dp 
res = res-(g2*Sin(TW))
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgAgWpcVWpL  
 
 
Subroutine CouplingcgZgWpcVWpL(g2,TW,res)

Implicit None 

Real(dp), Intent(in) :: g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgZgWpcVWp' 
 
res = 0._dp 
res = res-(g2*Cos(TW))
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgZgWpcVWpL  
 
 
Subroutine CouplingcgWCgZcVWpL(g2,TW,res)

Implicit None 

Real(dp), Intent(in) :: g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWCgZcVWp' 
 
res = 0._dp 
res = res+g2*Cos(TW)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWCgZcVWpL  
 
 
Subroutine CouplingcVWpcVWpVWpVWpL(g2,res1,res2,res3)

Implicit None 

Real(dp), Intent(in) :: g2

Complex(dp), Intent(out) :: res1, res2, res3 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcVWpcVWpVWpVWp' 
 
res1 = 0._dp 
res1 = res1+2*g2**2
res2 = 0._dp 
res2 = res2-g2**2
res3 = 0._dp 
res3 = res3-g2**2
If ((Real(res1,dp).ne.Real(res1,dp)).or.(Real(res2,dp).ne.Real(res2,dp)).or.(Real(res3,dp).ne.Real(res3,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcVWpcVWpVWpVWpL  
 
 
Subroutine CouplingHpcHpVPVZL(g1,g2,TW,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingHpcHpVPVZ' 
 
res = 0._dp 
res = res+(g1*g2*Cos(2._dp*(TW)))/2._dp
res = res-1._dp/4._dp*(g1**2*Sin(2._dp*(TW)))
res = res+(g2**2*Sin(2._dp*(TW)))/4._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingHpcHpVPVZL  
 
 
Subroutine CouplingcVWpVPVWpVZL(g2,TW,res1,res2,res3)

Implicit None 

Real(dp), Intent(in) :: g2,TW

Complex(dp), Intent(out) :: res1, res2, res3 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcVWpVPVWpVZ' 
 
res1 = 0._dp 
res1 = res1+(g2**2*Sin(2._dp*(TW)))/2._dp
res2 = 0._dp 
res2 = res2-(g2**2*Sin(2._dp*(TW)))
res3 = 0._dp 
res3 = res3+(g2**2*Sin(2._dp*(TW)))/2._dp
If ((Real(res1,dp).ne.Real(res1,dp)).or.(Real(res2,dp).ne.Real(res2,dp)).or.(Real(res3,dp).ne.Real(res3,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcVWpVPVWpVZL  
 
 
Subroutine CouplingsForVectorBosons(g2,g1,TW,vvSM,ZDL,ZUL,ZEL,cplAhcHpVWp,            & 
& cplhhcHpVWp,cplHpcHpVP,cplHpcHpVZ,cplcHpVPVWp,cplcHpVWpVZ,cplHpcHpVPVP,cplHpcHpcVWpVWp,& 
& cplHpcHpVZVZ,cplAhhhVZ,cplAhHpcVWp,cplAhAhcVWpVWp,cplAhAhVZVZ,cplhhHpcVWp,             & 
& cplhhcVWpVWp,cplhhVZVZ,cplhhhhcVWpVWp,cplhhhhVZVZ,cplcFdFdVPL,cplcFdFdVPR,             & 
& cplcFeFeVPL,cplcFeFeVPR,cplcFuFuVPL,cplcFuFuVPR,cplcgWpgWpVP,cplcgWCgWCVP,             & 
& cplHpcVWpVP,cplcVWpVPVWp,cplcVWpVPVPVWp1,cplcVWpVPVPVWp2,cplcVWpVPVPVWp3,              & 
& cplcFdFdVZL,cplcFdFdVZR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuVZL,cplcFuFuVZR,               & 
& cplcFvFvVZL,cplcFvFvVZR,cplcgWpgWpVZ,cplcgWCgWCVZ,cplHpcVWpVZ,cplcVWpVWpVZ,            & 
& cplcVWpVWpVZVZ1,cplcVWpVWpVZVZ2,cplcVWpVWpVZVZ3,cplcFdFucVWpL,cplcFdFucVWpR,           & 
& cplcFeFvcVWpL,cplcFeFvcVWpR,cplcgWCgAcVWp,cplcgAgWpcVWp,cplcgZgWpcVWp,cplcgWCgZcVWp,   & 
& cplcVWpcVWpVWpVWp1,cplcVWpcVWpVWpVWp2,cplcVWpcVWpVWpVWp3,cplHpcHpVPVZ,cplcVWpVPVWpVZ1, & 
& cplcVWpVPVWpVZ2,cplcVWpVPVWpVZ3)

Implicit None 
Real(dp), Intent(in) :: g2,g1,TW,vvSM

Complex(dp), Intent(in) :: ZDL(3,3),ZUL(3,3),ZEL(3,3)

Complex(dp), Intent(out) :: cplAhcHpVWp,cplhhcHpVWp,cplHpcHpVP,cplHpcHpVZ,cplcHpVPVWp,cplcHpVWpVZ,cplHpcHpVPVP,   & 
& cplHpcHpcVWpVWp,cplHpcHpVZVZ,cplAhhhVZ,cplAhHpcVWp,cplAhAhcVWpVWp,cplAhAhVZVZ,         & 
& cplhhHpcVWp,cplhhcVWpVWp,cplhhVZVZ,cplhhhhcVWpVWp,cplhhhhVZVZ,cplcFdFdVPL(3,3),        & 
& cplcFdFdVPR(3,3),cplcFeFeVPL(3,3),cplcFeFeVPR(3,3),cplcFuFuVPL(3,3),cplcFuFuVPR(3,3),  & 
& cplcgWpgWpVP,cplcgWCgWCVP,cplHpcVWpVP,cplcVWpVPVWp,cplcVWpVPVPVWp1,cplcVWpVPVPVWp2,    & 
& cplcVWpVPVPVWp3,cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),   & 
& cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),cplcFvFvVZL(3,3),cplcFvFvVZR(3,3),cplcgWpgWpVZ,      & 
& cplcgWCgWCVZ,cplHpcVWpVZ,cplcVWpVWpVZ,cplcVWpVWpVZVZ1,cplcVWpVWpVZVZ2,cplcVWpVWpVZVZ3, & 
& cplcFdFucVWpL(3,3),cplcFdFucVWpR(3,3),cplcFeFvcVWpL(3,3),cplcFeFvcVWpR(3,3),           & 
& cplcgWCgAcVWp,cplcgAgWpcVWp,cplcgZgWpcVWp,cplcgWCgZcVWp,cplcVWpcVWpVWpVWp1,            & 
& cplcVWpcVWpVWpVWp2,cplcVWpcVWpVWpVWp3,cplHpcHpVPVZ,cplcVWpVPVWpVZ1,cplcVWpVPVWpVZ2,    & 
& cplcVWpVPVWpVZ3

Integer :: gt1, gt2, gt3, gt4, ct1, ct2, ct3, ct4

Iname = Iname + 1 
NameOfUnit(Iname) = 'CouplingsForVectorBosons'
 
cplAhcHpVWp = 0._dp 
Call CouplingAhcHpVWpL(g2,cplAhcHpVWp)



cplhhcHpVWp = 0._dp 
Call CouplinghhcHpVWpL(g2,cplhhcHpVWp)



cplHpcHpVP = 0._dp 
Call CouplingHpcHpVPL(g1,g2,TW,cplHpcHpVP)



cplHpcHpVZ = 0._dp 
Call CouplingHpcHpVZL(g1,g2,TW,cplHpcHpVZ)



cplcHpVPVWp = 0._dp 
Call CouplingcHpVPVWpL(g1,g2,vvSM,TW,cplcHpVPVWp)



cplcHpVWpVZ = 0._dp 
Call CouplingcHpVWpVZL(g1,g2,vvSM,TW,cplcHpVWpVZ)



cplHpcHpVPVP = 0._dp 
Call CouplingHpcHpVPVPL(g1,g2,TW,cplHpcHpVPVP)



cplHpcHpcVWpVWp = 0._dp 
Call CouplingHpcHpcVWpVWpL(g2,cplHpcHpcVWpVWp)



cplHpcHpVZVZ = 0._dp 
Call CouplingHpcHpVZVZL(g1,g2,TW,cplHpcHpVZVZ)



cplAhhhVZ = 0._dp 
Call CouplingAhhhVZL(g1,g2,TW,cplAhhhVZ)



cplAhHpcVWp = 0._dp 
Call CouplingAhHpcVWpL(g2,cplAhHpcVWp)



cplAhAhcVWpVWp = 0._dp 
Call CouplingAhAhcVWpVWpL(g2,cplAhAhcVWpVWp)



cplAhAhVZVZ = 0._dp 
Call CouplingAhAhVZVZL(g1,g2,TW,cplAhAhVZVZ)



cplhhHpcVWp = 0._dp 
Call CouplinghhHpcVWpL(g2,cplhhHpcVWp)



cplhhcVWpVWp = 0._dp 
Call CouplinghhcVWpVWpL(g2,vvSM,cplhhcVWpVWp)



cplhhVZVZ = 0._dp 
Call CouplinghhVZVZL(g1,g2,vvSM,TW,cplhhVZVZ)



cplhhhhcVWpVWp = 0._dp 
Call CouplinghhhhcVWpVWpL(g2,cplhhhhcVWpVWp)



cplhhhhVZVZ = 0._dp 
Call CouplinghhhhVZVZL(g1,g2,TW,cplhhhhVZVZ)



cplcFdFdVPL = 0._dp 
cplcFdFdVPR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFdVPL(gt1,gt2,g1,g2,TW,cplcFdFdVPL(gt1,gt2),cplcFdFdVPR(gt1,gt2))

 End Do 
End Do 


cplcFeFeVPL = 0._dp 
cplcFeFeVPR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFeFeVPL(gt1,gt2,g1,g2,TW,cplcFeFeVPL(gt1,gt2),cplcFeFeVPR(gt1,gt2))

 End Do 
End Do 


cplcFuFuVPL = 0._dp 
cplcFuFuVPR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFuVPL(gt1,gt2,g1,g2,TW,cplcFuFuVPL(gt1,gt2),cplcFuFuVPR(gt1,gt2))

 End Do 
End Do 


cplcgWpgWpVP = 0._dp 
Call CouplingcgWpgWpVPL(g2,TW,cplcgWpgWpVP)



cplcgWCgWCVP = 0._dp 
Call CouplingcgWCgWCVPL(g2,TW,cplcgWCgWCVP)



cplHpcVWpVP = 0._dp 
Call CouplingHpcVWpVPL(g1,g2,vvSM,TW,cplHpcVWpVP)



cplcVWpVPVWp = 0._dp 
Call CouplingcVWpVPVWpL(g2,TW,cplcVWpVPVWp)



cplcVWpVPVPVWp1 = 0._dp 
cplcVWpVPVPVWp2 = 0._dp 
cplcVWpVPVPVWp3 = 0._dp 
Call CouplingcVWpVPVPVWpL(g2,TW,cplcVWpVPVPVWp1,cplcVWpVPVPVWp2,cplcVWpVPVPVWp3)



cplcFdFdVZL = 0._dp 
cplcFdFdVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFdVZL(gt1,gt2,g1,g2,TW,cplcFdFdVZL(gt1,gt2),cplcFdFdVZR(gt1,gt2))

 End Do 
End Do 


cplcFeFeVZL = 0._dp 
cplcFeFeVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFeFeVZL(gt1,gt2,g1,g2,TW,cplcFeFeVZL(gt1,gt2),cplcFeFeVZR(gt1,gt2))

 End Do 
End Do 


cplcFuFuVZL = 0._dp 
cplcFuFuVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFuVZL(gt1,gt2,g1,g2,TW,cplcFuFuVZL(gt1,gt2),cplcFuFuVZR(gt1,gt2))

 End Do 
End Do 


cplcFvFvVZL = 0._dp 
cplcFvFvVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFvFvVZL(gt1,gt2,g1,g2,TW,cplcFvFvVZL(gt1,gt2),cplcFvFvVZR(gt1,gt2))

 End Do 
End Do 


cplcgWpgWpVZ = 0._dp 
Call CouplingcgWpgWpVZL(g2,TW,cplcgWpgWpVZ)



cplcgWCgWCVZ = 0._dp 
Call CouplingcgWCgWCVZL(g2,TW,cplcgWCgWCVZ)



cplHpcVWpVZ = 0._dp 
Call CouplingHpcVWpVZL(g1,g2,vvSM,TW,cplHpcVWpVZ)



cplcVWpVWpVZ = 0._dp 
Call CouplingcVWpVWpVZL(g2,TW,cplcVWpVWpVZ)



cplcVWpVWpVZVZ1 = 0._dp 
cplcVWpVWpVZVZ2 = 0._dp 
cplcVWpVWpVZVZ3 = 0._dp 
Call CouplingcVWpVWpVZVZL(g2,TW,cplcVWpVWpVZVZ1,cplcVWpVWpVZVZ2,cplcVWpVWpVZVZ3)



cplcFdFucVWpL = 0._dp 
cplcFdFucVWpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFucVWpL(gt1,gt2,g2,ZDL,ZUL,cplcFdFucVWpL(gt1,gt2),cplcFdFucVWpR(gt1,gt2))

 End Do 
End Do 


cplcFeFvcVWpL = 0._dp 
cplcFeFvcVWpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFeFvcVWpL(gt1,gt2,g2,ZEL,cplcFeFvcVWpL(gt1,gt2),cplcFeFvcVWpR(gt1,gt2))

 End Do 
End Do 


cplcgWCgAcVWp = 0._dp 
Call CouplingcgWCgAcVWpL(g2,TW,cplcgWCgAcVWp)



cplcgAgWpcVWp = 0._dp 
Call CouplingcgAgWpcVWpL(g2,TW,cplcgAgWpcVWp)



cplcgZgWpcVWp = 0._dp 
Call CouplingcgZgWpcVWpL(g2,TW,cplcgZgWpcVWp)



cplcgWCgZcVWp = 0._dp 
Call CouplingcgWCgZcVWpL(g2,TW,cplcgWCgZcVWp)



cplcVWpcVWpVWpVWp1 = 0._dp 
cplcVWpcVWpVWpVWp2 = 0._dp 
cplcVWpcVWpVWpVWp3 = 0._dp 
Call CouplingcVWpcVWpVWpVWpL(g2,cplcVWpcVWpVWpVWp1,cplcVWpcVWpVWpVWp2,cplcVWpcVWpVWpVWp3)



cplHpcHpVPVZ = 0._dp 
Call CouplingHpcHpVPVZL(g1,g2,TW,cplHpcHpVPVZ)



cplcVWpVPVWpVZ1 = 0._dp 
cplcVWpVPVWpVZ2 = 0._dp 
cplcVWpVPVWpVZ3 = 0._dp 
Call CouplingcVWpVPVWpVZL(g2,TW,cplcVWpVPVWpVZ1,cplcVWpVPVWpVZ2,cplcVWpVPVWpVZ3)



Iname = Iname - 1 
End Subroutine CouplingsForVectorBosons

Subroutine CouplingsForSMfermions(Yd,ZDL,ZDR,g3,g1,g2,TW,Yu,ZUL,ZUR,Ye,               & 
& ZEL,ZER,cplcUFdFdAhL,cplcUFdFdAhR,cplcUFdFdhhL,cplcUFdFdhhR,cplcUFdFdVGL,              & 
& cplcUFdFdVGR,cplcUFdFdVPL,cplcUFdFdVPR,cplcUFdFdVZL,cplcUFdFdVZR,cplcUFdFucHpL,        & 
& cplcUFdFucHpR,cplcUFdFucVWpL,cplcUFdFucVWpR,cplcUFuFuAhL,cplcUFuFuAhR,cplcUFuFdHpL,    & 
& cplcUFuFdHpR,cplcUFuFdVWpL,cplcUFuFdVWpR,cplcUFuFuhhL,cplcUFuFuhhR,cplcUFuFuVGL,       & 
& cplcUFuFuVGR,cplcUFuFuVPL,cplcUFuFuVPR,cplcUFuFuVZL,cplcUFuFuVZR,cplcUFeFeAhL,         & 
& cplcUFeFeAhR,cplcUFeFehhL,cplcUFeFehhR,cplcUFeFeVPL,cplcUFeFeVPR,cplcUFeFeVZL,         & 
& cplcUFeFeVZR,cplcUFeFvcHpL,cplcUFeFvcHpR,cplcUFeFvcVWpL,cplcUFeFvcVWpR)

Implicit None 
Real(dp), Intent(in) :: g3,g1,g2,TW

Complex(dp), Intent(in) :: Yd(3,3),ZDL(3,3),ZDR(3,3),Yu(3,3),ZUL(3,3),ZUR(3,3),Ye(3,3),ZEL(3,3),ZER(3,3)

Complex(dp), Intent(out) :: cplcUFdFdAhL(3,3),cplcUFdFdAhR(3,3),cplcUFdFdhhL(3,3),cplcUFdFdhhR(3,3),              & 
& cplcUFdFdVGL(3,3),cplcUFdFdVGR(3,3),cplcUFdFdVPL(3,3),cplcUFdFdVPR(3,3),               & 
& cplcUFdFdVZL(3,3),cplcUFdFdVZR(3,3),cplcUFdFucHpL(3,3),cplcUFdFucHpR(3,3),             & 
& cplcUFdFucVWpL(3,3),cplcUFdFucVWpR(3,3),cplcUFuFuAhL(3,3),cplcUFuFuAhR(3,3),           & 
& cplcUFuFdHpL(3,3),cplcUFuFdHpR(3,3),cplcUFuFdVWpL(3,3),cplcUFuFdVWpR(3,3),             & 
& cplcUFuFuhhL(3,3),cplcUFuFuhhR(3,3),cplcUFuFuVGL(3,3),cplcUFuFuVGR(3,3),               & 
& cplcUFuFuVPL(3,3),cplcUFuFuVPR(3,3),cplcUFuFuVZL(3,3),cplcUFuFuVZR(3,3),               & 
& cplcUFeFeAhL(3,3),cplcUFeFeAhR(3,3),cplcUFeFehhL(3,3),cplcUFeFehhR(3,3),               & 
& cplcUFeFeVPL(3,3),cplcUFeFeVPR(3,3),cplcUFeFeVZL(3,3),cplcUFeFeVZR(3,3),               & 
& cplcUFeFvcHpL(3,3),cplcUFeFvcHpR(3,3),cplcUFeFvcVWpL(3,3),cplcUFeFvcVWpR(3,3)

Integer :: gt1, gt2, gt3, gt4, ct1, ct2, ct3, ct4

Iname = Iname + 1 
NameOfUnit(Iname) = 'CouplingsForSMfermions'
 
cplcUFdFdAhL = 0._dp 
cplcUFdFdAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcUFdFdAhL(gt1,gt2,Yd,ZDL,ZDR,cplcUFdFdAhL(gt1,gt2),cplcUFdFdAhR(gt1,gt2))

 End Do 
End Do 


cplcUFdFdhhL = 0._dp 
cplcUFdFdhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcUFdFdhhL(gt1,gt2,Yd,ZDL,ZDR,cplcUFdFdhhL(gt1,gt2),cplcUFdFdhhR(gt1,gt2))

 End Do 
End Do 


cplcUFdFdVGL = 0._dp 
cplcUFdFdVGR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcUFdFdVGL(gt1,gt2,g3,ZDL,ZDR,cplcUFdFdVGL(gt1,gt2),cplcUFdFdVGR(gt1,gt2))

 End Do 
End Do 


cplcUFdFdVPL = 0._dp 
cplcUFdFdVPR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcUFdFdVPL(gt1,gt2,g1,g2,ZDL,ZDR,TW,cplcUFdFdVPL(gt1,gt2),cplcUFdFdVPR(gt1,gt2))

 End Do 
End Do 


cplcUFdFdVZL = 0._dp 
cplcUFdFdVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcUFdFdVZL(gt1,gt2,g1,g2,ZDL,ZDR,TW,cplcUFdFdVZL(gt1,gt2),cplcUFdFdVZR(gt1,gt2))

 End Do 
End Do 


cplcUFdFucHpL = 0._dp 
cplcUFdFucHpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcUFdFucHpL(gt1,gt2,Yu,Yd,ZUL,ZUR,cplcUFdFucHpL(gt1,gt2),cplcUFdFucHpR(gt1,gt2))

 End Do 
End Do 


cplcUFdFucVWpL = 0._dp 
cplcUFdFucVWpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcUFdFucVWpL(gt1,gt2,g2,ZUL,cplcUFdFucVWpL(gt1,gt2),cplcUFdFucVWpR(gt1,gt2))

 End Do 
End Do 


cplcUFuFuAhL = 0._dp 
cplcUFuFuAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcUFuFuAhL(gt1,gt2,Yu,ZUL,ZUR,cplcUFuFuAhL(gt1,gt2),cplcUFuFuAhR(gt1,gt2))

 End Do 
End Do 


cplcUFuFdHpL = 0._dp 
cplcUFuFdHpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcUFuFdHpL(gt1,gt2,Yu,Yd,ZDL,ZDR,cplcUFuFdHpL(gt1,gt2),cplcUFuFdHpR(gt1,gt2))

 End Do 
End Do 


cplcUFuFdVWpL = 0._dp 
cplcUFuFdVWpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcUFuFdVWpL(gt1,gt2,g2,ZDL,cplcUFuFdVWpL(gt1,gt2),cplcUFuFdVWpR(gt1,gt2))

 End Do 
End Do 


cplcUFuFuhhL = 0._dp 
cplcUFuFuhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcUFuFuhhL(gt1,gt2,Yu,ZUL,ZUR,cplcUFuFuhhL(gt1,gt2),cplcUFuFuhhR(gt1,gt2))

 End Do 
End Do 


cplcUFuFuVGL = 0._dp 
cplcUFuFuVGR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcUFuFuVGL(gt1,gt2,g3,ZUL,ZUR,cplcUFuFuVGL(gt1,gt2),cplcUFuFuVGR(gt1,gt2))

 End Do 
End Do 


cplcUFuFuVPL = 0._dp 
cplcUFuFuVPR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcUFuFuVPL(gt1,gt2,g1,g2,ZUL,ZUR,TW,cplcUFuFuVPL(gt1,gt2),cplcUFuFuVPR(gt1,gt2))

 End Do 
End Do 


cplcUFuFuVZL = 0._dp 
cplcUFuFuVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcUFuFuVZL(gt1,gt2,g1,g2,ZUL,ZUR,TW,cplcUFuFuVZL(gt1,gt2),cplcUFuFuVZR(gt1,gt2))

 End Do 
End Do 


cplcUFeFeAhL = 0._dp 
cplcUFeFeAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcUFeFeAhL(gt1,gt2,Ye,ZEL,ZER,cplcUFeFeAhL(gt1,gt2),cplcUFeFeAhR(gt1,gt2))

 End Do 
End Do 


cplcUFeFehhL = 0._dp 
cplcUFeFehhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcUFeFehhL(gt1,gt2,Ye,ZEL,ZER,cplcUFeFehhL(gt1,gt2),cplcUFeFehhR(gt1,gt2))

 End Do 
End Do 


cplcUFeFeVPL = 0._dp 
cplcUFeFeVPR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcUFeFeVPL(gt1,gt2,g1,g2,ZEL,ZER,TW,cplcUFeFeVPL(gt1,gt2),cplcUFeFeVPR(gt1,gt2))

 End Do 
End Do 


cplcUFeFeVZL = 0._dp 
cplcUFeFeVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcUFeFeVZL(gt1,gt2,g1,g2,ZEL,ZER,TW,cplcUFeFeVZL(gt1,gt2),cplcUFeFeVZR(gt1,gt2))

 End Do 
End Do 


cplcUFeFvcHpL = 0._dp 
cplcUFeFvcHpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcUFeFvcHpL(gt1,gt2,Ye,cplcUFeFvcHpL(gt1,gt2),cplcUFeFvcHpR(gt1,gt2))

 End Do 
End Do 


cplcUFeFvcVWpL = 0._dp 
cplcUFeFvcVWpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcUFeFvcVWpL(gt1,gt2,g2,cplcUFeFvcVWpL(gt1,gt2),cplcUFeFvcVWpR(gt1,gt2))

 End Do 
End Do 


Iname = Iname - 1 
End Subroutine CouplingsForSMfermions

Subroutine CouplingsForTadpoles(Yd,ZDL,ZDR,Yu,ZUL,ZUR,Ye,ZEL,ZER,Lam,vvSM,            & 
& g2,g1,TW,cplcUFdFdhhL,cplcUFdFdhhR,cplcUFuFuhhL,cplcUFuFuhhR,cplcUFeFehhL,             & 
& cplcUFeFehhR,cplhhHpcHp,cplhhcHpVWp,cplhhhhHpcHp,cplAhAhhh,cplAhhhVZ,cplAhAhhhhh,      & 
& cplcFdFdhhL,cplcFdFdhhR,cplcFeFehhL,cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,               & 
& cplcgWpgWphh,cplcgWCgWChh,cplcgZgZhh,cplhhhhhh,cplhhHpcVWp,cplhhcVWpVWp,               & 
& cplhhVZVZ,cplhhhhhhhh,cplhhhhcVWpVWp,cplhhhhVZVZ)

Implicit None 
Real(dp), Intent(in) :: vvSM,g2,g1,TW

Complex(dp), Intent(in) :: Yd(3,3),ZDL(3,3),ZDR(3,3),Yu(3,3),ZUL(3,3),ZUR(3,3),Ye(3,3),ZEL(3,3),ZER(3,3),Lam

Complex(dp), Intent(out) :: cplcUFdFdhhL(3,3),cplcUFdFdhhR(3,3),cplcUFuFuhhL(3,3),cplcUFuFuhhR(3,3),              & 
& cplcUFeFehhL(3,3),cplcUFeFehhR(3,3),cplhhHpcHp,cplhhcHpVWp,cplhhhhHpcHp,               & 
& cplAhAhhh,cplAhhhVZ,cplAhAhhhhh,cplcFdFdhhL(3,3),cplcFdFdhhR(3,3),cplcFeFehhL(3,3),    & 
& cplcFeFehhR(3,3),cplcFuFuhhL(3,3),cplcFuFuhhR(3,3),cplcgWpgWphh,cplcgWCgWChh,          & 
& cplcgZgZhh,cplhhhhhh,cplhhHpcVWp,cplhhcVWpVWp,cplhhVZVZ,cplhhhhhhhh,cplhhhhcVWpVWp,    & 
& cplhhhhVZVZ

Integer :: gt1, gt2, gt3, gt4, ct1, ct2, ct3, ct4

Iname = Iname + 1 
NameOfUnit(Iname) = 'CouplingsForTadpoles'
 
cplcUFdFdhhL = 0._dp 
cplcUFdFdhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcUFdFdhhL(gt1,gt2,Yd,ZDL,ZDR,cplcUFdFdhhL(gt1,gt2),cplcUFdFdhhR(gt1,gt2))

 End Do 
End Do 


cplcUFuFuhhL = 0._dp 
cplcUFuFuhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcUFuFuhhL(gt1,gt2,Yu,ZUL,ZUR,cplcUFuFuhhL(gt1,gt2),cplcUFuFuhhR(gt1,gt2))

 End Do 
End Do 


cplcUFeFehhL = 0._dp 
cplcUFeFehhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcUFeFehhL(gt1,gt2,Ye,ZEL,ZER,cplcUFeFehhL(gt1,gt2),cplcUFeFehhR(gt1,gt2))

 End Do 
End Do 


cplhhHpcHp = 0._dp 
Call CouplinghhHpcHpL(Lam,vvSM,cplhhHpcHp)



cplhhcHpVWp = 0._dp 
Call CouplinghhcHpVWpL(g2,cplhhcHpVWp)



cplhhhhHpcHp = 0._dp 
Call CouplinghhhhHpcHpL(Lam,cplhhhhHpcHp)



cplAhAhhh = 0._dp 
Call CouplingAhAhhhL(Lam,vvSM,cplAhAhhh)



cplAhhhVZ = 0._dp 
Call CouplingAhhhVZL(g1,g2,TW,cplAhhhVZ)



cplAhAhhhhh = 0._dp 
Call CouplingAhAhhhhhL(Lam,cplAhAhhhhh)



cplcFdFdhhL = 0._dp 
cplcFdFdhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFdhhL(gt1,gt2,Yd,ZDL,ZDR,cplcFdFdhhL(gt1,gt2),cplcFdFdhhR(gt1,gt2))

 End Do 
End Do 


cplcFeFehhL = 0._dp 
cplcFeFehhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFeFehhL(gt1,gt2,Ye,ZEL,ZER,cplcFeFehhL(gt1,gt2),cplcFeFehhR(gt1,gt2))

 End Do 
End Do 


cplcFuFuhhL = 0._dp 
cplcFuFuhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFuhhL(gt1,gt2,Yu,ZUL,ZUR,cplcFuFuhhL(gt1,gt2),cplcFuFuhhR(gt1,gt2))

 End Do 
End Do 


cplcgWpgWphh = 0._dp 
Call CouplingcgWpgWphhL(g2,vvSM,cplcgWpgWphh)



cplcgWCgWChh = 0._dp 
Call CouplingcgWCgWChhL(g2,vvSM,cplcgWCgWChh)



cplcgZgZhh = 0._dp 
Call CouplingcgZgZhhL(g1,g2,vvSM,TW,cplcgZgZhh)



cplhhhhhh = 0._dp 
Call CouplinghhhhhhL(Lam,vvSM,cplhhhhhh)



cplhhHpcVWp = 0._dp 
Call CouplinghhHpcVWpL(g2,cplhhHpcVWp)



cplhhcVWpVWp = 0._dp 
Call CouplinghhcVWpVWpL(g2,vvSM,cplhhcVWpVWp)



cplhhVZVZ = 0._dp 
Call CouplinghhVZVZL(g1,g2,vvSM,TW,cplhhVZVZ)



cplhhhhhhhh = 0._dp 
Call CouplinghhhhhhhhL(Lam,cplhhhhhhhh)



cplhhhhcVWpVWp = 0._dp 
Call CouplinghhhhcVWpVWpL(g2,cplhhhhcVWpVWp)



cplhhhhVZVZ = 0._dp 
Call CouplinghhhhVZVZL(g1,g2,TW,cplhhhhVZVZ)



Iname = Iname - 1 
End Subroutine CouplingsForTadpoles

Subroutine CouplingsColoredQuartics(Lam,g2,g1,TW,g3,cplAhAhAhAh1,cplAhAhhhhh1,        & 
& cplAhAhHpcHp1,cplhhhhhhhh1,cplhhhhHpcHp1,cplHpHpcHpcHp1,cplAhAhcVWpVWp1,               & 
& cplAhAhVZVZ1,cplAhHpcVWpVP1,cplAhHpcVWpVZ1,cplAhcHpVPVWp1,cplAhcHpVWpVZ1,              & 
& cplhhhhcVWpVWp1,cplhhhhVZVZ1,cplhhHpcVWpVP1,cplhhHpcVWpVZ1,cplhhcHpVPVWp1,             & 
& cplhhcHpVWpVZ1,cplHpcHpVPVP1,cplHpcHpVPVZ1,cplHpcHpcVWpVWp1,cplHpcHpVZVZ1,             & 
& cplVGVGVGVG1Q,cplVGVGVGVG2Q,cplVGVGVGVG3Q,cplcVWpVPVPVWp1Q,cplcVWpVPVPVWp2Q,           & 
& cplcVWpVPVPVWp3Q,cplcVWpVPVWpVZ1Q,cplcVWpVPVWpVZ2Q,cplcVWpVPVWpVZ3Q,cplcVWpcVWpVWpVWp1Q,& 
& cplcVWpcVWpVWpVWp2Q,cplcVWpcVWpVWpVWp3Q,cplcVWpVWpVZVZ1Q,cplcVWpVWpVZVZ2Q,             & 
& cplcVWpVWpVZVZ3Q)

Implicit None 
Real(dp), Intent(in) :: g2,g1,TW,g3

Complex(dp), Intent(in) :: Lam

Complex(dp), Intent(out) :: cplAhAhAhAh1,cplAhAhhhhh1,cplAhAhHpcHp1,cplhhhhhhhh1,cplhhhhHpcHp1,cplHpHpcHpcHp1,    & 
& cplAhAhcVWpVWp1,cplAhAhVZVZ1,cplAhHpcVWpVP1,cplAhHpcVWpVZ1,cplAhcHpVPVWp1,             & 
& cplAhcHpVWpVZ1,cplhhhhcVWpVWp1,cplhhhhVZVZ1,cplhhHpcVWpVP1,cplhhHpcVWpVZ1,             & 
& cplhhcHpVPVWp1,cplhhcHpVWpVZ1,cplHpcHpVPVP1,cplHpcHpVPVZ1,cplHpcHpcVWpVWp1,            & 
& cplHpcHpVZVZ1,cplVGVGVGVG1Q,cplVGVGVGVG2Q,cplVGVGVGVG3Q,cplcVWpVPVPVWp1Q,              & 
& cplcVWpVPVPVWp2Q,cplcVWpVPVPVWp3Q,cplcVWpVPVWpVZ1Q,cplcVWpVPVWpVZ2Q,cplcVWpVPVWpVZ3Q,  & 
& cplcVWpcVWpVWpVWp1Q,cplcVWpcVWpVWpVWp2Q,cplcVWpcVWpVWpVWp3Q,cplcVWpVWpVZVZ1Q,          & 
& cplcVWpVWpVZVZ2Q,cplcVWpVWpVZVZ3Q

Integer :: gt1, gt2, gt3, gt4, ct1, ct2, ct3, ct4

Iname = Iname + 1 
NameOfUnit(Iname) = 'CouplingsColoredQuartics'
 
cplAhAhAhAh1 = 0._dp 
Call CouplingAhAhAhAhQ(Lam,cplAhAhAhAh1)



cplAhAhhhhh1 = 0._dp 
Call CouplingAhAhhhhhQ(Lam,cplAhAhhhhh1)



cplAhAhHpcHp1 = 0._dp 
Call CouplingAhAhHpcHpQ(Lam,cplAhAhHpcHp1)



cplhhhhhhhh1 = 0._dp 
Call CouplinghhhhhhhhQ(Lam,cplhhhhhhhh1)



cplhhhhHpcHp1 = 0._dp 
Call CouplinghhhhHpcHpQ(Lam,cplhhhhHpcHp1)



cplHpHpcHpcHp1 = 0._dp 
Call CouplingHpHpcHpcHpQ(Lam,cplHpHpcHpcHp1)



cplAhAhcVWpVWp1 = 0._dp 
Call CouplingAhAhcVWpVWpQ(g2,cplAhAhcVWpVWp1)



cplAhAhVZVZ1 = 0._dp 
Call CouplingAhAhVZVZQ(g1,g2,TW,cplAhAhVZVZ1)



cplAhHpcVWpVP1 = 0._dp 
Call CouplingAhHpcVWpVPQ(g1,g2,TW,cplAhHpcVWpVP1)



cplAhHpcVWpVZ1 = 0._dp 
Call CouplingAhHpcVWpVZQ(g1,g2,TW,cplAhHpcVWpVZ1)



cplAhcHpVPVWp1 = 0._dp 
Call CouplingAhcHpVPVWpQ(g1,g2,TW,cplAhcHpVPVWp1)



cplAhcHpVWpVZ1 = 0._dp 
Call CouplingAhcHpVWpVZQ(g1,g2,TW,cplAhcHpVWpVZ1)



cplhhhhcVWpVWp1 = 0._dp 
Call CouplinghhhhcVWpVWpQ(g2,cplhhhhcVWpVWp1)



cplhhhhVZVZ1 = 0._dp 
Call CouplinghhhhVZVZQ(g1,g2,TW,cplhhhhVZVZ1)



cplhhHpcVWpVP1 = 0._dp 
Call CouplinghhHpcVWpVPQ(g1,g2,TW,cplhhHpcVWpVP1)



cplhhHpcVWpVZ1 = 0._dp 
Call CouplinghhHpcVWpVZQ(g1,g2,TW,cplhhHpcVWpVZ1)



cplhhcHpVPVWp1 = 0._dp 
Call CouplinghhcHpVPVWpQ(g1,g2,TW,cplhhcHpVPVWp1)



cplhhcHpVWpVZ1 = 0._dp 
Call CouplinghhcHpVWpVZQ(g1,g2,TW,cplhhcHpVWpVZ1)



cplHpcHpVPVP1 = 0._dp 
Call CouplingHpcHpVPVPQ(g1,g2,TW,cplHpcHpVPVP1)



cplHpcHpVPVZ1 = 0._dp 
Call CouplingHpcHpVPVZQ(g1,g2,TW,cplHpcHpVPVZ1)



cplHpcHpcVWpVWp1 = 0._dp 
Call CouplingHpcHpcVWpVWpQ(g2,cplHpcHpcVWpVWp1)



cplHpcHpVZVZ1 = 0._dp 
Call CouplingHpcHpVZVZQ(g1,g2,TW,cplHpcHpVZVZ1)



cplVGVGVGVG1Q = 0._dp 
cplVGVGVGVG2Q = 0._dp 
cplVGVGVGVG3Q = 0._dp 
Call CouplingVGVGVGVGQ(g3,cplVGVGVGVG1Q,cplVGVGVGVG2Q,cplVGVGVGVG3Q)



cplcVWpVPVPVWp1Q = 0._dp 
cplcVWpVPVPVWp2Q = 0._dp 
cplcVWpVPVPVWp3Q = 0._dp 
Call CouplingcVWpVPVPVWpQ(g2,TW,cplcVWpVPVPVWp1Q,cplcVWpVPVPVWp2Q,cplcVWpVPVPVWp3Q)



cplcVWpVPVWpVZ1Q = 0._dp 
cplcVWpVPVWpVZ2Q = 0._dp 
cplcVWpVPVWpVZ3Q = 0._dp 
Call CouplingcVWpVPVWpVZQ(g2,TW,cplcVWpVPVWpVZ1Q,cplcVWpVPVWpVZ2Q,cplcVWpVPVWpVZ3Q)



cplcVWpcVWpVWpVWp1Q = 0._dp 
cplcVWpcVWpVWpVWp2Q = 0._dp 
cplcVWpcVWpVWpVWp3Q = 0._dp 
Call CouplingcVWpcVWpVWpVWpQ(g2,cplcVWpcVWpVWpVWp1Q,cplcVWpcVWpVWpVWp2Q,              & 
& cplcVWpcVWpVWpVWp3Q)



cplcVWpVWpVZVZ1Q = 0._dp 
cplcVWpVWpVZVZ2Q = 0._dp 
cplcVWpVWpVZVZ3Q = 0._dp 
Call CouplingcVWpVWpVZVZQ(g2,TW,cplcVWpVWpVZVZ1Q,cplcVWpVWpVZVZ2Q,cplcVWpVWpVZVZ3Q)



Iname = Iname - 1 
End Subroutine CouplingsColoredQuartics

Subroutine CouplingAhAhAhAhQ(Lam,res1)

Implicit None 

Complex(dp), Intent(in) :: Lam

Complex(dp), Intent(out) :: res1 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhAhAh' 
 
res1 = 0._dp 
res1 = res1-3._dp*(Lam)

 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhAhAhQ  
 
 
Subroutine CouplingAhAhhhhhQ(Lam,res1)

Implicit None 

Complex(dp), Intent(in) :: Lam

Complex(dp), Intent(out) :: res1 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhhhhh' 
 
res1 = 0._dp 
res1 = res1-1._dp*(Lam)

 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhhhhhQ  
 
 
Subroutine CouplingAhAhHpcHpQ(Lam,res1)

Implicit None 

Complex(dp), Intent(in) :: Lam

Complex(dp), Intent(out) :: res1 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhHpcHp' 
 
res1 = 0._dp 
res1 = res1-1._dp*(Lam)

 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhHpcHpQ  
 
 
Subroutine CouplinghhhhhhhhQ(Lam,res1)

Implicit None 

Complex(dp), Intent(in) :: Lam

Complex(dp), Intent(out) :: res1 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'Couplinghhhhhhhh' 
 
res1 = 0._dp 
res1 = res1-3._dp*(Lam)

 


Iname = Iname - 1 
 
End Subroutine CouplinghhhhhhhhQ  
 
 
Subroutine CouplinghhhhHpcHpQ(Lam,res1)

Implicit None 

Complex(dp), Intent(in) :: Lam

Complex(dp), Intent(out) :: res1 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhhhHpcHp' 
 
res1 = 0._dp 
res1 = res1-1._dp*(Lam)

 


Iname = Iname - 1 
 
End Subroutine CouplinghhhhHpcHpQ  
 
 
Subroutine CouplingHpHpcHpcHpQ(Lam,res1)

Implicit None 

Complex(dp), Intent(in) :: Lam

Complex(dp), Intent(out) :: res1 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingHpHpcHpcHp' 
 
res1 = 0._dp 
res1 = res1-2._dp*(Lam)

 


Iname = Iname - 1 
 
End Subroutine CouplingHpHpcHpcHpQ  
 
 
Subroutine CouplingAhAhcVWpVWpQ(g2,res1)

Implicit None 

Real(dp), Intent(in) :: g2

Complex(dp), Intent(out) :: res1 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhcVWpVWp' 
 
res1 = 0._dp 
res1 = res1+g2**2/2._dp

 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhcVWpVWpQ  
 
 
Subroutine CouplingAhAhVZVZQ(g1,g2,TW,res1)

Implicit None 

Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(out) :: res1 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhVZVZ' 
 
res1 = 0._dp 
res1 = res1+(g2**2*Cos(TW)**2)/2._dp
res1 = res1+g1*g2*Cos(TW)*Sin(TW)
res1 = res1+(g1**2*Sin(TW)**2)/2._dp

 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhVZVZQ  
 
 
Subroutine CouplingAhHpcVWpVPQ(g1,g2,TW,res1)

Implicit None 

Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(out) :: res1 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhHpcVWpVP' 
 
res1 = 0._dp 
res1 = res1+(g1*g2*Cos(TW))/2._dp
res1 = -(0.,1.)*res1 
 


Iname = Iname - 1 
 
End Subroutine CouplingAhHpcVWpVPQ  
 
 
Subroutine CouplingAhHpcVWpVZQ(g1,g2,TW,res1)

Implicit None 

Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(out) :: res1 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhHpcVWpVZ' 
 
res1 = 0._dp 
res1 = res1-1._dp/2._dp*(g1*g2*Sin(TW))
res1 = -(0.,1.)*res1 
 


Iname = Iname - 1 
 
End Subroutine CouplingAhHpcVWpVZQ  
 
 
Subroutine CouplingAhcHpVPVWpQ(g1,g2,TW,res1)

Implicit None 

Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(out) :: res1 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhcHpVPVWp' 
 
res1 = 0._dp 
res1 = res1-1._dp/2._dp*(g1*g2*Cos(TW))
res1 = -(0.,1.)*res1 
 


Iname = Iname - 1 
 
End Subroutine CouplingAhcHpVPVWpQ  
 
 
Subroutine CouplingAhcHpVWpVZQ(g1,g2,TW,res1)

Implicit None 

Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(out) :: res1 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhcHpVWpVZ' 
 
res1 = 0._dp 
res1 = res1+(g1*g2*Sin(TW))/2._dp
res1 = -(0.,1.)*res1 
 


Iname = Iname - 1 
 
End Subroutine CouplingAhcHpVWpVZQ  
 
 
Subroutine CouplinghhhhcVWpVWpQ(g2,res1)

Implicit None 

Real(dp), Intent(in) :: g2

Complex(dp), Intent(out) :: res1 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhhhcVWpVWp' 
 
res1 = 0._dp 
res1 = res1+g2**2/2._dp

 


Iname = Iname - 1 
 
End Subroutine CouplinghhhhcVWpVWpQ  
 
 
Subroutine CouplinghhhhVZVZQ(g1,g2,TW,res1)

Implicit None 

Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(out) :: res1 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhhhVZVZ' 
 
res1 = 0._dp 
res1 = res1+(g2**2*Cos(TW)**2)/2._dp
res1 = res1+g1*g2*Cos(TW)*Sin(TW)
res1 = res1+(g1**2*Sin(TW)**2)/2._dp

 


Iname = Iname - 1 
 
End Subroutine CouplinghhhhVZVZQ  
 
 
Subroutine CouplinghhHpcVWpVPQ(g1,g2,TW,res1)

Implicit None 

Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(out) :: res1 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhHpcVWpVP' 
 
res1 = 0._dp 
res1 = res1+(g1*g2*Cos(TW))/2._dp

 


Iname = Iname - 1 
 
End Subroutine CouplinghhHpcVWpVPQ  
 
 
Subroutine CouplinghhHpcVWpVZQ(g1,g2,TW,res1)

Implicit None 

Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(out) :: res1 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhHpcVWpVZ' 
 
res1 = 0._dp 
res1 = res1-1._dp/2._dp*(g1*g2*Sin(TW))

 


Iname = Iname - 1 
 
End Subroutine CouplinghhHpcVWpVZQ  
 
 
Subroutine CouplinghhcHpVPVWpQ(g1,g2,TW,res1)

Implicit None 

Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(out) :: res1 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhcHpVPVWp' 
 
res1 = 0._dp 
res1 = res1+(g1*g2*Cos(TW))/2._dp

 


Iname = Iname - 1 
 
End Subroutine CouplinghhcHpVPVWpQ  
 
 
Subroutine CouplinghhcHpVWpVZQ(g1,g2,TW,res1)

Implicit None 

Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(out) :: res1 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhcHpVWpVZ' 
 
res1 = 0._dp 
res1 = res1-1._dp/2._dp*(g1*g2*Sin(TW))

 


Iname = Iname - 1 
 
End Subroutine CouplinghhcHpVWpVZQ  
 
 
Subroutine CouplingHpcHpVPVPQ(g1,g2,TW,res1)

Implicit None 

Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(out) :: res1 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingHpcHpVPVP' 
 
res1 = 0._dp 
res1 = res1+(g1**2*Cos(TW)**2)/2._dp
res1 = res1+g1*g2*Cos(TW)*Sin(TW)
res1 = res1+(g2**2*Sin(TW)**2)/2._dp

 


Iname = Iname - 1 
 
End Subroutine CouplingHpcHpVPVPQ  
 
 
Subroutine CouplingHpcHpVPVZQ(g1,g2,TW,res1)

Implicit None 

Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(out) :: res1 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingHpcHpVPVZ' 
 
res1 = 0._dp 
res1 = res1+(g1*g2*Cos(2._dp*(TW)))/2._dp
res1 = res1-1._dp/4._dp*(g1**2*Sin(2._dp*(TW)))
res1 = res1+(g2**2*Sin(2._dp*(TW)))/4._dp

 


Iname = Iname - 1 
 
End Subroutine CouplingHpcHpVPVZQ  
 
 
Subroutine CouplingHpcHpcVWpVWpQ(g2,res1)

Implicit None 

Real(dp), Intent(in) :: g2

Complex(dp), Intent(out) :: res1 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingHpcHpcVWpVWp' 
 
res1 = 0._dp 
res1 = res1+g2**2/2._dp

 


Iname = Iname - 1 
 
End Subroutine CouplingHpcHpcVWpVWpQ  
 
 
Subroutine CouplingHpcHpVZVZQ(g1,g2,TW,res1)

Implicit None 

Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(out) :: res1 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingHpcHpVZVZ' 
 
res1 = 0._dp 
res1 = res1+(g2**2*Cos(TW)**2)/2._dp
res1 = res1-(g1*g2*Cos(TW)*Sin(TW))
res1 = res1+(g1**2*Sin(TW)**2)/2._dp

 


Iname = Iname - 1 
 
End Subroutine CouplingHpcHpVZVZQ  
 
 
Subroutine CouplingVGVGVGVGQ(g3,res1,res2,res3)

Implicit None 

Real(dp), Intent(in) :: g3

Complex(dp), Intent(out) :: res1 
Complex(dp), Intent(out) :: res2 
Complex(dp), Intent(out) :: res3 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingVGVGVGVG' 
 
res1 = 0._dp 
res1 = res1-16*g3**2

 
res2 = 0._dp 
res2 = -(0.,1.)*res2 
 
res3 = 0._dp 
res3 = res3+16*g3**2

 


Iname = Iname - 1 
 
End Subroutine CouplingVGVGVGVGQ  
 
 
Subroutine CouplingcVWpVPVPVWpQ(g2,TW,res1,res2,res3)

Implicit None 

Real(dp), Intent(in) :: g2,TW

Complex(dp), Intent(out) :: res1 
Complex(dp), Intent(out) :: res2 
Complex(dp), Intent(out) :: res3 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcVWpVPVPVWp' 
 
res1 = 0._dp 
res1 = res1+g2**2*Sin(TW)**2

 
res2 = 0._dp 
res2 = res2+g2**2*Sin(TW)**2

 
res3 = 0._dp 
res3 = res3-2*g2**2*Sin(TW)**2

 


Iname = Iname - 1 
 
End Subroutine CouplingcVWpVPVPVWpQ  
 
 
Subroutine CouplingcVWpVPVWpVZQ(g2,TW,res1,res2,res3)

Implicit None 

Real(dp), Intent(in) :: g2,TW

Complex(dp), Intent(out) :: res1 
Complex(dp), Intent(out) :: res2 
Complex(dp), Intent(out) :: res3 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcVWpVPVWpVZ' 
 
res1 = 0._dp 
res1 = res1+g2**2*Cos(TW)*Sin(TW)

 
res2 = 0._dp 
res2 = res2-(g2**2*Sin(2._dp*(TW)))

 
res3 = 0._dp 
res3 = res3+g2**2*Cos(TW)*Sin(TW)

 


Iname = Iname - 1 
 
End Subroutine CouplingcVWpVPVWpVZQ  
 
 
Subroutine CouplingcVWpcVWpVWpVWpQ(g2,res1,res2,res3)

Implicit None 

Real(dp), Intent(in) :: g2

Complex(dp), Intent(out) :: res1 
Complex(dp), Intent(out) :: res2 
Complex(dp), Intent(out) :: res3 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcVWpcVWpVWpVWp' 
 
res1 = 0._dp 
res1 = res1+2*g2**2

 
res2 = 0._dp 
res2 = res2-g2**2

 
res3 = 0._dp 
res3 = res3-g2**2

 


Iname = Iname - 1 
 
End Subroutine CouplingcVWpcVWpVWpVWpQ  
 
 
Subroutine CouplingcVWpVWpVZVZQ(g2,TW,res1,res2,res3)

Implicit None 

Real(dp), Intent(in) :: g2,TW

Complex(dp), Intent(out) :: res1 
Complex(dp), Intent(out) :: res2 
Complex(dp), Intent(out) :: res3 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcVWpVWpVZVZ' 
 
res1 = 0._dp 
res1 = res1-2*g2**2*Cos(TW)**2

 
res2 = 0._dp 
res2 = res2+g2**2*Cos(TW)**2

 
res3 = 0._dp 
res3 = res3+g2**2*Cos(TW)**2

 


Iname = Iname - 1 
 
End Subroutine CouplingcVWpVWpVZVZQ  
 
 
Subroutine CouplingsColourStructures(Lam,vvSM,cplAhAhhh,cplhhhhhh,cplhhHpcHp,         & 
& cplAhAhAhAh,cplAhAhhhhh,cplAhAhHpcHp,cplhhhhhhhh,cplhhhhHpcHp,cplHpHpcHpcHp)

Implicit None 
Real(dp), Intent(in) :: vvSM

Complex(dp), Intent(in) :: Lam

Complex(dp), Intent(out) :: cplAhAhhh,cplhhhhhh,cplhhHpcHp,cplAhAhAhAh,cplAhAhhhhh,cplAhAhHpcHp,cplhhhhhhhh,      & 
& cplhhhhHpcHp,cplHpHpcHpcHp

Integer :: gt1, gt2, gt3, gt4, ct1, ct2, ct3, ct4

Iname = Iname + 1 
NameOfUnit(Iname) = 'CouplingsColourStructures'
 
cplAhAhhh = 0._dp 
Call CouplingAhAhhhCS(Lam,vvSM,cplAhAhhh)



cplhhhhhh = 0._dp 
Call CouplinghhhhhhCS(Lam,vvSM,cplhhhhhh)



cplhhHpcHp = 0._dp 
Call CouplinghhHpcHpCS(Lam,vvSM,cplhhHpcHp)



cplAhAhAhAh = 0._dp 
Call CouplingAhAhAhAhCS(Lam,cplAhAhAhAh)



cplAhAhhhhh = 0._dp 
Call CouplingAhAhhhhhCS(Lam,cplAhAhhhhh)



cplAhAhHpcHp = 0._dp 
Call CouplingAhAhHpcHpCS(Lam,cplAhAhHpcHp)



cplhhhhhhhh = 0._dp 
Call CouplinghhhhhhhhCS(Lam,cplhhhhhhhh)



cplhhhhHpcHp = 0._dp 
Call CouplinghhhhHpcHpCS(Lam,cplhhhhHpcHp)



cplHpHpcHpcHp = 0._dp 
Call CouplingHpHpcHpcHpCS(Lam,cplHpHpcHpcHp)



Iname = Iname - 1 
End Subroutine CouplingsColourStructures

Subroutine CouplingAhAhhhCS(Lam,vvSM,res1)

Implicit None 

Real(dp), Intent(in) :: vvSM

Complex(dp), Intent(in) :: Lam

Complex(dp), Intent(out) :: res1 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhhh' 
 
res1 = 0._dp 
res1 = res1-(vvSM*Lam)

 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhhhCS  
 
 
Subroutine CouplinghhhhhhCS(Lam,vvSM,res1)

Implicit None 

Real(dp), Intent(in) :: vvSM

Complex(dp), Intent(in) :: Lam

Complex(dp), Intent(out) :: res1 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'Couplinghhhhhh' 
 
res1 = 0._dp 
res1 = res1-3*vvSM*Lam

 


Iname = Iname - 1 
 
End Subroutine CouplinghhhhhhCS  
 
 
Subroutine CouplinghhHpcHpCS(Lam,vvSM,res1)

Implicit None 

Real(dp), Intent(in) :: vvSM

Complex(dp), Intent(in) :: Lam

Complex(dp), Intent(out) :: res1 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhHpcHp' 
 
res1 = 0._dp 
res1 = res1-(vvSM*Lam)

 


Iname = Iname - 1 
 
End Subroutine CouplinghhHpcHpCS  
 
 
Subroutine CouplingAhAhAhAhCS(Lam,res1)

Implicit None 

Complex(dp), Intent(in) :: Lam

Complex(dp), Intent(out) :: res1 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhAhAh' 
 
res1 = 0._dp 
res1 = res1-3._dp*(Lam)

 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhAhAhCS  
 
 
Subroutine CouplingAhAhhhhhCS(Lam,res1)

Implicit None 

Complex(dp), Intent(in) :: Lam

Complex(dp), Intent(out) :: res1 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhhhhh' 
 
res1 = 0._dp 
res1 = res1-1._dp*(Lam)

 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhhhhhCS  
 
 
Subroutine CouplingAhAhHpcHpCS(Lam,res1)

Implicit None 

Complex(dp), Intent(in) :: Lam

Complex(dp), Intent(out) :: res1 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhHpcHp' 
 
res1 = 0._dp 
res1 = res1-1._dp*(Lam)

 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhHpcHpCS  
 
 
Subroutine CouplinghhhhhhhhCS(Lam,res1)

Implicit None 

Complex(dp), Intent(in) :: Lam

Complex(dp), Intent(out) :: res1 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'Couplinghhhhhhhh' 
 
res1 = 0._dp 
res1 = res1-3._dp*(Lam)

 


Iname = Iname - 1 
 
End Subroutine CouplinghhhhhhhhCS  
 
 
Subroutine CouplinghhhhHpcHpCS(Lam,res1)

Implicit None 

Complex(dp), Intent(in) :: Lam

Complex(dp), Intent(out) :: res1 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhhhHpcHp' 
 
res1 = 0._dp 
res1 = res1-1._dp*(Lam)

 


Iname = Iname - 1 
 
End Subroutine CouplinghhhhHpcHpCS  
 
 
Subroutine CouplingHpHpcHpcHpCS(Lam,res1)

Implicit None 

Complex(dp), Intent(in) :: Lam

Complex(dp), Intent(out) :: res1 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingHpHpcHpcHp' 
 
res1 = 0._dp 
res1 = res1-2._dp*(Lam)

 


Iname = Iname - 1 
 
End Subroutine CouplingHpHpcHpcHpCS  
 
 
End Module Couplings_SM 
