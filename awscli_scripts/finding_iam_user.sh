#!/bin/bash
read -p "Enter username please:" IAM_USER
USER_CNT=aws iam list-users | grep -w "${IAM_USER}" | grep -v grep | wc -l

if [[ ${IAM_USER} == 0 ]];
then
   echo "${IAM_USER} is not a valid IAM User"
   echo "Please try again with Valid IAM User"
elif
   [[ ${IAM_USER} == 1 ]];
then
AVAIL=$(aws iam list-groups-for-user --user-name ${IAM_USER} | awk -F group/ '{print $2}'| awk '{print $1}')
echo "This USER ${IAM_USER} is exist in AWS :" 
fi
