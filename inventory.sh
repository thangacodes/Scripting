#!/bin/bash
echo -e "\033[91m Getting system information in an inventory file"
Date=$(date '+%Y-%m-%d %H:%M:%S')
echo "The date is:" ${Date}
Uptime=$(uptime -p)
echo "The uptime of the server is:" ${Uptime}
IP_ADDRESS=$(hostname -i)
echo "Ip Address of the server is:" ${IP_ADDRESS}
OS_NAME=$(uname)
echo "Os version of the server is:" ${OS_NAME}

echo "S.No,Date,Uptime,IP_ADDRESS,OS_NAME" > inventory.csv
echo "1.$Date,$Uptime,$IP_ADDRESS,$OS_NAME" >> inventory.csv

