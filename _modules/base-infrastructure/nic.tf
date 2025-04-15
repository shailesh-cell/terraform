resource "azurerm_network_interface" "nic" {
  name                = "azurerm.windows.virtual_machine_windows_vm.name-nic"
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