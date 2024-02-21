#!/bin/sh
echo "Which color do you like best?"
echo "1) Blue"
echo "2) Red"
echo "3) Yellow"
echo "4) Green"
echo "5) Orange"
read -p "Please enter the number:" COLOR
echo "You've chosen option is:" $COLOR
case $COLOR in
  1) echo "Blue is a primary color.";;
  2) echo "Red is a primary color.";;
  3) echo "Yellow is a primary color.";;
  4) echo "Green is a secondary color.";;
  5) echo "Orange is a secondary color.";;
  *) echo "This color is not available. Please choose a different one.";;
esac

