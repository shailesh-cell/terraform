resource "azurerm_windows_virtual_machine" "windows_vm" {
  name                = "${var.product}-${var.environment}-${module.globals.regions[var.location]}-vm"
  resource_group_name = ${var.product}-${var.environment}-${each.value}-${module.globals.regions[var.location]}-rg"
  location            = module.globals.locations[var.location]
  size                = var.windows_vm_size
  admin_username      = var.admin_username #"adminuser"
  admin_password      = var.admin_password #"P@$$w0rd1234!"
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
}