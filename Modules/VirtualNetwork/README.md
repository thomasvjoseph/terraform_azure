<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_subnet.subnets](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet) | resource |
| [azurerm_virtual_network.virtual_network](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_address_space"></a> [address\_space](#input\_address\_space) | The address space that is used by the virtual network. | `list(string)` | n/a | yes |
| <a name="input_ddos_protection_plan_id"></a> [ddos\_protection\_plan\_id](#input\_ddos\_protection\_plan\_id) | The ID of the DDoS Protection Plan to associate with the virtual network. | `string` | `null` | no |
| <a name="input_dns_servers"></a> [dns\_servers](#input\_dns\_servers) | A list of DNS servers to be used with the virtual network. | `list(string)` | `[]` | no |
| <a name="input_location"></a> [location](#input\_location) | The Azure region where the resources will be created. | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of the resource group in which to create the virtual network. | `string` | n/a | yes |
| <a name="input_subnet_delegation"></a> [subnet\_delegation](#input\_subnet\_delegation) | A map of subnet delegation configurations. | <pre>map(list(object({<br/>    name               = string<br/>    service_delegation = object({<br/>      name    = string<br/>      actions = optional(list(string))<br/>    })<br/>  })))</pre> | `{}` | no |
| <a name="input_subnet_service_endpoints"></a> [subnet\_service\_endpoints](#input\_subnet\_service\_endpoints) | A map of service endpoints to associate with each subnet. | `map(list(string))` | `{}` | no |
| <a name="input_subnets"></a> [subnets](#input\_subnets) | A map of subnet configurations. | <pre>map(object({<br/>    name           = string<br/>    address_prefix = list(string)<br/>    is_private     = bool<br/>    private_endpoint_network_policies = optional(string)<br/>    private_link_service_network_policies_enabled = optional(string)<br/>  }))</pre> | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags to assign to the virtual network resource. | `map(string)` | `{}` | no |
| <a name="input_virtual_network_name"></a> [virtual\_network\_name](#input\_virtual\_network\_name) | The name of the virtual network. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_private_subnet_id"></a> [private\_subnet\_id](#output\_private\_subnet\_id) | The ID of the private subnet. |
| <a name="output_public_subnet_id"></a> [public\_subnet\_id](#output\_public\_subnet\_id) | The ID of the public subnet. |
| <a name="output_subnet_cidr"></a> [subnet\_cidr](#output\_subnet\_cidr) | A map of subnet names to subnet CIDRs. |
| <a name="output_subnet_ids"></a> [subnet\_ids](#output\_subnet\_ids) | A map of subnet names to subnet IDs. |
| <a name="output_virtual_network_id"></a> [virtual\_network\_id](#output\_virtual\_network\_id) | The ID of the created virtual network. |
<!-- END_TF_DOCS -->