from sympy import symbols, IndexedBase, Expr, Symbol
from functools import lru_cache
from DLRSM1.symbolic_tools import momentum
import logging
# --- DLRSM1 Imports ---
# Feynman Rules specific to this calculation
from DLRSM1.FeynmanRules_senjanovic_H10_Z1_GM import (
    interactionsWp_n_l, interactionsWm_n_l,
    interactionsSp_n_l, interactionsSm_n_l,
    interactionsH10_SS_dict_approx,
    interactionsH10_W1mSp_dict_approx, # Keep other interactions if needed later
    interactionsH10_W1pSm_dict_approx,
    interactionsH10_W2pSm_dict_approx,
    interactionsH10_W2mSp_dict_approx,
    interactionsH10_WW_dict_approx,
    interactionsH10_ll,
    interactionsH10_nn,
    CHARGED_PARTICLES_P,
    CHARGED_PARTICLES_M
)

interactionsH10_WpSm_dict_approx = {
    **interactionsH10_W1pSm_dict_approx,
    **interactionsH10_W2pSm_dict_approx
}

interactionsH10_WmSp_dict_approx = {
    **interactionsH10_W1mSp_dict_approx,
    **interactionsH10_W2mSp_dict_approx
}

particle_charge = {
    ptc:1 if ptc in CHARGED_PARTICLES_P else -1 if ptc in CHARGED_PARTICLES_M else 0
    for ptc in CHARGED_PARTICLES_P + CHARGED_PARTICLES_M
}

# Potential and Mass related imports
from DLRSM1.potential_senjanovic_HiggsDoublets import (
    H10, GLp, GLm, GRp, GRm, HRp, HRm, HLp, HLm, # Particle Symbols
    mH10, mHR, mHL, rho1 # Masses/Parameters (rho1 might not be used here directly)
)
particle_charge[H10] = 0 # Neutral scalar


from DLRSM1.Gauge_Higgs_senjanovic_HiggsDoublets import (
    mW1, mW2, mZ1, mZ2, W1p, W1m, W2p, W2m, Z1, Z2 # Gauge Boson Symbols
) # Gauge Boson Masses
# Particle symbols and indices
from DLRSM1.FeynmanRules_senjanovic_H10_Z1_GM import (
    ml, mn, i, j, a, b, nadj, n, l, ladj, gamma_mu
)
# Dirac structure
from DLRSM1.dirac import diracPL, diracPR

# Setup basic logging
logging.basicConfig(level=logging.INFO, format='%(levelname)s: %(message)s')


# --- LFVXD Imports ---
# Diagram classes
from LFVXD.Hdecay_diagrams_v2 import (
    TriangleFSS,
    TriangleFSV, TriangleFVS, TriangleFVV,
    TriangleSFF, TriangleVFF,
    BubbleFS, BubbleFV, BubbleSF, BubbleVF
)
# Vertex classes
from LFVXD.vertexes_v2 import (
    VertexSSS,
    VertexSFF,
    VertexVFF,
    VertexSVV,
    VertexSVpSm,
    VertexSSpVm
)



# Helper to get chiral couplings (reduces repetition)
@lru_cache(maxsize=None)
def get_chiral_couplings(interaction_term: Expr) -> tuple[Expr, Expr]:
    """Extracts Left (PL) and Right (PR) chiral couplings."""
    term_expanded = interaction_term.expand()
    cL = term_expanded.coeff(diracPL)
    cR = term_expanded.coeff(diracPR)
    return cL, cR

@lru_cache(maxsize=None)
def get_chiral_couplings_gamma_mu(interaction_term: Expr) -> tuple[Expr, Expr]:
    """Extracts Left (PL) and Right (PR) chiral couplings."""
    term_expanded = interaction_term.expand()
    cL = term_expanded.coeff(gamma_mu*diracPL)
    cR = term_expanded.coeff(gamma_mu*diracPR)
    return cL, cR

@lru_cache(maxsize=None)
def get_momentum_couplings(interaction_term: Expr, H1: Symbol, H2: Symbol) -> Expr:
    """Extracts momentum couplings for H-V-S or H-S-V vertices."""
    # Assuming H1 and H2 are the two particles in the interaction term
    term_expanded = interaction_term.expand()
    
    if particle_charge[H1] == 1:
        cch = term_expanded.coeff(momentum(H1))
        c0 = term_expanded.coeff(momentum(H2))
        if  cch == -c0:
            return cch    
    elif particle_charge[H2] == 1:
        cch = term_expanded.coeff(momentum(H2))
        c0 = term_expanded.coeff(momentum(H1))
        if  cch == -c0:
            return cch
    elif particle_charge[H1] == -1:
        cch = term_expanded.coeff(momentum(H1))
        c0 = term_expanded.coeff(momentum(H2))
        if  cch == -c0:
            return c0
    elif particle_charge[H2] == -1:
        cch = term_expanded.coeff(momentum(H2))
        c0 = term_expanded.coeff(momentum(H1))
        if  cch == -c0:
            return c0
    else:
        raise ValueError("Invalid charge for particles")
    return 0

