# resource "azurerm_public_ip" "this" {
#   name                = var.public_ip_name
#   location            = var.location
#   resource_group_name = var.resource_group_name
#   allocation_method   = "Static"
# }

# resource "azurerm_application_gateway" "network" {
#   name                = "s-cus-agw-ext01"
#   resource_group_name = var.resource_group_name
#   location            = var.location

#   sku {
#     name     = "Standard_v2"
#     tier     = "Standard_v2"
#     capacity = 2
#   }

#   gateway_ip_configuration {
#     name      = "my-gateway-ip-configuration"
#     subnet_id = data.azurerm_subnet.this.id
#   }

#   frontend_port {
#     name = "front_end_prot"
#     port = 80
#   }

#   frontend_ip_configuration {
#     name                 = "front_end_ip"
#     public_ip_address_id = azurerm_public_ip.this.id
#   }

#   backend_address_pool {
#     name = "backend_address_pool"
#   }

#   backend_http_settings {
#     name                  = "http_settings"
#     cookie_based_affinity = "Disabled"
#     path                  = "/path1/"
#     port                  = 80
#     protocol              = "Http"
#     request_timeout       = 60
#   }

#   http_listener {
#     name                           = "http_listener"
#     frontend_ip_configuration_name = "frontend_ip_configuration_name"
#     frontend_port_name             = "frontend_port_name"
#     protocol                       = "Http"
#   }

#   request_routing_rule {
#     name                       = "request_routing_rule_name"
#     priority                   = 9
#     rule_type                  = "Basic"
#     http_listener_name         = "listener_name"
#     backend_address_pool_name  = "backend_address_pool_name"
#     backend_http_settings_name = "http_setting_name"
#   }
# }




resource "azurerm_application_gateway" "network" {
  name                = "s-cus-agw-int01"
  resource_group_name = var.resource_group_name
  location            = var.location

  sku {
    name     = "Standard_v2"
    tier     = "Standard_v2"
    capacity = 2
  }

  gateway_ip_configuration {
    name      = "my-gateway-ip-configuration"
    subnet_id = data.azurerm_subnet.this.id
  }

zones = ["1", "2", "3"]  # Specify the Availability Zones for the deployment
  frontend_port {
    name = "front_end_port"
    port = 80
  }

  frontend_ip_configuration {
    name               = "front_end_ip"
    private_ip_address = "10.130.2.6"
    private_ip_address_allocation = "Static"
    subnet_id = data.azurerm_subnet.this.id
  }

  backend_address_pool {
    name = "backend_address_pool"
  }

  backend_http_settings {
    name                  = "http_settings"
    cookie_based_affinity = "Disabled"
    path                  = "/path1/"
    port                  = 80
    protocol              = "Http"
    request_timeout       = 60
  }

  http_listener {
    name                           = "http_listener"
    frontend_ip_configuration_name = "front_end_ip"   # Reference the name of the frontend IP configuration
    frontend_port_name             = "front_end_port" # Reference the frontend port name
    protocol                       = "Http"
  }

  request_routing_rule {
    name                       = "request_routing_rule"
    priority                   = 9
    rule_type                  = "Basic"
    http_listener_name         = "http_listener"        # Reference the name of the http_listener
    backend_address_pool_name  = "backend_address_pool" # Reference the backend address pool name
    backend_http_settings_name = "http_settings"        # Reference the backend HTTP settings name
  }
}
