<!-- BEGIN_TF_DOCS -->

## Requirements

No requirements.

## Providers

| Name                                             | Version |
| ------------------------------------------------ | ------- |
| <a name="provider_aws"></a> [aws](#provider_aws) | 5.88.0  |

## Modules

No modules.

## Resources

| Name                                                                                                                                       | Type     |
| ------------------------------------------------------------------------------------------------------------------------------------------ | -------- |
| [aws_internet_gateway.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/internet_gateway)                  | resource |
| [aws_route.public_internet_gateway](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route)                     | resource |
| [aws_route_table.private](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table)                         | resource |
| [aws_route_table.public](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table)                          | resource |
| [aws_route_table_association.private](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_route_table_association.public](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association)  | resource |
| [aws_subnet.private](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet)                                   | resource |
| [aws_subnet.public](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet)                                    | resource |
| [aws_vpc.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc)                                            | resource |

## Inputs

| Name                                                                                          | Description                             | Type           | Default                                                   | Required |
| --------------------------------------------------------------------------------------------- | --------------------------------------- | -------------- | --------------------------------------------------------- | :------: |
| <a name="input_availability_zones"></a> [availability_zones](#input_availability_zones)       | List of availability zones for subnets  | `list(string)` | <pre>[<br/> "eu-west-1a",<br/> "eu-west-1b"<br/>]</pre>   |    no    |
| <a name="input_env"></a> [env](#input_env)                                                    | Environment VPC will be deployed to     | `string`       | n/a                                                       |   yes    |
| <a name="input_private_subnet_cidrs"></a> [private_subnet_cidrs](#input_private_subnet_cidrs) | List of CIDR blocks for private subnets | `list(string)` | <pre>[<br/> "10.0.0.0/24",<br/> "10.0.0.0/24"<br/>]</pre> |    no    |
| <a name="input_public_subnet_cidrs"></a> [public_subnet_cidrs](#input_public_subnet_cidrs)    | List of CIDR blocks for public subnets  | `list(string)` | <pre>[<br/> "10.0.0.0/24",<br/> "10.0.0.0/24"<br/>]</pre> |    no    |
| <a name="input_tags"></a> [tags](#input_tags)                                                 | Common tags to apply to all resources   | `map(string)`  | `{}`                                                      |    no    |
| <a name="input_vpc_cidr"></a> [vpc_cidr](#input_vpc_cidr)                                     | CIDR block for the VPC                  | `string`       | `"10.0.0.0/16"`                                           |    no    |

## Outputs

| Name                                                                                                  | Description                   |
| ----------------------------------------------------------------------------------------------------- | ----------------------------- |
| <a name="output_internet_gateway_id"></a> [internet_gateway_id](#output_internet_gateway_id)          | ID of the internet gateway    |
| <a name="output_private_route_table_id"></a> [private_route_table_id](#output_private_route_table_id) | ID of the private route table |
| <a name="output_private_subnet_ids"></a> [private_subnet_ids](#output_private_subnet_ids)             | IDs of the private subnets    |
| <a name="output_public_route_table_id"></a> [public_route_table_id](#output_public_route_table_id)    | ID of the public route table  |
| <a name="output_public_subnet_ids"></a> [public_subnet_ids](#output_public_subnet_ids)                | IDs of the public subnets     |
| <a name="output_vpc_id"></a> [vpc_id](#output_vpc_id)                                                 | ID of the VPC                 |

<!-- END_TF_DOCS -->
