import qcdloop as ql

def A0(m1sq, mu2=1.0):
    """
    Compute the scalar A0 Passarino-Veltman function.

    Parameters:
        m1sq (float): Mass squared of the propagator.
        mu2 (float): Renormalization scale squared (default: 1.0).

    Returns:
        complex: A0 result.
    """
    td = ql.TadPole()
    return td.integral(mu2, [m1sq])[0]

def B0(p2, m1sq, m2sq, mu2=1.0):
    """
    Compute the scalar B0 Passarino-Veltman function.

    Parameters:
        p2 (float): External squared momentum.
        m1sq (float): Mass squared of first propagator.
        m2sq (float): Mass squared of second propagator.
        mu2 (float): Renormalization scale squared (default: 1.0).

    Returns:
        complex: B0 result.
    """
    bubble = ql.Bubble()
    return bubble.integral(mu2, [m1sq, m2sq], [p2])[0]

def B1_0(ma, M0, M1, mu2=1.0):
    """
    Compute the scalar B1_0 Passarino-Veltman function.

    Parameters:
        mi (float): External lepton i mass.
        M0 (float): Mass of the first propagator.
        M1 (float): Mass of the second propagator.
        mu2 (float): Renormalization scale squared (default: 1.0).

    Returns:
        complex: B1_0 result.
    """
    p2 = ma**2
    m1sq = M0**2
    m2sq = M1**2
    return B0(p2, m1sq, m2sq, mu2)

def B2_0(mb, M0, M2, mu2=1.0):
    """
    Compute the scalar B2_0 Passarino-Veltman function.

    Parameters:
        mb (float): External lepton ia mass.
        M0 (float): Mass of the first propagator.
        M2 (float): Mass of the second propagator.
        mu2 (float): Renormalization scale squared (default: 1.0).

    Returns:
        complex: B1_0 result.
    """
    p2 = mb**2
    m1sq = M0**2
    m2sq = M2**2
    return B0(p2, m1sq, m2sq, mu2)

def B12_0(mX, M1, M2, mu2=1.0):
    """
    Compute the scalar B12_0 Passarino-Veltman function.

    Parameters:
        mX (float): External X = S, V mass.
        M1 (float): Mass of the first propagator.
        M2 (float): Mass of the second propagator.
        mu2 (float): Renormalization scale squared (default: 1.0).

    Returns:
        complex: B12_0 result.
    """
    p2 = mX**2
    m1sq = M1**2
    m2sq = M2**2
    return B0(p2, m1sq, m2sq, mu2)


def B1(psq, m1sq, m2sq, mu2=1.0):
    """
    Compute the scalar B1 Passarino-Veltman function coefficient.
    B_mu = p_mu B1

    Parameters:
        p2 (float): External momentum squared.
        m1sq (float): Mass squared of first propagator.
        m2sq (float): Mass squared of second propagator.
        mu2 (float): Renormalization scale squared (default: 1.0).

    Returns:
        complex: B1 result.
    Note:
        This formula is singular for p2 = 0. Specific treatment for p2=0 is needed
        for robust computation in that limit.
    """
    if abs(psq) < 1e-9: # Threshold for p2 being effectively zero
        # For p2 -> 0, the formula is 0/0.
        # A proper limit or alternative formula should be used.
        # For now, returning NaN or raising an error.
        # print("Warning: B1 called with p2 effectively zero, result may be unstable or NaN.")
        # return float('nan') # Or handle as per specific needs
        # Using a simplified limit for m1sq == m2sq as an example,
        # but general p2=0 case is more complex.
        if abs(m1sq - m2sq) < 1e-9:
             # B1(p^2, m^2, m^2) -> B0(p^2, m^2, m^2)/2 as p^2 -> 0 if B0 is finite
             # More accurately, for p^2=0, m1sq=m2sq=msq, B1 = -1/(2*(d-2)) * d/dmsq A0(msq)
             # This is non-trivial to compute from just A0.
             # Fallback to general formula, which might lead to issues.
             pass # Let it compute with the general formula, may result in NaN/Inf

    a0_m1 = A0(m1sq, mu2)
    a0_m2 = A0(m2sq, mu2)
    b0_val = B0(psq, m1sq, m2sq, mu2)

    numerator = a0_m1 - a0_m2 - (m1sq - m2sq + psq) * b0_val
    if abs(psq) < 1e-9 : # Avoid division by zero if p2 is exactly 0.0
        if abs(numerator) < 1e-9: # 0/0 case
             # This indicates a need for a more careful limit calculation.
             # For now, this will likely result in NaN if p2 is truly zero.
             # If p2 is very small but non-zero, direct computation might be okay or unstable.
             # A robust library would use series expansions here.
             print(f"Warning: B1(p2={psq}, m1sq={m1sq}, m2sq={m2sq}) is in a 0/0 form. Result may be unstable.")
             # Fall through to direct computation, which might be what qcdloop does internally
             # if it were computing B1 directly.
        elif numerator != 0 and psq == 0.0: # X/0 case
            return float('inf') + 0j if numerator.real > 0 else float('-inf') + 0j # Or based on sign of numerator

    return numerator / (2 * psq)

