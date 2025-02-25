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
  "user-service" = {
    container_name        = "user-service"
    container_image       = "myrepo/user-service:latest"
    container_port        = 80
    cpu                   = 256
    memory                = 512
    desired_count         = 2
    max_capacity          = 10
    min_capacity          = 1 
    cpu_target_value      = 60
    memory_target_value   = 60
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
    environment_variables = [
      {
        name  = "MY_VAR"
        value = "MY_VAL"
      }
    ]
  },
  "movie-service" = {
    container_name  = "movie-service"
    container_image = "myrepo/movie-service:latest"
    container_port  = 8080
    cpu            = 512
    memory         = 1024
    desired_count  = 1
    dependent_services = []
  }
}