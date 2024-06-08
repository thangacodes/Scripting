#!/bin/bash

encrypt() {
    echo "Script executed at: $(date '+%Y-%m-%d %H:%M:%S')"

    read -p "Enter the word that you want to convert to encrypted format: " WORD

    echo "You entered: $WORD"
    echo "Converting the word \"$WORD\" to encrypted format..."

    ENCRYPTED_WORD=$(echo "$WORD" | base64)

    echo "Encrypted format value of \"$WORD\" is: $ENCRYPTED_WORD"
}

pause() {
    echo "Pausing the script for two seconds..."
    sleep 2
}

decrypt() {
    echo "Decrypting from encrypted value..."

    DECRYPTED_WORD=$(echo "$ENCRYPTED_WORD" | base64 -d)

    echo "The decrypted value of \"$ENCRYPTED_WORD\" is: $DECRYPTED_WORD"
}

# Function calls to execute the tasks
encrypt
pause
decrypt

