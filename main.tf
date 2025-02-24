
locals {
  env = "${var.application_name}-${var.env}"
}

module "micro-service-platform" {
  source                = "./modules/micro-service-platform"
  
  env                   = local.env

  execution_role_arn    = var.execution_role_arn
  services              = var.services
  vpc_cidr              = var.vpc_cidr
}