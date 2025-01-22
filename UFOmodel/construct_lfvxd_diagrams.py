from UFOexplorerSympy3 import ProjM, ProjP, Gamma
from LFVXD import Hdecay_diagrams as D
from LFVXD import vertexes as v_lfvxd

def extract_chiral_coefficients_optimized(vertex, ufo_model):
    """
    Extract the coefficients of ProjP and ProjM from a given Feynman rule for a vertex.
    :param vertex: Vertex object containing particles and couplings.
    :param ufo_model: Instance of the UFOModelExplorer.
    :return: Dictionary with coefficients of ProjP and ProjM indexed by specific indices.
    """

    # Get the Feynman rule
    feynman_rule = ufo_model.generate_symbolic_feynman_rule(vertex)

    # Initialize dictionary to store coefficients
    coefficients = {}

    # Split the Feynman rule into terms
    terms = feynman_rule.expand().as_ordered_terms()

    # Loop through terms to identify ProjP and ProjM terms
    for term in terms:
        # Find all instances of ProjP in the term
        proj_p_instances = term.atoms(ProjP)
        for proj in proj_p_instances:
            indices = proj.args  # Extract indices from ProjP(i, j)
            coefficient = term.coeff(proj)
            coefficients[(indices[0], indices[1], 'ProjP')] = coefficient

        # Find all instances of ProjM in the term
        proj_m_instances = term.atoms(ProjM)
        for proj in proj_m_instances:
            indices = proj.args  # Extract indices from ProjM(i, j)
            coefficient = term.coeff(proj)
            coefficients[(indices[0], indices[1], 'ProjM')] = coefficient

    return coefficients

def extract_chiral_coefficients_vertexlfv(vertex, ufo_model):
    """
    Extract the chiral coefficients ProjP and ProjM from the Feynman rule for a given vertex.
    :param vertex: The vertex object containing the particles and couplings.
    :param ufo_model: Instance of the UFOModelExplorer.
    :return: A dictionary with keys 'ProjP' and 'ProjM' mapping to their respective coefficients.
    """
    # Initialize coefficients
    XR = None
    XL = None

    # Extract chiral coefficients
    coeff_dict = extract_chiral_coefficients_optimized(vertex, ufo_model=ufo_model)

    # Process the coefficients
    for key, value in coeff_dict.items():
        #print(f"Key: {key}, Coefficient: {value}")
        if key[2] == 'ProjM':
            XL = value
        elif key[2] == 'ProjP':
            XR = value
        else:
            raise ValueError(f"Unexpected projection operator: {key[2]}")

    # Check if coefficients were found
    if XR is None:
        print(f"Warning: XR (ProjP coefficient) not found in the Feynman rule of vertex {vertex} with paticles {vertex.particles}.")
        XR = 0
    if XL is None:
        print(f"Warning: XL (ProjM coefficient) not found in the Feynman rule of vertex {vertex} with paticles {vertex.particles}.")
        XL = 0

    # Return the coefficients in a dictionary
    return {'ProjP': XR, 'ProjM': XL}

def extract_lorentz_coefficients_vertex_XFF(vertex, ufo_model):
        """
        Extract the coefficients of Lorentz structures for a given vertex  of type XFF with X = S,V.
        If a Lorentz structure contains 'ProjP' or 'ProjM', use these as keys in the dictionary.

        :param vertex: The vertex object containing particles and their interactions.
        :param ufo_model: Instance of the UFOModelExplorer containing the UFO model data.
        :return: Dictionary of Lorentz structure names ('ProjP', 'ProjM', or original names) and their coefficients.
        """
        # Step 1: Extract Lorentz structures and their symbolic representations
        lorentz_structures = {ltz.name: ltz for ltz in vertex.lorentz}
        lorentz_sympified = ufo_model.sympify_lorentz(lorentz_names=list(lorentz_structures.keys()))

        # Step 2: Expand the Feynman rule for the vertex
        feynman_rule_expanded = ufo_model.generate_symbolic_feynman_rule(vertex).expand()

        # Step 3: Extract coefficients for each Lorentz structure
        coefficients_lorentz = {}
        for ltz_name, ltz_sympy in lorentz_sympified.items():
            if ltz_sympy.has(ProjP) and ltz_sympy.has(ProjM):
                terms = feynman_rule_expanded.as_ordered_terms()
                # Loop through terms to identify ProjP and ProjM terms
                for term in terms:
                    # Find all instances of ProjP in the term
                    proj_p_instances = term.atoms(ProjP)
                    for proj in proj_p_instances:
                        coefficient = term.coeff(proj)
                        coefficients_lorentz['ProjP'] = coefficient

                    # Find all instances of ProjM in the term
                    proj_m_instances = term.atoms(ProjM)
                    for proj in proj_m_instances:
                        coefficient = term.coeff(proj)
                        coefficients_lorentz['ProjM'] = coefficient
            else:
                coeff = feynman_rule_expanded.coeff(ltz_sympy)
                ltz_terms = ltz_sympy.as_ordered_terms()

                # Check if 'ProjP' or 'ProjM' appears in the Lorentz structure
                for term in ltz_terms:
                    if term.has(ProjP):
                        coefficients_lorentz['ProjP'] = coeff
                    if term.has(ProjM):
                        coefficients_lorentz['ProjM'] = coeff

        # Step 4: Print the results (optional, can be commented out if unnecessary)
        #for proj, coeff in coefficients_lorentz.items():
        #    print(f"Lorentz: {proj}")
        #    print(f"Coefficient: {coeff}")

        return coefficients_lorentz

def extract_lorentz_coefficients_vertex_SVV(vertex, ufo_model):
        """
        Extract the coefficient of Lorentz structure for a given vertex  of type SVV.

        :param vertex: The vertex object containing particles and their interactions.
        :param ufo_model: Instance of the UFOModelExplorer containing the UFO model data.
        :return: the coefficient of the Lorentz structure.
        """
        # Step 1: Extract Lorentz structures and their symbolic representations
        lorentz_structures = {ltz.name: ltz for ltz in vertex.lorentz}
        lorentz_sympified = ufo_model.sympify_lorentz(lorentz_names=list(lorentz_structures.keys()))

        # Step 2: Feynman rule for the vertex
        feynman_rule = ufo_model.generate_symbolic_feynman_rule(vertex)

        # Step 3: Extract coefficients for each Lorentz structure
        for ltz_name, ltz_sympy in lorentz_sympified.items():
            coeff = feynman_rule.coeff(ltz_sympy)
            # Step 4: Print the results (optional, can be commented out if unnecessary)
            #print(f"Lorentz: {ltz_sympy}")
            #print(f"Coefficient: {coeff}")

        return coeff