#############################3
# Define External Particles: (particle, Mass Symbol)
# Note: For fermions, use (particle, antiparticle, mass)


nu_index = i
lepton_index = b
antilep_index = a

external_scalar = (H10, mH10)
external_antilepton = (l[antilep_index], ladj[antilep_index], ml[antilep_index])
external_lepton = (l[lepton_index], ladj[lepton_index], ml[lepton_index])
##############################3


def find_interaction_coefficient(expected_particles: set,
                                interaction_dict: dict,
                                vertex_description: str) -> Expr:
    """
    Finds the coupling coefficient in an interaction dictionary that involves
    the specified set of particles.

    Args:
        expected_particles: A set of particle symbols expected at the vertex.
        interaction_dict: The dictionary of interactions { (particle_tuple): coefficient }.
        vertex_description: A string describing the vertex for error messages.

    Returns:
        The SymPy expression for the coupling coefficient.

    Raises:
        ValueError: If no matching interaction is found in the dictionary.
    """
    for interaction_particles, coefficient in interaction_dict.items():
        # Check if all expected particles are present in this interaction term
        # Note: Assumes interaction_particles is a tuple/list of symbols
        if all(p in interaction_particles for p in expected_particles):
            # Optional: Add a check if the sets are exactly equal if needed
            # if set(interaction_particles) == expected_particles:
            return coefficient
    # If loop completes without finding a match
    raise ValueError(f"Interaction for vertex '{vertex_description}' involving "
                    f"{expected_particles} not found in the provided dictionary.")

###############################################################################
## Refactored Diagram Creation
###############################################################################

