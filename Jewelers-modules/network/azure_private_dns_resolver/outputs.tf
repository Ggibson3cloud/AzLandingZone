output "id" {
  value       = azurerm_private_dns_resolver.this.id
  description = "The ID of the private DNS resolver that was deployed."
}

output "inbound_endpoint_ips" {
  description = "The private IPs of the inbound endpoints"
  value       = { for idx, ep in azurerm_private_dns_resolver_inbound_endpoint.this : idx => ep.ip_configurations[0].private_ip_address }
}

output "outbound_endpoint_ids" {
  description = "The IDs of the outbound endpoints"
  value       = { for idx, ep in azurerm_private_dns_resolver_outbound_endpoint.this : idx => ep.id }
}

output "location" {
  description = "The region of the private DNS resolver"
  value       = var.location
}
