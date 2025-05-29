(* ::Package:: *)

Off[General::spell]

Model`Name = "LRSM";
Model`NameLaTeX ="Left-Right Symmetric Model";
Model`Authors = "C. Bonilla & M.E. Krauss, 1611.07025";
Model`Date = "2016-03-14";




(*-------------------------------------------*)
(*   Particle Content*)
(*-------------------------------------------*)

(* Gauge Groups *)

Gauge[[1]]={B,   U[1], bminl,       gBL,False};
Gauge[[2]]={WL, SU[2], left,        g2,True};
Gauge[[3]]={WR, SU[2], right,       gR,True};
Gauge[[4]]={G,  SU[3], color,       g3,False};


(* Matter Fields: Using Q=T3L+T3R+QBL)*)

FermionFields[[1]] = {QLbar, 3, {conj[uL], conj[dL]},     -1/6, -2, 1,  -3};  
FermionFields[[2]] = {LLbar, 3, {conj[nuL], conj[eL]},    1/2, -2, 1,  1};
FermionFields[[3]] = {QR,  3, {uR,  dR},    1/6, 1, 2, 3};
FermionFields[[4]] = {LR,  3, {nuR, eR},     -1/2, 1,  2, 1};


ScalarFields[[1]]  = {Phi, 1, {{H0, Hp},{Hm, HPrime0}},      0,  2,  -2, 1}; 
ScalarFields[[2]]  = {deltaR,1, {{deltaRp/Sqrt[2],deltaRpp},
                                  {deltaR0, - deltaRp/Sqrt[2]}}, 1, 1, 3, 1};
ScalarFields[[3]]  = {deltaL,1, {{deltaLp/Sqrt[2],deltaLpp},
                                  {deltaL0, - deltaLp/Sqrt[2]}}, 1, 3, 1, 1};


        
(*----------------------------------------------*)
(*   DEFINITION                                 *)
(*----------------------------------------------*)

NameOfStates={GaugeES, EWSB};

(* ----- Before EWSB ----- *)

DEFINITION[GaugeES][LagrangianInput]= {
	{LagHC, {AddHC->True}},
	{LagNoHC,{AddHC->False}}};


(*Contractions*)

contractionMu12=Delta[rig1,rig2] Delta[lef2,lef1];

contractionLam1=Delta[rig1,rig2] Delta[lef2,lef1] Delta[rig3,rig4] Delta[lef4,lef3];
contractionLam2a=epsTensor[lef2,lef1] epsTensor[rig2,rig1] epsTensor[lef4,lef3] epsTensor[rig4,rig3];
contractionLam2b=epsTensor[rig2,rig1] epsTensor[lef2,lef1] epsTensor[rig4,rig3] epsTensor[lef4,lef3];
contractionLam3=epsTensor[lef2,lef1] epsTensor[rig2,rig1] epsTensor[rig4,rig3] epsTensor[lef4,lef3];
contractionLam4a=- Delta[rig1,rig2] Delta[lef2,lef1] epsTensor[lef4,lef3] epsTensor[rig4,rig3];
contractionLam4b=- Delta[rig1,rig2] Delta[lef2,lef1] epsTensor[rig4,rig3] epsTensor[lef4,lef3];

contractionRho1a=Delta[rig1b,rig2b] Delta[rig2,rig1] Delta[rig3b,rig4b] Delta[rig4,rig3];
contractionRho1b=Delta[lef1b,lef2b] Delta[lef2,lef1] Delta[lef3b,lef4b] Delta[lef4,lef3];
contractionRho2a=Delta[rig1b,rig2] Delta[rig2b,rig1] Delta[rig3,rig4b] Delta[rig4,rig3b];
contractionRho2b=Delta[lef1b,lef2] Delta[lef2b,lef1] Delta[lef3,lef4b] Delta[lef4,lef3b];
contractionRho3=Delta[lef1b,lef2b] Delta[lef2,lef1] Delta[rig3b,rig4b] Delta[rig4,rig3];
contractionRho4a=Delta[rig1b,rig2] Delta[rig2b,rig1] Delta[lef3,lef4b] Delta[lef4,lef3b];
contractionRho4b=Delta[lef1b,lef2] Delta[lef2b,lef1] Delta[rig3,rig4b] Delta[rig4,rig3b];

