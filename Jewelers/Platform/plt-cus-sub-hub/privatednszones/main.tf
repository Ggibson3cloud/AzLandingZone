module "resource_group" {
  source   = "../../../../Jewelers-modules/base/resource_group"
  name     = var.resource_group_name
  location = var.location
  tags     = var.tags
}

resource "azurerm_private_dns_zone" "private_dns_zones" {
  for_each            = toset(var.dns_zones)
  name                = each.value
  resource_group_name = module.resource_group.name
}

resource "azurerm_private_dns_zone_virtual_network_link" "dns_zone_links" {
  for_each              = azurerm_private_dns_zone.private_dns_zones
  name                  = "vnet-link-${each.key}"
  resource_group_name   = module.resource_group.name
  private_dns_zone_name = each.value.name
  virtual_network_id    = var.vnet_id

  depends_on = [
    azurerm_private_dns_zone.private_dns_zones
  ]
}

