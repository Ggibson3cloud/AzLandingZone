#---------------------------------------------------------
# RESOURCE GROUPS
#---------------------------------------------------------

module "resource_group" {
  source   = "../../../../Jewelers-modules/base/resource_group"
  name     = var.rg_name
  location = var.location
  tags     = var.tags
}


#---------------------------------------------------------
# NETWORKING
#---------------------------------------------------------

module "vnet" {
  depends_on = [
    module.resource_group
  ]

  source         = "../../../../Jewelers-modules/network/vnet/v1/"
  for_each       = { for vnet in var.vnets : vnet.name => vnet }
  location       = var.location
  tags           = var.tags
  name           = each.value.name
  cidr           = each.value.cidr
  dns_servers    = each.value.dns_servers
  resource_group = var.rg_name
}

module "subnets" {
  depends_on = [
    module.vnet
  ]
  source                                         = "../../../../Jewelers-modules/network/subnet/v1/"
  for_each                                       = var.subnet
  vnet_name                                      = each.value.vnet
  resource_group                                 = var.rg_name
  subnet_name                                    = each.key
  subnet_range                                   = each.value.subnet_range
  service_endpoints                              = each.value.service_endpoints
  delegation_name                                = each.value.delegation_name
  delegation_actions                             = each.value.delegation_actions
  enforce_private_link_endpoint_network_policies = each.value.enforce_private_link_endpoint_network_policies
  location                                       = var.location
  tags                                           = var.tags
}


module "nsgs" {
  for_each = { for nsg in var.nsgs : nsg.name => nsg }

  source         = "../../../../Jewelers-modules/network/nsg/v1"
  location       = var.location
  tags           = var.tags
  name           = each.value.name
  resource_group = var.rg_name
  security_rules = each.value.rules
}

module "route_tables" {
  source                        = "../../../../Jewelers-modules/network/route_table/v1"
  for_each                      = { for routetable in var.route_tables : routetable.name => routetable }
  location                      = var.location
  tags                          = var.tags
  name                          = each.value.name
  resource_group                = var.rg_name
  disable_bgp_route_propagation = each.value.disable_bgp_route_propagation
  nva_routes                    = each.value.nva_routes
  vnetlocal_routes              = each.value.vnetlocal_routes
}


resource "azurerm_subnet_route_table_association" "this" {
  for_each       = { for key, value in var.subnet_route_table_associations : key => value }
  subnet_id      = module.subnets[each.value.subnet].subnets_id
  route_table_id = module.route_tables[each.value.route_table].route_table_id

  depends_on = [
    module.subnets,
    module.route_tables
  ]
}

#---------------------------------------------------------
# Bastion Server
#---------------------------------------------------------

module "bastion" {
  source         = "../../../../Jewelers-modules/network/bastion"
  bastion_name   = var.bastion_name
  location       = var.location
  resource_group = module.resource_group.name
  bastion_subnet = module.subnets["AzureBastionSubnet"].subnets_id
}

resource "azurerm_virtual_network_peering" "hub_to_appgw" {
  name                         = "hub_vnet_to_appgw_vnet"
  resource_group_name          = var.rg_name
  virtual_network_name         = module.vnet["h-cus-vnet-hub"].vnet_name
  remote_virtual_network_id    = module.vnet["h-cus-vnet-appgw"].id
  allow_virtual_network_access = true
  allow_forwarded_traffic      = true
  allow_gateway_transit        = true
}

resource "azurerm_virtual_network_peering" "appgw_to_hub" {
  name                         = "appgw_vnet_to_hub_vnet"
  resource_group_name          = var.rg_name
  virtual_network_name         = module.vnet["h-cus-vnet-appgw"].vnet_name
  remote_virtual_network_id    = module.vnet["h-cus-vnet-hub"].id
  allow_virtual_network_access = true
  allow_forwarded_traffic      = true
  allow_gateway_transit        = false
  use_remote_gateways          = false
}