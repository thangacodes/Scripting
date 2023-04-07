#!/bin/bash
echo "Script is executed time:" $(date '+%Y.%m.%d %H:%M:%S')
echo "This script is to renaming the file name as per our needs"
FILES=$(ls *.txt)
NEW="demo"
for FILE in $FILES
do
  echo "Renaming $FILE to demo-$FILE"
  mv $FILE $NEW-$FILE
done
