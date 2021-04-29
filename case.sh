### This is alternative method for conditional statements like if, elif, else in shell scripting

############ SCRIPT STARTS ########################

#!/bin/bash

echo "enter the number 1 to add a user"
echo "enter the number 2 to remove a user"
echo "enter the number 3 to view the disk free status"
echo "enter the number 4 to view the passwd file information"
echo "enter the number 5 to update yum package"

read -p "please enter the number from 1 to 5 you would like to see:" NUMBER

case $NUMBER in
         1)
         read -p "Enter the user name to add :" USER
         useradd $USER;;
         2)
         echo "user is $USER deleted";;
         3)
         read -p "Enter the df command to check disk free:" DISK
         df -Th;;
         4) 
         read -p "Enter the passwd command to check the user information:" PASSWD
         cat /etc/passwd;;
         5)
         read -p "Enter the yum update commadn to update the package:" YUM
         yum update -y;;
         *)
         echo "Enter only the number starting from 1 to 5";;
esac 

## Note: You can number cases that you want to perform in linux
