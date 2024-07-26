data "azurerm_client_config" "current" {}

# data "azurerm_monitor_diagnostic_categories" "keyvault" {
#   resource_id = module.ss_keyvault.id
# }