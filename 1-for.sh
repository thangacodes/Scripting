### Thi is the script to create bunch of users in same name

Example, i wanted to created similar users like nisuser1..20. Here nisuser is static name, only the numbers changing at the end of name. 
The numbers that what we are calling it as "Dynamic numbers".

######################## Script Starts here ######################

#!/bin/bash

for USER in {1..20}

do
         echo "adding user $USER"
         useradd niuser$USER
         echo "redhat123" | passwd --stdin niuser$USER
         sleep 2
done
