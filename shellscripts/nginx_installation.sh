## NGINX Web Server installation on Ubuntu 20.04.6 LTS
#!/bin/bash
echo "The script executed at: $(date)"
echo "This is the script that use to install NGINX web server on Ubuntu Machine"
nginx_install='apt-get install nginx -y'
$nginx_install
nginx_start='systemctl start nginx'
$nginx_start
nginx_status='systemctl status nginx'
$nginx_status
echo "########## Going to sleep for 5 seconds to check the curl output ###########"
sleep 5
curl_output='curl localhost'
$curl_output
$curl_output
exit
