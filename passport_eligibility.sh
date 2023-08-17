#!/bin/bash

COUNTRY="india"
PASS="PASSPORT"

read -p "Please enter birth country?:" USER_INPUT

echo -e "\033[92m You are residing country is:" $USER_INPUT

if [[ $USER_INPUT == $COUNTRY ]];
then
  echo -e "\033[92m You're good to apply for $PASS in " $USER_INPUT
else
  echo -e "\033[91m You're not eligible to apply for $COUNTRY $PASS "
fi