def create_triangle_diagram(
    diagram_name: str,
    internal_fermion: tuple,
    internal_boson1: tuple, # Corresponds to vertex 2 connection
    internal_boson2: tuple, # Corresponds to vertex 3 connection
    v1_type: type, # Vertex class (e.g., VertexSSS, VertexSVV, VertexSVpSm, VertexSSpVm)
    v1_interaction_dict: dict,
    v2_type: type, # Vertex class (e.g., VertexSFF, VertexVFF)
    v2_interaction_func: callable, # Function returning interaction dict (e.g., interactionsSp_n_l)
    v3_type: type, # Vertex class (e.g., VertexSFF, VertexVFF)
    v3_interaction_func: callable, # Function returning interaction dict (e.g., interactionsSm_n_l)
    diagram_class: type, # Triangle class (e.g., TriangleFSS, TriangleFVV, TriangleFSV, TriangleFVS)
):
    """
    Creates a triangle diagram object based on the provided specifications.

    Args:
        diagram_name: A descriptive name for the diagram (for logging).
        internal_fermion: Tuple (particle, antiparticle, mass_symbol).
        internal_boson1: Tuple (particle, mass_symbol). Connects to v1 and v2.
        internal_boson2: Tuple (particle, mass_symbol). Connects to v1 and v3.
        v1_type: The class for vertex 1.
        v1_interaction_dict: The dictionary containing the interaction for vertex 1.
        v2_type: The class for vertex 2.
        v2_interaction_func: Function that returns the interaction dict for vertex 2.
        v3_type: The class for vertex 3.
        v3_interaction_func: Function that returns the interaction dict for vertex 3.
        diagram_class: The class for the overall triangle diagram.

    Returns:
        The instantiated triangle diagram object.

    Raises:
        ValueError: If interactions cannot be found.
    """
    logging.info(f"--- Creating Diagram: {diagram_name} ---")

    # --- Vertex 1 Construction ---
    particles_v1 = {external_scalar[0], internal_boson1[0], internal_boson2[0]}
    v1_desc = f"{external_scalar[0].name}-{internal_boson1[0].name}-{internal_boson2[0].name}"
    try:
        coeff1_term = find_interaction_coefficient(particles_v1, v1_interaction_dict, v1_desc)
        if v1_type == VertexSSS or v1_type == VertexSVV:
            c1 = coeff1_term
            v1 = v1_type(c1)
        elif v1_type == VertexSVpSm: # H -> V+ S-
            # Assumes boson1 is V+ and boson2 is S-
            c1 = get_momentum_couplings(coeff1_term, external_scalar[0], internal_boson2[0])
            v1 = v1_type(c1)
        elif v1_type == VertexSSpVm: # H -> S+ V-
            # Assumes boson1 is S+ and boson2 is V-
            c1 = get_momentum_couplings(coeff1_term, internal_boson1[0], external_scalar[0])
            v1 = v1_type(c1)
        else:
            raise TypeError(f"Unsupported vertex type for v1: {v1_type}")
        logging.info(f"Vertex 1 ({v1_desc}) coupling found: {c1}")
    except (ValueError, TypeError) as e:
        logging.error(f"Vertex 1 interaction error for {diagram_name}: {e}")
        raise

    # --- Vertex 2 Construction ---
    # Connects internal_boson1, internal_fermion (adj), external_lepton
    particles_v2 = {internal_boson1[0], internal_fermion[1], external_lepton[0]}
    v2_desc = f"{internal_boson1[0].name}-{internal_fermion[1].name}-{external_lepton[0].name}"
    interaction_dict_v2 = v2_interaction_func(nu_index, lepton_index)
    try:
        c2_term = None
        for interaction_key, coeff in interaction_dict_v2.items():
            if set(interaction_key) == particles_v2:
                c2_term = coeff
                break
        if c2_term is None:
            raise ValueError(f"Exact interaction match not found for {particles_v2}")

        if v2_type == VertexSFF:
            c2L, c2R = get_chiral_couplings(c2_term)
            v2 = v2_type(c2R, c2L) # Note: VertexSFF expects (Right, Left)
        elif v2_type == VertexVFF:
            c2L, c2R = get_chiral_couplings_gamma_mu(c2_term)
            v2 = v2_type(c2R, c2L) # Note: VertexVFF expects (Right, Left)
        else:
            raise TypeError(f"Unsupported vertex type for v2: {v2_type}")
        logging.info(f"Vertex 2 ({v2_desc}) coupling found: L={c2L}, R={c2R}")
    except (ValueError, TypeError) as e:
        logging.error(f"Vertex 2 interaction error for {diagram_name}: {e}")
        logging.error(f"Interaction Dict Searched (v2_interaction_func({nu_index}, {lepton_index})):")
        logging.error(interaction_dict_v2)
        raise

    # --- Vertex 3 Construction ---
    # Connects internal_boson2, external_antilepton (adj), internal_fermion
    particles_v3 = {internal_boson2[0], external_antilepton[1], internal_fermion[0]}
    v3_desc = f"{internal_boson2[0].name}-{external_antilepton[1].name}-{internal_fermion[0].name}"
    interaction_dict_v3 = v3_interaction_func(nu_index, antilep_index)
    try:
        c3_term = None
        for interaction_key, coeff in interaction_dict_v3.items():
            if set(interaction_key) == particles_v3:
                c3_term = coeff
                break
        if c3_term is None:
            raise ValueError(f"Exact interaction match not found for {particles_v3}")

        if v3_type == VertexSFF:
            c3L, c3R = get_chiral_couplings(c3_term)
            v3 = v3_type(c3R, c3L) # Note: VertexSFF expects (Right, Left)
        elif v3_type == VertexVFF:
            c3L, c3R = get_chiral_couplings_gamma_mu(c3_term)
            v3 = v3_type(c3R, c3L) # Note: VertexVFF expects (Right, Left)
        else:
            raise TypeError(f"Unsupported vertex type for v3: {v3_type}")
        logging.info(f"Vertex 3 ({v3_desc}) coupling found: L={c3L}, R={c3R}")
    except (ValueError, TypeError) as e:
        logging.error(f"Vertex 3 interaction error for {diagram_name}: {e}")
        logging.error(f"Interaction Dict Searched (v3_interaction_func({nu_index}, {antilep_index})):")
        logging.error(interaction_dict_v3)
        raise

    # --- Diagram Instantiation ---
    mass_list = [
        external_scalar[1],         # mH10
        external_antilepton[2],     # ml[a]
        external_lepton[2],         # ml[b]
        internal_fermion[2],        # mn[i]
        internal_boson1[1],         # Mass of boson 1
        internal_boson2[1]          # Mass of boson 2
    ]
    logging.info(f"Mass List for {diagram_class.__name__}: {mass_list}")

    diagram = diagram_class(v1, v2, v3, mass_list)
    logging.info(f"Successfully created {diagram_name}")

    return diagram


