# Output values
output "virtual_network_id" {
  description = "The ID of the created virtual network."
  value       = azurerm_virtual_network.virtual_network.id
}

output "subnet_ids" {
  description = "A map of subnet names to subnet IDs."
  value       = { for s in azurerm_subnet.subnets : s.name => s.id }
}

output "public_subnet_id" {
  description = "The ID of the public subnet."
  value = { for k, v in azurerm_subnet.subnets : k => v.id if var.subnets[k].is_private == false }
}

output "private_subnet_id" {
    description = "The ID of the private subnet."
    value = { for k, v in azurerm_subnet.subnets : k => v.id if var.subnets[k].is_private == true }
}

output "subnet_cidr" {
  description = "A map of subnet names to subnet CIDRs."
  value       = { for s in azurerm_subnet.subnets : s.name => s.address_prefixes }
}