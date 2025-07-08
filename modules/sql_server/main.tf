resource "azurerm_mssql_server" "sql_server" {
  name                         = var.server_name
  resource_group_name          = var.resource_group_name
  location                     = var.location
  version                      = "12.0"
  administrator_login          = var.sql_admin_username
  administrator_login_password = var.sql_admin_password

  identity {
    type = "SystemAssigned"
  }
}

output "name" {
  value = azurerm_mssql_server.sql_server.name
}

output "sql_server_id" {
  value = azurerm_mssql_server.sql_server.id
}
