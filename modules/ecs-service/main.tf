resource "aws_security_group" "service_security_group" {
  
}


resource "aws_ecs_service" "main" {
  name            = "${local.name}-service"
  cluster         = var.ecs_cluster_id
  task_definition = aws_ecs_task_definition.main.arn
  desired_count   = var.desired_count
  launch_type     = "FARGATE"

  network_configuration {
    subnets         = var.subnets
    security_groups = [aws_security_group.ecs_service_sg.id]
  }

  dynamic "load_balancer" {
    for_each = var.lb_config != null ? [1] : []
    content {
      target_group_arn = aws_lb_target_group.main.arn
      container_name   = var.container_name
      container_port   = var.container_port
    }
  }

  service_connect_configuration {
    enabled = true
    namespace = var.service_connect_namespace_arn

    service {
      discovery_name = var.service_name
      port_name      = "${var.service_name}-port"
      client_alias {
        port     = var.container_port
        dns_name = var.service_name
      }
    }
  }
}

resource "aws_ecs_task_definition" "main" {
  family                   = "${local.name}-task"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = var.cpu
  memory                   = var.memory
  execution_role_arn       = var.execution_role_arn

  container_definitions = jsonencode([
    {
      name      = var.container_name
      image     = var.container_image
      cpu       = var.cpu
      memory    = var.memory
      essential = true
      portMappings = [
        {
          containerPort = var.container_port
          hostPort      = var.container_port
        }
      ]
      environment = [
        for dep in var.dependent_services : {
          name  = "${upper(replace(dep.dns, "-", "_"))}_DNS"
          value = "${dep.dns}.${var.env}.local"
        }
      ]
    }
  ])
}
