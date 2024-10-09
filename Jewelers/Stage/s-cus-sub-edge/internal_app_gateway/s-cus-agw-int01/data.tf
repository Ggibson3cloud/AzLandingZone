data "azurerm_subnet" "this" {
  name                 = "s-cus-snet-appgw"
  virtual_network_name = "s-cus-vnet-edge"
  resource_group_name  = "s-cus-rg-edge"
}
