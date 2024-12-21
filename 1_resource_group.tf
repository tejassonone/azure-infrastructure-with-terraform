
locals {
    resource_group_name = "app-rgci-ts"
    location = "South India"
}

resource "azurerm_resource_group" "app_rg" {
    name = local.resource_group_name
    location = local.location
}