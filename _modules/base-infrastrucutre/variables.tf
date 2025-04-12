variable "address_space" {
  description = "The address space for the vnet."
  type = string
}

variable "environment" {
 description = "The environment name. Ex: dev, qa, stage, nonprod, or prod."
 type = string
 validation {
   condition   = var.environment  == "dev"  || var.environment = "qa" || var.environment = "stage" || var.environment == "nonprod" || var.environment == "prod"
error_message = "The variable environment should be dev, qa, stage, nonprod, or prod."
}
}

variable "location" {
 description = "Location name."
 type = string
 default = "primary"
 validation {
   condition   = var.location  == "primary"  || var.location = "secondary" 
   error_message = "The variable location should be primary, or secondary."
}
}

variable "product" {
 description = "The product short name. Ex: ihub, ahub, rxrs, eor, cpsa, cpst, or cpso"
 type = string
 default = "primary"
 validation {
   condition   = var.product  == "ihub"  || var.product = "ahub" || var.product = "rxrs" || var.product = "eor" || var.product = "cpsa"  || var.product = "cpst" || var.product = "cpso"
   error_message = "The variable product should be ihub, ahub, rxrs, eor, cpsa, cpst, cpso."
}
}

variable "resource_group" {
 description = "List of short names to build resouce groups."
 type = list(string)
}

variable "tags" {
 description = "Tags to associate."
 type = map(string)
}



