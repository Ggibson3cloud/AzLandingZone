# variables.tf

# Location of the resources
variable "location" {
  description = "Azure location where resources will be deployed."
  type        = string
}

# Resource Group Name
variable "rg_name" {
  description = "Name of the resource group where resources will be deployed."
  type        = string
}

variable "subscriptionid" {}
# Tags for the resources
variable "tags" {}

# VNET Configuration
variable "vnets" {}

# Subnet Configuration
variable "subnet" {}

variable "nsgs" {}

# Route Table Configuration
variable "route_tables" {}

# Subnet Route Table Associations
variable "subnet_route_table_associations" {
  description = "Associations between subnets and route tables."
  type = map(object({
    subnet      = string
    route_table = string
  }))
  default = {}
}

variable "hubid" {}