#---------------------------------------------------------
# RESOURCE GROUPS
#---------------------------------------------------------

module "resource_group" {
  source = "../../../../Jewelers-modules/base/resource_group/"

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
  resource_group = module.resource_group.name
}


module "identity_subnets" {
  depends_on = [
    module.vnet
  ]
  source                                         = "../../../../Jewelers-modules/network/subnet/v1/"
  for_each                                       = var.subnet
  vnet_name                                      = each.value.vnet
  resource_group                                 = module.resource_group.name
  subnet_name                                    = each.key
  subnet_range                                   = each.value.subnet_range
  service_endpoints                              = each.value.service_endpoints
  delegation_name                                = each.value.delegation_name
  delegation_actions                             = each.value.delegation_actions
  enforce_private_link_endpoint_network_policies = each.value.enforce_private_link_endpoint_network_policies
  location                                       = var.location
  tags                                           = var.tags
}

module "route_tables" {
  source                        = "../../../../Jewelers-modules/network/route_table/v1"
  for_each                      = { for routetable in var.route_tables : routetable.name => routetable }
  location                      = var.location
  tags                          = var.tags
  name                          = each.value.name
  resource_group                = module.resource_group.name
  disable_bgp_route_propagation = each.value.disable_bgp_route_propagation
  nva_routes                    = each.value.nva_routes
  vnetlocal_routes              = each.value.vnetlocal_routes
}


resource "azurerm_subnet_route_table_association" "this" {
  for_each       = { for key, value in var.subnet_route_table_associations : key => value }
  subnet_id      = module.identity_subnets[each.value.subnet].subnets_id
  route_table_id = module.route_tables[each.value.route_table].route_table_id

  depends_on = [
    module.identity_subnets,
    module.route_tables
  ]
}


module "ss_nsgs" {
  for_each = { for nsg in var.nsgs : nsg.name => nsg }

  source         = "../../../../Jewelers-modules/network/nsg/v1"
  location       = var.location
  tags           = var.tags
  name           = each.value.name
  resource_group = module.resource_group.name
  security_rules = each.value.rules
}


#---------------------------------------------------------
# Identity Keyvault 
#---------------------------------------------------------
module "keyvault" {
  source                        = "../../../../Jewelers-modules/base/key_vault"
  key_vault_name                = var.key_vault_name
  key_vault_resource_group_name = module.resource_group.name
  location                      = var.location
  tenant_id                     = data.azurerm_client_config.current.tenant_id
  enable_rbac_authorization     = true
  purge_protection_enabled      = false
  tags                          = var.tags

}


#---------------------------------------------------------
# Spoke 1 VNET Peerings 
#---------------------------------------------------------
resource "azurerm_virtual_network_peering" "hub_to_identity" {
  provider                     = azurerm.hub
  name                         = "hub_vnet_to_test_mgmt_vnet"
  resource_group_name          = data.azurerm_resource_group.hub_rg.name
  virtual_network_name         = data.azurerm_virtual_network.hub_vnet.name
  remote_virtual_network_id    = module.vnet["t-cus-vnet-mgmt"].id ##update format "i-cus-vnet-identity"
  allow_virtual_network_access = true
  allow_forwarded_traffic      = true
  allow_gateway_transit        = true
}

resource "azurerm_virtual_network_peering" "identity_to_hub" {
  name                         = "test_mgmt_vnet_to_hub_vnet"
  resource_group_name          = module.resource_group.name
  virtual_network_name         = module.vnet["t-cus-vnet-mgmt"].vnet_name ##update format "i-cus-vnet-identity"
  remote_virtual_network_id    = data.azurerm_virtual_network.hub_vnet.id
  allow_virtual_network_access = true
  allow_forwarded_traffic      = true
  allow_gateway_transit        = false
  use_remote_gateways          = false
}