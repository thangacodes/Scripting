#!/bin/sh
# set -x //Debug enabling when do you require it...
echo -e "\e[1;34m ***** This script is executed at *****" $(date '+%Y-%m-%d %H:%M:%S')
echo "Adding security group inbound rules on the existing security group"

read -p "Enter the Security_group_id please:" SECGP
echo -e "\e[1;31m ***** You've entered the security_group id is as: *****" $SECGP
read -p "Enter the IP CIDR please:" IPCIDR
echo -e "\e[1;32m ***** You've entered the IP_CIDR value is as: *****" $IPCIDR
read -p "Enter the reasonable description:" DESC
echo -e "\e[1;33m ***** You've entered the Description is as: *****" $DESC
read -p "Enter the fromport:" FROMPORT
echo -e "\e[1;34m ***** You've entered the From_port value as: *****" $FROMPORT
read -p "Enter the toport:" TOPORT
echo -e "\e[1;35m ***** You've entered the To_port value as: *****" $TOPORT
read -p "Enter the region where you're security_group is existing:" REGION
echo -e "\e[1;36m ***** You've entered the Region in AWS is as: *****" $REGION
echo "******************** LETS PROCEED WITH AUTOMATION OF AWSCLI WITH BASH SCRIPT ************************"
aws ec2 authorize-security-group-ingress --group-id $SECGP --ip-permissions IpProtocol=tcp,FromPort=$FROMPORT,ToPort=$TOPORT,IpRanges="[{CidrIp=$IPCIDR,Description='$DESC'}]"
echo "Describing a security group:" $SECGP
aws ec2 describe-security-groups --group-ids $SECGP --region $REGION
read -p "Are we good to proceed in revoking the SG rules:" ENTER
echo -e "\e[1;33m ***** You've feed the value as: *****" $ENTER
echo -e "\e[1;32m ***** Before proceeding with revoking access, there will be a small break: *****"
sleep 5
echo -e "\e[1;36m ***** Revoking security_group_rules in progress: *****"
aws ec2 revoke-security-group-ingress --group-id $SECGP --ip-permissions IpProtocol=tcp,FromPort=$FROMPORT,ToPort=$TOPORT,IpRanges="[{CidrIp=$IPCIDR,Description='$DESC'}]"
exit
