import mpmath as mp
import pytest
from LFVXD.numeric import qcdloop_pv_wrappers as pv
from formfactors_functions import formfactors_neutrino_sum, Nudata


def test_B1_p2_zero_raises():
    mp.dps = 80
    # current implementation raises ZeroDivisionError at p2 == 0
    with pytest.raises(ZeroDivisionError):
        pv.B1(mp.mpf('0'), mp.mpf('1.0'), mp.mpf('1.0'))


@pytest.mark.parametrize("s_str", ['1e-6', '1e-9', '1e-12', '1e-18'])
def test_C1C2_small_det_problematic(s_str):
    mp.dps = 120
    s = mp.mpf(s_str)
    p1sq = s
    p2sq = s
    p1p2sq = 4 * s
    m1sq = mp.mpf('1.0')
    m2sq = mp.mpf('2.0')
    m3sq = mp.mpf('3.0')
    v1 = pv.C1(p1sq, p2sq, p1p2sq, m1sq, m2sq, m3sq)
    v2 = pv.C2(p1sq, p2sq, p1p2sq, m1sq, m2sq, m3sq)
    # ensure we get an mpmath complex back
    assert isinstance(v1, mp.mpc) and isinstance(v2, mp.mpc)
    # Historically these kinematics produced NaN or huge values; assert we observe problematic output
    is_problematic = (
        mp.isnan(mp.re(v1)) or mp.isnan(mp.im(v1)) or abs(v1) > mp.mpf('1e20') or
        mp.isnan(mp.re(v2)) or mp.isnan(mp.im(v2)) or abs(v2) > mp.mpf('1e20')
    )
    assert is_problematic


def test_formfactors_repro_small_delta():
    mp.dps = 120
    # reuse same parameter set as repro harness
    k1_val = mp.mpf('246')
    vR_val = mp.mpf('5000')
    rho1_val = mp.mpf('0.1')
    alpha13_val = mp.mpf('0.1')
    alpha12_val = mp.mpf('0.1')
    alpha23_val = mp.mpf('0.1')
    lamb12_val = mp.mpf('0.1')
    mHR_val = mp.sqrt(alpha23_val * (k1_val**2 + vR_val**2))

    # neutrino base values
    d21 = mp.mpf(str(Nudata.squareDm21.central)) * mp.mpf('1e-18')
    d31 = mp.mpf(str(Nudata.squareDm31.central)) * mp.mpf('1e-18')
    mn1_val = mp.mpf('1e-12')
    mn2_val = mp.sqrt(mn1_val**2 + d21)
    mn3_val = mp.sqrt(mn1_val**2 + d31)

    delta = mp.mpf('1e-12')
    mn4 = mp.mpf('1000')
    mn5 = mp.mpf('1000') + delta
    mn6 = mp.mpf('3000')
    mni_vals = [mn1_val, mn2_val, mn3_val, mn4, mn5, mn6, mn4 + mp.mpf('1e-6'), mn5 + mp.mpf('1e-6'), mn6 + mp.mpf('1e-6')]
    ml_vals = [mp.mpf('0.001'), mp.mpf('0.105'), mp.mpf('1.776')]

    ff_seq = formfactors_neutrino_sum(mni_vals, ml_vals, rho1_val, alpha13_val, alpha12_val, alpha23_val, lamb12_val, idx_a=1, idx_b=2, k1_val=k1_val, vR_val=vR_val, mHR_val=mHR_val, verbose=False, parallel=False)
    ff_par = formfactors_neutrino_sum(mni_vals, ml_vals, rho1_val, alpha13_val, alpha12_val, alpha23_val, lamb12_val, idx_a=1, idx_b=2, k1_val=k1_val, vR_val=vR_val, mHR_val=mHR_val, verbose=False, parallel=True, max_workers=4)

    rel_tol = mp.mpf('1e-12')
    for key in ff_seq:
        a_seq = ff_seq[key]['AL']; a_par = ff_par[key]['AL']
        r_seq = ff_seq[key]['AR']; r_par = ff_par[key]['AR']
        denom_a = abs(a_par) if abs(a_par) != 0 else mp.mpf('1')
        denom_r = abs(r_par) if abs(r_par) != 0 else mp.mpf('1')
        assert abs((a_seq - a_par) / denom_a) <= rel_tol
        assert abs((r_seq - r_par) / denom_r) <= rel_tol
