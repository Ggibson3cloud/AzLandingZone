
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
  name         = join("-", [azurerm_mssql_server.this.name, "randpass"])
  value        = random_string.local_password.result
  key_vault_id = var.key_vault_id
}

resource "azurerm_key_vault_secret" "vm-username" {
  name         = join("-", [azurerm_mssql_server.this.name, "username"])
  value        = var.adminUser
  key_vault_id = var.key_vault_id
}


# Define the SQL Server
resource "azurerm_mssql_server" "this" {
  name                         = var.sql_server_name
  resource_group_name          = var.resource_group_name
  location                     = var.location
  version                      = "12.0"
  administrator_login          = var.adminUser
  administrator_login_password = random_string.local_password.result
  tags = var.tags
}

# Define the SQL Database
resource "azurerm_mssql_database" "databases" {
  for_each       = var.databases
  name           = each.key
  server_id      = azurerm_mssql_server.this.id
  collation      = each.value.collation
  max_size_gb    = each.value.max_size_gb
  read_scale     = each.value.read_scale
  sku_name       = each.value.sku
  zone_redundant = each.value.zone_redundant
  license_type   = "LicenseIncluded"

  tags = var.tags 

 
}

