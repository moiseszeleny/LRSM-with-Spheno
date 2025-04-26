# DLRSM1/__init__.py

print("Loading DLRSM1 Feynman Rules...") # Optional: Indicate loading

# Import the necessary modules within the package
# Use relative imports '.' to refer to modules within the same package
try:
    from . import potential_senjanovic_HiggsDoublets
    from . import Gauge_Higgs_senjanovic_HiggsDoublets
    from . import dirac
    from . import symbolic_tools
    # This will trigger calculations in SW.py
    from . import FeynmanRules_senjanovic_SW
    # This will trigger calculations in H10_Z1_GM.py using results from SW
    from . import FeynmanRules_senjanovic_H10_Z1_GM as rules_h10_z1

except ImportError as e:
    print(f"Error importing DLRSM package components: {e}")
    # Optionally re-raise or handle differently
    raise

# --- Expose the final Feynman Rules dictionaries and lambdas ---
# These are the variables defined in FeynmanRules_senjanovic_H10_Z1_GM.py

# H10 Interactions
interactionsH10_WW_dict = rules_h10_z1.interactionsH10_WW_dict
interactionsH10_WW_dict_approx = rules_h10_z1.interactionsH10_WW_dict_approx
interactionsH10_W1pSm_dict = rules_h10_z1.interactionsH10_W1pSm_dict
interactionsH10_W1pSm_dict_approx = rules_h10_z1.interactionsH10_W1pSm_dict_approx
interactionsH10_W2pSm_dict = rules_h10_z1.interactionsH10_W2pSm_dict
interactionsH10_W2pSm_dict_approx = rules_h10_z1.interactionsH10_W2pSm_dict_approx
interactionsH10_W1mSp_dict = rules_h10_z1.interactionsH10_W1mSp_dict
interactionsH10_W1mSp_dict_approx = rules_h10_z1.interactionsH10_W1mSp_dict_approx
interactionsH10_W2mSp_dict = rules_h10_z1.interactionsH10_W2mSp_dict
interactionsH10_W2mSp_dict_approx = rules_h10_z1.interactionsH10_W2mSp_dict_approx
interactionsH10_SS_dict = rules_h10_z1.interactionsH10_SS_dict
interactionsH10_SS_dict_approx = rules_h10_z1.interactionsH10_SS_dict_approx

# Z1 Interactions
interactionsZ1_VS_dict = rules_h10_z1.interactionsZ1_VS_dict
interactionsZ1_VS_dict_approx = rules_h10_z1.interactionsZ1_VS_dict_approx

# Lepton Interaction Lambdas
interactionsWp_n_l = rules_h10_z1.interactionsWp_n_l
interactionsWm_n_l = rules_h10_z1.interactionsWm_n_l
interactionsSp_n_l = rules_h10_z1.interactionsSp_n_l
interactionsSm_n_l = rules_h10_z1.interactionsSm_n_l

# --- Optionally re-export key fields/parameters ---
# Makes them easily accessible via DLRSM.H10 etc.
H10 = potential_senjanovic_HiggsDoublets.H10
vR = potential_senjanovic_HiggsDoublets.vR
k1 = potential_senjanovic_HiggsDoublets.k1
# Add other scalars if needed
GRp = potential_senjanovic_HiggsDoublets.GRp
GLp = potential_senjanovic_HiggsDoublets.GLp
HLp = potential_senjanovic_HiggsDoublets.HLp
HRp = potential_senjanovic_HiggsDoublets.HRp
GRm = potential_senjanovic_HiggsDoublets.GRm
GLm = potential_senjanovic_HiggsDoublets.GLm
HLm = potential_senjanovic_HiggsDoublets.HLm
HRm = potential_senjanovic_HiggsDoublets.HRm

# Gauge bosons
W1p = Gauge_Higgs_senjanovic_HiggsDoublets.W1p
W1m = Gauge_Higgs_senjanovic_HiggsDoublets.W1m
W2p = Gauge_Higgs_senjanovic_HiggsDoublets.W2p
W2m = Gauge_Higgs_senjanovic_HiggsDoublets.W2m
Z1 = Gauge_Higgs_senjanovic_HiggsDoublets.Z1
g = Gauge_Higgs_senjanovic_HiggsDoublets.g

# Dirac structures
diracPL = dirac.diracPL
diracPR = dirac.diracPR
DiracGamma = dirac.DiracGamma

# Indexed bases (if needed frequently by users)
QL = rules_h10_z1.QL
QR = rules_h10_z1.QR
n = rules_h10_z1.n
nadj = rules_h10_z1.nadj
l = rules_h10_z1.l
ladj = rules_h10_z1.ladj
TRL = rules_h10_z1.TRL
K = rules_h10_z1.K
J = rules_h10_z1.J
ml = rules_h10_z1.ml

print("DLRSM Feynman Rules loaded.") # Optional: Indicate completion
