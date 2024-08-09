variable "subscriptionid" {
  description = "subscription id"
  type        = string
}


variable "rg_name" {
  description = "Name of the Resource Group"
  type        = string
}

variable "sql_server_name" {
  description = "Name of the SQL Server"
  type        = string
}

variable "location" {
  description = "Location of the resources"
  type        = string
}

variable "adminUser" {
  description = "Administrator username for the SQL Server and VM"
  type        = string
  default     = "jmadmin"
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
