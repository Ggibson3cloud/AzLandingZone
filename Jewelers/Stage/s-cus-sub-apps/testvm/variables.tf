variable "location" {
  description = "(Required) Azure region"
  type        = string
}
variable "tags" {
  description = "(Required) Tags to be applied"
  type        = map(string)
}
variable "rg_name" {
  description = "(Required) Name of azure resource group to create"
  type        = string
}

variable "public_ip_name" {
    description = "Name for public IP"
    type = string 
}

variable "subscription" {}
variable "ADDS" {}
variable "key_vault_name" {}