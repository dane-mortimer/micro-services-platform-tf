resource "aws_ecs_cluster" "main" {
  name = "${var.env}-ecs-cluster"
  tags = merge(var.tags, {
    Name = "${var.env}-ecs-cluster"
  })
}


resource "aws_service_discovery_private_dns_namespace" "main" {
  name        = "${var.env}.local"
  vpc         = var.vpc_id
  description = "Service Connect namespace for ${var.env}"
  tags        = merge(var.tags, {
    Name = "${var.env}.local"
  })
}