/*
Description: Base Monitoring module.
*/

module "globals"  {
  source = "../global-variables"

data "azurerm_subscription" "subscription" {}