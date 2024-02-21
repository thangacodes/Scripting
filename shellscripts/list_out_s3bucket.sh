#!/bin/bash
echo -e "\e[1;32m ***** This script is executed at $(date '+%Y-%m-%d %H:%M:%S') *****"
echo "Going to get s3 bucket list using bash script"
read -p "Enter the access_key:" AKEY
echo  $AKEY
read -p "Enter the secret_access_key:" SKEY
echo $SKEY
bucket=`aws s3 ls`
echo "you have a S3 bucket name called as: $bucket"
sleep 2
exit
