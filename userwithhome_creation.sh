#!/bin/bash

echo -e "\e[1;32m ***** This script is executed at *****" $(date '+%Y-%m-%d %H:%M:%S')

for u in user{1..5} ; do sudo useradd $u; echo "Password1" | sudo passwd --stdin $u ; done

sleep 6

echo "**** Going to show us the list of home directories exist on the system *******"

ls -la /home/

sleep 2

echo "**** Going to delete the user accounts along with their home directory as well ****"


for u in user{1..5} ; do sudo userdel --remove $u; done

ls -al /home/

exit

