### This is shows us, how to check and use file operators

Filetest operators:-

#!/bin/bash
read -p "Enter the file name:" FILENAME
if [ -e $FILENAME ]; then
   echo "$FILENAME is available"
else
    echo "$FILENAME is not available"
fi
