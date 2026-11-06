locals {
  devops_vnet_name = "${local.prefix}devops-vnet"
  run_vnet_name    = "${local.prefix}run-vnet"
}


resource "azurerm_virtual_network" "devops" {
    name = local.devopsVnetName
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name

  address_space = [var.devops_vnet_cidr]
}
resource "azurerm_virtual_network" "run" {
  name = local.runVnetName
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  address_space = [var.run_vnet_cidr]
}