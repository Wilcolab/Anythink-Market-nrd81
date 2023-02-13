#!/bin/bash

# usage: ./script.sh <file_name>

# Check if a file argument is passed
if [ "$#" -ne 1 ]; then
    echo "Error: Missing file argument."
    echo "Usage: ./script.sh <file_name>"
    exit 1
fi

# Store the file name in a variable
file="$1"

# Check if the file exists
if [ ! -f "$file" ]; then
    echo "Error: File $file not found."
    exit 1
fi

# Filter the data
grep "@amazon.com" "$file" | awk -F "," '{print $2, $3}' > output_names.txt

echo "Filtered data written to output_names.txt"
