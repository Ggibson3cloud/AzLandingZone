module "dns_forwarding" {
  source = "../../../../Jewelers-modules/network/azure_dns_hub_forwarding_ruleset"

  location                                  = var.location
  name                                      = var.dns_forwarding_ruleset_name
  private_dns_resolver_outbound_endpoint_id = var.outbound_endpoint_id
  resource_group_name                       = var.resource_group_name
  tags                                      = var.tags

  rules = var.dns_forwarding_rules

  vnets = var.vnets
}
