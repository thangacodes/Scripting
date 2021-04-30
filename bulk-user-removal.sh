#### This script is use to remove bulk users in linux systems in one go


#################### Script starts here ###############

#!/bin/bash

echo "removing bulk users using shell script"

for USER in $(cat rem-list.txt)

do
       echo "deleting users one by one $USER"
       userdel -r $USER
       sleep 1
done

### Note: Just need to keep in mind that whenever we delete bulk of users in linux, what we have to do is, keep all the user names in a text file and then call it
through variable.
