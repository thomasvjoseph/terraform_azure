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
| [azurerm_cdn_frontdoor_endpoint.frontdoor_endpoint](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/cdn_frontdoor_endpoint) | resource |
| [azurerm_cdn_frontdoor_origin.frontdoor_origin](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/cdn_frontdoor_origin) | resource |
| [azurerm_cdn_frontdoor_origin_group.frontdoor_origin_group](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/cdn_frontdoor_origin_group) | resource |
| [azurerm_cdn_frontdoor_profile.frontdoor](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/cdn_frontdoor_profile) | resource |
| [azurerm_cdn_frontdoor_route.webapp_route](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/cdn_frontdoor_route) | resource |
| [azurerm_cdn_frontdoor_rule_set.frontdoor_rule_set](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/cdn_frontdoor_rule_set) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cdn_frontdoor_origin_path"></a> [cdn\_frontdoor\_origin\_path](#input\_cdn\_frontdoor\_origin\_path) | The path to the origin for the Front Door. | `string` | n/a | yes |
| <a name="input_cdn_profile_name"></a> [cdn\_profile\_name](#input\_cdn\_profile\_name) | The name of the Azure Front Door CDN Profile. | `string` | n/a | yes |
| <a name="input_cdn_sku_name"></a> [cdn\_sku\_name](#input\_cdn\_sku\_name) | The SKU name for the Front Door profile. | `string` | n/a | yes |
| <a name="input_frontdoor_endpoint_name"></a> [frontdoor\_endpoint\_name](#input\_frontdoor\_endpoint\_name) | The name of the Front Door endpoint. | `string` | n/a | yes |
| <a name="input_frontdoor_origin_group_name"></a> [frontdoor\_origin\_group\_name](#input\_frontdoor\_origin\_group\_name) | The name of the Front Door origin group. | `string` | n/a | yes |
| <a name="input_frontdoor_origin_name"></a> [frontdoor\_origin\_name](#input\_frontdoor\_origin\_name) | The name of the Front Door origin. | `string` | n/a | yes |
| <a name="input_frontdoor_route_name"></a> [frontdoor\_route\_name](#input\_frontdoor\_route\_name) | The name of the Front Door route. | `string` | n/a | yes |
| <a name="input_frontdoor_rule_set_name"></a> [frontdoor\_rule\_set\_name](#input\_frontdoor\_rule\_set\_name) | The name of the Front Door rule set. | `string` | n/a | yes |
| <a name="input_patterns_to_match"></a> [patterns\_to\_match](#input\_patterns\_to\_match) | Patterns to match for the Front Door route. | `list(string)` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of the resource group where Front Door will be deployed. | `string` | n/a | yes |
| <a name="input_storage_primary_web_host"></a> [storage\_primary\_web\_host](#input\_storage\_primary\_web\_host) | The primary web host name of the storage account. | `string` | n/a | yes |
| <a name="input_storage_static_website_url"></a> [storage\_static\_website\_url](#input\_storage\_static\_website\_url) | The static website endpoint of the Azure Storage Account. | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags to be applied to the resources. | `map(string)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_frontdoor_endpoint_id"></a> [frontdoor\_endpoint\_id](#output\_frontdoor\_endpoint\_id) | The ID of the Azure Front Door endpoint. |
| <a name="output_frontdoor_endpoint_name"></a> [frontdoor\_endpoint\_name](#output\_frontdoor\_endpoint\_name) | The name of the Azure Front Door endpoint. |
| <a name="output_frontdoor_profile_id"></a> [frontdoor\_profile\_id](#output\_frontdoor\_profile\_id) | The ID of the Azure Front Door profile. |
| <a name="output_frontdoor_url"></a> [frontdoor\_url](#output\_frontdoor\_url) | The URL of the Azure Front Door endpoint. |
<!-- END_TF_DOCS -->