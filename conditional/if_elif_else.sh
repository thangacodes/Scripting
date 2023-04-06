#!/bin/bash
echo "Script is executed time:" $(date '+%Y.%m.%d %H:%M:%S')
#Variables setting up
NAME="John"
#Print the variables
echo "My name is:" $NAME
echo "My name is:" ${NAME}
if [ "${NAME}" == "Thangadurai" ] 
then
  echo "Your name is Thangadurai"
elif [ "${NAME}" == "John" ]
then
  echo "Your name is John"
else 
  echo "Your name is Thangadurai or John"
fi
