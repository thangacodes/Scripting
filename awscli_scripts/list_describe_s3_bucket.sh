#!/bin/bash


# List S3 buckets and extract the bucket names using awk

buckets=$(aws s3 ls | awk '{print $3}')

echo "Going to show the variable stored values here after awk command....."

# Loop through each bucket name and print it

for bucket in $buckets; do
    echo "Available/conigured bucket name is :" $bucket
    aws s3api get-bucket-location --bucket $bucket
    aws s3api get-bucket-acl --bucket $bucket
done

exit