def construct_triangle_diagram_FSS(
    loop_fermion, scalar1, scalar2, external_scalars, external_fermions, ufo_model
):
    """
    Construct a triangle diagram FSS for Higgs decay with charge conservation checks and caching.
    """

    # Log particle names
    print(f"External scalar: {external_scalars[0]}")
    print(f"External fermions: {external_fermions}")
    print(f"Loop fermion: {loop_fermion}")
    print(f"Scalars in loop: {scalar1}, {scalar2}")

    # Charge conservation checks
    ufo_model.check_vertex_charge_conservation(
        [scalar1, scalar2, external_scalars[0]],
        relation=lambda Q: Q[0] + Q[1] == Q[2]
    )
    ufo_model.check_vertex_charge_conservation(
        [loop_fermion, scalar1, external_fermions[0]],
        relation=lambda Q: Q[0] == Q[1] + Q[2]
    )
    ufo_model.check_vertex_charge_conservation(
        [loop_fermion, scalar2, external_fermions[1]],
        relation=lambda Q: Q[0] == Q[1] + Q[2]
    )

    # Retrieve vertices
    vertex_scalar_scalar_scalar = ufo_model.find_vertices_involving(
        [external_scalars[0], scalar1, scalar2], number_particles=3
    )
    if not vertex_scalar_scalar_scalar:
        raise ValueError(f"No vertex found for particles: {external_scalars[0]}, {scalar1}, {scalar2}")
    vertex_scalar_scalar_scalar = vertex_scalar_scalar_scalar[0]

    vertex_scalar_fermion_a = ufo_model.find_vertices_involving(
        [scalar1, loop_fermion, external_fermions[0]], number_particles=3
    )
    if not vertex_scalar_fermion_a:
        raise ValueError(f"No vertex found for particles: {scalar1}, {loop_fermion}, {external_fermions[0]}")
    vertex_scalar_fermion_a = vertex_scalar_fermion_a[0]

    vertex_scalar_fermion_b = ufo_model.find_vertices_involving(
        [scalar2, loop_fermion, external_fermions[1]], number_particles=3
    )
    if not vertex_scalar_fermion_b:
        raise ValueError(f"No vertex found for particles: {scalar2}, {loop_fermion}, {external_fermions[1]}")
    vertex_scalar_fermion_b = vertex_scalar_fermion_b[0]

    # Retrieve cached Feynman rules
    coeff_scalar_scalar_scalar = ufo_model.get_cached_feynman_rule(vertex_scalar_scalar_scalar).factor()
    print(f'Coefficient vertex {external_scalars[0]}-{scalar1}-{scalar2}: \n', coeff_scalar_scalar_scalar)
    chiral_coeff_scalar_fermion_a = extract_lorentz_coefficients_vertex_XFF(vertex_scalar_fermion_a, ufo_model)
    print(f'Coefficient vertex {scalar1}-{external_fermions[0]}-{loop_fermion}: \n', chiral_coeff_scalar_fermion_a)
    chiral_coeff_scalar_fermion_b = extract_lorentz_coefficients_vertex_XFF(vertex_scalar_fermion_b, ufo_model)
    print(f'Coefficient vertex {scalar2}-{external_fermions[1]}-{loop_fermion}: \n', chiral_coeff_scalar_fermion_b)

    # Retrieve cached masses
    M_loop_fermion = ufo_model.cached_masses.get(loop_fermion, 0)
    M_scalar1 = ufo_model.cached_masses.get(scalar1, 0)
    M_scalar2 = ufo_model.cached_masses.get(scalar2, 0)
    M_ext_scalar = ufo_model.cached_masses.get(external_scalars[0], 0)
    M_ext_fermion_a = ufo_model.cached_masses.get(external_fermions[0], 0)
    M_ext_fermion_b = ufo_model.cached_masses.get(external_fermions[1], 0)

    # Build diagram
    return D.TriangleFSS(
        v_lfvxd.VertexSSS(coeff_scalar_scalar_scalar),
        v_lfvxd.VertexSFF(
            cR=chiral_coeff_scalar_fermion_a.get('ProjP', 0),
            cL=chiral_coeff_scalar_fermion_a.get('ProjM', 0)
        ),
        v_lfvxd.VertexSFF(
            cR=chiral_coeff_scalar_fermion_b.get('ProjP', 0),
            cL=chiral_coeff_scalar_fermion_b.get('ProjM', 0)
        ),
        [M_ext_scalar, M_ext_fermion_a, M_ext_fermion_b, M_loop_fermion, M_scalar1, M_scalar2]
    )