def create_bubble_diagram(
    diagram_name: str,
    internal_fermion: tuple,
    internal_boson: tuple, # Tuple (particle_plus, particle_minus, mass_symbol)
    v1_target_lepton_index_symbol: Symbol, # a or b
    boson_type: str, # 'Scalar' or 'Vector'
    diagram_class: type # BubbleFS, BubbleFV, BubbleSF, BubbleVF
):
    """
    Creates a bubble diagram object based on the provided specifications.

    Args:
        diagram_name: A descriptive name for the diagram (for logging).
        internal_fermion: Tuple (particle, antiparticle, mass_symbol). e.g., (n[i], nadj[i], mn[i])
        internal_boson: Tuple (particle_plus, particle_minus, mass_symbol). e.g., (W1p, W1m, mW1)
        v1_target_lepton_index_symbol: The index symbol (a or b) for the external lepton line
                                    that vertex 1 (H10 coupling) connects to.
        boson_type: String 'Scalar' or 'Vector' indicating the type of the internal boson.
        diagram_class: The class for the overall bubble diagram (BubbleFS, BubbleFV, BubbleSF, BubbleVF).

    Returns:
        The instantiated bubble diagram object.

    Raises:
        ValueError: If interactions cannot be found or inputs are invalid.
    """
    logging.info(f"--- Creating Diagram: {diagram_name} ---")

    # Determine target and other lepton lines based on v1_target_lepton_index_symbol
    if v1_target_lepton_index_symbol == antilep_index: # a
        target_lepton = external_antilepton
        other_lepton = external_lepton
        target_lepton_index = antilep_index
        other_lepton_index = lepton_index
    elif v1_target_lepton_index_symbol == lepton_index: # b
        target_lepton = external_lepton
        other_lepton = external_antilepton
        target_lepton_index = lepton_index
        other_lepton_index = antilep_index
    else:
        raise ValueError(f"Invalid v1_target_lepton_index_symbol: {v1_target_lepton_index_symbol}. Must be 'a' or 'b'.")

    # Determine vertex types and interaction functions based on boson_type
    if boson_type == 'Scalar':
        v2_type = VertexSFF
        v3_type = VertexSFF
        v2_interaction_func = interactionsSp_n_l
        v3_interaction_func = interactionsSm_n_l
        coupling_extractor = get_chiral_couplings
    elif boson_type == 'Vector':
        v2_type = VertexVFF
        v3_type = VertexVFF
        v2_interaction_func = interactionsWp_n_l
        v3_interaction_func = interactionsWm_n_l
        coupling_extractor = get_chiral_couplings_gamma_mu
    else:
        raise ValueError(f"Invalid boson_type: {boson_type}. Must be 'Scalar' or 'Vector'.")

    internal_boson_plus = (internal_boson[0], internal_boson[2])
    internal_boson_minus = (internal_boson[1], internal_boson[2])

    # --- Vertex 1 Construction (H10 - target_lepton - target_antilepton) ---
    particles_v1 = {external_scalar[0], target_lepton[0], target_lepton[1]}
    v1_desc = f"{external_scalar[0].name}-{target_lepton[0].name}-{target_lepton[1].name}"
    interaction_dict_v1 = interactionsH10_ll(target_lepton_index)
    try:
        c1_term = find_interaction_coefficient(particles_v1, interaction_dict_v1, v1_desc)
        c1L, c1R = get_chiral_couplings(c1_term)
        v1 = VertexSFF(c1R, c1L) # Always SFF for H-l-l
        logging.info(f"Vertex 1 ({v1_desc}) coupling found: L={c1L}, R={c1R}")
    except ValueError as e:
        logging.error(f"Vertex 1 interaction error for {diagram_name}: {e}")
        raise

    # --- Vertex 2 Construction (InternalBoson+ - nadj - target_lepton) ---
    particles_v2 = {internal_boson_plus[0], internal_fermion[1], target_lepton[0]}
    v2_desc = f"{internal_boson_plus[0].name}-{internal_fermion[1].name}-{target_lepton[0].name}"
    interaction_dict_v2 = v2_interaction_func(nu_index, target_lepton_index)
    try:
        c2_term = next(coeff for interaction_key, coeff in interaction_dict_v2.items() if set(interaction_key) == particles_v2)
        c2L, c2R = coupling_extractor(c2_term)
        v2 = v2_type(c2R, c2L)
        logging.info(f"Vertex 2 ({v2_desc}) coupling found: L={c2L}, R={c2R}")
    except (StopIteration, ValueError) as e:
        logging.error(f"Vertex 2 interaction error for {diagram_name}: {e}")
        logging.error(f"Interaction Dict Searched (v2): {interaction_dict_v2}")
        raise ValueError(f"Exact interaction match not found for {particles_v2}") from e

    # --- Vertex 3 Construction (InternalBoson- - other_antilepton - n) ---
    particles_v3 = {internal_boson_minus[0], other_lepton[1], internal_fermion[0]}
    v3_desc = f"{internal_boson_minus[0].name}-{other_lepton[1].name}-{internal_fermion[0].name}"
    interaction_dict_v3 = v3_interaction_func(nu_index, other_lepton_index)
    try:
        c3_term = next(coeff for interaction_key, coeff in interaction_dict_v3.items() if set(interaction_key) == particles_v3)
        c3L, c3R = coupling_extractor(c3_term)
        v3 = v3_type(c3R, c3L)
        logging.info(f"Vertex 3 ({v3_desc}) coupling found: L={c3L}, R={c3R}")
    except (StopIteration, ValueError) as e:
        logging.error(f"Vertex 3 interaction error for {diagram_name}: {e}")
        logging.error(f"Interaction Dict Searched (v3): {interaction_dict_v3}")
        raise ValueError(f"Exact interaction match not found for {particles_v3}") from e

    # --- Diagram Instantiation ---
    mass_list = [
        external_antilepton[2],     # ml[a]
        external_lepton[2],         # ml[b]
        internal_fermion[2],        # mn[i]
        internal_boson[2]           # Mass of the internal boson (common mass)
    ]
    logging.info(f"Mass List for {diagram_class.__name__}: {mass_list}")

    diagram = diagram_class(v1, v2, v3, mass_list)
    logging.info(f"Successfully created {diagram_name}")

    return diagram

