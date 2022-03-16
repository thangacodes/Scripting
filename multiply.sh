# How to multiple two numbers in Shell Script

#!/bin/bash
read -p "enter the first number: " ONE
echo $ONE
read -p "enter the second number: " SEC
echo $SEC
sleep 1
echo -e "\e[1;33m ****** Going to multiply both the numbers $ONE, $SEC entered by an users *******"
c=`expr $ONE \* $SEC`
echo -e "\e[1;32m ****** Multiplication of $c *******"
