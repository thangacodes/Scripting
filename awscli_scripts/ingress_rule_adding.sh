#!/bin/bash

echo "######################################"

## Variables setting up

sgp="security_groupId"

### Color coding function setting up

get_date(){
   echo $(date '+%Y-%m-%d %H:%M:%S')
}

prRed(){
  echo -e "\033[91m$1..."
}
prGreen(){
  echo -e "\033[92m$1..."
}
prYellow(){
  echo -e "\033[93m$1..."
}
prPurple(){
  echo -e "\033[95m$1..."
}
prCyan(){
  echo -e "\033[96m$1..."
}

prRed
   echo "The script is executed at:" $(get_date)

read -p "Enter security group id please:" SECGP
prYellow
  echo "You've entered ${sgp} is:${SECGP}"
prPurple
  echo "Going to check how many fromport associated/configured in this ${sgp}: ${SECGP}"
  FROMPORT=$(aws ec2 describe-security-groups --group-ids ${SECGP} | grep "FromPort" | awk '{print $2}' | cut -d '"' -f2 | wc -l)
  echo "Total count of fromport is: ${FROMPORT}"
prCyan
  echo "Going to check how many toport associated/configured in this ${sgp}: ${SECGP}"
  TOPORT=$(aws ec2 describe-security-groups --group-ids ${SECGP} | grep "ToPort" | awk '{print $2}' | cut -d '"' -f2 | wc -l)
  echo "Total count of toport is: ${TOPORT}"
prGreen
  echo "Going to count two variables like fromport and toport:"
  TOTAL=`expr ${FROMPORT} + ${TOPORT}`
  echo "Total count of ingress rule port added is: ${TOTAL}"
sleep 3

if [[ $TOTAL -gt 55 ]];
then
   prCyan
   echo "Ingress port count is exceeded! Please try create a new ${sgp}"
elif
   [[ $TOTAL -lt 55 ]];
then
  prPurple
   echo "you are good to add ingress rule like specific port with IP on the ${sgp}"
   read -p "Enter new fport is :" fromport
   echo "You have entered new fport is :" $fromport
   read -p "enter the CidIp range:" CidrIp
   echo "entered new CidIp is:" $CidrIp
   echo "Begin the process of adding a specific ingress rule..."
aws ec2 authorize-security-group-ingress --group-id ${SECGP} --protocol tcp --port ${fromport} --cidr ${CidrIp}
aws ec2 describe-security-groups --group-ids ${SECGP} | grep "FromPort" | awk '{print $2}' | cut -d '"' -f2 | wc -l
else
   echo -e "Nothing, cant be done here..."
fi
