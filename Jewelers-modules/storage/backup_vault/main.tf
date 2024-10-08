resource "azurerm_data_protection_backup_vault" "this" {
  name                = var.vault_name
  resource_group_name = var.resource_group_name
  location            = var.location
  datastore_type      = "VaultStore"
  redundancy          = var.redundancy_type
  tags                = var.tags
}