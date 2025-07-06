data "azurerm_mssql_server" "sql" {
  name                = var.server_name
  resource_group_name = var.resource_group_name
}

resource "azurerm_mssql_database" "db" {
  name      = var.database_name
  server_id = data.azurerm_mssql_server.sql.id
  sku_name  = "Basic"
}
 