def B1_1(ma, M0, M1, mu2=1.0):
    """
    Compute the scalar B1_1 Passarino-Veltman function coefficient.
    B_mu = p_mu B1_1

    Parameters:
        ma (float): External lepton
        M0 (float): Mass of the first propagator.
        M1 (float): Mass of the second propagator.
    
    Returns:
        complex: B1_1 result.
    """
    p2 = ma**2
    m1sq = M0**2
    m2sq = M1**2
    return -B1(p2, m1sq, m2sq, mu2)

def B2_1(mb, M0, M2, mu2=1.0):
    """
    Compute the scalar B2_1 Passarino-Veltman function coefficient.
    B_mu = p_mu B

    Parameters:
        mb (float): External lepton
        M0 (float): Mass of the first propagator.
        M2 (float): Mass of the second propagator.
    
    Returns:
        complex: B2_1 result.
    """
    p2 = mb**2
    m1sq = M0**2
    m2sq = M2**2
    return B1(p2, m1sq, m2sq, mu2)

def C0(p12, p23, p31, m1sq, m2sq, m3sq, mu2=1.0):
    """
    Compute the scalar C0 Passarino-Veltman function.

    Parameters:
        p12 (float): Squared momentum p_1^2.
        p23 (float): Squared momentum p_2^2.
        p31 (float): Squared momentum (p_1+p_2)^2.
        m1sq (float): Mass squared of propagator opposite p_1 (Denner's m_1^2).
        m2sq (float): Mass squared of propagator opposite p_2 (Denner's m_2^2).
        m3sq (float): Mass squared of propagator opposite p_1+p_2 (Denner's m_0^2).
        mu2 (float): Renormalization scale squared (default: 1.0).

    Returns:
        complex: C0 result.
    """
    triangle = ql.Triangle()
    return triangle.integral(mu2, [m1sq, m2sq, m3sq], [p12, p23, p31])[0]

def C0_(mX, mi, mj, M0, M1, M2, mu2=1.0):
    """
    Compute the scalar C0_ Passarino Veltman function following the notation
    to agree with LFV X decays with X = S, V. In our notation in comparison with qcdloop,
    the Passarino-Veltman functions for numerical evaluation depends on masses not squared masses.
    Also, the order of masses is changed into m1 -> M1, m2 -> M0, m3 -> M2, and the momentum changes
    into p1 -> -p1, p2 - > - p2, p3 -> -(p1 + p2) which does not change the squared momenta.
    """
    p1sq = mi**2
    p2sq = mj**2
    p3sq = mX**2
    M1sq = M1**2
    M0sq = M0**2
    M2sq = M2**2 
    return C0(p1sq, p2sq, p3sq, M1sq, M0sq, M2sq, mu2)

