provider "azurerm" {
  features {}
}

module "globals" {
  source = "../_modules/global-variables"
}

module "base_infra" {
  source   = "../_modules/base-infrastructure"
  for_each = toset(local.resource_groups)
  resource_groups = "$(var.product)-$(var.environment)-$(each.value)-rg-${module.globals.regions[primary]}"
  environment = local.environment
  location    = local.location
  tags     = local.tags
}