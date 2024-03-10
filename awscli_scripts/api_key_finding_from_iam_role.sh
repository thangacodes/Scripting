#!/bin/bash
echo "Script executed at: $(date '+%Y-%m-%d %H:%M:%S')"
echo "Script is use to find out an IAM roles access_key and Secret_key using bash"
read -p "Enter the IAM Role name please: " ROLE
echo "The role that you entered is that: " $ROLE
echo "Script begins now..."

TOKEN=`curl -X PUT "http://169.254.169.254/latest/api/token" -H "X-aws-ec2-metadata-token-ttl-seconds: 21600"` \
&& curl -H "X-aws-ec2-metadata-token: $TOKEN" http://169.254.169.254/latest/meta-data/iam/security-credentials/$ROLE

echo $TOKEN

exit
