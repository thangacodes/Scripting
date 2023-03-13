#!/bin/sh

function error(){
	blabla
	return 0
}

error

echo "The exit status of my error() function is: $?"
