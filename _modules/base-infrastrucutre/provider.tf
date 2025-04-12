/*
Description: Provider configuration
*/

Provider Version
terraform {
required_providers {
  azapi = {
    source = "Azue/azapi"
}
azurerem = {
 source   = "hashicorp/azurerm"
 configuragtion_aliased = [azurerm.ihub]
}
}
}