#!/bin/bash
# remove comment if you want to enable debugging
#set -x

echo -e "\e[1;32m ***** Going to install Apache Tomcat9 on Remote Servers *****" $(date '+%Y-%m-%d %H:%M:%S')

cat <<"EOF"
 ___           _        _ _ _                               _
|_ _|_ __  ___| |_ __ _| | (_)_ __   __ _    __ _ _ __   __| |
 | || '_ \/ __| __/ _` | | | | '_ \ / _` |  / _` | '_ \ / _` |
 | || | | \__ \ || (_| | | | | | | | (_| | | (_| | | | | (_| |
|___|_| |_|___/\__\__,_|_|_|_|_| |_|\__, |  \__,_|_| |_|\__,_|
                                    |___/
                  __ _                  _
  ___ ___  _ __  / _(_) __ _ _   _ _ __(_)_ __   __ _
 / __/ _ \| '_ \| |_| |/ _` | | | | '__| | '_ \ / _` |
| (_| (_) | | | |  _| | (_| | |_| | |  | | | | | (_| |
 \___\___/|_| |_|_| |_|\__, |\__,_|_|  |_|_| |_|\__, |
                       |___/                    |___/
    _                     _            _____                         _    ___
   / \   _ __   __ _  ___| |__   ___  |_   _|__  _ __ ___   ___ __ _| |_ / _ \
  / _ \ | '_ \ / _` |/ __| '_ \ / _ \   | |/ _ \| '_ ` _ \ / __/ _` | __| (_) |
 / ___ \| |_) | (_| | (__| | | |  __/   | | (_) | | | | | | (_| (_| | |_ \__, |
/_/   \_\ .__/ \__,_|\___|_| |_|\___|   |_|\___/|_| |_| |_|\___\__,_|\__|  /_/
        |_|
EOF
cd /tmp/
yum update -y
yum install -y wget
yum install -y java
wget https://dlcdn.apache.org/tomcat/tomcat-10/v10.0.27/bin/apache-tomcat-10.0.27.tar.gz
wget https://github.com/AKSarav/SampleWebApp/raw/master/dist/SampleWebApp.war
ls -lart > files_in_temp.txt
tar -xf apache-tomcat-10.0.27.tar.gz
sleep 5
rm -rf apache-tomcat-10.0.27.tar.gz  #removing the tar.gz file, post downloads in /tmp directory
mkdir /opt/tomcat10  # Create a new directory under /opt
cd /opt/tomcat10/    # Change directory to the /tomcat10 
cp -R /tmp/apache-tomcat-10.0.27 .
cp -R /tmp/SampleWebApp.war /opt/tomcat10/apache-tomcat-10.0.27/webapps/
cd /opt/tomcat10/apache-tomcat-10.0.27/bin/
sh startup.sh  #Tomcat service starting
sleep 10
ls -l /opt/tomcat10/apache-tomcat-10.0.27/webapps/ > /tmp/webapps_files.txt
ls -l /opt/tomcat10/apache-tomcat-10.0.27/webapps/SampleWebApp/ > /tmp/SampleWebApp_files.txt
cat /opt/tomcat10/apache-tomcat-10.0.27/logs/catalina.out > /tmp/tomcat_log.txt
sleep 10
sh /opt/tomcat10/apache-tomcat-10.0.27/bin/shutdown.sh  #Tomcat service stopping
cd /opt/tomcat10/apache-tomcat-10.0.27/webapps/SampleWebApp/
rm -rf index.html
sleep 5
cat << 'END_HTML' >index.html
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Azure DevOps Introduction</title>
  </head>
<body>
   <h1 style="color: green; font-size: 30px;" align="left"><u> Azure DevOps:- </u></h2>
   <p>What is Azure DevOps? Plan smarter, collaborate better, and ship faster with a set of modern dev services.</p>
   <h3 style="color: blue; font-size: 20px;" align="left">Features of Azure DevOps:-</h3>
   <ol>
   <li>Source control </li>
   <li> Dashboards </li>
   <li> Continuous integration and deployment </li>
   <li> Manual and exploratory testing </li>
   <li> Collaboration services </li>
   <li> Service hooks </li>
   <li> Plan and track work </li>
   <li> Cloud-hosted services based on usage </li>
   </ol>
   <h3>Check out <a href="https://azure.microsoft.com/en-us/services/devops/#overview" target="_blank" rel="noopener noreferrer">Azure DevOps</a></h3>
   <h3>CICD <a href="https://devblogs.microsoft.com/devops/copy-files-over-ssh-during-continuous-integration-and-deployment/" target="_blank"> SSH over</a></h3>
   <button onclick="window.location.href='https://www.youtube.com/watch?v=Rzqaxi4xMvM';">Azure CICD Demonstration</button>
   <footer>
	<p style="color:red;">© Copyright Career Karma 2022</p>
</footer>
</body>
</html>
END_HTML
sleep 2
cat /opt/tomcat10/apache-tomcat-10.0.27/webapps/SampleWebApp/index.html >> /tmp/index.html
sh /opt/tomcat10/apache-tomcat-10.0.27/bin/startup.sh
sleep 10
cat /opt/tomcat10/apache-tomcat-10.0.27/logs/catalina.out >> /tmp/re_start_log.txt
echo -e "\e[1;32m ***** CURL COMMAND EXECUTION *****" $(date '+%Y-%m-%d %H:%M:%S')
sleep 10
curl localhost:8080/SampleWebApp/
curl localhost:8080/SampleWebApp/ >/tmp/curl_out.txt
sleep 20
exit
