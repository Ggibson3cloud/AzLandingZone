data "azurerm_key_vault" "keyvault" {
  name                = "t-cus-kv-sql01"
  resource_group_name = "t-cus-rg-sql-shared01"
}

data "azuread_group" "sqladmins" {
  display_name = "SQLAdmins"
}

data "azurerm_subnet" "subnet" {
  virtual_network_name = "t-cus-vnet-sql"
  name = "t-cus-snet-privendpoint"
  resource_group_name = "t-cus-rg-sql"
  
}