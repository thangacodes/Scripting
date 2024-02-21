#!/bin/bash
read -p "Please enter your name : " NAME
read -p "What is the purpose that you created Azure VM : " VM
sleep 3
echo "Your name is : $NAME and the reason behind creation of this vm is : $VM "
echo "Please wait for a couple of seconds, will show you the static web page status.."
echo " Getting for you....:):):):) "
STATUS=$(curl localhost)
echo "The static page content is below...."
echo $STATUS
echo $STATUS
echo $STATUS
sleep 2
exit
