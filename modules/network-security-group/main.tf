resource "azurerm_network_security_group" "nsg_back" {
  name                = "securityGroupBack"
  location            = var.location
  resource_group_name = var.resource_group_name
}

resource "azurerm_network_security_rule" "back_http" {
  name = "http-rule"

  resource_group_name         = var.resource_group_name
  network_security_group_name = azurerm_network_security_group.nsg_back.name

  priority                   = 100
  direction                  = "Inbound"
  access                     = "Allow"
  protocol                   = "Tcp"
  source_port_range          = "*"
  destination_port_range     = "80"
  source_address_prefix      = "*"
  destination_address_prefix = "*"
}

resource "azurerm_network_security_group" "nsg_front" {
  name                = "securityGroupFront"
  location            = var.location
  resource_group_name = var.resource_group_name
}

resource "azurerm_network_security_rule" "front_http" {
  name = "http-rule"

  resource_group_name         = var.resource_group_name
  network_security_group_name = azurerm_network_security_group.nsg_front.name

  priority                   = 100
  direction                  = "Inbound"
  access                     = "Allow"
  protocol                   = "Tcp"
  source_port_range          = "*"
  destination_port_range     = "80"
  source_address_prefix      = "*"
  destination_address_prefix = "*"
}