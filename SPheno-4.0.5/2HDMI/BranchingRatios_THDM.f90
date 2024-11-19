! -----------------------------------------------------------------------------  
! This file was automatically created by SARAH version 4.6.0 
! SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223  
! (c) Florian Staub, 2013  
! ------------------------------------------------------------------------------  
! File created at 18:49 on 18.11.2015   
! ----------------------------------------------------------------------  
 
 
Module BranchingRatios_THDM 
 
Use Control 
Use Couplings_THDM 
Use Model_Data_THDM 
Use LoopCouplings_THDM 
Use Fu3Decays_THDM 
Use Fe3Decays_THDM 
Use Fd3Decays_THDM 
Use SUSYDecays_THDM 
 
Contains 
 
Subroutine CalculateBR(CTBD,fac3,epsI,deltaM,kont,MAh,MAh2,MFd,MFd2,MFe,              & 
& MFe2,MFu,MFu2,Mhh,Mhh2,MHm,MHm2,MVWm,MVWm2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,v,ZDL,              & 
& ZEL,ZUL,ZA,ZH,ZP,ZW,ZZ,alphaH,betaH,vd,vu,g1,g2,g3,Lam5,Lam1,Lam4,Lam3,Lam2,           & 
& Yu,Yd,Ye,M12,M112,M222,gPFu,gTFu,BRFu,gPFe,gTFe,BRFe,gPFd,gTFd,BRFd,gPhh,              & 
& gThh,BRhh,gPAh,gTAh,BRAh,gPHm,gTHm,BRHm)

Real(dp), Intent(in) :: epsI, deltaM, fac3 
Integer, Intent(inout) :: kont 
Logical, Intent(in) :: CTBD 
Real(dp),Intent(in) :: g1,g2,g3

Complex(dp),Intent(in) :: Lam5,Lam1,Lam4,Lam3,Lam2,Yu(3,3),Yd(3,3),Ye(3,3),M12,M112,M222

Real(dp),Intent(in) :: MAh(2),MAh2(2),MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),Mhh(2),Mhh2(2),           & 
& MHm(2),MHm2(2),MVWm,MVWm2,MVZ,MVZ2,TW,v,ZA(2,2),ZH(2,2),ZP(2,2),ZZ(2,2),               & 
& alphaH,betaH

Complex(dp),Intent(in) :: ZDR(3,3),ZER(3,3),ZUR(3,3),ZDL(3,3),ZEL(3,3),ZUL(3,3),ZW(2,2)

Real(dp),Intent(in) :: vd,vu

Real(dp),Intent(inout) :: gPFu(3,153),gTFu(3),BRFu(3,153),gPFe(3,150),gTFe(3),BRFe(3,150),gPFd(3,153),          & 
& gTFd(3),BRFd(3,153),gPhh(2,42),gThh(2),BRhh(2,42),gPAh(2,39),gTAh(2),BRAh(2,39),       & 
& gPHm(2,26),gTHm(2),BRHm(2,26)

Complex(dp) :: cplHiggsPP(2),cplHiggsGG(2),cplPseudoHiggsPP(2),cplPseudoHiggsGG(2),cplHiggsZZvirt(2),& 
& cplHiggsWWvirt(2)

Real(dp) :: gFuFucFdFd(3,3,3,3),gFuFucFeFe(3,3,3,3),gFuFucFuFu(3,3,3,3),gFuFdcFeFv(3,3,3,3),      & 
& gFuFucFvFv(3,3,3,3),gFeFecFdFd(3,3,3,3),gFeFecFeFe(3,3,3,3),gFeFecFuFu(3,3,3,3),       & 
& gFeFecFvFv(3,3,3,3),gFeFvcFuFd(3,3,3,3),gFdFdcFdFd(3,3,3,3),gFdFdcFeFe(3,3,3,3),       & 
& gFdFdcFuFu(3,3,3,3),gFdFdcFvFv(3,3,3,3),gFdFucFvFe(3,3,3,3)

Complex(dp) :: coup 
Real(dp) :: vev 
Real(dp) :: gTVZ,gTVWm

