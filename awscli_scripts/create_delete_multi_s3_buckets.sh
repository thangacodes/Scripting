#!/bin/bash

read -p "Enter the bucket prefix, that you would like to keep as an Unique: " USER_INPUT
echo "User entered the prefix value is:" $USER_INPUT
bucket_prefix=$USER_INPUT

# List current S3 buckets
echo "Listing current S3 buckets..."
aws s3 ls --profile vault_admin

# Create 5 S3 buckets
for i in {1..5}; do
  echo "Creating bucket $bucket_prefix-$i"
  aws s3 mb s3://$bucket_prefix-$i --profile vault_admin
done

# Sleep for 5 seconds
echo "Sleeping for 5 seconds..."
sleep 5

# Empty and delete all 5 S3 buckets
for i in {1..5}; do
  # Empty the bucket first
  echo "Emptying bucket $bucket_prefix-$i"
  aws s3 rm s3://$bucket_prefix-$i --recursive --profile vault_admin

  # Deleting the bucket after it's empty
  echo "Deleting bucket $bucket_prefix-$i"
  aws s3 rb s3://$bucket_prefix-$i --profile vault_admin --force
done

# Post check: List remaining S3 buckets
echo "Listing S3 buckets after deletion..."
aws s3 ls --profile vault_admin

# How to execute this script is,
# create_delete_multi_s3_buckets.sh

## Note: We are using an AWS profile, which is associated with an access_key and secret_access_key.
