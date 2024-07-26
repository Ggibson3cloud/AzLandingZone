# resource "azurerm_public_ip" "this" {
#   name                = "h-cus-pip-ilb-sdwan"
#   location            = var.location
#   resource_group_name = var.rg_name
#   allocation_method   = "Static"
#   sku                 = "Standard"
# }

module "internal_load_balancer" {
  source                         = "../../../../Jewelers-modules/network/sdwan_load_balancer"
  resource_group_name            = var.rg_name
  location                       = var.location
  load_balancer_name             = var.internal_lb_name
  frontend_ip_configuration_name = var.frontend_ip_configuration_name_internal
  subnet_id                      = var.subnet_id
  private_ip_address             = var.private_ip_address_ilb
  sku                            = var.sku
  tags                           = var.tags
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
