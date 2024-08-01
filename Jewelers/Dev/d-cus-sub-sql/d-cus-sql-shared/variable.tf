variable "subscription_id" {
  description = "The Subscription ID for Azure"
  type        = string
}

variable "rg_name" {
  description = "The name of the resource group"
  type        = string
}

variable "storage_account_name" {
  description = "The name of the storage account"
  type        = string
}

variable "location" {
  description = "The location of the storage account"
  type        = string
}

variable "storage_account_replication_type" {
  description = "The replication type for the storage account"
  type        = string
}

variable "storage_account_is_gen2" {
  description = "Whether the storage account is Gen2"
  type        = bool
}

variable "sftp_enabled" {
  description = "Whether SFTP is enabled on the storage account"
  type        = bool
}

variable "storage_account_blob_retention_days" {
  description = "The number of days to retain deleted blobs"
  type        = number
}

variable "storage_account_container_retention_days" {
  description = "The number of days to retain deleted containers"
  type        = number
}

variable "storage_account_is_versioning_enabled" {
  description = "Whether versioning is enabled on the storage account"
  type        = bool
}

variable "tags" {
  description = "A map of tags to assign to the resource"
  type        = map(string)
}

variable "key_vault_name" {
  description = "Name of key vault"
  type        = string
}