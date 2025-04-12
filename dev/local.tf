module "globals" {
 source = "../_modules/global-variables"
}

locals {
 address_space = "10.101.12.0/22"
 environemnt   = "dev"
 product       = "myproduct"
 resource_groups = [
 "app",
 "backup",
 "data",
 "monitor",
 "network",
 "security",
 "vm"
]

  tags = {
    CreatedBy      = "GIT-Pipeline"
    CreatedOn      = formatdate("MM/DD/YYYY", timestamp())
    DeploymentType = "Terraform"
    Environment    = local.environment == "prod" ? "Production" :
                     local.environment == "nonprod" ? "Non-Production" :
                     title(local.environment)
    Product        = upper(local.product)
  }
}