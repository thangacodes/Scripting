#!/bin/bash

read -p "Enter first name: " fname
echo "First Name is: " ${fname}
read -t 5 -p "Enter Last name: " lname
echo "Last name is: " ${lname}
read -s -p "Password: " password
echo "Your password is: " ${password}

if [[ ${password} == "login123" ]]
then
echo "You've entered the correct password"
elif [[ ${password} == "login456" ]]
then
echo "You've entered wrong password"
else
echo "Nothing is right..."
fi
