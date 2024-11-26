#!/bin/bash
echo "The script was executed on: $(date '+%Y-%m-%d %H:%M:%S')"

# Variables
src_db="apache1.ap-south-1.rds.amazonaws.com"
port="5432"
dest_db="apache2.ap-south-1.rds.amazonaws.com"
username="admin postgres"

# Function to connect to the source database
connect_src() {
        # Use nslookup to get the IP address of the database
        src_dbip=$(nslookup $src_db | awk '/^Address: / { print $2 }')
        echo
        echo "Connecting to the source database $src_db and it's IP address: $src_dbip"
    psql -h $src_db -p $port -U $username
}

# Function to connect to the destination databas
connect_dest() {
        # Use nslookup to get the IP address of the database
        dest_dbip=$(nslookup $dest_db | awk '/^Address: / { print $2 }')
        echo
    echo "Connecting to the destination database $dest_db and it's IP address: $dest_dbip"
    psql -h $dest_db -p $port -U $username
}

# Prompt user for input
echo "\e[1;32m Which database do you want to connect to? (src/dest)"
read -r db_choice

# Print the selected database choice and the corresponding endpoint
if [ "$db_choice" = "src" ]; then
    echo "You have selected the source database, and the endpoint to connect is: $src_db"
elif [ "$db_choice" = "dest" ]; then
    echo "You have selected the destination database, and the endpoint to connect is: $dest_db"
else
    echo "\e[1;31m Invalid choice. Please choose 'src' or 'dest'."
    exit 1
fi

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
