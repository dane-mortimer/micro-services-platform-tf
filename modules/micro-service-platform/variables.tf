variable "env" {
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
      ingress_cidrs = list(string)
      path_pattern  = string
      priority      = number
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
    max_capacity          = optional(number)
    min_capacity          = optional(number)
    cpu_target_value      = optional(number)
    memory_target_value   = optional(number)
    environment_variables = optional(list(object({ 
      name = string, 
      value = string 
    })))
  }))
}

variable "tags" {
  description = "Common tags to apply to all resources"
  type        = map(string)
  default     = {} 
}