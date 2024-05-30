#!/bin/bash

# Get the directory from the first script argument

directory="$1"

# Check if the directory argument is provided

if [ -z "$directory" ]; then
  echo "Usage: $0 <directory>"
  exit 1
fi

# Check if the provided argument is a valid directory

if [ ! -d "$directory" ]; then
  echo "Error: '$directory' is not a valid directory."
  exit 1
fi

# Find and list all empty files in the directory

echo "Empty files in $directory:"

find "$directory" -type f -empty


