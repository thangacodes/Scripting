#!/bin/bash

read -p "Enter username please:" IAM_USER

echo "You've entered IAM user is:" ${IAM_USER}

if [[ ${IAM_USER} == ondot ]];
then
        USER=$(aws iam list-users | grep -w '${IAM_USER}' | awk 'NR==1 {print $2}')
        echo "User $USER is exist in AWS account.."
else
        echo "Unable to find the user in IAM. Please try with the valid user..."
fi

