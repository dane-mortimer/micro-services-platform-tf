variable "env" {
  type = string
}

variable "vpc_id" {
  type = string
}

variable "tags" {
  description = "Common tags to apply to all resources"
  type        = map(string)
  default     = {} 
}