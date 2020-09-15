output "backend_address_pool" {
    value = "${azurerm_lb_backend_address_pool.lbBackendPool[*].id}"
    description = "The backend pool of the load balancer"
}