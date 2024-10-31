#!/bin/bash

set -e  # Exit immediately if a command exits with a non-zero status
echo "____________________ Testing __________________"
# Prompt user for package name
read -p "Enter the package you'd like to install on the systems: " PACKAGE
# Verify the package name
echo "Verifying the package name entered by the user: $PACKAGE"
# Install the package
if sudo yum install -y "$PACKAGE"; then
    echo "$PACKAGE installed successfully."
else
    echo "Failed to install $PACKAGE. Please check the package name and try again."
    exit 1
fi

# Check DNS resolution for examples
echo "Checking DNS resolution..."
for domain in google.com linkedin.com; do
    echo "Resolving $domain..."
    nslookup "$domain" || echo "Failed to resolve $domain."
done

# List the installed package
if yum list installed | grep -q "$PACKAGE"; then
    echo "$PACKAGE is installed."
else
    echo "$PACKAGE is not installed."
fi

# Uninstall the package
echo "Going to uninstall $PACKAGE..."
if sudo yum remove -y "$PACKAGE"; then
    echo "$PACKAGE uninstalled successfully."
else
    echo "Failed to uninstall $PACKAGE."
    exit 1
fi

echo "____________ Script Ends __________"
