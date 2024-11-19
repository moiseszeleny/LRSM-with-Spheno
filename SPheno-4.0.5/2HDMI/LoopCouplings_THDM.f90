! -----------------------------------------------------------------------------  
! This file was automatically created by SARAH version 4.6.0 
! SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223  
! (c) Florian Staub, 2013  
! ------------------------------------------------------------------------------  
! File created at 18:48 on 18.11.2015   
! ----------------------------------------------------------------------  
 
 
Module LoopCouplings_THDM 
 
Use Control 
Use Couplings_THDM 
Use Mathematics 
Use LoopFunctions 
Use StandardModel 
 
 Contains 
 
Subroutine CoupHiggsToPhoton(mHiggs,inG,ratFd,ratFe,ratFu,ratHm,ratVWm,               & 
& MFd,MFe,MFu,MHm,MVWm,rq,rsq,coup)

Implicit None 
Complex(dp),Intent(in) :: ratFd(3),ratFe(3),ratFu(3),ratHm(2),ratVWm

Real(dp),Intent(in) :: MFd(3),MFe(3),MFu(3),MHm(2),MVWm

Integer, Intent(in) :: inG 
Real(dp), Intent(in) :: mHiggs, rq, rsq 
Complex(dp), Intent(out) :: coup 
Integer :: i1 
Real(dp) :: Mh2p 
mH2p = 0.25_dp*mHiggs**2 
coup = 0._dp 
 
coup = coup + 1._dp*1*(-1)**2*ratVWm*A_one(mH2p/MVWm**2)
HPPloopVWm(inG) = HPPloopVWm(inG) + 1._dp*1*(-1)**2*ratVWm*A_one(mH2p/MVWm**2)
Do i1 = 2 , 2
coup = coup + 1._dp*1*(-1)**2*ratHm(i1)*A_zero(mH2p/MHm(i1)**2)
HPPloopHm(i1,inG) = HPPloopHm(i1,inG) + 1._dp*1*(-1)**2*ratHm(i1)*A_zero(mH2p/MHm(i1)**2)
End Do 
Do i1 = 1 , 3
If (MFd(i1).gt.mHiggs) Then 
coup = coup + rq*3*(-1._dp/3._dp)**2*ratFd(i1)*A_onehalf(mH2p/MFd(i1)**2)
HPPloopFd(i1,inG) = HPPloopFd(i1,inG) + rq*3*(-1._dp/3._dp)**2*ratFd(i1)*A_onehalf(mH2p/MFd(i1)**2)
Else 
coup = coup + 3*(-1._dp/3._dp)**2*ratFd(i1)*A_onehalf(mH2p/MFd(i1)**2)
HPPloopFd(i1,inG) = HPPloopFd(i1,inG) + 3*(-1._dp/3._dp)**2*ratFd(i1)*A_onehalf(mH2p/MFd(i1)**2)
End if 
End Do 
Do i1 = 1 , 3
If (MFu(i1).gt.mHiggs) Then 
coup = coup + rq*3*(2._dp/3._dp)**2*ratFu(i1)*A_onehalf(mH2p/MFu(i1)**2)
HPPloopFu(i1,inG) = HPPloopFu(i1,inG) + rq*3*(2._dp/3._dp)**2*ratFu(i1)*A_onehalf(mH2p/MFu(i1)**2)
Else 
coup = coup + 3*(2._dp/3._dp)**2*ratFu(i1)*A_onehalf(mH2p/MFu(i1)**2)
HPPloopFu(i1,inG) = HPPloopFu(i1,inG) + 3*(2._dp/3._dp)**2*ratFu(i1)*A_onehalf(mH2p/MFu(i1)**2)
End if 
End Do 
Do i1 = 1 , 3
coup = coup + 1._dp*1*(-1)**2*ratFe(i1)*A_onehalf(mH2p/MFe(i1)**2)
HPPloopFe(i1,inG) = HPPloopFe(i1,inG) + 1._dp*1*(-1)**2*ratFe(i1)*A_onehalf(mH2p/MFe(i1)**2)
End Do 
End Subroutine CoupHiggsToPhoton

Subroutine CoupHiggsToGluon(mHiggs,inG,ratFd,ratFu,MFd,MFu,rq,rsq,coup)

Implicit None 
Complex(dp),Intent(in) :: ratFd(3),ratFu(3)

Real(dp),Intent(in) :: MFd(3),MFu(3)

Integer, Intent(in) :: inG 
Real(dp), Intent(in) :: mHiggs, rq, rsq 
Complex(dp), Intent(out) :: coup 
Integer :: i1 
Real(dp) :: Mh2p 
mH2p = 0.25_dp*mHiggs**2 
coup = 0._dp 
 
Do i1 = 1 , 3
coup = coup + rq*1*ratFd(i1)*A_onehalf(mH2p/MFd(i1)**2)
End Do 
Do i1 = 1 , 3
coup = coup + rq*1*ratFu(i1)*A_onehalf(mH2p/MFu(i1)**2)
End Do 
coup = 0.75_dp*coup 
End Subroutine CoupHiggsToGluon

Subroutine CoupHiggsToPhotonSM(mHiggs,MFd,MFe,MFu,MHm,MVWm,rq,coup)

Implicit None 
Real(dp),Intent(in) :: MFd(3),MFe(3),MFu(3),MHm(2),MVWm

Real(dp), Intent(in) :: mHiggs, rq 
Complex(dp), Intent(out) :: coup 
Integer :: i1 
Real(dp) :: Mh2p 
mH2p = 0.25_dp*mHiggs**2 
coup = 0._dp 
 
