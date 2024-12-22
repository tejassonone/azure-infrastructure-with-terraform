resource "azurerm_virtual_network" "app-vnet-2" {
  name                = "app-vnet-ts002"
  address_space       = ["192.168.0.0/24"]
  location            = azurerm_resource_group.app_rg.location
  resource_group_name = azurerm_resource_group.app_rg.name
}

resource "azurerm_subnet" "subnet-bastian" {
  name                 = "AzureBastionSubnet"
  resource_group_name  = azurerm_resource_group.app_rg.name
  virtual_network_name = azurerm_virtual_network.app-vnet-2.name
  address_prefixes     = ["192.168.0.224/27"]
}

resource "azurerm_public_ip" "bastian-ip-ts" {
  name                = "bastian-ip-ts001"
  location            = azurerm_resource_group.app_rg.location
  resource_group_name = azurerm_resource_group.app_rg.name
  allocation_method   = "Static"
  sku                 = "Standard"
}

resource "azurerm_bastion_host" "app-bastian-host-ts" {
  name                = "bastian-host-ts001"
  location            = azurerm_resource_group.app_rg.location
  resource_group_name = azurerm_resource_group.app_rg.name

  ip_configuration {
    name                 = "configuration"
    subnet_id            = azurerm_subnet.subnet-bastian.id
    public_ip_address_id = azurerm_public_ip.bastian-ip-ts.id
  }
}



