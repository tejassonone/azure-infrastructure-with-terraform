
data "azurerm_subnet" "app-subnet-1" {
  name                 = "subnet-1"
  virtual_network_name = azurerm_virtual_network.app-network-ts.name
  resource_group_name  = azurerm_resource_group.app_rg.name
}


resource "azurerm_network_interface" "app-nic-ts" {
  name                = "app-nic-ts-001"
  location            = azurerm_resource_group.app_rg.location
  resource_group_name = azurerm_resource_group.app_rg.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = data.azurerm_subnet.app-subnet-1.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = azurerm_public_ip.app-ip-ts.id
  }

  depends_on = [ azurerm_virtual_network.app-network-ts, azurerm_public_ip.app-ip-ts ]
}



resource "azurerm_linux_virtual_machine" "app-linux-vm" {
  name                = "app-linux-vm-ts"
  resource_group_name = azurerm_resource_group.app_rg.name
  location            = azurerm_resource_group.app_rg.location
  size                = "Standard_F2"
  admin_username      = "adminuser"
  network_interface_ids = [
    azurerm_network_interface.app-nic-ts.id,
  ]

  admin_password      = "PasswordHere123!"
  disable_password_authentication = false



  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }

  depends_on = [ 
    azurerm_network_interface.app-nic-ts
   ]
}