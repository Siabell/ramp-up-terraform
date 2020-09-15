variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "location" {
  description = "The location region"
  type        = string
  default     = "eastus"
}

variable "subnet_id1" {
  description = "Subnet id"
  type        = string
}

variable "subnet_id2" {
  description = "Subnet id"
  type        = string
}

variable "subnets" {
  description = "Subnets of the vnet"
}

variable "ag_backend_address_pool_id" {
  description = " The id backend pool of the application gateway to asociate the virtual machines"
}

variable "lb_backend_address_pool_id" {
  description = " The id backend pool of the load balancer to asociate the virtual machines"
}

variable "network_security_group_back_id" {
  description = " The network security group to asociate the virtual machines"
}

variable "network_security_group_front_id" {
  description = " The network security group to asociate the virtual machines"
}
