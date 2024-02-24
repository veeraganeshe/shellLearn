for 
#!/bin/bash

## Prompt the user to enter a file name to check
read -p "Enter a file name to check: " myfile

## Check if the file exists and is not empty
if [ -n "$(find . -maxdepth 1 -type f -name "${myfile}*" -print -quit)" ]; then
    ## Find the actual file with the given name pattern
    actual_file=$(find . -maxdepth 1 -type f -name "${myfile}*" -print -quit)
    ## Check if the file is not empty
    if [ -s "$actual_file" ]; then
        ## Print a message indicating the file is not empty
        echo "$actual_file is not empty"
        ## Print the contents of the file
        echo "Contents of $actual_file:"
        cat "$actual_file"
    else
        ## Print a message indicating the file is empty
        echo "$actual_file is empty"
    fi
else
    ## Print a message indicating the file does not exist
    echo "$myfile does not exist"
fi


Line 1 Explanation:

if [ -n "$(find . -maxdepth 1 -type f -name "${myfile}*" -print -quit)" ]; then
[ -n "$(find . -maxdepth 1 -type f -name "${myfile}*" -print -quit)" ]: Tests whether the output of the find command is non-empty.
find . -maxdepth 1 -type f -name "${myfile}*" -print -quit: Searches for files in the current directory (.) matching the pattern ${myfile}*.
-maxdepth 1: Limits the search to the current directory only.
-type f: Specifies that only files should be considered (not directories).
-name "${myfile}*": Matches files whose names start with ${myfile}.
-print -quit: Prints the name of the first match and then quits the search.
-n: Checks if the output of the find command is non-empty.
Line 2 Explanation:

actual_file=$(find . -maxdepth 1 -type f -name "${myfile}*" -print -quit)
actual_file=: Assigns the result of the find command to the variable actual_file.
$(find . -maxdepth 1 -type f -name "${myfile}*" -print -quit): Executes the find command, which searches for files matching the pattern ${myfile}* and prints the name of the first match before quitting.



