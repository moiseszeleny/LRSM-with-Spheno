(* ::Package:: *)

OnlyLowEnergySPheno = True;

MINPAR={{1, vRinput},
        {2, lam1input},
        {3, lam2input},
        {4, lam3input},
        {5, lam4input},
        {6, lam5input},
        {7, lam6input},
        {8, rho1input},
        {9, rho2input},
        {10, alp1input},
        {11, alp2input},
        {12, alp3input}
        };

RealParameters = {
    vRinput, lam1input, lam2input, lam3input,
    lam4input, lam5input, lam6input,
    rho1input, rho2input, alp1input, 
    alp2input, alp3input
};

ParametersToSolveTadpoles = {mu12,mu22};

BoundaryLowScaleInput={
    {g3, g3SM},
    {g2, g2SM},
    {gR, g2},
    {gBL, (g1SM*gR)/Sqrt[-g1SM^2 + gR^2]},
    {vR, vRinput},
    {k1, vSM}
};

DEFINITION[MatchingConditions]={
    {g2, g2SM},
    {g3, g3SM},
    {gBL, g1SM*Sin[ThetaW]/Sqrt[Cos[2*ThetaW]]},
    {k1, vSM},
    {Yt, YeSM},
    (*{YQ2, Conjg[(Transpose[YdSM]*k1*vSM)/k1^2]},
    {YQ1, Conjg[(-(MatMul[Transpose[YuSM],Conjg[CKMR]])*vSM*k1)/(-k1^2)]}*)
    {YQ2, YdSM},
    {YQ1, YuSM}
};

QuadruplePrecision = {Fv};

ListDecayParticles = {Fu,Fe,Fd,hh,Fv,VZ,VZR,Hpm,Ah,VWLm,VWRm};
ListDecayParticles3B = {{Fu,"Fu.f90"},{Fe,"Fe.f90"},{Fd,"Fd.f90"},{Fv,"Fv.f90"}};
