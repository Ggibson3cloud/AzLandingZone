data "azurerm_client_config" "current" {}

# Hub VNET
data "azurerm_virtual_network" "hub_vnet" {
  provider            = azurerm.hub
  name                = "h-cus-vnet-hub"
  resource_group_name = data.azurerm_resource_group.hub_rg.name
}

# Hub RG
data "azurerm_resource_group" "hub_rg" {
  provider = azurerm.hub
  name     = "h-cus-rg-hub"
}
