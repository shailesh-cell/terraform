module "windows_vm" {
  source   = "../_modules/windows-virtual-machine"
  resource_groups = ["vm"]
  environment = local.environment
  location    = "primary"
  product    = local.product
  address_space = local.address_space
  subnets        = local.subnets
  tags     = local.tags
}

