#!/bin/bash

# Hardcode variables
region="ap-south-1"
password=`python3 -c "from string import ascii_letters; from string import digits; from random import choices; print(\"\".join(choices(ascii_letters + digits, k=10)))";`

# Function to list existing secret
list_secret(){
    aws secretsmanager list-secrets
    checking_secrets=$(aws secretsmanager list-secrets --query "SecretList[*].Name" --output text)
    ACCOUNT_NUMBER=$(aws sts get-caller-identity --query Account --output text)
    if [ -z "$checking_secrets" ]; then
        echo "No secrets found agains an AWS account: $ACCOUNT_NUMBER and the specified region: $region"
    else
        echo "retrying to see if any secrets there or not: $checking_secrets"
    fi
}

# Function to create a secret
create_secret() {
    read -p "enter the string name please: " secret_name
    aws secretsmanager create-secret --name "$secret_name" --secret-string "$password" --region "$region"
    if [ $? -eq 0 ]; then
        echo "Secret '$secret_name' created successfully."
    else
        echo "Failed to create the secret '$secret_name'."
        exit 1
    fi
}

# Function to delete a secret
delete_secret() {
    read -p "enter the secret name to be delete: " secret_name
    aws secretsmanager delete-secret --secret-id "$secret_name" --force-delete-without-recovery --region "$region"
    if [ $? -eq 0 ]; then
        echo "Secret '$secret_name' deleted successfully."
    else
        echo "Failed to delete the secret '$secret_name'."
        exit 1
    fi
}

# Invoking functions based on user accounts.
read -p "Do you want to create or delete a secret? (create/delete/list): " user_action

if [ "$user_action" == "create" ]; then
    create_secret
elif [ "$user_action" == "delete" ]; then
    delete_secret
elif [ "$user_action" == "list" ]; then
    list_secret
else
    echo "Invalid option. Please try with the right option.."
    exit 1
fi