def create_triangle_diagram_two_fermion(
    diagram_name: str,
    internal_fermion1: tuple, # Tuple (particle, antiparticle, mass_symbol, index_symbol) e.g., (n[i], nadj[i], mn[i], i)
    internal_fermion2: tuple, # Tuple (particle, antiparticle, mass_symbol, index_symbol) e.g., (n[j], nadj[j], mn[j], j)
    internal_boson: tuple, # Tuple (particle_plus, particle_minus, mass_symbol) e.g., (W1p, W1m, mW1)
    boson_type: str, # 'Scalar' or 'Vector'
    diagram_class: type # TriangleSFF or TriangleVFF
):
    """
    Creates a triangle diagram object with two distinct internal fermions (e.g., n[i], n[j]).

    Args:
        diagram_name: A descriptive name for the diagram (for logging).
        internal_fermion1: Tuple (particle, antiparticle, mass_symbol, index_symbol) for the first fermion (e.g., n[i]).
        internal_fermion2: Tuple (particle, antiparticle, mass_symbol, index_symbol) for the second fermion (e.g., n[j]).
        internal_boson: Tuple (particle_plus, particle_minus, mass_symbol) for the internal boson.
        boson_type: String 'Scalar' or 'Vector' indicating the type of the internal boson.
        diagram_class: The class for the overall triangle diagram (TriangleSFF or TriangleVFF).

    Returns:
        The instantiated triangle diagram object.

    Raises:
        ValueError: If interactions cannot be found or inputs are invalid.
    """
    logging.info(f"--- Creating Diagram: {diagram_name} ---")

    fermion1_index = internal_fermion1[3]
    fermion2_index = internal_fermion2[3]

    # Determine vertex types and interaction functions based on boson_type
    if boson_type == 'Scalar':
        v2_type = VertexSFF
        v3_type = VertexSFF
        v2_interaction_func = interactionsSp_n_l
        v3_interaction_func = interactionsSm_n_l
        coupling_extractor = get_chiral_couplings
    elif boson_type == 'Vector':
        v2_type = VertexVFF
        v3_type = VertexVFF
        v2_interaction_func = interactionsWp_n_l
        v3_interaction_func = interactionsWm_n_l
        coupling_extractor = get_chiral_couplings_gamma_mu
    else:
        raise ValueError(f"Invalid boson_type: {boson_type}. Must be 'Scalar' or 'Vector'.")

    internal_boson_plus = (internal_boson[0], internal_boson[2])
    internal_boson_minus = (internal_boson[1], internal_boson[2])

    # --- Vertex 1 Construction (H10 - n[i] - nadj[j]) ---
    particles_v1 = {external_scalar[0], internal_fermion1[0], internal_fermion2[1]}
    v1_desc = f"{external_scalar[0].name}-{internal_fermion1[0].name}-{internal_fermion2[1].name}"
    interaction_dict_v1 = interactionsH10_nn(fermion1_index, fermion2_index)
    try:
        c1_term = find_interaction_coefficient(particles_v1, interaction_dict_v1, v1_desc)
        c1L, c1R = get_chiral_couplings(c1_term)
        v1 = VertexSFF(c1R, c1L) # Always SFF for H-n-n
        logging.info(f"Vertex 1 ({v1_desc}) coupling found: L={c1L}, R={c1R}")
    except ValueError as e:
        logging.error(f"Vertex 1 interaction error for {diagram_name}: {e}")
        raise

    # --- Vertex 2 Construction (InternalBoson+ - nadj[j] - l[b]) ---
    particles_v2 = {internal_boson_plus[0], internal_fermion2[1], external_lepton[0]}
    v2_desc = f"{internal_boson_plus[0].name}-{internal_fermion2[1].name}-{external_lepton[0].name}"
    interaction_dict_v2 = v2_interaction_func(fermion2_index, lepton_index)
    try:
        c2_term = next(coeff for interaction_key, coeff in interaction_dict_v2.items() if set(interaction_key) == particles_v2)
        c2L, c2R = coupling_extractor(c2_term)
        v2 = v2_type(c2R, c2L)
        logging.info(f"Vertex 2 ({v2_desc}) coupling found: L={c2L}, R={c2R}")
    except (StopIteration, ValueError) as e:
        logging.error(f"Vertex 2 interaction error for {diagram_name}: {e}")
        logging.error(f"Interaction Dict Searched (v2): {interaction_dict_v2}")
        raise ValueError(f"Exact interaction match not found for {particles_v2}") from e

    # --- Vertex 3 Construction (InternalBoson- - ladj[a] - n[i]) ---
    particles_v3 = {internal_boson_minus[0], external_antilepton[1], internal_fermion1[0]}
    v3_desc = f"{internal_boson_minus[0].name}-{external_antilepton[1].name}-{internal_fermion1[0].name}"
    interaction_dict_v3 = v3_interaction_func(fermion1_index, antilep_index)
    try:
        c3_term = next(coeff for interaction_key, coeff in interaction_dict_v3.items() if set(interaction_key) == particles_v3)
        c3L, c3R = coupling_extractor(c3_term)
        v3 = v3_type(c3R, c3L)
        logging.info(f"Vertex 3 ({v3_desc}) coupling found: L={c3L}, R={c3R}")
    except (StopIteration, ValueError) as e:
        logging.error(f"Vertex 3 interaction error for {diagram_name}: {e}")
        logging.error(f"Interaction Dict Searched (v3): {interaction_dict_v3}")
        raise ValueError(f"Exact interaction match not found for {particles_v3}") from e

    # --- Diagram Instantiation ---
    # Order for TriangleSFF/VFF: mH10, ml[a], ml[b], m_boson, m_fermion1, m_fermion2
    mass_list = [
        external_scalar[1],         # mH10
        external_antilepton[2],     # ml[a]
        external_lepton[2],         # ml[b]
        internal_boson[2],          # Mass of the internal boson
        internal_fermion1[2],       # mn[i]
        internal_fermion2[2]        # mn[j]
    ]
    logging.info(f"Mass List for {diagram_class.__name__}: {mass_list}")

    diagram = diagram_class(v1, v2, v3, mass_list)
    logging.info(f"Successfully created {diagram_name}")

    return diagram
