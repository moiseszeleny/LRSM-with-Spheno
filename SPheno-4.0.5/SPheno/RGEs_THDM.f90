! -----------------------------------------------------------------------------  
! This file was automatically created by SARAH version 4.6.0 
! SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223  
! (c) Florian Staub, 2013  
! ------------------------------------------------------------------------------  
! File created at 18:48 on 18.11.2015   
! ----------------------------------------------------------------------  
 
 
Module RGEs_THDM 
 
Use Control 
Use Model_Data_THDM 
Use Mathematics 
 
Logical,Private,Save::OnlyDiagonal

Real(dp),Parameter::id3R(3,3)=& 
   & Reshape(Source=(/& 
   & 1,0,0,& 
 &0,1,0,& 
 &0,0,1& 
 &/),shape=(/3,3/)) 
Contains 


Subroutine GToParameters73(g,g1,g2,g3,Lam5,Lam1,Lam4,Lam3,Lam2,Yu,Yd,Ye,              & 
& M12,M112,M222)

Implicit None 
Real(dp), Intent(in) :: g(73) 
Real(dp),Intent(out) :: g1,g2,g3

Complex(dp),Intent(out) :: Lam5,Lam1,Lam4,Lam3,Lam2,Yu(3,3),Yd(3,3),Ye(3,3),M12,M112,M222

Integer i1, i2, i3, i4, SumI 
 
Iname = Iname +1 
NameOfUnit(Iname) = 'GToParameters73' 
 
