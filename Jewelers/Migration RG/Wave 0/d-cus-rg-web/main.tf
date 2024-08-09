#---------------------------------------------------------
# RESOURCE GROUPS
#---------------------------------------------------------

module "resource_group" {
  source   = "../../../../Jewelers-modules/base/resource_group"
  name     = var.rg_name
  location = var.location
  tags     = var.tags
}

module "internal_load_balancer" {
  source                         = "../../../../Jewelers-modules/network/load_balancer"
  resource_group_name            = module.resource_group.name
  location                       = var.location
  load_balancer_name             = var.internal_lb_name
  frontend_ip_configuration_name = var.frontend_ip_configuration_name_internal
  subnet_id                      = data.azurerm_subnet.snet.id
  private_ip_address             = var.private_ip_address_ilb
  is_internal                    = true
  sku                            = var.sku
  tags                           = var.tags
  public_ip_address_id           = null
}
