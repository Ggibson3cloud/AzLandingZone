variable "location" {
  description = "The region where the forwarding ruleset will be created"
  type        = string
}

variable "name" {
  description = "The name of the forwarding ruleset"
  type        = string
}

variable "private_dns_resolver_outbound_endpoint_id" {
  description = "The list of IDs of the private DNS resolver's outbound endpoint"
  type        = string
}

variable "resource_group_name" {
  default     = "rg-dns-prod-01"
  description = "The resource group where the forwarding ruleset will be created"
  type        = string
}

variable "tags" {
  description = "Tags to be applied to resources."
  type        = map(string)
}


variable "rules" {
  description = <<-EOL
  A collection of rules to be created in the forwarding ruleset. The key is the name of
  the rule. It cannot be longer than 80 characters and can't include special characters.
  Each target DNS server should be in the format "IP:port". The domain name must be a
  valid FQDN with a trailing dot.
  EOL
  type = map(object({
    domain_name        = string
    enabled            = optional(bool, true)
    target_dns_servers = set(string)
  }))

  validation {
    condition     = alltrue([for rule in var.rules : endswith(rule.domain_name, ".")])
    error_message = "`domain_name` must be a valid FQDN with a trailing dot"
  }
}

variable "vnets" {
  description = <<-EOL
  A map of of remote VNets that will be linked to the forwarding ruleset. The key should
  be the VNet key/name and the value should be its ID.
  EOL
  type        = map(string)
}
