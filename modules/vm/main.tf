 terraform {
    required_version = ">=0.12"
}

resource "azurerm_network_interface" "nivm1" {
  name                = var.network_interface_name
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "vmconfigurationip1"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
  }
}


# Create a virtual machine within the resource group
resource "azurerm_linux_virtual_machine" "vm1" {
  name                  = var.virtual_machine_name
  location              = var.resource_group_location
  resource_group_name   = var.resource_group_name
  network_interface_ids = ["${azurerm_network_interface.nivm1.id}"]
  size                  = "Standard_F2"
  zone                  = var.availability_zone
  admin_username        = "adminuser"
  admin_password        = "AdminU$er1"
  disable_password_authentication = "false" 

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }
  #admin_ssh_key {
  #  username   = "adminuser"
  #  public_key = file("~/.ssh/id_rsa.pub")
  #}
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
}

resource "azurerm_network_interface_backend_address_pool_association" "poolAsociation" {
  network_interface_id    = azurerm_network_interface.nivm1.id
  ip_configuration_name   = "vmconfigurationip1"
  backend_address_pool_id = var.lb_backend_address_pool_id
}

