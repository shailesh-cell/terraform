output "resource_group"  {
 value = azurerm_resource_group.rg
}

output "subnet"  {
 value = azurerm_subnet.subnet
}

output "vnet"  {
 value = azurerm_virtual_network.vnet
}

output "subnet_ids" {
  value = {
    for k, s in azurerm_subnet.subnet : k => s.id
  }
}

output "network_rg_name" {
  value = azurerm_resource_group.rg["network"].name
}


