#!/bin/bash

echo "__________ Installing the basic required packages on LINUX machines_____________"

sudo yum install -y update
sudo yum install -y epel-release
sudo yum install -y vim
sudo yum install -y wget
sudo yum install -y curl
sudo yum install -y git
sudo yum install -y java
sudo yum install -y unzip

echo "___________ Installed packages successfully ___________"
