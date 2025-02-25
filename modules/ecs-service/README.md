<!-- BEGIN_TF_DOCS -->

## Requirements

No requirements.

## Providers

| Name                                             | Version |
| ------------------------------------------------ | ------- |
| <a name="provider_aws"></a> [aws](#provider_aws) | 5.87.0  |

## Modules

No modules.

## Resources

| Name                                                                                                                                                                    | Type     |
| ----------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------- |
| [aws_appautoscaling_policy.ecs_cpu_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/appautoscaling_policy)                           | resource |
| [aws_appautoscaling_policy.ecs_memory_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/appautoscaling_policy)                        | resource |
| [aws_appautoscaling_target.ecs_target](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/appautoscaling_target)                               | resource |
| [aws_ecs_service.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_service)                                                         | resource |
| [aws_ecs_task_definition.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_task_definition)                                         | resource |
| [aws_iam_policy.task_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy)                                                    | resource |
| [aws_iam_role.ecs_task_execution_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role)                                            | resource |
| [aws_iam_role.task_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role)                                                          | resource |
| [aws_iam_role_policy_attachment.ecs_task_execution_role_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.task_policy_attachment](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment)         | resource |
| [aws_lb.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb)                                                                           | resource |
| [aws_lb_listener.http](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_listener)                                                         | resource |
| [aws_lb_listener_rule.service_rules](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_listener_rule)                                      | resource |
| [aws_lb_target_group.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_target_group)                                                 | resource |
| [aws_security_group.alb_sg](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group)                                                 | resource |
| [aws_security_group.ecs_service_sg](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group)                                         | resource |

## Inputs

| Name                                                                                                                     | Description                                                   | Type                                                                                                                                        | Default | Required |
| ------------------------------------------------------------------------------------------------------------------------ | ------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------- | ------- | :------: |
| <a name="input_container_image"></a> [container_image](#input_container_image)                                           | n/a                                                           | `string`                                                                                                                                    | n/a     |   yes    |
| <a name="input_container_name"></a> [container_name](#input_container_name)                                              | n/a                                                           | `string`                                                                                                                                    | n/a     |   yes    |
| <a name="input_container_port"></a> [container_port](#input_container_port)                                              | n/a                                                           | `number`                                                                                                                                    | n/a     |   yes    |
| <a name="input_cpu"></a> [cpu](#input_cpu)                                                                               | n/a                                                           | `number`                                                                                                                                    | n/a     |   yes    |
| <a name="input_cpu_target_value"></a> [cpu_target_value](#input_cpu_target_value)                                        | Target CPU utilization percentage for scaling                 | `number`                                                                                                                                    | `70`    |    no    |
| <a name="input_dependent_services"></a> [dependent_services](#input_dependent_services)                                  | n/a                                                           | <pre>list(object({<br/> dns = string<br/> port = number<br/> }))</pre>                                                                      | `[]`    |    no    |
| <a name="input_desired_count"></a> [desired_count](#input_desired_count)                                                 | n/a                                                           | `number`                                                                                                                                    | n/a     |   yes    |
| <a name="input_ecs_cluster_id"></a> [ecs_cluster_id](#input_ecs_cluster_id)                                              | n/a                                                           | `string`                                                                                                                                    | n/a     |   yes    |
| <a name="input_env"></a> [env](#input_env)                                                                               | n/a                                                           | `string`                                                                                                                                    | n/a     |   yes    |
| <a name="input_environment_variables"></a> [environment_variables](#input_environment_variables)                         | List of custom environment variables to pass to the container | <pre>list(object({<br/> name = string<br/> value = string<br/> }))</pre>                                                                    | `[]`    |    no    |
| <a name="input_lb_config"></a> [lb_config](#input_lb_config)                                                             | n/a                                                           | <pre>object({<br/> subnets = list(string)<br/> path_pattern = string<br/> ingress_cidrs = list(string)<br/> priority = number<br/> })</pre> | `null`  |    no    |
| <a name="input_max_capacity"></a> [max_capacity](#input_max_capacity)                                                    | Maximum number of tasks for the ECS service                   | `number`                                                                                                                                    | `10`    |    no    |
| <a name="input_memory"></a> [memory](#input_memory)                                                                      | n/a                                                           | `number`                                                                                                                                    | n/a     |   yes    |
| <a name="input_memory_target_value"></a> [memory_target_value](#input_memory_target_value)                               | Target memory utilization percentage for scaling              | `number`                                                                                                                                    | `70`    |    no    |
| <a name="input_min_capacity"></a> [min_capacity](#input_min_capacity)                                                    | Minimum number of tasks for the ECS service                   | `number`                                                                                                                                    | `1`     |    no    |
| <a name="input_service_connect_namespace_arn"></a> [service_connect_namespace_arn](#input_service_connect_namespace_arn) | n/a                                                           | `string`                                                                                                                                    | n/a     |   yes    |
| <a name="input_service_name"></a> [service_name](#input_service_name)                                                    | n/a                                                           | `string`                                                                                                                                    | n/a     |   yes    |
| <a name="input_subnets"></a> [subnets](#input_subnets)                                                                   | n/a                                                           | `list(string)`                                                                                                                              | n/a     |   yes    |
| <a name="input_tags"></a> [tags](#input_tags)                                                                            | Common tags to apply to all resources                         | `map(string)`                                                                                                                               | `{}`    |    no    |
| <a name="input_task_role_policy_statements"></a> [task_role_policy_statements](#input_task_role_policy_statements)       | n/a                                                           | <pre>list(object({<br/> effect = string<br/> actions = list(string)<br/> resources = list(string)<br/> }))</pre>                            | `[]`    |    no    |
| <a name="input_vpc_id"></a> [vpc_id](#input_vpc_id)                                                                      | n/a                                                           | `string`                                                                                                                                    | n/a     |   yes    |

## Outputs

No outputs.

<!-- END_TF_DOCS -->
