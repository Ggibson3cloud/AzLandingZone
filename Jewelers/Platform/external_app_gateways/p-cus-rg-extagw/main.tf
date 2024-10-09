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