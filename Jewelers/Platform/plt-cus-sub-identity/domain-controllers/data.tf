data "azurerm_subnet" "snet-01" {
  name                 = "i-cus-snet-domain"
  virtual_network_name = "i-cus-vnet-identity"
  resource_group_name  = "i-cus-rg-identity"
}

data "azurerm_key_vault" "keyvault" {
  name                = "i-cus-kv-identity-01"
  resource_group_name = "i-cus-rg-identity"
}