#!/bin/bash

read -p "What is you Age?:" age
echo -e "\033[92m Your age is: "$age
if [[ $age -ge 18 ]];
then
  echo -e "\033[94m You are eligible to vote.You are $age years old.Good to caste your vote!!"
else
  echo -e "\033[95m You are not eligible to vote...!"
fi