def construct_triangle_diagram_FVV(
    loop_fermion, vector1, vector2, external_scalars, external_fermions, ufo_model
):
    """
    Construct a triangle diagram FSS for Higgs decay with charge conservation checks and caching.
    """

    # Log particle names
    print(f"External scalar: {external_scalars[0]}")
    print(f"External fermions: {external_fermions}")
    print(f"Loop fermion: {loop_fermion}")
    print(f"Vectors in loop: {vector1}, {vector2}")

    # Charge conservation checks
    ufo_model.check_vertex_charge_conservation(
        [vector1, vector2, external_scalars[0]],
        relation=lambda Q: Q[0] + Q[1] == Q[2]
    )
    ufo_model.check_vertex_charge_conservation(
        [loop_fermion, vector1, external_fermions[0]],
        relation=lambda Q: Q[0] == Q[1] + Q[2]
    )
    ufo_model.check_vertex_charge_conservation(
        [loop_fermion, vector2, external_fermions[1]],
        relation=lambda Q: Q[0] == Q[1] + Q[2]
    )

    # Retrieve vertices
    vertex_scalar_vector_vector = ufo_model.find_vertices_involving(
        [external_scalars[0], vector1, vector2], number_particles=3
    )
    if not vertex_scalar_vector_vector:
        raise ValueError(f"No vertex found for particles: {external_scalars[0]}, {vector1}, {vector2}")
    vertex_scalar_vector_vector = vertex_scalar_vector_vector[0]

    vertex_vector_fermion_a = ufo_model.find_vertices_involving(
        [vector1, loop_fermion, external_fermions[0]], number_particles=3
    )
    if not vertex_vector_fermion_a:
        raise ValueError(f"No vertex found for particles: {vector1}, {loop_fermion}, {external_fermions[0]}")
    vertex_vector_fermion_a = vertex_vector_fermion_a[0]

    vertex_vector_fermion_b = ufo_model.find_vertices_involving(
        [vector2, loop_fermion, external_fermions[1]], number_particles=3
    )
    if not vertex_vector_fermion_b:
        raise ValueError(f"No vertex found for particles: {vector2}, {loop_fermion}, {external_fermions[1]}")
    vertex_vector_fermion_b = vertex_vector_fermion_b[0]

    # Retrieve cached Feynman rules
    coeff_scalar_vector_vector = extract_lorentz_coefficients_vertex_SVV(vertex_scalar_vector_vector, ufo_model).factor()
    print(f'Coefficient vertex {external_scalars[0]}-{vector1}-{vector2}: \n', coeff_scalar_vector_vector)
    chiral_coeff_vector_fermion_a = extract_lorentz_coefficients_vertex_XFF(vertex_vector_fermion_a, ufo_model)
    print(f'Coefficient vertex {vector1}-{external_fermions[0]}-{loop_fermion}: \n', chiral_coeff_vector_fermion_a)
    chiral_coeff_vector_fermion_b = extract_lorentz_coefficients_vertex_XFF(vertex_vector_fermion_b, ufo_model)
    print(f'Coefficient vertex {vector2}-{external_fermions[1]}-{loop_fermion}: \n', chiral_coeff_vector_fermion_b)

    # Retrieve cached masses
    M_loop_fermion = ufo_model.cached_masses.get(loop_fermion, 0)
    M_vector1 = ufo_model.cached_masses.get(vector1, 0)
    M_vector2 = ufo_model.cached_masses.get(vector2, 0)
    M_ext_scalar = ufo_model.cached_masses.get(external_scalars[0], 0)
    M_ext_fermion_a = ufo_model.cached_masses.get(external_fermions[0], 0)
    M_ext_fermion_b = ufo_model.cached_masses.get(external_fermions[1], 0)

    # Build diagram
    return D.TriangleFVV(
        v_lfvxd.VertexSVV(coeff_scalar_vector_vector),
        v_lfvxd.VertexVFF(
            cR=chiral_coeff_vector_fermion_a.get('ProjP', 0),
            cL=chiral_coeff_vector_fermion_a.get('ProjM', 0)
        ),
        v_lfvxd.VertexVFF(
            cR=chiral_coeff_vector_fermion_b.get('ProjM', 0),
            cL=chiral_coeff_vector_fermion_b.get('ProjM', 0)
        ),
        [M_ext_scalar, M_ext_fermion_a, M_ext_fermion_b, M_loop_fermion, M_vector1, M_vector2]
    )

def construct_triangle_diagram_FVS(
    loop_fermion, vector, scalar, external_scalars, external_fermions, ufo_model
):
    """
    Construct a triangle diagram FVS for Higgs decay with charge conservation checks and caching.
    """

    # Log particle names
    print(f"External scalar: {external_scalars[0]}")
    print(f"External fermions: {external_fermions}")
    print(f"Loop fermion: {loop_fermion}")
    print(f"Vector and scalar in loop: {vector}, {scalar}")

    # Charge conservation checks
    ufo_model.check_vertex_charge_conservation(
        [vector, scalar, external_scalars[0]],
        relation=lambda Q: Q[0] + Q[1] == Q[2]
    )
    ufo_model.check_vertex_charge_conservation(
        [loop_fermion, vector, external_fermions[0]],
        relation=lambda Q: Q[0] == Q[1] + Q[2]
    )
    ufo_model.check_vertex_charge_conservation(
        [loop_fermion, scalar, external_fermions[1]],
        relation=lambda Q: Q[0] == Q[1] + Q[2]
    )

    # Retrieve vertices
    vertex_scalar_vector_scalar = ufo_model.find_vertices_involving(
        [external_scalars[0], vector, scalar], number_particles=3
    )
    if not vertex_scalar_vector_scalar:
        raise ValueError(f"No vertex found for particles: {external_scalars[0]}, {vector}, {scalar}")
    vertex_scalar_vector_scalar = vertex_scalar_vector_scalar[0]

    vertex_vector_fermion_a = ufo_model.find_vertices_involving(
        [vector, loop_fermion, external_fermions[0]], number_particles=3
    )
    if not vertex_vector_fermion_a:
        raise ValueError(f"No vertex found for particles: {vector}, {loop_fermion}, {external_fermions[0]}")
    vertex_vector_fermion_a = vertex_vector_fermion_a[0]

    vertex_scalar_fermion_b = ufo_model.find_vertices_involving(
        [scalar, loop_fermion, external_fermions[1]], number_particles=3
    )
    if not vertex_scalar_fermion_b:
        raise ValueError(f"No vertex found for particles: {scalar}, {loop_fermion}, {external_fermions[1]}")
    vertex_scalar_fermion_b = vertex_scalar_fermion_b[0]

    # Retrieve cached Feynman rules
    coeff_scalar_vector_scalar = extract_lorentz_coefficients_vertex_SVV(vertex_scalar_vector_scalar, ufo_model).factor()
    print(f'Coefficient vertex {external_scalars[0]}-{vector}-{scalar}: \n', coeff_scalar_vector_scalar)
    chiral_coeff_vector_fermion_a = extract_lorentz_coefficients_vertex_XFF(vertex_vector_fermion_a, ufo_model)
    print(f'Coefficient vertex {vector}-{external_fermions[0]}-{loop_fermion}: \n', chiral_coeff_vector_fermion_a)
    chiral_coeff_scalar_fermion_b = extract_lorentz_coefficients_vertex_XFF(vertex_scalar_fermion_b, ufo_model)
    print(f'Coefficient vertex {scalar}-{external_fermions[1]}-{loop_fermion}: \n', chiral_coeff_scalar_fermion_b)


    # Retrieve cached masses
    M_loop_fermion = ufo_model.cached_masses.get(loop_fermion, 0)
    M_vector = ufo_model.cached_masses.get(vector, 0)
    M_scalar = ufo_model.cached_masses.get(scalar, 0)
    M_ext_scalar = ufo_model.cached_masses.get(external_scalars[0], 0)
    M_ext_fermion_a = ufo_model.cached_masses.get(external_fermions[0], 0)
    M_ext_fermion_b = ufo_model.cached_masses.get(external_fermions[1], 0)

    # Build diagram
    return D.TriangleFVV(
        v_lfvxd.VertexVSS(coeff_scalar_vector_scalar),
        v_lfvxd.VertexVFF(
            cR=chiral_coeff_vector_fermion_a.get('ProjP', 0),
            cL=chiral_coeff_vector_fermion_a.get('ProjM', 0)
        ),
        v_lfvxd.VertexSFF(
            cR=chiral_coeff_scalar_fermion_b.get('ProjM', 0),
            cL=chiral_coeff_scalar_fermion_b.get('ProjM', 0)
        ),
        [M_ext_scalar, M_ext_fermion_a, M_ext_fermion_b, M_loop_fermion, M_vector, M_scalar]
    )

