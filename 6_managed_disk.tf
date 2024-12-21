resource "azurerm_managed_disk" "app-managed-disk-ts" {
  name                 = "app-managed-disk-ts001"
  location             = azurerm_resource_group.app_rg.location
  resource_group_name  = azurerm_resource_group.app_rg.name
  storage_account_type = "Standard_LRS"
  create_option        = "Empty"
  disk_size_gb         = "32"
}