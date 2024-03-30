#!/bin/bash

echo "Script starts at :" $(date '+%Y-%m-%d %H:%M:%S')

# Get Instance ID
INSID=$(aws ec2 describe-instances --query 'Reservations[*].Instances[*].InstanceId' --output text)

# Loop through each Instance ID
for ID in $INSID; do
    # Get Private IP
    PRIVATE_IP=$(aws ec2 describe-instances --instance-ids "$ID" --query 'Reservations[*].Instances[*].PrivateIpAddress' --output text)

    # Get Public IP
    PUBLIC_IP=$(aws ec2 describe-instances --instance-ids "$ID" --query 'Reservations[*].Instances[*].PublicIpAddress' --output text)

    # Get Security Groups
    SECURITY_GROUP=$(aws ec2 describe-instances --instance-ids "$ID" --query 'Reservations[*].Instances[*].SecurityGroups[*].GroupName' --output text)

    # Outputs
    echo "Instance Id is: $ID"
    echo "Instance Public IP is: $PUBLIC_IP"
    echo "Instance Private IP is: $PRIVATE_IP"
    echo "Instance Security Group is: $SECURITY_GROUP"
done   > /home/ec2-user/metainfo.txt
sleep 3
S3_BUCKET_NAME="s3://gitops-demo-bucket-tf"
FILE_NAME="/home/ec2-user/metainfo.txt"

if [[ $FILE_NAME == "/home/ec2-user/metainfo.txt" ]];
then
        echo "$FILE_NAME is exist on the path.."
else
        echo "$FILE_NAME is doesn't exist on the path.."
fi

echo "Going to upload the files to s3_bucket.."

aws s3 cp $FILE_NAME $S3_BUCKET_NAME

aws s3 ls $S3_BUCKET_NAME

exit
