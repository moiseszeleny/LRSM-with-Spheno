PV functions: thresholds, singularities, and type support
=========================================================

Checklist
 - [ ] Verify PV functions accept and return mpmath types (mp.mpf / mp.mpc).
 - [ ] Identify threshold/near-degenerate mass combinations where denominators approach 0.
 - [ ] Add small-denominator guards and analytic expansions for critical PV combinations.
 - [ ] Add tests that compare float-backed PV vs mpmath-backed PV near edges.
 - [ ] Add optional higher-precision retry logic (adaptive mp.dps) for problematic points.
 - [ ] Validate thread-safety for PV calls when using ThreadPoolExecutor.

Summary
-------
This document focuses on practical checks and fixes for numerical instabilities coming from the Passarino–Veltman (PV) loop functions used in `formfactors_functions.py`. Instabilities commonly arise when:

 - kinematic arguments are near thresholds (masses equal or small differences), producing large cancellations or discontinuities;
 - functions mix standard Python/NumPy floats with `mpmath` high-precision types, causing type fallbacks and precision loss;
 - internal PV implementations use divisions by (m1-m2) or logs of (m1/m2) without guarding tiny differences;
 - PV functions are not thread-safe and produce inconsistent results when evaluated concurrently.

Goals
-----
1. Confirm the PV functions in `LFVXD.numeric.qcdloop_pv` behave correctly with `mpmath` inputs.
2. Add defensive checks and series expansions for near-degenerate mass cases.
3. Provide reproducible micro-tests and examples to detect problematic parameter regions.
4. Propose minimal, low-risk code changes to mitigate instabilities and keep performance reasonable.

What to inspect first
---------------------
1. Inspect implementation of the PV functions: `B1_0, B2_0, B1_1, B2_1, B12_0, C0_, C1_, C2_` in `LFVXD.numeric.qcdloop_pv`.
   - Are they implemented in pure Python, NumPy, or C extension?
   - Do they accept arbitrary numeric types, or convert inputs via float(...) internally?

2. Identify formula patterns that commonly produce trouble:
   - expressions like (m1**2 - m2**2) in denominators;
   - logarithms of ratios log(m1/m2) when m1 ~ m2;
   - square roots of small positive/negative rounding-caused values.

3. Check whether outputs are Python complex/float or `mpmath` numbers when given `mpmath` inputs. Mixed types lead to unstable mixing in downstream sums.

Reproducible tests (copy into a small script or notebook cell)
-------------------------------------------------------------
Below are short tests to run in the project environment (place in a test cell or small script). They don't require changing PV sources yet—just probe behavior.

1) Basic type / value check

```python
import mpmath as mp
from LFVXD.numeric.qcdloop_pv import B1_0, C0_, C1_, C2_
mp.dps = 80

m1 = mp.mpf('1000')
m2 = mp.mpf('1000.000000000001')
# call with mpmath types
rB1 = B1_0(m1, m2)
rC0 = C0_(m1, m2, m1)  # example signature; adjust to actual function signature

print('types:', type(rB1), type(rC0))
print('B1_0(m1,m2)=', rB1)
```

Goal: verify return types are mp.mpf/mp.mpc or at least convertible reliably. If `type(rB1)` is `float`/`complex`/`numpy` scalar, then lambdify paths might have fallen back to float numerics or PV implementation forces float casting.

2) Near-degenerate behavior and comparison with higher precision

```python
mp.dps = 60
m1 = mp.mpf('1e3')
for delta in ['1e-6', '1e-9', '1e-12', '1e-18']:
    m2 = m1 + mp.mpf(delta)
    mp.dps = 60
    v1 = C0_(m1, m2, m1)
    mp.dps = 120
    v2 = C0_(m1, m2, m1)
    print(delta, '->', v1)
    print(' high-prec ->', v2)
    # relative difference
    try:
        rel = abs((v2 - v1) / v2)
    except Exception:
        rel = None
    print(' rel diff =', rel)
```

Large relative differences when increasing precision indicate problematic numerics (cancellation or type fallback). For such points, we should implement analytic limiting forms.

Suggested fixes and guard implementations
----------------------------------------
1) Type-compatible wrapper

Create a small wrapper around every PV function that coerces inputs to appropriate numeric types and returns `mpmath` numbers. Example wrapper:

```python
import mpmath as mp
from LFVXD.numeric.qcdloop_pv import C0_ as _C0

def C0_mpmath(m1, m2, m3, *, tol=0):
    # Ensure inputs are mp.mpf/mp.mpc
    m1 = mp.mpc(m1)
    m2 = mp.mpc(m2)
    m3 = mp.mpc(m3)
    # Call underlying PV function (which may accept mp types) or its float variant and convert
    out = _C0(m1, m2, m3)
    return mp.mpc(out)
```

If the PV implementation forces float conversion (e.g. uses math.log), then wrap calls inside float(...) (undesirable) or reimplement the critical parts in mpmath.

