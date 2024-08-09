#---------------------------------------------------------
# RESOURCE GROUPS
#---------------------------------------------------------

module "resource_group" {
  source = "../../../../Jewelers-modules/base/resource_group/"

  name     = var.rg_name
  location = var.location
  tags     = var.tags
}

# -------------------------------------------------------------
#  BACKUP VAULTS 
# -------------------------------------------------------------

module "backup_vaults" {
  source = "../../../../Jewelers-modules/storage/backup_vault"

  for_each = var.backup_vaults

  vault_name          = each.value.vault_name
  location            = var.location
  resource_group_name = module.resource_group.name
  redundancy_type     = each.value.redundancy_type
  tags                = var.tags
}