Iname = Iname + 1 
NameOfUnit(Iname) = 'CalculateBR'
 
Write(*,*) "Calculating branching ratios and decay widths" 
gTVWm = gamW 
gTVZ = gamZ 
gPFu = 0._dp 
gTFu = 0._dp 
BRFu = 0._dp 
If (.Not.CTBD) Then 
Call FuTwoBodyDecay(-1,DeltaM,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,Mhh,Mhh2,           & 
& MHm,MHm2,MVWm,MVWm2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,v,ZDL,ZEL,ZUL,ZA,ZH,ZP,ZW,ZZ,              & 
& alphaH,betaH,g1,g2,g3,Lam5,Lam1,Lam4,Lam3,Lam2,Yu,Yd,Ye,M12,M112,M222,vd,              & 
& vu,gPFu(:,1:18),gTFu,BRFu(:,1:18))

If (Enable3BDecaysF) Then 
If (MaxVal(gTFu).Lt.MaxVal(fac3*Abs(MFu))) Then 
Call FuThreeBodyDecay(-1,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,Mhh,Mhh2,MHm,            & 
& MHm2,MVWm,MVWm2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,v,ZDL,ZEL,ZUL,ZA,ZH,ZP,ZW,ZZ,alphaH,           & 
& betaH,g1,g2,g3,Lam5,Lam1,Lam4,Lam3,Lam2,Yu,Yd,Ye,M12,M112,M222,vd,vu,gTAh,             & 
& gThh,gTHm,gTVWm,gTVZ,gFuFucFdFd,gFuFucFeFe,gFuFucFuFu,gFuFdcFeFv,gFuFucFvFv,           & 
& epsI,deltaM,.False.,gTFu,gPFu(:,19:153),BRFu(:,19:153))

Else 
Call FuThreeBodyDecay(-1,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,Mhh,Mhh2,MHm,            & 
& MHm2,MVWm,MVWm2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,v,ZDL,ZEL,ZUL,ZA,ZH,ZP,ZW,ZZ,alphaH,           & 
& betaH,g1,g2,g3,Lam5,Lam1,Lam4,Lam3,Lam2,Yu,Yd,Ye,M12,M112,M222,vd,vu,gTAh,             & 
& gThh,gTHm,gTVWm,gTVZ,gFuFucFdFd,gFuFucFeFe,gFuFucFuFu,gFuFdcFeFv,gFuFucFvFv,           & 
& epsI,deltaM,.True.,gTFu,gPFu(:,19:153),BRFu(:,19:153))

End If 
 
End If 
Else 
Call FuThreeBodyDecay(-1,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,Mhh,Mhh2,MHm,            & 
& MHm2,MVWm,MVWm2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,v,ZDL,ZEL,ZUL,ZA,ZH,ZP,ZW,ZZ,alphaH,           & 
& betaH,g1,g2,g3,Lam5,Lam1,Lam4,Lam3,Lam2,Yu,Yd,Ye,M12,M112,M222,vd,vu,gTAh,             & 
& gThh,gTHm,gTVWm,gTVZ,gFuFucFdFd,gFuFucFeFe,gFuFucFuFu,gFuFdcFeFv,gFuFucFvFv,           & 
& epsI,deltaM,.False.,gTFu,gPFu(:,19:153),BRFu(:,19:153))

End If 
Do i1=1,3
gTFu(i1) =Sum(gPFu(i1,:)) 
If (gTFu(i1).Gt.0._dp) BRFu(i1,: ) =gPFu(i1,:)/gTFu(i1) 
End Do 
 

gPFe = 0._dp 
gTFe = 0._dp 
BRFe = 0._dp 
If (.Not.CTBD) Then 
Call FeTwoBodyDecay(-1,DeltaM,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,Mhh,Mhh2,           & 
& MHm,MHm2,MVWm,MVWm2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,v,ZDL,ZEL,ZUL,ZA,ZH,ZP,ZW,ZZ,              & 
& alphaH,betaH,g1,g2,g3,Lam5,Lam1,Lam4,Lam3,Lam2,Yu,Yd,Ye,M12,M112,M222,vd,              & 
& vu,gPFe(:,1:15),gTFe,BRFe(:,1:15))

