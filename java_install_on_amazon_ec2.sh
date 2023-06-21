#!/bin/sh
sudo amazon-linux-extras install -y java-openjdk11
java -version
sudo yum install -y java-1.8*
java -version
alternatives --config java
sudo systemctl start jenkins
sudo systemctl enable jenkins
sudo systemctl status jenkins
