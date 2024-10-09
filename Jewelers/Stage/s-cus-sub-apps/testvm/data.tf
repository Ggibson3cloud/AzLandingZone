data "azurerm_subnet" "snet-01" {
  name                 = "s-cus-snet-servers"
  virtual_network_name = "s-cus-vnet-apps"
  resource_group_name  = "s-cus-rg-apps"
}

data "azurerm_key_vault" "keyvault" {
  name                = "s-cus-kv-apps01"
  resource_group_name = "s-cus-rg-apps"
}