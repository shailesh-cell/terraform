resource "azurerm_linux_virtual_machine" "linux_vm" {
 name = "OKLOOKDEV01"
 resource_group_name = "${local.product}-${local.environment}-vm-${module.globals.regions["primary"]}"
 location = module.globals.locations["primary"]
 size = "Standard_E2as_v4"
 admin_username = "linuxuser"
 network_interface_ids = module.base_infra.nic_id
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
  