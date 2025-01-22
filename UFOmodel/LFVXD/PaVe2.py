#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Monday Jul 30 2024

@author: Moises Zeleny (moiseszeleny@gmail.com)

The symbolic formalism of LFV Higgs decays is coded in this module
"""
from sympy import Function, symbols, I, Basic
from sympy import log

#############################
# Definitions of expressions for bi and Ci functions
from functions2 import b1_0sp, b1_1sp, b2_0sp, b2_1sp, xkf, x0, x3, R0
from functions2 import cambiosx
#############################
# Symbolic variables
δ = 0  # Infinitesimal parameter for integrals

#######################################
# Funciones de Passarino Veltman pertinentes para LFVHD
#######################################
# Funciones de PaVe escalares
# Divergencie symbol
Δe = symbols(r'\Delta_\epsilon')
# Dimension in regularization
D = symbols('D') 
# A0 function definition

#class PaVeFunction(Function):
#    r"""Base class for Passarino-Veltman functions."""
#    pass

class PaVeFunction(Function):
    r"""Base class for Passarino-Veltman functions."""

    def _split_divergence_finite(self):
        """
        Decompose the function into its divergent and finite parts.
        This must be implemented in subclasses.
        """
        raise NotImplementedError("Subclasses must implement _split_divergence_finite.")

    def doit(self, deep=False, **hints):
        """
        Separate into divergent and finite parts.
        """
        div_part, finite_part = self._split_divergence_finite()
        if deep:
            div_part = div_part.doit(deep=deep, **hints)
            finite_part = finite_part.doit(deep=deep, **hints)
        return div_part + finite_part

    def _eval_evalf(self, prec):
        """
        Automatically evaluate finite parts numerically.
        """
        div_part, finite_part = self._split_divergence_finite()
        # Evaluate the finite part numerically
        finite_part_numeric = finite_part._eval_evalf(prec)
        return div_part + finite_part_numeric



class a0(Function):
    # mX = symbols('m_X', positive=True)
    @classmethod
    def eval(cls, mX, M):
        pass

    def _latex(self, printer):
        mX, M = self.args#[0]
        return rf'a_0({printer.doprint(mX)}, {printer.doprint(M)})'
    
    def doit(self, deep=False, **hints):
        mX, M = self.args
        if deep:
            M = M.doit()
            mX = mX.doit()
        return M**2*(1+log((mX**2-I*δ)/(M**2-I*δ)))
    
    def _eval_evalf(self, prec):
        return self.doit()._eval_evalf(prec)

class A0(PaVeFunction):
    @classmethod
    def eval(cls, mX, M):
        pass

    def _latex(self, printer):
        mX, M = self.args
        return rf'A_0({printer.doprint(mX)}, {printer.doprint(M)})'

    def finite(self):
        args = self.args
        return a0(*args)
    
    def div(self):
        M = self.args[0]
        return M**2*Δe
    
    def divfin(self):
        return self.div() + self.finite()

    #def doit(self, deep=False, **hints):
    #    mx, M = self.args
    #    if deep:
    #        M = M.doit()
    #        mx = mx.doit()
    #    return self.div() + self.finite().doit()
    
    #def _eval_evalf(self, prec):
    #    return self.doit()._eval_evalf(prec)
    def _split_divergence_finite(self):
        """
        Decompose into divergent and finite parts.
        """
        return self.div(), self.finite()

    def doit(self, deep=False, **hints):
        """
        Override doit to decompose into divergent and finite parts.
        """
        return super().doit(deep=deep, **hints)

    def _eval_evalf(self, prec):
        """
        Evaluate numerically: divergent remains symbolic, finite is numeric.
        """
        return super()._eval_evalf(prec)

# B1_0 definitions
class b1_0(Function):
    @classmethod
    def eval(cls, ma, M0, M1):
        pass

    def _latex(self, printer):
        ma, M0, M1 = self.args
        return rf'b^{{\left(1\right)}}_0({printer.doprint(ma)}, {printer.doprint(M0)}, {printer.doprint(M1)})'
    
    def doit(self, deep=False, **hints):
        ma, M0, M1 = self.args
        if deep:
            ma = ma.doit()
            M0 = M0.doit()
            M1 = M1.doit()
        return b1_0sp(ma, M0, M1)
    
    def _eval_evalf(self, prec):
        return self.doit()._eval_evalf(prec)

class B1_0(PaVeFunction):
    @classmethod
    def eval(cls, ma, M0, M1):
        pass

    def _latex(self, printer):
        ma, M0, M1 = self.args # 
        return rf'B^{{\left(1\right)}}_0({printer.doprint(ma)}, {printer.doprint(M0)}, {printer.doprint(M1)})'
    
    def finite(self):
        args = self.args
        return b1_0(*args)
    
    def div(self):
        return Δe
    
    def divfin(self):
        return self.div() + self.finite()
    
    #def doit(self, deep=False, **hints):
    #    ma, M0, M1 = self.args
    #    if deep:
    #        ma = ma.doit()
    #        M0 = M0.doit()
    #        M1 = M1.doit()
    #    return self.div() + self.finite().doit()
    
    #def _eval_evalf(self, prec):
    #    return self.doit()._eval_evalf(prec)

    def _split_divergence_finite(self):
        """
        Decompose into divergent and finite parts.
        """
        return self.div(), self.finite()

    def doit(self, deep=False, **hints):
        """
        Override doit to decompose into divergent and finite parts.
        """
        return super().doit(deep=deep, **hints)

    def _eval_evalf(self, prec):
        """
        Evaluate numerically: divergent remains symbolic, finite is numeric.
        """
        return super()._eval_evalf(prec)

# B2_0 definitions
class b2_0(Function):
    @classmethod
    def eval(cls, mb, M0, M2):
        pass

    def _latex(self, printer):
        mb, M0, M2 = self.args
        return rf'b^{{\left(2\right)}}_0({printer.doprint(mb)}, {printer.doprint(M0)}, {printer.doprint(M2)})'
    
    def doit(self, deep=False, **hints):
        mb, M0, M2 = self.args
        if deep:
            mb = mb.doit()
            M0 = M0.doit()
            M2 = M2.doit()
        return b2_0sp(mb, M0, M2)
    
    def _eval_evalf(self, prec):
        return self.doit()._eval_evalf(prec)

class B2_0(PaVeFunction):
    @classmethod
    def eval(cls, mb, M0, M2):
        pass

    def _latex(self, printer):
        mb, M0, M2 = self.args # 
        return rf'B^{{\left(2\right)}}_0({printer.doprint(mb)}, {printer.doprint(M0)}, {printer.doprint(M2)})'
    
    def finite(self):
        args = self.args
        return b2_0(*args)
    
    def div(self):
        return Δe
    
    def divfin(self):
        return self.div() + self.finite()
    
    #def doit(self, deep=False, **hints):
    #    mb, M0, M2 = self.args
    #    if deep:
    #        mb = mb.doit()
    #        M0 = M0.doit()
    #        M2 = M2.doit()
    #    return self.div() + self.finite().doit()
    
    #def _eval_evalf(self, prec):
    #    return self.doit()._eval_evalf(prec)

    def _split_divergence_finite(self):
        """
        Decompose into divergent and finite parts.
        """
        return self.div(), self.finite()

    def doit(self, deep=False, **hints):
        """
        Override doit to decompose into divergent and finite parts.
        """
        return super().doit(deep=deep, **hints)

    def _eval_evalf(self, prec):
        """
        Evaluate numerically: divergent remains symbolic, finite is numeric.
        """
        return super()._eval_evalf(prec)

# B12_0 definitions
class b12_0(Function):
    @classmethod
    def eval(cls, mX, M1, M2):
        pass

    def _latex(self, printer):
        mX, M1, M2 = self.args
        return rf'b^{{\left(12\right)}}_0({printer.doprint(mX)}, {printer.doprint(M1)}, {printer.doprint(M2)})'
    
    def doit(self, deep=False, **hints):
        mX, M1, M2 = self.args
        if deep:
            mX = mX.doit()
            M1 = M1.doit()
            M2 = M2.doit()
        x1, x2 = xkf(1, M1, M2), xkf(2, M1, M2)
        
        return log((mX**2 - I*δ)/(M1**2 - I*δ))/2 +\
            sum(x*(log(1 - 1/x)) for x in [x1, x2]).subs(cambiosx(M1, M2, mX))
    
    def _eval_evalf(self, prec):
        return self.doit()._eval_evalf(prec)

class B12_0(PaVeFunction):
    @classmethod
    def eval(cls, mX, M1, M2):
        pass

    def _latex(self, printer):
        mX, M1, M2 = self.args # 
        return rf'B^{{\left(12\right)}}_0({printer.doprint(mX)}, {printer.doprint(M1)}, {printer.doprint(M2)})'
    
    def finite(self):
        args = self.args
        return b12_0(*args)
    
    def div(self):
        return Δe
    
    def divfin(self):
        return self.div() + self.finite()
    
    #def doit(self, deep=False, **hints):
    #    mX, M1, M2 = self.args
    #    if deep:
    #        mX = mX.doit()
    #        M1 = M1.doit()
    #        M2 = M2.doit()
    #    return self.div() + self.finite().doit()
    
    #def _eval_evalf(self, prec):
    #    return self.doit()._eval_evalf(prec)

    def _split_divergence_finite(self):
        """
        Decompose into divergent and finite parts.
        """
        return self.div(), self.finite()

    def doit(self, deep=False, **hints):
        """
        Override doit to decompose into divergent and finite parts.
        """
        return super().doit(deep=deep, **hints)

    def _eval_evalf(self, prec):
        """
        Evaluate numerically: divergent remains symbolic, finite is numeric.
        """
        return super()._eval_evalf(prec)

# B1_1 definitions
class b1_1(Function):
    @classmethod
    def eval(cls, ma, M0, M1):
        pass

    def _latex(self, printer):
        ma, M0, M1 = self.args
        return rf'b^{{\left(1\right)}}_1({printer.doprint(ma)}, {printer.doprint(M0)}, {printer.doprint(M1)})'
    
    def doit(self, deep=False, **hints):
        ma, M0, M1 = self.args
        if deep:
            ma = ma.doit()
            M0 = M0.doit()
            M1 = M1.doit()
        return b1_1sp(ma, M0, M1)
    
    def _eval_evalf(self, prec):
        return self.doit()._eval_evalf(prec)

class B1_1(PaVeFunction):
    @classmethod
    def eval(cls, ma, M0, M1):
        pass

    def _latex(self, printer):
        ma, M0, M1 = self.args # 
        return rf'B^{{\left(1\right)}}_1({printer.doprint(ma)}, {printer.doprint(M0)}, {printer.doprint(M1)})'
    
    def finite(self):
        args = self.args
        return b1_1(*args)
    
    def div(self):
        return Δe/2
    
    def divfin(self):
        return self.div() + self.finite()
    
    #def doit(self, deep=False, **hints):
    #    ma, M0, M1 = self.args
    #    if deep:
    #        ma = ma.doit()
    #        M0 = M0.doit()
    #        M1 = M1.doit()
    #    return self.div() + self.finite().doit()
    
    #def _eval_evalf(self, prec):
    #    return self.doit()._eval_evalf(prec)

    def _split_divergence_finite(self):
        """
        Decompose into divergent and finite parts.
        """
        return self.div(), self.finite()

    def doit(self, deep=False, **hints):
        """
        Override doit to decompose into divergent and finite parts.
        """
        return super().doit(deep=deep, **hints)

    def _eval_evalf(self, prec):
        """
        Evaluate numerically: divergent remains symbolic, finite is numeric.
        """
        return super()._eval_evalf(prec)

# B2_1 definitions
class b2_1(Function):
    @classmethod
    def eval(cls, mb, M0, M2):
        pass

    def _latex(self, printer):
        mb, M0, M2 = self.args
        return rf'b^{{\left(2\right)}}_1({printer.doprint(mb)}, {printer.doprint(M0)}, {printer.doprint(M2)})'
    
    def doit(self, deep=False, **hints):
        mb, M0, M2 = self.args
        if deep:
            mb = mb.doit()
            M0 = M0.doit()
            M2 = M2.doit()
        return b2_1sp(mb, M0, M2)
    
    def _eval_evalf(self, prec):
        return self.doit()._eval_evalf(prec)

class B2_1(PaVeFunction):
    @classmethod
    def eval(cls, mb, M0, M2):
        pass

    def _latex(self, printer):
        mb, M0, M2 = self.args # 
        return rf'B^{{\left(2\right)}}_1({printer.doprint(mb)}, {printer.doprint(M0)}, {printer.doprint(M2)})'
    
    def finite(self):
        args = self.args
        return b2_1(*args)
    
    def div(self):
        return -Δe/2
    
    def divfin(self):
        return self.div() + self.finite()
    
    #def doit(self, deep=False, **hints):
    #    mb, M0, M2 = self.args
    #    if deep:
    #        mb = mb.doit()
    #        M0 = M0.doit()
    #        M2 = M2.doit()
    #    return self.div() + self.finite().doit()
    
    #def _eval_evalf(self, prec):
    #    return self.doit()._eval_evalf(prec)

    def _split_divergence_finite(self):
        """
        Decompose into divergent and finite parts.
        """
        return self.div(), self.finite()

    def doit(self, deep=False, **hints):
        """
        Override doit to decompose into divergent and finite parts.
        """
        return super().doit(deep=deep, **hints)

    def _eval_evalf(self, prec):
        """
        Evaluate numerically: divergent remains symbolic, finite is numeric.
        """
        return super()._eval_evalf(prec)

# B12_1 definitions
class b12_1(Function):
    @classmethod
    def eval(cls, mX, M1, M2):
        pass

    def _latex(self, printer):
        mX, M1, M2 = self.args
        return rf'b^{{\left(12\right)}}_1({printer.doprint(mX)}, {printer.doprint(M1)}, {printer.doprint(M2)})'
    
    def doit(self, deep=False, **hints):
        mX, M1, M2 = self.args
        if deep:
            mX = mX.doit()
            M1 = M1.doit()
            M2 = M2.doit()
        return ((1/(2*mX**2))*(
            M1**2*(1+log(mX**2/M1**2)) - M2**2*(1+log(mX**2/M2**2))
            ) + b12_0(mX, M1, M2).doit()/(2*mX**2)*(M2**2-M1**2 + mX**2)
            ).subs(cambiosx(M1, M2, mX))
    
    def _eval_evalf(self, prec):
        return self.doit()._eval_evalf(prec)

class B12_1(PaVeFunction):
    @classmethod
    def eval(cls, mX, M1, M2):
        pass

    def _latex(self, printer):
        mX, M1, M2 = self.args # 
        return rf'B^{{\left(12\right)}}_1({printer.doprint(mX)}, {printer.doprint(M1)}, {printer.doprint(M2)})'
    
    def finite(self):
        args = self.args
        return b12_1(*args)
    
    def div(self):
        return Δe/2
    
    def divfin(self):
        return self.div() + self.finite()
    
    #def doit(self, deep=False, **hints):
    #    mX, M1, M2 = self.args
    #    if deep:
    #        mX = mX.doit()
    #        M1 = M1.doit()
    #        M2 = M2.doit()
    #    return self.div() + self.finite().doit()
    
    #def _eval_evalf(self, prec):
    #    return self.doit()._eval_evalf(prec)

    def _split_divergence_finite(self):
        """
        Decompose into divergent and finite parts.
        """
        return self.div(), self.finite()

    def doit(self, deep=False, **hints):
        """
        Override doit to decompose into divergent and finite parts.
        """
        return super().doit(deep=deep, **hints)

    def _eval_evalf(self, prec):
        """
        Evaluate numerically: divergent remains symbolic, finite is numeric.
        """
        return super()._eval_evalf(prec)

# B12_2 definitions
class b12_2(Function):
    @classmethod
    def eval(cls, mX, M1, M2):
        pass

    def _latex(self, printer):
        mX, M1, M2 = self.args
        return rf'b^{{\left(12\right)}}_2({printer.doprint(mX)}, {printer.doprint(M1)}, {printer.doprint(M2)})'
    
    def doit(self, deep=False, **hints):
        mX, M1, M2 = self.args
        if deep:
            mX = mX.doit()
            M1 = M1.doit()
            M2 = M2.doit()
        return ((1/(2*mX**2))*(
                M1**2*(1+log(mX**2/M1**2)) - M2**2*(1+log(mX**2/M2**2))
                ) + b12_0(mX, M1, M2).doit()/(2*mX**2)*(M2**2-M1**2 - mX**2)
                ).subs(cambiosx(M1, M2, mX))
    
    def _eval_evalf(self, prec):
        return self.doit()._eval_evalf(prec)

class B12_2(PaVeFunction):
    @classmethod
    def eval(cls, mX, M1, M2):
        pass

    def _latex(self, printer):
        mX, M1, M2 = self.args # 
        return rf'B^{{\left(12\right)}}_2({printer.doprint(mX)}, {printer.doprint(M1)}, {printer.doprint(M2)})'
    
    def finite(self):
        args = self.args
        return b12_2(*args)
    
    def div(self):
        return -Δe/2
    
    def divfin(self):
        return self.div() + self.finite()
    
    #def doit(self, deep=False, **hints):
    #    mX, M1, M2 = self.args
    #    if deep:
    #        mX = mX.doit()
    #        M1 = M1.doit()
    #        M2 = M2.doit()
    #    return self.div() + self.finite().doit()
    
    #def _eval_evalf(self, prec):
    #    return self.doit()._eval_evalf(prec)

    def _split_divergence_finite(self):
        """
        Decompose into divergent and finite parts.
        """
        return self.div(), self.finite()

    def doit(self, deep=False, **hints):
        """
        Override doit to decompose into divergent and finite parts.
        """
        return super().doit(deep=deep, **hints)

    def _eval_evalf(self, prec):
        """
        Evaluate numerically: divergent remains symbolic, finite is numeric.
        """
        return super()._eval_evalf(prec)

# C0 definition
class C0(PaVeFunction):
    @classmethod
    def eval(cls, mX, ma, mb, M0, M1, M2):
        pass

    def _latex(self, printer):
        mX, ma, mb, M0, M1, M2 = self.args # 
        return rf'C_0({printer.doprint(mX)}, {printer.doprint(ma)}, {printer.doprint(mb)}, {printer.doprint(M0)}, {printer.doprint(M1)}, {printer.doprint(M2)})'
    
    #def doit(self, deep=False, **hints):
    #    mX, ma, mb, M0, M1, M2 = self.args
    #    if deep:
    #        mX = mX.doit()
    #        ma = ma.doit()
    #        mb = mb.doit()
    #        M0 = M0.doit()
    #        M1 = M1.doit()
    #        M2 = M2.doit()
    #    y0 = x0(mX, M0, M2)
    #    y1 = xkf(1, M1, M2)
    #    y2 = xkf(2, M1, M2)
    #    y3 = x3(M0, M1)
    #    return ((R0(y0, y1) + R0(y0, y2) - R0(y0, y3))/mX**2
    #            ).subs(cambiosx(M1, M2, mX))

    #def _eval_evalf(self, prec):
    #    mX, ma, mb, M0, M1, M2 = self.args
    #    y0 = x0(mX, M0, M2)
    #    y1 = xkf(1, M1, M2)
    #    y2 = xkf(2, M1, M2)
    #    y3 = x3(M0, M1)
    #    return ((R0(y0, y1) + R0(y0, y2) - R0(y0, y3))/mX**2
    #            ).subs(cambiosx(M1, M2, mX))._eval_evalf(prec)

    def _split_divergence_finite(self):
        """
        Since C0 has no divergence, return 0 as the divergent part
        and the finite part as itself.
        """
        return 0, self  # No divergent part, only the finite part

    def _eval_evalf(self, prec):
        """
        Automatically compute the finite part (no divergence) and evaluate it numerically.
        """
        try:
            # Extract arguments
            mX, ma, mb, M0, M1, M2 = self.args

            # Compute the finite part directly
            y0 = x0(mX, M0, M2)
            y1 = xkf(1, M1, M2)
            y2 = xkf(2, M1, M2)
            y3 = x3(M0, M1)

            # Substitute and simplify the finite part
            finite_part = ((R0(y0, y1) + R0(y0, y2) - R0(y0, y3)) / mX**2).subs(cambiosx(M1, M2, mX))

            # Evaluate the finite part numerically
            return finite_part.evalf(prec)
        except RecursionError:
            raise ValueError("Infinite recursion in evaluating C0. Check the inputs.")


# C1 definition
class C1(PaVeFunction):
    @classmethod
    def eval(cls, mX, ma, mb, M0, M1, M2):
        pass

    def _latex(self, printer):
        mX, ma, mb, M0, M1, M2 = self.args # 
        return rf'C_1({printer.doprint(mX)}, {printer.doprint(ma)}, {printer.doprint(mb)}, {printer.doprint(M0)}, {printer.doprint(M1)}, {printer.doprint(M2)})'
    
    #def divfin(self):
    #    return self.div() + self.finite()
    
    def doit(self, deep=False, **hints):
        args = self.args
        mX, ma, mb, M0, M1, M2 = args
        if deep:
            mX = mX.doit() if isinstance(mX, Basic) else mX
            ma = ma.doit() if isinstance(ma, Basic) else ma
            mb = mb.doit() if isinstance(mb, Basic) else mb
            M0 = M0.doit() if isinstance(M0, Basic) else M0
            M1 = M1.doit() if isinstance(M1, Basic) else M1
            M2 = M2.doit() if isinstance(M2, Basic) else M2
        mabq = ma**2 + mb**2 - mX**2
        f1 = M1**2 - M0**2 + ma**2
        f2 = M2**2 - M0**2 + mb**2
        result = ((
            2*mb**2*(-C0(*args)*f1 - B12_0(mX, M1, M2) + B2_0(mb, M0, M2)) + 
            mabq*(C0(*args)*f2 - B1_0(ma, M0, M1) + B12_0(mX, M1, M2))
        )/(4*ma**2*mb**2 - mabq**2))
        return Basic(result) if isinstance(result, int) else result
    
    def _eval_evalf(self, prec):
        return self.doit().doit(deep=True)._eval_evalf(prec)

# C2 definition
class C2(PaVeFunction):
    @classmethod
    def eval(cls, mX, ma, mb, M0, M1, M2):
        pass

    def _latex(self, printer):
        mX, ma, mb, M0, M1, M2 = self.args # 
        return rf'C_2({printer.doprint(mX)}, {printer.doprint(ma)}, {printer.doprint(mb)}, {printer.doprint(M0)}, {printer.doprint(M1)}, {printer.doprint(M2)})'
    
    def doit(self, deep=False, **hints):
        args = self.args
        mX, ma, mb, M0, M1, M2 = args
        if deep:
            mX = mX.doit()
            ma = ma.doit()
            mb = mb.doit()
            M0 = M0.doit()
            M1 = M1.doit()
            M2 = M2.doit()
        mabq = ma**2 + mb**2 - mX**2
        f1 = M1**2 - M0**2 + ma**2
        f2 = M2**2 - M0**2 + mb**2
        result =  (
                2*ma**2*(-C0(*args)*f2 + B1_0(ma, M0, M1) - B12_0(mX, M1, M2)) + 
                mabq*(C0(*args)*f1 + B12_0(mX, M1, M2) - B2_0(mb, M0, M2))
            )/(4*ma**2*mb**2 - mabq**2)
        return Basic(result) if isinstance(result, int) else result
    
    def _eval_evalf(self, prec):
        return self.doit().doit(deep=True)._eval_evalf(prec)

class C00(PaVeFunction):
    @classmethod
    def eval(cls, mX, ma, mb, M0, M1, M2):
        pass
    def _latex(self, printer):
        mX, ma, mb, M0, M1, M2 = self.args #
        return rf'C_{{00}}({printer.doprint(mX)}, {printer.doprint(ma)}, {printer.doprint(mb)}, {printer.doprint(M0)}, {printer.doprint(M1)}, {printer.doprint(M2)})'
    
    def doit(self, deep=False, **hints):
        args = self.args
        mX, ma, mb, M0, M1, M2 = args
        p12 = (mX**2 - ma**2 - mb**2)/2
        qa1 = ma**2 - M1**2 + M0**2
        qb2 = mb**2 - M2**2 + M0**2
        if deep:
            mX = mX.doit()
            ma = ma.doit()
            mb = mb.doit()
            M0 = M0.doit()
            M1 = M1.doit()
            M2 = M2.doit()
        result =  1/((D - 2)*(ma*mb - p12)*(ma*mb + p12))*(
            (B12_0(mX, M1, M2)/2)*(2*ma**2*mb**2 + ma**2*qb2 - mb**2*qa1 - 2*p12**2 - p12*qa1 - p12*qb2)
            +(B2_0(mb, M0, M2)/2)*(mb**2*qa1 + p12*qb2)
            +p12*(A0(mX, M1)/2)
            +(-B1_0(ma, M0, M1)/2)*(ma**2*qb2 - p12*qa1)
            +(ma**2 - mb**2 - p12)*(-A0(mX, M2)/2)
            +(C0(*args)/4)*(4*M0**2*ma**2*mb**2 - 4*M0**2*p12**2 + ma**2*qb2**2 - mb**2*qa1**2 - 2*p12*qa1*qb2)
            )
        return Basic(result) if isinstance(result, int) else result

    def _eval_evalf(self, prec):
        return self.doit().doit(deep=True)._eval_evalf(prec)

class C11(PaVeFunction):
    @classmethod
    def eval(cls, mX, ma, mb, M0, M1, M2):
        pass
    def _latex(self, printer):
        mX, ma, mb, M0, M1, M2 = self.args #
        return rf'C_{{11}}({printer.doprint(mX)}, {printer.doprint(ma)}, {printer.doprint(mb)}, {printer.doprint(M0)}, {printer.doprint(M1)}, {printer.doprint(M2)})'
    
    def doit(self, deep=False, **hints):
        args = self.args
        mX, ma, mb, M0, M1, M2 = args
        p12 = (mX**2 - ma**2 - mb**2)/2
        qa1 = ma**2 - M1**2 + M0**2
        qb2 = mb**2 - M2**2 + M0**2
        if deep:
            mX = mX.doit()
            ma = ma.doit()
            mb = mb.doit()
            M0 = M0.doit()
            M1 = M1.doit()
            M2 = M2.doit()
        result =  1/((D - 2)*(ma*mb - p12)**2*(ma*mb + p12)**2)*(
            (B12_0(mX, M1, M2)/2)*(
                D*mb**4*qa1 + D*mb**2*p12*qa1 + D*mb**2*p12*qb2 - D*p12**2*qb2 
                - 2*ma**2*mb**4 - ma**2*mb**2*qb2 - mb**4*qa1 + 2*mb**2*p12**2 
                - mb**2*p12*qa1 - mb**2*p12*qb2 + 2*p12**2*qb2
                )
            +(-B1_0(ma, M0, M1)/2)*(D*mb**2*p12*qa1 - D*p12**2*qb2 - ma**2*mb**2*qb2 - mb**2*p12*qa1 + 2*p12**2*qb2)
            +(D*mb**4 + D*mb**2*p12 - D*p12**2 - ma**2*mb**2 - mb**4 - mb**2*p12 + 2*p12**2)*(-A0(mX, M2)/2)
            +(C0(*args)/4)*(
                D*mb**4*qa1**2 + 2*D*mb**2*p12*qa1*qb2 - D*p12**2*qb2**2 
                - 4*M0**2*ma**2*mb**4 + 4*M0**2*mb**2*p12**2 - ma**2*mb**2*qb2**2 
                - mb**4*qa1**2 - 2*mb**2*p12*qa1*qb2 + 2*p12**2*qb2**2
                )
            +mb**2*(-B2_0(mb, M0, M2)/2)
            +p12*(-A0(mX, M1)/2)
            )
        return Basic(result) if isinstance(result, int) else result

    def _eval_evalf(self, prec):
        return self.doit().doit(deep=True)._eval_evalf(prec)

class C12(PaVeFunction):
    @classmethod
    def eval(cls, mX, ma, mb, M0, M1, M2):
        pass
    def _latex(self, printer):
        mX, ma, mb, M0, M1, M2 = self.args #
        return rf'C_{{12}}({printer.doprint(mX)}, {printer.doprint(ma)}, {printer.doprint(mb)}, {printer.doprint(M0)}, {printer.doprint(M1)}, {printer.doprint(M2)})'
    
    def doit(self, deep=False, **hints):
        args = self.args
        mX, ma, mb, M0, M1, M2 = args
        p12 = (mX**2 - ma**2 - mb**2)/2
        qa1 = ma**2 - M1**2 + M0**2
        qb2 = mb**2 - M2**2 + M0**2
        if deep:
            mX = mX.doit()
            ma = ma.doit()
            mb = mb.doit()
            M0 = M0.doit()
            M1 = M1.doit()
            M2 = M2.doit()
        result =  1/((D - 2)*(ma*mb - p12)**2*(ma*mb + p12)**2)*(
            (-C0(*args)/4)*(
                D*ma**2*mb**2*qa1*qb2 - D*ma**2*p12*qb2**2 + D*mb**2*p12*qa1**2 
                + D*p12**2*qa1*qb2 - 4*M0**2*ma**2*mb**2*p12 + 4*M0**2*p12**3 
                - 2*ma**2*mb**2*qa1*qb2 + ma**2*p12*qb2**2 - mb**2*p12*qa1**2
                )
            +(-B12_0(mX, M1, M2)/4)*(
                D*ma**2*mb**2*qa1 + D*ma**2*mb**2*qb2 - 2*D*ma**2*p12*qb2 
                + 2*D*mb**2*p12*qa1 + D*p12**2*qa1 + D*p12**2*qb2 - 4*ma**2*mb**2*p12 
                - 2*ma**2*mb**2*qa1 - 2*ma**2*mb**2*qb2 + 2*ma**2*p12*qb2 - 2*mb**2*p12*qa1 + 4*p12**3
                )
            +(B1_0(ma, M0, M1)/4)*(
                D*ma**2*mb**2*qa1 - 2*D*ma**2*p12*qb2 + D*p12**2*qa1 
                - 2*ma**2*mb**2*qa1 + 2*ma**2*p12*qb2
                )
            +(B2_0(mb, M0, M2)/4)*(
                D*ma**2*mb**2*qb2 + 2*D*mb**2*p12*qa1 + D*p12**2*qb2 
                - 2*ma**2*mb**2*qb2 - 2*mb**2*p12*qa1
                )
            +(D*ma**2*mb**2 + D*p12**2 - 2*ma**2*mb**2)*(A0(mX, M1)/4)
            +(
                D*ma**2*mb**2 - 2*D*ma**2*p12 + 2*D*mb**2*p12 + D*p12**2 
                - 2*ma**2*mb**2 + 2*ma**2*p12 - 2*mb**2*p12
            )*(A0(mX, M2)/4)
            )
        return Basic(result) if isinstance(result, int) else result
    

    def _eval_evalf(self, prec):
        return self.doit().doit(deep=True)._eval_evalf(prec)

class C22(PaVeFunction):
    @classmethod
    def eval(cls, mX, ma, mb, M0, M1, M2):
        pass
    def _latex(self, printer):
        mX, ma, mb, M0, M1, M2 = self.args #
        return rf'C_{{22}}({printer.doprint(mX)}, {printer.doprint(ma)}, {printer.doprint(mb)}, {printer.doprint(M0)}, {printer.doprint(M1)}, {printer.doprint(M2)})'
    
    def doit(self, deep=False, **hints):
        args = self.args
        mX, ma, mb, M0, M1, M2 = args
        p12 = (mX**2 - ma**2 - mb**2)/2
        qa1 = ma**2 - M1**2 + M0**2
        qb2 = mb**2 - M2**2 + M0**2
        if deep:
            mX = mX.doit()
            ma = ma.doit()
            mb = mb.doit()
            M0 = M0.doit()
            M1 = M1.doit()
            M2 = M2.doit()
        result =  1/((D - 2)*(ma*mb - p12)**2*(ma*mb + p12)**2)*(
            (D*ma**4 - D*ma**2*p12 - D*p12**2 - ma**4 - ma**2*mb**2 + ma**2*p12 + 2*p12**2)*(A0(mX, M2)/2)
            +(-B12_0(mX, M1, M2)/2)*(
                D*ma**4*qb2 - D*ma**2*p12*qa1 - D*ma**2*p12*qb2 - D*p12**2*qa1 
                + 2*ma**4*mb**2 - ma**4*qb2 - ma**2*mb**2*qa1 - 2*ma**2*p12**2 
                + ma**2*p12*qa1 + ma**2*p12*qb2 + 2*p12**2*qa1
                )
            +(-B2_0(mb, M0, M2)/2)*(
                D*ma**2*p12*qb2 + D*p12**2*qa1 + ma**2*mb**2*qa1 - ma**2*p12*qb2 - 2*p12**2*qa1
                )
            +(-C0(*args)/4)*(
                D*ma**4*qb2**2 - 2*D*ma**2*p12*qa1*qb2 - D*p12**2*qa1**2 
                + 4*M0**2*ma**4*mb**2 - 4*M0**2*ma**2*p12**2 - ma**4*qb2**2 
                - ma**2*mb**2*qa1**2 + 2*ma**2*p12*qa1*qb2 + 2*p12**2*qa1**2
                )
            +ma**2*(B1_0(ma, M0, M1)/2)
            +p12*(-A0(mX, M1)/2)
            )
        return Basic(result) if isinstance(result, int) else result

    #def _eval_evalf(self, prec):
    #    return self.doit().doit(deep=True)._eval_evalf(prec)

    def _eval_evalf(self, prec):
        try:
            result = self.doit()._eval_evalf(prec)
        except RecursionError:
            raise ValueError("Infinite recursion in evaluating PaVe function. Check dependencies.")
        return result


######################################
# Extra tools for PaVe functions
######################################
def get_pave_functions(exp):
    """Return a set of PaVe functions in the expression exp"""
    # Get the PaVe functions in the expression
    pave_functions = exp.atoms(PaVeFunction)
    return pave_functions

def pave_descomposition(exp):
    """Decompose the PaVe functions in an expression.
    Args:
    exp: The expression to decompose.
    """
    # Get the PaVe functions in the expression
    pave_functions = get_pave_functions(exp)
    for pave in pave_functions:
        try:
            exp = exp.subs(pave, pave.divfin())
        except:
            pass
    return exp

if __name__ == '__main__':
    print('All right PaVe.py')


