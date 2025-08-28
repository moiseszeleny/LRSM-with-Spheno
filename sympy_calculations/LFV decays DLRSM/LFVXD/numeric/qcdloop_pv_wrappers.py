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
        native_args = tuple(_to_native_arg(a) for a in args)
        native_kwargs = {k: _to_native_arg(v) for k, v in kwargs.items()}
        out = orig(*native_args, **native_kwargs)
        return _coerce_result_to_mpc(out)

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
