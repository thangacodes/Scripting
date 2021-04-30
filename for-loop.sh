#### Creating bunch of users using for loop in shell scripting.

################ The script starts here ####################

#!/bin/bash
for USER in john eric jane
do

        useradd $USER
        echo "redhat123" | password --stdin $USER
done
