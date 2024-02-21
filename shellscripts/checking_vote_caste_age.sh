#!/bin/bash

read -p "How old are you?:" AGE
echo -e "\033[92m You are $AGE years old...!"

if [[ $AGE -ge 18 ]];
then
  echo -e "\033[94m You are eligible to caste your vote. Since You are $AGE years old.Good to caste your vote!!"
else
  echo -e "\033[95m You are not eligible to caste your vote...!"
fi

