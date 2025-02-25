
locals {
  env = replace(lower("${var.application_name}-${var.env}"), "/[^a-z0-9-]/", "-")
}

module "micro-service-platform" {
  source                = "./modules/micro-service-platform"
  
  env                   = local.env
  
  vpc_cidr              = var.vpc_cidr
  services              = var.services
}