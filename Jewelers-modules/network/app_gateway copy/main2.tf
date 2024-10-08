
resource "azurerm_application_gateway" "this" {
  name                = var.apgw_name
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location

  sku {
    name     = "Standard_v2"
    tier     = "Standard_v2"
    capacity = 2
  }

  gateway_ip_configuration {
    name      = var.gateway_ip_configuration
    subnet_id = azurerm_subnet.example.id
  }

  frontend_port {
    name = var.frontend_port_name
    port = 80
  }

  frontend_ip_configuration {
    name                 = var.frontend_ip_configuration_name
    public_ip_address_id = azurerm_public_ip.example.id
    private_ip_address = var.private_ip_address
  }

  backend_address_pool {
    name = var.backend_address_pool_name
  
  }

  backend_http_settings {
    name                  = var.http_setting_name
    cookie_based_affinity = "Disabled"
    path                  = "/path1/"
    port                  = 80
    protocol              = "Http"
    request_timeout       = 60
  }

  http_listener {
    name                           = var.listener_name
    frontend_ip_configuration_name = var.frontend_ip_configuration_name
    frontend_port_name             = var.frontend_port_name
    protocol                       = "Http"
  }

  request_routing_rule {
    name                       = var.request_routing_rule_name
    priority                   = 9
    rule_type                  = "Basic"
    http_listener_name         = var.listener_name
    backend_address_pool_name  = var.backend_address_pool_name
    backend_http_settings_name = var.http_setting_name
  }
}


####################################################################################
## This is used to associate a Virtual Machine to the Backend pool with the NIC
####################################################################################

resource "azurerm_network_interface_application_gateway_backend_address_pool_association" "example" {
  network_interface_id    = data.azurerm_network_interface.this.id
  ip_configuration_name   = "testconfiguration1"
  backend_address_pool_id = azurerm_application_gateway.network.backend_address_pool[0].id
}