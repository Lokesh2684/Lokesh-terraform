provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
}

resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

module "linux_vm" {
  source              = "./modules/linux_vm"
  vm_name             = "Loki_assignmnet_vm"
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
  subnet_id           = module.linux_vm_subnet_id
}

module "sql_server" {
  source              = "./modules/sql_server"
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
}

module "sql_database" {
  source   = "./modules/sql_database"
  server_id = module.sql_server_id
}
