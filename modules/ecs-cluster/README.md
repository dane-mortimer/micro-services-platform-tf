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
| [aws_ecs_cluster.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_cluster)                                                         | resource |
| [aws_service_discovery_private_dns_namespace.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/service_discovery_private_dns_namespace) | resource |

## Inputs

| Name                                                | Description                           | Type          | Default | Required |
| --------------------------------------------------- | ------------------------------------- | ------------- | ------- | :------: |
| <a name="input_env"></a> [env](#input_env)          | n/a                                   | `string`      | n/a     |   yes    |
| <a name="input_tags"></a> [tags](#input_tags)       | Common tags to apply to all resources | `map(string)` | `{}`    |    no    |
| <a name="input_vpc_id"></a> [vpc_id](#input_vpc_id) | n/a                                   | `string`      | n/a     |   yes    |

## Outputs

| Name                                                                                                                       | Description                            |
| -------------------------------------------------------------------------------------------------------------------------- | -------------------------------------- |
| <a name="output_ecs_cluster_id"></a> [ecs_cluster_id](#output_ecs_cluster_id)                                              | ID of the ECS cluster                  |
| <a name="output_service_connect_namespace_arn"></a> [service_connect_namespace_arn](#output_service_connect_namespace_arn) | ARN of the Service Discovery Namespace |

<!-- END_TF_DOCS -->
