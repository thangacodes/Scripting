# How to add two numbers using shell script

#!/bin/bash

read -p "enter the first number:  " FIRST
echo $FIRST

read -p "enter the second number: " SECOND
echo $SECOND

echo "adding $FIRST, $SECOND in a mnt"

c=`expr $FIRST + $SECOND`
echo $c
