/*
Description: Resource group.
*/

resource "azurerm_resource_group" "rg" {
 name = "$(var.product)-$(var.environment)-$(each.value)-rg-${module.globals.regions[var.location]}"
 location = module.globals.locations[var.location]
 tags  = var.tags

 lifecycle {
  ignore_changes  = [tags]
 }
}