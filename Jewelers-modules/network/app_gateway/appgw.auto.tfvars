# Public IP variables
public_ip_name   = "appgw-public-ip"
location         = "eastus"
rg_name          = "my-resource-group"

# Key Vault certificate variables
certificate_name = "my-cert"
key_vault_id     = "/subscriptions/<subscription_id>/resourceGroups/<resource_group>/providers/Microsoft.KeyVault/vaults/<key_vault_name>"
secret_name      = "my-cert-secret"

# Application Gateway variables
name                 = "my-application-gateway"
availability_zones   = ["1", "2", "3"]
tags                 = {
  environment = "production"
}

sku_name             = "Standard_v2"
sku_tier             = "Standard_v2"
capacity = "2"

# Backend Address Pools
backend_address_pools = {
  pool1 = {
    fqdns        = ["backend1.example.com"]
    ip_addresses = ["10.0.1.10"]
  },
  pool2 = {
    fqdns        = ["backend2.example.com"]
    ip_addresses = ["10.0.1.11"]
  }
}

# Probes
probes = {
  probe1 = {
    path                                  = "/health"
    is_https                              = true
    pick_host_name_from_backend_http_settings = false
    host                                  = "backend1.example.com"
    match_status_code                     = [200, 202]
  }
}

# Backend HTTP Settings
backend_http_settings = {
  settings1 = {
    is_https                              = true
    probe_name                            = "probe1"
    pick_host_name_from_backend_address   = false
  }
}

# HTTP Listeners
http_listeners = {
  listener1 = {
    ssl_certificate_name = "my-cert"
    host_name            = "www.example.com"
  }
}

# Basic Request Routing Rules
basic_request_routing_rules = {
  rule1 = {
    http_listener_name         = "listener1"
    backend_pool_name          = "pool1"
    backend_http_settings_name = "settings1"
    priority                   = 1
  }
}

# SSL Certificates
ssl_certificates = {
  cert1 = {
    data     = "<base64_cert_data>"
    password = "<cert_password>"
  }
}

# Subnet ID
subnet_id = "/subscriptions/<subscription_id>/resourceGroups/<resource_group>/providers/Microsoft.Network/virtualNetworks/<vnet_name>/subnets/<subnet_name>"
