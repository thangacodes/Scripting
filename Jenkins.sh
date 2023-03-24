#!/bin/bash
echo -e "\e[1;32m ***** This script is executed at *****" $(date '+%Y-%m-%d %H:%M:%S')
echo -e "\e[1;34m ***** This script is executed at *****" $(date '+%Y.%m.%d %H:%M:%S')
echo -e "\e[1;33m ***** Checking Java Version, before jenkins installation proceedings *****"
JAVA='java -version'
STATUS='sudo systemctl status jenkins'
SYMLINK='sudo systemctl enable jenkins'
START='sudo systemctl start jenkins'
echo $JAVA
echo $STATUS
echo $SYMLINK
echo $START
$JAVA
sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo --no-check-certificate
sudo rpm --import http://pkg.jenkins.io/redhat-stable/jenkins.io.key
sleep 3
INSTALL='sudo yum install jenkins -y'
echo $INSTALL
echo -e "\e[1;34m ***** Jenkins installation begins *****"
$INSTALL
sleep 5
echo -e "\e[1;35m ***** Proceedings on jenkins status,symlink,start ***********"
$STATUS
$SYMLINK
$START
