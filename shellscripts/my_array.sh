#!/bin/bash

myarray=( 1 2 Hello "Hey man")

echo "Value in 1st index is:" ${myarray[0]}
echo "Value in 2nd index is:" ${myarray[1]}
echo "Value in 3rd index is:" ${myarray[2]}
echo "Value in 4th index is:" ${myarray[3]}

echo "Total value in an array is:" ${myarray[*]}

echo "Length of the array value is: ${#myarray[*]}"

# How to get index values of 2-3 in an array.

echo "Index value finding for array 2-3:" ${myarray[*]:2:3}