def construct_triangle_diagram_FSV(
    loop_fermion, scalar, vector, external_scalars, external_fermions, ufo_model
):
    """
    Construct a triangle diagram FSV for Higgs decay with charge conservation checks and caching.
    """

    # Log particle names
    print(f"External scalar: {external_scalars[0]}")
    print(f"External fermions: {external_fermions}")
    print(f"Loop fermion: {loop_fermion}")
    print(f"Scalar and vector in loop: {scalar}, {vector}")

    # Charge conservation checks
    ufo_model.check_vertex_charge_conservation(
        [scalar, vector, external_scalars[0]],
        relation=lambda Q: Q[0] + Q[1] == Q[2]
    )
    ufo_model.check_vertex_charge_conservation(
        [loop_fermion, scalar, external_fermions[0]],
        relation=lambda Q: Q[0] == Q[1] + Q[2]
    )
    ufo_model.check_vertex_charge_conservation(
        [loop_fermion, vector, external_fermions[1]],
        relation=lambda Q: Q[0] == Q[1] + Q[2]
    )

    # Retrieve vertices
    vertex_scalar_scalar_vector = ufo_model.find_vertices_involving(
        [external_scalars[0], scalar, vector], number_particles=3
    )
    if not vertex_scalar_scalar_vector:
        raise ValueError(f"No vertex found for particles: {external_scalars[0]}, {scalar}, {vector}")
    vertex_scalar_scalar_vector = vertex_scalar_scalar_vector[0]

    vertex_scalar_fermion_a = ufo_model.find_vertices_involving(
        [scalar, loop_fermion, external_fermions[0]], number_particles=3
    )
    if not vertex_scalar_fermion_a:
        raise ValueError(f"No vertex found for particles: {scalar}, {loop_fermion}, {external_fermions[0]}")
    vertex_scalar_fermion_a = vertex_scalar_fermion_a[0]

    vertex_vector_fermion_b = ufo_model.find_vertices_involving(
        [vector, loop_fermion, external_fermions[1]], number_particles=3
    )
    if not vertex_vector_fermion_b:
        raise ValueError(f"No vertex found for particles: {vector}, {loop_fermion}, {external_fermions[1]}")
    vertex_vector_fermion_b = vertex_vector_fermion_b[0]

    # Retrieve cached Feynman rules
    coeff_scalar_scalar_vector = extract_lorentz_coefficients_vertex_SVV(vertex_scalar_scalar_vector, ufo_model).factor()
    print(f'Coefficient vertex {external_scalars[0]}-{scalar}-{vector}: \n', coeff_scalar_scalar_vector)
    chiral_coeff_scalar_fermion_a = extract_lorentz_coefficients_vertex_XFF(vertex_scalar_fermion_a, ufo_model)
    print(f'Coefficient vertex {scalar}-{external_fermions[0]}-{loop_fermion}: \n', chiral_coeff_scalar_fermion_a)
    chiral_coeff_vector_fermion_b = extract_lorentz_coefficients_vertex_XFF(vertex_vector_fermion_b, ufo_model)
    print(f'Coefficient vertex {vector}-{external_fermions[1]}-{loop_fermion}: \n', chiral_coeff_vector_fermion_b)    

    # Retrieve cached masses
    M_loop_fermion = ufo_model.cached_masses.get(loop_fermion, 0)
    M_scalar = ufo_model.cached_masses.get(scalar, 0)
    M_vector = ufo_model.cached_masses.get(vector, 0)
    M_ext_scalar = ufo_model.cached_masses.get(external_scalars[0], 0)
    M_ext_fermion_a = ufo_model.cached_masses.get(external_fermions[0], 0)
    M_ext_fermion_b = ufo_model.cached_masses.get(external_fermions[1], 0)

    # Build diagram
    return D.TriangleFVV(
        v_lfvxd.VertexVSS(coeff_scalar_scalar_vector),
        v_lfvxd.VertexSFF(
            cR=chiral_coeff_scalar_fermion_a.get('ProjP', 0),
            cL=chiral_coeff_scalar_fermion_a.get('ProjM', 0)
        ),
        v_lfvxd.VertexVFF(
            cR=chiral_coeff_vector_fermion_b.get('ProjM', 0),
            cL=chiral_coeff_vector_fermion_b.get('ProjM', 0)
        ),
        [M_ext_scalar, M_ext_fermion_a, M_ext_fermion_b, M_loop_fermion, M_scalar, M_vector]
    )

