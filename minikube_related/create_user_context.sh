#!/bin/bash
echo "Creating a user for accessing Minikube cluster resources and objects..."
read -p "Please enter the user that you want to create: " USER
echo "You have entered the name of the user: $USER"

openssl genrsa -out "$USER.key" 2048
openssl req -new -key "$USER.key" -out "$USER.csr" -subj "/CN=$USER/O=$USERgroup"
openssl x509 -req -in "$USER.csr" -CA ~/.minikube/ca.crt -CAkey ~/.minikube/ca.key -CAcreateserial -out "$USER.crt" -days 100
kubectl config set-credentials "$USER" --client-certificate="$USER.crt" --client-key="$USER.key"
kubectl config set-context "$USER-context" --cluster=minikube --user="$USER"
#kubectl config view
kubectl config use-context "$USER-context"
kubectl config current-context
kubectl create namespace ns-test

echo "Switch to Minikube context..."
kubectl config use-context minikube
kubectlconfig current-context
kubectl config get-contexts 
exit 0
