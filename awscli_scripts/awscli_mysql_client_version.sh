#!/bin/bash

# Function to check if AWS CLI installation status
check_aws_cli() {
    if command -v aws >/dev/null 2>&1; then
        echo "AWS CLI is installed."
        # Optionally, check the version of awscli
        aws_version=$(aws --version)
        echo "AWSCLI Version is: $aws_version"
    else
        echo "AWS CLI is not installed."
        echo "Please install AWS CLI to proceed."
        exit 1
    fi
}
# Function to check if MySQL clinet installation status
check_mysql_client() {
    if command -v mysql >/dev/null 2>&1;
    then
       echo "mysql client is installed."
       # optionally, checking the version of mysql clinet
       mysql_client=$(mysql --version)
       echo "MySql version is: $mysql_client"
    else
        echo "Mysql client is not installed."
        echo "Please install Mysql client to connect MYSQL DB servers."
        exit 1
    fi
}

# Calling functions based on user accounts.
read -p "Do you want to check AWSCLI OR MySQL version? (awscli/mysql): " user_action

if [ "$user_action" == "awscli" ]; then
    check_aws_cli
elif [ "$user_action" == "mysql" ]; then
    check_mysql_client
else
    echo "Invalid option. Please try with the right option.."
    exit 1
fi

# Please note 
# command -v aws checks if the aws command is available.
# command -v mysql checks if the mysql command is available.
# >: This operator redirects standard output (stdout).
# /dev/null: This is a special file that discards all data written to it. When you redirect output to /dev/null, it effectively silences any output from the command.
# 2>&1:   ==> means below,

# 2: Refers to standard error (stderr).
# >&1: This means to redirect standard error to wherever standard output is currently going. 
# In this case, since stdout has already been redirected to /dev/null, stderr will also be redirected there.
