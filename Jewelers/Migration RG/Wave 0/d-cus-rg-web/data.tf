data "azurerm_subnet" "snet" {
  name                 = "d-cus-snet-servers"
  virtual_network_name = "d-cus-vnet-apps"
  resource_group_name  = "d-cus-rg-apps"
}
