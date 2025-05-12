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
| [azurerm_container_registry.acr](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/container_registry) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_acr_name"></a> [acr\_name](#input\_acr\_name) | The name of the container registry | `string` | n/a | yes |
| <a name="input_admin_enabled"></a> [admin\_enabled](#input\_admin\_enabled) | Whether the Container Registry is enabled for public access. | `bool` | `false` | no |
| <a name="input_azure_services_bypass_allowed"></a> [azure\_services\_bypass\_allowed](#input\_azure\_services\_bypass\_allowed) | Whether to allow trusted Azure services to access a network restricted Container Registry. | `bool` | `false` | no |
| <a name="input_data_endpoint_enabled"></a> [data\_endpoint\_enabled](#input\_data\_endpoint\_enabled) | Whether to enable dedicated data endpoints for this Container Registry? (Only supported on resources with the Premium SKU). | `bool` | `true` | no |
| <a name="input_location"></a> [location](#input\_location) | The location of the resource in Azure | `string` | n/a | yes |
| <a name="input_public_network_access_enabled"></a> [public\_network\_access\_enabled](#input\_public\_network\_access\_enabled) | Whether the Container Registry is accessible publicly. | `bool` | `true` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of the resource group in which the container registry will be created | `string` | n/a | yes |
| <a name="input_sku"></a> [sku](#input\_sku) | The SKU of the Azure Container Registry (Basic, Standard, Premium) | `string` | `"Basic"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags | `map(any)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_acr_id"></a> [acr\_id](#output\_acr\_id) | The ID of the Azure Container Registry |
| <a name="output_acr_name"></a> [acr\_name](#output\_acr\_name) | The name of the Azure Container Registry |
| <a name="output_admin_password"></a> [admin\_password](#output\_admin\_password) | The admin password of the Azure Container Registry |
| <a name="output_admin_username"></a> [admin\_username](#output\_admin\_username) | The admin username of the Azure Container Registry |
| <a name="output_login_server"></a> [login\_server](#output\_login\_server) | The login server of the Azure Container Registry |
<!-- END_TF_DOCS -->