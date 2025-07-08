terraform {
  backend "azurerm" {
    resource_group_name   = "Lokesh-RSG-1"
    storage_account_name  = "lokeshstorageacr"
    container_name        = "tfstate"
    key                   = "prod.terraform.tfstate"
  }
}
