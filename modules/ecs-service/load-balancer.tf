resource "aws_lb" "main" {
  count              = var.loadbalancerConfiguration != null ? 1 : 0

  name               = "${local.name}-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.alb_sg[0].id]
  subnets            = var.loadbalancerConfiguration.subnets

  tags = merge(var.tags, {
    Name = "${var.env}-alb"
  })
}

resource "aws_lb_target_group" "main" {
  count    = var.loadbalancerConfiguration != null ? 1 : 0

  name     = "${local.name}-tg"
  port     = var.container_port
  protocol = "HTTP"
  vpc_id   = var.vpc_id

  health_check {
    path                = "/ping"
    protocol            = "HTTP"
    port                = "traffic-port"
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 5
    interval            = 30
    matcher             = "200-299"
  }

  tags = merge(var.tags, {
    Name = "${local.name}-tg"
  })
}

resource "aws_lb_listener" "http" {
  count             = var.loadbalancerConfiguration != null ? 1 : 0

  load_balancer_arn = aws_lb.main[0].arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.main[0].arn
  }

  tags = merge(var.tags, {
    Name = "${local.name}-http-listener"
  })
}

resource "aws_lb_listener_rule" "service_rules" {
  count        = var.loadbalancerConfiguration != null ? 1 : 0

  listener_arn = aws_lb_listener.http[0].arn
  priority     = var.loadbalancerConfiguration != null ? var.loadbalancerConfiguration.priority : 100

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.main[0].arn
  }

  condition {
    path_pattern {
      values = [var.loadbalancerConfiguration != null ? var.loadbalancerConfiguration.path_pattern : "/*"]
    }
  }
  tags        = merge(var.tags, {
    Name      = "${local.name}-http-listener-rule"
  })
}