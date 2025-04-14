resource "azurerm_virtual_network" "vnet" {
  name                = "${var.product}-${var.environment}-vnet-${module.globals.regions[var.location]}"
  address_space       = split(",", var.address_space)
  location            = module.globals.locations[var.location]
  resource_group_name = azurerm_resource_group.rg["network"].name
  tags  = var.tags

 lifecycle {
  ignore_changes  = [tags]
 }
}

resource "azurerm_subnet" "subnet" {
  for_each            = var.subnets
  name                = each.key
  resource_group_name = azurerm_resource_group.rg["network"].name
  virtual_network_name= azurerm_virtual_network.vnet.name
  address_prefixes    = [each.value]
}

resource "azurerm_network_interface" "nic" {
  for_each            = var.subnets
  name                = each.key
  location            = module.globals.locations[var.location]
  resource_group_name = azurerm_resource_group.rg["network"].name
  tags  = var.tags
  
  ip_configuration {
    name                          = "ip-conf"
    subnet_id                     = azurerm_subnet.subnet["vm"].id
    private_ip_address_allocation = "Dynamic"
  }
 lifecycle {
  ignore_changes  = [tags]
 }
}