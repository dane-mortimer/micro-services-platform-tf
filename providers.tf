terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0" # Use the latest stable version
    }
  }

  required_version = ">= 1.6.0" # Adjust based on your Terraform version
}

provider "aws" {
  region = "us-east-1" # Change to your preferred AWS region
}
