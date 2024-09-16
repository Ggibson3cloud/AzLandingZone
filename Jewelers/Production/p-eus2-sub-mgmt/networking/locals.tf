locals {
  tenant_identifier = substr(data.azurerm_client_config.current.tenant_id, 0, 3)
}