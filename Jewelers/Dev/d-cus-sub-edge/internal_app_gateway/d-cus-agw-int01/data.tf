data "azurerm_subnet" "this" {
  name                 = "d-cus-snet-appgw"
  virtual_network_name = "d-cus-vnet-edge"
  resource_group_name  = "d-cus-rg-edge"
}
