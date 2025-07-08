variable "resource_group_name" {
  type = string
}

variable "location" {
  type    = string
  default = "East US"
}

variable "resource_group_name1" {
  type = string
}

variable "prefix" {
  type = string
}

variable "vm_size" {
  type = string
}

variable "admin_username" {
  type = string
}

variable "ssh_public_key" {
  type = string
}

variable "admin_password" {
  type = string
}

variable "sql_admin_username" {
  type = string
}

variable "sql_admin_password" {
  type = string
}

variable "sql_server_name" {
  type = string
}

variable "sql_database_name" {
  type = string
}