If (Enable3BDecaysF) Then 
If (MaxVal(gTFe).Lt.MaxVal(fac3*Abs(MFe))) Then 
Call FeThreeBodyDecay(-1,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,Mhh,Mhh2,MHm,            & 
& MHm2,MVWm,MVWm2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,v,ZDL,ZEL,ZUL,ZA,ZH,ZP,ZW,ZZ,alphaH,           & 
& betaH,g1,g2,g3,Lam5,Lam1,Lam4,Lam3,Lam2,Yu,Yd,Ye,M12,M112,M222,vd,vu,gTAh,             & 
& gThh,gTHm,gTVWm,gTVZ,gFeFecFdFd,gFeFecFeFe,gFeFecFuFu,gFeFecFvFv,gFeFvcFuFd,           & 
& epsI,deltaM,.False.,gTFe,gPFe(:,16:150),BRFe(:,16:150))

Else 
Call FeThreeBodyDecay(-1,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,Mhh,Mhh2,MHm,            & 
& MHm2,MVWm,MVWm2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,v,ZDL,ZEL,ZUL,ZA,ZH,ZP,ZW,ZZ,alphaH,           & 
& betaH,g1,g2,g3,Lam5,Lam1,Lam4,Lam3,Lam2,Yu,Yd,Ye,M12,M112,M222,vd,vu,gTAh,             & 
& gThh,gTHm,gTVWm,gTVZ,gFeFecFdFd,gFeFecFeFe,gFeFecFuFu,gFeFecFvFv,gFeFvcFuFd,           & 
& epsI,deltaM,.True.,gTFe,gPFe(:,16:150),BRFe(:,16:150))

End If 
 
End If 
Else 
Call FeThreeBodyDecay(-1,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,Mhh,Mhh2,MHm,            & 
& MHm2,MVWm,MVWm2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,v,ZDL,ZEL,ZUL,ZA,ZH,ZP,ZW,ZZ,alphaH,           & 
& betaH,g1,g2,g3,Lam5,Lam1,Lam4,Lam3,Lam2,Yu,Yd,Ye,M12,M112,M222,vd,vu,gTAh,             & 
& gThh,gTHm,gTVWm,gTVZ,gFeFecFdFd,gFeFecFeFe,gFeFecFuFu,gFeFecFvFv,gFeFvcFuFd,           & 
& epsI,deltaM,.False.,gTFe,gPFe(:,16:150),BRFe(:,16:150))

End If 
Do i1=1,3
gTFe(i1) =Sum(gPFe(i1,:)) 
If (gTFe(i1).Gt.0._dp) BRFe(i1,: ) =gPFe(i1,:)/gTFe(i1) 
End Do 
 

gPFd = 0._dp 
gTFd = 0._dp 
BRFd = 0._dp 
If (.Not.CTBD) Then 
Call FdTwoBodyDecay(-1,DeltaM,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,Mhh,Mhh2,           & 
& MHm,MHm2,MVWm,MVWm2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,v,ZDL,ZEL,ZUL,ZA,ZH,ZP,ZW,ZZ,              & 
& alphaH,betaH,g1,g2,g3,Lam5,Lam1,Lam4,Lam3,Lam2,Yu,Yd,Ye,M12,M112,M222,vd,              & 
& vu,gPFd(:,1:18),gTFd,BRFd(:,1:18))

If (Enable3BDecaysF) Then 
If (MaxVal(gTFd).Lt.MaxVal(fac3*Abs(MFd))) Then 
Call FdThreeBodyDecay(-1,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,Mhh,Mhh2,MHm,            & 
& MHm2,MVWm,MVWm2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,v,ZDL,ZEL,ZUL,ZA,ZH,ZP,ZW,ZZ,alphaH,           & 
& betaH,g1,g2,g3,Lam5,Lam1,Lam4,Lam3,Lam2,Yu,Yd,Ye,M12,M112,M222,vd,vu,gTAh,             & 
& gThh,gTHm,gTVWm,gTVZ,gFdFdcFdFd,gFdFdcFeFe,gFdFdcFuFu,gFdFdcFvFv,gFdFucFvFe,           & 
& epsI,deltaM,.False.,gTFd,gPFd(:,19:153),BRFd(:,19:153))

