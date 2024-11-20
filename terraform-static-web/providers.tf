terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.1.0"
    }
  }

  # Backend-konfigurasjon for lagring av tilstand
  backend "azurerm" {
    resource_group_name  = "rg-backend-rjo"
    storage_account_name = "sabackendrjo1bwdbknuve"
    container_name       = "sc-backend-container-rjo"
    key                  = "web-demo.terraform.tfstate"
  }
}

# Provider-konfigurasjon for azurerm med features
provider "azurerm" {
  features {}
}
