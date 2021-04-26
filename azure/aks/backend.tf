terraform {
  backend "azurerm" {
    storage_account_name = "cicdlab"
    container_name       = "terraform"
    key                  = "cicd/terraform.tfstate"
    resource_group_name  = "terraform"
    subscription_id      = "320c6aee-903c-465f-81d1-9463af62e06f"
  }
}