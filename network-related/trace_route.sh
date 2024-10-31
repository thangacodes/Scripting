#!/bin/bash
echo "Traceroute Script..."
names=("google.com" "linkedin.com" "www.facebook.com")
for domain in "${names[@]}"; do 
    echo "Starting traceroute for: $domain..."
    # Perform the traceroute command
    traceroute "$domain"
    # Check the exit status of the traceroute command
    if [ $? -eq 0 ]; then
    echo "Traceroute command succeeded for $domain."
    echo "**************************************"
    else 
        echo "Traceroute command failed for $domain."
    fi
done
