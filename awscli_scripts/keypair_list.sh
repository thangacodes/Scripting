#!/bin/bash

## Fetching the region detail

REGION=$(aws ec2 describe-availability-zones --output text --query 'AvailabilityZones[0].[RegionName]')

## List EC2 key pairs and extract the key names

keynames=$(aws ec2 describe-key-pairs --query 'KeyPairs[*].KeyName' --output text)

## Loop through each key name and print it

for keyname in $keynames;
do
    echo "Currently available Keypair is in $REGION :" $keyname
done

exit

