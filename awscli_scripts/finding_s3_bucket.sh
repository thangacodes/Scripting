#!/bin/bash
read -p "Enter the S3 bucket name:" S3_BUCKET
LIST_S3=$(aws s3 ls | grep -w "${S3_BUCKET}" | grep -v grep | wc -l)
echo ${LIST_S3}

if [[ ${LIST_S3} == 0 ]];
then
   echo "${S3_BUCKET} is not a valid S3_BUCKET_NAME..."
   echo "Please try again with Valid S3_BUCKET_NAME..."
elif
   [[ ${LIST_S3} == 1 ]];
then
  AVAIL=$(aws s3 ls | grep -i "${S3_BUCKET}" | awk '{print $3}')
  echo "THIS BUCKET is available :" ${AVAIL}
fi

