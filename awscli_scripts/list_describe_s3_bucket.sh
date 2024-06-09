#!/bin/bash

## Fetching region detail
REGION=$(aws ec2 describe-availability-zones --output text --query 'AvailabilityZones[0].[RegionName]')

## List S3 buckets and extract ONLY the bucket names
buckets=$(aws s3 ls | awk '{print $3}')

## Loop through each bucket name and print it
for bucket in $buckets; do
    echo "Available and Conigured S3BUCKET in region $REGION is :" $bucket
    aws s3api get-bucket-location --bucket $bucket
    aws s3api get-bucket-acl --bucket $bucket
done
exit

