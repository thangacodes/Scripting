## This script shows us to checking today's date and appending the information, whatever we provide in echo

#!bin/bash
echo "checking today's date"
echo $(date)
touch /home/ec2-user/shell-scr/output.txt
echo "hey there, how are you" > /home/ec2-user/shell-scr/output.txt
