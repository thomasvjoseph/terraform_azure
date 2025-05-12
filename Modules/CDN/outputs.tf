output "frontdoor_url" {
  description = "The URL of the Azure Front Door endpoint."
  value       = "https://${azurerm_cdn_frontdoor_endpoint.frontdoor_endpoint.host_name}"
}

output "frontdoor_profile_id" {
  description = "The ID of the Azure Front Door profile."
  value       = azurerm_cdn_frontdoor_profile.frontdoor.id
}

output "frontdoor_endpoint_id" {
  description = "The ID of the Azure Front Door endpoint."
  value       = azurerm_cdn_frontdoor_endpoint.frontdoor_endpoint.id
}

output "frontdoor_endpoint_name" {
  description = "The name of the Azure Front Door endpoint."
  value       = azurerm_cdn_frontdoor_endpoint.frontdoor_endpoint.name

}