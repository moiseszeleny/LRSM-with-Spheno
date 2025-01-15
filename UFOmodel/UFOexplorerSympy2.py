import os
import sys
import re
from sympy import sympify, simplify, Matrix
from sympy import Function, symbols


# Define symbolic Lorentz functions
Metric = Function('Metric')
Epsilon = Function('Epsilon')
Gamma = Function('Gamma')
ProjP = Function('ProjP')
ProjM = Function('ProjM')
Momentum = Function('P') 

def preprocess_expression(expression):
    """
    Preprocess a string to replace floating-point literals and functions with sympy-compatible syntax.
    """
    math_replacements = {
        'cmath.sqrt': 'sqrt',
        'cmath.pi': 'pi',
        'complex(0,1)': 'I',
        'complexconjugate':'conjugate',
        '0.25':'(1/4)',
        '0.5':'(1/2)',
    }
    for cmath_fn, sympy_fn in math_replacements.items():
        expression = expression.replace(cmath_fn, sympy_fn)
    expression = re.sub(r'(\d+)\.(?!\d)', r'\1', expression)
    return expression

class UFOModelExplorer:
    """Class to explore the UFO model by dynamically executing each file."""

    def __init__(self, ufo_directory):
        self.ufo_directory = ufo_directory
        self.particles = []
        self.parameters = []
        self.couplings = []
        self.lorentz = []
        self.vertices = []

    def load_model(self):
        """Load the UFO model by dynamically loading each file."""
        ufo_files = {
            'particles': 'particles.py',
            'parameters': 'parameters.py',
            'couplings': 'couplings.py',
            'lorentz': 'lorentz.py',
            'vertices': 'vertices.py',
        }

        for key, filename in ufo_files.items():
            filepath = os.path.join(self.ufo_directory, filename)
            if os.path.exists(filepath):
                print(f"\nLoading {key} from {filepath}...")
                namespace = self.execute_ufo_file(filepath)
                self._extract_objects_from_lists_or_dynamically(key, namespace)
            else:
                print(f"File not found: {filepath}")

    def execute_ufo_file(self, filepath):
        """Execute a UFO file and return the defined objects."""
        namespace = {}
        ufo_dir = os.path.dirname(filepath)
        if ufo_dir not in sys.path:
            sys.path.insert(0, ufo_dir)
        with open(filepath, 'r') as f:
            code = f.read()
        try:
            exec(code, namespace)  # Execute the file in a controlled namespace
        except Exception as e:
            print(f"Error executing {filepath}: {e}")
        print(f"Namespace keys after executing {filepath}: {list(namespace.keys())}")
        print(f"Namespace contents after executing {filepath}: {namespace}")  # Debugging
        return namespace

    def _extract_objects_from_lists_or_dynamically(self, key, namespace):
        """Extract objects from predefined lists or dynamically detect objects."""
        list_names = {
            'particles': 'all_particles',
            'parameters': 'all_parameters',
            'couplings': 'all_couplings',
            'lorentz': 'all_lorentz',
            'vertices': 'all_vertices',
        }

        list_name = list_names.get(key)
        if list_name in namespace:
            object_list = namespace[list_name]
            # Remove duplicates by ensuring unique object names
            #if key == 'lorentz':
            object_list = list({obj.name: obj for obj in object_list}.values())
            setattr(self, key, object_list)
            print(f"Loaded {len(object_list)} objects for {key}.")
            print(f"Objects in {list_name}: {object_list}")  # Debugging
            #return

        # Fallback: Dynamically check for objects of the expected type
        else:
            print(f"List '{list_name}' not found. Searching for individual objects...")
            class_name = {
                'particles': 'Particle',
                'parameters': 'Parameter',
                'couplings': 'Coupling',
                'lorentz': 'Lorentz',
                'vertices': 'Vertex',
            }.get(key)

            if not class_name:
                print(f"Unknown key '{key}', skipping.")
                #return

            # Adjusted to dynamically detect classes if 'Lorentz' objects are not found
            object_list = []
            for name, obj in namespace.items():
                try:
                    if isinstance(obj, namespace[class_name]):
                        object_list.append(obj)
                except KeyError:
                    print(f"Class '{class_name}' not found in namespace.")
                    break

            # Remove duplicates by ensuring unique object names
            #if key == 'lorentz':
            object_list = list({obj.name: obj for obj in object_list}.values())

            setattr(self, key, object_list)
            print(f"Loaded {len(object_list)} objects dynamically for {key}.")
            print(f"Objects loaded dynamically for {key}: {object_list}")  # Debugging

    def summarize_model(self):
        """Print a summary of the loaded model."""
        print(f"\nModel Summary:")
        print(f"Particles: {len(self.particles)}")
        print(f"Parameters: {len(self.parameters)}")
        print(f"Couplings: {len(self.couplings)}")
        print(f"Lorentz Structures: {len(self.lorentz)}")
        print(f"Vertices: {len(self.vertices)}")

    def find_vertices_involving(self, particle_names, number_particles=None):
        """
        Find all vertices involving a given list of particle names.
        :param particle_names: List of particle names to match.
        :param number_particles: Expected number of particles in the vertex (optional).
        :return: List of matching vertices.
        """
        if not isinstance(particle_names, list):
            particle_names = [particle_names]

        vertices = []
        for v in self.vertices:
            try:
                vertex_particle_names = [p.name for p in v.particles if p and hasattr(p, 'name')]
                if number_particles is None or len(vertex_particle_names) == number_particles:
                    if all(p in vertex_particle_names for p in particle_names):
                        vertices.append(v)
            except AttributeError as e:
                print(f"Error processing vertex: {v}. Error: {e}")
        return vertices

    def generate_symbolic_feynman_rule(self, vertex):
        """
        Generate a symbolic Feynman rule for a given vertex.
        Combines parameters, couplings, and Lorentz structures into a symbolic expression.
        """
        if not hasattr(vertex, 'couplings') or not hasattr(vertex, 'lorentz'):
            print(f"Vertex {vertex} lacks couplings or Lorentz structures.")
            return None

        symbolic_rule = 0

        for coupling_info, lorentz_obj in zip(vertex.couplings.values(), vertex.lorentz):
            coupling = self._get_symbolic_coupling(coupling_info)
            lorentz_structure = self._get_symbolic_lorentz(lorentz_obj, vertex.particles)

            # Accumulate the symbolic rule
            symbolic_rule += coupling * lorentz_structure

        return simplify(symbolic_rule)


    def _get_symbolic_coupling(self, coupling_name):
        if hasattr(coupling_name, 'value'):
            value = preprocess_expression(coupling_name.value)
            return sympify(value)
        else:
            return sympify(0)

    def _get_symbolic_lorentz(self, lorentz_obj, particles):
        """
        Retrieve the symbolic representation of a Lorentz structure.
        """
        if hasattr(lorentz_obj, 'structure'):
            structure = lorentz_obj.structure
            # Replace UFO-specific constructs with symbolic functions
            structure = structure.replace('Metric', 'Metric')
            structure = structure.replace('Epsilon', 'Epsilon')
            structure = structure.replace('Gamma', 'Gamma')
            structure = structure.replace('ProjP', 'ProjP')
            structure = structure.replace('ProjM', 'ProjM')

            # Handle momentum terms like P(mu, N)
            for idx, particle in enumerate(particles, start=1):
                particle_momentum = f'P(mu,{idx})'  # Replace P(mu,N) with symbolic Momentum
                structure = structure.replace(f'P(mu,{idx})', f'Momentum(mu, {idx})')

            # Add local context for sympify
            local_context = {
                'Momentum': Momentum,
                'Metric': Function('Metric'),
                'Epsilon': Function('Epsilon'),
                'Gamma': Function('Gamma'),
                'ProjP': Function('ProjP'),
                'ProjM': Function('ProjM'),
            }

            return sympify(structure, locals=local_context)
        else:
            return sympify(1)  # Default to 1 if no structure provided

    
    @staticmethod
    def _metric_tensor(mu, nu):
        """Minkowski metric tensor."""
        return Matrix([[1 if i == j else 0 for j in range(4)] for i in range(4)])

    @staticmethod
    def _levi_civita(mu, nu, rho, sigma):
        """Levi-Civita tensor."""
        return LeviCivita(mu, nu, rho, sigma)
    
    @staticmethod
    def _gamma_matrix(mu):
        """Dirac gamma matrices in the 4x4 representation."""
        gamma_matrices = {
            0: Matrix([[1, 0, 0, 0], [0, 1, 0, 0], [0, 0, -1, 0], [0, 0, 0, -1]]),  # Gamma^0
            1: Matrix([[0, 0, 0, 1], [0, 0, 1, 0], [0, -1, 0, 0], [-1, 0, 0, 0]]),  # Gamma^1
            2: Matrix([[0, 0, 0, -I], [0, 0, I, 0], [0, I, 0, 0], [-I, 0, 0, 0]]),   # Gamma^2
            3: Matrix([[0, 0, 1, 0], [0, 0, 0, -1], [-1, 0, 0, 0], [0, 1, 0, 0]])    # Gamma^3
        }
        return gamma_matrices.get(mu, Matrix.zeros(4))

    @staticmethod
    def _projection_operator_p():
        """Projection operator P = (1 + γ^5)/2."""
        gamma_5 = Matrix([
            [0, 0, 1, 0],
            [0, 0, 0, 1],
            [1, 0, 0, 0],
            [0, 1, 0, 0]
        ])
        return (Matrix.eye(4) + gamma_5) / 2

    @staticmethod
    def _projection_operator_m():
        """Projection operator M = (1 - γ^5)/2."""
        gamma_5 = Matrix([
            [0, 0, 1, 0],
            [0, 0, 0, 1],
            [1, 0, 0, 0],
            [0, 1, 0, 0]
        ])
        return (Matrix.eye(4) - gamma_5) / 2


    def list_feynman_rules(self):
        """
        Generate and display symbolic Feynman rules for all vertices.
        """
        feynman_rules = {}
        for vertex in self.vertices:
            print(f"Feynman Rule for Vertex: {vertex.particles}")
            symbolic_rule = self.generate_symbolic_feynman_rule(vertex)
            if symbolic_rule is not None:
                #print(symbolic_rule)
                feynman_rules[vertex] = symbolic_rule
            else:
                print("Unable to generate rule.\n")
        return feynman_rules
    ############# new add code
    def classify_parameters(self):
        """
        Classify all parameters into 'internal' and 'external'.
        :return: A dictionary with keys 'internal' and 'external', containing lists of corresponding parameters.
        """
        classified = {'internal': [], 'external': []}
        for param in self.parameters:
            if hasattr(param, 'nature'):
                if param.nature == 'external':
                    classified['external'].append(param)
                elif param.nature == 'internal':
                    classified['internal'].append(param)
        return classified
    
    import re

    def substitute_internal_parameters(self, expression):
        """
        Substitute internal parameters in a symbolic expression with their definitions in terms of external parameters.
        :param expression: Sympy expression to perform substitution.
        :return: A new Sympy expression with internal parameters replaced by external ones.
        """
        from sympy import sqrt, pi, I

        # Define a mapping of common math functions/constants from cmath to sympy
        math_replacements = {
            'cmath.sqrt': 'sqrt',
            'cmath.pi': 'pi',
            'complex(0,1)': 'I'
        }

        substitutions = {}
        for param in self.parameters:
            if hasattr(param, 'nature') and param.nature == 'internal' and hasattr(param, 'value'):
                value = preprocess_expression(param.value)
                try:
                    substitutions[sympify(param.name)] = sympify(value)
                except Exception as e:
                    print(f"Failed to sympify parameter {param.name} with value {param.value}: {e}")

        return expression.subs(substitutions)

    def evaluate_expression_numerically(self, expression):
        """
        Numerically evaluate a symbolic expression using the values of external parameters.
        :param expression: Sympy expression to evaluate.
        :return: A numerical value for the expression.
        """
        substitutions = {}
        for param in self.parameters:
            if hasattr(param, 'nature') and param.nature == 'external' and hasattr(param, 'value'):
                substitutions[sympify(param.name)] = param.value
        return expression.evalf(subs=substitutions)


    def calculate_amplitude(self, process):
        """
        Calculate the symbolic amplitude for a given process.
        :param process: A tuple of the form (initial_particles, final_particles)
        :return: Symbolic amplitude for the process.
        """
        initial_particles, final_particles = process
        diagrams = self.generate_diagrams(initial_particles, final_particles)
        total_amplitude = 0

        for diagram in diagrams:
            amplitude = 1
            for vertex in diagram['vertices']:
                feynman_rule = self.generate_symbolic_feynman_rule(vertex)
                if feynman_rule is not None:
                    amplitude *= feynman_rule
            for propagator in diagram.get('propagators', []):
                amplitude *= self.get_propagator(propagator)
            total_amplitude += amplitude

        return simplify(total_amplitude)



    def generate_diagrams(self, initial_particles, final_particles, max_intermediate=2):
        """
        Generate all possible Feynman diagrams for the given initial and final particles.
        :param initial_particles: List of initial state particles (names).
        :param final_particles: List of final state particles (names).
        :param max_intermediate: Maximum number of intermediate particles allowed.
        :return: List of diagrams (each as a dict of vertices and propagators).
        """
        from itertools import combinations

        def match_vertex(vertex, particles_in):
            """
            Check if a vertex can be formed with the given particles.
            """
            vertex_particles = [p.name for p in vertex.particles]
            return all(p in particles_in for p in vertex_particles)

        def extend_diagram(diagram, remaining_final, depth):
            """
            Recursive function to build diagrams.
            """
            if depth > max_intermediate:
                return []
            
            if not remaining_final:
                return [diagram]  # Diagram is complete

            diagrams = []
            for vertex in self.vertices:
                # Check if the vertex can connect particles in the diagram
                if match_vertex(vertex, diagram['particles']):
                    new_particles = [
                        p.name for p in vertex.particles if p.name not in diagram['particles']
                    ]
                    # Add vertex and update the particle list
                    new_diagram = {
                        'vertices': diagram['vertices'] + [vertex],
                        'particles': diagram['particles'] + new_particles,
                    }
                    # Check if the diagram resolves remaining final states
                    remaining_after_vertex = [
                        p for p in remaining_final if p not in new_particles
                    ]
                    diagrams.extend(
                        extend_diagram(new_diagram, remaining_after_vertex, depth + 1)
                    )
            return diagrams

        # Initial diagram with only initial particles
        initial_diagram = {'vertices': [], 'particles': initial_particles}
        diagrams = extend_diagram(initial_diagram, final_particles, 0)

        # Filter out invalid diagrams (e.g., incomplete connections)
        valid_diagrams = [
            d for d in diagrams if set(final_particles).issubset(set(d['particles']))
        ]
        return valid_diagrams


    def get_propagator(self, particle, momentum_symbol='p', gauge='feynman'):
        """
        Generate the propagator for a given particle.
        """
        p = symbols(momentum_symbol)
        mass = getattr(particle, 'mass', None)
        if not mass or mass == "ZERO":
            mass_value = 0
        else:
            mass_value = sympify(mass)

        if particle.spin == 1:  # Scalar
            return simplify(I / (p**2 - mass_value**2 + I * 1e-6))
        elif particle.spin == 2:  # Fermion
            gamma_p = Function('Gamma')(p)  # Symbolic Gamma matrix for momentum
            return simplify(I * (gamma_p + mass_value) / (p**2 - mass_value**2 + I * 1e-6))
        elif particle.spin == 3:  # Vector boson
            if gauge == 'feynman':
                return simplify((-I * (p**2 - mass_value**2)) / (p**2 - mass_value**2 + I * 1e-6))
            elif gauge == 'unitary':
                return simplify((-I * (p**2 - mass_value**2)) / (p**2 - mass_value**2 + I * 1e-6))
            else:
                raise ValueError(f"Unknown gauge: {gauge}")
        else:
            raise NotImplementedError(f"Spin {particle.spin} propagator not implemented.")






if __name__ == "__main__":
    ufo_directory = "C:/Users/moise/OneDrive/Escritorio/LRSM-with-Spheno/UFOmodel/MLRSM_UFO"
    #"/workspaces/LRSM-with-Spheno/UFOmodel/MLRSM_UFO"
    explorer = UFOModelExplorer(ufo_directory)
    explorer.load_model()

    # Add this in the main block after loading the model
    print("\nVertices involving 'e+' and 'mu+':")
    e_mu_vertices = explorer.find_vertices_involving('e+')
    for vertex in e_mu_vertices:
        print(vertex, vertex.particles)

    # Example process: e+ e- -> mu+ mu-
    process = (['e+', 'e-'], ['mu+', 'mu-'])
    amplitude = explorer.calculate_amplitude(process)
    print("\nSymbolic Amplitude:")
    print(amplitude)

