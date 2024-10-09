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

variable "tags" {}

variable "key_vault_name" {
  description = "Name of the Key Vault"
  type        = string
}