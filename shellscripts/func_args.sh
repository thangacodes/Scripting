#!/bin/sh

echo "Going use function with arguments"

func(){
	echo "$1 is the first argument to func()"
	echo "$2 is the second argument to func()"
}

echo "$1 is the first argument to the script"
echo "$2 is the second argument to the script"

func yes 7

