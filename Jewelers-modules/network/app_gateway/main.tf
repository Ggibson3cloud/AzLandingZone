resource "azurerm_public_ip" "appgw_public_ip" {
  name                = var.public_ip_name
  location            = var.location
  resource_group_name = var.rg_name
  allocation_method   = "Static"
}



# #######################################
# ###### 
# #######################################
# resource "azurerm_key_vault_certificate" "this" {
#   name         = var.certificate_name
#   key_vault_id = var.key_vault_id
#   secret_name  = var.secret_name
# }

resource "azurerm_application_gateway" "this" {
  name                = var.name
  resource_group_name = var.rg_name
  location            = var.location
  zones               = var.availability_zones
  enable_http2 = var.enable_http2  ##set to true
  tags                = var.tags

  sku {
    name = var.sku_name
    tier = var.sku_tier
    capacity = var.capacity #minimum 2 for production optional if autoscale is set
  }

  # Adding autoscale configuration for production only 2 to 50
  autoscale_configuration {
    min_capacity = var.autoscale_min_capacity  # Minimum number of instances
    max_capacity = var.autoscale_max_capacity  # Maximum number of instances
  }

  identity {
    type = "UserAssigned"
    identity_ids = var.user_assigned_identity_ids  # Use for user-assigned identity
  }

  dynamic "backend_address_pool" {
    for_each = var.backend_address_pools
    content {
      name = backend_address_pool.key
      fqdns        = backend_address_pool.value.fqdns
      ip_addresses = backend_address_pool.value.ip_addresses
    }
  }

  dynamic "probe" {
    for_each = var.probes
    content {
      interval                                  = 30
      name                                      = probe.key
      path                                      = probe.value.path
      protocol                                  = probe.value.is_https ? "Https" : "Http"
      timeout                                   = 30
      unhealthy_threshold                       = 3
      pick_host_name_from_backend_http_settings = probe.value.pick_host_name_from_backend_http_settings
      host                                      = probe.value.host

      match {
        status_code = probe.value.match_status_code
      }
    }
  }

  dynamic "backend_http_settings" {
    for_each = var.backend_http_settings
    content {
      name                                = backend_http_settings.key
      cookie_based_affinity               = "Disabled"
      affinity_cookie_name                = "ApplicationGatewayAffinity"
      port                                = backend_http_settings.value.is_https ? "443" : "80"
      protocol                            = backend_http_settings.value.is_https ? "Https" : "Http"
      request_timeout                     = 30
      probe_name                          = backend_http_settings.value.probe_name
      pick_host_name_from_backend_address = backend_http_settings.value.pick_host_name_from_backend_address
      #trusted_root_certificate_names      = backend_http_settings.value.trusted_root_ca
      #host_name                           = backend_http_settings.value.host_name
    }
  }

  frontend_ip_configuration {
    name                 = var.frontend_ip_configuration_name
    public_ip_address_id = azurerm_public_ip.appgw_public_ip.id ##Only for external load balancer
    private_ip_address = var.private_ip_address


  }

  frontend_port {
    name = "Https_443"
    port = 443
  }

  gateway_ip_configuration {
    name      = "appGatewayIpConfig"
    subnet_id = var.subnet_id
  }

  dynamic "http_listener" {
    for_each = var.http_listeners
    content {
      name                           = http_listener.key
      frontend_ip_configuration_name = "appGwPrivateFrontendIp"
      frontend_port_name             = http_listener.value.ssl_certificate_name != null ? "Https_443" : "Http_80"
      protocol                       = http_listener.value.ssl_certificate_name != null ? "Https" : "Http"
      ssl_certificate_name           = http_listener.value.ssl_certificate_name
      host_name                      = http_listener.value.host_name
    }
  }

  // Basic Rules
  dynamic "request_routing_rule" {
    for_each = var.basic_request_routing_rules
    content {
      name                       = request_routing_rule.key
      rule_type                  = "Basic"
      http_listener_name         = request_routing_rule.value.http_listener_name
      backend_address_pool_name  = request_routing_rule.value.backend_pool_name
      backend_http_settings_name = request_routing_rule.value.backend_http_settings_name
      priority                   = request_routing_rule.value.priority

    }
  }

 # SSL Certificate block
  dynamic "ssl_certificate" {
    for_each = var.ssl_certificates
    content {
      name              = ssl_certificate.key
      key_vault_secret_id = azurerm_key_vault_certificate.this.secret_id  # Retrieve the certificate from Key Vault
    }
  }

  
}


# ####################################################################################
# ## This is used to associate a Virtual Machine to the Backend pool with the NIC
# ####################################################################################

# resource "azurerm_network_interface_application_gateway_backend_address_pool_association" "example" {
#   network_interface_id    = data.azurerm_network_interface.this.id
#   ip_configuration_name   = "testconfiguration1"
#   backend_address_pool_id = azurerm_application_gateway.network.backend_address_pool[0].id
# }