def construct_triangle_diagram_FV(
    loop_fermion, vector, external_scalars, external_fermions, ufo_model
):
    """
    Construct a triangle diagram FV for Higgs decay with charge conservation checks and caching.
    """

    # Log particle names
    print(f"External scalar: {external_scalars[0]}")
    print(f"External fermions: {external_fermions}")
    print(f"Loop fermion: {loop_fermion}")
    print(f"Vector in loop: {vector}")

    # Charge conservation checks
    ufo_model.check_vertex_charge_conservation(
        [external_fermions[1], ufo_model.find_antiname(external_fermions[1]), external_scalars[0]],
        relation=lambda Q: Q[0] + Q[1] == Q[2]
    )
    ufo_model.check_vertex_charge_conservation(
        [loop_fermion, vector, external_fermions[0]],
        relation=lambda Q: Q[0] == Q[1] + Q[2]
    )
    ufo_model.check_vertex_charge_conservation(
        [loop_fermion, ufo_model.find_antiname(vector), external_fermions[1]],
        relation=lambda Q: Q[0] == Q[1] + Q[2]
    )

    # Retrieve vertices
    vertex_fermion_b = ufo_model.find_vertices_involving(
        [external_scalars[0], ufo_model.find_antiname(external_fermions[1]), external_fermions[1]], number_particles=3
    )
    if not vertex_fermion_b:
        raise ValueError(f"No vertex found for particles: {external_scalars[0]}, {ufo_model.find_antiname(external_fermions[1])}, {vector}")
    vertex_fermion_b = vertex_fermion_b[0]

    vertex_vector_fermion_a = ufo_model.find_vertices_involving(
        [vector, loop_fermion, external_fermions[0]], number_particles=3
    )
    if not vertex_vector_fermion_a:
        raise ValueError(f"No vertex found for particles: {vector}, {loop_fermion}, {external_fermions[0]}")
    vertex_vector_fermion_a = vertex_vector_fermion_a[0]

    vertex_vector_fermion_b = ufo_model.find_vertices_involving(
        [ufo_model.find_antiname(vector), loop_fermion, external_fermions[1]], number_particles=3
    )
    if not vertex_vector_fermion_b:
        raise ValueError(f"No vertex found for particles: {vector}, {loop_fermion}, {external_fermions[1]}")
    vertex_vector_fermion_b = vertex_vector_fermion_b[0]

    # Retrieve cached Feynman rules
    chiral_coeff_fermion_b = extract_lorentz_coefficients_vertex_XFF(vertex_fermion_b, ufo_model)
    print(f'Coefficient vertex {external_scalars[0]}-{external_fermions[1]}-{ufo_model.find_antiname(external_fermions[1])}: \n', chiral_coeff_fermion_b)
    chiral_coeff_vector_fermion_a = extract_lorentz_coefficients_vertex_XFF(vertex_vector_fermion_a, ufo_model)
    print(f'Coefficient vertex {vector}-{external_fermions[0]}-{loop_fermion}: \n', chiral_coeff_vector_fermion_a)
    chiral_coeff_vector_fermion_b = extract_lorentz_coefficients_vertex_XFF(vertex_vector_fermion_b, ufo_model)
    print(f'Coefficient vertex {ufo_model.find_antiname(vector)}-{external_fermions[1]}-{loop_fermion}: \n', chiral_coeff_vector_fermion_b)

    # Retrieve cached masses
    M_loop_fermion = ufo_model.cached_masses.get(loop_fermion, 0)
    M_vector = ufo_model.cached_masses.get(vector, 0)
    M_ext_scalar = ufo_model.cached_masses.get(external_scalars[0], 0)
    M_ext_fermion_a = ufo_model.cached_masses.get(external_fermions[0], 0)
    M_ext_fermion_b = ufo_model.cached_masses.get(external_fermions[1], 0)

    # Build diagram
    return D.BubbleFV(
        v_lfvxd.VertexSFF(
            cR=chiral_coeff_fermion_b.get('ProjP', 0),
            cL=chiral_coeff_fermion_b.get('ProjM', 0)
        ),
        v_lfvxd.VertexVFF(
            cR=chiral_coeff_vector_fermion_a.get('ProjP', 0),
            cL=chiral_coeff_vector_fermion_a.get('ProjM', 0)
        ),
        v_lfvxd.VertexVFF(
            cR=chiral_coeff_vector_fermion_b.get('ProjM', 0),
            cL=chiral_coeff_vector_fermion_b.get('ProjM', 0)
        ),
        [M_ext_fermion_a, M_ext_fermion_b, M_loop_fermion, M_vector]
    )

def construct_triangle_diagram_FS(
    loop_fermion, scalar, external_scalars, external_fermions, ufo_model
):
    """
    Construct a triangle diagram FS for Higgs decay with charge conservation checks and caching.
    """

    # Log particle names
    print(f"External scalar: {external_scalars[0]}")
    print(f"External fermions: {external_fermions}")
    print(f"Loop fermion: {loop_fermion}")
    print(f"Scalar in loop: {scalar}")

    # Charge conservation checks
    ufo_model.check_vertex_charge_conservation(
        [external_fermions[1], ufo_model.find_antiname(external_fermions[1]), external_scalars[0]],
        relation=lambda Q: Q[0] + Q[1] == Q[2]
    )
    ufo_model.check_vertex_charge_conservation(
        [loop_fermion, scalar, external_fermions[0]],
        relation=lambda Q: Q[0] == Q[1] + Q[2]
    )
    ufo_model.check_vertex_charge_conservation(
        [loop_fermion, ufo_model.find_antiname(scalar), external_fermions[1]],
        relation=lambda Q: Q[0] == Q[1] + Q[2]
    )

    # Retrieve vertices
    vertex_fermion_b = ufo_model.find_vertices_involving(
        [external_scalars[0], ufo_model.find_antiname(external_fermions[1]), external_fermions[1]], number_particles=3
    )
    if not vertex_fermion_b:
        raise ValueError(f"No vertex found for particles: {external_scalars[0]}, {ufo_model.find_antiname(external_fermions[1])}, {vector}")
    vertex_fermion_b = vertex_fermion_b[0]

    vertex_scalar_fermion_a = ufo_model.find_vertices_involving(
        [scalar, loop_fermion, external_fermions[0]], number_particles=3
    )
    if not vertex_scalar_fermion_a:
        raise ValueError(f"No vertex found for particles: {scalar}, {loop_fermion}, {external_fermions[0]}")
    vertex_scalar_fermion_a = vertex_scalar_fermion_a[0]

    vertex_scalar_fermion_b = ufo_model.find_vertices_involving(
        [ufo_model.find_antiname(scalar), loop_fermion, external_fermions[1]], number_particles=3
    )
    if not vertex_scalar_fermion_b:
        raise ValueError(f"No vertex found for particles: {scalar}, {loop_fermion}, {external_fermions[1]}")
    vertex_scalar_fermion_b = vertex_scalar_fermion_b[0]

    # Retrieve cached Feynman rules
    chiral_coeff_fermion_b = extract_lorentz_coefficients_vertex_XFF(vertex_fermion_b, ufo_model)
    print(f'Coefficient vertex {external_scalars[0]}-{external_fermions[1]}-{ufo_model.find_antiname(external_fermions[1])}: \n', chiral_coeff_fermion_b)
    chiral_coeff_scalar_fermion_a = extract_lorentz_coefficients_vertex_XFF(vertex_scalar_fermion_a, ufo_model)
    print(f'Coefficient vertex {scalar}-{external_fermions[0]}-{loop_fermion}: \n', chiral_coeff_scalar_fermion_a)
    chiral_coeff_scalar_fermion_b = extract_lorentz_coefficients_vertex_XFF(vertex_scalar_fermion_b, ufo_model)
    print(f'Coefficient vertex {ufo_model.find_antiname(scalar)}-{external_fermions[1]}-{loop_fermion}: \n', chiral_coeff_scalar_fermion_b)

    # Retrieve cached masses
    M_loop_fermion = ufo_model.cached_masses.get(loop_fermion, 0)
    M_scalar = ufo_model.cached_masses.get(scalar, 0)
    M_ext_scalar = ufo_model.cached_masses.get(external_scalars[0], 0)
    M_ext_fermion_a = ufo_model.cached_masses.get(external_fermions[0], 0)
    M_ext_fermion_b = ufo_model.cached_masses.get(external_fermions[1], 0)

    # Build diagram
    return D.BubbleFS(
        v_lfvxd.VertexSFF(
            cR=chiral_coeff_fermion_b.get('ProjP', 0),
            cL=chiral_coeff_fermion_b.get('ProjM', 0)
        ),
        v_lfvxd.VertexSFF(
            cR=chiral_coeff_scalar_fermion_a.get('ProjP', 0),
            cL=chiral_coeff_scalar_fermion_a.get('ProjM', 0)
        ),
        v_lfvxd.VertexSFF(
            cR=chiral_coeff_scalar_fermion_b.get('ProjM', 0),
            cL=chiral_coeff_scalar_fermion_b.get('ProjM', 0)
        ),
        [M_ext_fermion_a, M_ext_fermion_b, M_loop_fermion, M_scalar]
    )

