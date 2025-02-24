# IAM Role for ECS Task Execution
resource "aws_iam_role" "ecs_task_execution_role" {
  name = "${local.name}-ecs-task-execution-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ecs-tasks.amazonaws.com"
        }
      }
    ]
  })
}

resource "aws_iam_role" "task_role" {
  name = "${local.name}-task-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ecs-tasks.amazonaws.com"
        }
      }
    ]
  })
}

resource "aws_iam_policy" "task_policy" {
  count       = length(var.task_role_policy_statements) > 0 ? 1 : 0

  name        = "${var.env}-${var.service_name}-task-policy"
  description = "Policy for ${var.service_name} ECS task"
  policy      = jsonencode({
    Version   = "2012-10-17"
    Statement = var.task_role_policy_statements
  })
}

resource "aws_iam_role_policy_attachment" "task_policy_attachment" {
  count      = length(var.task_role_policy_statements) > 0 ? 1 : 0

  role       = aws_iam_role.task_role.name
  policy_arn = aws_iam_policy.task_policy[0].arn
}

resource "aws_iam_role_policy_attachment" "ecs_task_execution_role_policy" {
  role       = aws_iam_role.ecs_task_execution_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
}