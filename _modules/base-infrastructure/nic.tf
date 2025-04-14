resource "azurerm_network_interface" "nic" {
  for_each            = var.subnets
  name                = each.key
  location            = module.globals.locations[var.location]
  resource_group_name = azurerm_resource_group.rg["vm"].name
  tags  = var.tags
  
  ip_configuration {
    name                          = "ip-conf"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
  }
 lifecycle {
  ignore_changes  = [tags]
 }
}