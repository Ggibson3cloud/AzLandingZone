
variable "location" {
  type        = string
  description = "The location/region where the Application Gateway is created"
}

variable "rg_name" {
  type        = string
  description = "The name of the resource group in which the Application Gateway is created"
}

variable "tags" {
  type        = map(string)
  description = "The tags to associate with your network security group."
}

variable "sku_name" {
  type        = string
  description = "The name of the SKU"
}

variable "sku_tier" {
  type        = string
  description = "The tier of the SKU"
}

variable "availability_zones" {
  type        = list(number)
  description = "A list of availability zones denoting where the Application Gateway needs to be created"
  default     = ["1", "2", "3"]
}

# variable "user_assigned_identity_id" {
#     type = string
#     description = "The ID of the user assigned identity"
# }

variable "private_ip_address" {
  type        = string
  description = "The private IP address of the Application Gateway"
}

# variable "public_ip_address_id" {
#     type = string
#     description = "The ID of the public IP address"
# }

variable "subnet_id" {
  type        = string
  description = "The ID of the subnet"
}

# variable "autoscale_configuration"{
#     type = object({
#         min_capacity = number
#         max_capacity = number
#     })
#     description = "Autoscale configuration"
#     default = {
#         min_capacity = 0
#         max_capacity = 3
#     }
# }

variable "backend_address_pools" {
  type        = any
  description = "Backend address pool"
  default     = {}
}

variable "probes" {
  type        = any
  description = "Probes"
  default     = {}
}

variable "backend_http_settings" {
  type        = any
  description = "Backend HTTP settings"
  default     = {}
}

variable "http_listeners" {
  type        = any
  description = "HTTP listeners"
  default     = {}
}

variable "basic_request_routing_rules" {
  type        = any
  description = "Basic request routing rules"
  default     = {}
}

# variable "redirect_request_routing_rules" {
#     type = map(object({
#         name = string
#         http_listener_name = string
#         redirect_configuration_name = string
#         priority = number
#     }))
#     description = "Redirect request routing rules"
#     default = {}
# }

variable "ssl_certificates" {
  type        = any
  description = "SSL certificates"
  default     = {}
}

# variable "trusted_root_certificates" {
#     type = any
#     description = "Trusted root certificates"
#     default = {}
# }

# variable "redirect_configurations" {
#     type = any
#     description = "Redirect configurations"
#     default = {}
# }

# variable "waf_configuration" {
#     type = object({
#         enabled = bool
#         firewall_mode = string
#         rule_set_type = string
#         rule_set_version = string
#     })
#     description = "WAF configuration"
#     default = {
#         enabled = true
#         firewall_mode = "Detection"
#         rule_set_type = "OWASP"
#         rule_set_version = "3.2"
#     }
# }

variable "apgw_name" {
  description = "The name of the Application Gateway"
  type        = string
}

variable "gateway_ip_configuration" {
  description = "The name of the gateway IP configuration"
  type        = string
}

variable "frontend_port_name" {
  description = "The name of the frontend port"
  type        = string
}

variable "frontend_ip_configuration_name" {
  description = "The name of the frontend IP configuration"
  type        = string
}

variable "public_ip_address_id" {
  description = "The ID of the public IP address for the Application Gateway"
  type        = string
}

variable "private_ip_address" {
  description = "The private IP address for the Application Gateway's frontend IP configuration"
  type        = string
  default     = "10.0.0.10"  # Example default, you can adjust this as needed
}

variable "backend_address_pool_name" {
  description = "The name of the backend address pool"
  type        = string
}

variable "http_setting_name" {
  description = "The name of the backend HTTP setting"
  type        = string
}

variable "listener_name" {
  description = "The name of the HTTP listener"
  type        = string
}

variable "request_routing_rule_name" {
  description = "The name of the request routing rule"
  type        = string
}

# Optional variables for additional flexibility
variable "sku_name" {
  description = "The SKU name for the Application Gateway"
  type        = string
  default     = "Standard_v2"
}

variable "sku_tier" {
  description = "The SKU tier for the Application Gateway"
  type        = string
  default     = "Standard_v2"
}

variable "sku_capacity" {
  description = "The capacity of the Application Gateway"
  type        = number
  default     = 2
}

variable "subnet_id" {
  description = "The ID of the subnet in which the Application Gateway is deployed"
  type        = string
}

