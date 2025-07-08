provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

module "linux_vm" {
  source              = "./modules/linux_vm"
  prefix              = var.prefix
  location            = var.location
  resource_group_name = var.resource_group_name
  vm_size             = var.vm_size
  admin_username      = var.vm_admin_username
  admin_password      = var.vm_admin_password
}

module "sql_server" {
  source                = "./modules/sql_server"
  resource_group_name   = var.resource_group_name
  location              = var.location
  sql_admin_username    = var.sql_admin_username
  sql_admin_password    = var.sql_admin_password
  sql_server_name       = var.sql_server_name
}

module "sql_database" {
  source              = "./modules/sql_database"
  server_id           = module.sql_server.sql_server_id
  sql_database_name   = var.sql_database_name
}
