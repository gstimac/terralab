data "azurerm_subnet" "sn" {
  name                 = var.subnet_name
  resource_group_name  = "main-${var.location.short}-vnet-RG"
  virtual_network_name = var.vnet_name
}
