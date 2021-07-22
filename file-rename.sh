### This script is use to rename a file, you would like to proceed.

# Note: you need to give the file path with the filename like below,

# /home/centos/index.html
# /home/centos/index.php

#!/bin/bash

read -p "Enter the original filename to rename:" original
read -p "Enter the renamed filename to rename:" rename
sleep 1

if [ -f $original ]; then
      $(mv $original $rename)
      echo "The file is renamed."
      ls -l /home/centos/
fi

#######  Another method to rename a file and show us, what has done during the execution 

#!/bin/bash
read -p "Enter the original filename to rename:" original
read -p "Enter the renamed filename to rename:" rename
sleep 1

if [ -f $original ]; then
      $(mv -i $original $rename)
      echo " The file is renamed as:" $rename 
      ls -l /home/centos/
      sleep 1
      echo "renaming file context showing"
      sleep 2
      cat $rename
fi
sleep 1
exit

### Note: read is a bash builtin command to read input from user. read command reads only a single line from bash shell. 
Following is the syntax of read command,

read <variable_name>
