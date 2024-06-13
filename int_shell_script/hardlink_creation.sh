#!/bin/bash

## Enable debugging
set -x
## Prompt user for file name
read -p "Enter the file name that you want to create: " FILE
echo "You entered the name of the file as: $FILE"

## Notify user about file creation
echo "File creation begins in a moment..."

## Create the file
if touch "$FILE"; then
    echo "File '$FILE' created successfully."
else
    echo "Failed to create file '$FILE'."
    exit 1
fi

## Display location where the file and softlink will be created
LOCATION=$(pwd)

## Write content to the file
echo "This is the content that will be append to the file" > "$FILE"

## Display the content and status of the created file
if cat "$FILE"; then
    stat "$FILE"
else
    echo "Failed to display or get the status of the file '$FILE'."
exit 1
fi

## Notify user about softlink creation
echo "Hardlink will be created in a moment..."

## Create the hardlink for a file
if ln "$FILE" hardlink;
then
    echo "Hardlink 'hardlink' created successfully."
else
    echo "Failed to create hardlink 'hardlink'."
exit 1
fi

## List directory contents and display softlink details
ls -ltr

if cat hardlink; then
    stat hardlink
else
    echo "Failed to display or get the status of the hardlink 'hardlink'."
exit 1
fi
exit 0
