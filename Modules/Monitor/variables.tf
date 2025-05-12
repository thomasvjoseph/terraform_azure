variable "location" {
  type        = string
  description = "The location of the resource in Azure"
}

variable "resource_group_name" {
  type        = string
  description = "The name of the resource group in which the container registry will be created"
}

variable "log_analytics_workspace_name" {
  type        = string
  description = "The name of the log analytics workspace"
}

variable "vm_insights_name" {
  type        = string
  description = "The name of the VM insights extension"
}

variable "virtual_machine_id" {
  type        = string
  description = "The ID of the virtual machine to which the VM insights extension will be applied"
}

variable "tags" {
  type        = map(string)
  description = "Tags to be applied to the resources"
}