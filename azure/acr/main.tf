locals {
  tags = {
    owner       = var.owner
    environment = var.environment
  }
}

resource "azurerm_resource_group" "acr" {
  name     = "main-${var.location.short}-acr-RG"
  location = var.location.full
  tags     = local.tags
}

resource "azurerm_container_registry" "acr" {
  name                = "${var.environment}eastusacr"
  resource_group_name = azurerm_resource_group.acr.name
  location            = azurerm_resource_group.acr.location
  sku                 = "Basic"
  admin_enabled       = false
  tags                = local.tags
}