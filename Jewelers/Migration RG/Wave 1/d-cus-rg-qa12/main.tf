module "resource_group" {
  source   = "../../../../Jewelers-modules/base/resource_group"
  name     = var.rg_name
  location = var.location
  tags     = var.tags
}


module "sql_mi" {

  source              = "../../../../Jewelers-modules/compute/sql_mi"
  for_each            = var.sqlmi
  sqlmi_name          = each.key
  resource_group_name = module.resource_group.name
  location            = var.location
  collation           = each.value.collation
  license_type        = each.value.license_type
  sku                 = each.value.sku
  storage_size_in_gb  = each.value.storage_size_in_gb
  vcores              = each.value.vcores
  subnet_id           = data.azurerm_subnet.snet.id
  key_vault_id        = data.azurerm_key_vault.keyvault.id
  database_name       = each.value.databases
  tags                = var.tags
}

