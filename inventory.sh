#!/bin/bash

echo -e "\033[94m Getting system information"
DATE=$(date '+%Y-%m-%d %H:%M:%S')
echo -e "\033[91m The date is:" ${DATE}
UPTIME=$(uptime -p)
echo -e "\033[92m The uptime of the server is:" ${UPTIME}
HOSTNAME=$(hostname)
echo -e "\033[93m The server hostname is:" ${HOSTNAME}
IP_ADDRESS=$(hostname -i)
echo -e "\033[94m IP Address of the server is:" ${IP_ADDRESS}
OS_NAME=$(uname)
echo -e "\033[95m OS version of the server is:" ${OS_NAME}

echo -e "\033[91m S.No,DATE,UPTIME,HOSTNAME,IP_ADDRESS,OS_NAME" > inventory.csv
echo -e "\033[91m 1.$DATE,$UPTIME,$HOSTNAME,$IP_ADDRESS,$OS_NAME" >> inventory.csv

echo -e "\033[94m Uploading $FILE file to $S3_BUCKET...!!!"

echo -e "list out the s3 buckets.."

aws s3 ls | awk '{print $3}'

S3_BUCKET="s3://tb-dev25-customer-index/"

FILE="inventory.csv"

echo $S3_BUCKET


echo -e "\033[92m Uploading $FILE file to $S3_BUCKET"

aws s3 cp $FILE $S3_BUCKET

echo -e "\033[92m List Outing the files in $S3_BUCKET ..."

aws s3 ls $S3_BUCKET

sleep 5

echo -e "\033[97m Deleting the $FILE from $S3_BUCKET..."

aws s3 rm $S3_BUCKET$FILE

echo -e "\033[95m once again list outing the files from $S3_BUCKET..."

aws s3 ls $S3_BUCKET

echo -e "\033[91m Removing $FILE in local system..."
LOCAL_DIR=$(pwd)
echo -e "\033[92m You are now on the Directory:" $LOCAL_DIR
echo "Deleting the file $FILE begin shortly...."
rm -f $LOCAL_DIR/$FILE
exit
