variable "application_environment" {
  description = "Name of the application suffixed with the environment name"
  type        = string
}


variable "vpc_id" {
  description = "VPC ID where resources will be created"
  type        = string
}

variable "subnets" {
  description = "Subnets for the ECS service"
  type        = list(string)
}

variable "container_port" {
  description = "Port that the container runs on"
  type        = number
}

variable "assign_public_ip" {
  description = "Whether to assign a public IP to the ECS tasks"
  type        = bool
  default     = false
}

variable "health_check_path" {
  description = "Health check path for the target group"
  type        = string
  default     = "/"
}

variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}