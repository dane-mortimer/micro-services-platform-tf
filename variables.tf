variable "env" {
  type = string
}

variable "application_name" {
  type = string
}

variable "vpc_cidr" {
  type = string
}

variable "execution_role_arn" {
  type = string
}

variable "services" {
  type = map(object({
    container_name  = string
    container_image = string
    container_port  = number
    lb_config = optional(object({
      path_pattern  = string
      priority      = number
      ingress_cidrs = list(string)
    }))
    dependent_services = list(object({
      dns  = string
      port = number
    }))
    cpu           = number
    memory        = number
    desired_count = number
    task_role_policy_statements = optional(list(object({
      effect    = string
      actions   = list(string)
      resources = list(string)
    })), [])
  }))
}

variable "tags" {
  type = map(string)
  default = {
    Environment = "dev"
    Project     = "MyProject"
  }
  description = "Common tags to be applied to all resources"
}