module "network" {
  source           = "../_modules/base-infrastructure"
  resource_groups  = ["network"]
  location         = local.location
  address_space    = local.address_space
  subnets          = local.subnets
  environment      = local.environment
  product          = local.product
  tags             = local.tags
}
