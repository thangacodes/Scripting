#!/bin/bash

echo -e "\e[1;31m Checking if aws configure and access_key is setup in our system:"

if ! grep -q aws_access_key_id ~/.aws/config; then      # grep -q  Turns off Writing to standard output
   if ! grep -q aws_access_key_id ~/.aws/credentials; then
      echo "AWS config not found or CLI is not installed"
      exit 1
    fi
fi

echo -e "\e[1;32m read command will prompt you to enter the name of IAM user you wish to create:"

read -p "Enter the username to create": USERNAME

echo -e "\e[1;34m Using AWS CLI Command to create IAM user:"

aws iam create-user --user-name "${USERNAME}" --output json

# Here we are creating access and secret keys and then using query and storing the values in credentials

credentials=$(aws iam create-access-key --user-name "${USERNAME}" --query 'AccessKey.[AccessKeyId,SecretAccessKey]'  --output text)

# cut command formats the output with correct coloumn.

ACCESS_KEY=$(echo ${credentials} | cut -d " " -f 1)
SECRET_ACCESS_KEY=$(echo ${credentials} | cut --complement -d " " -f 1)

echo -e "\e[1;35m printing the require information on the screen:"

echo "The Username: ${USERNAME} has been created...."
echo "The access_key id of ${USERNAME} is: ${ACCESS_KEY}"
echo "The Secret_access_key id of ${USERNAME} is: ${SECRET_ACCESS_KEY}"

read -p "Enter the user that you wanted to delete off:" USER
echo ${USER}

echo "First deleting the access_key: ${ACCESS_KEY} of an user: ${USER} and then deleting the user account: ${USER}"

if [ "${USER}" == "manick" ]
then
echo The user: "${USER}" and his/her access_key_id: "${ACCESS_KEY}" will be deleted shortly....
aws iam delete-access-key --access-key ${ACCESS_KEY} --user-name ${USER}
aws iam list-access-keys --user-name ${USER}
aws iam delete-user --user-name "${USER}"
else
echo "Entered the username: "${USER}" is incorrect"
fi
