    resource "azurerm_public_ip" "vm_public_ip" {
      for_each            = var.vm_instances
      name                = "${each.value.vm_name}-public-ip"
      location            = var.location
      resource_group_name = var.resource_group_name
      allocation_method   = "Static"
      sku                 = "Standard"
    }
 
resource "azurerm_network_interface" "vm_nic" {
  for_each            = var.vm_instances
  name                = "${each.key}-nic"
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "vm_configuration"
    subnet_id                     = var.subnet_id
    public_ip_address_id         = azurerm_public_ip.vm_public_ip[each.key].id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_linux_virtual_machine" "vm_instance" {
  for_each              = var.vm_instances
  name                  = each.value.vm_name
  location              = var.location
  resource_group_name   = var.resource_group_name
  size                = each.value.vm_size
  admin_username      = "adminuser"
  network_interface_ids = [
    azurerm_network_interface.vm_nic[each.key].id
  ]

  admin_ssh_key {
    username   = "adminuser"
    public_key = var.ssh_keys
  }

  os_disk {
    name                 = "${each.value.vm_name}-osdisk"
    caching              = "ReadWrite"
    storage_account_type = each.value.storage_account_type
    disk_size_gb = each.value.disk_size_gb
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
  tags                = each.value.tags
}

resource "azurerm_network_interface_security_group_association" "vm_nsg" {
  for_each                = var.vm_instances
  network_interface_id      = azurerm_network_interface.vm_nic[each.key].id
  network_security_group_id = var.nsg_id
}
