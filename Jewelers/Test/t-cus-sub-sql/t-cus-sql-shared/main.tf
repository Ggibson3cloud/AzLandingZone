#---------------------------------------------------------
# RESOURCE GROUPS
#---------------------------------------------------------

module "resource_group" {
  source   = "../../../../Jewelers-modules/base/resource_group"
  name     = var.rg_name
  location = var.location
  tags     = var.tags
}

#---------------------------------------------------------
# Keyvault 
#---------------------------------------------------------

module "keyvault" {
  source                        = "../../../../Jewelers-modules/base/key_vault"
  key_vault_name                = var.key_vault_name
  key_vault_resource_group_name = module.resource_group.name
  location                      = var.location
  tenant_id                     = data.azurerm_client_config.current.tenant_id
  enable_rbac_authorization     = true
  purge_protection_enabled      = false
  tags                          = var.tags

}

#---------------------------------------------------------
# Storage Account
#---------------------------------------------------------

module "storage_account" {
  source = "../../../../Jewelers-modules/storage/storage_account"

  storage_account_name                     = var.storage_account_name
  location                                 = var.location
  storage_account_resource_group_name      = module.resource_group.name
  storage_account_replication_type         = var.storage_account_replication_type
  storage_account_is_gen2                  = var.storage_account_is_gen2
  sftp_enabled                             = var.sftp_enabled
  storage_account_blob_retention_days      = 30
  storage_account_container_retention_days = 30
  storage_account_is_versioning_enabled    = var.storage_account_is_versioning_enabled
  tags                                     = var.tags

}

resource "azurerm_role_assignment" "sqladmins_contributor" {
  scope               = module.resource_group.id
  role_definition_name = "Contributor"
  principal_id        = data.azuread_group.sqladmins.object_id
}


resource "azurerm_role_assignment" "sqladmins_key_vault_administrator" {
  scope                = module.keyvault.id
  role_definition_name = "Key Vault Administrator"
  principal_id         = data.azuread_group.sqladmins.object_id
}

