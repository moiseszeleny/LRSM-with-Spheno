import looptools_py as lt

def A0(m1sq):
    """
    Compute the scalar A0 Passarino-Veltman function.

    Parameters:
        m1sq (float): Mass squared of the propagator.

    Returns:
        complex: A0 result.
    """
    return lt.A0_vec(m1sq)

def B0(p2, m1sq, m2sq):
    """
    Compute the scalar B0 Passarino-Veltman function.

    Parameters:
        p2 (float): External squared momentum.
        m1sq (float): Mass squared of first propagator.
        m2sq (float): Mass squared of second propagator.

    Returns:
        complex: B0 result.
    """
    return lt.B0_vec(p2, m1sq, m2sq)

def B1_0(ma, M0, M1):
    """
    Compute the scalar B1_0 Passarino-Veltman function.

    Parameters:
        mi (float): External lepton i mass.
        M0 (float): Mass of the first propagator.
        M1 (float): Mass of the second propagator.

    Returns:
        complex: B1_0 result.
    """
    p2 = ma**2
    m1sq = M0**2
    m2sq = M1**2
    return B0(p2, m1sq, m2sq)

def B2_0(mb, M0, M2):
    """
    Compute the scalar B2_0 Passarino-Veltman function.

    Parameters:
        mb (float): External lepton ia mass.
        M0 (float): Mass of the first propagator.
        M2 (float): Mass of the second propagator.

    Returns:
        complex: B1_0 result.
    """
    p2 = mb**2
    m1sq = M0**2
    m2sq = M2**2
    return B0(p2, m1sq, m2sq)

def B12_0(mX, M1, M2):
    """
    Compute the scalar B12_0 Passarino-Veltman function.

    Parameters:
        mX (float): External X = S, V mass.
        M1 (float): Mass of the first propagator.
        M2 (float): Mass of the second propagator.

    Returns:
        complex: B12_0 result.
    """
    p2 = mX**2
    m1sq = M1**2
    m2sq = M2**2
    return B0(p2, m1sq, m2sq)


def B1(psq, m1sq, m2sq):
    """
    Compute the scalar B1 Passarino-Veltman function coefficient.
    B_mu = p_mu B1

    Parameters:
        p2 (float): External momentum squared.
        m1sq (float): Mass squared of first propagator.
        m2sq (float): Mass squared of second propagator.

    Returns:
        complex: B1 result.
    Note:
        This formula is singular for p2 = 0. Specific treatment for p2=0 is needed
        for robust computation in that limit.
    """
    return lt.B1_vec(psq, m1sq, m2sq)

def B1_1(ma, M0, M1):
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
    return -B1(p2, m1sq, m2sq)

def B2_1(mb, M0, M2):
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
    return B1(p2, m1sq, m2sq)

def C0(p12, p23, p31, m1sq, m2sq, m3sq):
    """
    Compute the scalar C0 Passarino-Veltman function.

    Parameters:
        p12 (float): Squared momentum p_1^2.
        p23 (float): Squared momentum p_2^2.
        p31 (float): Squared momentum (p_1+p_2)^2.
        m1sq (float): Mass squared of propagator opposite p_1.
        m2sq (float): Mass squared of propagator opposite p_2.
        m3sq (float): Mass squared of propagator opposite p_1+p_2.

    Returns:
        complex: C0 result.
    """
    return lt.C0_vec(p12, p23, p31, m1sq, m2sq, m3sq)

def C0_(mX, mi, mj, M0, M1, M2):
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
    return C0(p1sq, p2sq, p3sq, M1sq, M0sq, M2sq)

def C1(p12, p23, p31, m1sq, m2sq, m3sq):
    """Compute C1 Passarino-Veltman coefficient. See C0 docstring for parameters."""
    return lt.C1_vec(p12, p23, p31, m1sq, m2sq, m3sq)

def C2(p12, p23, p31, m1sq, m2sq, m3sq):
    """Compute C2 Passarino-Veltman coefficient. See C0 docstring for parameters."""
    return lt.C2_vec(p12, p23, p31, m1sq, m2sq, m3sq)

def C2_(mX, mi, mj, M0, M1, M2):
    """
    Compute the scalar C2_ Passarino Veltman function following the notation
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
    return C2(p1sq, p2sq, p3sq, M1sq, M0sq, M2sq)


def C1_(mX, mi, mj, M0, M1, M2):
    """
    Compute the scalar C1_ Passarino Veltman function following the notation
    to agree with LFV X decays with X = S, V. In our notation in comparison with feyncalc,
    the Passarino-Veltman functions for numerical evaluation depends on masses not squared masses.
    Also, the order of masses is changed into m1 -> M1, m2 -> M0, m3 -> M2, and the momentum changes
    into p1 -> -p1, p2 - > - p2, p3 -> -(p1 + p2) which does not change the squared momenta. 
    """
    C0p = C0_(mX, mi, mj, M0, M1, M2)
    C2p = C2_(mX, mi, mj, M0, M1, M2)

    p1sq = mi**2
    p2sq = mj**2
    p3sq = mX**2
    M1sq = M1**2
    M0sq = M0**2
    M2sq = M2**2 
    C1p = C1(p1sq, p2sq, p3sq, M1sq, M0sq, M2sq)
    return C1p + C2p + C0p

def C00(p12, p23, p31, m1sq, m2sq, m3sq):
    """Compute C00 Passarino-Veltman coefficient. See C0 docstring for parameters."""
    return lt.C00_vec(p12, p23, p31, m1sq, m2sq, m3sq)

def C11(p12, p23, p31, m1sq, m2sq, m3sq):
    """Compute C11 Passarino-Veltman coefficient. See C0 docstring for parameters."""
    return lt.C11_vec(p12, p23, p31, m1sq, m2sq, m3sq)

def C12(p12, p23, p31, m1sq, m2sq, m3sq):
    """Compute C12 Passarino-Veltman coefficient. See C0 docstring for parameters."""
    return lt.C12_vec(p12, p23, p31, m1sq, m2sq, m3sq)

def C22(p12, p23, p31, m1sq, m2sq, m3sq):
    """Compute C22 Passarino-Veltman coefficient. See C0 docstring for parameters."""
    return lt.C22_vec(p12, p23, p31, m1sq, m2sq, m3sq)

def C11_(mX, mi, mj, M0, M1, M2):
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
    return C11(p1sq, p2sq, p3sq, M1sq, M0sq, M2sq)

def C12_(mX, mi, mj, M0, M1, M2):
    """
    Compute the scalar C12_ Passarino Veltman function
    """
    return C12(mX**2, mi**2, mj**2, M0**2, M1**2, M2**2)

def C22_(mX, mi, mj, M0, M1, M2):
    """
    Compute the scalar C22_ Passarino Veltman function
    """
    return C22(mX**2, mi**2, mj**2, M0**2, M1**2, M2**2)



if __name__ == '__main__':
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