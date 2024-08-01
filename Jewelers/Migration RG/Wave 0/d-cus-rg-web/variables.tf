variable "subscription_id" {
  description = "The Subscription ID for Azure"
  type        = string
}

variable "rg_name" {
  description = "The name of the resource group"
  type        = string
}

variable "location" {
  description = "The location of the resource group"
  type        = string
}

variable "tags" {
  description = "Tags to apply to the resource group"
  type        = map(string)
}

###################################################################
# Internal Load Balancer
###################################################################

variable "internal_lb_name" {
  description = "Name of the internal load balancer"
  type        = string
}

variable "sku" {
  description = "load balancer sku"
  type        = string
}

variable "frontend_ip_configuration_name_internal" {
  description = "Name of the frontend ip configuration"
}

variable "private_ip_address_ilb" {
  description = "Private IP address of the "
  type        = string
}
