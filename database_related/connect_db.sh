#!/bin/bash
echo "The script was executed on: " $(date '+%Y-%m-%d %H:%M:%S')

# Variables
src_db="apache1.ap-south-1.rds.amazonaws.com"
port="5432"
dest_db="apache2.ap-south-1.rds.amazonaws.com"
root_username="admin postgres"
app_username="app apachedb"

# Function to connect to the source database
connect_src() {
        # Use nslookup to get the IP address of the database
        src_dbip=$(nslookup $src_db | awk '/^Address: / { print $2 }')
        echo
        echo "Connecting to the source database $src_db and it's IP address: $src_dbip"
        psql -h $src_db -p $port -U $username
}

# Function to connect to the destination database
connect_dest() {
        # Use nslookup to get the IP address of the database
        dest_dbip=$(nslookup $dest_db | awk '/^Address: / { print $2 }')
        echo
        echo "Connecting to the destination database $dest_db and it's IP address: $dest_dbip"
        psql -h $dest_db -p $port -U $username
}

# Prompt user for database choice
echo "Which database do you want to connect to? (src/dest)"
read -r db_choice

# Validate database choice
if [ "$db_choice" != "src" ] && [ "$db_choice" != "dest" ]; then
    echo -e "\e[1;31mInvalid choice. Please choose 'src' or 'dest'."
    exit 1
fi

# Prompt user for user type
echo "Which user do you want to login as? (root/app)"
read -r user_type

# Validate user type choice and set the username
if [ "$user_type" = "root" ]; then
    username=$root_username
elif [ "$user_type" = "app" ]; then
    username=$app_username
else
    echo -e "\e[1;31mInvalid choice. Please choose 'root' or 'app'."
    exit 1
fi

# Print the selected database and user
echo "You have selected the $db_choice database and will connect as $user_type user."

# Use case statement to handle database connection
case $db_choice in
    src)
        connect_src
        ;;
    dest)
        connect_dest
        ;;
    *)
        echo -e "\e[1;31mInvalid choice. Please choose 'src' or 'dest'."
        ;;
esac
