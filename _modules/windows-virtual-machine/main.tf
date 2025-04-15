module "globals" {
  source = "../global-variables"
}

resource "azurerm_windows_virtual_machine" "windows_vm" {
  name                = "${var.product}-${var.environment}-${module.globals.regions[var.location]}-vm"
  resource_group_name = "${var.product}-${var.environment}-vm-${module.globals.regions[var.location]}-rg"
  location            = module.globals.locations[var.location]
  size                = var.windows_vm_size
  admin_username      = var.admin_username
  admin_password      = var.admin_password
  network_interface_ids = [var.nic_id]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter"
    version   = "latest"
  }
identity {
type = "SystemAssigned"
}
tags = var.tags

lifecycle {
ignore_changes = [
tags]
}
}