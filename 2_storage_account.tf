
resource "azurerm_storage_account" "app-storage-ts" {
  name                     = "appstoragets149943"
  resource_group_name      = azurerm_resource_group.app_rg.name
  location                 = azurerm_resource_group.app_rg.location
  account_tier             = var.account_tier
  account_replication_type = var.account_replication_type

  tags = {
    environment = "staging"
  }
  
}


resource "azurerm_storage_container" "app-storage-container-ts" {
  name                  = "data-blob-ts"
  storage_account_id    = azurerm_storage_account.app-storage-ts.id
  container_access_type = "private"

  depends_on = [ azurerm_storage_account.app-storage-ts ]
}