#!/bin/bash

# Store the file name
file=$1

# Store the output file name
output_file="output.txt"

# Check if the file exists
if [ -f $file ]; then
  echo "$file exists"
  # Read each line of the file
  while IFS=',' read -r name last email; do
    # Check if the email is from @amazon.com
    if [[ $email == *"@amazon.com" ]]; then
      # Print the name and last name to the output file
      echo "Name: $name" >> $output_file 2> error.txt
      echo "Last Name: $last" >> $output_file 2> error.txt
    fi
  done < $file
  if [ -s error.txt ]; then
    echo "There was an error while writing to the file."
    echo "The error message is:"
    cat error.txt
  else
    echo "The filtered names and last names have been written to $output_file."
  fi
else
  # If the file does not exist, print an error message
  echo "Error: The file $file does not exist."
fi