#!/bin/bash
# Ping the domain names only for '4' intervals
echo "Checking ping output with the help of ping..."
names=("google.com" "linkedin.com" "www.facebook.com")

for domain in "${names[@]}"; do
echo "Start pinging domain_name for: $domain..."
ping -c 4 $domain
if [ $? -eq 0 ]; then
echo "Ping command is succeeded for $domain."
echo "**************************************"
else 
echo "Ping command is not succeeded for $domain."
fi
done
