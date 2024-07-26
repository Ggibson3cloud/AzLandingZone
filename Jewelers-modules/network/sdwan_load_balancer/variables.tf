variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "location" {
  description = "The location of the resources"
  type        = string
}

variable "load_balancer_name" {
  description = "The name of the load balancer"
  type        = string
}

variable "frontend_ip_configuration_name" {
  description = "The name of the frontend IP configuration"
  type        = string
}

variable "subnet_id" {
  description = "The ID of the subnet"
  type        = string
}

variable "private_ip_address" {
  description = "The private IP address for the internal load balancer"
  type        = string
}

variable "sku" {
  description = "The SKU of the load balancer"
  type        = string
  default     = "Standard"
}

variable "tags" {
  description = "Tags for the resources"
  type        = map(string)
  default     = {}
}
