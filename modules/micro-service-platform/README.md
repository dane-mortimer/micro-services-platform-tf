<!-- BEGIN_TF_DOCS -->

## Requirements

No requirements.

## Providers

No providers.

## Modules

| Name                                                                 | Source         | Version |
| -------------------------------------------------------------------- | -------------- | ------- |
| <a name="module_ecs_cluster"></a> [ecs_cluster](#module_ecs_cluster) | ../ecs-cluster | n/a     |
| <a name="module_ecs_service"></a> [ecs_service](#module_ecs_service) | ../ecs-service | n/a     |
| <a name="module_vpc"></a> [vpc](#module_vpc)                         | ../vpc         | n/a     |

## Resources

No resources.

## Inputs

| Name                                                      | Description                                                        | Type                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             | Default         | Required |
| --------------------------------------------------------- | ------------------------------------------------------------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ | --------------- | :------: |
| <a name="input_env"></a> [env](#input_env)                | Name of the application environment. E.g. dev, staging, production | `string`                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         | `"dev"`         |    no    |
| <a name="input_services"></a> [services](#input_services) | n/a                                                                | <pre>map(object({<br/> container_name = string<br/> container_image = string<br/> container_port = number<br/> lb_config = optional(object({<br/> ingress_cidrs = list(string)<br/> path_pattern = string<br/> priority = number<br/> }))<br/> dependent_services = list(object({<br/> dns = string<br/> port = number<br/> }))<br/> cpu = number<br/> memory = number<br/> desired_count = number<br/> task_role_policy_statements = optional(list(object({<br/> effect = string<br/> actions = list(string)<br/> resources = list(string)<br/> })), [])<br/> max_capacity = optional(number)<br/> min_capacity = optional(number)<br/> cpu_target_value = optional(number)<br/> memory_target_value = optional(number)<br/> environment_variables = optional(list(object({ <br/> name = string, <br/> value = string <br/> })))<br/> }))</pre> | n/a             |   yes    |
| <a name="input_tags"></a> [tags](#input_tags)             | Common tags to apply to all resources                              | `map(string)`                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    | `{}`            |    no    |
| <a name="input_vpc_cidr"></a> [vpc_cidr](#input_vpc_cidr) | VPC Cidr Range                                                     | `string`                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         | `"10.0.0.0/16"` |    no    |

## Outputs

No outputs.

<!-- END_TF_DOCS -->
