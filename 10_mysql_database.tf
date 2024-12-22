

resource "azurerm_mysql_flexible_server" "app-mysqlserver-ts" {
  name                   = "app-mysqlserver-ts001"
  resource_group_name    = azurerm_resource_group.app_rg.name
  location               = azurerm_resource_group.app_rg.location
  administrator_login    = "mysqladmin"
  administrator_password = "Pass@123"
  backup_retention_days  = 7
  sku_name               = "GP_Standard_D2ds_v4"

  depends_on = [ azurerm_resource_group.app_rg]
}


resource "azurerm_mysql_flexible_database" "app-mysqldb-ts" {
  name                = "app-mysqldb-ts001"
  resource_group_name = azurerm_resource_group.app_rg.name
  server_name         = azurerm_mysql_flexible_server.app-mysqlserver-ts.name
  charset             = "utf8mb4"
  collation           = "utf8mb4_general_ci"

  depends_on = [ azurerm_mysql_flexible_server.app-mysqlserver-ts ]
}