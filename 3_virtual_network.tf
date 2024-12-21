

# resource "azurerm_network_security_group" "example" {
#   name                = "example-security-group"
#   location            = azurerm_resource_group.example.location
#   resource_group_name = azurerm_resource_group.example.name
# }

resource "azurerm_virtual_network" "app-network-ts" {
  name                = "app-network-ts001"
  location            = azurerm_resource_group.app_rg.location
  resource_group_name = azurerm_resource_group.app_rg.name
  address_space       = ["10.0.0.0/16"]

  subnet {
    name             = "subnet-1"
    address_prefixes = ["10.0.1.0/24"]
  }

  subnet {
    name             = "subnet-2"
    address_prefixes = ["10.0.2.0/24"]
  }
  depends_on = [ azurerm_resource_group.app_rg ]
}