g1= g(1) 
g2= g(2) 
g3= g(3) 
Lam5= Cmplx(g(4),g(5),dp) 
Lam1= Cmplx(g(6),g(7),dp) 
Lam4= Cmplx(g(8),g(9),dp) 
Lam3= Cmplx(g(10),g(11),dp) 
Lam2= Cmplx(g(12),g(13),dp) 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
Yu(i1,i2) = Cmplx( g(SumI+14), g(SumI+15), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
Yd(i1,i2) = Cmplx( g(SumI+32), g(SumI+33), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
Ye(i1,i2) = Cmplx( g(SumI+50), g(SumI+51), dp) 
End Do 
 End Do 
 
M12= Cmplx(g(68),g(69),dp) 
M112= Cmplx(g(70),g(71),dp) 
M222= Cmplx(g(72),g(73),dp) 
Do i1=1,73 
If (g(i1).ne.g(i1)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Write(*,*) "At position ", i1 
 Call TerminateProgram 
End if 
End do 
Iname = Iname - 1 
 
End Subroutine GToParameters73

Subroutine ParametersToG73(g1,g2,g3,Lam5,Lam1,Lam4,Lam3,Lam2,Yu,Yd,Ye,M12,            & 
& M112,M222,g)

Implicit None 
Real(dp), Intent(out) :: g(73) 
Real(dp), Intent(in) :: g1,g2,g3

Complex(dp), Intent(in) :: Lam5,Lam1,Lam4,Lam3,Lam2,Yu(3,3),Yd(3,3),Ye(3,3),M12,M112,M222

Integer i1, i2, i3, i4, SumI 
 
Iname = Iname +1 
NameOfUnit(Iname) = 'ParametersToG73' 
 
g(1) = g1  
g(2) = g2  
g(3) = g3  
g(4) = Real(Lam5,dp)  
g(5) = Aimag(Lam5)  
g(6) = Real(Lam1,dp)  
g(7) = Aimag(Lam1)  
g(8) = Real(Lam4,dp)  
g(9) = Aimag(Lam4)  
g(10) = Real(Lam3,dp)  
g(11) = Aimag(Lam3)  
g(12) = Real(Lam2,dp)  
g(13) = Aimag(Lam2)  
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+14) = Real(Yu(i1,i2), dp) 
g(SumI+15) = Aimag(Yu(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+32) = Real(Yd(i1,i2), dp) 
g(SumI+33) = Aimag(Yd(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+50) = Real(Ye(i1,i2), dp) 
g(SumI+51) = Aimag(Ye(i1,i2)) 
End Do 
End Do 

g(68) = Real(M12,dp)  
g(69) = Aimag(M12)  
g(70) = Real(M112,dp)  
g(71) = Aimag(M112)  
g(72) = Real(M222,dp)  
g(73) = Aimag(M222)  
Iname = Iname - 1 
 
End Subroutine ParametersToG73

Subroutine rge73(len, T, GY, F) 
Implicit None 
Integer, Intent(in) :: len 
Real(dp), Intent(in) :: T, GY(len) 
Real(dp), Intent(out) :: F(len) 
Integer :: i1,i2,i3,i4 
Integer :: j1,j2,j3,j4,j5,j6,j7 
Real(dp) :: q 
Real(dp) :: g1,betag11,betag12,Dg1,g2,betag21,betag22,Dg2,g3,betag31,betag32,Dg3
Complex(dp) :: Lam5,betaLam51,betaLam52,DLam5,Lam1,betaLam11,betaLam12,               & 
& DLam1,Lam4,betaLam41,betaLam42,DLam4,Lam3,betaLam31,betaLam32,DLam3,Lam2,              & 
& betaLam21,betaLam22,DLam2,Yu(3,3),betaYu1(3,3),betaYu2(3,3),DYu(3,3),adjYu(3,3)        & 
& ,Yd(3,3),betaYd1(3,3),betaYd2(3,3),DYd(3,3),adjYd(3,3),Ye(3,3),betaYe1(3,3)            & 
& ,betaYe2(3,3),DYe(3,3),adjYe(3,3),M12,betaM121,betaM122,DM12,M112,betaM1121,           & 
& betaM1122,DM112,M222,betaM2221,betaM2222,DM222
Iname = Iname +1 
NameOfUnit(Iname) = 'rge73' 
 
OnlyDiagonal = .Not.GenerationMixing 
q = t 
 
Call GToParameters73(gy,g1,g2,g3,Lam5,Lam1,Lam4,Lam3,Lam2,Yu,Yd,Ye,M12,               & 
& M112,M222)

Call Adjungate(Yu,adjYu)
Call Adjungate(Yd,adjYd)
Call Adjungate(Ye,adjYe)


If (TwoLoopRGE) Then 
End If 
 
 
!-------------------- 
! g1 
!-------------------- 
 
betag11  = 0

 
 
If (TwoLoopRGE) Then 
betag12 = 0

 
Dg1 = oo16pi2*( betag11 + oo16pi2 * betag12 ) 

 
Else 
Dg1 = oo16pi2* betag11 
End If 
 
 
!-------------------- 
! g2 
!-------------------- 
 
betag21  = 0

 
 
If (TwoLoopRGE) Then 
betag22 = 0

 
Dg2 = oo16pi2*( betag21 + oo16pi2 * betag22 ) 

 
Else 
Dg2 = oo16pi2* betag21 
End If 
 
 
!-------------------- 
! g3 
!-------------------- 
 
betag31  = 0

 
 
If (TwoLoopRGE) Then 
betag32 = 0

 
Dg3 = oo16pi2*( betag31 + oo16pi2 * betag32 ) 

 
Else 
Dg3 = oo16pi2* betag31 
End If 
 
 
!-------------------- 
! Lam5 
!-------------------- 
 
betaLam51  = 0

 
 
If (TwoLoopRGE) Then 
betaLam52 = 0

 
DLam5 = oo16pi2*( betaLam51 + oo16pi2 * betaLam52 ) 

 
Else 
DLam5 = oo16pi2* betaLam51 
End If 
 
 
Call Chop(DLam5) 

!-------------------- 
! Lam1 
!-------------------- 
 
betaLam11  = 0

 
 
If (TwoLoopRGE) Then 
betaLam12 = 0

 
DLam1 = oo16pi2*( betaLam11 + oo16pi2 * betaLam12 ) 

 
Else 
DLam1 = oo16pi2* betaLam11 
End If 
 
 
Call Chop(DLam1) 

!-------------------- 
! Lam4 
!-------------------- 
 
betaLam41  = 0

 
 
If (TwoLoopRGE) Then 
betaLam42 = 0

 
DLam4 = oo16pi2*( betaLam41 + oo16pi2 * betaLam42 ) 

 
Else 
DLam4 = oo16pi2* betaLam41 
End If 
 
 
Call Chop(DLam4) 

!-------------------- 
! Lam3 
!-------------------- 
 
betaLam31  = 0

 
 
If (TwoLoopRGE) Then 
betaLam32 = 0

 
DLam3 = oo16pi2*( betaLam31 + oo16pi2 * betaLam32 ) 

 
Else 
DLam3 = oo16pi2* betaLam31 
End If 
 
 
Call Chop(DLam3) 

!-------------------- 
! Lam2 
!-------------------- 
 
betaLam21  = 0

 
 
If (TwoLoopRGE) Then 
betaLam22 = 0

 
DLam2 = oo16pi2*( betaLam21 + oo16pi2 * betaLam22 ) 

 
Else 
DLam2 = oo16pi2* betaLam21 
End If 
 
 
Call Chop(DLam2) 

!-------------------- 
! Yu 
!-------------------- 
 
betaYu1  = 0

 
 
If (TwoLoopRGE) Then 
betaYu2 = 0

 
DYu = oo16pi2*( betaYu1 + oo16pi2 * betaYu2 ) 

 
Else 
DYu = oo16pi2* betaYu1 
End If 
 
 
Call Chop(DYu) 

!-------------------- 
! Yd 
!-------------------- 
 
betaYd1  = 0

 
 
If (TwoLoopRGE) Then 
betaYd2 = 0

 
DYd = oo16pi2*( betaYd1 + oo16pi2 * betaYd2 ) 

 
Else 
DYd = oo16pi2* betaYd1 
End If 
 
 
Call Chop(DYd) 

!-------------------- 
! Ye 
!-------------------- 
 
betaYe1  = 0

 
 
If (TwoLoopRGE) Then 
betaYe2 = 0

 
DYe = oo16pi2*( betaYe1 + oo16pi2 * betaYe2 ) 

 
Else 
DYe = oo16pi2* betaYe1 
End If 
 
 
Call Chop(DYe) 

!-------------------- 
! M12 
!-------------------- 
 
betaM121  = 0

 
 
If (TwoLoopRGE) Then 
betaM122 = 0

 
DM12 = oo16pi2*( betaM121 + oo16pi2 * betaM122 ) 

 
Else 
DM12 = oo16pi2* betaM121 
End If 
 
 
Call Chop(DM12) 

!-------------------- 
! M112 
!-------------------- 
 
betaM1121  = 0

 
 
If (TwoLoopRGE) Then 
betaM1122 = 0

 
DM112 = oo16pi2*( betaM1121 + oo16pi2 * betaM1122 ) 

 
Else 
DM112 = oo16pi2* betaM1121 
End If 
 
 
Call Chop(DM112) 

!-------------------- 
! M222 
!-------------------- 
 
betaM2221  = 0

 
 
If (TwoLoopRGE) Then 
betaM2222 = 0

 
DM222 = oo16pi2*( betaM2221 + oo16pi2 * betaM2222 ) 

 
Else 
DM222 = oo16pi2* betaM2221 
End If 
 
 
Call Chop(DM222) 

Call ParametersToG73(Dg1,Dg2,Dg3,DLam5,DLam1,DLam4,DLam3,DLam2,DYu,DYd,               & 
& DYe,DM12,DM112,DM222,f)

Iname = Iname - 1 
 
End Subroutine rge73  

Subroutine GToParameters75(g,g1,g2,g3,Lam5,Lam1,Lam4,Lam3,Lam2,Yu,Yd,Ye,              & 
& M12,M112,M222,vd,vu)

Implicit None 
Real(dp), Intent(in) :: g(75) 
Real(dp),Intent(out) :: g1,g2,g3,vd,vu

Complex(dp),Intent(out) :: Lam5,Lam1,Lam4,Lam3,Lam2,Yu(3,3),Yd(3,3),Ye(3,3),M12,M112,M222

Integer i1, i2, i3, i4, SumI 
 
Iname = Iname +1 
NameOfUnit(Iname) = 'GToParameters75' 
 
g1= g(1) 
g2= g(2) 
g3= g(3) 
Lam5= Cmplx(g(4),g(5),dp) 
Lam1= Cmplx(g(6),g(7),dp) 
Lam4= Cmplx(g(8),g(9),dp) 
Lam3= Cmplx(g(10),g(11),dp) 
Lam2= Cmplx(g(12),g(13),dp) 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
Yu(i1,i2) = Cmplx( g(SumI+14), g(SumI+15), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
Yd(i1,i2) = Cmplx( g(SumI+32), g(SumI+33), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
Ye(i1,i2) = Cmplx( g(SumI+50), g(SumI+51), dp) 
End Do 
 End Do 
 
M12= Cmplx(g(68),g(69),dp) 
M112= Cmplx(g(70),g(71),dp) 
M222= Cmplx(g(72),g(73),dp) 
vd= g(74) 
vu= g(75) 
Do i1=1,75 
If (g(i1).ne.g(i1)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Write(*,*) "At position ", i1 
 Call TerminateProgram 
End if 
End do 
Iname = Iname - 1 
 
End Subroutine GToParameters75

Subroutine ParametersToG75(g1,g2,g3,Lam5,Lam1,Lam4,Lam3,Lam2,Yu,Yd,Ye,M12,            & 
& M112,M222,vd,vu,g)

Implicit None 
Real(dp), Intent(out) :: g(75) 
Real(dp), Intent(in) :: g1,g2,g3,vd,vu

Complex(dp), Intent(in) :: Lam5,Lam1,Lam4,Lam3,Lam2,Yu(3,3),Yd(3,3),Ye(3,3),M12,M112,M222

Integer i1, i2, i3, i4, SumI 
 
Iname = Iname +1 
NameOfUnit(Iname) = 'ParametersToG75' 
 
g(1) = g1  
g(2) = g2  
g(3) = g3  
g(4) = Real(Lam5,dp)  
g(5) = Aimag(Lam5)  
g(6) = Real(Lam1,dp)  
g(7) = Aimag(Lam1)  
g(8) = Real(Lam4,dp)  
g(9) = Aimag(Lam4)  
g(10) = Real(Lam3,dp)  
g(11) = Aimag(Lam3)  
g(12) = Real(Lam2,dp)  
g(13) = Aimag(Lam2)  
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+14) = Real(Yu(i1,i2), dp) 
g(SumI+15) = Aimag(Yu(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+32) = Real(Yd(i1,i2), dp) 
g(SumI+33) = Aimag(Yd(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+50) = Real(Ye(i1,i2), dp) 
g(SumI+51) = Aimag(Ye(i1,i2)) 
End Do 
End Do 

g(68) = Real(M12,dp)  
g(69) = Aimag(M12)  
g(70) = Real(M112,dp)  
g(71) = Aimag(M112)  
g(72) = Real(M222,dp)  
g(73) = Aimag(M222)  
g(74) = vd  
g(75) = vu  
Iname = Iname - 1 
 
End Subroutine ParametersToG75

Subroutine rge75(len, T, GY, F) 
Implicit None 
Integer, Intent(in) :: len 
Real(dp), Intent(in) :: T, GY(len) 
Real(dp), Intent(out) :: F(len) 
Integer :: i1,i2,i3,i4 
Integer :: j1,j2,j3,j4,j5,j6,j7 
Real(dp) :: q 
Real(dp) :: g1,betag11,betag12,Dg1,g2,betag21,betag22,Dg2,g3,betag31,betag32,         & 
& Dg3,vd,betavd1,betavd2,Dvd,vu,betavu1,betavu2,Dvu
Complex(dp) :: Lam5,betaLam51,betaLam52,DLam5,Lam1,betaLam11,betaLam12,               & 
& DLam1,Lam4,betaLam41,betaLam42,DLam4,Lam3,betaLam31,betaLam32,DLam3,Lam2,              & 
& betaLam21,betaLam22,DLam2,Yu(3,3),betaYu1(3,3),betaYu2(3,3),DYu(3,3),adjYu(3,3)        & 
& ,Yd(3,3),betaYd1(3,3),betaYd2(3,3),DYd(3,3),adjYd(3,3),Ye(3,3),betaYe1(3,3)            & 
& ,betaYe2(3,3),DYe(3,3),adjYe(3,3),M12,betaM121,betaM122,DM12,M112,betaM1121,           & 
& betaM1122,DM112,M222,betaM2221,betaM2222,DM222
Iname = Iname +1 
NameOfUnit(Iname) = 'rge75' 
 
OnlyDiagonal = .Not.GenerationMixing 
q = t 
 
Call GToParameters75(gy,g1,g2,g3,Lam5,Lam1,Lam4,Lam3,Lam2,Yu,Yd,Ye,M12,               & 
& M112,M222,vd,vu)

Call Adjungate(Yu,adjYu)
Call Adjungate(Yd,adjYd)
Call Adjungate(Ye,adjYe)


If (TwoLoopRGE) Then 
End If 
 
 
!-------------------- 
! g1 
!-------------------- 
 
betag11  = 0

 
 
If (TwoLoopRGE) Then 
betag12 = 0

 
Dg1 = oo16pi2*( betag11 + oo16pi2 * betag12 ) 

 
Else 
Dg1 = oo16pi2* betag11 
End If 
 
 
!-------------------- 
! g2 
!-------------------- 
 
betag21  = 0

 
 
If (TwoLoopRGE) Then 
betag22 = 0

 
Dg2 = oo16pi2*( betag21 + oo16pi2 * betag22 ) 

 
Else 
Dg2 = oo16pi2* betag21 
End If 
 
 
!-------------------- 
! g3 
!-------------------- 
 
betag31  = 0

 
 
If (TwoLoopRGE) Then 
betag32 = 0

 
Dg3 = oo16pi2*( betag31 + oo16pi2 * betag32 ) 

 
Else 
Dg3 = oo16pi2* betag31 
End If 
 
 
!-------------------- 
! Lam5 
!-------------------- 
 
betaLam51  = 0

 
 
If (TwoLoopRGE) Then 
betaLam52 = 0

 
DLam5 = oo16pi2*( betaLam51 + oo16pi2 * betaLam52 ) 

 
Else 
DLam5 = oo16pi2* betaLam51 
End If 
 
 
Call Chop(DLam5) 

!-------------------- 
! Lam1 
!-------------------- 
 
betaLam11  = 0

 
 
If (TwoLoopRGE) Then 
betaLam12 = 0

 
DLam1 = oo16pi2*( betaLam11 + oo16pi2 * betaLam12 ) 

 
Else 
DLam1 = oo16pi2* betaLam11 
End If 
 
 
Call Chop(DLam1) 

!-------------------- 
! Lam4 
!-------------------- 
 
betaLam41  = 0

 
 
If (TwoLoopRGE) Then 
betaLam42 = 0

 
DLam4 = oo16pi2*( betaLam41 + oo16pi2 * betaLam42 ) 

 
Else 
DLam4 = oo16pi2* betaLam41 
End If 
 
 
Call Chop(DLam4) 

!-------------------- 
! Lam3 
!-------------------- 
 
betaLam31  = 0

 
 
If (TwoLoopRGE) Then 
betaLam32 = 0

 
DLam3 = oo16pi2*( betaLam31 + oo16pi2 * betaLam32 ) 

 
Else 
DLam3 = oo16pi2* betaLam31 
End If 
 
 
Call Chop(DLam3) 

!-------------------- 
! Lam2 
!-------------------- 
 
betaLam21  = 0

 
 
If (TwoLoopRGE) Then 
betaLam22 = 0

 
DLam2 = oo16pi2*( betaLam21 + oo16pi2 * betaLam22 ) 

 
Else 
DLam2 = oo16pi2* betaLam21 
End If 
 
 
Call Chop(DLam2) 

!-------------------- 
! Yu 
!-------------------- 
 
betaYu1  = 0

 
 
If (TwoLoopRGE) Then 
betaYu2 = 0

 
DYu = oo16pi2*( betaYu1 + oo16pi2 * betaYu2 ) 

 
Else 
DYu = oo16pi2* betaYu1 
End If 
 
 
Call Chop(DYu) 

!-------------------- 
! Yd 
!-------------------- 
 
betaYd1  = 0

 
 
If (TwoLoopRGE) Then 
betaYd2 = 0

 
DYd = oo16pi2*( betaYd1 + oo16pi2 * betaYd2 ) 

 
Else 
DYd = oo16pi2* betaYd1 
End If 
 
 
Call Chop(DYd) 

!-------------------- 
! Ye 
!-------------------- 
 
betaYe1  = 0

 
 
If (TwoLoopRGE) Then 
betaYe2 = 0

 
DYe = oo16pi2*( betaYe1 + oo16pi2 * betaYe2 ) 

 
Else 
DYe = oo16pi2* betaYe1 
End If 
 
 
Call Chop(DYe) 

!-------------------- 
! M12 
!-------------------- 
 
betaM121  = 0

 
 
If (TwoLoopRGE) Then 
betaM122 = 0

 
DM12 = oo16pi2*( betaM121 + oo16pi2 * betaM122 ) 

 
Else 
DM12 = oo16pi2* betaM121 
End If 
 
 
Call Chop(DM12) 

!-------------------- 
! M112 
!-------------------- 
 
betaM1121  = 0

 
 
If (TwoLoopRGE) Then 
betaM1122 = 0

 
DM112 = oo16pi2*( betaM1121 + oo16pi2 * betaM1122 ) 

 
Else 
DM112 = oo16pi2* betaM1121 
End If 
 
 
Call Chop(DM112) 

!-------------------- 
! M222 
!-------------------- 
 
betaM2221  = 0

 
 
If (TwoLoopRGE) Then 
betaM2222 = 0

 
DM222 = oo16pi2*( betaM2221 + oo16pi2 * betaM2222 ) 

 
Else 
DM222 = oo16pi2* betaM2221 
End If 
 
 
Call Chop(DM222) 

!-------------------- 
! vd 
!-------------------- 
 
betavd1  = 0

 
 
If (TwoLoopRGE) Then 
betavd2 = 0

 
Dvd = oo16pi2*( betavd1 + oo16pi2 * betavd2 ) 

 
Else 
Dvd = oo16pi2* betavd1 
End If 
 
 
!-------------------- 
! vu 
!-------------------- 
 
betavu1  = 0

 
 
If (TwoLoopRGE) Then 
betavu2 = 0

 
Dvu = oo16pi2*( betavu1 + oo16pi2 * betavu2 ) 

 
Else 
Dvu = oo16pi2* betavu1 
End If 
 
 
Call ParametersToG75(Dg1,Dg2,Dg3,DLam5,DLam1,DLam4,DLam3,DLam2,DYu,DYd,               & 
& DYe,DM12,DM112,DM222,Dvd,Dvu,f)

Iname = Iname - 1 
 
End Subroutine rge75  

End Module RGEs_THDM 
 
