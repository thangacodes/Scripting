#!/bin/bash

echo -e "Script is executed at:" $(date '+%Y-%m-%d %H:%M:%S')

#UG="kops"
echo -e "You are going to create an IAM user called:" $1

echo -e "Creationg IAM group called $1 "
aws iam create-group --group-name $1;

echo -e "Attaching the existing policies to the group $1"
aws iam attach-group-policy --policy-arn arn:aws:iam::aws:policy/AmazonEC2FullAccess --group-name $1;
aws iam attach-group-policy --policy-arn arn:aws:iam::aws:policy/AmazonRoute53FullAccess --group-name $1;
aws iam attach-group-policy --policy-arn arn:aws:iam::aws:policy/AmazonS3FullAccess --group-name $1;
aws iam attach-group-policy --policy-arn arn:aws:iam::aws:policy/IAMFullAccess --group-name $1;
aws iam attach-group-policy --policy-arn arn:aws:iam::aws:policy/AmazonVPCFullAccess --group-name $1;
aws iam attach-group-policy --policy-arn arn:aws:iam::aws:policy/AmazonSQSFullAccess --group-name $1;
aws iam attach-group-policy --policy-arn arn:aws:iam::aws:policy/AmazonEventBridgeFullAccess --group-name $1;


echo -e "Cross checking the attached policies to an IAM group: $1"
aws iam list-attached-group-policies --group-name $1

echo -e "Creating an IAM USER $1"
aws iam create-user --user-name $1;
echo "Adding the user $1 to the existing IAM group called $1"
aws iam add-user-to-group --user-name $1 --group-name $1;
echo -e "Creating ACCESS/SECRET KEY:"
aws iam create-access-key --user-name $1;

echo -e "Taking 5 seconds break"

sleep 5

echo "list out the users who is part of how many groups"
aws iam list-groups-for-user --user-name $UG

echo -e "removing an iam from the group $UG"
aws iam remove-user-from-group --user-name $UG --group-name $UG

echo "Firstly INactive the access_key of an USER: $UG"
aws iam update-access-key --access-key-id AKIAUDR7LWQZRXGJGYET --status Inactive --user-name $UG

echo "Deleting the access key of an user $UG"

aws iam delete-access-key --access-key-id AKIAUDR7LWQZRXGJGYET --user-name $UG

echo -e "Deleting an IAM USER $UG"
aws iam delete-user --user-name $UG

exit


