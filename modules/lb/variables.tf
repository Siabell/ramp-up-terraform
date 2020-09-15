variable "location" {
  description = "The location region"
  type        = string
  default     = "eastus"
}

variable "publicip_lb_name" {
  description = "The name of public ip for the load balancer"
  type        = string
  default     = "publicipLb"
}

variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "lb_name" {
  description = "The name of the load balancer"
  type        = string
  default     = "lb"
}

variable "subnet_id" {
  description = "The subnet id to associate the load balancer"
  type        = string
}


