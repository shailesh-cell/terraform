variable "windows_vm_size" {
 description = "The windows vm size. Ex: dev, qa, stage, nonprod, or prod."
 type = string
 default = "Standard_F2"
 validation {
   condition   = var.windows_vm_size  == "Standard_F2"  || var.windows_vm_size == "qa" || var.windows_vm_size == "stage" || var.windows_vm_size == "nonprod" || var.windows_vm_size == "prod"
   error_message = "The variable size should be Standard_F2."
 }

variable "nic_id" {
  description = "ID of the Network Interface"
  type        = string
}

variable "admin_username" {
  description = "Admin username for the Virtual Machine"
  type        = string
  default     = "adminuser"
}

variable "admin_password" {
  description = "Admin password for the Virtual Machine"
  type        = string
  sensitive   = true
  default     = "P@$$w0rd1234!"
}