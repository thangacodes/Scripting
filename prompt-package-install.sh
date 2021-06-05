### This shell script, will install the customer require package, based on their input.

#!/bin/bash

echo "____________________ Script Starts  __________________"

read -p "Enter the package, you'd like to install on the systems: " PACKAGE

sleep 1

echo "Verifying the package name entered by an user" $PACKAGE

sudo yum install -y $PACKAGE

nslookup google.com

sleep 5

nslookup linkedin.com

sudo yum list installed | grep $PACKAGE

sleep 5

echo "____________ Script Ends __________"
