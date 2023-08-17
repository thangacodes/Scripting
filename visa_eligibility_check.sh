#!/bin/bash

COUNTRY="india"

read -p "Enter your living country please?:" USER_INPUT
echo -e "\033[91m Entered country is:" $USER_INPUT

if [[ $USER_INPUT == $COUNTRY ]];
then
  echo -e "\033[92m You're good to apply for VISA in:" $USER_INPUT
else
  echo -e "\033[93m You're not eligible to apply for VISA in $COUNTRY"
fi

