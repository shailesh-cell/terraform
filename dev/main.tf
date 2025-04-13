provider "azurerm" {
  features {}
}

module "globals" {
  source = "../_modules/global-variables"
}

module "base_infra" {
  source   = "../_modules/base-infrastructure"
  resource_groups = "$(var.product)-$(var.environment)-rg-${module.globals.regions["primary"]}"
  environment = local.environment
  location    = local.location
  tags     = local.tags
}