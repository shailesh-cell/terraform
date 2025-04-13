module "base_infra" {
  source   = "../_modules/base-infrastructure"
  resource_groups = ["{local.product}-${local.environment}-${rg}-${module.globals.regions["primary"]}-rg"]
  environment = local.environment
  location    = "primary"
  product    = local.product
  tags     = local.tags
}