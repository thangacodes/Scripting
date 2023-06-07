#!/bin/sh
read -p "Enter the user that you want to be added in the system: " USER
echo "Entered the user name is: " $USER
echo "Entered the user name is: " $USER
echo "**** BREAK ****"
sleep 3
useradd $USER
echo "Checking the creataed user account is exist or not: "
cat /etc/passwd | grep $USER
echo "**** Password setting up for the user: " $USER
passwd $USER
echo "Deleting the latest user that we created: " $USER
cat /etc/passwd | grep $USER
userdel --remove $USER # Deleting the user along with their home directory.
echo "Cross checking the user account once again if exist or not: "
cat /etc/passwd
exit
