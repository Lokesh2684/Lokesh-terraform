provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "main" {
  name     = var.resource_group_name
  location = var.location
}

module "sql_server" {
  source              = "./modules/sql_server"
  resource_group_name = var.resource_group_name
  location            = var.location
  sql_admin_username  = var.sql_admin_username       
  sql_admin_password  = var.sql_admin_password
  server_name         = var.sql_server_name          
}

module "sql_database" {
  source              = "./modules/sql_database"
  resource_group_name = azurerm_resource_group.main.name
  location            = var.location
  server_name         = module.sql_server.name
  database_name       = var.sql_database_name
}

module "linux_vm" {
  source              = "./modules/linux_vm"
  count               = 2
  resource_group_name = var.resource_group_name
  location            = var.location
  vm_name             = "${var.prefix}-vm-${count.index}"
  admin_username      = var.vm_admin_username       # <-- match tfvars
  admin_password      = var.vm_admin_password
  ssh_public_key      = var.ssh_public_key
  vm_size             = var.vm_size
}


