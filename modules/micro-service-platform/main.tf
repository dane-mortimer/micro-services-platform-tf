module "vpc" {
  source = "../vpc"

  env                 = var.env
  vpc_cidr            = var.vpc_cidr
  tags                = var.tags
}

module "ecs_cluster" {
  source = "../ecs-cluster"

  env     = var.env
  vpc_id  = module.vpc.vpc_id
  tags    = var.tags
}

module "ecs_service" {
  for_each                      = var.services

  source                        = "../ecs-service"

  env                           = var.env
  service_name                  = each.key
  ecs_cluster_id                = module.ecs_cluster.ecs_cluster_id
  desired_count                 = each.value.desired_count
  subnets                       = module.vpc.public_subnet_ids
  container_name                = each.value.container_name
  container_image               = each.value.container_image
  container_port                = each.value.container_port
  cpu                           = each.value.cpu
  memory                        = each.value.memory
  execution_role_arn            = var.execution_role_arn
  lb_config                     = each.value.lb_config != null ? merge(each.value.lb_config, {
    subnets = module.vpc.private_subnet_ids
  }) : null
  dependent_services            = each.value.dependent_services
  vpc_id                        = module.vpc.vpc_id
  service_connect_namespace_arn = module.ecs_cluster.service_connect_namespace_arn
  environment_variables         = each.value.environment_variables
  max_capacity                  = each.value.max_capacity
  min_capacity                  = each.value.min_capacity
  cpu_target_value              = each.value.cpu_target_value
  memory_target_value           = each.value.memory_target_value
  tags                          = var.tags
}