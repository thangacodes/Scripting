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
            brew install pi3
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
        minikube)
            brew install minikube
            ;;
        jq)
            brew install jq
            ;;
        synk)
            brew install snyk
            synk --version
            ;;
        vault)
            brew install vault
            ;;
        *)
            echo "No install method for $1"
            ;;
    esac
}

# List of packages to check
packages=("pip3" "psql" "tree" "checkov" "minikube" "jq" "synk" "vault")

# Loop through the list and check each package
for package in "${packages[@]}"; do
    check_package "$package"
done
echo "All checks have been completed."
