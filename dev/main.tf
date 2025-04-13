module "base_infra" {
  source   = "../_modules/base-infrastructure"
  resource_groups = "{local.product}-${local.environment}-data-rg-${module.globals.regions["primary"]}"
  environment = local.environment
  location    = "primary"
  product    = local.product
  tags     = local.tags
}