
module "resource_group" {
  source   = "../../../../Jewelers-modules/base/resource_group"
  name     = var.resource_group_name
  location = var.location
  tags     = var.tags
}

module "dns_resolver" {
  source = "../../../../Jewelers-modules/network/azure_private_dns_resolver"

  location                 = var.location
  dns_resolver_name = var.dns_resolver_name
  resource_group_name      = module.resource_group.name
  virtual_network_id       = var.virtual_network_id
  inbound_subnet_ids        = var.inbound_subnet_ids
  outbound_subnet_ids       = var.outbound_subnet_ids
  tags                     = var.tags
  inbound_endpoint_names    = var.inbound_endpoint_names
  outbound_endpoint_names  = var.outbound_endpoint_names
}