def construct_triangle_diagram_VF(
    loop_fermion, vector, external_scalars, external_fermions, ufo_model
):
    """
    Construct a triangle diagram VF for Higgs decay with charge conservation checks and caching.
    """

    # Log particle names
    print(f"External scalar: {external_scalars[0]}")
    print(f"External fermions: {external_fermions}")
    print(f"Loop fermion: {loop_fermion}")
    print(f"Vector in loop: {vector}")

    # Charge conservation checks
    ufo_model.check_vertex_charge_conservation(
        [external_fermions[0], ufo_model.find_antiname(external_fermions[0]), external_scalars[0]],
        relation=lambda Q: Q[0] + Q[1] == Q[2]
    )
    ufo_model.check_vertex_charge_conservation(
        [loop_fermion, vector, external_fermions[0]],
        relation=lambda Q: Q[0] == Q[1] + Q[2]
    )
    ufo_model.check_vertex_charge_conservation(
        [loop_fermion, ufo_model.find_antiname(vector), external_fermions[1]],
        relation=lambda Q: Q[0] == Q[1] + Q[2]
    )

    # Retrieve vertices
    vertex_fermion_a = ufo_model.find_vertices_involving(
        [external_scalars[0], ufo_model.find_antiname(external_fermions[0]), external_fermions[0]], number_particles=3
    )
    if not vertex_fermion_a:
        raise ValueError(f"No vertex found for particles: {external_scalars[0]}, {ufo_model.find_antiname(external_fermions[1])}, {vector}")
    vertex_fermion_a = vertex_fermion_a[0]

    vertex_vector_fermion_a = ufo_model.find_vertices_involving(
        [vector, loop_fermion, external_fermions[0]], number_particles=3
    )
    if not vertex_vector_fermion_a:
        raise ValueError(f"No vertex found for particles: {vector}, {loop_fermion}, {external_fermions[0]}")
    vertex_vector_fermion_a = vertex_vector_fermion_a[0]

    vertex_vector_fermion_b = ufo_model.find_vertices_involving(
        [ufo_model.find_antiname(vector), loop_fermion, external_fermions[1]], number_particles=3
    )
    if not vertex_vector_fermion_b:
        raise ValueError(f"No vertex found for particles: {vector}, {loop_fermion}, {external_fermions[1]}")
    vertex_vector_fermion_b = vertex_vector_fermion_b[0]

    # Retrieve cached Feynman rules
    chiral_coeff_fermion_a = extract_lorentz_coefficients_vertex_XFF(vertex_fermion_a, ufo_model)
    print(f'Coefficient vertex {external_scalars[0]}-{external_fermions[0]}-{ufo_model.find_antiname(external_fermions[0])}: \n', chiral_coeff_fermion_a)
    chiral_coeff_vector_fermion_a = extract_lorentz_coefficients_vertex_XFF(vertex_vector_fermion_a, ufo_model)
    print(f'Coefficient vertex {vector}-{external_fermions[0]}-{loop_fermion}: \n', chiral_coeff_vector_fermion_a)
    chiral_coeff_vector_fermion_b = extract_lorentz_coefficients_vertex_XFF(vertex_vector_fermion_b, ufo_model)
    print(f'Coefficient vertex {ufo_model.find_antiname(vector)}-{external_fermions[1]}-{loop_fermion}: \n', chiral_coeff_vector_fermion_b)

    # Retrieve cached masses
    M_loop_fermion = ufo_model.cached_masses.get(loop_fermion, 0)
    M_vector = ufo_model.cached_masses.get(vector, 0)
    M_ext_scalar = ufo_model.cached_masses.get(external_scalars[0], 0)
    M_ext_fermion_a = ufo_model.cached_masses.get(external_fermions[0], 0)
    M_ext_fermion_b = ufo_model.cached_masses.get(external_fermions[1], 0)

    # Build diagram
    return D.BubbleFV(
        v_lfvxd.VertexSFF(
            cR=chiral_coeff_fermion_a.get('ProjP', 0),
            cL=chiral_coeff_fermion_a.get('ProjM', 0)
        ),
        v_lfvxd.VertexVFF(
            cR=chiral_coeff_vector_fermion_a.get('ProjP', 0),
            cL=chiral_coeff_vector_fermion_a.get('ProjM', 0)
        ),
        v_lfvxd.VertexVFF(
            cR=chiral_coeff_vector_fermion_b.get('ProjM', 0),
            cL=chiral_coeff_vector_fermion_b.get('ProjM', 0)
        ),
        [M_ext_fermion_a, M_ext_fermion_b, M_loop_fermion, M_vector]
    )

