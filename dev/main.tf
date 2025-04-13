provider "azurerm" {
  features {}
}

module "global_vars" {
  source      = "../main_modules/global-variables"
  environment = local.environment
  location    = local.location
}

module "base_infra" {
  source   = "../main_modules/base-infrastructure"
  for_each = toset(local.resource_groups)