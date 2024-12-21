resource "azurerm_ssh_public_key" "app-ssh-key-ts" {
  name                = "app-ssh-key-ts001"
  resource_group_name = azurerm_resource_group.app_rg.name
  location            = azurerm_resource_group.app_rg.location
  public_key = file("C:/Users/Tejas Sonone/.ssh/id_rsa.pub")
}