2) Small-difference series expansions

For expressions like (log(m1)-log(m2))/(m1-m2) or log(m1/m2)/(m1-m2), use a Taylor expansion when |m1-m2|/max(m1,m2) < epsilon:

 - Use numeric series: (d/dm) log(m) at midpoint 8 ~ 1/midpoint
 - For more complex PV combinations consult analytic limits in the literature (e.g., Denner 1993 formulae) and implement their short-range expansions.

Implement a helper `safe_div_log_ratio(a,b)`:

```python
def safe_log_ratio_over_diff(a, b):
    # returns log(a/b)/(a-b) with expansion when a~b
    a = mp.mpf(a); b = mp.mpf(b)
    diff = a - b
    if abs(diff) < mp.mpf('1e-12') * max(abs(a), abs(b), 1):
        mid = (a + b)/2
        # series: log(a/b) ~ (a-b)/mid - (a-b)^3/(24 mid^3) + ...
        return (1/mid) - (diff**2)/(24*mid**3)
    return mp.log(a/b)/diff
```

3) Add logging and tolerances

- Add debug logging when: |m1-m2|/max(...) < 1e-6 or denominator absolute < 1e-20.
- For such flagged points, either use higher mp.dps or analytic expansion.

4) Adaptive precision retry wrapper

Wrap the troubled PV evaluation in a retry: try with mp.dps=N (e.g., 120), if result changes more than rel_tol when doubling precision, increase precision up to a safe upper limit (e.g., 1024 bits / dps=300) and return stable value or raise.

Minimal code sketch:

```python
from contextlib import contextmanager

@contextmanager
def temp_dps(new_dps):
    old = mp.dps
    mp.dps = new_dps
    try:
        yield
n    finally:
        mp.dps = old


def pv_with_retry(func, args, dps0=120, max_dps=600, rel_tol=mp.mpf('1e-12')):
    dps = dps0
    with temp_dps(dps):
        v = func(*args)
    while dps < max_dps:
        dps *= 2
        with temp_dps(dps):
            v2 = func(*args)
        if v == 0:
            if abs(v2) < rel_tol:
                return v2
        else:
            if abs((v2-v)/v2) < rel_tol:
                return v2
        v = v2
    return v
```

Thread-safety checks
--------------------
 - Run deterministic small-batch tests sequentially and with `parallel=True` in `formfactors_neutrino_sum`. Compare results with a relative tolerance (1e-12 or tuned). If results differ significantly, either revert to sequential evaluation for PV calls, or isolate PV calls in processes (ProcessPool) and ensure pickling of wrappers.

Quick regression test
---------------------
 - Pick a few vR values where you observed instabilities in the notebook.
 - For each, run `instance_degenerate_total_formfactors(...)` sequentially and in parallel and compare `AL`/`AR` (real/imag parts) using mp relative tolerance.
 - Also test PV functions directly around their internal mass combinations used in the diagrams.

Example test harness (brief)

```python
from formfactors_functions import formfactors_neutrino_sum
import mpmath as mp
mp.dps = 120

params = {
  'mni_vals': [...],
  'ml_vals': [...],
  'rho1_val': ..., # pick one case
}
# sequential
mp.dps = 120
ff_seq = formfactors_neutrino_sum(..., parallel=False)
# parallel
mp.dps = 120
ff_par = formfactors_neutrino_sum(..., parallel=True, max_workers=4)

# Compare
for key in ff_seq:
    a_seq = ff_seq[key]['AL']; a_par = ff_par[key]['AL']
    if abs(a_seq - a_par) / (abs(a_par) + mp.mpf('1e-30')) > mp.mpf('1e-10'):
        print('DIFFER', key)
```

Next steps
----------
1. Run the "Basic type / value check" on your environment to verify whether `LFVXD.numeric.qcdloop_pv` returns `mpmath` types when given `mpmath` inputs.
2. If PV functions cast to float internally, either reimplement critical PV formulas in pure mpmath or create wrappers that use analytic expansions for near-degenerate cases.
3. Add the small helpers `safe_log_ratio_over_diff` and small-denominator guards in the PV module, or wrap PV functions where they are called in `formfactors_functions.py`.
4. Add regression tests that compare sequential vs parallel runs and check absolute and relative differences for a small set of cases.

If you want, I can:
 - run the basic type/value checks in this workspace now (I can execute small test scripts),
 - add the `safe_log_ratio_over_diff` helper and a quick wrapper to the PV calls in `formfactors_functions.py` and re-run a notebook cell to verify stability.

References
----------
 - Ansgar Denner, "Techniques for calculation of electroweak radiative corrections at the one-loop level and results for W-physics at LEP200" (1993) — analytic PV limiting formulas.
 - mpmath docs: https://mpmath.org for high-precision arithmetic and complex numbers.

End of audit.
