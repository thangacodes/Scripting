### Script use to create softlink in linux/unix based OS

#!/bin/bash
# Enable debugging
set -x
# Prompt user for file name
read -p "Enter the file name that you want to create: " FILE1
echo "You entered the name of the file as: $FILE1"
# Notify user about file creation
echo "File creation begins in a moment..."
# Create the file
if touch "$FILE1"; then
    echo "File '$FILE1' created successfully."
else
    echo "Failed to create file '$FILE1'."
    exit 1
fi
# Display location where the file and softlink will be created
LOCATION=$(pwd)
echo "File and softlink will be created under: $LOCATION"
# Write content to the file
echo "This is file1 content" > "$FILE1"
# Display the content and status of the created file
if cat "$FILE1"; then
    stat "$FILE1"
else
    echo "Failed to display or get the status of the file '$FILE1'."
    exit 1
fi
# Notify user about softlink creation
echo "Softlink will be created in a moment..."
# Create the softlink
if ln -s "$FILE1" softlink1; then
    echo "Softlink 'softlink1' created successfully."
else
    echo "Failed to create softlink 'softlink1'."
    exit 1
fi
# List directory contents and display softlink details
ls -ltr
if cat softlink1; then
    stat softlink1
else
    echo "Failed to display or get the status of the softlink 'softlink1'."
    exit 1
fi
exit 0
