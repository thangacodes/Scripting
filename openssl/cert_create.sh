#!/bin/bash
echo "This script creates a self-signed certificate for an application."
# Input domain name
read -p "Please enter the domain name: " DOMAIN
echo "You've entered Domain name is: $DOMAIN"

# Input key size (in bits, e.g., 2048)
read -p "Please enter the key size (in bits, e.g., 2048): " BYTE
echo "Key size: $BYTE"

# Input validity period
read -p "Please enter the number of days the certificate should be valid: " DAYS
echo "Validity period: $DAYS"

# Begin certificate generation
echo "Generating certificate..."

# Generate a private key
openssl genrsa -out "$DOMAIN.key" "$BYTE"

# Create a CSR (Certificate Signing Request)
openssl req -new -key "$DOMAIN.key" -out "$DOMAIN.csr"

# Verify the CSR
openssl req -text -in "$DOMAIN.csr" -noout -verify

# Create a self-signed certificate from the CSR
openssl x509 -in "$DOMAIN.csr" -out "$DOMAIN.crt" -req -signkey "$DOMAIN.key" -days "$DAYS"

# List generated files with detailed information
ls -lrt

echo "Certificate generation complete."
exit 0
