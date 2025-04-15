module "base_infra" {
  source = "../_modules/base-infrastructure"
  environment  = local.environment
  subnets      = local.subnets
  address_space = local.address_space
  resource_groups = ["vm"]
  tags           = local.tags
  nic_id         = "var.nic_id"
  resource_groups = ["vm","network"]
}