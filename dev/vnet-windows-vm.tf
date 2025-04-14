module "windows_vm_vnet" {
  source   = "../_modules/base-infrastructure"
  resource_groups = ["network"]
  environment = local.environment
  location    = "primary"
  product    = local.product
  address_space = local.address_space
  subnets        = local.subnets
  tags     = local.tags
}

