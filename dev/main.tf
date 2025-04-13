module "base_infra" {
  source   = "../_modules/base-infrastructure"
  resource_groups = [
  for rg in local.resource_groups :
  "${local.product}-${local.environment}-data-${module.globals.regions[local.location]}-rg"
]

  environment = local.environment
  location    = "primary"
  product    = local.product
  tags     = local.tags
}