#output "windows_vm_id" {
#  description = "The ID of the Virtual Machine"
#  value       = azurerm.windows.virtual_machine_windows_vm.id
#}

output "windows_vm_name" {
  value = azurerm_windows_virtual_machine.windows_vm.name
}
