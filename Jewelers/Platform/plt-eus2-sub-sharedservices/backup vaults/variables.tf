variable "subscription_id" {
  description = "The subscription ID where the resources will be deployed."
  type        = string
}

variable "rg_name" {
  description = "The name of the resource group."
  type        = string
}

variable "location" {
  description = "The location/region where the resources will be deployed."
  type        = string
}

variable "tags" {
  description = "A map of tags to assign to the resources."
  type        = map(string)
}

variable "backup_vaults" {
  description = "Map of backup vault configurations."
  type = map(object({
    vault_name      = string
    redundancy_type = string
    tags            = map(string)
  }))
}