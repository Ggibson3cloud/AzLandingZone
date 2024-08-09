output "outbound_endpoint_ids" {
  description = "The IDs of the outbound endpoints"
  value       = module.dns_resolver.outbound_endpoint_ids
}

output "inbound_endpoint_ips" {
  description = "The IDs of the inbound endpoints"
  value       = module.dns_resolver.inbound_endpoint_ips
}

output "dns_resolver_id" {
  description = "The ID of the DNS resolver"
  value       = module.dns_resolver.id
}
