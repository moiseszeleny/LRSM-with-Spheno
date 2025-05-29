from sympy import S
class Particle:
    def __init__(self, name, su3, su2_l, su2_r, b_minus_l):
        """
        Initialize a particle with its quantum numbers in the Left-Right Symmetric Model.
        
        :param name: Name of the particle
        :param su3: SU(3) representation (e.g., 3 for quarks, 1 for leptons)
        :param su2_l: SU(2)_L representation (e.g., 2 for doublets, 1 for singlets)
        :param su2_r: SU(2)_R representation (e.g., 2 for doublets, 1 for singlets)
        :param b_minus_l: Baryon number minus lepton number (B-L)
        """
        self.name = name
        self.su3 = su3
        self.su2_l = su2_l
        self.su2_r = su2_r
        self.b_minus_l = b_minus_l

    def calculate_electric_charge(self, t3_l, t3_r):
        """
        Calculate the electric charge using the Left-Right Symmetric Model formula.
        
        :param t3_l: Weak isospin third component for SU(2)_L (T_3^L)
        :param t3_r: Weak isospin third component for SU(2)_R (T_3^R)
        :return: Electric charge (Q)
        """
        return t3_l + t3_r + S(self.b_minus_l) / 2

    def __str__(self):
        return (f"Particle: {self.name}, SU(3): {self.su3}, SU(2)_L: {self.su2_l}, "
                f"SU(2)_R: {self.su2_r}, B-L: {self.b_minus_l}")

# Define some particles
particles = [
    Particle("Up Quark", 3, 2, 1, S(1)/3),  # Example values for B-L
    Particle("Down Quark", 3, 2, 1, -S(1)/3),
    Particle("Electron", 1, 2, 1, -1),
    Particle("Neutrino", 1, 2, 1, 0)
]

# Calculate and print quantum numbers
for particle in particles:
    t3_l_values = [S(1)/2, -S(1)/2] if particle.su2_l == 2 else [0]
    t3_r_values = [S(1)/2, -S(1)/2] if particle.su2_r == 2 else [0]

    for t3_l in t3_l_values:
        for t3_r in t3_r_values:
            q = particle.calculate_electric_charge(t3_l, t3_r)
            print(f"{particle.name} (T_3^L = {t3_l}, T_3^R = {t3_r}): SU(3) = {particle.su3}, "
                f"SU(2)_L = {particle.su2_l}, SU(2)_R = {particle.su2_r}, B-L = {particle.b_minus_l}, "
                f"Electric Charge (Q) = {q}")