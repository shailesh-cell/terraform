resource "azurerm_linux_virtual_machine" "linux_vm" {
 name = "OKLOOKDEV01"
 resource_group_name = "${local.product}-${local.environment}-vm-${module.globals.regions["primary"]}-rg"
 location = module.globals.locations["primary"]
 size = "Standard_E2as_v4"
 admin_username = "linuxuser"
 network_interface_ids = [module.base_infra.nic_id]
 os_disk {
 caching = "ReadWrite"
 storage_account_type = "StandardSSD_LRS"
 disk_size_gb = 30
 }

   admin_ssh_key {
    username   = "adminuser"
    public_key = file("${path.module}/id_rsa.pub")
  }

source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}

######################################################################################################################


resource "azurerm_network_interface" "linux-nic" {
  name                = "linux-nic"
  location            = module.globals.locations["primary"]
  resource_group_name = "${local.product}-${local.environment}-vm-${module.globals.regions["primary"]}-rg"


  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_linux_virtual_machine" "linux_vm-1" {
 name = "OKLOOKDEV02"
 resource_group_name = "${local.product}-${local.environment}-vm-${module.globals.regions["primary"]}-rg"
 location = module.globals.locations["primary"]
 size = "Standard_E2as_v4"
 admin_username = "linuxuser"
 network_interface_ids = [azurerm_network_interface.linux-nic.id,]
 os_disk {
 caching = "ReadWrite"
 storage_account_type = "StandardSSD_LRS"
 disk_size_gb = 30
 }

   admin_ssh_key {
    username   = "adminuser"
    public_key = file("${path.module}/id_rsa.pub")
  }

source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}
