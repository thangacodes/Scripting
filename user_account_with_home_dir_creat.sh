#!/bin/bash

echo "The script executed on:" `(date '+%Y-%m-%d %H:%M:%S')`

echo -e "Going to create user account"

read -p "Please enter the username:" USER

echo -e "You've entered username as:" $USER

sudo useradd $USER -s /bin/bash -d /home/$USER

ls -l /home/

cat /etc/passwd | grep $USER

exit
