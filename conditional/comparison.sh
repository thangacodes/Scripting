#!/bin/bash
echo "Script execution time is:" $(date '+%Y.%m.%d %H:%M:%S')
NUM1=30
NUM2=5
echo "NUM1 value is:" ${NUM1}
echo "NUM2 value is:" ${NUM2}

# if condition starts now
if [ "$NUM1" -gt "$NUM2" ]
then
  echo "$NUM1 is greater than $NUM2"
else
  echo "$NUM1 is less than $NUM2"
fi
