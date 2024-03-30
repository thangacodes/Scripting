#!/bin/bash

INSID=$(aws ec2 describe-instances | grep "InstanceId")

FIND=$(echo $INSID | cut -d'"' -f4)

PRIVATE_IP=$(aws ec2 describe-instances --instance-ids "$FIND" --query 'Reservations[*].Instances[*].PrivateIpAddress')
PUBLIC_IP=$(aws ec2 describe-instances --instance-ids "$FIND" --query 'Reservations[*].Instances[*].PublicIpAddress')
SECURITY_GROUP=$(aws ec2 describe-instances --instance-ids "$FIND" --query 'Reservations[*].Instances[*].SecurityGroups[*].GroupName')

## Outputs
echo "Instance Id is: $FIND"
echo "Instance Public IP is: $PRIVATE_IP"
echo "Instance Private IP is: $PUBLIC_IP"
echo "Instance Security Group is: $SECURITY_GROUP"
