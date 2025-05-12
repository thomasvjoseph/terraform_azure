resource "azurerm_private_endpoint" "private_endpoint" {
  for_each            = var.private_endpoint
  name                = each.value.private_endpoint_name
  location            = var.location
  resource_group_name = var.resource_group_name
  subnet_id           = each.value.subnet_id

  private_service_connection {
    name                              = each.value.private_service_connection_name
    private_connection_resource_alias = each.value.private_connection_resource_alias
    subresource_names                 = each.value.subresource_names
    private_connection_resource_id    = each.value.private_connection_resource_id
    is_manual_connection              = var.is_manual_connection
    request_message                   = each.value.request_message
  }

 /*  dynamic "private_dns_zone_group" {
    for_each = each.value.private_dns_zone_group != null ? [each.value.private_dns_zone_group] : []
    content {
      name                 = private_dns_zone_group.value.name
      private_dns_zone_ids = private_dns_zone_group.value.private_dns_zone_id
    }

  } */

  tags = var.tags
}