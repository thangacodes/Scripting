#!/bin/sh

#set -x  # Enabling Debugging
read -p "Enter the URL that you wanted to test:" URL
echo $URL
echo $URL
echo "Script is to check client response code on $URL"

CURL=`curl --insecure -I $URL -o /dev/null -w '%{http_code}\n' -s`

echo "http client response code on node: $(hostname)": $CURL

if [ "$CURL" = 200 ]
then
     echo "health check looks good and hc status code is 200"
else
     echo "health check is failing and the status code is different"
fi
