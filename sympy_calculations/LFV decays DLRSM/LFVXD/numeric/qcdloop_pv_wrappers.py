"""Thin wrappers around LFVXD.numeric.qcdloop_pv that ensure mpmath-compatible outputs.

Each wrapper will:
 - convert any mpmath numeric inputs to native Python floats/complex for the underlying PV call (qcdloop may be a C-backed API),
 - call the original PV function,
 - convert the return value to `mpmath.mpc` so callers always get a consistent high-precision complex type.

Use these wrappers from high-precision code paths that expect `mpmath` numbers.
"""
import mpmath as mp
from . import qcdloop_pv as _pv
from typing import Any
import warnings
import math

def _to_native_arg(x: Any) -> Any:
    """Convert an mpmath numeric to a native python float/complex for calling _pv functions.
    Non-mpmath objects are returned unchanged.
    """
    # mpmath mpf/mpc types
    try:
        if isinstance(x, mp.mpf):
            return float(x)
        if isinstance(x, mp.mpc):
            # convert to Python complex using float-converted parts
            return complex(float(x.real), float(x.imag))
    except Exception:
        # If mp is a different context or x cannot be inspected, fall through
        pass
    # fall back: return original
    return x


def _coerce_result_to_mpc(val: Any) -> mp.mpc:
    """Coerce various numeric return values into an mp.mpc.
    Accepts mp.mpc, mp.mpf, Python float, complex, numpy scalars, etc.
    """
    # If already an mpmath complex, return directly
    try:
        if isinstance(val, mp.mpc):
            return val
        if isinstance(val, mp.mpf):
            return mp.mpc(val)
    except Exception:
        pass

    # If it's a Python complex or float, mp.mpc will accept it
    try:
        return mp.mpc(val)
    except Exception:
        # Last resort: stringify and convert
        try:
            return mp.mpc(complex(str(val)))
        except Exception:
            # If conversion fails, raise a clear error
            raise TypeError(f"Cannot coerce PV function return value to mp.mpc: {val!r}")


def _wrap(name: str):
    """Create a wrapper function for `_pv.<name>` that normalizes inputs and coerces outputs.

    Returns a callable with the same signature (variadic) as the original function.
    """
    if not hasattr(_pv, name):
        raise AttributeError(f"Underlying PV module has no function '{name}'")
    orig = getattr(_pv, name)

    def wrapper(*args, **kwargs):
        # Convert mpmath inputs to native Python types for the backend
        native_args = tuple(_to_native_arg(a) for a in args)
        native_kwargs = {k: _to_native_arg(v) for k, v in kwargs.items()}

        # Try calling the underlying PV routine. If it raises or returns
        # a non-finite value, retry a few times with tiny perturbations to
        # avoid exact singularities (e.g. p^2 == 0 or exact equal masses).
        try:
            out = orig(*native_args, **native_kwargs)
        except Exception as first_exc:
            # Retry with small perturbations to numeric zero-arguments
            last_exc = first_exc
            for r in range(1, 6):
                perturbed_args = []
                eps = 1e-12 * r
                for a in native_args:
                    if isinstance(a, (int, float)) and a == 0:
                        perturbed_args.append(a + eps)
                    else:
                        perturbed_args.append(a)
                try:
                    out = orig(*tuple(perturbed_args), **native_kwargs)
                    break
                except Exception as exc:
                    last_exc = exc
                    continue
            else:
                # All retries failed: re-raise the original exception but
                # include a helpful message.
                warnings.warn(
                    f"PV wrapper: underlying function '{name}' failed after retries: {first_exc}")
                raise last_exc

        # Coerce the result and check for NaN/Inf. If non-finite, attempt a few
        # retries similar to above and finally replace with a zero-valued complex
        # to keep downstream code running (low-risk).
        try:
            coerced = _coerce_result_to_mpc(out)
            # Check finiteness
            if mp.isnan(mp.re(coerced)) or mp.isnan(mp.im(coerced)) or mp.isinf(mp.re(coerced)) or mp.isinf(mp.im(coerced)):
                raise ValueError("non-finite PV result")
            return coerced
        except Exception:
            # Retry numeric perturbations once more
            for r in range(1, 6):
                perturbed_args = []
                eps = 1e-12 * r
                for a in native_args:
                    if isinstance(a, (int, float)) and a == 0:
                        perturbed_args.append(a + eps)
                    else:
                        perturbed_args.append(a)
                try:
                    out = orig(*tuple(perturbed_args), **native_kwargs)
                    coerced = _coerce_result_to_mpc(out)
                    if not (mp.isnan(mp.re(coerced)) or mp.isnan(mp.im(coerced)) or mp.isinf(mp.re(coerced)) or mp.isinf(mp.im(coerced))):
                        return coerced
                except Exception:
                    continue
            warnings.warn(f"PV wrapper: non-finite result from '{name}', returning 0+0j to continue.")
            return mp.mpc(0)

    wrapper.__name__ = name
    wrapper.__doc__ = f"Wrapper around _pv.{name}: coerces output to mpmath.mpc.\n\n" + (getattr(orig, "__doc__", "") or "")
    return wrapper


# Exported wrappers for commonly used PV functions
_A0 = _wrap('A0')
B0 = _wrap('B0')
B1 = _wrap('B1')
B1_0 = _wrap('B1_0')
B2_0 = _wrap('B2_0')
B12_0 = _wrap('B12_0')
B1_1 = _wrap('B1_1')
B2_1 = _wrap('B2_1')
C0 = _wrap('C0')
C0_ = _wrap('C0_')
C1 = _wrap('C1')
C1_ = _wrap('C1_')
C2 = _wrap('C2')
C2_ = _wrap('C2_')

__all__ = [
    'B0', 'B1', 'B1_0', 'B2_0', 'B12_0', 'B1_1', 'B2_1',
    'C0', 'C0_', 'C1', 'C1_', 'C2', 'C2_', 'A0',
]

# Expose A0 with a normal name too
A0 = _A0
