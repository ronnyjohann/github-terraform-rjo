# Backend configuration - bruk en ny key for å unngå konflikt
terraform {
  backend "azurerm" {
    resource_group_name  = "rg-backend-rjo"
    storage_account_name = "sabackendrjo1bwdbknuve"
    container_name       = "sc-backend-container-rjo"
    key                  = "test-deployment.tfstate" # Ny key for denne testen
  }
}

# Provider konfigurasjon
provider "azurerm" {
  features {}
}

# Opprett en test Resource Group
resource "azurerm_resource_group" "test_rg" {
  name     = "test-resource-group2"
  location = "westeurope"
}
