variable "subscriptionid" {}

variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "vnet_id" {
  description = "The ID of the virtual network to link to the DNS zones"
  type        = string
}

variable "dns_zones" {
  description = "List of DNS zones to create"
  type        = list(string)
}

variable "location" {
  description = "(Required) Azure region"
  type        = string
}
variable "tags" {
  description = "(Required) Tags to be applied"
  type        = map(string)
}