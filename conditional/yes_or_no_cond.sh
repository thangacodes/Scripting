#!/bin/bash
set -e

echo "Please choose an option:"
echo "1) Enter your name"
echo "2) Check disk free size"
echo "3) Do you get married or not?"
read -p "Enter your choice (1, 2, or 3): " choice

case $choice in
    1)
        read -p "Please enter your name: " name
        echo "Hello, $name!"
        ;;
    2)
        echo "Checking disk space in human-readable format..."
        df -h
        ;;
    3)
        read -p "Do you get married or not? (Please answer with YES or NO): " ANS
        ANS=$(echo "$ANS" | tr '[:lower:]' '[:upper:]')  # Convert input to uppercase
        if [[ "$ANS" == "YES" ]]; then
            echo "Your answer is 'YES', hence married."
        elif [[ "$ANS" == "NO" ]]; then
            echo "Your answer is 'NO', hence you didn't marry."
        else
            echo "Invalid input. Please answer with YES or NO."
        fi
        ;;
    *)
        echo "Invalid choice. Please enter 1, 2, or 3."
        exit 1
        ;;
esac
exit 0


