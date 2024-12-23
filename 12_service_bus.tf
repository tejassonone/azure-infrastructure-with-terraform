resource "azurerm_servicebus_namespace" "app-servicebus-ts" {
  name                = "app-servicebus-namespace-ts001"
  location            = azurerm_resource_group.app_rg.location
  resource_group_name = azurerm_resource_group.app_rg.name
  sku                 = "Standard"
}

resource "azurerm_servicebus_queue" "app-queue-1" {
  name         = "app_servicebus_queue-1"
  namespace_id = azurerm_servicebus_namespace.app-servicebus-ts.id

  partitioning_enabled = true
}