coup = coup + 1._dp*1*(-1)**2*A_one(mH2p/MVWm**2)
Do i1 =1, 3 
If (MFd(i1).gt.mHiggs) Then 
coup = coup + rq*3*(-1._dp/3._dp)**2*A_onehalf(mH2p/MFd(i1)**2)
Else 
coup = coup + 3*(-1._dp/3._dp)**2*A_onehalf(mH2p/MFd(i1)**2)
End if 
End Do 
Do i1 =1, 3 
If (MFu(i1).gt.mHiggs) Then 
coup = coup + rq*3*(2._dp/3._dp)**2*A_onehalf(mH2p/MFu(i1)**2)
Else 
coup = coup + 3*(2._dp/3._dp)**2*A_onehalf(mH2p/MFu(i1)**2)
End if 
End Do 
Do i1 =1, 3 
coup = coup + 1._dp*1*(-1)**2*A_onehalf(mH2p/MFe(i1)**2)
End Do 
End Subroutine CoupHiggsToPhotonSM 

Subroutine CoupHiggsToGluonSM(mHiggs,MFd,MFu,rq,coup)

Implicit None 
Real(dp),Intent(in) :: MFd(3),MFu(3)

Real(dp), Intent(in) :: mHiggs, rq 
Complex(dp), Intent(out) :: coup 
Integer :: i1 
Real(dp) :: Mh2p 
mH2p = 0.25_dp*mHiggs**2 
coup = 0._dp 
 
Do i1 =1, 3 
coup = coup + rq*1*A_onehalf(mH2p/MFd(i1)**2)
End Do 
Do i1 =1, 3 
coup = coup + rq*1*A_onehalf(mH2p/MFu(i1)**2)
End Do 
coup = 0.75_dp*coup 
End Subroutine CoupHiggsToGluonSM 

Subroutine CoupPseudoHiggsToPhoton(mHiggs,inG,ratFd,ratFe,ratFu,ratHm,ratVWm,         & 
& MFd,MFe,MFu,MHm,MVWm,coup)

Implicit None 
Complex(dp),Intent(in) :: ratFd(3),ratFe(3),ratFu(3),ratHm(2),ratVWm

Real(dp),Intent(in) :: MFd(3),MFe(3),MFu(3),MHm(2),MVWm

Real(dp), Intent(in) :: mHiggs 
Complex(dp), Intent(out) :: coup 
Integer :: i1 
Integer, Intent(in) :: inG 
Real(dp) :: Mh2p 
mH2p = 0.25_dp*mHiggs**2 
coup = 0._dp 
 
Do i1 =1, 3
coup = coup + 3*(-1._dp/3._dp)**2*ratFd(i1)*AP_onehalf(mH2p/MFd(i1)**2)
End Do 
Do i1 =1, 3
coup = coup + 3*(2._dp/3._dp)**2*ratFu(i1)*AP_onehalf(mH2p/MFu(i1)**2)
End Do 
Do i1 =1, 3
coup = coup + 1*(-1)**2*ratFe(i1)*AP_onehalf(mH2p/MFe(i1)**2)
End Do 
End Subroutine CoupPseudoHiggsToPhoton

Subroutine CoupPseudoHiggsToGluon(mHiggs,inG,ratFd,ratFu,MFd,MFu,coup)

Implicit None 
Complex(dp),Intent(in) :: ratFd(3),ratFu(3)

Real(dp),Intent(in) :: MFd(3),MFu(3)

Real(dp), Intent(in) :: mHiggs 
Complex(dp), Intent(out) :: coup 
Integer :: i1 
Integer, Intent(in) :: inG 
Real(dp) :: Mh2p 
mH2p = 0.25_dp*mHiggs**2 
coup = 0._dp 
 
Do i1 =1, 3
coup = coup + 1*ratFd(i1)*AP_onehalf(mH2p/MFd(i1)**2)
End Do 
Do i1 =1, 3
coup = coup + 1*ratFu(i1)*AP_onehalf(mH2p/MFu(i1)**2)
End Do 
End Subroutine CoupPseudoHiggsToGluon

Subroutine CoupPseudoHiggsToPhotonSM(mHiggs,MFd,MFe,MFu,MHm,MVWm,coup)

Implicit None 
Real(dp),Intent(in) :: MFd(3),MFe(3),MFu(3),MHm(2),MVWm

Real(dp), Intent(in) :: mHiggs 
Complex(dp), Intent(out) :: coup 
Integer :: i1 
Real(dp) :: Mh2p 
mH2p = 0.25_dp*mHiggs**2 
coup = 0._dp 
 
Do i1 =1, 3
coup = coup + 3*(-1._dp/3._dp)**2**AP_onehalf(mH2p/MFd(i1)**2)
End Do 
Do i1 =1, 3
coup = coup + 3*(2._dp/3._dp)**2**AP_onehalf(mH2p/MFu(i1)**2)
End Do 
Do i1 =1, 3
coup = coup + 1*(-1)**2**AP_onehalf(mH2p/MFe(i1)**2)
End Do 
End Subroutine CoupPseudoHiggsToPhotonSM 

Subroutine CoupPseudoHiggsToGluonSM(mHiggs,MFd,MFu,coup)

Implicit None 
Real(dp),Intent(in) :: MFd(3),MFu(3)

Real(dp), Intent(in) :: mHiggs 
Complex(dp), Intent(out) :: coup 
Integer :: i1 
Real(dp) :: Mh2p 
mH2p = 0.25_dp*mHiggs**2 
coup = 0._dp 
 
Do i1 =1, 3
coup = coup + 1*AP_onehalf(mH2p/MFd(i1)**2)
End Do 
Do i1 =1, 3
coup = coup + 1*AP_onehalf(mH2p/MFu(i1)**2)
End Do 
End Subroutine CoupPseudoHiggsToGluonSM 

End Module LoopCouplings_THDM 
 
