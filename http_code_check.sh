#!/bin/bash

read -p "Enter the http status code that you wanted to check:" COUT

echo $COUT
sleep 5
if [ "$COUT" = 200 ];
then
     echo -e "\e[1;33m HC is OK and HTTP_STATUS CODE IS 200"
else
     echo -e "\e[1;34m HC is not OK and HTTP_STATUS CODE also different"
fi
