data "azurerm_client_config" "current" {}

resource "azurerm_key_vault" "app-valut-ts" {
  name                        = "app-key-valut-ts001"
  location                    = azurerm_resource_group.app_rg.location
  resource_group_name         = azurerm_resource_group.app_rg.name
  enabled_for_disk_encryption = true
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = 7
  purge_protection_enabled    = false

  sku_name = "standard"

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    key_permissions = [
      "Get",
    ]

    secret_permissions = [
      "Get",
      "List",
      "Set",
    ]

    storage_permissions = [
      "Get",
    ]
  }

  depends_on = [ azurerm_resource_group.app_rg ]
}


resource "azurerm_key_vault_secret" "vmpassword" {
  name         = "app-vmpassword-ts001"
  value        = "VMPassword@123"
  key_vault_id = azurerm_key_vault.app-valut-ts.id

  depends_on = [ azurerm_key_vault.app-valut-ts ]
}