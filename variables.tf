variable "mysqlserver_administrator_login" {
  description = "Administration login for the mysql server"
  type        = string
}

variable "mysqlserver_administrator_login_password" {
  description = "Administration login password for the mysql server"
  type        = string
}

variable "scaleset_admin_username_front" {
  description = "Admin username for the frontend scaleset machines"
  type        = string
}

variable "scaleset_admin_password_front" {
  description = "Admin password for the frontend scaleset machines"
  type        = string
}

variable "scaleset_admin_username_back" {
  description = "Admin username for the backend scaleset machines"
  type        = string
}

variable "scaleset_admin_password_back" {
  description = "Admin password for the backend scaleset machines"
  type        = string
}