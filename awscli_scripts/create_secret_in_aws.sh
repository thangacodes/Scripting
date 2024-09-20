#!/bin/bash
echo "Script to manage secrets for the RDS instance via AWS CLI..."
secret_name="db_instance_pass"
password=`python3 -c "from string import ascii_letters; from string import digits; from random import choices; print(\"\".join(choices(ascii_letters + digits, k=16)))";`
region="ap-south-1"

echo "Checking AWS CLI version..."
aws --version

# List existing secrets
echo "Listing available secrets in AWS account in region $region..."
existing_secrets=$(aws secretsmanager list-secrets --query "SecretList[?Name=='$secret_name'].Name" --output text --region $region)

if [ "$existing_secrets" == "$secret_name" ]; then
    echo "Secret '$secret_name' already exists."
    read -p "Do you want to (d)elete it, (c)reate a new one, or (s)kip? (d/c/s): " user_action
    case $user_action in
        d|D)
            echo "Deleting secret '$secret_name'..."
            aws secretsmanager delete-secret --secret-id $secret_name --force-delete-without-recovery
            echo "Secret '$secret_name' deleted successfully."
            ;;
        c|C)
            echo "Creating new secret (this will not create if secret already exists) ..."
            # Optionally, you can generate a new password here if needed
            aws secretsmanager create-secret --name $secret_name --secret-string $password
            echo "Secret '$secret_name' created successfully."
            ;;
        s|S)
            echo "Skipping any changes to secret '$secret_name'."
            ;;
        *)
            echo "Invalid option. Skipping."
            ;;
    esac
else
    read -p "No existing secret found. Do you want to create a new secret? (y/n): " create_secret
    if [[ "$create_secret" =~ ^[Yy]$ ]]; then
        echo "Creating a new secret in $region..."
        aws secretsmanager create-secret --name $secret_name --secret-string $password
        echo "Secret '$secret_name' created successfully."
    else
        echo "No action taken. Exit the script...!!"
    fi
fi

# List all available secrets
echo "Cross checking if any secrets exist or not..."
aws secretsmanager list-secrets --region $region
exit 0