def C1_coeff(p1sq, p1p2sq, p2sq, m1sq, m2sq, m3sq, mu2=1.0):
    """
    Helper function to compute C1 coefficient.
    See C0 docstring for parameter interpretation following the feyncalc notation.
    m1sq, m2sq, m3sq are Denner's m_1^2, m_2^2, m_0^2 respectively. And p1sq, p1p2sq, p2sq
    are p1^2, (p1-p2)^2, p2^2 respectively.
    """
    p3sq = 2*p1sq + 2*p2sq - p1p2sq 
    c0_val = C0(p1sq, p2sq, p3sq, m2sq, m1sq, m3sq, mu2)

    # RHS terms based on Denner (2.48) with mapping:
    # Denner s1 -> p1sq, s2 -> p2sq, s12 -> p1p2sq
    # Denner m_1^2 -> m1sq (arg), m_2^2 -> m2sq (arg), m_0^2 -> m3sq (arg)
    p1dotp2 = (p1p2sq - p1sq - p2sq)/2
    factor = -1/(2*(p1dotp2**2 - p1sq * p2sq))
    b0_term = (
        - p1dotp2*B0(p1sq, m1sq, m2sq) + p2sq*B0(p2sq, m1sq, m3sq) 
        + (p1dotp2 -p2sq)*B0(p1p2sq, m2sq, m3sq)
    )
    c0_term = ((m1sq - m3sq + p2sq)*p1dotp2 - p2sq*(m1sq - m2sq + p1sq)) * c0_val

    detM = p1sq * p2sq - p1dotp2 * p1dotp2
    if abs(detM) < 1e-12: # Determinant is zero or very small
        # Handle singular case: e.g. collinear kinematics.
        # This requires special formulas or returning NaN/raising error.
        print(f"Warning: Determinant for C1/C2 is very small ({detM}). Results may be unstable or NaN.")
        # Fallback to direct computation, may result in NaN/Inf
        if abs(detM) == 0.0: # Exactly zero
            # This case is problematic, depends on numerators if they are also zero
            # For simplicity, let's return NaNs if detM is exactly zero.
            return float('nan'), float('nan')

    c1 = factor*(b0_term + c0_term)
    return c1

def C2_coeff(p1sq, p1p2sq, p2sq, m1sq, m2sq, m3sq, mu2=1.0):
    """
    Helper function to compute C1 and C2 coefficients.
    See C0 docstring for parameter interpretation (p1sq=p12, p2sq=p23, p1p2sq=p31).
    m1sq, m2sq, m3sq are Denner's m_1^2, m_2^2, m_0^2 respectively.
    """
    p1dotp2 = (p1p2sq - p1sq - p2sq)/2
    detM = p1sq * p2sq - p1dotp2 * p1dotp2
    if abs(detM) < 1e-12: # Determinant is zero or very small
        # Handle singular case: e.g. collinear kinematics.
        # This requires special formulas or returning NaN/raising error.
        print(f"Warning: Determinant for C1/C2 is very small ({detM}). Results may be unstable or NaN.")
        # Fallback to direct computation, may result in NaN/Inf
        if abs(detM) == 0.0: # Exactly zero
            # This case is problematic, depends on numerators if they are also zero
            # For simplicity, let's return NaNs if detM is exactly zero.
            return float('nan'), float('nan')

    return C1_coeff(p2sq, p1p2sq, p1sq, m1sq, m3sq, m2sq, mu2)


def C1(p12, p23, p31, m1sq, m2sq, m3sq, mu2=1.0):
    """Compute C1 Passarino-Veltman coefficient. See C0 docstring for parameters."""
    p1p2sq = 2*p12 + 2*p23 - p31
    return C1_coeff(p12, p1p2sq, p23, m1sq, m2sq, m3sq, mu2)

def C2(p12, p23, p31, m1sq, m2sq, m3sq, mu2=1.0):
    """Compute C2 Passarino-Veltman coefficient. See C0 docstring for parameters."""
    p1p2sq = 2*p12 + 2*p23 - p31
    return C2_coeff(p12, p1p2sq, p23, m1sq, m2sq, m3sq, mu2)

