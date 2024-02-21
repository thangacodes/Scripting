## This script shows us, how to create a user in linux. It will let us know, if the account is exists in the system,

########## Script starts here ##############

#!/bin/bash
echo "CREATING USER ACCOUNTS IN LINUX BOX"
read -p "Enter the username that you want to create in the systems :: " name
read -s -p "Enter the password: " pass
sleep 1  # just sleep for a second
echo "checking user account information in passwd file"
grep $name /etc/passwd
echo "Double verifying the username $name is exist or not"
id -u $name
if [ $? == 0 ]; then
   echo "account name $name is exists. Please try with another user"
elif [ $? == 1 ]; then
   useradd $name
   echo $pass | passwd --stdin $name
else
    echo "you have not entered the username"
fi
