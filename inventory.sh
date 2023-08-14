#!/bin/bash
echo -e "\033[94m Getting system information"
DATE=$(date '+%Y-%m-%d %H:%M:%S')
echo "The date is:" ${DATE}
UPTIME=$(uptime -p)
echo "The uptime of the server is:" ${UPTIME}
HOSTNAME=$(hostname)
echo "The server hostname is:" ${HOSTNAME}
IP_ADDRESS=$(hostname -i)
echo "Ip Address of the server is:" ${IP_ADDRESS}
OS_NAME=$(uname)
echo "OS version of the server is:" ${OS_NAME}

echo "S.No,DATE,UPTIME,HOSTNAME,IP_ADDRESS,OS_NAME" > inventory.csv
echo "1.$DATE,$UPTIME,$HOSTNAME,$IP_ADDRESS,$OS_NAME" >> inventory.csv

