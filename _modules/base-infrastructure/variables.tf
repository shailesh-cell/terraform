variable "address_space" {
  description = "The address space for the vnet."
  type = string
}

variable "environment" {
 description = "The environment name. Ex: dev, qa, stage, nonprod, or prod."
 type = string
 validation {
   condition   = var.environment  == "dev"  || var.environment == "qa" || var.environment == "stage" || var.environment == "nonprod" || var.environment == "prod"
   error_message = "The variable environment should be dev, qa, stage, nonprod, or prod."
}
}

variable "location" {
 description = "Location name."
 type = string
 default = "primary"
 validation {
   condition   = var.location  == "primary"  || var.location == "secondary" 
   error_message = "The variable location should be primary, or secondary."
}
}

variable "product" {
 description = "The product short name."
 type = string
 default = "myproduct"
 validation {
   condition   = var.product  == "iproduct"  || var.product == "qaproduct" || var.product == "rproduct" || var.product == "eproduct" || var.product == "cproduct"  || var.product == "dproduct" || var.product == "myproduct"
   error_message = "The variable product should be."
}
}

variable "resource_groups" {
 description = "List of short names to build resouce groups."
 type = list(string)
}

variable "resource_types" {
 description = "list of resource"
 type = list(string)
 default = []
}

variable "tags" {
 description = "Tags to associate."
 type = map(string)
}

variable "subnets" {
 description = "Map of subnets."
 type = map(string)
}

variable "subnet_id" {
  description = "Subnet ID from the network module"
  type        = string
  default     = null
}

variable "vm_name" {}
