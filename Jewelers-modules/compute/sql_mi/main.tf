resource "random_string" "local_password" {
  length           = var.passwordLength
  lower            = var.passwordLower
  upper            = var.passwordUpper
  numeric          = var.passwordNumber
  special          = var.passwordSpecial
  min_special      = var.min_special
  override_special = var.override_special
}

resource "azurerm_key_vault_secret" "randpass" {
  name         = join("-", [azurerm_mssql_managed_instance.this.name, "randpass"])
  value        = random_string.local_password.result
  key_vault_id = var.key_vault_id
}

resource "azurerm_key_vault_secret" "vm-username" {
  name         = join("-", [azurerm_mssql_managed_instance.this.name, "username"])
  value        = var.adminUser
  key_vault_id = var.key_vault_id
}

resource "azurerm_mssql_managed_instance" "this" {
  name                         = var.sqlmi_name
  resource_group_name          = var.resource_group_name
  location                     = var.location
  tags                         = var.tags
  license_type                 = var.license_type
  sku_name                     = var.sku
  storage_size_in_gb           = var.storage_size_in_gb
  subnet_id                    = var.subnet_id
  vcores                       = var.vcores
  collation                    = var.collation
  administrator_login          = var.adminUser
  administrator_login_password = random_string.local_password.result

}

resource "azurerm_mssql_managed_database" "this" {
  for_each            = { for db_name in var.database_name : db_name => db_name }
  name                = each.key
  managed_instance_id = azurerm_mssql_managed_instance.this.id

depends_on = [
    azurerm_mssql_managed_instance.this
  ]

  lifecycle {
    prevent_destroy = true
  }

}

