module "windows_vm" {
  source   = "../_modules/base-infrastructure"
  resource_groups = ["vm"]
  environment = local.environment
  location    = "primary"
  product    = local.product
  windows_vm_size  = var.windows_vm_size
  nic_id          = var.nic_id
  admin_username  = "adminuser"
  admin_password  = ""P@$$w0rd1234!""
  tags     = local.tags
}