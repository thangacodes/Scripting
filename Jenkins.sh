# How to install Jenkins on CentOS 7 using shell script


#!/bin/bash
echo "This script is executed at" $(date '+%Y-%m-%d %H:%M:%S')
sudo yum install epel-release -y
sudo yum install java -y
sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo --no-check-certificate
sudo rpm --import http://pkg.jenkins.io/redhat-stable/jenkins.io.key
sudo yum install jenkins -y
sudo vi /etc/sysconfig/jenkins
sleep 2
echo "Going to change the custom port number in jenkins file"
sudo sed -i 's/8080/8090/g' /etc/sysconfig/jenkins
sudo cat /etc/sysconfig/jenkins | grep '80'
sleep 2
sudo systemctl status jenkins
sudo systemctl enable jenkins
sudo systemctl start jenkins

