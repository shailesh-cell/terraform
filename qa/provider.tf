/*
Description: Provider configuration
*/

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=4.1.0"
    }
  }
}

provider "azurerm" {
  features {}

  subscription_id = "4d5852fb-ad3c-41ce-9fd9-3527965dfd6d"
  client_id       = "4256fdec-5a97-4f0b-a6e8-8263c79d2996"
  use_oidc        = true
}
