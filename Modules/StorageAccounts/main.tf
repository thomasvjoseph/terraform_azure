resource "azurerm_storage_account" "storage_account" {
  name                            = var.storage_account_name
  resource_group_name             = var.resource_group_name
  location                        = var.location
  account_tier                    = var.account_tier
  account_replication_type        = var.account_replication_type
  account_kind                    = var.account_kind #static_website can only be set when the account_kind is set to StorageV2 or BlockBlobStorage.
  shared_access_key_enabled       = false
  default_to_oauth_authentication = true #default_to_oauth_authentication is only available when the account_kind is set to StorageV2 or BlockBlobStorage.

  infrastructure_encryption_enabled = true
  routing {
    publish_microsoft_endpoints = true
  }
  tags = var.tags
 

 /*   dynamic "network_rules" {
     for_each = try(var.network_rules, null) != null ? [var.network_rules] : []
     content {
       default_action             = network_rules.value.default_action
       ip_rules                   = network_rules.value.ip_rules
       virtual_network_subnet_ids = network_rules.value.virtual_network_subnet_ids
     }
   }  tags = var.tags */
}
/* 
resource "azurerm_storage_container" "storage_container" { 
  name                  = var.container_name
  storage_account_id    = azurerm_storage_account.storage_account.id
  container_access_type = "container"
}

resource "azurerm_storage_blob" "storage_blob" {
  name                   = "my-awesome-content.zip"
  storage_account_name   = azurerm_storage_account.storage_account.name
  storage_container_name = azurerm_storage_container.storage_container.name
  type                   = "Block"
  source                 = "some-local-file.zip"
} */
resource "azurerm_storage_account_static_website" "test" {
  storage_account_id = azurerm_storage_account.storage_account.id
  error_404_document = "custom_not_found.html"
  index_document     = "index.html"
}
resource "azurerm_role_assignment" "storage_blob_contributor" {
  scope                = azurerm_storage_account.storage_account.id
  role_definition_name = "Storage Blob Data Contributor"
  principal_id         = var.terraform_identity_id
}