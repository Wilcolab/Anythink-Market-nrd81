#!/bin/bash

input_file=$1
output_file="output_names.txt"

# Use grep to filter lines that contain "@amazon.com"
# Make the search case-insensitive using the -i option
filtered_lines=$(grep -i "@amazon.com" $input_file)

# Use cut to extract the email address and last name
extracted_columns=$(echo "$filtered_lines" | cut -d ',' -f 2,3)

# Use tr to replace commas with spaces
formatted_output=$(echo "$extracted_columns" | tr ',' ' ')

# Redirect the final output to the output file
echo "$formatted_output" > "$output_file"

# Confirm that the output was written to the file
if [ -f "$output_file" ]; then
  echo "The filtered names and last names have been written to $output_file."
else
  echo "Error: Failed to write to $output_file."
fi
