### How to swap two variables in shell script

########### Script starts here ####################

#!/bin/bash

read -p "Enter the first value:" FIRSTNO

read -p "Enter the second value:" SECONDNO

sleep 1 

echo "verifying the first value entered by us: $FIRSTNO"
echo "verifying the second value entered by us: $SECONDNO"

echo "BEFORE SWAPPING"
echo "first number value is: $FIRSTNO"
echo "second number value is: $SECONDNO"

temp=$FIRSTNO
FIRSTNO=$SECONDNO
SECONDNO=$temp

echo "AFTER SWAPPING"
echo "first number value is: $FIRSTNO"
echo "second number value is: $SECONDNO"

## Note: this script is used to swap variable
