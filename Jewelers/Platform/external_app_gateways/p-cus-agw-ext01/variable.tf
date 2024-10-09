variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "location" {
  description = "The location of the resources"
  type        = string
  default     = "East US" # You can modify this default location as needed
}

variable "public_ip_name" {
  description = "The name of the Public IP address"
  type        = string
}


variable "subscription_id" {}