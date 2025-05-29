
ParameterDefinitions = { 
 

{aEWinv,{ 
     Description -> "inverse weak coupling constant at mZ", 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> True, 
     Value -> 137.035999679, 
     LesHouches -> {SMINPUTS, 1}, 
     LaTeX -> "\\alpha^{-1}", 
     OutputName -> aEWinv}}, 

{alp1,{ 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> True, 
     LesHouches -> {LRINPUT, 14}, 
     LaTeX -> "\\alpha_1", 
     OutputName -> ALP1}}, 

{alp2,{ 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> True, 
     LesHouches -> {LRINPUT, 16}, 
     LaTeX -> "\\alpha_2", 
     OutputName -> ALP2}}, 

{alp3,{ 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> True, 
     LesHouches -> {LRINPUT, 20}, 
     LaTeX -> "\\alpha_3", 
     OutputName -> ALP3}}, 

{AlphaS,{ 
     Description -> "Alpha Strong", 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> True, 
     Value -> 0.119, 
     LesHouches -> {SMINPUTS, 3}, 
     LaTeX -> "\\alpha_S", 
     OutputName -> aS}}, 

{beta1,{ 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> True, 
     LesHouches -> {LRINPUT, 22}, 
     LaTeX -> "\\beta_1", 
     OutputName -> BETA1}}, 

{beta2,{ 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> True, 
     LesHouches -> {LRINPUT, 24}, 
     LaTeX -> "\\beta_2", 
     OutputName -> BETA2}}, 

{beta3,{ 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> True, 
     LesHouches -> {LRINPUT, 26}, 
     LaTeX -> "\\beta_3", 
     OutputName -> BETA3}}, 

{e,{ 
     Description -> "electric charge", 
     Dependence -> None, 
     DependenceNum -> 2*Sqrt[aEWinv^(-1)]*Sqrt[Pi], 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> True, 
     LaTeX -> "e", 
     OutputName -> el}}, 

{g2,{ 
     Description -> "Left-Coupling", 
     Dependence -> None, 
     DependenceNum -> e*Csc[ThetaW], 
     DependenceOptional -> e*Csc[ThetaW], 
     DependenceSPheno -> None, 
     Real -> True, 
     LesHouches -> {gauge, 2}, 
     LaTeX -> "g_2", 
     OutputName -> g2}}, 

{g3,{ 
     Description -> "Strong-Coupling", 
     Dependence -> None, 
     DependenceNum -> 2*Sqrt[AlphaS]*Sqrt[Pi], 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> True, 
     LesHouches -> {gauge, 3}, 
     LaTeX -> "g_3", 
     OutputName -> g3}}, 

{gBL,{ 
     Description -> "B-L-Coupling", 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     GUTnormalization -> Sqrt[3/2], 
     Real -> True, 
     LesHouches -> {gauge, 4}, 
     LaTeX -> "g_{B}", 
     OutputName -> gBL}}, 

{Gf,{ 
     Description -> "Fermi's constant", 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> True, 
     Value -> 0.0000116639, 
     LesHouches -> {SMINPUTS, 2}, 
     LaTeX -> "G_f", 
     OutputName -> Gf}}, 

{gR,{ 
     Description -> "LeftR-Coupling", 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> True, 
     LesHouches -> {GAUGE, 5}, 
     LaTeX -> "g_R", 
     OutputName -> gR}}, 

{lam1,{ 
     Description -> "SM Higgs Selfcouplings", 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> True, 
     LesHouches -> {LRINPUT, 1}, 
     LaTeX -> "\\lambda", 
     OutputName -> LAM1}}, 

{lam2,{ 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> True, 
     LesHouches -> {LRINPUT, 2}, 
     LaTeX -> "\\lambda_2", 
     OutputName -> LAM2}}, 

{lam3,{ 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> True, 
     LesHouches -> {LRINPUT, 4}, 
     LaTeX -> "\\lambda_3", 
     OutputName -> LAM3}}, 

{lam4,{ 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> True, 
     LesHouches -> {LRINPUT, 5}, 
     LaTeX -> "\\lambda_4", 
     OutputName -> LAM4}}, 

{mu12,{ 
     Description -> "SM Mu Parameter", 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> True, 
     LesHouches -> {LRINPUT, 100}, 
     LaTeX -> "\\mu", 
     OutputName -> MU12}}, 

{mu22,{ 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> True, 
     LesHouches -> {LRINPUT, 98}, 
     LaTeX -> "\\mu_{2}^2", 
     OutputName -> MU22}}, 

{muR2,{ 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> True, 
     LesHouches -> {LRINPUT, 103}, 
     LaTeX -> "\\mu_{R}^2", 
     OutputName -> muR2}}, 

{muLR2,{ 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> True, 
     LesHouches -> {LRINPUT, 104}, 
     LaTeX -> "\\mu_{LR}^2", 
     OutputName -> muLR2}},      
     
{PhiW,{ 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> ArcCos[Sqrt[Abs[ZW[1, 1]]^2 + Abs[ZW[1, 2]]^2]], 
     Real -> True, 
     LesHouches -> PhiW, 
     LaTeX -> "\\phi_W", 
     OutputName -> PhiW}}, 

{PMNS,{ 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> False, 
     LesHouches -> UVMIX, 
     LaTeX -> "U^V", 
     OutputName -> UV}}, 

{rho1,{ 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> True, 
     LesHouches -> {LRINPUT, 7}, 
     LaTeX -> "\\rho_1", 
     OutputName -> RHO1}}, 

{rho2,{ 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> True, 
     LesHouches -> {LRINPUT, 9}, 
     LaTeX -> "\\rho_2", 
     OutputName -> RHO2}}, 

{rho3,{ 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> True, 
     LesHouches -> {LRINPUT, 11}, 
     LaTeX -> "\\rho_3", 
     OutputName -> RHO3}}, 

{rho4,{ 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> True, 
     LesHouches -> {LRINPUT, 12}, 
     LaTeX -> "\\rho_4", 
     OutputName -> RHO4}}, 

{ThetaW,{ 
     Description -> "Weinberg-Angle", 
     Dependence -> None, 
     DependenceNum -> None, (*ArcCos[(g2*Sqrt[gBL^2 + gR^2])/Sqrt[g2^2*gBL^2 + g2^2*gR^2 + gBL^2*gR^2]], *)
     DependenceOptional -> None, 
     DependenceSPheno -> ArcSin[Abs[ZZ[2, 1]]], 
     Real -> True, 
     LesHouches -> ThetaW, 
     LaTeX -> "\\Theta_W", 
     OutputName -> TW}}, 

{UC,{ Description -> "Charged-Mixing-Matrix",
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> True, 
     LesHouches -> CHMIX, 
     LaTeX -> "Z^+", 
     OutputName -> UC}}, 

{UCC,{ 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> True, 
     LesHouches -> CHCHMIX, 
     LaTeX -> "Z^{++}", 
     OutputName -> UCC}}, 

{Ud,{ 
     Description -> "Right-Down-Mixing-Matrix", 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> False, 
     LesHouches -> UDRMIX, 
     LaTeX -> "U^d_R", 
     OutputName -> ZDR}}, 

{Ue,{ 
     Description -> "Right-Lepton-Mixing-Matrix", 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> False, 
     LesHouches -> UERMIX, 
     LaTeX -> "U^e_R", 
     OutputName -> ZER}}, 

{UP,{ Description -> "Pseudo-Scalar-Mixing-Matrix",
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> True, 
     LesHouches -> AMIX, 
     LaTeX -> "Z^{Ah}", 
     OutputName -> UP}}, 

{Uu,{ 
     Description -> "Right-Up-Mixing-Matrix", 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> False, 
     LesHouches -> UURMIX, 
     LaTeX -> "U^u_R", 
     OutputName -> ZUR}}, 

{v,{ 
     Description -> "EW-VEV", 
     Dependence -> None, 
     DependenceNum -> 2*Sqrt[Mass[VWLm]^2/g2^2], 
     DependenceOptional -> None, 
     DependenceSPheno -> Sqrt[vHu^2 + vHd^2 + 2 vL^2], 
     Real -> True, 
     LesHouches -> {HMIX, 3}, 
     LaTeX -> "v", 
     OutputName -> v}}, 

{vHd,{ 
     Description -> "Down-VEV", 
     Dependence -> None, 
     DependenceNum -> None, (*v*Cos[\[Beta]], *)
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> True, 
     LesHouches -> {HMIX, 102}, 
     LaTeX -> "v_d", 
     OutputName -> vHd}}, 

{vHu,{ 
     Description -> "Up-VEV", 
     Dependence -> None, 
     DependenceNum -> None, (*v*Sin[\[Beta]], *)
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> True, 
     LesHouches -> {HMIX, 103}, 
     LaTeX -> "v_u", 
     OutputName -> vHu}}, 

{Vd,{ 
     Description -> "Left-Down-Mixing-Matrix", 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> False, 
     LesHouches -> UDLMIX, 
     LaTeX -> "U^d_L", 
     OutputName -> ZDL}}, 

{Ve,{ 
     Description -> "Left-Lepton-Mixing-Matrix", 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> False, 
     LesHouches -> UELMIX, 
     LaTeX -> "U^e_L", 
     OutputName -> ZEL}}, 

{vL,{ 
     Dependence -> None, 
     DependenceNum -> 2001, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> True, 
     LesHouches -> {VEV, 3}, 
     LaTeX -> "v_L", 
     OutputName -> vL}}, 

{vR,{ 
     Dependence -> None, 
     DependenceNum -> 2000, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> True, 
     LesHouches -> {VEV, 4}, 
     LaTeX -> "v_R", 
     OutputName -> vR}}, 

{Vu,{ 
     Description -> "Left-Up-Mixing-Matrix", 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> False, 
     LesHouches -> UULMIX, 
     LaTeX -> "U^u_L", 
     OutputName -> ZUL}}, 

{YDL,{ 
     Description -> "DeltaL-lLs", 
     Form -> Symmetric,
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> False, 
     LesHouches -> YDL, 
     LaTeX -> "Y_{DL}", 
     OutputName -> YDL}}, 

{YDR,{ 
     Description -> "DeltaR-lRs", 
     Dependence -> None, 
     Form -> Symmetric,
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> False, 
     LesHouches -> YDR, 
     LaTeX -> "Y_{DR}", 
     OutputName -> YDR}}, 

{YL1,{ 
     Description -> "Lepton-Doublet Yukawa One", 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> False, 
     LesHouches -> YL1, 
     LaTeX -> "Y_{L1}", 
     OutputName -> YL1}}, 

{YL2,{ 
     Description -> "Lepton-Doublet Yukawa Two", 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> False, 
     LesHouches -> YL2, 
     LaTeX -> "Y_{L2}", 
     OutputName -> YL2}}, 

{YQ1,{ 
     Description -> "Quark-Doublet Yukawa One", 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> False, 
     LesHouches -> YQ1, 
     LaTeX -> "Y_{Q1}", 
     OutputName -> YQ1}}, 

{YQ2,{ 
     Description -> "Quark-Doublet Yukawa Two", 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> False, 
     LesHouches -> YQ2, 
     LaTeX -> "Y_{Q2}", 
     OutputName -> YQ2}}, 

{ZH,{ 
     Description -> "Scalar-Mixing-Matrix", 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> True, 
     LesHouches -> SCALARMIX, 
     LaTeX -> "Z^H", 
     OutputName -> ZH}}, 

{ZW,{
     Description -> "W Mixing Matrix",
     Dependence -> {{Cos[PhiW]/Sqrt[2], Cos[PhiW]/Sqrt[2], -(Sin[PhiW]/Sqrt[2]), -(Sin[PhiW]/Sqrt[2])}, {((-I)*Cos[PhiW])/Sqrt[2], (I*Cos[PhiW])/Sqrt[2], (I*Sin[PhiW])/Sqrt[2], ((-I)*Sin[PhiW])/Sqrt[2]}, {Sin[PhiW]/Sqrt[2], Sin[PhiW]/Sqrt[2], Cos[PhiW]/Sqrt[2], Cos[PhiW]/Sqrt[2]}, {((-I)*Sin[PhiW])/Sqrt[2], (I*Sin[PhiW])/Sqrt[2], ((-I)*Cos[PhiW])/Sqrt[2], (I*Cos[PhiW])/Sqrt[2]}},
     DependenceNum -> None,
     DependenceOptional -> None,
     DependenceSPheno -> None,
     Real -> False,
     LesHouches -> ZWMIX,
     LaTeX -> "Z^{W}",
     OutputName -> ZW}},

{ZZ,{ 
     Description -> "Photon-Z-Z' Mixing Matrix", 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> True, 
     LesHouches -> ZZMIX, 
     LaTeX -> "Z^Z", 
     OutputName -> ZZ}}, 

     (*
{\[Beta],{ 
     Description -> "Pseudo Scalar mixing angle", 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> ArcSin[Abs[UC[2, 1]]], 
     Real -> True, 
     LesHouches -> {HMIX, 10}, 
     LaTeX -> "\\beta", 
     OutputName -> betaH}}, 
*)


(*  ----------- Additional parameters in the model ---------- *) 

{Mass[VWLm],{
     Dependence -> None,
     DependenceNum -> None,
     DependenceOptional -> None,
     DependenceSPheno -> None,
     Real -> False,
     LesHouches -> {LRSM, 2},
     LaTeX -> "M_{VWLm}",
     OutputName -> Mvwlm}} 
} 
