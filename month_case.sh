#!/bin/sh
echo "Which month dates count you'd like to get:"
echo "1) January"
echo "2) February"
echo "3) March"
echo "4) April"
echo "5) May"
read -p "Please enter the number:" MONTH
echo "You've chosen option is:" $MONTH
case $MONTH in
  1) echo "January is 31 days.";;
  2) echo "February is 28 days.";;
  3) echo "March is 31 days.";;
  4) echo "April is 31 days.";;
  5) echo "May is 31 days.";;
  *) echo "This month is not available. Please choose a different one.";;
esac

