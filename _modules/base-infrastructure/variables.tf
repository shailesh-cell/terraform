#variable "address_space" {
  #description = "The address space for the vnet."
  #type = string
#}

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
 default = "primary"
 validation {
   condition   = var.product  == "iproduct"  || var.product == "iproduct" || var.product == "rproduct" || var.product == "eproduct" || var.product == "cproduct"  || var.product == "dproduct" || var.product == "myproduct"
   error_message = "The variable product should be."
}
}

variable "resource_groups" {
 description = "List of short names to build resouce groups."
 type = list(string)
}

variable "tags" {
 description = "Tags to associate."
 type = map(string)
}



