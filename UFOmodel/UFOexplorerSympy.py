import os
import sys
from sympy import sympify, simplify

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

    def find_vertices_involving(self, particle_name, number_particles=3):
        """Find all vertices involving a given particle."""
        vertices = []
        for v in self.vertices:
            try:
                if len(v.particles) == number_particles:
                    if any(p and getattr(p, 'name', None) == particle_name for p in v.particles):  # Check if p is not None
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
            #print(coupling, type(coupling))
            lorentz_structure = self._get_symbolic_lorentz(lorentz_obj)
            #print(lorentz_structure, type(lorentz_structure))
            symbolic_rule += coupling * lorentz_structure

        return simplify(symbolic_rule)

    def _get_symbolic_coupling(self, coupling_name):
        """
        Retrieve the symbolic representation of a coupling by name.
        """
        if hasattr(coupling_name, 'value'):
            return sympify(
                coupling_name.value.replace(
                    'cmath.',''
                ).replace('complex(0,1)','1j')
            )
        else:
            return sympify(0)  # Default to 0 if not found

    def _get_symbolic_lorentz(self, lorentz_obj):
        """
        Retrieve the symbolic representation of a Lorentz structure.
        """
        if hasattr(lorentz_obj, 'structure'):
            return sympify(lorentz_obj.structure)
        else:
            return sympify(1)  # Default to 1 if no structure provided

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

if __name__ == "__main__":
    ufo_directory = "/workspaces/LRSM-with-Spheno/UFOmodel/MLRSM_UFO"
    explorer = UFOModelExplorer(ufo_directory)
    explorer.load_model()
    explorer.summarize_model()

    # Example query: Find all vertices involving a specific particle (e.g., 'H')
    particle_name = 'H'
    print(f"\nVertices involving the particle '{particle_name}':")
    vertices = explorer.find_vertices_involving(particle_name)
    for vertex in vertices:
        print(vertex)

    # Generate and display Feynman rules
    print("\nSymbolic Feynman Rules:")
    feynman_rules = explorer.list_feynman_rules()
    print(feynman_rules)

