#!/bin/bash

# Check if the correct number of arguments is provided
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 DIRECTORY"
    exit 1
fi

# Assign the first argument to a variable
DIRECTORY="$1"

# Check if the argument is a directory
if [ ! -d "$DIRECTORY" ]; then
    echo "Error: $DIRECTORY is not a directory"
    exit 2
fi

# Loop over all PDF files in the directory
for pdf_file in "$DIRECTORY"/*.pdf; 
do
    # Check if the file exists to handle the case of no PDF files
    if [ -f "$pdf_file" ]; then
        echo "Converting $pdf_file"
        python3 cis2csv.py "$pdf_file"
    else
        echo "No PDF files found in $DIRECTORY"
        exit 3
    fi
done

echo "Conversion complete."