################################33
# Diagram Creation Calls
################################33

# Example usage (replace the old blocks with calls like this):
# Note: You would need to define all internal particle tuples first
internal_neutrino = (n[nu_index], nadj[nu_index], mn[nu_index])
# Define internal neutrinos with indices for two-fermion loops
nu_index_i = i # Use existing i
nu_index_j = j # Use existing j
internal_neutrino_i = (n[nu_index_i], nadj[nu_index_i], mn[nu_index_i], nu_index_i)
internal_neutrino_j = (n[nu_index_j], nadj[nu_index_j], mn[nu_index_j], nu_index_j)
internal_GL_plus = (GLp, mW1)
internal_GL_minus = (GLm, mW1)
internal_GR_plus = (GRp, mW2)
internal_GR_minus = (GRm, mW2)
internal_HR_plus = (HRp, mHR)
internal_HR_minus = (HRm, mHR)
internal_HL_plus = (HLp, mHL)
internal_HL_minus = (HLm, mHL)
internal_W1_plus = (W1p, mW1)
internal_W1_minus = (W1m, mW1)
internal_W2_plus = (W2p, mW2)
internal_W2_minus = (W2m, mW2)

# Define internal boson tuples for bubbles
internal_W1_boson = (W1p, W1m, mW1)
internal_W2_boson = (W2p, W2m, mW2)
internal_GL_boson = (GLp, GLm, mW1)
internal_GR_boson = (GRp, GRm, mW2)
internal_HR_boson = (HRp, HRm, mHR)

#################
# FSS Diagrams
#################

refactored_triangle_ni_GLp_GLm = create_triangle_diagram(
    "triangle_ni_GLp_GLm (FSS)",
    internal_neutrino, internal_GL_plus, internal_GL_minus,
    VertexSSS, interactionsH10_SS_dict_approx,
    VertexSFF, interactionsSp_n_l,
    VertexSFF, interactionsSm_n_l,
    TriangleFSS
)

refactored_triangle_ni_GRp_GRm = create_triangle_diagram(
    "triangle_ni_GRp_GRm (FSS)",
    internal_neutrino, internal_GR_plus, internal_GR_minus,
    VertexSSS, interactionsH10_SS_dict_approx,
    VertexSFF, interactionsSp_n_l,
    VertexSFF, interactionsSm_n_l,
    TriangleFSS
)

refactored_triangle_ni_HRp_HRm = create_triangle_diagram(
    "triangle_ni_HRp_HRm (FSS)",
    internal_neutrino, internal_HR_plus, internal_HR_minus,
    VertexSSS, interactionsH10_SS_dict_approx,
    VertexSFF, interactionsSp_n_l,
    VertexSFF, interactionsSm_n_l,
    TriangleFSS
)

refactored_triangle_ni_GRp_HRm = create_triangle_diagram(
    "triangle_ni_GRp_HRm (FSS)",
    internal_neutrino, internal_GR_plus, internal_HR_minus,
    VertexSSS, interactionsH10_SS_dict_approx,
    VertexSFF, interactionsSp_n_l,
    VertexSFF, interactionsSm_n_l,
    TriangleFSS
)

refactored_triangle_ni_HRp_GRm = create_triangle_diagram(
    "triangle_ni_HRp_GRm (FSS)",
    internal_neutrino, internal_HR_plus, internal_GR_minus,
    VertexSSS, interactionsH10_SS_dict_approx,
    VertexSFF, interactionsSp_n_l,
    VertexSFF, interactionsSm_n_l,
    TriangleFSS
)

################
# FVV Diagrams
################
refactored_triangle_ni_W1p_W1m = create_triangle_diagram(
    "triangle_ni_W1p_W1m (FVV)",
    internal_neutrino, internal_W1_plus, internal_W1_minus,
    VertexSVV, interactionsH10_WW_dict_approx,
    VertexVFF, interactionsWp_n_l,
    VertexVFF, interactionsWm_n_l,
    TriangleFVV
)

