/*
Description: Resource group.
*/

resource "azurerm_resource_group" "rg" {
 name = "${var.product}-${var.environment}-rg"
 location = module.globals.locations[var.location]
 tags  = var.tags

 lifecycle {
  ignore_changes  = [tags]
 }
}