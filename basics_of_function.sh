### Functions:
### Using functions to perform repetitive tasks is an excellent way to create code reuse. This is an important part of modern object-oriented programming principles.

## Examples:
[centos@ip-172-31-36-220 ss]$ u () { echo $(uname); }
[centos@ip-172-31-36-220 ss]$ u
Linux
[centos@ip-172-31-36-220 ss]$ f () { echo $(date +%x); }
[centos@ip-172-31-36-220 ss]$ f
07/22/2021
[centos@ip-172-31-36-220 ss]$ d () { echo $(date +%F); }
[centos@ip-172-31-36-220 ss]$ d
2021-07-22

######### OTHER METHOD TO WRITE UP FUNCTION IN SHELL SCRIPT

#!/bin/bash
sample() {
    read -p "enter your good name please: " NAME
    echo "Welcome to my site $NAME";
    echo "Todays date is $(date +%F)";
    echo "Number of users logged into the system is : $(who | wc -l)"
}
echo "This is to demonstrate calling a sample function"
sample


## Note: Here we are defining 'f' 'd' 'u' and 'sample' are the function names. This is custom functions, you may keep the names as per your convinient
