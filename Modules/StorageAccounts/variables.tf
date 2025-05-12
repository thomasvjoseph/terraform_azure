variable "location" {
  type        = string
  description = "The location of the resource in Azure"
}

variable "resource_group_name" {
  type        = string
  description = "The name of the resource group in which the container registry will be created"
}

variable "storage_account_name" {
  type        = string
  description = "The name of the storage account"
}

variable "account_tier" {
  type        = string
  description = "The tier of the storage account"
}

variable "account_replication_type" {
  type        = string
  description = "The replication type of the storage account"
}

variable "account_kind" {
  type        = string
  description = "The kind of the storage account"
} #static_website can only be set when the account_kind is set to StorageV2 or BlockBlobStorage.

/* 
 variable "subnet_id" {
  type        = string
   description = "The ID of the subnet to which the storage account should be connected"
}
variable "container_name" {
  type        = string
  description = "The name of the storage container"
} 
*/
variable "tags" {
  type        = map(string)
  description = "A mapping of tags to assign to the resource"
}

variable "terraform_identity_id" {
  type        = string
  description = "The ID of the managed identity used by Terraform"

}