contractionAlp1a=Delta[rig1,rig2] Delta[lef2,lef1] Delta[lef3b,lef4b] Delta[lef4,lef3];
contractionAlp1b=Delta[rig1,rig2] Delta[lef2,lef1] Delta[rig3,rig4] Delta[rig4b,rig3b];
contractionAlp2a=- epsTensor[rig2,rig1] epsTensor[lef2,lef1] Delta[rig3,rig4] Delta[rig4b,rig3b];
contractionAlp2b=- epsTensor[rig2,rig1] epsTensor[lef2,lef1] Delta[lef3,lef4] Delta[lef4b,lef3b];
contractionAlp2c=- epsTensor[lef2,lef1] epsTensor[rig2,rig1] Delta[rig3,rig4] Delta[rig4b,rig3b];
contractionAlp2d=- epsTensor[lef2,lef1] epsTensor[rig2,rig1] Delta[lef3,lef4] Delta[lef4b,lef3b];
contractionAlp3a=Delta[rig1,rig2] Delta[lef2,lef3] Delta[lef3b,lef4b] Delta[lef4,lef1];
contractionAlp3b=Delta[lef1,lef2] Delta[rig2,rig3] Delta[rig3b,rig4b] Delta[rig4,rig1];

contractionBeta1a=Delta[rig1,rig2] Delta[rig2b,rig3] Delta[lef3,lef4b] Delta[lef4,lef1];
contractionBeta1b=Delta[lef1,lef2] Delta[lef2b,lef3] Delta[rig3,rig4b] Delta[rig4,rig1];
contractionBeta2a= epsTensor[rig1,rig2] Delta[rig2b,rig3] Delta[lef3,lef4b] epsTensor[lef4,lef1];
contractionBeta2b= epsTensor[lef2,lef1] Delta[lef2b,lef3] Delta[rig3,rig4b] epsTensor[rig1,rig4];
contractionBeta3a= Delta[rig1,rig2] epsTensor[rig3,rig2b] epsTensor[lef4b,lef3] Delta[lef4,lef1];
contractionBeta3b= Delta[lef1,lef2] epsTensor[lef2b,lef3] epsTensor[rig3,rig4b] Delta[rig4,rig1];

(*Contractions end*)


LagNoHC = ( mu12 contractionMu12 Phi.conj[Phi]           
          - mu22 ( conj[Phi].conj[Phi]
          +  Phi.Phi )
          + muLR2 ( deltaR.conj[deltaR]  
          + deltaL.conj[deltaL]  )
          - lam1 contractionLam1 Phi.conj[Phi].Phi.conj[Phi] 
          - lam2 ( contractionLam2a conj[Phi].conj[Phi].conj[Phi].conj[Phi] 
          + contractionLam2b Phi.Phi.Phi.Phi )
          - lam3 contractionLam3 conj[Phi].conj[Phi].Phi.Phi
          - lam4 ( contractionLam4a Phi.conj[Phi].conj[Phi].conj[Phi] 
          + contractionLam4b Phi.conj[Phi].Phi.Phi )                     
          - rho1 ( contractionRho1a deltaR.conj[deltaR].deltaR.conj[deltaR] 
          + contractionRho1b deltaL.conj[deltaL].deltaL.conj[deltaL] )
          - rho2 ( contractionRho2a deltaR.deltaR.conj[deltaR].conj[deltaR] 
          + contractionRho2b deltaL.deltaL.conj[deltaL].conj[deltaL] )
          - rho3 contractionRho3 deltaL.conj[deltaL].deltaR.conj[deltaR] 
          - rho4 ( contractionRho4a deltaR.deltaR.conj[deltaL].conj[deltaL] 
          + contractionRho4b deltaL.deltaL.conj[deltaR].conj[deltaR]   )         
          - alp1 ( contractionAlp1a Phi.conj[Phi].deltaL.conj[deltaL] 
          + contractionAlp1b Phi.conj[Phi].deltaR.conj[deltaR] )
          - alp2 ( contractionAlp2a Phi.Phi.deltaR.conj[deltaR] 
          + contractionAlp2b Phi.Phi.deltaL.conj[deltaL] 
          + contractionAlp2c conj[Phi].conj[Phi].deltaR.conj[deltaR] 
          + contractionAlp2d conj[Phi].conj[Phi].deltaL.conj[deltaL]  )     
          - alp3 ( contractionAlp3a Phi.conj[Phi].deltaL.conj[deltaL] 
          + contractionAlp3b conj[Phi].Phi.deltaR.conj[deltaR]  )
          - beta1 ( contractionBeta1a Phi.deltaR.conj[Phi].conj[deltaL] 
          + contractionBeta1b conj[Phi].deltaL.Phi.conj[deltaR] )
          - beta2 ( contractionBeta2a conj[Phi].deltaR.conj[Phi].conj[deltaL] 
          + contractionBeta2b Phi.deltaL.Phi.conj[deltaR] )
          - beta3 ( contractionBeta3a Phi.deltaR.Phi.conj[deltaL] 
          + contractionBeta3b conj[Phi].deltaL.conj[Phi].conj[deltaR] ) );