def C2_(mX, mi, mj, M0, M1, M2, mu2=1.0):
    """
    Compute the scalar C2_ Passarino Veltman function following the notation
    to agree with LFV X decays with X = S, V. In our notation in comparison with feyncalc,
    the Passarino-Veltman functions for numerical evaluation depends on masses not squared masses.
    Also, the order of masses is changed into m1 -> M1, m2 -> M0, m3 -> M2, and the momentum changes
    into p1 -> -p1, p2 - > - p2, p3 -> -(p1 + p2) which does not change the squared momenta
    """
    #p1sq = mi**2
    #p2sq = mj**2
    #p3sq = mX**2
    #M1sq = M1**2
    #M0sq = M0**2
    #M2sq = M2**2 
    #return C2(p1sq, p2sq, p3sq, M1sq, M0sq, M2sq, mu2)
    p1sq = mi**2
    p2sq = mj**2
    p1p2sq = 2*(p1sq +p2sq) - mX**2
    m1sq = M1**2
    m2sq = M0**2
    m3sq = M2**2
    return C2_coeff(p1sq, p1p2sq, p2sq, m1sq, m2sq, m3sq, mu2)


def C1_(mX, mi, mj, M0, M1, M2, mu2=1.0):
    """
    Compute the scalar C1_ Passarino Veltman function following the notation
    to agree with LFV X decays with X = S, V. In our notation in comparison with feyncalc,
    the Passarino-Veltman functions for numerical evaluation depends on masses not squared masses.
    Also, the order of masses is changed into m1 -> M1, m2 -> M0, m3 -> M2, and the momentum changes
    into p1 -> -p1, p2 - > - p2, p3 -> -(p1 + p2) which does not change the squared momenta. 
    """
    C0p = C0_(mX, mi, mj, M0, M1, M2, mu2)
    C2p = C2_(mX, mi, mj, M0, M1, M2, mu2)

    #p1sq = mi**2
    #p2sq = mj**2
    #p3sq = mX**2
    #M1sq = M1**2
    #M0sq = M0**2
    #M2sq = M2**2 
    #C1p = C1(p1sq, p2sq, p3sq, M1sq, M0sq, M2sq, mu2)
    p1sq = mi**2
    p2sq = mj**2
    p1p2sq = 2*(p1sq +p2sq) - mX**2
    m1sq = M1**2
    m2sq = M0**2
    m3sq = M2**2
    C1p = C1_coeff(p1sq, p1p2sq, p2sq, m1sq, m2sq, m3sq, mu2)
    return C1p + C2p + C0p

