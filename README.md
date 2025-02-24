# Micro Services Platform Terraform

[Check out the AWS CDK version here](https://github.com/dane-mortimer/micro-service-platform)

The AWS CDK version repository includes an architecture diagram and a bit more about the pattern

:warning: **_Disclaimer_** :warning:

This Terraform module is a blueprint or starting point for developing your own microservices platform. It has not been deployed to avoid incurring infrastructure costs.

To make this functional, additional steps are required, such as:

- Developing your own services.
- Adding SSL/TLS certificates to the load balancer.
- Configuring security, monitoring, and other production-grade requirements.

This blueprint is not production-ready and should not be treated as such. Use it as a reference or foundation for building and customizing your platform according to your specific needs.

# Usage

### Install dependencies

```bash
# Install terraform
brew tap hashicorp/tap && brew install terraform

# Install Pre-Commit
brew install pre-commit && pre-commit install
```

### Assume AWS Account Credentials

```bash
aws sts get-caller-identity
```

### Define configuration

Define your configuration in `terraform.tfvars`

```tfvars
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
      pattern_path  = "/*"
      priortiy      = 100
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
```

### Deploy terraform modules

```bash
terraform init

terraform validate

terraform plan

terraform apply
```
