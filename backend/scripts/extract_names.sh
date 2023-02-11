#!/usr/bin/bash

# Store the input file name
input_file=$1

# Store the output file name
output_file="output_names.txt"

# Use grep to filter lines that contain "@amazon.com"
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