#!/bin/bash
# Check DNS resolution for examples
echo "Checking DNS resolution with the help of nslookup..."
names=("google.com" "linkedin.com" "www.facebook.com")

for domain in "${names[@]}"; do
   echo "Resolving the domain_name for: $domain..."
   nslookup $domain
   if [ $? -eq 0 ]; then
      echo "Name resolution succeeded for $domain."
      echo "**************************************"
   else 
   echo "Name resolution is not succeeded for $domain."
   fi
done
