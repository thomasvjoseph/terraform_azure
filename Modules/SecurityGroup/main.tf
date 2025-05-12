resource "azurerm_network_security_group" "nsg" {
  for_each = var.network_security_groups

  name                = each.value.name
  location            = var.location
  resource_group_name = var.resource_group_name
  tags                = merge(var.tags, each.value.tags)
}

resource "azurerm_network_security_rule" "rules" {
  for_each = {
    for rule in local.all_security_rules : "${rule.nsg_key}.${rule.name}" => rule
  }

  name                        = each.value.name
  priority                    = each.value.priority
  direction                   = each.value.direction
  access                      = each.value.access
  protocol                    = each.value.protocol
  source_port_range           = each.value.source_port_range
  destination_port_range      = each.value.destination_port_range
  source_address_prefix       = each.value.source_address_prefix
  destination_address_prefix  = each.value.destination_address_prefix
  resource_group_name         = var.resource_group_name
  network_security_group_name = azurerm_network_security_group.nsg[each.value.nsg_key].name
}

resource "azurerm_subnet_network_security_group_association" "nsg_association" {
  for_each = {
    for nsg_key, nsg in var.network_security_groups :
    nsg_key => [
      for subnet_id in nsg.subnet_ids : {
        nsg_key   = nsg_key
        subnet_id = subnet_id
      }
    ]
    if contains(keys(nsg), "subnet_ids") && length(nsg.subnet_ids) > 0
  }

  subnet_id                 = each.value[0].subnet_id
  network_security_group_id = azurerm_network_security_group.nsg[each.value[0].nsg_key].id
}

resource "azurerm_network_interface_security_group_association" "nic_association" {
  for_each = var.nic_associations
  network_interface_id      = each.value.network_interface_id
  network_security_group_id = azurerm_network_security_group.nsg[each.value.nsg_key].id
}

locals {
  # Flatten NSG rules for easier handling
  all_security_rules = flatten([
    for nsg_key, nsg in var.network_security_groups : [
      for rule in nsg.security_rules : merge(rule, {
        nsg_key = nsg_key
      })
    ]
  ])
}