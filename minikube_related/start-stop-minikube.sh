#!/bin/bash
set -e  # Exit immediately if a command exits with a non-zero status

#Hardcoding some variables
local_cluster_name="tdcluster"
default_driver="docker"

echo "Script executed on: $(date '+%Y-%m-%d %H:%M:%S')"

create_minikube_with_2_workernodes_cluster() {
    echo "Starting Minikube cluster with 2 worker nodes..."
    minikube start --nodes 2 -p $local_cluster_name --driver=$default_driver
    echo "Checking minikube cluster status and worker node status as well.."
    minikube status -p $local_cluster_name
}

delete_minikube_with_2_workernodes_cluster() {
    if minikube status -p $local_cluster_name | grep -q "Running"; then
        echo "Stopping Minikube cluster..."
        minikube stop -p $local_cluster_name
        echo "Deleting Minikube cluster..."
        minikube delete -p $local_cluster_name
    else
        echo "Minikube cluster '$local_cluster_name' is not running."
    fi
}
minikube_status_check() {
    echo "Checking minikube status..."
    minikube status -p $local_cluster_name
    kubectl get nodes
}
add_worker_nodes() {
    echo "adding worker nodes as per user input..."
    minikube node add --worker $local_cluster_name
    kubectl get nodes
    minikube status -p $local_cluster_name
}
delete_worker_nodes() {
    echo "deleting worker nodes as per user input..."
    kubectl get nodes
    read -p "enter the worker node that you wanted to delete off it: " userfeed
    minikube node delete $userfeed -p $local_cluster_name
    kubectl get nodes
    minikube status -p $local_cluster_name
}

echo "What would you like to do?"
echo "1. Create Minikube cluster"
echo "2. Delete Minikube cluster"
echo "3. Minikube Status Check"
echo "4. Add worker_nodes"
echo "5. Delete worker_nodes"
read -p "Please enter your choice (1 or 2 or 3 or 4 or 5): " choice

case $choice in
    1)
        create_minikube_with_2_workernodes_cluster
        ;;
    2)
        delete_minikube_with_2_workernodes_cluster
        ;;
    3) 
        minikube_status_check
        ;;
    4) 
        add_worker_nodes
        ;;
    5) 
        delete_worker_nodes
        ;;
    *)
        echo "Invalid choice. Please enter (1 or 2 or 3 or 4 or 5): " choice
        exit 1
        ;;
esac
