import os
import sys
import re
from sympy import sympify, simplify
from sympy import Function, symbols
from functools import lru_cache
import importlib
from concurrent.futures import ThreadPoolExecutor

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
        self.decays = []
        self.cached_feynman_rules = {}  # Cache for Feynman rules
        self.cached_charges = {}  # Cache for particle charges
        self.cached_masses = {}  # Cache for particle masses

    def load_model(self):
        """Load the UFO model by dynamically loading each file."""
        ufo_files = {
            'particles': 'particles.py',
            'parameters': 'parameters.py',
            'couplings': 'couplings.py',
            'lorentz': 'lorentz.py',
            'vertices': 'vertices.py',
            'decays': 'decays.py',
        }

        for key, filename in ufo_files.items():
            filepath = os.path.join(self.ufo_directory, filename)
            if os.path.exists(filepath):
                print(f"\nLoading {key} from {filepath}...")
                namespace = self.execute_ufo_file(filepath)
                self._extract_objects_from_lists_or_dynamically(key, namespace)
            else:
                print(f"File not found: {filepath}")
        
        # Cache particle charges and masses after loading
        self.cached_charges = {p.name: p.charge for p in self.particles}
        self.cached_masses = {
            p.name: sympify(preprocess_expression(str(p.mass))) if hasattr(p, 'mass') and p.mass else 0
            for p in self.particles
        }

    #def execute_ufo_file(self, filepath):
    #    """Execute a UFO file and return the defined objects."""
    #    namespace = {}
    #    ufo_dir = os.path.dirname(filepath)
    #    if ufo_dir not in sys.path:
    #        sys.path.insert(0, ufo_dir)
    #    with open(filepath, 'r') as f:
    #        code = f.read()
    #    try:
    #        exec(code, namespace)  # Execute the file in a controlled namespace
    #    except Exception as e:
    #        print(f"Error executing {filepath}: {e}")
    #    print(f"Namespace keys after executing {filepath}: {list(namespace.keys())}")
    #    print(f"Namespace contents after executing {filepath}: {namespace}")  # Debugging
    #    return namespace

    def execute_ufo_file(self, filepath):
        """Execute a UFO file and return the defined objects."""
        namespace = {}
        ufo_dir = os.path.dirname(filepath)
        module_name = os.path.splitext(os.path.basename(filepath))[0]
        package_name = os.path.basename(self.ufo_directory)

        # Ensure the UFO directory is in the Python path
        if ufo_dir not in sys.path:
            sys.path.insert(0, ufo_dir)

        # Read the code from the file
        with open(filepath, 'r') as f:
            code = f.read()

        # Prepare the namespace with necessary variables
        namespace["__name__"] = module_name
        namespace["__file__"] = filepath
        namespace["__package__"] = package_name

        try:
            # Execute the file in the controlled namespace
            exec(code, namespace)
        except Exception as e:
            print(f"Error executing {filepath}: {e}")

        # Debugging: Print the namespace for inspection
        print(f"Namespace keys after executing {filepath}: {list(namespace.keys())}")
        return namespace


    def _extract_objects_from_lists_or_dynamically(self, key, namespace):
        """
        Extract objects from predefined lists or dynamically detect objects.
        """
        list_names = {
            'particles': 'all_particles',
            'parameters': 'all_parameters',
            'couplings': 'all_couplings',
            'lorentz': 'all_lorentz',
            'vertices': 'all_vertices',
            'decays': 'all_decays',  # Added decays list handling
        }

        list_name = list_names.get(key)
        if list_name in namespace:
            object_list = namespace[list_name]
            # Remove duplicates by ensuring unique object names
            object_list = list({obj.name: obj for obj in object_list}.values())
            setattr(self, key, object_list)
            print(f"Loaded {len(object_list)} objects for {key}.")
            print(f"Objects in {list_name}: {object_list}")  # Debugging
        else:
            print(f"List '{list_name}' not found. Searching for individual objects...")
            class_name = {
                'particles': 'Particle',
                'parameters': 'Parameter',
                'couplings': 'Coupling',
                'lorentz': 'Lorentz',
                'vertices': 'Vertex',
                'decays': 'Decay',  # Added decays handling
            }.get(key)

            if not class_name:
                print(f"Unknown key '{key}', skipping.")
                return

            # Dynamically check for objects of the expected type
            object_list = []
            for name, obj in namespace.items():
                try:
                    if isinstance(obj, namespace[class_name]):
                        object_list.append(obj)
                except KeyError:
                    print(f"Class '{class_name}' not found in namespace.")
                    break

            # Remove duplicates by ensuring unique object names
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
        print(f"Decays: {len(self.decays)}")


    def find_parameters(self, parameter_names):
        """
        Find parameters in the model by their names.
        :param parameter_names: List of parameter names to search for.
        :return: List of matching parameter objects.
        """
        if not isinstance(parameter_names, list):
            parameter_names = [parameter_names]

        matching_parameters = []
        for parameter_name in parameter_names:
            match = next((param for param in self.parameters if param.name == parameter_name), None)
            if match:
                matching_parameters.append(match)
            else:
                print(f"Parameter '{parameter_name}' not found in the model.")
        return matching_parameters
    
    def sympify_parameters(self, parameter_names):
        """
        Sympify a list of parameters in the model by their names.
        :param parameter_names: List of parameter names to sympify.
        :return: Dictionary of parameter names and their sympy expressions.
        """
        if not isinstance(parameter_names, list):
            parameter_names = [parameter_names]

        sympified_parameters = {}
        for parameter_name in parameter_names:
            match = next((param for param in self.parameters if param.name == parameter_name), None)
            if match and hasattr(match, 'value'):
                try:
                    # Sympify the parameter's value
                    sympified_value = sympify(preprocess_expression(match.value))
                    sympified_parameters[parameter_name] = sympified_value
                except Exception as e:
                    print(f"Error sympifying parameter '{parameter_name}': {e}")
            else:
                print(f"Parameter '{parameter_name}' not found or has no value in the model.")
        return sympified_parameters
    
    def sympify_lorentz(self, lorentz_names):
        """
        Sympify a list of Lorentz structures in the model by their names.
        :param lorentz_names: List of Lorentz structure names to sympify.
        :return: Dictionary of Lorentz structure names and their sympy expressions.
        """
        if not isinstance(lorentz_names, list):
            lorentz_names = [lorentz_names]

        sympified_lorentz = {}
        for lorentz_name in lorentz_names:
            match = next((lorentz for lorentz in self.lorentz if lorentz.name == lorentz_name), None)
            if match and hasattr(match, 'structure'):
                try:
                    # Preprocess and sympify the Lorentz structure
                    sympified_structure = sympify(preprocess_expression(match.structure))
                    sympified_lorentz[lorentz_name] = sympified_structure
                except Exception as e:
                    print(f"Error sympifying Lorentz structure '{lorentz_name}': {e}")
            else:
                print(f"Lorentz structure '{lorentz_name}' not found or has no structure in the model.")
        return sympified_lorentz


    def sympify_decays(self, particles_to_load=None, final_states_to_load=None):
        """
        Sympify the partial decay widths for selected or all decay objects in the model.
        :param particles_to_load: List of particle names to process (None for all particles).
        :param final_states_to_load: List of final states to process (None for all final states).
        :return: A dictionary where keys are particle names and values are dictionaries
                of partial widths with sympy expressions.
        """

        @lru_cache(maxsize=None)
        def preprocess_and_sympify(expr):
            try:
                return sympify(preprocess_expression(expr))
            except Exception as e:
                print(f"Error sympifying expression: {e}")
                return None

        def process_decay(decay):
            particle_name = decay.particle.name if hasattr(decay.particle, 'name') else "Unknown"
            if particles_to_load and particle_name not in particles_to_load:
                return None  # Skip this decay

            decay_data = {}
            for final_state, width_expr in decay.partial_widths.items():
                if final_states_to_load and final_state not in final_states_to_load:
                    continue  # Skip this final state
                decay_data[final_state] = preprocess_and_sympify(width_expr)
            return particle_name, decay_data

        sympified_decays = {}
        with ThreadPoolExecutor() as executor:
            results = executor.map(process_decay, self.decays)
            for result in results:
                if result:
                    particle_name, decay_data = result
                    sympified_decays[particle_name] = decay_data

        return sympified_decays

    def find_particles(self, particle_names):
        """
        Find particles in the model by their names.
        :param particle_names: List of particle names to search for.
        :return: List of matching particle objects.
        """
        if not isinstance(particle_names, list):
            particle_names = [particle_names]

        matching_particles = []
        for particle_name in particle_names:
            match = next((p for p in self.particles if p.name == particle_name), None)
            if match:
                matching_particles.append(match)
            else:
                print(f"Particle '{particle_name}' not found in the model.")
        return matching_particles
    
    def find_antiname(self, particle_name):
        """
        Find the antiname of a particle by its name.
        
        :param particle_name: Name of the particle to find the antiname for.
        :return: The antiname of the particle if found, otherwise None.
        """
        # Search for the particle in the model
        particle = next((p for p in self.particles if p.name == particle_name), None)
        
        # Check if the particle exists and has an 'antiname' attribute
        if particle:
            return getattr(particle, 'antiname', None)
        else:
            print(f"Particle '{particle_name}' not found in the model.")
            return None


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
    
    def get_cached_feynman_rule(self, vertex):
        """
        Retrieve or compute a Feynman rule for a vertex using cache.
        """
        if vertex not in self.cached_feynman_rules:
            self.cached_feynman_rules[vertex] = self.generate_symbolic_feynman_rule(vertex)
        return self.cached_feynman_rules[vertex]
    
    def check_vertex_charge_conservation(self, vertex_particles, relation):
        """
        Check charge conservation for a vertex.
        :param vertex_particles: List of particle names in the vertex.
        :param relation: Function defining the charge conservation relationship.
        :raises ValueError: If charge conservation is violated.
        """
        charges = [self.cached_charges[p] for p in vertex_particles]
        if not relation(charges):
            raise ValueError(
                f"Charge conservation violated for particles {vertex_particles}. "
                f"Charges: {charges}"
            )

    def list_feynman_rules(self, vertices_to_load=None, particles_to_load=None, number_particles=None):
        """
        Generate symbolic Feynman rules for all or selected vertices in the model.
        :param vertices_to_load: List of vertex indices or names to process (None for all vertices).
        :param particles_to_load: List of particle names to filter vertices by (None for all particles).
        :param number_particles: Number of particles in the vertex to filter by (None for all vertex sizes).
        :return: Dictionary with vertex identifiers as keys and symbolic Feynman rules as values.
        """
        @lru_cache(maxsize=None)
        def cached_generate_rule(vertex):
            try:
                return self.generate_symbolic_feynman_rule(vertex)
            except Exception as e:
                print(f"Error generating Feynman rule for vertex {vertex}: {e}")
                return None

        def process_vertex(vertex):
            if vertices_to_load and vertex not in vertices_to_load:
                return None  # Skip this vertex

            vertex_particles = [p.name for p in vertex.particles if hasattr(p, 'name')]

            if number_particles is not None and len(vertex_particles) != number_particles:
                return None  # Skip vertices not matching the particle count

            if particles_to_load and not any(p in vertex_particles for p in particles_to_load):
                return None  # Skip if none of the specified particles are in the vertex

            rule = cached_generate_rule(vertex)
            return vertex, rule

        feynman_rules = {}
        with ThreadPoolExecutor() as executor:
            results = executor.map(process_vertex, self.vertices)
            for result in results:
                if result:
                    vertex, rule = result
                    feynman_rules[vertex] = rule

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

    def substitute_internal_parameters(self, expression, skip_params=None):
        """
        Substitute internal parameters in a symbolic expression with their definitions in terms of external parameters.
        Optionally, skip the substitution of specific parameters.

        :param expression: Sympy expression to perform substitution.
        :param skip_params: List of parameter names to skip during substitution. Default is None.
        :return: A new Sympy expression with internal parameters replaced by external ones.
        """


        substitutions = {}
        skip_params = skip_params or []  # Ensure skip_params is a list or empty by default

        for param in self.parameters:
            if hasattr(param, 'nature') and param.nature == 'internal' and hasattr(param, 'value'):
                if param.name in skip_params:  # Skip substitution for parameters in skip_params
                    continue
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

        # Handle undefined parameters by setting them to 0 or providing a default value
        for symbol in expression.free_symbols:
            if symbol not in substitutions:
                print(f"Warning: Undefined parameter {symbol}. Substituting with 1.")
                substitutions[symbol] = 1

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
    #ufo_directory = "C:/Users/moise/OneDrive/Escritorio/LRSM-with-Spheno/UFOmodel/MLRSM_UFO"
    ufo_directory = "C:/Users/moise/OneDrive/Escritorio/LRSM-with-Spheno/UFOmodel/MLRSM_UFO_neutrino_mix"
    #"/workspaces/LRSM-with-Spheno/UFOmodel/MLRSM_UFO"
    explorer = UFOModelExplorer(ufo_directory)
    explorer.load_model()
    three_particle_rules = explorer.list_feynman_rules(number_particles=3)
    print('Feynman rules with 3 particles')
    print(three_particle_rules)

    selected_decays = explorer.sympify_decays(particles_to_load=['H', 'W+'])
    for particle, widths in selected_decays.items():
        print(f"Decays of {particle}:")
        for final_state, expr in widths.items():
            print(f"  {particle} -> {final_state}: {explorer.evaluate_expression_numerically(explorer.substitute_internal_parameters(expr))}")

    # Add this in the main block after loading the model
    #print("\nVertices involving 'e+' and 'mu+':")
    #e_mu_vertices = explorer.find_vertices_involving('e+')
    #for vertex in e_mu_vertices:
    #    print(vertex, vertex.particles)

    # Example process: e+ e- -> mu+ mu-
    #process = (['e+', 'e-'], ['mu+', 'mu-'])
    #amplitude = explorer.calculate_amplitude(process)
    #print("\nSymbolic Amplitude:")
    #print(amplitude)

