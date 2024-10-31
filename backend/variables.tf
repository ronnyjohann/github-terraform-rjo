variable "rg_backend_name" {
  type        = string
  description = "Name of the rg for the backend"
}

variable "rg_backend_location" {
  type        = string
  description = "Location of the rg for the backend"
}

variable "sa_backend_name" {
  type        = string
  description = "Name of the sa for the backend"
}

variable "sc_backend_name" {
  type        = string
  description = "Name of the sc for the backend"
}

variable "sa_backend_accesskey_name" {
  type        = string
  description = "Name of the access key for the backend"
}

variable "kv_backend_name" {
  type        = string
  description = "Name of the key vault for the backend"
}