def construct_triangle_diagram_SF(
    loop_fermion, scalar, external_scalars, external_fermions, ufo_model
):
    """
    Construct a triangle diagram SF for Higgs decay with charge conservation checks and caching.
    """

    # Log particle names
    print(f"External scalar: {external_scalars[0]}")
    print(f"External fermions: {external_fermions}")
    print(f"Loop fermion: {loop_fermion}")
    print(f"Scalar in loop: {scalar}")

    # Charge conservation checks
    ufo_model.check_vertex_charge_conservation(
        [external_fermions[0], ufo_model.find_antiname(external_fermions[0]), external_scalars[0]],
        relation=lambda Q: Q[0] + Q[1] == Q[2]
    )
    ufo_model.check_vertex_charge_conservation(
        [loop_fermion, scalar, external_fermions[0]],
        relation=lambda Q: Q[0] == Q[1] + Q[2]
    )
    ufo_model.check_vertex_charge_conservation(
        [loop_fermion, ufo_model.find_antiname(scalar), external_fermions[1]],
        relation=lambda Q: Q[0] == Q[1] + Q[2]
    )

    # Retrieve vertices
    vertex_fermion_a = ufo_model.find_vertices_involving(
        [external_scalars[0], ufo_model.find_antiname(external_fermions[0]), external_fermions[0]], number_particles=3
    )
    if not vertex_fermion_a:
        raise ValueError(f"No vertex found for particles: {external_scalars[0]}, {ufo_model.find_antiname(external_fermions[1])}, {vector}")
    vertex_fermion_a = vertex_fermion_a[0]

    vertex_scalar_fermion_a = ufo_model.find_vertices_involving(
        [scalar, loop_fermion, external_fermions[0]], number_particles=3
    )
    if not vertex_scalar_fermion_a:
        raise ValueError(f"No vertex found for particles: {scalar}, {loop_fermion}, {external_fermions[0]}")
    vertex_scalar_fermion_a = vertex_scalar_fermion_a[0]

    vertex_scalar_fermion_b = ufo_model.find_vertices_involving(
        [ufo_model.find_antiname(scalar), loop_fermion, external_fermions[1]], number_particles=3
    )
    if not vertex_scalar_fermion_b:
        raise ValueError(f"No vertex found for particles: {scalar}, {loop_fermion}, {external_fermions[1]}")
    vertex_scalar_fermion_b = vertex_scalar_fermion_b[0]

    # Retrieve cached Feynman rules
    chiral_coeff_fermion_a = extract_lorentz_coefficients_vertex_XFF(vertex_fermion_a, ufo_model)
    print(f'Coefficient vertex {external_scalars[0]}-{external_fermions[0]}-{ufo_model.find_antiname(external_fermions[0])}: \n', chiral_coeff_fermion_a)
    chiral_coeff_scalar_fermion_a = extract_lorentz_coefficients_vertex_XFF(vertex_scalar_fermion_a, ufo_model)
    print(f'Coefficient vertex {scalar}-{external_fermions[0]}-{loop_fermion}: \n', chiral_coeff_scalar_fermion_a)
    chiral_coeff_scalar_fermion_b = extract_lorentz_coefficients_vertex_XFF(vertex_scalar_fermion_b, ufo_model)
    print(f'Coefficient vertex {ufo_model.find_antiname(scalar)}-{external_fermions[1]}-{loop_fermion}: \n', chiral_coeff_scalar_fermion_b)

    # Retrieve cached masses
    M_loop_fermion = ufo_model.cached_masses.get(loop_fermion, 0)
    M_scalar = ufo_model.cached_masses.get(scalar, 0)
    M_ext_scalar = ufo_model.cached_masses.get(external_scalars[0], 0)
    M_ext_fermion_a = ufo_model.cached_masses.get(external_fermions[0], 0)
    M_ext_fermion_b = ufo_model.cached_masses.get(external_fermions[1], 0)

    # Build diagram
    return D.BubbleFS(
        v_lfvxd.VertexSFF(
            cR=chiral_coeff_fermion_a.get('ProjP', 0),
            cL=chiral_coeff_fermion_a.get('ProjM', 0)
        ),
        v_lfvxd.VertexSFF(
            cR=chiral_coeff_scalar_fermion_a.get('ProjP', 0),
            cL=chiral_coeff_scalar_fermion_a.get('ProjM', 0)
        ),
        v_lfvxd.VertexSFF(
            cR=chiral_coeff_scalar_fermion_b.get('ProjM', 0),
            cL=chiral_coeff_scalar_fermion_b.get('ProjM', 0)
        ),
        [M_ext_fermion_a, M_ext_fermion_b, M_loop_fermion, M_scalar]
    )

def construct_triangle_diagram_VFF(
    loop_fermion1, loop_fermion2, vector, external_scalars, external_fermions, ufo_model
):
    """
    Construct a triangle diagram VFF for Higgs decay with charge conservation checks and caching.
    """

    # Log particle names
    print(f"External scalar: {external_scalars[0]}")
    print(f"External fermions: {external_fermions}")
    print(f"Loop fermion: {loop_fermion1}, {loop_fermion2}")
    print(f"Vector in loop: {vector}")

    # Charge conservation checks
    ufo_model.check_vertex_charge_conservation(
        [loop_fermion1, loop_fermion2, external_scalars[0]],
        relation=lambda Q: Q[0] + Q[1] == Q[2]
    )
    ufo_model.check_vertex_charge_conservation(
        [loop_fermion1, vector, external_fermions[0]],
        relation=lambda Q: Q[0] == Q[1] + Q[2]
    )
    ufo_model.check_vertex_charge_conservation(
        [loop_fermion2, ufo_model.find_antiname(vector), external_fermions[1]],
        relation=lambda Q: Q[0] == Q[1] + Q[2]
    )

    # Retrieve vertices
    vertex_scalar_fermion_fermion = ufo_model.find_vertices_involving(
        [external_scalars[0], loop_fermion1, loop_fermion2], number_particles=3
    )
    if not vertex_scalar_fermion_fermion:
        raise ValueError(f"No vertex found for particles: {external_scalars[0]}, {loop_fermion1}, {loop_fermion2}")
    vertex_scalar_fermion_fermion = vertex_scalar_fermion_fermion[0]

    vertex_vector_fermion_a = ufo_model.find_vertices_involving(
        [loop_fermion1, vector, external_fermions[0]], number_particles=3
    )
    if not vertex_vector_fermion_a:
        raise ValueError(f"No vertex found for particles: {vector}, {loop_fermion1}, {external_fermions[0]}")
    vertex_vector_fermion_a = vertex_vector_fermion_a[0]

    vertex_vector_fermion_b = ufo_model.find_vertices_involving(
        [loop_fermion2, ufo_model.find_antiname(vector), external_fermions[1]], number_particles=3
    )
    if not vertex_vector_fermion_b:
        raise ValueError(f"No vertex found for particles: {ufo_model.find_antiname(vector)}, {loop_fermion2}, {external_fermions[1]}")
    vertex_vector_fermion_b = vertex_vector_fermion_b[0]

    # Retrieve cached Feynman rules
    coeff_scalar_fermion_fermion = extract_lorentz_coefficients_vertex_XFF(vertex_scalar_fermion_fermion, ufo_model)
    print(f'Coefficient vertex {external_scalars[0]}-{loop_fermion1}-{loop_fermion2}: \n', coeff_scalar_fermion_fermion)
    chiral_coeff_vector_fermion_a = extract_lorentz_coefficients_vertex_XFF(vertex_vector_fermion_a, ufo_model)
    print(f'Coefficient vertex {vector}-{external_fermions[0]}-{loop_fermion1}: \n', chiral_coeff_vector_fermion_a)
    chiral_coeff_vector_fermion_b = extract_lorentz_coefficients_vertex_XFF(vertex_vector_fermion_b, ufo_model)
    print(f'Coefficient vertex {ufo_model.find_antiname(vector)}-{external_fermions[1]}-{loop_fermion2}: \n', chiral_coeff_vector_fermion_b)

    # Retrieve cached masses
    M_loop_fermion1 = ufo_model.cached_masses.get(loop_fermion1, 0)
    M_loop_fermion2 = ufo_model.cached_masses.get(loop_fermion2, 0)
    M_vector = ufo_model.cached_masses.get(vector, 0)
    M_ext_scalar = ufo_model.cached_masses.get(external_scalars[0], 0)
    M_ext_fermion_a = ufo_model.cached_masses.get(external_fermions[0], 0)
    M_ext_fermion_b = ufo_model.cached_masses.get(external_fermions[1], 0)

    # Build diagram
    return D.TriangleVFF(
        v_lfvxd.VertexSFF(
            cR=coeff_scalar_fermion_fermion.get('ProjP', 0),
            cL=coeff_scalar_fermion_fermion.get('ProjM', 0)
        ),
        v_lfvxd.VertexVFF(
            cR=chiral_coeff_vector_fermion_a.get('ProjP', 0),
            cL=chiral_coeff_vector_fermion_a.get('ProjM', 0)
        ),
        v_lfvxd.VertexVFF(
            cR=chiral_coeff_vector_fermion_b.get('ProjM', 0),
            cL=chiral_coeff_vector_fermion_b.get('ProjM', 0)
        ),
        [M_ext_scalar, M_ext_fermion_a, M_ext_fermion_b, M_vector, M_loop_fermion1, M_loop_fermion2]
    )

