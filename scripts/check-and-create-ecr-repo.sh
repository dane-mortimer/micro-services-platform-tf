#!/usr/bin/env bash

# Script: Check and Create ECR Repository

# Input parameters
SERVICE_NAME=$1
AWS_REGION=$2

# Validate input parameters
if [ -z "$SERVICE_NAME" ] || [ -z "$AWS_REGION" ]; then
  echo "Usage: $0 <service-name> <aws-region>"
  exit 1
fi

# Check if the repository exists
REPO_EXISTS=$(aws ecr describe-repositories --repository-names $SERVICE_NAME --region $AWS_REGION --query 'repositories[].repositoryName' --output text 2>/dev/null)

if [ -n "$REPO_EXISTS" ]; then
  # Repository exists
  echo "----------------------------------------"
  echo "ECR Repository already exists."
  echo "Repository Name: $REPO_EXISTS"
  echo "----------------------------------------"
  exit 1
else
  # Repository does not exist, create it
  echo "Creating ECR Repository: $SERVICE_NAME"
  aws ecr create-repository --repository-name $SERVICE_NAME --region $AWS_REGION > /dev/null

  # Verify repository creation
  CREATED_REPO=$(aws ecr describe-repositories --repository-names $SERVICE_NAME --region $AWS_REGION --query 'repositories[].repositoryName' --output text 2>/dev/null)

  if [ -n "$CREATED_REPO" ]; then
    echo "----------------------------------------"
    echo "ECR Repository created successfully."
    echo "Repository Name: $CREATED_REPO"
    echo "----------------------------------------"
  else
    echo "Failed to create ECR Repository: $SERVICE_NAME"
    exit 1
  fi
fi