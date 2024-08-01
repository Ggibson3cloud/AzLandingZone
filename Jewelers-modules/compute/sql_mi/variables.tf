variable "sqlmi_name" {
  description = "The name of the SQL Managed Instance."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group."
  type        = string
}

variable "location" {
  description = "The location where the resource will be created."
  type        = string
}

variable "license_type" {
  description = "The license type to apply for this Managed Instance."
  type        = string
  # LicenseIncluded and BasePrice
}


variable "sku" {
  description = "The SKU name for the SQL Managed Instance."
  type        = string
  #GP_Gen4, GP_Gen5, GP_Gen8IM, GP_Gen8IH, BC_Gen4, BC_Gen5, BC_Gen8IM or BC_Gen8IH.
}

variable "storage_size_in_gb" {
  description = "The storage size for the SQL Managed Instance in GB."
  type        = number
}

variable "subnet_id" {
  description = "The ID of the subnet where the SQL Managed Instance will be deployed."
  type        = string
}

variable "vcores" {
  description = "The number of vCores for the SQL Managed Instance."
  type        = number
  #Values can be 8, 16, or 24 for Gen4 SKUs, or 4, 6, 8, 10, 12, 16, 20, 24, 32, 40, 48, 56, 64, 80, 96 or 128 for Gen5 SKUs.
}

variable "passwordLength" {
  type        = number
  description = "Required password length to meet security minimum"
  default     = 12
}

variable "passwordLower" {
  type        = bool
  description = "Are lower characters required?"
  default     = true
}

variable "passwordUpper" {
  type        = bool
  description = "Are Upper characters required?"
  default     = true
}

variable "passwordNumber" {
  type        = bool
  description = "Are numbers required in the password?"
  default     = true
}

variable "passwordSpecial" {
  type        = bool
  description = "Are special characters required in the password?"
  default     = true
}

variable "min_special" {
  type        = number
  description = "Number of special characters required."
  default     = 1
}

variable "override_special" {
  type        = string
  description = "Special characters to use for randomized password"
  default     = "*!@#?"
}

variable "adminUser" {
  type        = string
  description = "Admin username"
  default     = "jmadmin"
}


variable "key_vault_id" {
  type        = string
  description = "Keyvault location to store randomized passwords"
}

variable "tags" {}

variable "database_name" {
  description = "The name of the SQL Managed Database."
  type        = list(string)
}

variable "collation" {
  description = "Specifies how the SQL Managed Instance will be collated"
  type        = string
  default     = "Latin1_General_100_CI_AS"
}