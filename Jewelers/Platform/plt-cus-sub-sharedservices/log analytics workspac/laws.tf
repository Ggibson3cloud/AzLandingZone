#-------------------------------
# Monitoring Resource Group
#-------------------------------
module "resource_group" {
  source   = "../../../../Jewelers-modules/base/resource_group"
  name     = var.rg_name #az-corp-dev-euwe-azm-rg
  location = var.location
  tags     = var.tags
}

#-------------------------------
# Log Analytics Workspace
# #-------------------------------
resource "azurerm_log_analytics_workspace" "this" {
  name                = var.laws_name
  location            = module.resource_group.location
  resource_group_name = module.resource_group.name
  sku                 = "PerGB2018"
  retention_in_days   = 365
}

#-------------------------------
# LAWS Storage Account
#-------------------------------
module "storage_account" {
  source                                   = "../../../../Jewelers-modules/storage/storage_account"
  storage_account_name                     = var.storage_account_name
  location                                 = var.location
  storage_account_resource_group_name      = module.resource_group.name
  storage_account_replication_type         = var.storage_account_replication_type
  storage_account_is_gen2                  = var.storage_account_is_gen2
  sftp_enabled                             = var.sftp_enabled
  storage_account_blob_retention_days      = var.storage_account_blob_retention_days
  storage_account_container_retention_days = var.storage_account_container_retention_days
  storage_account_is_versioning_enabled    = var.storage_account_is_versioning_enabled
  tags                                     = var.tags
}