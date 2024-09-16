variable "location" {
  description = "(Required) Azure region"
  type        = string
}
variable "tags" {
  description = "(Required) Tags to be applied"
  type        = map(string)
}
variable "rg_name" {
  description = "Name of the Resource Groups to be created in the Hub Subscription"
  type        = string
}
variable "route_tables" {}
variable "subscription_id" {}
# variable "key_vault_name" {}
variable "vnets" {}
variable "subnet" {}
variable "nsgs" {}

variable "hubid" {}
variable "key_vault_name" {}

variable "subnet_route_table_associations" {
  description = "Mapping of subnets to route tables"
  type = map(object({
    subnet      = string
    route_table = string
  }))
  default = {}
}
