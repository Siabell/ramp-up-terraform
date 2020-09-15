# Create a virtual network within the resource group
resource "azurerm_virtual_network" "vnet" {
  name                = "virtual-network"
  resource_group_name = var.resource_group_name
  location            = var.location
  address_space       = ["10.0.0.0/16"]
}

variable "subnets_list" {
  description = "The list of subnets with its configuration"
  default = [
    {
      name   = "public1"
      number = ["10.0.1.0/24"]
    },
    {
      name   = "public2"
      number = ["10.0.2.0/24"]
    },
    {
      name   = "private1"
      number = ["10.0.3.0/24"]
    },
    {
      name   = "private2"
      number = ["10.0.4.0/24"]
    },
    {
      name   = "AzureBastionSubnet"
      number = ["10.0.5.0/27"]
    }
  ]
}

resource "azurerm_subnet" "subnets" {
  for_each             = {for n in var.subnets_list : n.name => n} 
  name                 = each.value.name
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = each.value.number
}