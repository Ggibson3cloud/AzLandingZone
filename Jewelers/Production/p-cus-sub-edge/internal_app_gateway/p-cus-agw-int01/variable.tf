variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "location" {
  description = "The location of the resources"
  type        = string
}

variable "private_ip_address" {
  description = "Private ip address for app gateway"
  type        = string
}

variable "appgw_name" {
  description = "The name of the Application Gateway"
  type        = string

}
variable "subscription_id" {}

variable "tags" {}