#!/bin/bash

# Get Instance ID
INSID=$(aws ec2 describe-instances --query 'Reservations[*].Instances[*].InstanceId' --output text)

# Loop through each Instance ID
for ID in $INSID; do
    # Get Private IP
    PRIVATE_IP=$(aws ec2 describe-instances --instance-ids "$ID" --query 'Reservations[*].Instances[*].PrivateIpAddress' --output text)
    # Get Public IP
    PUBLIC_IP=$(aws ec2 describe-instances --instance-ids "$ID" --query 'Reservations[*].Instances[*].PublicIpAddress' --output text)
    # Get Security Groups
    SECURITY_GROUP=$(aws ec2 describe-instances --instance-ids "$ID" --query 'Reservations[*].Instances[*].SecurityGroups[*].GroupName' --output text)

    # Output that we required is like this..
    echo "Instance Id is: $ID"
    echo "Instance Public IP is: $PUBLIC_IP"
    echo "Instance Private IP is: $PRIVATE_IP"
    echo "Instance Security Group is: $SECURITY_GROUP"
done
