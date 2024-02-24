#!/bin/bash

# Prompt the user to enter a file name to check
read -p "Enter a file name to check: " myfile

# Check if the file exists and is not empty
if [ -n "$(find . -maxdepth 1 -type f -name "${myfile}*" -print -quit)" ]; then
    # Find the actual file with the given name pattern
    actual_file=$(find . -maxdepth 1 -type f -name "${myfile}*" -print -quit)
    # Check if the file is not empty
    if [ -s "$actual_file" ]; then
        # Print a message indicating the file is not empty
        echo "$actual_file is not empty"
        # Print the contents of the file
        echo "Contents of $actual_file:"
        cat "$actual_file"
    else
        # Print a message indicating the file is empty
        echo "$actual_file is empty"
    fi
else
    # Print a message indicating the file does not exist
    echo "$myfile does not exist"
fi
