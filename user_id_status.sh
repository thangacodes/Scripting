#!/bin/bash

echo "Finding out which user has logged into the system"

id

sleep 5

if [ $UID -eq 0 ];
then
        echo "you are a root user"
else
        echo "You are not a root user"
fi
