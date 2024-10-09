data "azurerm_subnet" "this" {
  name                 = "p-cus-snet-appgw"
  virtual_network_name = "p-cus-vnet-edge"
  resource_group_name  = "p-cus-rg-edge"
}
