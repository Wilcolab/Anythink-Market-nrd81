#!/bin/bash

# Check if a file was passed as an argument
if [ $# -eq 0 ]; then
  echo "No file provided."
  exit 1
fi

# Check if the file exists
if [ ! -f $1 ]; then
  echo "File does not exist."
  exit 1
fi

# Filter the lines with @amazon.com in the email column
grep "@amazon.com" $1 | while read line; do
  # Extract the first name and last name from each line
  first_name=$(echo $line | cut -d "," -f 3)
  last_name=$(echo $line | cut -d "," -f 2)
  
  # Print the first name and last name separated by a space
  echo "$first_name $last_name"
done > output_names.txt