data "azurerm_subnet" "snet" {
  name                 = "t-cus-snet-sqlmi"
  virtual_network_name = "t-cus-vnet-sql"
  resource_group_name  = "t-cus-rg-sql"
}

data "azurerm_key_vault" "keyvault" {
  name                = "t-cus-kv-sql01"
  resource_group_name = "t-cus-rg-sql-shared01"
}

data "azuread_group" "sqladmins" {
  display_name = "SQLAdmins"
}
