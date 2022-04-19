# How to add two numbers using shell script

#!/bin/bash
echo "This script is executed at" $(date '+%Y-%m-%d %H:%M:%S')
read -p "enter the first number: " ONE
echo $ONE
read -p "enter the second number: " SEC
echo $SEC
sleep 1
echo -e "\e[1;32m ****** Going to add both the numbers $ONE, $SEC entered by an users *******"
c=`expr $ONE + $SEC`
echo -e "\e[1;32m ******addition of two number is $c *******"