def C00_coeff(p1sq, p1p2sq, p2sq, m1sq, m2sq, m3sq, mu2=1.0):
    """
    Helper function to compute C00 coefficient.
    See C0 docstring for parameter interpretation following the feyncalc notation.
    m1sq, m2sq, m3sq are Denner's m_1^2, m_2^2, m_0^2 respectively. And p1sq, p1p2sq, p2sq
    are p1^2, (p1-p2)^2, p2^2 respectively.
    """
    p1dotp2 = (p1p2sq - p1sq - p2sq)/2
    detM = p1sq * p2sq - p1dotp2 * p1dotp2
    if abs(detM) < 1e-12: # Determinant is zero or very small
        # Handle singular case: e.g. collinear kinematics.
        # This requires special formulas or returning NaN/raising error.
        print(f"Warning: Determinant for C00 is very small ({detM}). Results may be unstable or NaN.")
        # Fallback to direct computation, may result in NaN/Inf
        if abs(detM) == 0.0: # Exactly zero
            # This case is problematic, depends on numerators if they are also zero
            # For simplicity, let's return NaNs if detM is exactly zero.
            return float('nan')

    p3sq = 2*p1sq + 2*p2sq - p1p2sq 
    c0_val = C0(p1sq, p2sq, p3sq, m2sq, m1sq, m3sq, mu2)

    factor = -1/(8*(p1dotp2**2 - p1sq * p2sq))
    X = p1dotp2*(-2*m1sq + 2*m2sq + m3sq - p2sq) + p2sq*(m1sq - m2sq) + p1sq*(m1sq - m3sq - p1dotp2) + 2*p1dotp2
    Y = p1dotp2*(m1sq - m3sq + p2sq) - p2sq*(m1sq - m2sq + p1sq)
    Z = (m2sq - m1sq)*p1dotp2 + p1sq*(m1sq - m3sq - p1dotp2 + p2sq)
    b0_term = X*(-B0(p1p2sq, m2sq, m3sq)) - Y*B0(p2sq, m1sq, m3sq) + Z*B0(p1sq, m1sq, m2sq)
    c0_term = - (
        - 2*(m1sq - m2sq)*(m1sq - m3sq + p2sq)*p1dotp2 + p1sq*(-2*(m1sq - m3sq + p2sq)*p1dotp2 + (m1sq - m3sq)**2 - 2*p2sq*(m2sq + m3sq) + p2sq**2)
        + p2sq*(m1sq - m2sq)**2 + 4*m1sq*p1dotp2*p1sq**2*p2sq
    )*c0_val

    return factor*(b0_term + c0_term)

def C11_coeff(p1sq, p1p2sq, p2sq, m1sq, m2sq, m3sq, mu2=1.0):
    """
    Helper function to compute C11 coefficient.
    See C0 docstring for parameter interpretation following the feyncalc notation.
    m1sq, m2sq, m3sq are Denner's m_1^2, m_2^2, m_0^2 respectively. And p1sq, p1p2sq, p2sq
    are p1^2, (p1-p2)^2, p2^2 respectively.
    """
    p1dotp2 = (p1p2sq - p1sq - p2sq)/2
    detM = p1sq * p2sq - p1dotp2 * p1dotp2
    if abs(detM) < 1e-12: # Determinant is zero or very small
        # Handle singular case: e.g. collinear kinematics.
        # This requires special formulas or returning NaN/raising error.
        print(f"Warning: Determinant for C11 is very small ({detM}). Results may be unstable or NaN.")
        # Fallback to direct computation, may result in NaN/Inf
        if abs(detM) == 0.0: # Exactly zero
            # This case is problematic, depends on numerators if they are also zero
            # For simplicity, let's return NaNs if detM is exactly zero.
            return float('nan')
    D = 4
    factor = 1/(4*(p1dotp2**2 - p1sq*p2sq)**2)
    a0term = (
        p1dotp2*((p1dotp2)**2 - p1sq * p2sq)/p1sq*A0(m1sq, mu2)
        - (p1dotp2 - p2sq)*(p1dotp2**2 - p1sq*p2sq)/p1p2sq*A0(m3sq, mu2)
        + (p1sq * p2sq-p1dotp2**2) * (-2 * p1dotp2**2 + p2sq * (p1dotp2) + p1sq * p2sq)/(p1sq*p1p2sq) * A0(m2sq, mu2)
    )

    b0_term = (
        (D-1) * B0(p2sq, m1sq, m3sq) * p2sq * ((m1sq - m2sq + p1sq) * p2sq - (p1dotp2) * (m1sq - m3sq + p2sq))/(D-2)
        -(1/((D-2) * p1sq)) * B0(p1sq, m1sq, m2sq)*(
            (D-2) * (m1sq-m2sq) * (p1dotp2)**3 + p1sq * (
                (D-2) * (p1dotp2)**2 + (D-2) * (m1sq-m3sq+p2sq) * (p1dotp2)-(2 * D-3) * (m1sq-m2sq) * p2sq
            ) * (p1dotp2) + p1sq**2 * p2sq * (m1sq-m3sq+(3-2 * D) * (p1dotp2)+p2sq)
        )
        + 1/((D-2) * (p1p2sq)) * B0(p1p2sq, m2sq, m3sq) * (
            -2 * (D-2) * (p1dotp2)**4 + ((D-6) * p2sq - (D-2) * (2 * m1sq + m2sq - 3 * m3sq)) * (p1dotp2)**3 
            + p2sq * ((5 * D-6) * m1sq - D * m2sq - 4 * D * m3sq + 6 * m3sq + 2 * D * p2sq) * (p1dotp2)**2 
            - (D-1) * p2sq**2 * (4 * m1sq - 3 * m2sq - m3sq + p2sq) * (p1dotp2) 
            + (D-1) * (m1sq - m2sq) * p2sq**3 
            + p1sq**2 * p2sq * (m1sq - m3sq + (3-2 * D) * (p1dotp2) + 2 * (D-2) * p2sq) 
            + p1sq**2 * (
                (D-2) * (p1dotp2)**3 + ((D-2) * (m1sq - m3sq) + 4 * (D-1) * p2sq) * (p1dotp2)**2 
                + p2sq * (-2 * D * m1sq + 2 * D * m2sq - 3 * m2sq + 3 * m3sq + (12-7 * D) * p2sq) * (p1dotp2) 
                + p2sq**2 * (3 * (m2sq - m3sq) + D * (m1sq - 2 * m2sq + m3sq) + 2 * (D-2) * p2sq)
            )
        )
    )

    c0_term = 1/(D-2)*C0(p1sq, p2sq ,p1p2sq, m2sq,m1sq,m3sq) (
        ((D-2)*(m1sq-m3sq)**2 + (D-2)*p2sq**2 + 2 * (2*m3sq + D*(m1sq-m3sq)) * p2sq) * (p1dotp2)**2 
        - 2*(D-1) * (m1sq-m2sq+p1sq) * p2sq * (m1sq-m3sq+p2sq) * (p1dotp2) 
        + p2sq * ((D-1) * p2sq * (m1sq-m2sq)**2 + (D-1) * p1sq**2 * p2sq + p1sq * ((m1sq-m3sq)**2 + p2sq**2 + 2 * ((D-2) * m1sq-D * m2sq+m2sq-m3sq) * p2sq))
    )
    c11 = factor*(a0term + b0_term + c0_term)
    return c11

