#!/bin/bash

echo -e "\e[1;32m ***** This script is executed at *****" $(date '+%Y-%m-%d %H:%M:%S')

read_inputs()
{
  read -p "Enter first num: "  num1
  read -p "Enter second num: " num2
}

addition()
{
  sum=$((num1+num2))
  echo "The addition of $num1 and $num2 is: $sum"
}

subtraction()
{
  sub=$((num1-num2))
  echo "The subtrac of $num1 and $num2 is: $sub"
}

read_inputs
addition
subtraction
