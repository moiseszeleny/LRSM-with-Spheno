#!/bin/bash

# Directory containing Python files
python_dir="MLRSMc_UFO"

# Change to the Python directory
cd "$python_dir" || exit

# Find all Python files and run each one
for file in *.py; do
    if [ -f "$file" ]; then
        echo "Running $file"
        2to3 -w "$file"
    fi
done

