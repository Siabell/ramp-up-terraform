variable "location" {
  description = "The location region"
  type        = string
  default     = "eastus"
}

variable "mysql_server_name" {
  description = "The name of the mysqlserver"
  type        = string
  default     = "mysqlserver-ramup"
}

variable "mysql_database_name" {
  description = "The name of the mysql database"
  type        = string
  default     = "mysqldb"
}

variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "mysqlserver_administrator_login" {
  description = "Administration login for the mysql server"
  type        = string
}

variable "mysqlserver_administrator_login_password" {
  description = "Administration login password for the mysql server"
  type        = string
}