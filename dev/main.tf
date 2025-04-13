provider "azurerm" {
  features {}
}

module "global_vars" {
  source      = "../_modules/global-variables"
  environment = local.environment
  location    = local.location
}

module "base_infra" {
  source   = "../_modules/base-infrastructure"
  for_each = toset(local.resource_groups)
}