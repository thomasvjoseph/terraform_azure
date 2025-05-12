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
| [azurerm_postgresql_flexible_server.PostgreSQL](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/postgresql_flexible_server) | resource |
| [azurerm_postgresql_flexible_server_database.PostgreSQL](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/postgresql_flexible_server_database) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_PostgreSQL_administrator_login"></a> [PostgreSQL\_administrator\_login](#input\_PostgreSQL\_administrator\_login) | The administrator login for the PostgreSQL server | `string` | n/a | yes |
| <a name="input_PostgreSQL_administrator_password"></a> [PostgreSQL\_administrator\_password](#input\_PostgreSQL\_administrator\_password) | The administrator password for the PostgreSQL server | `string` | n/a | yes |
| <a name="input_PostgreSQL_auto_grow_enabled"></a> [PostgreSQL\_auto\_grow\_enabled](#input\_PostgreSQL\_auto\_grow\_enabled) | Whether the PostgreSQL server has auto grow enabled | `bool` | `false` | no |
| <a name="input_PostgreSQL_backup_retention_days"></a> [PostgreSQL\_backup\_retention\_days](#input\_PostgreSQL\_backup\_retention\_days) | The backup retention days for the PostgreSQL server | `number` | `7` | no |
| <a name="input_PostgreSQL_database_charset"></a> [PostgreSQL\_database\_charset](#input\_PostgreSQL\_database\_charset) | The charset for the PostgreSQL database | `string` | `"utf8"` | no |
| <a name="input_PostgreSQL_database_collation"></a> [PostgreSQL\_database\_collation](#input\_PostgreSQL\_database\_collation) | The collation for the PostgreSQL database | `string` | `"en_US.utf8"` | no |
| <a name="input_PostgreSQL_database_name"></a> [PostgreSQL\_database\_name](#input\_PostgreSQL\_database\_name) | The name of the PostgreSQL database | `string` | n/a | yes |
| <a name="input_PostgreSQL_delegated_subnet_id"></a> [PostgreSQL\_delegated\_subnet\_id](#input\_PostgreSQL\_delegated\_subnet\_id) | The ID of the delegated subnet | `string` | `null` | no |
| <a name="input_PostgreSQL_maintenance_window_day_of_week"></a> [PostgreSQL\_maintenance\_window\_day\_of\_week](#input\_PostgreSQL\_maintenance\_window\_day\_of\_week) | The day of the week for the maintenance window | `number` | `1` | no |
| <a name="input_PostgreSQL_maintenance_window_start_hour"></a> [PostgreSQL\_maintenance\_window\_start\_hour](#input\_PostgreSQL\_maintenance\_window\_start\_hour) | The start hour for the maintenance window | `number` | `0` | no |
| <a name="input_PostgreSQL_maintenance_window_start_minute"></a> [PostgreSQL\_maintenance\_window\_start\_minute](#input\_PostgreSQL\_maintenance\_window\_start\_minute) | The start minute for the maintenance window | `number` | `0` | no |
| <a name="input_PostgreSQL_name"></a> [PostgreSQL\_name](#input\_PostgreSQL\_name) | The name of the PostgreSQL server | `string` | n/a | yes |
| <a name="input_PostgreSQL_private_dns_zone_id"></a> [PostgreSQL\_private\_dns\_zone\_id](#input\_PostgreSQL\_private\_dns\_zone\_id) | The ID of the private DNS zone | `string` | `null` | no |
| <a name="input_PostgreSQL_sku_name"></a> [PostgreSQL\_sku\_name](#input\_PostgreSQL\_sku\_name) | The SKU name for the PostgreSQL server | `string` | `"B_Standard_B1ms"` | no |
| <a name="input_PostgreSQL_version"></a> [PostgreSQL\_version](#input\_PostgreSQL\_version) | The version of PostgreSQL to use | `string` | `"11"` | no |
| <a name="input_location"></a> [location](#input\_location) | The location of the resource in Azure | `string` | n/a | yes |
| <a name="input_public_access_enabled"></a> [public\_access\_enabled](#input\_public\_access\_enabled) | Indicates if the server is public (true) or private (false). | `bool` | `false` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of the resource group in which the container registry will be created | `string` | n/a | yes |
| <a name="input_storage_mb"></a> [storage\_mb](#input\_storage\_mb) | The storage in MB for the PostgreSQL server | `number` | `32768` | no |
| <a name="input_storage_tier"></a> [storage\_tier](#input\_storage\_tier) | The storage tier for the PostgreSQL server | `string` | `"P4"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags to assign to the resource. | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_PostgreSQL_DB_ID"></a> [PostgreSQL\_DB\_ID](#output\_PostgreSQL\_DB\_ID) | n/a |
| <a name="output_PostgreSQL_fqdn"></a> [PostgreSQL\_fqdn](#output\_PostgreSQL\_fqdn) | n/a |
<!-- END_TF_DOCS -->