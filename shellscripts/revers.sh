#!/bin/bash
echo "Shell Script to get an input from user to reverse the value"
read -p "Enter the string value": VALUE
echo $VALUE
sleep 2
echo $VALUE | rev
exit
