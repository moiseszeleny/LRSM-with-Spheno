from sympy import Mul

from potential_senjanovic_HiggsDoublets import vev_physical_charged_scalars
from potential_senjanovic_HiggsDoublets import H10, H20, H30, H40, A10, A20, GZ1, GZ2
from potential_senjanovic_HiggsDoublets import HLp, HLm, GLp, GLm, HRp, HRm, GRp, GRm
#from Gauge_Higgs_senjanovic_HiggsDoublets import change_neutral_bosons_R, change_charged_bosons
from Gauge_Higgs_senjanovic_HiggsDoublets import W1p, W2p, W1m, W2m, A, Z1, Z2
from Gauge_Higgs_senjanovic_HiggsDoublets import partial_mu
from Gauge_Higgs_senjanovic_HiggsDoublets import LHiggs_physical, LHiggs_physical_approx

from symbolic_tools import extract_interaction_coefficients
from symbolic_tools import PartialMu, momentum
partial_mu_momentum = PartialMu

from potential_senjanovic_HiggsDoublets import VLR_physical, VLR_physical_approx
from sympy import conjugate


scalar_fields = list(vev_physical_charged_scalars.keys()) + [H10, H20, H30, H40, A10, A20,  GZ1, GZ2]
gauge_fields = [W1p, W2p, W1m, W2m, A, Z1, Z2]
scalar_fields_partial_mu = [partial_mu(scalar) for scalar in scalar_fields]
scalar_fields_momentum = [momentum(scalar) for scalar in scalar_fields]
fields = set(scalar_fields + scalar_fields_partial_mu + gauge_fields)

def D_linear(expr, fields=scalar_fields + gauge_fields):
    """Apply linearity and Leibniz rule to D."""
    expr = expr.expand()
    if expr.is_Add:
        return sum(D_linear(arg) for arg in expr.args)
    
    elif expr.is_Mul:
        # Factor out coefficients (extract terms that are not fields)
        factors = expr.as_ordered_factors()
        field_part = [f for f in factors if f in fields]
        coeff_part = [f for f in factors if f not in fields]
        
        if len(field_part) == 1:  # If there's exactly one field
            coeff = Mul(*coeff_part) if coeff_part else 1  # Handle case where coefficient is 1
            return coeff * partial_mu(field_part[0])  # Apply D only to the field
        else:
            # Apply Leibniz rule for multiple fields
            terms = []
            for i in range(len(field_part)):
                new_factors = field_part.copy()
                new_factors[i] = partial_mu(new_factors[i])  # Apply D to one field
                terms.append(Mul(*coeff_part, *new_factors))
            return sum(terms)
    
    elif expr in fields:  # If it's a field, apply D
        return partial_mu(expr)
    
    else:
        return expr  # Constants remain unchanged

# Writing the Lhiggs in terms of momentums instead of partial_mu
LHiggs_physical = LHiggs_physical.replace(partial_mu, D_linear).expand().replace(partial_mu, partial_mu_momentum).doit()
LHiggs_physical_approx = LHiggs_physical_approx.replace(partial_mu, D_linear).expand().replace(partial_mu, partial_mu_momentum).doit()

# Extracting the parameters from the Lagrangian and adding it to momentum of each scalar field
parameters_ = set(list((LHiggs_physical.free_symbols).difference(fields)) + scalar_fields_momentum)

# extract the coefficient of each interaction for complete Lagrangian LHiggs
interactions_gauge_scalars = ((extract_interaction_coefficients(
    L=LHiggs_physical,
    fields=set(scalar_fields + gauge_fields), 
    parameters=parameters_
)))

# extract the coefficient of each interaction for approximate Lagrangian  LHiggs
interactions_gauge_scalars_approx = ((extract_interaction_coefficients(
    L=LHiggs_physical_approx,
    fields=set(scalar_fields + gauge_fields),
    parameters=parameters_
)))

###########
#  Scalar potential
###########
conjugate_scalar_fields = {
    conjugate(HLp): HLm,
    conjugate(HLm): HLp,
    conjugate(GLm): GLp,
    conjugate(GLp): GLm,
    conjugate(HRm): HRp,
    conjugate(HRp): HRm,
    conjugate(GRm): GRp,
    conjugate(GRp): GRm
}

# writing the conjugate scalar fields as the scalar fiel with inverse charge in the potential
VLR_physical = VLR_physical.subs(conjugate_scalar_fields).expand()
VLR_physical_approx = VLR_physical_approx.subs(conjugate_scalar_fields).expand()

parameters_potential = (VLR_physical.free_symbols).difference(set(scalar_fields + gauge_fields))

# extract the coefficient of each interaction for complete scalar potential
interactions_scalars = extract_interaction_coefficients(
    L=VLR_physical,
    fields=scalar_fields + gauge_fields,
    parameters=parameters_potential
)

# extract the coefficient of each interaction for approximate scalar potential
interactions_scalars_approx = extract_interaction_coefficients(
    L=VLR_physical_approx,
    fields=scalar_fields + gauge_fields,
    parameters=parameters_potential
)



if __name__ == "__main__":
    from symbolic_tools import test_feynman_coefficients
    lag_diff = test_feynman_coefficients(
    Lagrangian=LHiggs_physical,
    fields=set(fields),
    parameters=parameters_
)
    lag_diff_approx = test_feynman_coefficients(
    Lagrangian=LHiggs_physical_approx,
    fields=set(fields),
    parameters=parameters_
)