def C22_coeff(p1sq, p1p2sq, p2sq, m1sq, m2sq, m3sq, mu2=1.0):
    """
    Helper function to compute C22 coefficient.
    See C0 docstring for parameter interpretation following the feyncalc notation.
    m1sq, m2sq, m3sq are Denner's m_1^2, m_2^2, m_0^2 respectively. And p1sq, p1p2sq, p2sq
    are p1^2, (p1-p2)^2, p2^2 respectively.
    """
    p1dotp2 = (p1p2sq - p1sq - p2sq)/2
    detM = p1sq * p2sq - p1dotp2 * p1dotp2
    if abs(detM) < 1e-12: # Determinant is zero or very small
        # Handle singular case: e.g. collinear kinematics.
        # This requires special formulas or returning NaN/raising error.
        print(f"Warning: Determinant for C22 is very small ({detM}). Results may be unstable or NaN.")
        # Fallback to direct computation, may result in NaN/Inf
        if abs(detM) == 0.0: # Exactly zero
            # This case is problematic, depends on numerators if they are also zero
            # For simplicity, let's return NaNs if detM is exactly zero.
            return float('nan')
    return C11_coeff(p2sq, p1p2sq, p1sq, m1sq, m3sq, m2sq, mu2)

def C12_coeff(p1sq, p1p2sq, p2sq, m1sq, m2sq, m3sq, mu2=1.0):
    """
    Helper function to compute C12 coefficient.
    See C0 docstring for parameter interpretation following the feyncalc notation.
    m1sq, m2sq, m3sq are Denner's m_1^2, m_2^2, m_0^2 respectively. And p1sq, p1p2sq, p2sq
    are p1^2, (p1-p2)^2, p2^2 respectively.
    """

    p1dotp2 = (p1p2sq - p1sq - p2sq)/2
    detM = p1sq * p2sq - p1dotp2 * p1dotp2
    if abs(detM) < 1e-12: # Determinant is zero or very small
        # Handle singular case: e.g. collinear kinematics.
        # This requires special formulas or returning NaN/raising error.
        print(f"Warning: Determinant for C12 is very small ({detM}). Results may be unstable or NaN.")
        # Fallback to direct computation, may result in NaN/Inf
        if abs(detM) == 0.0: # Exactly zero
            # This case is problematic, depends on numerators if they are also zero
            # For simplicity, let's return NaNs if detM is exactly zero.
            return float('nan')
    factor = 1/(4*(p1dotp2**2 - p1sq*p2sq)**2)
    D = 4
    a0term = (
        A0(m1sq) * ((p1dotp2)**2 - p1sq * p2sq) 
        + (A0(m2sq) * (p1dotp2 - p2sq) * ((p1dotp2)**2 - p1sq * p2sq))/(p1p2sq) 
        + (A0(m3sq) * (p1sq - p1dotp2) * (p1sq * p2sq - (p1dotp2)**2))/(p1p2sq)
    )

    b0_term = (
        (B0(p2sq,m1sq,m3sq) * ((m1sq-m3sq+p2sq) * (p1dotp2)**2-(D-1) * (m1sq-m2sq+p1sq) * p2sq * (p1dotp2)+(D-2) * p1sq * p2sq * (m1sq-m3sq+p2sq)))/(D-2)
        + 1/(D-2) * B0(p1sq,m1sq,m2sq) * (-((D-2) * p2sq * p1sq**2) + (-(p1dotp2)**2 + (D-1) * (m1sq-m3sq+p2sq) * p1dotp2 - (D-2) * (m1sq-m2sq) * p2sq) * p1sq + (m2sq-m1sq) * (p1dotp2)**2)
        -(1/((D-2) * (p1p2sq))) * B0(p1p2sq,m2sq,m3sq)* (
            (D-2) * p2sq * p1sq**3
            + ((p1dotp2)**2 + (-((D-1) * (m1sq-m3sq))-5 * (D-2) * p2sq) * (p1dotp2) + (D-2) * p2sq * (m1sq-m2sq + 2 * p2sq)) * p1sq**2
            + (
                (D-6) * (p1dotp2)**3 
                + ((3 * D-2) * m1sq-m2sq-3 * D * m3sq + 3 * m3sq + 2 * (3 * D-5) * p2sq) * (p1dotp2)**2 
                + p2sq * (-((2 * D-3) * (2 * m1sq-m2sq-m3sq))-5 * (D-2) * p2sq) * (p1dotp2) 
                + (D-2) * p2sq**2 * (m1sq-m3sq+p2sq)) * p1sq 
            + (p1dotp2) * (
                -2 * (D-4) * (p1dotp2)**3 
                + (D * (-2 * m1sq+m2sq+m3sq)+(D-6) * p2sq) * (p1dotp2)**2 
                + p2sq * ((3 * D-2) * m1sq-3 * D * m2sq+3 * m2sq-m3sq+p2sq) * (p1dotp2) 
                - (D-1) * (m1sq-m2sq) * p2sq**2)
        )
    )
    c0_term = 1/(D-2) * C0(p1sq, p2sq, p1p2sq, m2sq, m1sq, m3sq) * (
        -p2sq * ((D-2) * (m1sq-m3sq+p2sq)-(D-1) * (p1dotp2)) * p1sq**2 
        + (
            -D * (m1sq-m3sq+p2sq) * (p1dotp2)**2 
            + ((D-1) * (m1sq-m3sq)**2 + (D-1) * p2sq**2 
               + 2 * (2 * (D-2) * m1sq-(D-1) * (m2sq+m3sq)) * p2sq) * (p1dotp2) 
               - (D-2) * (m1sq-m2sq) * p2sq**2 * (m1sq-m3sq+p2sq)
        ) * p1sq 
        + (p1dotp2) * ((D-1) * p2sq**2 * (m1sq-m2sq)**2 - D * (p1dotp2) * (m1sq-m3sq+p2sq) * (m1sq-m2sq) + 4 * m1sq * (p1dotp2)**2)
    )

    return factor*(a0term + b0_term + c0_term)

