env = "dev"
application_name = "ExampleApplication"
vpc_cidr = "10.0.0.0/16"
execution_role_arn = "arn:aws:iam:::role/ecsTaskExecutionRole"

tags = {
  Environment = "dev"
  Project     = "ExampleApplication"
  Team        = "DevOps"
}


services = {
  "app1" = {
    container_name  = "app1-container"
    container_image = "myrepo/app1:latest"
    container_port  = 80
    cpu            = 256
    memory         = 512
    desired_count  = 2
    lb_config = {
      ingress_cidrs = ["0.0.0.0/0"]
      path_pattern  = "/*"
      priority      = 100
    }
    dependent_services = [
      {
        dns  = "app2"
        port = 8080
      }
    ]
    task_role_policy_statements = [
      {
        effect    = "Allow"
        actions   = ["s3:GetObject"]
        resources = ["arn:aws:s3:::my-bucket/*"]
      }
    ]
  },
  "app2" = {
    container_name  = "app2-container"
    container_image = "myrepo/app2:latest"
    container_port  = 8080
    cpu            = 512
    memory         = 1024
    desired_count  = 1
    dependent_services = []
  }
}