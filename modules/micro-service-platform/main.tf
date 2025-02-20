locals {
  application_environment = "${var.application_name}-${var.environment}"
  container_port          = 80
  vpc_name                = "${local.application_environment}-vpc"
}

module "vpc" {
  source    = "../vpc"

  vpc_name  = local.vpc_name
}

module "ecs_cluster" {
  source       = "../ecs-cluster"  # Path to the local module directory

  cluster_name = "${local.application_environment}-cluster"
}

module "load_balancer" {
  source                  = "../load-balancer"

  vpc_id                  = module.vpc.vpc_id
  application_environment = local.application_environment
  container_port          = local.container_port
  subnets                 = [ "${local.vpc_name}-private-subnet-1", "${local.vpc_name}-private-subnet-1"]
}
