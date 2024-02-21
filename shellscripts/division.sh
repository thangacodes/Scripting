How to divide two numbers using shell script

#!/bin/bash
read -p "enter the first number: " ONE
echo $ONE
read -p "enter the second number: " SEC
echo $SEC
sleep 1
echo -e "\e[1;34m ****** Going to divide  both the numbers $ONE, $SEC entered by an users *******"
c=`expr $ONE / $SEC`
echo -e "\e[1;32m ******division of $c *******"
