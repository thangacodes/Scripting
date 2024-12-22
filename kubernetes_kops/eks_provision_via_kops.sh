#!/bin/bash
# Print the timestamp when the script is executed
echo "The script was executed at: $(date '+%d-%m-%Y %H:%M:%S')"

# Pre-requisites Check
echo "Checking pre-requisites..."

# Define required variables - Update these according to your specific needs
export NAME="try-devops.xyz"
export KOPS_STATE_STORE="s3://$NAME"
export AWS_REGION="ap-south-1"
export CLUSTER_NAME="try-devops"
export DNS_ZONE="$NAME"
export EDITOR="/usr/bin/vim"
export AVAILABLE_ZONES="ap-south-1a,ap-south-1b"
export NODE_EKS_SIZE="t3.medium"

# Inform user to update AWS CLI with necessary IAM roles and other prerequisites
echo "Ensure that the following prerequisites are completed before running the script:"
echo "1. DNS Name: $DNS_ZONE"
echo "2. S3 Bucket: $KOPS_STATE_STORE"
echo "3. IAM Role assigned to EC2 instance as instance profile (make sure EC2 can access Kops and S3)"
echo "4. Ensure that SSH key for EC2 is generated and stored at ~/.ssh/id_ed25519.pub"

# Step 1: Download Kubectl and Kops and set them up in /usr/local/bin
echo "Downloading Kops and Kubectl to /usr/local/bin and setting permissions..."

# Check if kubectl is already installed, if not, install it
if ! command -v kubectl &>/dev/null; then
    curl -LO https://storage.googleapis.com/kubernetes-release/release/v1.27.3/bin/linux/amd64/kubectl
    chmod +x kubectl
    sudo mv kubectl /usr/local/bin/
    echo "kubectl installed successfully!"
else
    echo "kubectl is already installed!"
fi

# Check if kops is already installed, if not, install it
if ! command -v kops &>/dev/null; then
    curl -LO https://github.com/kubernetes/kops/releases/download/v1.27.3/kops-linux-amd64
    chmod +x kops-linux-amd64
    sudo mv kops-linux-amd64 /usr/local/bin/kops
    echo "kops installed successfully!"
else
    echo "kops is already installed!"
fi

# Step 2: Edit .bashrc to add environment variables for AWS and Kops
echo "Setting up environment variables for Kops and AWS in ~/.bashrc..."

if ! grep -q "export NAME" ~/.bashrc; then
    echo "export NAME=\"$NAME\"" >> ~/.bashrc
    echo "export KOPS_STATE_STORE=\"$KOPS_STATE_STORE\"" >> ~/.bashrc
    echo "export AWS_REGION=\"$AWS_REGION\"" >> ~/.bashrc
    echo "export CLUSTER_NAME=\"$CLUSTER_NAME\"" >> ~/.bashrc
    echo "export DNS_ZONE=\"$DNS_ZONE\"" >> ~/.bashrc
    echo "export EDITOR=\"$EDITOR\"" >> ~/.bashrc
fi

# Source the .bashrc file to apply the environment variables
source ~/.bashrc
echo "Environment variables added to .bashrc and sourced successfully."

# Step 3: Verify AWS CLI setup and IAM roles
echo "Checking AWS CLI configuration..."

if ! aws sts get-caller-identity &>/dev/null; then
    echo "AWS CLI is not configured correctly. Please configure AWS CLI using 'aws configure'."
    exit 1
else
    echo "AWS CLI is configured."
fi

# Step 4: Create a Kubernetes cluster using Kops (dry-run)
echo "Creating a Kubernetes cluster using Kops..."

# Fix for incorrect usage of ZONES in kops create cluster:
kops create cluster --name=${CLUSTER_NAME} \
--state=${KOPS_STATE_STORE} \
--zones=${AVAILABLE_ZONES} \
--node-count=2 \
--control-plane-count=1 \
--node-size=${NODE_EKS_SIZE} \
--control-plane-size=${NODE_EKS_SIZE} \
--control-plane-zones=${AVAILABLE_ZONES%%,*} \
--control-plane-volume-size=10 \
--node-volume-size=10 \
--ssh-public-key=~/.ssh/id_ed25519.pub \
--dns-zone=${DNS_ZONE} \
--dry-run \
--output yaml

# Provide feedback and next steps
echo "Dry-run of cluster creation completed successfully. The configuration has been printed above."
echo "If the dry-run is successful, you can apply the configuration with the following command:"
echo "kops create cluster --name=${CLUSTER_NAME} --state=${KOPS_STATE_STORE} --zones=${AVAILABLE_ZONES} --node-count=2 --control-plane-count=1 --node-size=${NODE_EKS_SIZE} --control-plane-size=${NODE_EKS_SIZE}--control-plane-zones=${AVAILABLE_ZONES%%,*} --control-plane-volume-size=10 --node-volume-size=10 --ssh-public-key=~/.ssh/id_ed25519.pub --dns-zone=${DNS_ZONE}"

# Optional: You can add an additional step here to confirm the cluster creation
# kops update cluster --name=${CLUSTER_NAME} --yes
