data "azurerm_client_config" "current" {}

data "azuread_group" "sqladmins" {
  display_name = "SQLAdmins"
}