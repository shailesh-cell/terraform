/*
Description: Resource group.
*/

resource "azurerm_resource_group" "rg" {
 for_each  = toset(var.resource_groups)
 name = "${var.product}-${var.environment}-${each.value}-${module.globals.regions[var.location]}-rg"
 location = module.globals.locations[var.location]
 tags  = var.tags

 lifecycle {
  ignore_changes  = [tags]
 }
}