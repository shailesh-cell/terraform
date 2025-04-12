resource "azurerm_automation_account" "aa"
 name   = "${local.product}-${local.environment}-aa-${module.globals.regions["primary"]}"
 resource_group_name  = "${local.product}-${local.environment}-data-rg-${module.globals.regions["primary"]}"
location              = module.globals.locagtion["primary"]
sku_name              = "Basic"
identity {
 type = "SystemAssigned"
}
tags = local.tags
lifecycle {
  ignore_chnages = [tags]
}
}
