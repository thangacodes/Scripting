### This is custom functions used in shell scripting

#!/bin/bash
sample() {
    read -p "enter your good name please: " NAME
    echo "Welcome to my site $NAME";
    echo "Todays date is $(date +%F)";
    echo "Number of users logged into the system is : $(who | wc -l)"
}
echo "This is to demonstrate calling a sample function"
sample; sleep 3
sample; sleep 3
sample; sleep 3

## Another method to use function in shell scripting

stat() {
    echo "LoadAverage on the system $(uptime | awk -F : '{print $NF}' | awk -F, '{print $1}')"
    echo "Number of logged in users $(who | wc -l)"
    echo "Bye"
}
stat
