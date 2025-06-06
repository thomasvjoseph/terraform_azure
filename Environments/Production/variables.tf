variable "client_id" {
  description = "The client ID of the service principal."
  type        = string
  
}

variable "client_secret" {
  description = "The client secret of the service principal."
  type        = string
}
variable "tenant_id" {
  description = "The tenant ID of the Azure Active Directory."
  type        = string
}
variable "subscription_id" {
  description = "The subscription ID of the Azure subscription."
  type        = string
}
