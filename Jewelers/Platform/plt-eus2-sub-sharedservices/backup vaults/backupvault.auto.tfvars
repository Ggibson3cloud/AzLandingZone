subscription_id = "fc0f9a38-a35a-479a-a5ab-65bfd51dd52f"
rg_name         = "o-cus-brv-shared01"
location        = "centralus"
tags = {
  Applications  = "Backup"
  BusinessOwner = "IT"
  ITOwner       = "IT"
  CreatedBy     = "ggibson@3cloudsolutions.com"
  CreatedOn     = "07/24/2024"
  Department    = "IT"
  Description   = "Backup Vaults"
  DisplayName   = "Backup Vaults"
  Environment   = "Production SS"
  Tier          = "1"
}

backup_vaults = {
  platform = {
    vault_name      = "o-cus-brv-platform01"
    redundancy_type = "GeoRedundant"  ##GeoRedundant,LocallyRedundant or ZoneRedundant
    tags = {
      Applications  = "Backup"
      BusinessOwner = "IT"
      ITOwner       = "IT"
      CreatedBy     = "ggibson@3cloudsolutions.com"
      CreatedOn     = "07/24/2024"
      Department    = "IT"
      Description   = "Backup Vault for Platform"
      DisplayName   = "Backup Vault for Platform"
      Environment   = "Production SS"
      Tier          = "1"
    }
  }
  dev = {
    vault_name      = "o-cus-brv-dev01"
    redundancy_type = "LocallyRedundant"  ##GeoRedundant,LocallyRedundant or ZoneRedundant
    tags = {
      Applications  = "Backup"
      BusinessOwner = "IT"
      ITOwner       = "IT"
      CreatedBy     = "ggibson@3cloudsolutions.com"
      CreatedOn     = "07/24/2024"
      Department    = "IT"
      Description   = "Backup Vault for Dev"
      DisplayName   = "Backup Vault for Dev"
      Environment   = "Production SS"
      Tier          = "1"
    }
  }
}
