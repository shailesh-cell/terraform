#output "windows_vm_id" {
#  description = "The ID of the Virtual Machine"
#  value       = azurerm.windows.virtual_machine_windows_vm.id
#}

output "vm_name" {
  description = "Name of the virtual machine"
  value       = var.vm_name
}
