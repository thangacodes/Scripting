#!/bin/sh
echo -e "\e[1;32m ***** This script is executed at *****" $(date '+%Y-%m-%d %H:%M:%S')
echo "Adding security group inbound rules on the existing security group"
read -p "Enter the Security_group_id please:" SECGP
echo $SECGP
read -p "Enter the IP CIDR please:" IPCIDR
echo $IPCIDR
read -p "Enter the reasonable description:" DESC
echo $DESC
read -p "Enter the fromport number:" FROMPORT
echo $FROMPORT
read -p "Enter the toport number:" TOPORT
echo $TOPORT
read -p "Enter the region where you're security_group is existing:" REGION
echo $REGION
echo "******************** LETS PROCEED WITH AUTOMATION OF AWSCLI WITH BASH SCRIPT ************************"
aws ec2 authorize-security-group-ingress --group-id $SECGP --ip-permissions IpProtocol=tcp,FromPort=$FROMPORT,ToPort=$TOPORT,IpRanges="[{CidrIp=$IPCIDR,Description='$DESC'}]"
echo "Describing a security group:" $SECGP
aws ec2 describe-security-groups --group-ids $SECGP --region $REGION
echo -e "\e[1;31m ***** @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ ***** "
echo -e "\e[1;32m ***** @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ ***** "
echo -e "\e[1;33m ***** @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ ***** "
echo -e "\e[1;34m ***** @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ ***** "
echo -e "\e[1;35m ***** @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ ***** "
echo -e "\e[1;36m ***** @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ ***** "
echo -e "\e[1;37m ***** @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ ***** "
read -p "Are we good to proceed in revoking the SG rules:" ENTER
echo "You've entered value as:" $ENTER
echo "You've entered value as:" $ENTER
echo "Before proceeding with revoking access, there will be a small break ....."
sleep 5
echo "revoking security_group_rules in progress............"
aws ec2 revoke-security-group-ingress --group-id $SECGP --ip-permissions IpProtocol=tcp,FromPort=$FROMPORT,ToPort=$TOPORT,IpRanges="[{CidrIp=$IPCIDR,Description='$DESC'}]"
exit

