#!/bin/bash

# Simple Linux Shell script function

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
