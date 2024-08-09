#-------------------------------
# Monitoring Resource Group
#-------------------------------
# module "azm_resource_group" {
#   source   = "../../modules/base/resource_group/"
#   name     = var.azm_rg_name #az-corp-dev-euwe-azm-rg
#   location = var.location
#   tags     = var.tags
# }

#-------------------------------
# Log Analytics Workspace
# #-------------------------------
# resource "azurerm_log_analytics_workspace" "this" {
#   name                = var.laws_name
#   location            = module.azm_resource_group.location
#   resource_group_name = module.azm_resource_group.name
#   sku                 = "PerGB2018"
#   retention_in_days   = 30
# }

#-------------------------------
# LAWS Storage Account
#-------------------------------
# module "LAW_BLOB" {
#   source                                   = "../../modules/storage/storage_account"
#   for_each                                 = var.storage_accounts
#   storage_account_name                     = each.key
#   location                                 = module.azm_resource_group.location
#   storage_account_resource_group_name      = module.azm_resource_group.name
#   storage_account_replication_type         = each.value.storage_account_replication_type
#   storage_account_is_gen2                  = each.value.storage_account_is_gen2
#   sftp_enabled                             = each.value.sftp_enabled
#   storage_account_blob_retention_days      = each.value.storage_account_blob_retention_days
#   storage_account_container_retention_days = each.value.storage_account_container_retention_days
#   storage_account_is_versioning_enabled    = each.value.storage_account_is_versioning_enabled
#   tags                                     = var.tags
# }