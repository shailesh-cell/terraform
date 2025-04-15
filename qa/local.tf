module "globals" {
  source = "../_modules/global-variables"
}

locals {
  environment     = "qa"
  address_space   = "10.2.1.0/16"
  product         = "uatproduct"
  resource_groups = [
    "app",
    "backup",
    "data",
    "monitor",
    "network",
    "security",
    "vm"
  ]
  location = "primary"
 
  subnets = {
    vm  = "10.2.1.128/26"
    pe               = "10.2.2.0/24"
    network = "10.2.1.0/26"
  }

  tags = {
    CreatedBy      = "GIT-Pipeline"
    CreatedOn      = formatdate("MM/DD/YYYY", timestamp())
    DeploymentType = "Terraform"
    Environment    = (
      local.environment == "prod" ? "Production" :
      local.environment == "uat" ? "Non-Production" :
      title(local.environment)
    )
    Product = upper(local.product)
  }
}