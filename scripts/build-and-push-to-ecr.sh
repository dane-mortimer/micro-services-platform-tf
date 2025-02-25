#!/usr/local/bin bash

# Script 2: Build, Tag, and Push Docker Image to ECR

# Input parameters
SERVICE_NAME=$1
AWS_REGION=$2
DOCKERFILE_DIR=$3

# Validate input parameters
if [ -z "$SERVICE_NAME" ] || [ -z "$AWS_REGION" ] || [ -z "$DOCKERFILE_DIR" ]; then
  echo "Usage: $0 <repository-name> <aws-region> <dockerfile-directory>"
  exit 1
fi

# Get the AWS account ID
AWS_ACCOUNT_ID=$(aws sts get-caller-identity --query "Account" --output text)

# Define the ECR repository URI
ECR_REPOSITORY_URI="$AWS_ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com/$SERVICE_NAME"

# Authenticate Docker to the ECR registry
aws ecr get-login-password --region $AWS_REGION | docker login --username AWS --password-stdin $ECR_REPOSITORY_URI

# Build the Docker image
echo "Building Docker image from directory: $DOCKERFILE_DIR"
docker build -t $SERVICE_NAME $DOCKERFILE_DIR

# Tag the Docker image
echo "Tagging Docker image: $SERVICE_NAME"
docker tag $SERVICE_NAME:latest $ECR_REPOSITORY_URI:latest

# Push the Docker image to ECR
echo "Pushing Docker image to ECR: $ECR_REPOSITORY_URI"
docker push $ECR_REPOSITORY_URI:latest

echo "Docker image successfully pushed to ECR: $ECR_REPOSITORY_URI"