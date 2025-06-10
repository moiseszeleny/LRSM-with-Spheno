(* ::Package:: *)

OnlyLowEnergySPheno = True;

MINPAR={{1, vRinput},
        (*{2, vLinput},*)
        (*{3, TanBeta},*)
        (*{4, k1input},*)
        (*{5, k2input},*)
        {2, lam1input},
        {3, lam2input},
        {4, lam3input},
        {5, lam4input},
        {6, lam5input},
        {7, lam6input},
        {8, rho1input},
        {9, rho2input},
        {10, alp1input},
        {11, alp2input}
        {12, alp3input},
        (*{111, MD11},
        {112, MD12},
        {113, MD13},
        {121, MD21},
        {122, MD22},
        {123, MD23},
        {131, MD31},
        {132, MD32},
        {133, MD33}*)
        };

RealParameters = {
    (*TanBeta,*)vRinput (*,vLinput, k1input, k2input*),
    lam1input, lam2input, lam3input, lam4input, lam5input, lam6input,
    rho1input, rho2input, alp1input, alp2input, alp3input
};

ParametersToSolveTadpoles = {mu12,mu22};

(*AdditionalVariablesSPheno = {MD[3,3]};*)

BoundaryLowScaleInput={
    {g3, g3SM},
    {g2, g2SM},
    {gR, g2},
    {gBL, (g1SM*gR)/Sqrt[-g1SM^2 + gR^2]},
    (*{MD[1,1], MD11},
    {MD[1,2], MD12},
    {MD[1,3], MD13},
    {MD[2,1], MD21},
    {MD[2,2], MD22},
    {MD[2,3], MD23},
    {MD[3,1], MD31},
    {MD[3,2], MD32},
    {MD[3,3], MD33},*)
    {vR, vRinput},
    (*{vL, vLinput},*)
    {vL, 0},
    {k1, vSM}, 
    {k2, 0}
    (*{k1, Sqrt[vSM^2- 2 vL^2]*Cos[ArcTan[TanBeta]]}, *)  
    (*{k2, Sqrt[vSM^2-2 vL^2]*Sin[ArcTan[TanBeta]]},*)
    (*{YQ2, -Conjg[(Transpose[YdSM]*k1*vSM - (MatMul[Transpose[YuSM],Conjg[CKM]])*vSM*k2)/(k2^2-k1^2)]},
    {YQ1, Conjg[(-(MatMul[Transpose[YuSM],Conjg[CKM]])*vSM*k1 + Transpose[YdSM]*k2*vSM)/(k2^2-k1^2)]}, 
    {Yt, Conjg[(Sqrt[2]*k2*MD - vSM*k1*Transpose[YeSM])/(k2^2-k1^2)]},  
    {Y, Conjg[(-Sqrt[2]*k1*MD + vSM*k2*Transpose[YeSM])/(k2^2-k1^2)]}*)
};

QuadruplePrecision = {Fv};

ListDecayParticles = {Fu,Fe,Fd,hh,Fv,VZ,VZR,Hpm,Ah,VWLm,VWRm};
ListDecayParticles3B = {{Fu,"Fu.f90"},{Fe,"Fe.f90"},{Fd,"Fd.f90"},{Fv,"Fv.f90"}};
