#!/bin/bash

echo "You've entered Domain name is: ${DOMAIN}"
echo "Key size (in bits, e.g., 2048): ${BYTE}"
echo "Validity period: ${DAYS}"

# Generating certificate commands
# Generate a private key
openssl genrsa -out "${DOMAIN}.key" "${BYTE}"
# Create a CSR (Certificate Signing Request)
openssl req -new -key "$DOMAIN.key" -out "$DOMAIN.csr" -subj "/C=IN/ST=KA/L=Bangalore/O=Cloudbird/OU=Cloudbird/CN=*.${DOMAIN}.fun/emailAddress=admin@${DOMAIN}.fun"
# Verify the CSR
openssl req -text -in "$DOMAIN.csr" -noout -verify | grep -i 'Certificate request self-signature ok'
# Create a self-signed certificate from the CSR
openssl x509 -in "$DOMAIN.csr" -out "$DOMAIN.crt" -req -signkey "$DOMAIN.key" -days "$DAYS"
sleep 5
echo "certificate generation is completed.."
exit 0
