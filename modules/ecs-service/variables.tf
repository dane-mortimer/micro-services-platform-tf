variable "env" {
  type = string
}

variable "service_name" {
  type = string
}

variable "ecs_cluster_id" {
  type = string
}

variable "desired_count" {
  type = number
}

variable "subnets" {
  type = list(string)
}

variable "container_name" {
  type = string
}

variable "container_image" {
  type = string
}

variable "container_port" {
  type = number
}

variable "cpu" {
  type = number
}

variable "memory" {
  type = number
}

variable "execution_role_arn" {
  type = string
}

variable "lb_config" {
  type = object({
    subnets       = list(string)
    path_pattern  = string
    ingress_cidrs = list(string)
    priority      = number
  })
  default = null
}

variable "dependent_services" {
  type = list(object({
    dns  = string
    port = number
  }))
  default = []
}

variable "vpc_id" {
  type = string
}

variable "service_connect_namespace_arn" {
  type = string
}

variable "task_role_policy_statements" {
  type = list(object({
    effect    = string
    actions   = list(string)
    resources = list(string)
  }))
  default = []
}

variable "tags" {
  description = "Common tags to apply to all resources"
  type        = map(string)
  default     = {} 
}