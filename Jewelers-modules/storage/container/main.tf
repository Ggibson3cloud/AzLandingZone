resource "azurerm_storage_container" "container" {
  name                  = var.container_name
  storage_account_name  = var.storage_account_name
  container_access_type = "private"
}

resource "azurerm_key_vault_secret" "sas_token" {
  name         = "${var.container_name}sas"
  value        = data.azurerm_storage_account_blob_container_sas.container_sas_token.sas
  key_vault_id = var.key_vault_id
}