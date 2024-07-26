variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "location" {
  description = "The location of the resource group"
  type        = string
}

variable "load_balancer_name" {
  description = "The name of the load balancer"
  type        = string
}

variable "frontend_ip_address" {
  default = "The frontend ip address"
  type = string
  
}
variable "frontend_ip_configuration_name" {
  description = "The name of the frontend IP configuration"
  type        = string
}

variable "public_ip_id" {
  description = "The ID of the public IP (if external)"
  type        = string
  default     = null
}

variable "subnet_id" {
  description = "The ID of the subnet (if internal)"
  type        = string
  default     = null
}

variable "private_ip_address" {
  description = "The static private IP address (if internal)"
  type        = string
  default     = null
}

variable "is_internal" {
  description = "Specify if the load balancer is internal"
  type        = bool
}

variable "tags" {
  description = "(Required) Tags to be applied"
  type        = map(string)
}


variable "sku" {
  description = "load balancer sku"
  type        = string
}

variable "public_ip_address_id" {
  description = "Public ip address id for external lb"
  type = string
  
}