Else 
Call FdThreeBodyDecay(-1,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,Mhh,Mhh2,MHm,            & 
& MHm2,MVWm,MVWm2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,v,ZDL,ZEL,ZUL,ZA,ZH,ZP,ZW,ZZ,alphaH,           & 
& betaH,g1,g2,g3,Lam5,Lam1,Lam4,Lam3,Lam2,Yu,Yd,Ye,M12,M112,M222,vd,vu,gTAh,             & 
& gThh,gTHm,gTVWm,gTVZ,gFdFdcFdFd,gFdFdcFeFe,gFdFdcFuFu,gFdFdcFvFv,gFdFucFvFe,           & 
& epsI,deltaM,.True.,gTFd,gPFd(:,19:153),BRFd(:,19:153))

End If 
 
End If 
Else 
Call FdThreeBodyDecay(-1,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,Mhh,Mhh2,MHm,            & 
& MHm2,MVWm,MVWm2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,v,ZDL,ZEL,ZUL,ZA,ZH,ZP,ZW,ZZ,alphaH,           & 
& betaH,g1,g2,g3,Lam5,Lam1,Lam4,Lam3,Lam2,Yu,Yd,Ye,M12,M112,M222,vd,vu,gTAh,             & 
& gThh,gTHm,gTVWm,gTVZ,gFdFdcFdFd,gFdFdcFeFe,gFdFdcFuFu,gFdFdcFvFv,gFdFucFvFe,           & 
& epsI,deltaM,.False.,gTFd,gPFd(:,19:153),BRFd(:,19:153))

End If 
Do i1=1,3
gTFd(i1) =Sum(gPFd(i1,:)) 
If (gTFd(i1).Gt.0._dp) BRFd(i1,: ) =gPFd(i1,:)/gTFd(i1) 
End Do 
 

gPhh = 0._dp 
gThh = 0._dp 
BRhh = 0._dp 
Call hhTwoBodyDecay(-1,DeltaM,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,Mhh,Mhh2,           & 
& MHm,MHm2,MVWm,MVWm2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,v,ZDL,ZEL,ZUL,ZA,ZH,ZP,ZW,ZZ,              & 
& alphaH,betaH,g1,g2,g3,Lam5,Lam1,Lam4,Lam3,Lam2,Yu,Yd,Ye,M12,M112,M222,vd,              & 
& vu,gPhh,gThh,BRhh)

gPAh = 0._dp 
gTAh = 0._dp 
BRAh = 0._dp 
Call AhTwoBodyDecay(-1,DeltaM,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,Mhh,Mhh2,           & 
& MHm,MHm2,MVWm,MVWm2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,v,ZDL,ZEL,ZUL,ZA,ZH,ZP,ZW,ZZ,              & 
& alphaH,betaH,g1,g2,g3,Lam5,Lam1,Lam4,Lam3,Lam2,Yu,Yd,Ye,M12,M112,M222,vd,              & 
& vu,gPAh,gTAh,BRAh)

! Set Goldstone Widhts 
gTAh(1)=gTVZ


gPHm = 0._dp 
gTHm = 0._dp 
BRHm = 0._dp 
Call HmTwoBodyDecay(-1,DeltaM,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,Mhh,Mhh2,           & 
& MHm,MHm2,MVWm,MVWm2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,v,ZDL,ZEL,ZUL,ZA,ZH,ZP,ZW,ZZ,              & 
& alphaH,betaH,g1,g2,g3,Lam5,Lam1,Lam4,Lam3,Lam2,Yu,Yd,Ye,M12,M112,M222,vd,              & 
& vu,gPHm,gTHm,BRHm)

! Set Goldstone Widhts 
gTHm(1)=gTVWm


Iname = Iname - 1 
 
End Subroutine CalculateBR 
End Module BranchingRatios_THDM 
 