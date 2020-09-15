variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "location" {
  description = "The location region"
  type        = string
  default     = "eastus"
}

variable "subnet_id" {
  description = "Subnet id"
  type        = string
}

variable "virtual_network_name" {
  description = "Virtual network name"
  type        = string
}