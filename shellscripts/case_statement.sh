#!/bin/bash

# Prompt the user to enter their mother tongue in CAPITAL letters
read -p "Enter your mother tongue in CAPITAL letters please: " mot

echo "User Entered input on his/her mother tongue is: " $mot

# Use a case statement to check the value of $mot
case $mot in
    TAMIL) 
        echo "You are a Tamilian, since you entered mother tongue as: $mot"
        ;;
    KANNADA)
        echo "You are a Kannadiga, since you entered mother tongue as: $mot"
        ;;
    TELUGU)
        echo "You are a Telugu person, since you entered mother tongue as: $mot"
        ;;
    *)
        echo "You are above a southern part, By default [OR] known by them language is: $mot"
        ;;
esac
