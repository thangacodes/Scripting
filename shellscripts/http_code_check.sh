#!/bin/sh

#set -x  # Enabling Debugging
#read -p "Enter the URL that you wanted to test:" URL
URL='https://www.google.com/'
echo $URL
echo $URL
echo "Script is to check client response code on $URL"
sleep 5
CURL=`curl --insecure -I $URL -o /dev/null -w '%{http_code}\n' -s`
echo "http client response code on node: $(hostname)": $CURL
if [ "$CURL" = 200 ]
then
       echo -e "\e[1;31m ********** HEALTH CHECK LOOKS GOOD AND THE CLIENT HTTP STATUS CODE IS: 200 ***************"
       echo -e "\e[1;32m ********** HEALTH CHECK LOOKS GOOD AND THE CLIENT HTTP STATUS CODE IS: 200 ***************"
       echo -e "\e[1;33m ********** HEALTH CHECK LOOKS GOOD AND THE CLIENT HTTP STATUS CODE IS: 200 ***************"
       echo -e "\e[1;34m ********** HEALTH CHECK LOOKS GOOD AND THE CLIENT HTTP STATUS CODE IS: 200 ***************"
       echo -e "\e[1;35m ********** HEALTH CHECK LOOKS GOOD AND THE CLIENT HTTP STATUS CODE IS: 200 ***************"
       echo -e "\e[1;36m ********** HEALTH CHECK LOOKS GOOD AND THE CLIENT HTTP STATUS CODE IS: 200 ***************"
       echo -e "\e[1;37m ********** HEALTH CHECK LOOKS GOOD AND THE CLIENT HTTP STATUS CODE IS: 200 ***************"
else
       echo -e "\e[1;31m ********** HEALTH CHECK IS FAILING AND THE CLIENT HTTP STATUS CODE IS DIFFERENT **********"
fi
