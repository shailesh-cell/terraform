/*
Description: Provider configuration
*/

#Provider Version
terraform {
required_providerrs {
  azapi = {
    source = "Azue/azapi"
}
azurerem = {
 source   = "hashicorp/azurerm"
 configuragtion_aliased = [azurerm.ihub]
}
}
}