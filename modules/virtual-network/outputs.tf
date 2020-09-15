output "public_subnet1" {
    value = azurerm_subnet.subnets["public1"]
    description = "The public subnet 1"
}

output "public_subnet2" {
    value = azurerm_subnet.subnets["public2"]
    description = "The public subnet 2"
}

output "private_subnet1" {
    value = azurerm_subnet.subnets["private1"]
    description = "The private subnet 1"
}

output "private_subnet2" {
    value = azurerm_subnet.subnets["private2"]
    description = "The private subnet 2"
}

output "bastion_subnet" {
    value = azurerm_subnet.subnets["AzureBastionSubnet"]
    description = "The Azure Bastion Subnet "
}

output "virtual_network" {
    value = azurerm_virtual_network.vnet
    description = "Virtual Network"
}

output "subnets" {
    value = azurerm_subnet.subnets
    description = "The subnets of the virtual network "
}
