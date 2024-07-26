variable "location" {
  description = "(Required) Azure region"
  type        = string
}

variable "rg_name" {
  description = "Names of the Resource Groups to be created in the Hub Subscription"
  type        = string
}

variable "subscriptionid" {}

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

variable "tags" {
  description = "(Required) Tags to be applied"
  type        = map(string)
}

variable "subnet_id" {
  type = string

}