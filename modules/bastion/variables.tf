variable "subnet_id" {
  description = "the Subnet id to associate the bastion"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "location" {
  description = "The location region"
  type        = string
  default     = "eastus"
}