
variable "pe_name" {
  description = "Name of the Private Endpoint."
  type        = string
}

variable "location" {
  description = "Azure location where resources will be created."
  type        = string
}

variable "rg_name" {
  description = "Resource group name."
  type        = string
}

variable "subnet_id" {
  description = "ID of the subnet in which the private endpoint will be placed."
  type        = string
}

variable "private_connection_name" {
  description = "Name of the private service connection."
  type        = string
}

variable "private_connection_resource_id" {
  description = "ID of the resource to connect via Private Endpoint."
  type        = string
}

variable "subresource_names" {
  description = "List of subresource names to associate with the private endpoint."
  type        = list(string)
}

variable "is_manual_connection" {
  description = "Whether to use manual approval of the connection."
  type        = bool
  default     = false
}

variable "private_dns_zone_ids" {
  description = "List of Private DNS Zone IDs to associate with the Private Endpoint."
  type        = list(string)
}

variable "private_dns_zone_group_name" {
  description = "Name of the Private DNS Zone Group."
  type        = string
}
