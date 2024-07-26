data "azurerm_storage_account" "storage_account" {
  resource_group_name = var.resource_group_name
  name                = var.storage_account_name
}


data "azurerm_storage_account_blob_container_sas" "container_sas_token" {
  connection_string = data.azurerm_storage_account.storage_account.primary_connection_string
  container_name    = azurerm_storage_container.container.name
  https_only        = true

  start  = "2024-01-01"
  expiry = "2034-01-02"

  permissions {
    read   = true
    add    = false
    create = false
    write  = true
    delete = false
    list   = true
  }
}