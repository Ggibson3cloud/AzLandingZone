# Variables for random_string resource
variable "passwordLength" {
  description = "Length of the generated password"
  type        = number
  default     = 16
}

variable "passwordLower" {
  description = "Include lowercase letters in the password"
  type        = bool
  default     = true
}

variable "passwordUpper" {
  description = "Include uppercase letters in the password"
  type        = bool
  default     = true
}

variable "passwordNumber" {
  description = "Include numbers in the password"
  type        = bool
  default     = true
}

variable "passwordSpecial" {
  description = "Include special characters in the password"
  type        = bool
  default     = true
}

variable "min_special" {
  description = "Minimum number of special characters"
  type        = number
  default     = 1
}

variable "override_special" {
  description = "Override special characters set"
  type        = string
  default     = "_%@"
}

# Variables for Key Vault secrets
variable "key_vault_id" {
  description = "ID of the Key Vault"
  type        = string
}

variable "adminUser" {
  description = "Administrator username for the SQL Server and VM"
  type        = string
  default     = "jmadmin"
}

# Variables for SQL Server
variable "sql_server_name" {
  description = "Name of the SQL Server"
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "location" {
  description = "Location of the resources"
  type        = string
}

variable "tags" {}

# Variables for SQL Database
variable "databases" {
  description = "Map of databases to be created, keyed by the database name"
  type = map(object({
    collation      = string
    max_size_gb    = number
    read_scale     = bool
    sku            = string
    zone_redundant = bool
  }))
}
