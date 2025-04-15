module "windows_vm" {
  source   = "../_modules/windows-virtual-machine"
  environment  = local.environment
  subnets      = local.subnets
  address_space = local.address_space
  resource_groups = ["vm"]
  tags           = local.tags
  nic_id         = azurerm_network_interface.nic.id
}

