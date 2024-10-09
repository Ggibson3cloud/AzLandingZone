locals {
  # Names for different components of the Application Gateway
  frontend_port_name             = "frontendPort"
  frontend_ip_configuration_name = "frontendIPConfig"
  backend_address_pool_name      = "backendPool"
  http_setting_name              = "httpSetting"
  listener_name                  = "httpListener"
  request_routing_rule_name      = "routingRule"

  # Additional local variables can be added as needed
  default_private_ip_address     = "10.0.0.10"  # Example private IP if a default is needed
}

# You can reference these local variables in your main configuration file
