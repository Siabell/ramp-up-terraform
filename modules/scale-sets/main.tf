resource "azurerm_linux_virtual_machine_scale_set" "vmscaleset1" {
  name                            = "vmssFrontEnd"
  resource_group_name             = var.resource_group_name
  location                        = var.location
  sku                             = "Standard_F2"
  instances                       = 2
  admin_username                  = var.scaleset_admin_username_front
  admin_password                  = var.scaleset_admin_password_front
  disable_password_authentication = false
  zones                           = [1, 2]
  
  zone_balance                    = true

  /*admin_ssh_key {
    username   = "adminuser"
    public_key = file("~/.ssh/id_rsa.pub")
  }*/

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }

  os_disk {
    storage_account_type = "Standard_LRS"
    caching              = "ReadWrite"
  }

  network_interface {
    name                       = "example"
    primary                    = true
    network_security_group_id  = var.network_security_group_front_id

    ip_configuration {
      name      = "public2"
      primary   = true
      subnet_id = var.subnet_id2
      application_gateway_backend_address_pool_ids = var.ag_backend_address_pool_id
    }
  }
}


resource "azurerm_linux_virtual_machine_scale_set" "vmscaleset2" {
  name                            = "vmssBackEnd"
  resource_group_name             = var.resource_group_name
  location                        = var.location
  sku                             = "Standard_F2"
  instances                       = 2
  admin_username                  = var.scaleset_admin_username_back
  admin_password                  = var.scaleset_admin_password_back
  disable_password_authentication = false
  zones                           = [1, 2]
  zone_balance                    = true

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }

  os_disk {
    storage_account_type = "Standard_LRS"
    caching              = "ReadWrite"
  }

  network_interface {
    name                      = "example"
    primary                   = true
    network_security_group_id = var.network_security_group_back_id

    ip_configuration {
      name                                   = "private1"
      primary                                = true
      subnet_id                              = var.subnet_id2
      load_balancer_backend_address_pool_ids = var.lb_backend_address_pool_id

    }/*
    public_ip_address_configuration {
        name              = "testvmss"
        idle_timeout      = 30
        domain_name_label = "testvmss"
      }*/
  }
}