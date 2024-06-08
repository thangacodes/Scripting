#!/bin/bash

# List EC2 key pairs and extract the key names

keynames=$(aws ec2 describe-key-pairs --query 'KeyPairs[*].KeyName' --output text)

echo "EC2 Keypair Names:"

# Loop through each key name and print it

for keyname in $keynames; 
do
    echo "Currently available Keypair is :" $keyname
done

exit

