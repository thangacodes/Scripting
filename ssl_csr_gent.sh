#!/bin/bash

# set -x     //Debug - It depends if you want to enable remove '#'

echo -e "\e[1;32m @@@@@@@@ CSR GENERATION SCRIPT @@@@@@@@@@@@ "

echo -e "\e[1;33m @@@@@@ This script is executed at @@@@@@: " $(date '+%Y-%m-%d %H:%M:%S')

echo -e "\e[1;34m @@@@@@ OpenSSL package checking @@@@@@ "

sudo yum list installed | grep -i 'mod_ssl'

echo -e "\e[1;35m  @@@@@@ BASIC CHECKOUTS ARE DONE  @@@@@@ "

echo -e "\e[1;36m @@@@@@@@     BEGIN WITH CSR GENERATION     @@@@@@@@@@@ "

read -p " SHOULD YOU WANTED TO PROCEED? TYPE: YES OR NO:" ENTER

echo $ENTER

if [ "$ENTER" = yes ] ;
then
        echo -e "\e[1;32m @@@@@@  GOOD TO GO @@@@@@ "
else
        echo -e "\e[1:33m @@@@@@  SCRIPT EXITED.SINCE YOU'VE SELECTED NO or ANYTHING @@@@@@ "

        exit
fi

sleep 4

read -p "ENTER THE HOSTNAME(FQDN) THAT YOU WANT TO HAVE AN INTERNAL CSR TO BE GENERATED:" HOST1

openssl req -new -nodes -newkey rsa:2048 -subj "/CN=$HOST1/C=IN/L=Bangalore/O=Example Softtech corp/OU=ITOPS/ST=Karnataka/emailAddress=TECH_OPS@example.com/subjectAltName=$HOST1" -keyout $HOST1.key -out $HOST1.csr

read -p "ENTER THE HOSTNAME(FQDN) THAT YOU WANT TO HAVE AN INTERNAL CSR TO BE GENERATED:" HOST2


openssl req -new -nodes -newkey rsa:2048 -subj "/CN=$HOST2/C=IN/L=Bangalore/O=Example Softtech corp/OU=ITOPS/ST=Karnataka/emailAddress=TECH_OPS@example.com/subjectAltName=$HOST2" -keyout $HOST2.key -out $HOST2.csr

read -p "ENTER THE HOSTNAME(FQDN) THAT YOU WANT TO HAVE AN INTERNAL CSR TO BE GENERATED:" HOST3


openssl req -new -nodes -newkey rsa:2048 -subj "/CN=$HOST3/C=IN/L=Bangalore/O=Example Softtech corp/OU=ITOPS/ST=Karnataka/emailAddress=TECH_OPS@example.com/subjectAltName=$HOST3" -keyout $HOST3.key -out $HOST3.csr


read -p "ENTER THE HOSTNAME(FQDN) THAT YOU WANT TO HAVE AN INTERNAL CSR TO BE GENERATED:" HOST4


openssl req -new -nodes -newkey rsa:2048 -subj "/CN=$HOST4/C=IN/L=Bangalore/O=Example Softtech corp/OU=ITOPS/ST=Karnataka/emailAddress=TECH_OPS@example.com/subjectAltName=$HOST4" -keyout $HOST4.key -out $HOST4.csr


read -p "ENTER THE HOSTNAME(FQDN) THAT YOU WANT TO HAVE AN INTERNAL CSR TO BE GENERATED:" HOST5

openssl req -new -nodes -newkey rsa:2048 -subj "/CN=$HOST5/C=IN/L=Bangalore/O=Example Softtech corp/OU=ITOPS/ST=Karnataka/emailAddress=TECH_OPS@example.com/subjectAltName=$HOST5" -keyout $HOST5.key -out $HOST5.csr




ls -l | cut -d " " -f17 | grep csr > csr.txt

sleep 3

for i in $(cat csr.txt);
do
        echo -e "\e[1;34m @@@@@@@ Checking the generated csr files are VALID or NOT @@@@@@@ : $i"
        sleep 2
        openssl req -text -noout -verify -in $i | grep -i 'status'
done

echo "Making a zip file with password protected for .csr files"

read -p "Enter the name that you'd like to provide for a zip file:" NAME

zip -re $NAME.zip *.csr

echo "Checking the zip file is done or not"

ls -lrth

sleep 5

echo -e "\e[1;35m VERIFIED ALL CSR FILE STATUS OK. Hence, send out en email to securityops@example.com !!"

exit
