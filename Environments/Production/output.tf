output "resource_group_name" {
  value = data.azurerm_resource_group.resource_group.name
}

output "resource_group_location" {
  value = data.azurerm_resource_group.resource_group.location
}

output "virtual_network_id" {
  value = data.azurerm_virtual_network.virtual_network.id
}

output "subnet3_id" {
  value = data.azurerm_subnet.subnet3.id
}

output "subnet6_id" {
  value = data.azurerm_subnet.subnet6.id
}