variable "subscriptionid" {}

variable "location" {
  description = "The location where the resources will be created"
  type        = string
}

variable "dns_forwarding_ruleset_name" {
  description = "The name of the DNS forwarding ruleset"
  type        = string
}

variable "outbound_endpoint_id" {
  description = "The ID of the private DNS resolver outbound endpoint"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "tags" {
  description = "Tags to apply to the resources"
  type        = map(string)
}

variable "dns_forwarding_rules" {
  description = "A map of DNS forwarding rules"
  type = map(object({
    domain_name        = string
    target_dns_servers = list(string)
  }))
}

variable "vnets" {
  description = "A map of virtual networks to link to the DNS forwarding ruleset"
  type        = map(string)
}
