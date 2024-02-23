#!/bin/bash
whoareyou(){
echo "Script executed at: " $(date '+%Y-%m-%d::%M:%S')
echo "Script that you are running is:" $0
echo "Hello $1"
echo "How are you, $1"
echo "Your full name is: $* !"
echo "I am working as software engineer in $3"
echo "Working place is: $3"
}

whoareyou $1 $2    ##Calling function here

### when you execute this script, you should be using as arguments_fun.sh "john david" "harur"

