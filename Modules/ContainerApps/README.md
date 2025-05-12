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
| [azurerm_container_app.container_app](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/container_app) | resource |
| [azurerm_container_app_environment.container_app_environment](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/container_app_environment) | resource |
| [azurerm_role_assignment.containerapp](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_assignment) | resource |
| [azurerm_user_assigned_identity.container_identity](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/user_assigned_identity) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_c_app_env_name"></a> [c\_app\_env\_name](#input\_c\_app\_env\_name) | The name of the container app environment | `string` | n/a | yes |
| <a name="input_container_app_memory"></a> [container\_app\_memory](#input\_container\_app\_memory) | The memory of the container app | `string` | n/a | yes |
| <a name="input_container_app_name"></a> [container\_app\_name](#input\_container\_app\_name) | The name of the container app | `string` | n/a | yes |
| <a name="input_container_arguments"></a> [container\_arguments](#input\_container\_arguments) | The arguments to pass to the container command | `list(string)` | `[]` | no |
| <a name="input_container_command"></a> [container\_command](#input\_container\_command) | The command to run in the container | `list(string)` | `[]` | no |
| <a name="input_container_cpu"></a> [container\_cpu](#input\_container\_cpu) | The CPU of the container | `number` | n/a | yes |
| <a name="input_container_identity_name"></a> [container\_identity\_name](#input\_container\_identity\_name) | The name of the container identity | `string` | n/a | yes |
| <a name="input_container_image"></a> [container\_image](#input\_container\_image) | The image of the container | `string` | n/a | yes |
| <a name="input_container_name"></a> [container\_name](#input\_container\_name) | The name of the container | `string` | n/a | yes |
| <a name="input_container_registry_id"></a> [container\_registry\_id](#input\_container\_registry\_id) | The ID of the container registry | `string` | n/a | yes |
| <a name="input_ingress_enabled"></a> [ingress\_enabled](#input\_ingress\_enabled) | Indicates if the container app is enabled for ingress | `bool` | `false` | no |
| <a name="input_location"></a> [location](#input\_location) | The location of the resource in Azure | `string` | n/a | yes |
| <a name="input_log_analytics_workspace_id"></a> [log\_analytics\_workspace\_id](#input\_log\_analytics\_workspace\_id) | The ID of the log analytics workspace | `string` | n/a | yes |
| <a name="input_login_server"></a> [login\_server](#input\_login\_server) | The login server of the Azure Container Registry | `string` | n/a | yes |
| <a name="input_max_replicas"></a> [max\_replicas](#input\_max\_replicas) | The maximum number of replicas for the container app | `number` | `5` | no |
| <a name="input_min_replicas"></a> [min\_replicas](#input\_min\_replicas) | The minimum number of replicas for the container app | `number` | `1` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of the resource group in which the container registry will be created | `string` | n/a | yes |
| <a name="input_subnet_id"></a> [subnet\_id](#input\_subnet\_id) | The Subnet | `string` | `null` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags for the container app | `map(string)` | `{}` | no |
| <a name="input_workload_profile_type"></a> [workload\_profile\_type](#input\_workload\_profile\_type) | The workload profile type for the container app environment | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_container_app_fqdn"></a> [container\_app\_fqdn](#output\_container\_app\_fqdn) | n/a |
| <a name="output_container_app_id"></a> [container\_app\_id](#output\_container\_app\_id) | n/a |
| <a name="output_container_app_name"></a> [container\_app\_name](#output\_container\_app\_name) | n/a |
<!-- END_TF_DOCS -->