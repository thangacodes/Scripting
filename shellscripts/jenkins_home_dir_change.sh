#!/bin/bash
sudo systemctl stop jenkins.service
sudo mkdir /home/jenkins_home
sudo chown jenkins:jenkins /home/jenkins_home
sudo cp -rpv /var/lib/jenkins /home/jenkins_home
sudo usermod -d /home/jenkins_home
sudo vi /etc/default jenkins
JENKINS_HOME=/home/jenkins_home
sudo systemctl start jenkins.service