LagHC = - ( YL1 Phi.LLbar.LR 
          + YL2 conj[Phi].LLbar.LR 
          + YQ1 QLbar.Phi.QR 
          - YQ2 QLbar.conj[Phi].QR 
          + YDR LR.deltaR.LR 
          + YDL conj[LLbar].deltaL.conj[LLbar] );


(* Gauge Sector *)
DEFINITION[EWSB][GaugeSector] =
{ {{VB,VWL[3],VWR[3]},{VP,VZ,VZR},ZZ},
  {{VWL[1],VWL[2],VWR[1],VWR[2]},{VWLm,conj[VWLm],VWRm,conj[VWRm]},ZW} };     
        
(* ----- VEVs ---- *)
DEFINITION[EWSB][VEVs]={
{H0,       {vHd, 1/Sqrt[2]}, 
                     {sigmaH10, I/Sqrt[2]},{phiH10, 1/Sqrt[2]}},
{HPrime0, {vHu, 1/Sqrt[2]}, 
                     {sigmaH20, I/Sqrt[2]},{phiH20,1/Sqrt[2]}},
{deltaR0, {vR, 1/Sqrt[2]}, 
                     {sigmaR0, I/Sqrt[2]},{phiR0,1/Sqrt[2]}},
{deltaL0, {vL, 1/Sqrt[2]}, 
                     {sigmaL0, I/Sqrt[2]},{phiL0,1/Sqrt[2]}} };
 
DEFINITION[EWSB][MatterSector]=   
    { (*Neutral scalars*)
     {{phiH10,phiH20,phiR0,phiL0},{hh,ZH}},
      (*Pseudoscalars*)
     {{sigmaH10,sigmaH20,sigmaR0,sigmaL0},{Ah,UP}},
      (*Singly charged scalars*)
     {{Hm,conj[Hp],conj[deltaRp],conj[deltaLp]},{Hpm,UC}},
      (*Doubly charged scalars*)
     {{conj[deltaRpp],conj[deltaLpp]},{Hppmm,UCC}},
      (*Fermions*)
     {{{dL}, {conj[dR]}}, {{DL,Vd}, {DR,Ud}}},
     {{{uL}, {conj[uR]}}, {{UL,Vu}, {UR,Uu}}},
     {{{eL}, {conj[eR]}}, {{EL,Ve}, {ER,Ue}}},
     {{nuL, conj[nuR]},{Fv0,PMNS}} };  


(*------------------------------------------------------*)
(* Dirac-Spinors *)
(*------------------------------------------------------*)

(*
DEFINITION[GaugeES][DiracSpinors]={
  Fd1 -> {dL, 0},
  Fd2 -> {0, dR},
  Fu1 -> {uL, 0},
  Fu2 -> {0, uR},
  Fe1 -> {eL, 0},
  Fe2 -> {0, eR},
  Fv1  -> {nuL,0},
  Fv2 -> {0,nuR} };*)



DEFINITION[EWSB][DiracSpinors]={
 Fd ->{  DL, conj[DR]},
 Fe ->{  EL, conj[ER]},
 Fu ->{  UL, conj[UR]},
 Fv ->{Fv0, conj[Fv0]}};





