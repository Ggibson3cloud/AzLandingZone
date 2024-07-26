resource "azurerm_private_dns_resolver" "this" {
  location            = var.location
  name                = var.dns_resolver_name
  resource_group_name = var.resource_group_name
  tags                = var.tags
  virtual_network_id  = var.virtual_network_id
}

resource "azurerm_private_dns_resolver_inbound_endpoint" "this" {
  for_each = { for idx, name in var.inbound_endpoint_names : idx => name }

  location                = var.location
  name                    = each.value
  private_dns_resolver_id = azurerm_private_dns_resolver.this.id
  tags                    = var.tags

  ip_configurations {
    private_ip_allocation_method = "Dynamic"
    subnet_id                    = var.inbound_subnet_ids[each.key]
  }
}

resource "azurerm_private_dns_resolver_outbound_endpoint" "this" {
  for_each = { for idx, name in var.outbound_endpoint_names : idx => name }

  location                = var.location
  name                    = each.value
  private_dns_resolver_id = azurerm_private_dns_resolver.this.id
  tags                    = var.tags
  subnet_id               = var.outbound_subnet_ids[each.key]
}
