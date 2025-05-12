variable "location" {
  type        = string
  description = "The location of the resource"
}

variable "resource_group_name" {
  type        = string
  description = "The name of the resource group"
}

variable "ssh_keys" {
  type        = string
  description = "The SSH Keys"
}

variable "vm_instances" { 
  type = map(object({
    vm_name = string
    vm_size = string
    storage_account_type = string
    disk_size_gb = number
    tags = map(string)
  }))
  description = "Map of VM instances with their configurations"
}
variable "subnet_id" {
  type        = string
  description = "The ID of the subnet"
}

variable "nsg_id" {
  type        = string
  description = "The ID of the network security group"
}
