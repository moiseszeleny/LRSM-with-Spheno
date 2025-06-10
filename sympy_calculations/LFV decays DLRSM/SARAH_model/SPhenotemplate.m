(* ========================================================================== *)
(* SPheno.m Configuration File Template for a New Model                       *)
(* ========================================================================== *)
(*                                                                            *)
(* Instructions:                                                              *)
(* 1. Read the comments carefully and replace placeholder examples            *)
(*    (e.g., "MyInputParameter1", "MyModelVEV", "MyNewParticle")              *)
(*    with the actual names and values relevant to YOUR specific model.       *)
(* 2. Consult your main SARAH model definition file (e.g., YourModelName.m)   *)
(*    to find:                                                                *)
(*    - Lagrangian parameter names (for BoundaryLowScaleInput)                *)
(*    - VEV names (for ParametersToSolveTadpoles, MatchingConditions)         *)
(*    - Particle names (for ListDecayParticles)                               *)
(*    - Gauge coupling names (g1, g2, g3, and any new ones)                   *)
(*    - Yukawa coupling names (Ye, Yd, Yu, and any new ones)                  *)
(* 3. The DEFINITION[MatchingConditions] section is CRITICAL. Pay close       *)
(*    attention to how your model's VEVs and Yukawa couplings relate to       *)
(*    their SM counterparts.                                                  *)
(* 4. Add or remove sections/flags as needed based on the specifics of        *)
(*    your model and the SPheno features you intend to use.                   *)
(*                                                                            *)
(* ========================================================================== *)


(* -------------------------------------------------------------------------- *)
(* General SPheno Settings                                                    *)
(* -------------------------------------------------------------------------- *)

OnlyLowEnergySPheno = True;
(* Set to False if you need high-scale SPheno features, RGE running to GUT scale, etc.
   For most phenomenological studies focusing on EW scale and below, True is common. *)


(* -------------------------------------------------------------------------- *)
(* Minimal Input Parameters (MINPAR Block in Les Houches Accord)              *)
(* -------------------------------------------------------------------------- *)
(* These are the fundamental input parameters your model takes, typically read
   from an LHA input file. The integer is the LHA block index. *)

MINPAR = {
  (* {LHA_Index, YourModelInputParameterName}, ... *)
  (* Examples: *)
  (* {1, MyInputScalarMassSq},    *)
  (* {2, MyInputCouplingLambda},  *)
  (* {3, MyInputVEVratio}         *)
  (* {10, AnotherInputParameter} *)
};

(* Optional: Specify if any of your MINPAR inputs are strictly real numbers.
   This can be important for how SPheno handles them internally. *)
(*
RealParameters = {
  (* MyInputVEVratio *) (* If MyInputVEVratio must be real *)
};
*)


(* -------------------------------------------------------------------------- *)
(* Parameters Determined by Tadpole Equations                                 *)
(* -------------------------------------------------------------------------- *)
(* List of parameters (usually VEVs or scalar mass^2 terms like mu^2)
   that SPheno should solve for by enforcing the tadpole conditions (dV/dphi_i = 0
   for each scalar field phi_i that gets a VEV).
   These are typically parameters from your scalar potential.
   Consult your SARAH model file's scalar potential (LagNoHC) and VEV definitions
   (DEFINITION[EWSB][VEVs]). *)

ParametersToSolveTadpoles = {
  (* MyModelVEV1, MyModelMuSqParameter, ... *)
  (* Example from SM: {mu2} *)
  (* Example from THDM: {M112, M222} *)
  (* Example from BL-VL: {muH2, mu32, mu62, v2} *)
};

(* Optional: You can specify the loop order for specific tadpole equations if needed.
   Index corresponds to the order in ParametersToSolveTadpoles. *)
(* Tad1Loop[index] = 0; (* To solve tadpole 'index' at tree-level only *) *)
(* Tad1Loop[index] = 1; (* To solve tadpole 'index' at one-loop (default if not specified) *) *)


(* -------------------------------------------------------------------------- *)
(* Boundary Conditions at the Low Energy Scale (e.g., M_Z or M_SUSY)          *)
(* -------------------------------------------------------------------------- *)
(* This section maps the input parameters from MINPAR (and other fixed values)
   to the fundamental Lagrangian parameters of your model at the low energy scale
   where SPheno starts its calculations (often M_Z).
   Consult your SARAH model file for the names of your Lagrangian parameters
   (e.g., in LagNoHC, LagHC). *)

BoundaryLowScaleInput = {
  (* {YourModelLagrangianParameter, Value_or_MINPAR_Input}, ... *)
  (* Examples: *)
  (* {MyModelsLambda1, MyInputCouplingLambda1},       *) (* Direct mapping *)
  (* {MyModelsMuSqH, MyInputScalarMassSqH},           *)
  (* {MyModelsgX, MyInputgX},                         *) (* A new gauge coupling *)
  (* {MyModelsVEV_S, MyInputVEV_S_Value}              *) (* If a VEV is an input *)

  (* Example from SM: {\[Lambda], LambdaIN} *)
  (* Example from THDM: {Lambda1, Lambda1Input}, {M12, M12input} *)
  (* Example from BL-VL: {gBL, gBLINPUT}, {lamH, LambdaHINPUT}, {v3, v3INPUT} *)
};


(* -------------------------------------------------------------------------- *)
(* Matching Conditions to Standard Model Parameters                           *)
(* -------------------------------------------------------------------------- *)
(* This is a VERY IMPORTANT section. It defines how the parameters of your
   new model (left-hand side of each pair) are related to the well-measured
   Standard Model (SM) parameters (right-hand side of each pair) at the
   matching scale (typically M_Z).

   The format is {YourModelParameter, SM_Parameter_or_Expression}.

   SPheno takes the following SM parameters as known inputs for matching
   (derived from experimental data):
     - vSM: The SM vacuum expectation value (approx 246 GeV).
     - g1SM, g2SM, g3SM: The SM U(1)Y, SU(2)L, and SU(3)C gauge couplings.
     - YeSM, YdSM, YuSM: The SM Yukawa couplings for electrons, down-type quarks,
                           and up-type quarks, respectively.

   The parameters on the left (YourModelParameter) must be parameters defined
   in your SARAH model (e.g., gauge couplings, Yukawa couplings, VEVs).
   The parameters on the right (e.g., g1SM, YeSM, vSM) are the SM values that
   SPheno takes as input. *)

DEFINITION[MatchingConditions]= {
  (* --- Gauge Couplings --- *)
  (* These are usually standard if your model doesn't introduce new gauge groups
     that mix significantly with SM gauge groups at tree level in a complex way,
     or if such mixing is handled via separate input parameters for kinetic mixing terms. *)
  {g1, g1SM},  (* Your model's U(1)Y coupling matched to SM g1. Check 'g1' is correct in your model. *)
  {g2, g2SM},  (* Your model's SU(2)L coupling matched to SM g2. Check 'g2' is correct in your model. *)
  {g3, g3SM},  (* Your model's SU(3)C coupling matched to SM g3. Check 'g3' is correct in your model. *)
  (* If you have a new U(1)' (e.g., gBL in BL-VL), its matching is usually handled by
     BoundaryLowScaleInput if it's a direct input, or it's a derived quantity.
     Kinetic mixing parameters (e.g., g1BL in BL-VL) are also typically inputs. *)

  (* --- Yukawa Couplings --- *)
  (* How these are matched depends critically on your model's Higgs sector and
     which scalar VEVs are responsible for fermion masses. *)

  (* Scenario 1: A single SM-like Higgs doublet (VEV: v_SM_like) gives mass to all SM fermions,
                 and this v_SM_like is what corresponds to vSM. *)
  {Ye, YeSM},  (* Electron Yukawa. 'Ye' is your model's parameter name. *)
  {Yd, YdSM},  (* Down-type quark Yukawa. 'Yd' is your model's parameter name. *)
  {Yu, YuSM},  (* Up-type quark Yukawa. 'Yu' is your model's parameter name. *)

  (* Scenario 2: Extended Higgs Sector (e.g., THDM-like where vSM^2 = v1^2 + v2^2)
                 If a specific VEV (e.g., v_doublet_A) from your model gives mass to certain fermions. *)
  (* {Ye, YeSM * vSM / v_doublet_A_for_leptons}, *)
  (* {Yd, YdSM * vSM / v_doublet_B_for_down_quarks}, *)
  (* {Yu, YuSM * vSM / v_doublet_C_for_up_quarks}   *)
  (* Example from THDM (Type II):
     {Ye, YeSM*vSM/v2}, {Yd, YdSM*vSM/v2}, {Yu, YuSM*vSM/v1} (or v2 depending on type)
     You need to derive these scaling factors based on your model's Lagrangian (LagHC for Yukawas)
     and VEV definitions (DEFINITION[EWSB][VEVs]). *)

  (* --- Vacuum Expectation Value(s) --- *)
  (* This relates your model's VEV(s) responsible for Electroweak Symmetry Breaking
     to the SM VEV (vSM approx 246 GeV). *)

  (* Scenario 1: One primary VEV in your model breaks EW symmetry like in the SM.
                 Let's say your SM-like Higgs doublet has a VEV named 'MyModel_vH'. *)
  {MyModel_vH, vSM}
  (* Example from SM/SSM: {v, vSM} *)
  (* Example from BL-VL: {vH, vSM} (where vH is the VEV of the SM-like Higgs) *)

  (* Scenario 2: Multiple VEVs contribute to EWSB, and you define them in terms of vSM
                 and other input parameters (like TanBeta in THDM). *)
  (* {MyModel_v1, vSM * Cos[ArcTan[MyInputVEVratio]]}, *)
  (* {MyModel_v2, vSM * Sin[ArcTan[MyInputVEVratio]]}  *)
  (* Example from THDM:
     {v1,vSM*Cos[ArcTan[TanBeta]]},
     {v2,vSM*Sin[ArcTan[TanBeta]]}
     Here, v1 and v2 are VEVs in the THDM, and TanBeta is an input from MINPAR.
     Ensure 'MyModel_v1', 'MyModel_v2' are the correct VEV names from your
     SARAH model's DEFINITION[EWSB][VEVs]. *)
};


(* -------------------------------------------------------------------------- *)
(* Tree-Level Unitarity Constraints                                           *)
(* -------------------------------------------------------------------------- *)

AddTreeLevelUnitarityLimits = True;
(* Set to True to enable calculation of tree-level unitarity constraints on
   scalar scattering amplitudes. Useful for constraining parameter space. *)


(* -------------------------------------------------------------------------- *)
(* Particle Decays                                                            *)
(* -------------------------------------------------------------------------- *)

(* List of particles for which SPheno should calculate 2-body decay widths.
   Particle names must match those defined in your SARAH model file. *)
ListDecayParticles = {
  Fu, Fe, Fd, hh, (* Standard Model-like particles *)
  (* MyNewScalar1, MyNewScalar2, MyNewFermion, MyNewGaugeBoson ... *) (* Add your new particles *)
};

(* List of particles for which SPheno should calculate 3-body decays.
   Often requires specific Fortran routines for the calculations. *)
ListDecayParticles3B = {
  (* {{ParticleName, "FortranFileName.f90"}, ...} *)
  (* Standard ones: *)
  {Fu,"Fu.f90"},
  {Fe,"Fe.f90"},
  {Fd,"Fd.f90"}
  (* Add your new particles if you have 3-body decay routines for them: *)
  (* {MyNewScalar1, "MyNewScalar1_3body.f90"} *)
};

(* Optional: Control one-loop decay calculations. *)
(* SA`AddOneLoopDecay = False; (* Globally disable 1-loop decays, as in BL-VL example *) *)
(* SA`AddOneLoopDecay[MyNewParticle] = True; (* Enable for a specific particle *) *)


(* -------------------------------------------------------------------------- *)
(* Default Input Values for MINPAR Parameters                                 *)
(* -------------------------------------------------------------------------- *)
(* Provides a default set of numerical values for the input parameters
   defined in MINPAR. Useful for running SPheno without a full LHA file. *)

DefaultInputValues = {
  (* YourModelInputParameterName -> DefaultValue, ... *)
  (* Examples from MINPAR section: *)
  (* MyInputScalarMassSq -> 10000.0,    *) (* e.g., (100 GeV)^2 *)
  (* MyInputCouplingLambda -> 0.1,      *)
  (* MyInputVEVratio -> 10.0,           *)
  (* AnotherInputParameter -> 0.5       *)
};


(* -------------------------------------------------------------------------- *)
(* Renormalization Conditions for Decays (Advanced)                           *)
(* ------- ------------------------------------------------------------------- *)
(* These define the renormalization scheme used for electroweak corrections
   to particle decays. The ones below are standard for many SM-like extensions.
   If your model introduces significant new physics affecting W/Z self-energies
   or EW precision observables in a non-trivial way, these might need adjustment.
   Consult SPheno documentation or expert advice for complex models.
   Note: MVWp (W plus) might appear as MVWm (W minus) in some files (e.g., THDM).
   Pi... terms are self-energies. *)

RenConditionsDecays = {
  {dCosTW, 1/2*Cos[ThetaW] * (PiVWp/(MVWp^2) - PiVZ/(mVZ^2))},
  {dSinTW, -dCosTW/Tan[ThetaW]},
  {dg2,    1/2*g2*(derPiVPheavy0 + PiVPlightMZ/MVZ^2 - (-(PiVWp/MVWp^2) + PiVZ/MVZ^2)/Tan[ThetaW]^2 + (2*PiVZVP*Tan[ThetaW])/MVZ^2)},
  {dg1,    dg2*Tan[ThetaW] + g2*dSinTW/Cos[ThetaW] - dCosTW*g2*Tan[ThetaW]/Cos[ThetaW]}
};


(* -------------------------------------------------------------------------- *)
(* Other Model-Specific Settings (Add as needed)                              *)
(* -------------------------------------------------------------------------- *)
(* Depending on your model, you might need additional flags or definitions.
   Examples:
   - Flags for specific calculations (e.g., FlagsForFlavorMixing)
   - Ordering of parameters in output blocks (e.g., ParameterOutputOrder)
   - Settings for loop calculations (e.g., TwoLoopHiggsMass)
   Refer to SPheno documentation and examples of similar models. *)

(* Example:
   EWSBOutputParameters = { ... }; (* To define which parameters appear in EWSB block *)
*)

(* End of SPheno.m Template for a New Model *)
