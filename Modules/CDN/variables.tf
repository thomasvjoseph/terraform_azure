variable "cdn_profile_name" {
  description = "The name of the Azure Front Door CDN Profile."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group where Front Door will be deployed."
  type        = string
}

variable "cdn_sku_name" {
  description = "The SKU name for the Front Door profile."
  type        = string
  validation {
    condition     = contains(["Standard_AzureFrontDoor", "Premium_AzureFrontDoor"], var.cdn_sku_name)
    error_message = "Invalid SKU name. Must be one of: Standard_AzureFrontDoor, Premium_AzureFrontDoor."
  }
}

variable "frontdoor_endpoint_name" {
  description = "The name of the Front Door endpoint."
  type        = string
}

variable "frontdoor_origin_group_name" {
  description = "The name of the Front Door origin group."
  type        = string
}

variable "frontdoor_origin_name" {
  description = "The name of the Front Door origin."
  type        = string
}

variable "frontdoor_rule_set_name" {
  description = "The name of the Front Door rule set."
  type        = string
}

/* variable "frontdoor_rules" {
  description = "A map of Front Door rules."
  default     = []
  type = map(object({
    rule_name = string
    order     = number
  }))
} */

variable "frontdoor_route_name" {
  description = "The name of the Front Door route."
  type        = string
}

variable "storage_static_website_url" {
  description = "The static website endpoint of the Azure Storage Account."
  type        = string
}

variable "storage_primary_web_host" {
  description = "The primary web host name of the storage account."
  type        = string
}

variable "patterns_to_match" {
  description = "Patterns to match for the Front Door route."
  type        = list(string)
}

variable "cdn_frontdoor_origin_path" {
  description = "The path to the origin for the Front Door."
  type        = string
}

variable "tags" {
  description = "Tags to be applied to the resources."
  type        = map(string)
}