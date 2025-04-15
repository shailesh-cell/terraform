module "base_infra" {
  source = "../_modules/base-infrastructure"
  environment  = local.environment
  subnets      = local.subnets
  address_space = local.address_space
  resource_groups = ["vm","network"]
  tags           = local.tags
  vm_name = module.windows_vm.vm_name
  
}