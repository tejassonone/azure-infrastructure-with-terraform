resource "azurerm_public_ip" "app-ip-ts" {
  name                = "app-ip-ts-001"
  resource_group_name = azurerm_resource_group.app_rg.name
  location            = azurerm_resource_group.app_rg.location
  allocation_method   = "Static"
}