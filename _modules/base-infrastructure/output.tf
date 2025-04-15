output "resource_group"  {
 value = azurerm_resource_group.rg
}

output "subnet"  {
 value = azurerm_subnet.subnet
}

output "vnet"  {
 value = azurerm_virtual_network.vnet
}

output "subnet_id" {
  value = azurerm_subnet.subnet.id
}


