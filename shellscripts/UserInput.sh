#!/bin/sh

# read pauses the console and allows a user to input some string text.
# read <var> read in chars untill enter/carriage reutn.
# read -s <var> silently read in chars until enter/carriage return.
# read -t <sec> <var> will read in chars but with a timeout
# read -n <nchars> <var> will read in chars until you get to specific amount of chars specified
# read -d <delim> <var> change key in order to accept user input.

read -p "Enter the variable1 value:" VAR1
read -p "Enter the variable2 value:" VAR2

if [ "$VAR1" ];
then
	echo "Thanks for supplying a input"
else
	echo "No input was detected"
fi

if [ "$VAR2" ];
then
	echo "$VAR2"
fi

