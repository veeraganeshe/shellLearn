#!/bin/bash

read -p "Enter a file name to check: " myfile

# Check if the file exists and is not empty
if [ -n "$(find . -maxdepth 1 -type f -name "${myfile}*" -print -quit)" ]; then
    actual_file=$(find . -maxdepth 1 -type f -name "${myfile}*" -print -quit)
    if [ -s "$actual_file" ]; then
        echo "$actual_file is not empty"
        echo "Contents of $actual_file:"
        cat "$actual_file"
    else
        echo "$actual_file is empty"
    fi
else
    echo "$myfile does not exist"
fi
