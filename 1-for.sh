### Thi is the script to create bunch of users in same name

Example, i wanted to created nisuser1....to nisuser20. Here nisuser is static name, only the numbers changing at the end of name. The numbers what we are calling it as "Dynamic numbers"

######################## Script Starts here ######################

#!/bin/bash
for USER in {1..20}
do
      useradd nisuser $USER
      echo "redhat123" | passwd --stdin nisuser$USER
done
