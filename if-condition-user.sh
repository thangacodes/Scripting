#### This script is adding /removing user accounts in the systems, by pressing any numbers

##### Script starts here ##############

#!/bin/bash
echo "Enter 1 to add user"
echo "Enter 2 to delete user"
read -p "Enter the number:" NUMBER
if [ $NUMBER -eq 1 ]; then
    read -p "Enter the user name to add:" USER
    useradd $USER
    echo "user $USER is added"
elif [ $NUMBER -eq 2 ] ; then
      read -p "Enter the user name to delete:" USER
      userdel -r $USER
      echo "user  $USER is deleted"
else
     echo "Must enter number 1 or 2. If you entered other numbers that will not worked out"
fi

