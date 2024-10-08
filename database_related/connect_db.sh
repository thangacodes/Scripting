#!/bin/bash
echo "\e[1;32m Script executed on:" $(date '+%Y-%m-%d %H:%M:%S')

# Variables
src_db="apache1.ap-south-1.rds.amazonaws.com"
port="5432"
dest_db="apache2.ap-south-1.rds.amazonaws.com"
username="admin postgres"

# Function to connect to the source database
connect_src() {
    echo "\e[1;32m Connecting to the source database $src_db"
    psql -h $src_db -p $port -U $username
}

# Function to connect to the destination database
connect_dest() {
    echo "\e[1;32m Connecting to the destination database $dest_db"
    psql -h $dest_db -p $port -U $username
}

# Prompt user for input
echo "\e[1;32m Which database do you want to connect to? (src/dest)"
read -r db_choice

# Print the selected database choice
echo "\e[1;33m 'You have selected db choice as: $db_choice and the db endpoint to connect is': $dest_db "

# Use case statement to handle user input
case $db_choice in
    src)
        connect_src
        ;;
    dest)
        connect_dest
        ;;
    *)
        echo "\e[1;31m Invalid choice. Please choose 'src' or 'dest'."
        ;;
esac
