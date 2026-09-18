locals {
  prefix = "${var.p_name}-${var.env}-"
}

resource "azurerm_resource_group" "main" {
  name     = "${local.prefix}rg"
  location = var.location
}