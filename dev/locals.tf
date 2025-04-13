module "globals" {
  source = "../_modules/global-variables"

locals {
  environment     = "dev"
  address_space   = "10.101.12.0/22"
  product         = "myproduct"
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