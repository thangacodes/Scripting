#!/bin/sh

echo "***** Checking the given variable is even or odd ******"

iseven(){
	if [ $(( $1 % 2 )) -eq 0 ]; then
		echo "$1 is even number."
	else
		echo "$1 is odd number."
	fi
}

iseven 1
iseven 2
iseven 3
iseven 4
iseven 5
iseven 7
iseven 8
