! ------------------------------------------------------------------------------  
! This file was automatically created by SARAH version 4.15.3 
! SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223,
!           1405.1434, 1411.0675, 1503.03098, 1703.09237, 1706.05372, 1805.07306  
! (c) Florian Staub, Mark Goodsell and Werner Porod 2020  
! ------------------------------------------------------------------------------  
! File created at 20:21 on 28.5.2025   
! ----------------------------------------------------------------------  
 
 
Module Tadpoles_DLRSM 
 
Use Model_Data_DLRSM 
Use TreeLevelMasses_DLRSM 
Use RGEs_DLRSM 
Use Control 
Use Settings 
Use Mathematics 

Contains 


Subroutine SolveTadpoleEquations(gBL,g2,g3,LAM2,LAM1,ALP1,RHO1,RHO2,ALP2,             & 
& ALP3,LAM5,LAM3,LAM4,LAM6,Y,YQ1,YQ2,Yt,MU12,MU22,k1,k2,vR,vL,Tad1Loop)

Implicit None
Real(dp),Intent(inout) :: gBL,g2,g3,LAM2,LAM1,ALP1,RHO1,RHO2,ALP2,ALP3,LAM5,LAM3,LAM4,LAM6,MU12,MU22,           & 
& k1,k2,vR,vL

Complex(dp),Intent(inout) :: Y(3,3),YQ1(3,3),YQ2(3,3),Yt(3,3)

Complex(dp), Intent(in) :: Tad1Loop(4)

! For numerical routines 
Real(dp) :: gC(92)
logical :: broycheck 
Real(dp) :: broyx(2)

If (HighScaleModel.Eq."LOW") Then 

 ! ----------- Check solutions for consistency  -------- 

 ! Check for NaNs 
Else 

 ! ----------- Check solutions for consistency  -------- 

 ! Check for NaNs 
End if 
End Subroutine SolveTadpoleEquations

Subroutine CalculateTadpoles(gBL,g2,g3,LAM2,LAM1,ALP1,RHO1,RHO2,ALP2,ALP3,            & 
& LAM5,LAM3,LAM4,LAM6,Y,YQ1,YQ2,Yt,MU12,MU22,k1,k2,vR,vL,Tad1Loop,TadpoleValues)

Real(dp),Intent(in) :: gBL,g2,g3,LAM2,LAM1,ALP1,RHO1,RHO2,ALP2,ALP3,LAM5,LAM3,LAM4,LAM6,MU12,MU22,           & 
& k1,k2,vR,vL

Complex(dp),Intent(in) :: Y(3,3),YQ1(3,3),YQ2(3,3),Yt(3,3)

Complex(dp), Intent(in) :: Tad1Loop(4)

Real(dp), Intent(out) :: TadpoleValues(4)

TadpoleValues(1) = Real(-1._dp/2._dp*(k1*(2*k1**2*(LAM1 + LAM2) + 2*k2**2*(LAM1 + 4._dp*(LAM3)& 
&  + 2._dp*(LAM6)) - 2._dp*(MU12) + ALP1*vL**2 + ALP1*vR**2)) - Tad1Loop(1),dp) 
TadpoleValues(2) = Real(-1._dp/2._dp*(k2*(2*k2**2*(LAM1 + LAM2) + 2*k1**2*(LAM1 + 4._dp*(LAM3)& 
&  + 2._dp*(LAM6)) - 2._dp*(MU12) + ALP1*vL**2 + ALP2*vL**2 + ALP1*vR**2 + ALP2*vR**2))  & 
&  - Tad1Loop(2),dp) 
TadpoleValues(3) = Real(-1._dp/2._dp*(vR*(ALP1*k1**2 + (ALP1 + ALP2)*k2**2 - 2._dp*(MU22)& 
&  + RHO2*vL**2 + 2*RHO1*vR**2)) - Tad1Loop(3),dp) 
TadpoleValues(4) = Real(-1._dp/2._dp*(vL*(ALP1*k1**2 + (ALP1 + ALP2)*k2**2 - 2._dp*(MU22)& 
&  + 2*RHO1*vL**2 + RHO2*vR**2)) - Tad1Loop(4),dp) 
End Subroutine CalculateTadpoles 

End Module Tadpoles_DLRSM 
 
