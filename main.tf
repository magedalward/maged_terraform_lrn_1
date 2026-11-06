locals {
  prefix = "${var.p_name}-${var.env}-"
  rgName = "${local.prefix}rg"
}

resource "azurerm_resource_group" "main" {
  name     = local.rgName
  location = var.location
}

module "networks" {
  source = "./modules/networks"

  rg_name  = azurerm_resource_group.main.name
  location = azurerm_resource_group.main.location

  prefix          = local.prefix
  devops_vnet_cidr = var.devops_vnet_cidr
  run_vnet_cidr    = var.run_vnet_cidr
}