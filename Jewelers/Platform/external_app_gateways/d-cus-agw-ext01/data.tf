data "azurerm_subnet" "this" {
  name                 = "h-cus-snet-appgw"
  virtual_network_name = "h-cus-vnet-appgw"
  resource_group_name  = "h-cus-rg-hub"
}
