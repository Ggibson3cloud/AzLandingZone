resource "azurerm_public_ip" "this" {
  name                = "h-cus-pip-exl"
  location            = var.location
  resource_group_name = var.rg_name
  allocation_method   = "Static"
  sku                 = "Standard"
}

module "external_load_balancer" {
  source                         = "../../../../Jewelers-modules/network/load_balancer"
  resource_group_name            = var.rg_name
  location                       = var.location
  load_balancer_name             = var.external_lb_name
  frontend_ip_configuration_name = var.frontend_ip_configuration_external
  public_ip_address_id           = azurerm_public_ip.this.id
  is_internal                    = false
  sku                            = var.sku
  tags                           = var.tags

}

module "internal_load_balancer" {
  source                         = "../../../../Jewelers-modules/network/load_balancer"
  resource_group_name            = var.rg_name
  location                       = var.location
  load_balancer_name             = var.internal_lb_name
  frontend_ip_configuration_name = var.frontend_ip_configuration_name_internal
  subnet_id                      = var.subnet_id
  private_ip_address             = var.private_ip_address_ilb
  is_internal                    = true
  sku                            = var.sku
  tags                           = var.tags
  public_ip_address_id = null
}


module "gateway_load_balancer" {
  source                         = "../../../../Jewelers-modules/network/load_balancer"
  resource_group_name            = var.rg_name
  location                       = var.location
  load_balancer_name             = var.gateway_lb_name
  frontend_ip_configuration_name = var.frontend_ip_configuration_name_gateway
  subnet_id                      = var.subnet_id
  private_ip_address             = var.private_ip_address_glb
  is_internal                    = true
  sku                            = "Gateway"
  tags                           = var.tags
  public_ip_address_id = null 
}


# resource "azurerm_lb_backend_address_pool" "elbedgebackend" {
#   loadbalancer_id = azurerm_lb.elbedge.id
#   name            = "name"
# }

# resource "azurerm_lb_probe" "elbedgeprobe" {
#   loadbalancer_id = azurerm_lb.elbedge.id
#   name            = "name"
#   port            = 8008

# }

# resource "azurerm_lb_rule" "elbedgeruletcp" {
#   loadbalancer_id                = azurerm_lb.elbedge.id
#   name                           = "name"
#   protocol                       = "Tcp"
#   frontend_port                  = 80
#   backend_port                   = 80
#   disable_outbound_snat          = true
#   frontend_ip_configuration_name = "${var.prefix}-EDGE-FGT-ELB-PIP"
#   probe_id                       = azurerm_lb_probe.elbedgeprobe.id
#   backend_address_pool_ids       = [azurerm_lb_backend_address_pool.elbedgebackend.id]

# }
