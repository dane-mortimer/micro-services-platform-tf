variable "application_environment" {
  description = "Name of the ECS service"
  type        = string
}

variable "service_name" {
  description = "Name of the service"
  type        = string

}

variable "cluster_id" {
  description = "ID of the ECS Cluster"
  type        = string
}

variable "container_name" {
  description = "Name of the container"
  type        = string
}

variable "container_image" {
  description = "Docker image for the container"
  type        = string
}

variable "container_port" {
  description = "Port on which the container listens"
  type        = number
}

variable "cpu" {
  description = "CPU units for the task"
  type        = number
  default     = 256
}

variable "memory" {
  description = "Memory for the task"
  type        = number
  default     = 512
}

variable "desired_count" {
  description = "Number of tasks to run"
  type        = number
  default     = 1
}

variable "vpc_id" {
  description = "VPC ID where resources will be created"
  type        = string
}

variable "subnets" {
  description = "Subnets for the ECS service"
  type        = list(string)
}

variable "health_check_path" {
  description = "Health check path for the target group"
  type        = string
  default     = "/"
}

variable "task_role_policy_statements" {
  description = "List of IAM policy statements for the ECS task role"
  type = list(object({
    Effect   = string
    Action   = list(string)
    Resource = list(string)
  }))
  default = [
    {
      Effect   = "Allow"
      Action   = ["s3:GetObject"]
      Resource = ["arn:aws:s3:::example-bucket/*"]
    }
  ]
}

variable "load_balancer_security_group_id" {
  description = "Load balancer security group ID"
  type        = string
}

variable "loadbalancer_target_group_arn" {
  description = "Load balancer target group arn"
  type        = string
}

variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "eu-west-1"
}