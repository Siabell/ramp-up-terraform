variable "network_interface_name" {
  description = "The name of the network interface"
  type        = string
  default     = "networkInterface"
}

variable "resource_group_location" {
  description = " The location of the resource group"
  type        = string
}

variable "resource_group_name" {
  description = " The name of the resource group"
  type        = string
}

variable "subnet_id" {
  description = " The name of the resource group"
  type        = string
}

variable "virtual_machine_name" {
  description = "The name of the virtual machine"
  type        = string
  default     = "virtualMachine"
}

variable "lb_backend_address_pool_id" {
  description = " The id backend pool to asociate the virtual machine"
  type        = string
}

variable "availability_zone" {
  description = " The availability zone to place the virtual machine"
  type        = string
}

