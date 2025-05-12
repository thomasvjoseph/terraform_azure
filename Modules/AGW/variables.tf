variable "location" {
  type        = string
  description = "The location of the resource in Azure"
}

variable "resource_group_name" {
  type        = string
  description = "The name of the resource group in which the container registry will be created"
}
variable "public_ip_name" {
  type        = string
  description = "The name of the public IP"
  
}

variable "subnet_id" {
  type        = string
  description = "The Subnet" 
}

variable "app_gateway_name" {
  type        = string
  description = "The name of the application gateway"
}
variable "sku" {
  type        = string
  description = "The SKU of the application gateway"
  validation {
    condition     = contains(["Basic","Standard_v2", "WAF_v2"], var.sku)
    error_message = "The SKU must be either Standard_v2 or WAF_v2."
  }
  
}
variable "fqdns" {
  type        = list(string)
  description = "The fqdns"
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "A map of tags to assign to the resource."
}