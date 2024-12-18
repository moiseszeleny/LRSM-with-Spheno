#!/bin/bash

# Directory containing Python files
python_dir="/home/moises/Escritorio/UFO_2to3/Model_UFO_331_1"

# Change to the Python directory
cd "$python_dir" || exit

# Find all Python files and run each one
for file in *.py; do
    if [ -f "$file" ]; then
        echo "Running $file"
        2to3 -w "$file"
    fi
done

