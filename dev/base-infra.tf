module "base_infra" {
  source = "../_modules/base-infrastructure"
  environment  = local.environment
  subnets      = local.subnets
  address_space = local.address_space
  resource_groups = local.resource_groups
  tags           = local.tags
}