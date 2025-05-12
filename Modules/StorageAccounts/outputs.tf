output "storage_account_name" {
  description = "The name of the storage account."
  value       = azurerm_storage_account.storage_account.name
}

output "storage_primary_blob_endpoint" {
  description = "The primary blob endpoint of the storage account."
  value       = azurerm_storage_account.storage_account.primary_blob_endpoint
}

output "storage_static_website_url" {
  description = "The URL of the static website hosted on the storage account."
  value       = azurerm_storage_account.storage_account.primary_web_endpoint
}

output "storage_account_id" {
  description = "The ID of the storage account."
  value       = azurerm_storage_account.storage_account.id
}

output "primary_web_host" {
  description = "The primary web host name of the storage account."
  value       = azurerm_storage_account.storage_account.primary_web_host
  
}