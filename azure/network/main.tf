locals {
  tags = {
    owner       = var.owner
    environment = var.environment
  }
}

resource "azurerm_resource_group" "main" {
  name     = "main-${var.location.short}-vnet-RG"
  location = "East US"
}

resource "azurerm_network_security_group" "main" {
  name                = "main-SG"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
}

resource "azurerm_virtual_network" "main" {
  name                = "main-${var.location.short}-VNET"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  address_space       = ["40.0.0.0/16"]

  subnet {
    name           = "cicd-SNET"
    address_prefix = "40.0.1.0/24"
    security_group = azurerm_network_security_group.main.id
  }

  tags = local.tags
}