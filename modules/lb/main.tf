# Public ip for the load balancer
resource "azurerm_public_ip" "publicIp" {
  name                = var.publicip_lb_name
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Static"
  # necessary for zone redundan lb
  sku                 = "Standard"
}

# Load Balancer
resource "azurerm_lb" "lb" {
  name                = var.lb_name
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = "Standard"

  frontend_ip_configuration {
    name      = "privateIPAddress"
    public_ip_address_id = azurerm_public_ip.publicIp.id
  }
}

resource "azurerm_lb_backend_address_pool" "lbBackendPool" {
  resource_group_name = var.resource_group_name
  loadbalancer_id     = azurerm_lb.lb.id
  name                = "BackEndAddressPool"
}

resource "azurerm_lb_probe" "lbProbe" {
  resource_group_name = var.resource_group_name
  loadbalancer_id     = azurerm_lb.lb.id
  name                = "HTTP-running-probe"
  protocol            = "Tcp"
  port                = 80
}

resource "azurerm_lb_rule" "lbRule" {
  resource_group_name            = var.resource_group_name
  loadbalancer_id                = azurerm_lb.lb.id
  name                           = "LBRule"
  protocol                       = "Tcp"
  frontend_port                  = 80
  backend_port                   = 80
  frontend_ip_configuration_name = "privateIPAddress"
  backend_address_pool_id        = azurerm_lb_backend_address_pool.lbBackendPool.id
  probe_id                       = azurerm_lb_probe.lbProbe.id
}