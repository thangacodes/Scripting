#!/bin/bash

get_date(){
	echo $(date '+%Y-%m-%d %H:%M:%S')
}

prRed(){
  echo -e "\033[91m$1..."
}

prGreen(){
  echo -e "\033[92m$1..."
}

if [ $USER != "root" ];
then
  prGreen echo "install git package"
  yum install -y git
else
  prRed echo "Please run the script from root user:"
  exit 1
