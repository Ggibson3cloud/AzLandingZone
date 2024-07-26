variable "dns_zone_name" {
  description = "The name of the private DNS zone."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group."
  type        = string
}

variable "virtual_network_id" {
  description = "The ID of the virtual network to link."
  type        = string
}

variable "tags" {
  description = "(Required) Tags to be applied"
  type        = map(string)
}
