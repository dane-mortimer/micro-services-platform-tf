variable "environment" {
  description = "Environment Name"
  type        = string

  validation {
    condition     = contains(["dev", "staging", "prod"], var.environment)
    error_message = "The environment must be one of 'dev', 'staging', or 'prod'."
  }
}

variable "application_name" {
  description = "Application Name"
  type        = string
}
