#!/bin/bash

# Function to check if a command is installed
check_package() {
    if command -v "$1" &> /dev/null; then
        echo "$1 package is already installed."
    else
        echo "$1 package is not already installed. Installing..."
        install_package "$1"
    fi
}

# Function to install packages using Homebrew
install_package() {
    case $1 in
        pip3)
            brew install python  # pip3 comes with python
            ;;
        psql)
            brew install postgresql
            ;;
        tree)
            brew install tree
            ;;
        checkov)
            brew install checkov
            ;;
        *)
            echo "No install method for $1"
            ;;
    esac
}

# Check and install pip3
check_package "pip3"

# Check and install PostgreSQL client
check_package "psql"

# Check and install tree
check_package "tree"

# Check and install Checkov
check_package "checkov"

echo "All checks have been completed."
