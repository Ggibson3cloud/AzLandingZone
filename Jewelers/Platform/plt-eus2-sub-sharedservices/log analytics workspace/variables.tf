variable "subscription_id" {
  description = "The subscription ID"
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

variable "laws_name" {
  description = "The name of the Log Analytics Workspace."
  type        = string
}

variable "storage_account_name" {
  description = "The name of the storage account."
  type        = string
}

variable "storage_account_replication_type" {
  description = "The replication type for the storage account."
  type        = string
}

variable "storage_account_is_gen2" {
  description = "Indicates whether the storage account is Gen2 (true/false)."
  type        = bool
}

variable "sftp_enabled" {
  description = "Indicates whether SFTP is enabled on the storage account (true/false)."
  type        = bool
}

variable "storage_account_is_versioning_enabled" {
  description = "Indicates whether versioning is enabled on the storage account (true/false)."
  type        = bool
}

variable "storage_account_blob_retention_days" {
  description = "The number of days to retain deleted blobs."
  type        = number
  default     = 30
}

variable "storage_account_container_retention_days" {
  description = "The number of days to retain deleted containers."
  type        = number
  default     = 30
}
