data "azurerm_subnet" "snet-01" {
  name                 = "i-eus2-snet-domain"
  virtual_network_name = "i-eus2-vnet-identity"
  resource_group_name  = "i-eus2-rg-identity"
}

data "azurerm_key_vault" "keyvault" {
  name                = "i-eus2-kv-identity01"
  resource_group_name = "i-eus2-rg-identity"
}