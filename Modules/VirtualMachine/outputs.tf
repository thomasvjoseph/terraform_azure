output "vm_ids" {
  value = { for vm_key, vm in azurerm_linux_virtual_machine.vm_instance : vm_key => vm.id }
  description = "Map of VM names to their IDs"
}

output "vm_names" {
  value = { for vm_key, vm in azurerm_linux_virtual_machine.vm_instance : vm_key => vm.name }
  description = "Map of VM names"
}

output "vm_public_ip_addresses" {
  value = { for vm_key, vm in azurerm_public_ip.vm_public_ip : vm_key => vm.ip_address }
  description = "Map of VM names to their public IP addresses"
}