module "resourcegroup" {
  source = "../_modules/base-infrastructure"

  resource_groups = local.resource_groups
  product         = var.product
  environment     = var.environment
  location        = var.location
}