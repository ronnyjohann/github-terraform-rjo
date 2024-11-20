locals {
  # Kombinerer base_name med miljøet (workspace) for å lage et unikt navn
  rg_name = "${var.rg_name}-${terraform.workspace}"
}

# Opprette resource group
resource "azurerm_resource_group" "rg_web" {
  name     = local.rg_name
  location = var.location
}

# Definerer random_string ressursen for å lage et tilfeldig suffiks
resource "random_string" "random_string" {
  length  = 8
  special = false
  upper   = false
}

# Opprette storage account
resource "azurerm_storage_account" "sa_web" {
  name                     = "${var.sa_name}${random_string.random_string.result}"
  resource_group_name      = azurerm_resource_group.rg_web.name
  location                 = azurerm_resource_group.rg_web.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  static_website {
    index_document = var.index_document
  }
}

# Legge til en index.html fil i storage accounten
resource "azurerm_storage_blob" "index_html" {
  name                   = var.index_document
  storage_account_name   = azurerm_storage_account.sa_web.name
  storage_container_name = "$web"
  type                   = "Block"
  content_type           = "text/html"
  source_content         = var.source_content
}

output "primary_web_endpoint" {
  value = azurerm_storage_account.sa_web.primary_web_endpoint
}
