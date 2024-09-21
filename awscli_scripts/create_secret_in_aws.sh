#!/bin/bash
echo "Script to manage secrets in SecretsManager via AWS CLI..."
read -p "Enter the secret_name that you wanted to be setup for RDS instance: " secret_name
echo "your input is :" $secret_name
password=`python3 -c "from string import ascii_letters; from string import digits; from random import choices; print(\"\".join(choices(ascii_letters + digits, k=20)))";`
region="ap-south-1"

echo "Checking AWS CLI version..."
aws --version
# List existing secrets
echo "Listing available secrets in AWS account in region ($region) ..."
existing_secrets=$(aws secretsmanager list-secrets --query "SecretList[?Name=='$secret_name'].Name" --output text --region $region)
if [ "$existing_secrets" == "$secret_name" ]; then
    echo "Secret '$secret_name' already exists."
    read -p "Do you want to delete it (OR) create a new one (OR) skip (delete/create/skip): " user_action
    case $user_action in
        delete|Delete)
            echo "Deleting secret '$secret_name'..."
            aws secretsmanager delete-secret --secret-id $secret_name --force-delete-without-recovery
            echo "Secret '$secret_name' deleted successfully."
            ;;
        create|CREATE)
            echo "Creating a new secret (this will not create if secret already exists) ..."
            aws secretsmanager create-secret --name $secret_name --secret-string $password
            echo "Random generated Secret '$secret_name' created using Python3 is successfully..."
            ;;
        skip|SKIP)
            echo "Skipping any changes to secret '$secret_name'."
            ;;
        *)
            echo "Invalid option. Skipping."
            ;;
    esac
else
read -p "No existing secret found. Would you like to create a new secret? Say (yes/no): " create_secret
if [[ $create_secret = [Yy][Ee][Ss] ]]; 
then
    echo "Creating a new secret in AWS..."
    aws secretsmanager create-secret --name $secret_name --secret-string $password --region $region
    echo "Secret '$secret_name' created successfully."
elif [[ $create_secret = [Nn][Oo] ]]; 
then
    echo "No action taken. Exiting the script...!!"
else
    echo "Invalid input. Please try with the correct options...!!"
    exit 1
fi
fi

# List all available secrets
echo "Double checking if any secrets exist. If exist the output will print secret ARN/Name/LastChangedDate ..."
aws secretsmanager list-secrets
exit 0
