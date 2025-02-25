# Terraform Modules Documentation

## Module: `ecs-service`

## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.87.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_appautoscaling_policy.ecs_cpu_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/appautoscaling_policy) | resource |
| [aws_appautoscaling_policy.ecs_memory_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/appautoscaling_policy) | resource |
| [aws_appautoscaling_target.ecs_target](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/appautoscaling_target) | resource |
| [aws_ecs_service.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_service) | resource |
| [aws_ecs_task_definition.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_task_definition) | resource |
| [aws_iam_policy.task_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_role.ecs_task_execution_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role.task_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.ecs_task_execution_role_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.task_policy_attachment](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_lb.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb) | resource |
| [aws_lb_listener.http](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_listener) | resource |
| [aws_lb_listener_rule.service_rules](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_listener_rule) | resource |
| [aws_lb_target_group.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_target_group) | resource |
| [aws_security_group.alb_sg](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group.ecs_service_sg](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_container_image"></a> [container\_image](#input\_container\_image) | n/a | `string` | n/a | yes |
| <a name="input_container_name"></a> [container\_name](#input\_container\_name) | n/a | `string` | n/a | yes |
| <a name="input_container_port"></a> [container\_port](#input\_container\_port) | n/a | `number` | n/a | yes |
| <a name="input_cpu"></a> [cpu](#input\_cpu) | n/a | `number` | n/a | yes |
| <a name="input_cpu_target_value"></a> [cpu\_target\_value](#input\_cpu\_target\_value) | Target CPU utilization percentage for scaling | `number` | `70` | no |
| <a name="input_dependent_services"></a> [dependent\_services](#input\_dependent\_services) | n/a | <pre>list(object({<br/>    dns  = string<br/>    port = number<br/>  }))</pre> | `[]` | no |
| <a name="input_desired_count"></a> [desired\_count](#input\_desired\_count) | n/a | `number` | n/a | yes |
| <a name="input_ecs_cluster_id"></a> [ecs\_cluster\_id](#input\_ecs\_cluster\_id) | n/a | `string` | n/a | yes |
| <a name="input_env"></a> [env](#input\_env) | n/a | `string` | n/a | yes |
| <a name="input_environment_variables"></a> [environment\_variables](#input\_environment\_variables) | List of custom environment variables to pass to the container | <pre>list(object({<br/>    name  = string<br/>    value = string<br/>  }))</pre> | `[]` | no |
| <a name="input_lb_config"></a> [lb\_config](#input\_lb\_config) | n/a | <pre>object({<br/>    subnets       = list(string)<br/>    path_pattern  = string<br/>    ingress_cidrs = list(string)<br/>    priority      = number<br/>  })</pre> | `null` | no |
| <a name="input_max_capacity"></a> [max\_capacity](#input\_max\_capacity) | Maximum number of tasks for the ECS service | `number` | `10` | no |
| <a name="input_memory"></a> [memory](#input\_memory) | n/a | `number` | n/a | yes |
| <a name="input_memory_target_value"></a> [memory\_target\_value](#input\_memory\_target\_value) | Target memory utilization percentage for scaling | `number` | `70` | no |
| <a name="input_min_capacity"></a> [min\_capacity](#input\_min\_capacity) | Minimum number of tasks for the ECS service | `number` | `1` | no |
| <a name="input_service_connect_namespace_arn"></a> [service\_connect\_namespace\_arn](#input\_service\_connect\_namespace\_arn) | n/a | `string` | n/a | yes |
| <a name="input_service_name"></a> [service\_name](#input\_service\_name) | n/a | `string` | n/a | yes |
| <a name="input_subnets"></a> [subnets](#input\_subnets) | n/a | `list(string)` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Common tags to apply to all resources | `map(string)` | `{}` | no |
| <a name="input_task_role_policy_statements"></a> [task\_role\_policy\_statements](#input\_task\_role\_policy\_statements) | n/a | <pre>list(object({<br/>    effect    = string<br/>    actions   = list(string)<br/>    resources = list(string)<br/>  }))</pre> | `[]` | no |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | n/a | `string` | n/a | yes |

## Outputs

No outputs.

---

## Module: `ecs-cluster`

## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.87.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_ecs_cluster.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_cluster) | resource |
| [aws_service_discovery_private_dns_namespace.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/service_discovery_private_dns_namespace) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_env"></a> [env](#input\_env) | n/a | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Common tags to apply to all resources | `map(string)` | `{}` | no |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | n/a | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_ecs_cluster_id"></a> [ecs\_cluster\_id](#output\_ecs\_cluster\_id) | ID of the ECS cluster |
| <a name="output_service_connect_namespace_arn"></a> [service\_connect\_namespace\_arn](#output\_service\_connect\_namespace\_arn) | ARN of the Service Discovery Namespace |

---

## Module: `vpc`

## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.88.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_internet_gateway.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/internet_gateway) | resource |
| [aws_route.public_internet_gateway](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route) | resource |
| [aws_route_table.private](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table) | resource |
| [aws_route_table.public](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table) | resource |
| [aws_route_table_association.private](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_route_table_association.public](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_subnet.private](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_subnet.public](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_vpc.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_availability_zones"></a> [availability\_zones](#input\_availability\_zones) | List of availability zones for subnets | `list(string)` | <pre>[<br/>  "eu-west-1a",<br/>  "eu-west-1b"<br/>]</pre> | no |
| <a name="input_env"></a> [env](#input\_env) | Environment VPC will be deployed to | `string` | n/a | yes |
| <a name="input_private_subnet_cidrs"></a> [private\_subnet\_cidrs](#input\_private\_subnet\_cidrs) | List of CIDR blocks for private subnets | `list(string)` | <pre>[<br/>  "10.0.0.0/24",<br/>  "10.0.0.0/24"<br/>]</pre> | no |
| <a name="input_public_subnet_cidrs"></a> [public\_subnet\_cidrs](#input\_public\_subnet\_cidrs) | List of CIDR blocks for public subnets | `list(string)` | <pre>[<br/>  "10.0.0.0/24",<br/>  "10.0.0.0/24"<br/>]</pre> | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Common tags to apply to all resources | `map(string)` | `{}` | no |
| <a name="input_vpc_cidr"></a> [vpc\_cidr](#input\_vpc\_cidr) | CIDR block for the VPC | `string` | `"10.0.0.0/16"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_internet_gateway_id"></a> [internet\_gateway\_id](#output\_internet\_gateway\_id) | ID of the internet gateway |
| <a name="output_private_route_table_id"></a> [private\_route\_table\_id](#output\_private\_route\_table\_id) | ID of the private route table |
| <a name="output_private_subnet_ids"></a> [private\_subnet\_ids](#output\_private\_subnet\_ids) | IDs of the private subnets |
| <a name="output_public_route_table_id"></a> [public\_route\_table\_id](#output\_public\_route\_table\_id) | ID of the public route table |
| <a name="output_public_subnet_ids"></a> [public\_subnet\_ids](#output\_public\_subnet\_ids) | IDs of the public subnets |
| <a name="output_vpc_id"></a> [vpc\_id](#output\_vpc\_id) | ID of the VPC |

---

## Module: `micro-service-platform`

## Requirements

No requirements.

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_ecs_cluster"></a> [ecs\_cluster](#module\_ecs\_cluster) | ../ecs-cluster | n/a |
| <a name="module_ecs_service"></a> [ecs\_service](#module\_ecs\_service) | ../ecs-service | n/a |
| <a name="module_vpc"></a> [vpc](#module\_vpc) | ../vpc | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_env"></a> [env](#input\_env) | Name of the application environment. E.g. dev, staging, production | `string` | `"dev"` | no |
| <a name="input_services"></a> [services](#input\_services) | n/a | <pre>map(object({<br/>    container_name  = string<br/>    container_image = string<br/>    container_port  = number<br/>    lb_config = optional(object({<br/>      ingress_cidrs = list(string)<br/>      path_pattern  = string<br/>      priority      = number<br/>    }))<br/>    dependent_services = list(object({<br/>      dns  = string<br/>      port = number<br/>    }))<br/>    cpu           = number<br/>    memory        = number<br/>    desired_count = number<br/>    task_role_policy_statements = optional(list(object({<br/>      effect    = string<br/>      actions   = list(string)<br/>      resources = list(string)<br/>    })), [])<br/>    max_capacity          = optional(number)<br/>    min_capacity          = optional(number)<br/>    cpu_target_value      = optional(number)<br/>    memory_target_value   = optional(number)<br/>    environment_variables = optional(list(object({ <br/>      name = string, <br/>      value = string <br/>    })))<br/>  }))</pre> | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Common tags to apply to all resources | `map(string)` | `{}` | no |
| <a name="input_vpc_cidr"></a> [vpc\_cidr](#input\_vpc\_cidr) | VPC Cidr Range | `string` | `"10.0.0.0/16"` | no |

## Outputs

No outputs.

---

