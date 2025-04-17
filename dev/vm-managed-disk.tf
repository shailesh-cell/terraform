locals {
  number_of_disks = 1
}


resource "azurerm_network_interface" "windows-nic" {
  name                = "OKLOOKDEV03-nic"
  location            = module.globals.locations["primary"]
  resource_group_name = "${local.product}-${local.environment}-vm-${module.globals.regions["primary"]}-rg"


  ip_configuration {
    name                          = "internal"
    subnet_id                     = module.base_infra.subnet_ids["vm"]
    private_ip_address_allocation = "Dynamic"
  }

  tags = local.tags
}

resource "azurerm_windows_virtual_machine" "windows-vm-1" {
 name = "OKLOOKDEV03"
 resource_group_name = "${local.product}-${local.environment}-vm-${module.globals.regions["primary"]}-rg"
 location = module.globals.locations["primary"]
 size = "Standard_F2"
 admin_username = "adminuser"
 admin_password      = "P@$$w0rd1234!"
 network_interface_ids = [azurerm_network_interface.linux-nic.id]
 os_disk {
 caching = "ReadWrite"
 storage_account_type = "StandardSSD_LRS"
 }

source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter"
    version   = "latest"
  }

tags = local.tags
}


resource "azurerm_managed_disk" "managed-disk" {
  count                = local.number_of_disks
  name                 = "OKLOOKDEV03-disk1"
  location             = module.globals.locations["primary"]
  resource_group_name  = "${local.product}-${local.environment}-vm-${module.globals.regions["primary"]}-rg"
  storage_account_type = "Standard_LRS"
  create_option        = "Empty"
  disk_size_gb         = 10
}

resource "azurerm_virtual_machine_data_disk_attachment" "attach-managed-disk" {
  count              = local.number_of_disks
  managed_disk_id    = azurerm_managed_disk.managed-disk.*.id[count.index]
  virtual_machine_id = azurerm_windows_virtual_machine.windows-vm-1.id
  lun                = 10 + count.index
  caching            = "ReadWrite"
}
