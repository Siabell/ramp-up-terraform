output "network_security_group_back" {
  value = azurerm_network_security_group.nsg_back
}

output "network_security_group_front" {
  value = azurerm_network_security_group.nsg_front
}
