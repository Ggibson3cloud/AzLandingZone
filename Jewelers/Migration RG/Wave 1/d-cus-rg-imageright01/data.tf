data "azurerm_key_vault" "keyvault" {
  name                = "d-cus-kv-sql01"
  resource_group_name = "d-cus-rg-sql-shared01"
}