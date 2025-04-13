module "base_infra" {
  source   = "../_modules/base-infrastructure"
  resource_groups = ["data"]
  environment = local.environment
  location    = "primary"
  product    = local.product
  tags     = local.tags
}