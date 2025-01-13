import os

def execute_ufo_file(filepath):
    """Execute a UFO file and return the defined objects."""
    namespace = {}
    with open(filepath, 'r') as f:
        code = f.read()
    exec(code, namespace)  # Execute the file in a controlled namespace
    return namespace

class UFOModelExplorer:
    """Class to explore the UFO model by executing its files."""

    def __init__(self, ufo_directory):
        self.ufo_directory = ufo_directory
        self.particles = []
        self.parameters = []
        self.couplings = []
        self.lorentz_structures = []
        self.vertices = []

    def load_model(self):
        """Load the UFO model by executing its files."""
        # Define file mapping
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
                print(f"Loading {key} from {filepath}...")
                namespace = execute_ufo_file(filepath)
                self._extract_objects(key, namespace)

    def _extract_objects(self, key, namespace):
        """Extract objects from the namespace based on file type."""
        if key == 'particles':
            self.particles = [
                obj for obj in namespace.values()
                if isinstance(obj, namespace.get('Particle', type))
            ]
        elif key == 'parameters':
            self.parameters = [
                obj for obj in namespace.values()
                if isinstance(obj, namespace.get('Parameter', type))
            ]
        elif key == 'couplings':
            self.couplings = [
                obj for obj in namespace.values()
                if isinstance(obj, namespace.get('Coupling', type))
            ]
        elif key == 'lorentz':
            self.lorentz_structures = [
                obj for obj in namespace.values()
                if isinstance(obj, namespace.get('Lorentz', type))
            ]
        elif key == 'vertices':
            self.vertices = [
                obj for obj in namespace.values()
                if isinstance(obj, namespace.get('Vertex', type))
            ]

    def summarize_model(self):
        """Print a summary of the loaded model."""
        print(f"Particles: {len(self.particles)}")
        print(f"Parameters: {len(self.parameters)}")
        print(f"Couplings: {len(self.couplings)}")
        print(f"Lorentz Structures: {len(self.lorentz_structures)}")
        print(f"Vertices: {len(self.vertices)}")

