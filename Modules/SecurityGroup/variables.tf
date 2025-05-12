# variables.tf
variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "location" {
  description = "Azure region where resources will be created"
  type        = string
}

variable "tags" {
  description = "Default tags to apply to all resources"
  type        = map(string)
  default     = {}
}

variable "network_security_groups" {
  description = "Map of NSGs with their configuration and security rules"
  type = map(object({
    name = string
    tags = optional(map(string), {})
    subnet_ids = optional(list(string), []) # Optional list of subnets
    security_rules = list(object({
      name                       = string
      priority                   = number
      direction                  = string
      access                     = string
      protocol                   = string
      source_port_range          = string
      destination_port_range     = string
      source_address_prefix      = string
      destination_address_prefix = string
    }))
  }))
}
# Optional NIC associations with NSGs
variable "nic_associations" {
  type = map(object({
    network_interface_id = string
    nsg_key              = string # Reference to the NSG key in `network_security_groups`
  }))
  default = {} # No NIC associations by default
}