#!/bin/bash
wget --version 1>/dev/null 2>&1
if [[ $? -eq 0 ]]
then
   echo "Already wget installed"
else
   yum install -y wget
fi
