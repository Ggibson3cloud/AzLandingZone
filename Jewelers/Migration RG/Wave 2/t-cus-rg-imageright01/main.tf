module "resource_group" {
  source   = "../../../../Jewelers-modules/base/resource_group"
  name     = var.rg_name
  location = var.location
  tags     = var.tags
}

module "azure_sql_database" {
  source = "../../../../Jewelers-modules/compute/sql_virtual_machine"

  sql_server_name     = var.sql_server_name
  resource_group_name = module.resource_group.name
  location            = var.location
  adminUser           = var.adminUser
  key_vault_id        = data.azurerm_key_vault.keyvault.id
  databases           = var.databases
  tags                = var.tags

}

resource "azurerm_role_assignment" "sqladmins_contributor" {
  scope                = module.resource_group.id
  role_definition_name = "Contributor"
  principal_id         = data.azuread_group.sqladmins.object_id
}