def C00(p12, p23, p31, m1sq, m2sq, m3sq, mu2=1.0):
    """Compute C00 Passarino-Veltman coefficient. See C0 docstring for parameters."""
    p1p2sq = 2*p12 + 2*p23 - p31
    return C00_coeff(p12, p1p2sq, p23, m1sq, m2sq, m3sq, mu2)

def C11(p12, p23, p31, m1sq, m2sq, m3sq, mu2=1.0):
    """Compute C11 Passarino-Veltman coefficient. See C0 docstring for parameters."""
    p1p2sq = 2*p12 + 2*p23 - p31
    return C11_coeff(p12, p1p2sq, p23, m1sq, m2sq, m3sq, mu2)

def C12(p12, p23, p31, m1sq, m2sq, m3sq, mu2=1.0):
    """Compute C12 Passarino-Veltman coefficient. See C0 docstring for parameters."""
    p1p2sq = 2*p12 + 2*p23 - p31
    return C12_coeff(p12, p1p2sq, p23, m1sq, m2sq, m3sq, mu2)

def C22(p12, p23, p31, m1sq, m2sq, m3sq, mu2=1.0):
    """Compute C22 Passarino-Veltman coefficient. See C0 docstring for parameters."""
    p1p2sq = 2*p12 + 2*p23 - p31
    return C22_coeff(p12, p1p2sq, p23, m1sq, m2sq, m3sq, mu2)

