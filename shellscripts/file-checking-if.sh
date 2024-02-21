## How to find out a file using if conditional statements.

########### Script starts here ################

#!/bin/bash
read -p "Enter the file name:" FILENAME
if [ -e $FILENAME ]; then
   echo "$FILENAME is available"
else
    echo "$FILENAME is not available"
fi