refactored_triangle_ni_W2p_W2m = create_triangle_diagram(
    "triangle_ni_W2p_W2m (FVV)",
    internal_neutrino, internal_W2_plus, internal_W2_minus,
    VertexSVV, interactionsH10_WW_dict_approx,
    VertexVFF, interactionsWp_n_l,
    VertexVFF, interactionsWm_n_l,
    TriangleFVV
)

##################
# FSV Diagrams
##################

refactored_triangle_ni_W1p_GLm = create_triangle_diagram(
    "triangle_ni_W1p_GLm (FSV)",
    internal_neutrino, internal_W1_plus, internal_GL_minus, # Boson1=V+, Boson2=S-
    VertexSVpSm, interactionsH10_WpSm_dict_approx,
    VertexVFF, interactionsWp_n_l, # VFF for W1p vertex
    VertexSFF, interactionsSm_n_l, # SFF for GLm vertex
    TriangleFSV
)

refactored_triangle_ni_W2p_GRm = create_triangle_diagram(
    "triangle_ni_W2p_GRm (FSV)",
    internal_neutrino, internal_W2_plus, internal_GR_minus, # Boson1=V+, Boson2=S-
    VertexSVpSm, interactionsH10_WpSm_dict_approx,
    VertexVFF, interactionsWp_n_l, # VFF for W2p vertex
    VertexSFF, interactionsSm_n_l, # SFF for GRm vertex
    TriangleFSV
)

refactored_triangle_ni_W2p_HRm = create_triangle_diagram(
    "triangle_ni_W2p_HRm (FSV)",
    internal_neutrino, internal_W2_plus, internal_HR_minus, # Boson1=V+, Boson2=S-
    VertexSVpSm, interactionsH10_WpSm_dict_approx,
    VertexVFF, interactionsWp_n_l, # VFF for W2p vertex
    VertexSFF, interactionsSm_n_l, # SFF for HRm vertex
    TriangleFSV
)

###################
# FVS Diagrams
###################

refactored_triangle_ni_GLp_W1m = create_triangle_diagram(
    "triangle_ni_GLp_W1m (FVS)",
    internal_neutrino, internal_GL_plus, internal_W1_minus, # Boson1=S+, Boson2=V-
    VertexSSpVm, interactionsH10_WmSp_dict_approx,
    VertexSFF, interactionsSp_n_l, # SFF for GLp vertex
    VertexVFF, interactionsWm_n_l, # VFF for W1m vertex
    TriangleFVS
)

refactored_triangle_ni_GRp_W2m = create_triangle_diagram(
    "triangle_ni_GRp_W2m (FVS)",
    internal_neutrino, internal_GR_plus, internal_W2_minus, # Boson1=S+, Boson2=V-
    VertexSSpVm, interactionsH10_WmSp_dict_approx,
    VertexSFF, interactionsSp_n_l, # SFF for GRp vertex
    VertexVFF, interactionsWm_n_l, # VFF for W2m vertex
    TriangleFVS
)

refactored_triangle_ni_HRp_W2m = create_triangle_diagram(
    "triangle_ni_HRp_W2m (FVS)",
    internal_neutrino, internal_HR_plus, internal_W2_minus, # Boson1=S+, Boson2=V-
    VertexSSpVm, interactionsH10_WmSp_dict_approx,
    VertexSFF, interactionsSp_n_l, # SFF for HRp vertex
    VertexVFF, interactionsWm_n_l, # VFF for W2m vertex
    TriangleFVS
)

####################
# Bubble Diagrams
####################

# BubbleFV (Vector boson, v1 connects to l[b])
refactored_bubble_ni_W1 = create_bubble_diagram(
    "bubble_ni_W1 (FV)",
    internal_neutrino, internal_W1_boson,
    lepton_index, # v1 connects to b
    'Vector',
    BubbleFV
)

refactored_bubble_ni_W2 = create_bubble_diagram(
    "bubble_ni_W2 (FV)",
    internal_neutrino, internal_W2_boson,
    lepton_index, # v1 connects to b
    'Vector',
    BubbleFV
)

# BubbleVF (Vector boson, v1 connects to l[a])
refactored_bubble_W1_ni = create_bubble_diagram(
    "bubble_W1_ni (VF)",
    internal_neutrino, internal_W1_boson,
    antilep_index, # v1 connects to a
    'Vector',
    BubbleVF
)

refactored_bubble_W2_ni = create_bubble_diagram(
    "bubble_W2_ni (VF)",
    internal_neutrino, internal_W2_boson,
    antilep_index, # v1 connects to a
    'Vector',
    BubbleVF
)

# BubbleFS (Scalar boson, v1 connects to l[b])
# Note: HL does not couple to leptons, so no HL bubble.
refactored_bubble_ni_GL = create_bubble_diagram(
    "bubble_ni_GL (FS)",
    internal_neutrino, internal_GL_boson, 
    lepton_index, 'Scalar', 
    BubbleFS)
refactored_bubble_ni_GR = create_bubble_diagram(
    "bubble_ni_GR (FS)",
    internal_neutrino, internal_GR_boson, 
    lepton_index, 'Scalar', 
    BubbleFS)
