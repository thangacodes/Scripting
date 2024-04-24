#!/bin/bash

file_name="data.txt"
file_path="/tmp"
echo "the file name is :" $file_name
echo "the file_path is :" $file_path

for file in $file_name
do
  if [ -e $file ]
  then
    sed -i 's/GCP/AWS/g' $file
fi
done

sleep 2

echo "Going to grep the file:" $file_name

grep -i 'aws' $file_name

exit

