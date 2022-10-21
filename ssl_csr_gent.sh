#!/bin/bash

# set -x

echo -e "\e[1;32m @@@@@@@@ CSR GENERATION SCRIPT @@@@@@@@@@@@ \e[0m"

echo -e "\e[1;33m @@@@@@ This script is executed at @@@@@@: " $(date '+%Y-%m-%d %H:%M:%S')

echo -e "\e[1;34m @@@@@@ OpenSSL package checking @@@@@@ "

sudo yum list installed | grep -i 'mod_ssl'

echo -e "\e[1;35m  @@@@@@ BASIC CHECKOUTS ARE DONE  @@@@@@ "

sleep 5

echo -e "\e[1;36m @@@@@@@@     BEGIN WITH CSR GENERATION     @@@@@@@@@@@ "

read -p " SHOULD YOU WANTED TO PROCEED? TYPE: YES OR NO:" ENTER

echo $ENTER

if [ "$ENTER" = yes ] ;
then
        echo -e "\e[1;32m @@@@@@  GOOD TO GO @@@@@@ "
else
        echo -e "\e[1:33m @@@@@@  SCRIPT EXITED.SINCE YOU'VE SELECTED AS NO @@@@@@ "

        exit
fi

sleep 4

openssl req -new -nodes -newkey rsa:2048 -subj "/CN=web01.dev.aws.example.com/C=IN/L=Bangalore/O=Example Softtech corp/OU=ITOPS/ST=Karnataka/emailAddress=TECH_OPS@example.com/subjectAltName=web01.dev.aws.example.com" -keyout web01.key -out web01.csr

openssl req -new -nodes -newkey rsa:2048 -subj "/CN=web02.dev.aws.example.com/C=IN/L=Bangalore/O=Example Softtech corp/OU=ITOPS/ST=Karnataka/emailAddress=TECH_OPS@example.com/subjectAltName=web02.dev.aws.example.com" -keyout web02.key -out web02.csr

openssl req -new -nodes -newkey rsa:2048 -subj "/CN=web03.dev.aws.example.com/C=IN/L=Bangalore/O=Example Softtech corp/OU=ITOPS/ST=Karnataka/emailAddress=TECH_OPS@example.com/subjectAltName=web03.dev.aws.example.com" -keyout web03.key -out web03.csr

openssl req -new -nodes -newkey rsa:2048 -subj "/CN=web04.dev.aws.example.com/C=IN/L=Bangalore/O=Example Softtech corp/OU=ITOPS/ST=Karnataka/emailAddress=TECH_OPS@example.com/subjectAltName=web04.dev.aws.example.com" -keyout web04.key -out web04.csr

openssl req -new -nodes -newkey rsa:2048 -subj "/CN=web05.dev.aws.example.com/C=IN/L=Bangalore/O=Example Softtech corp/OU=ITOPS/ST=Karnataka/emailAddress=TECH_OPS@example.com/subjectAltName=web05.dev.aws.example.com" -keyout web05.key -out web05.csr

ls -l | cut -d " " -f17 | grep csr > csr.txt

sleep 3

for i in $(cat csr.txt);
do
        echo -e "\e[1;34m @@@@@@@ Checking the generated csr files are VALID or NOT @@@@@@@ : $i"
        sleep 3
        openssl req -text -noout -verify -in $i | grep -i 'status'
done

echo -e "\e[1;35 @@@@@@  VERIFIED ALL CSR FILES.STATUS showing as OK @@@@@@ "

exit