refactored_bubble_ni_HR = create_bubble_diagram(
    "bubble_ni_HR (FS)",
    internal_neutrino, internal_HR_boson, 
    lepton_index, 'Scalar', 
    BubbleFS)

# BubbleSF (Scalar boson, v1 connects to l[a])
refactored_bubble_GL_ni = create_bubble_diagram(
    "bubble_GL_ni (SF)",
    internal_neutrino, internal_GL_boson, 
    antilep_index, 'Scalar',
    BubbleSF)
refactored_bubble_GR_ni = create_bubble_diagram(
    "bubble_GR_ni (SF)",
    internal_neutrino, internal_GR_boson, 
    antilep_index, 'Scalar',
    BubbleSF)
refactored_bubble_HR_ni = create_bubble_diagram(
    "bubble_HR_ni (SF)",
    internal_neutrino, internal_HR_boson, 
    antilep_index, 'Scalar',
    BubbleSF)

#################################
# Triangle Two-Fermion Diagrams
#################################

# TriangleSFF (Scalar boson, n[i], n[j])
refactored_triangle_GL_ninj = create_triangle_diagram_two_fermion(
    "triangle_GL_ninj (SFF)",
    internal_neutrino_i, internal_neutrino_j, internal_GL_boson,
    'Scalar', TriangleSFF
)

refactored_triangle_GR_ninj = create_triangle_diagram_two_fermion(
    "triangle_GR_ninj (SFF)",
    internal_neutrino_i, internal_neutrino_j, internal_GR_boson,
    'Scalar', TriangleSFF
)

refactored_triangle_HR_ninj = create_triangle_diagram_two_fermion(
    "triangle_HR_ninj (SFF)",
    internal_neutrino_i, internal_neutrino_j, internal_HR_boson,
    'Scalar', TriangleSFF
)

# TriangleVFF (Vector boson, n[i], n[j])
refactored_triangle_W1_ninj = create_triangle_diagram_two_fermion(
    "triangle_W1_ninj (VFF)",
    internal_neutrino_i, internal_neutrino_j, internal_W1_boson,
    'Vector', TriangleVFF
)

refactored_triangle_W2_ninj = create_triangle_diagram_two_fermion(
    "triangle_W2_ninj (VFF)",
    internal_neutrino_i, internal_neutrino_j, internal_W2_boson,
    'Vector', TriangleVFF
)

# You would then replace all the original diagram creation blocks with calls
# to create_triangle_diagram, passing the correct arguments for each case.
# Store the results in a dictionary if needed:
all_diagrams = {}
all_diagrams["ni_GLp_GLm"] = refactored_triangle_ni_GLp_GLm
all_diagrams["ni_GRp_GRm"] = refactored_triangle_ni_GRp_GRm
all_diagrams["ni_HRp_HRm"] = refactored_triangle_ni_HRp_HRm
all_diagrams["ni_GRp_HRm"] = refactored_triangle_ni_GRp_HRm
all_diagrams["ni_HRp_GRm"] = refactored_triangle_ni_HRp_GRm
all_diagrams["ni_W1p_W1m"] = refactored_triangle_ni_W1p_W1m
all_diagrams["ni_W2p_W2m"] = refactored_triangle_ni_W2p_W2m
all_diagrams["ni_W1p_GLm"] = refactored_triangle_ni_W1p_GLm
all_diagrams["ni_W2p_GRm"] = refactored_triangle_ni_W2p_GRm
all_diagrams["ni_W2p_HRm"] = refactored_triangle_ni_W2p_HRm
all_diagrams["ni_GLp_W1m"] = refactored_triangle_ni_GLp_W1m
all_diagrams["ni_GRp_W2m"] = refactored_triangle_ni_GRp_W2m
all_diagrams["ni_HRp_W2m"] = refactored_triangle_ni_HRp_W2m

# Add bubble diagrams to the dictionary
all_diagrams["ni_W1"] = refactored_bubble_ni_W1
all_diagrams["ni_W2"] = refactored_bubble_ni_W2
all_diagrams["W1_ni"] = refactored_bubble_W1_ni
all_diagrams["W2_ni"] = refactored_bubble_W2_ni
all_diagrams["ni_GL"] = refactored_bubble_ni_GL
all_diagrams["ni_GR"] = refactored_bubble_ni_GR
all_diagrams["ni_HR"] = refactored_bubble_ni_HR
all_diagrams["GL_ni"] = refactored_bubble_GL_ni
all_diagrams["GR_ni"] = refactored_bubble_GR_ni
all_diagrams["HR_ni"] = refactored_bubble_HR_ni

# Add two-fermion triangle diagrams to the dictionary
all_diagrams["GL_ninj"] = refactored_triangle_GL_ninj
all_diagrams["GR_ninj"] = refactored_triangle_GR_ninj
all_diagrams["HR_ninj"] = refactored_triangle_HR_ninj
all_diagrams["W1_ninj"] = refactored_triangle_W1_ninj
all_diagrams["W2_ninj"] = refactored_triangle_W2_ninj

print(f"{len(all_diagrams)} diagrams created and stored in all_diagrams dictionary.")