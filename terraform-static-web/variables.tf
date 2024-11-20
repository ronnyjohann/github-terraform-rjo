variable "location" {
  description = "Location of the resource"
  type        = string
  default     = "westeurope"  # Sett et standardverdi hvis ønskelig
}

variable "rg_name" {
  description = "Name of the resource group"
  type        = string
}

variable "sa_name" {
  description = "Base name for the storage account"
  type        = string
}

variable "source_content" {
  description = "Source content for the index.html file"
  type        = string
  default     = "<h1>Web page created with Terraform</h1>"  # Standard HTML-innhold
}

variable "index_document" {
  description = "Name of the index document"
  type        = string
  default     = "index.html"  # Standard dokumentnavn for index
}
