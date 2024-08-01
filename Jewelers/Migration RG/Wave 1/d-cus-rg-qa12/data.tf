data "azurerm_subnet" "snet" {
  name                 = "d-cus-snet-sqlmi"
  virtual_network_name = "d-cus-vnet-sql"
  resource_group_name  = "d-cus-rg-sql"
}

data "azurerm_key_vault" "keyvault" {
  name                = "d-cus-kv-sql01"
  resource_group_name = "d-cus-rg-sql-shared01"
}