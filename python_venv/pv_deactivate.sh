#!/bin/bash
echo "Script to deactivate Python3 venv on a Linux/macOS machine..."

# Check if a virtual environment is active
if [[ "$VIRTUAL_ENV" != "" ]]; then
    echo "A virtual environment is currently active."
    read -p "Do you want to deactivate the existing venv? (yes/no): " response
    if [[ "$response" == "yes" ]]; then
        deactivate
        echo "Your Python virtual environment has been deactivated."
    else
        echo "You chose to keep the virtual environment active."
    fi
else
    echo "No active virtual environment found."
fi
