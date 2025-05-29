import os

# Define your parameters here as a list of dictionaries
parameters = [
    # Example parameter
    {
        "name": "g1",
        "description": "U(1) gauge coupling",
        "output_name": "g1",
        "latex": "g_1",
        "real": True,
        "value": None,
        "les_houches": "GAUGE 1"
    },
    # Add more parameters as needed
]

def write_parameters_file(parameters, filename):
    with open(filename, "w") as f:
        f.write("ParameterDefinitions = {\n")
        for param in parameters:
            f.write("  {{\n")
            f.write(f'    {param["name"]},\n')
            f.write("    {{\n")
            f.write(f'      Description -> "{param["description"]}",\n')
            f.write(f'      OutputName -> "{param["output_name"]}",\n')
            f.write(f'      LaTeX -> "{param["latex"]}",\n')
            if param["real"]:
                f.write("      Real -> True,\n")
            if param["value"] is not None:
                f.write(f'      Value -> {param["value"]},\n')
            f.write(f'      LesHouches -> {param["les_houches"]}\n')
            f.write("    }\n")
            f.write("  },\n")
        f.write("};\n")

if __name__ == "__main__":
    output_path = os.path.join(os.path.dirname(__file__), "parameters.m")
    write_parameters_file(parameters, output_path)
