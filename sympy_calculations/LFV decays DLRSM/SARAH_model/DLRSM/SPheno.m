(* ::Package:: *)

OnlyLowEnergySPheno = True;

MINPAR={{1, vRinput},
        {2, vLinput},
        (*{3, TanBeta},*)
        {4, k1input},
        {5, k2input},
        {6, lam1input},
        {7, lam2input},
        {8, lam3input},
        {9, lam4input},
        {10, lam5input},
        {11, lam6input},
        {14, rho1input},
        {15, rho2input},
        {16, alp1input},
        {17, alp2input},
        {18, alp3input},
        {111, MD11},
        {112, MD12},
        {113, MD13},
        {121, MD21},
        {122, MD22},
        {123, MD23},
        {131, MD31},
        {132, MD32},
        {133, MD33}
        };

RealParameters = {(*TanBeta,*)vRinput,vLinput, k1input, k2input};

ParametersToSolveTadpoles = {mu12,mu22};

AdditionalVariablesSPheno = {MD[3,3]};

BoundaryLowScaleInput={
    {g3, g3SM},
    {g2, g2SM},
    {gR, g2},
    {gBL, (g1SM*gR)/Sqrt[-g1SM^2 + gR^2]},
    {MD[1,1], MD11},
    {MD[1,2], MD12},
    {MD[1,3], MD13},
    {MD[2,1], MD21},
    {MD[2,2], MD22},
    {MD[2,3], MD23},
    {MD[3,1], MD31},
    {MD[3,2], MD32},
    {MD[3,3], MD33},
    {vR, vRinput},
    {vL, vLinput},
    {k1, Sqrt[vSM^2- 2 vL^2]*Cos[ArcTan[TanBeta]]},   
    {k2, Sqrt[vSM^2-2 vL^2]*Sin[ArcTan[TanBeta]]},
    {YQ2, -Conjg[(Transpose[YdSM]*vHd*vSM - (Matmul[Transpose[YuSM],Conjg[CKM]])*vSM*vHu)/(vHu^2-vHd^2)]},
    {YQ1, Conjg[(-(MatMul[Transpose[YuSM],Conjg[CKM]])*vSM*vHd + Transpose[YdSM]*vHu*vSM)/(vHu^2-vHd^2)]}, 
    {YL2, Conjg[(Sqrt[2]*vHu*MD - vSM*vHd*Transpose[YeSM])/(vHu^2-vHd^2)]},  
    {YL1, Conjg[(-Sqrt[2]*vHd*MD + vSM*vHu*Transpose[YeSM])/(vHu^2-vHd^2)]}
};

QuadruplePrecision = {Fv};

ListDecayParticles = {Fu,Fe,Fd,hh,Fv,VZ,VZR,Hpm,Ah,VWLm,VWRm};
ListDecayParticles3B = {{Fu,"Fu.f90"},{Fe,"Fe.f90"},{Fd,"Fd.f90"},{Fv,"Fv.f90"}};
