#!/bin/bash

echo "Installing mysql client on aws ec2 machine.."
sudo yum install -y https://dev.mysql.com/get/mysql57-community-release-el7-11.noarch.rpm
# Run the following line if you get a GPG error and then run the previous line again
sudo rpm --import https://repo.mysql.com/RPM-GPG-KEY-mysql-2022
sudo yum install -y mysql-community-client
sleep 3
echo "Connecting MySQL db instance via BASH SCRIPT.."
read -p "Enter the hostname of the MySQL DB_instance: " HOSTNAME
echo "you Entered hostname is: " ${HOSTNAME}
read -p "Enter the port number please: " PORTNO
echo "You Entered portnumber is: " ${PORTNO}
read -p "Enter the username please: " USER
echo "You Entered username is: " ${USER}
read -sp "Entered the password please: " PASS
sleep 2
echo "DB Connection begins now..."
mysql -h ${HOSTNAME} -P ${PORTNO} -u ${USER} -p ${PASS}
exit

