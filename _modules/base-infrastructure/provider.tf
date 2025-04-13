/*
Description: Provider configuration
*/

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
}

provider "azurerm" {
  features {}
  # OIDC-based authentication
  use_oidc = true
}
