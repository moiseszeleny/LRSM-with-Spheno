# Script to create a LaTeX file with expressions for all
# form factors for LFV Higgs decays in the DLRSM model
from symbolic_formfactors import symbolic_formfactor
from LFVXD.PaVe2 import PaVeFunction
from sympy import latex, fraction

def PV_factor(exp):
    """
    Function to factor out the Passarino-Veltman functions from an expression
    """
    pv_functions = exp.atoms(PaVeFunction)
    factored_exp = exp.factor()
    num, denom = fraction(factored_exp)
    collected_pv_num = num.collect(pv_functions, lambda x:x.simplify())
    denom = denom.simplify()
    final_exp = collected_pv_num/denom
    return final_exp


def latex_formfactor(formfactors):
    """
    Function to create LaTeX expressions given a specific diagram
    """
    left_ff = PV_factor(formfactors['AL'])
    right_ff = PV_factor(formfactors['AR'])

    # Convert the form factors to LaTeX format
    left_ff_latex = latex(left_ff)
    right_ff_latex = latex(right_ff)

    return left_ff_latex, right_ff_latex

def main():
    """
    Main function to generate latex file with form factors
    for LFV Higgs decays in the DLRSM model.
    """
    # Open the file to write the LaTeX expressions
    with open('formfactors.tex', 'w') as f:
        f.write("\\documentclass{article}\n")
        f.write("\\usepackage{amsmath}\n")
        f.write("\\begin{document}\n")
        f.write("\\section*{Form Factors for LFV Higgs Decays in the DLRSM Model}\n")
        f.write("\\begin{itemize}\n")
        for diagram, formfactors in symbolic_formfactor.items():
                left_ff_latex, right_ff_latex = latex_formfactor(formfactors)
                f.write(f"  \\item Diagram: {diagram}\n")
                f.write(f"    Left Form Factor: {left_ff_latex}\n")
                f.write(f"    Right Form Factor: {right_ff_latex}\n")
        f.write("\\end{itemize}\n")
        f.write("\\end{document}\n")

# Call the main function to generate the LaTeX file
if __name__ == "__main__":
    main()
    
