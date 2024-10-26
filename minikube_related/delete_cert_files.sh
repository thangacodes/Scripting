#!/bin/bash

read -p "Please provide the user relevant files deletion: " INPUT

echo "Script will delete the following files in the current directory: $(pwd) - $INPUT.csr, $INPUT.crt, $INPUT.key"

# Check for the existence of the files
if [[ -e "$INPUT.csr" ]] || [[ -e "$INPUT.crt" ]] || [[ -e "$INPUT.key" ]]; then
    echo "*.crt, *.csr, *.key files exist..."
    
    # Deleting the files
    [[ -e "$INPUT.csr" ]] && rm "$INPUT.csr" && echo "Deleted $INPUT.csr"
    [[ -e "$INPUT.crt" ]] && rm "$INPUT.crt" && echo "Deleted $INPUT.crt"
    [[ -e "$INPUT.key" ]] && rm "$INPUT.key" && echo "Deleted $INPUT.key"
else
    echo "No relevant files found to delete."
fi

exit 0
