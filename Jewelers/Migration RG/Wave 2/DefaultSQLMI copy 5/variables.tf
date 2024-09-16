# variable "sqlmi_name" {
#   description = "The name of the SQL Managed Instance."
#   type        = string
# }

variable "subscriptionid" {
  description = "subscription id"
  type        = string
}

variable "rg_name" {
  description = "The name of the resource group."
  type        = string
}

variable "location" {
  description = "The location where the resource will be created."
  type        = string
}

# variable "license_type" {
#   description = "The license type to apply for this Managed Instance."
#   type        = string
#   # LicenseIncluded and BasePrice
# }


# variable "sku" {
#   description = "The SKU name for the SQL Managed Instance."
#   type        = string
#   #GP_Gen4, GP_Gen5, GP_Gen8IM, GP_Gen8IH, BC_Gen4, BC_Gen5, BC_Gen8IM or BC_Gen8IH.
# }

# variable "storage_size_in_gb" {
#   description = "The storage size for the SQL Managed Instance in GB."
#   type        = number
# }


# variable "vcores" {
#   description = "The number of vCores for the SQL Managed Instance."
#   type        = number
#   #Values can be 8, 16, or 24 for Gen4 SKUs, or 4, 6, 8, 10, 12, 16, 20, 24, 32, 40, 48, 56, 64, 80, 96 or 128 for Gen5 SKUs.
# }



variable "tags" {}

# variable "database_name" {
#   description = "The name of the SQL Managed Database."
#   type        = string
# }

variable "sqlmi" {
  description = "Configuration for SQL Managed Instances and their databases"
  type = map(object({
    license_type       = string
    collation          = string
    sku                = string
    storage_size_in_gb = number
    vcores             = number
    databases          = list(string)
  }))
}

variable "collation" {
  description = "Specifies how the SQL Managed Instance will be collated"
  type        = string
  default     = "Latin1_General_100_CI_AS"
}