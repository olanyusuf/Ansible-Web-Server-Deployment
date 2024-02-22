#!/bin/bash

# Variables
KEY_NAME="master"
SECURITY_GROUP_ID="sg-**********"
INSTANCE_TYPE="t2.micro"
REGION="us-east-2"
SUBNET_ID="subnet-0********" # Your subnet ID

# Amazon Linux 2 AMI for Ohio region
AMI_ID_AMAZON_LINUX="ami-020db2c14939a8efb" # Ensure this is the latest AMI

# Ubuntu AMI for Ohio region
AMI_ID_UBUNTU="ami-0d5d9d301c853a04a" # Ensure this is the latest AMI

# Create Ansible Server (Amazon Linux)
echo "Creating Ansible Server (Amazon Linux)..."
aws ec2 run-instances \
    --image-id $AMI_ID_AMAZON_LINUX \
    --count 1 \
    --instance-type $INSTANCE_TYPE \
    --key-name $KEY_NAME \
    --security-group-ids $SECURITY_GROUP_ID \
    --subnet-id $SUBNET_ID \
    --tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value=Ansible-Server}]' \
    --region $REGION

# Create Worker Node 1 (Ubuntu)
echo "Creating Worker Node 1 (Ubuntu)..."
aws ec2 run-instances \
    --image-id $AMI_ID_UBUNTU \
    --count 1 \
    --instance-type $INSTANCE_TYPE \
    --key-name $KEY_NAME \
    --security-group-ids $SECURITY_GROUP_ID \
    --subnet-id $SUBNET_ID \
    --tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value=Ansible-Worker-12]' \
    --region $REGION

# Create Worker Node 2 (Ubuntu)
echo "Creating Worker Node 2 (Ubuntu)..."
aws ec2 run-instances \
    --image-id $AMI_ID_UBUNTU \
    --count 1 \
    --instance-type $INSTANCE_TYPE \
    --key-name $KEY_NAME \
    --security-group-ids $SECURITY_GROUP_ID \
    --subnet-id $SUBNET_ID \
    --tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value=Ansible-Worker-22}]' \
    --region $REGION

echo "Instances creation initiated..."