def C11_(mX, mi, mj, M0, M1, M2, mu2=1.0):
    """
    Compute the scalar C11_ Passarino Veltman function following the notation
    to agree with LFV X decays with X = S, V. In our notation in comparison with feyncalc,
    the Passarino-Veltman functions for numerical evaluation depends on masses not squared masses.
    Also, the order of masses is changed into m1 -> M1, m2 -> M0, m3 -> M2, and the momentum changes
    into p1 -> -p1, p2 - > - p2, p3 -> -(p1 + p2) which does not change the squared momenta
    """
    p1sq = mi**2
    p2sq = mj**2
    p3sq = mX**2
    M1sq = M1**2
    M0sq = M0**2
    M2sq = M2**2
    return C11(p1sq, p2sq, p3sq, M1sq, M0sq, M2sq, mu2)

def C12_(mX, mi, mj, M0, M1, M2, mu2=1.0):
    """
    Compute the scalar C12_ Passarino Veltman function
    """
    return C12(mX**2, mi**2, mj**2, M0**2, M1**2, M2**2, mu2)

def C22_(mX, mi, mj, M0, M1, M2, mu2=1.0):
    """
    Compute the scalar C22_ Passarino Veltman function
    """
    return C22(mX**2, mi**2, mj**2, M0**2, M1**2, M2**2, mu2)



if __name__ == '__main__':
    td = ql.TadPole()
    #print(help(td.integral))
    print("A0:", A0(5.0))
    print("B0:", B0(100.0, 1.0, 4.0))
    print("B1:", B1(100.0, 1.0, 4.0))
    # Example for B1 near p2=0 (potentially unstable with this formula)
    # print("B1 (p2 near 0):", B1(1e-8, 1.0, 4.0))
    # print("B1 (p2=0, m1=m2):", B1(0.0, 1.0, 1.0)) # Should use specific formula

    print("C0:", C0(100.0, 50.0, 30.0, 1.0, 4.0, 9.0))
    print("C1:", C1(100.0, 50.0, 30.0, 1.0, 4.0, 9.0))
    print("C2:", C2(100.0, 50.0, 30.0, 1.0, 4.0, 9.0))