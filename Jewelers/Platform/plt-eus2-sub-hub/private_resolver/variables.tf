variable "location" {
  description = "The location of the DNS resolver."
  type        = string
}

variable "dns_resolver_name" {
  description = "The name of the DNS resolver."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group."
  type        = string
}

variable "virtual_network_id" {
  description = "The ID of the virtual network."
  type        = string
}


variable "tags" {
  description = "Tags to be applied to resources."
  type        = map(string)
}

variable "subscription_id" {
  description = "The subscription ID"
  type        = string
}

variable "create_inbound_endpoint" {
  description = "Whether to create an inbound endpoint"
  type        = bool
  default     = true
}

variable "create_outbound_endpoint" {
  description = "Whether to create an outbound endpoint"
  type        = bool
  default     = true
}

variable "inbound_endpoint_names" {
  description = "The names of the inbound endpoints."
  type        = list(string)
}

variable "outbound_endpoint_names" {
  description = "The names of the outbound endpoints."
  type        = list(string)
}

variable "inbound_subnet_ids" {
  description = "The IDs of the inbound subnets."
  type        = list(string)
}

variable "outbound_subnet_ids" {
  description = "The IDs of the outbound subnets."
  type        = list(string)
}