import mpmath as mp
from LFVXD.numeric.qcdloop_pv import (
    A0, B0, B1_0, B2_0, B1_1, B2_1, B12_0, C0_, C1_, C2_, C0, C1, C2,
)

out_lines = []

def log(s):
    print(s)
    out_lines.append(str(s))

mp.dps = 80
log('mp.dps = {}'.format(mp.dps))

# choose representative external and internal masses
# external lepton masses (small)
ma = mp.mpf('0.105')  # e.g. muon approximate
mb = mp.mpf('0.105')
# heavy internal masses
M0 = mp.mpf('1000')
M1 = mp.mpf('1000.000000000001')
M2 = mp.mpf('900')
# external boson mass (e.g. Higgs-like)
mX = mp.mpf('125')

log(f'ma={ma}, M0={M0}, M1={M1}, M2={M2}, mX={mX}')

# Call PV functions with correct signatures and log types/values
tests = [
    ('B1_0(ma,M0,M1)', B1_0, (ma, M0, M1)),
    ('B2_0(mb,M0,M2)', B2_0, (mb, M0, M2)),
    ('B1_1(ma,M0,M1)', B1_1, (ma, M0, M1)),
    ('B2_1(mb,M0,M2)', B2_1, (mb, M0, M2)),
    ('B12_0(mX,M1,M2)', B12_0, (mX, M1, M2)),
    # C-functions use signature C0_(mX, mi, mj, M0, M1, M2)
    ('C0_(mX,mi,mj,M0,M1,M2)', C0_, (mX, ma, mb, M0, M1, M2)),
    ('C1_(...)', C1_, (mX, ma, mb, M0, M1, M2)),
    ('C2_(...)', C2_, (mX, ma, mb, M0, M1, M2)),
]

results = {}
for name, func, args in tests:
    try:
        r = func(*args)
        results[name] = r
        log(f"{name} -> type: {type(r)}, value: {r}")
    except Exception as e:
        log(f"{name} raised {type(e).__name__}: {e}")
        results[name] = e

# now test sensitivity to precision for a representative C0_ call where internal masses are near-degenerate
log('\nPrecision sensitivity test (mp.dps=60 then 120)')
base_M = mp.mpf('1000')
for delta in ['1e-6', '1e-9', '1e-12', '1e-18']:
    M1_var = base_M + mp.mpf(delta)
    mp.dps = 60
    try:
        v1 = C0_(mX, ma, mb, base_M, M1_var, M2)
    except Exception as e:
        v1 = e
    mp.dps = 120
    try:
        v2 = C0_(mX, ma, mb, base_M, M1_var, M2)
    except Exception as e:
        v2 = e
    log(f'delta={delta}: v1(type={type(v1)})={v1}')
    log(f'           v2(type={type(v2)})={v2}')
    # attempt relative diff
    try:
        rel = abs((v2 - v1) / v2)
    except Exception:
        rel = 'N/A'
    log(f'           rel diff = {rel}')

# save output to file
with open('pv_type_check_output.txt', 'w') as f:
    f.write('\n'.join(out_lines))

log('\nSaved output to pv_type_check_output.txt')