def construct_triangle_diagram_SFF(
    loop_fermion1, loop_fermion2, scalar, external_scalars, external_fermions, ufo_model
):
    """
    Construct a triangle diagram VFF for Higgs decay with charge conservation checks and caching.
    """

    # Log particle names
    print(f"External scalar: {external_scalars[0]}")
    print(f"External fermions: {external_fermions}")
    print(f"Loop fermion: {loop_fermion1}, {loop_fermion2}")
    print(f"Vector in loop: {scalar}")

    # Charge conservation checks
    ufo_model.check_vertex_charge_conservation(
        [loop_fermion1, loop_fermion2, external_scalars[0]],
        relation=lambda Q: Q[0] + Q[1] == Q[2]
    )
    ufo_model.check_vertex_charge_conservation(
        [loop_fermion1, scalar, external_fermions[0]],
        relation=lambda Q: Q[0] == Q[1] + Q[2]
    )
    ufo_model.check_vertex_charge_conservation(
        [loop_fermion2, ufo_model.find_antiname(scalar), external_fermions[1]],
        relation=lambda Q: Q[0] == Q[1] + Q[2]
    )

    # Retrieve vertices
    vertex_scalar_fermion_fermion = ufo_model.find_vertices_involving(
        [external_scalars[0], loop_fermion1, loop_fermion2], number_particles=3
    )
    if not vertex_scalar_fermion_fermion:
        raise ValueError(f"No vertex found for particles: {external_scalars[0]}, {loop_fermion1}, {loop_fermion2}")
    vertex_scalar_fermion_fermion = vertex_scalar_fermion_fermion[0]

    vertex_scalar_fermion_a = ufo_model.find_vertices_involving(
        [loop_fermion1, scalar, external_fermions[0]], number_particles=3
    )
    if not vertex_scalar_fermion_a:
        raise ValueError(f"No vertex found for particles: {scalar}, {loop_fermion1}, {external_fermions[0]}")
    vertex_scalar_fermion_a = vertex_scalar_fermion_a[0]

    vertex_scalar_fermion_b = ufo_model.find_vertices_involving(
        [loop_fermion2, ufo_model.find_antiname(scalar), external_fermions[1]], number_particles=3
    )
    if not vertex_scalar_fermion_b:
        raise ValueError(f"No vertex found for particles: {ufo_model.find_antiname(scalar)}, {loop_fermion2}, {external_fermions[1]}")
    vertex_scalar_fermion_b = vertex_scalar_fermion_b[0]

    # Retrieve cached Feynman rules
    coeff_scalar_fermion_fermion = extract_lorentz_coefficients_vertex_XFF(vertex_scalar_fermion_fermion, ufo_model)
    print(f'Coefficient vertex {external_scalars[0]}-{loop_fermion1}-{loop_fermion2}: \n', coeff_scalar_fermion_fermion)
    chiral_coeff_vector_fermion_a = extract_lorentz_coefficients_vertex_XFF(vertex_scalar_fermion_a, ufo_model)
    print(f'Coefficient vertex {scalar}-{external_fermions[0]}-{loop_fermion1}: \n', chiral_coeff_vector_fermion_a)
    chiral_coeff_vector_fermion_b = extract_lorentz_coefficients_vertex_XFF(vertex_scalar_fermion_b, ufo_model)
    print(f'Coefficient vertex {ufo_model.find_antiname(scalar)}-{external_fermions[1]}-{loop_fermion2}: \n', chiral_coeff_vector_fermion_b)

    # Retrieve cached masses
    M_loop_fermion1 = ufo_model.cached_masses.get(loop_fermion1, 0)
    M_loop_fermion2 = ufo_model.cached_masses.get(loop_fermion2, 0)
    M_vector = ufo_model.cached_masses.get(scalar, 0)
    M_ext_scalar = ufo_model.cached_masses.get(external_scalars[0], 0)
    M_ext_fermion_a = ufo_model.cached_masses.get(external_fermions[0], 0)
    M_ext_fermion_b = ufo_model.cached_masses.get(external_fermions[1], 0)

    # Build diagram
    return D.TriangleSFF(
        v_lfvxd.VertexSFF(
            cR=coeff_scalar_fermion_fermion.get('ProjP', 0),
            cL=coeff_scalar_fermion_fermion.get('ProjM', 0)
        ),
        v_lfvxd.VertexSFF(
            cR=chiral_coeff_vector_fermion_a.get('ProjP', 0),
            cL=chiral_coeff_vector_fermion_a.get('ProjM', 0)
        ),
        v_lfvxd.VertexSFF(
            cR=chiral_coeff_vector_fermion_b.get('ProjM', 0),
            cL=chiral_coeff_vector_fermion_b.get('ProjM', 0)
        ),
        [M_ext_scalar, M_ext_fermion_a, M_ext_fermion_b, M_vector, M_loop_fermion1, M_loop_fermion2]
    )