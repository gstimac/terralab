terraform {
  required_version = ">= 0.14"
}
provider "azurerm" {
  subscription_id = var.subscription
  features {}
  version = "2.56.0"
}