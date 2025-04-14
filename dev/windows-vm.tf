module "windows_vm" {
  source   = "../_modules/base-infrastructure"
  resource_groups = ["vm"]
  environment = local.environment
  location    = "primary"
  product    = local.product
  address_space = local.address_space
  tags     = local.tags
}