# Configure the Azure Provider
provider "azurerm" {
  # whilst the `version` attribute is optional, we recommend pinning to a given version of the Provider
  version = "= 2.17"
  features {}
}

terraform {
  backend "azurerm" {
    storage_account_name = "cloudazuretfstate"
    resource_group_name  = "tfstate"
    container_name       = "azuretfstate"
    key                  = "terraform.tfstate"
  }
}

resource "azurerm_resource_group" "group" {
  name     = "vms-group"
  location = "eastus"
}

module "virtual-network" {
  source              = "./modules/virtual-network"
  resource_group_name = azurerm_resource_group.group.name
  location            = azurerm_resource_group.group.location
}

module "network-security-group" {
  source              = "./modules/network-security-group"
  resource_group_name = azurerm_resource_group.group.name
  location            = azurerm_resource_group.group.location
}

module "application-gateway" {
  source               = "./modules/application-gateway"
  resource_group_name  = azurerm_resource_group.group.name
  location             = azurerm_resource_group.group.location
  virtual_network_name = module.virtual-network.virtual_network.name
  subnet_id            = module.virtual-network.public_subnet1.id
}

module "lb" {
  source              = "./modules/lb"
  resource_group_name = azurerm_resource_group.group.name
  location            = azurerm_resource_group.group.location
  subnet_id           = module.virtual-network.private_subnet1.id
}

module "scale-sets" {
  source                          = "./modules/scale-sets"
  resource_group_name             = azurerm_resource_group.group.name
  location                        = azurerm_resource_group.group.location
  subnet_id1                      = module.virtual-network.public_subnet1.id
  subnet_id2                      = module.virtual-network.public_subnet2.id
  subnets                         = module.virtual-network.subnets
  ag_backend_address_pool_id      = module.application-gateway.backend_address_pool
  lb_backend_address_pool_id      = module.lb.backend_address_pool
  network_security_group_back_id  = module.network-security-group.network_security_group_back.id
  network_security_group_front_id = module.network-security-group.network_security_group_front.id
}

module "bastion" {
  source              = "./modules/bastion"
  resource_group_name = azurerm_resource_group.group.name
  location            = azurerm_resource_group.group.location
  subnet_id           = module.virtual-network.bastion_subnet.id
}

module "database" {
  source              = "./modules/database"
  resource_group_name = azurerm_resource_group.group.name
  location            = azurerm_resource_group.group.location
}

