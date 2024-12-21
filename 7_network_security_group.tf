
resource "azurerm_network_security_group" "app-nsg-ts" {
  name                = "app-nsg-ts001"
  location            = azurerm_resource_group.app_rg.location
  resource_group_name = azurerm_resource_group.app_rg.name

  security_rule {
    name                       = "ALLOW_HTTP"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "80"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

}


resource "azurerm_subnet_network_security_group_association" "app-nsg-association" {
  subnet_id                 = data.azurerm_subnet.app-subnet-1.id
  network_security_group_id = azurerm_network_security_group.app-nsg-ts.id

  depends_on = [ azurerm_network_security_group.app-nsg-ts ]
}