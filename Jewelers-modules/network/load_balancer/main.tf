resource "azurerm_lb" "this" {
  name                = var.load_balancer_name
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = var.sku
tags =var.tags
  dynamic "frontend_ip_configuration" {
    for_each = var.is_internal ? [1] : []
    content {
      name                 = var.frontend_ip_configuration_name
      subnet_id            = var.subnet_id
        private_ip_address_version    = "IPv4"
    private_ip_address            = var.frontend_ip_address #cidrhost(var.vnet.az-corp-prd-asea-ss-vnet-01.subnets.az-corp-prd-asea-ss-fwinternal-snet.address_prefixes[0], 5)
  }
  }

  dynamic "frontend_ip_configuration" {
    for_each = var.is_internal ? [] : [1]
    content {
      name                 = var.frontend_ip_configuration_name
      public_ip_address_id = var.public_ip_address_id
      private_ip_address_allocation = "Dynamic"
    }
  }
}


# ## Backend Address Pool ## 
# resource "azurerm_lb_backend_address_pool" "this" {
#   loadbalancer_id = azurerm_lb.this.id
#   name            = "BackEndAddressPool"
# }

# resource "azurerm_lb_backend_address_pool_address" "fortigate-backend" {
#   name                                = "internal-fortigate"
#   backend_address_pool_id             = azurerm_lb_backend_address_pool.this.id
#   backend_address_ip_configuration_id = azurerm_lb.this.frontend_ip_configuration[0].id
# }


# ## Health Probe ##
# resource "azurerm_lb_probe" "this" {
#   loadbalancer_id = azurerm_lb.this.id
#   name            = "ssh-running-probe"
#   port            = 22
# }

/*
resource "azurerm_lb_outbound_rule" "this" {
  name                    = "OutboundRule"
  loadbalancer_id         = azurerm_lb.this.id
  protocol                = "Tcp"
  backend_address_pool_id = azurerm_lb_backend_address_pool.this.id

  frontend_ip_configuration {
    name = "PublicIPAddress"
  }
}
*/