terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "rg-tfstate-backend"
    storage_account_name = "tfstatejakub2026"
    container_name       = "tfstate"
    key                  = "siec.tfstate"
    use_azuread_auth     = true
    subscription_id      = "3cd5c8d8-3da0-4952-8fe9-3f3949c14a46"
  }
}

provider "azurerm" {
  features {}
  subscription_id = "3cd5c8d8-3da0-4952-8fe9-3f3949c14a46"
}
