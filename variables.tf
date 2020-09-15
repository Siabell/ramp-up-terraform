/*variable "vms_list" {
  description = "The list of vms with its configuration"
  default = [
    {
      name   = "vm1Frontend"
      subnet = module.virtual-network.publicSubnet1.id
      backendPool = module.lb.lbBackendPool.id
      zone   = "1"
    },
    {
      name   = "vm2Frontend"
      subnet = module.virtual-network.publicSubnet2.id
      backendPool = module.lb.lbBackendPool.id
      zone   = "2"
    },
  ]
}*/