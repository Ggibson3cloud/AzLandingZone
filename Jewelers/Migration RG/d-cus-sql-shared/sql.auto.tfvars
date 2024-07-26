rg_name                                  = "d-cus-rg-sql-shared01"
storage_account_name                     = "dsacussql01"
key_vault_name                           = "d-cus-kv-sql01"
location                                 = "centralus"
subscription_id                          = "162e080c-8cbc-4a7f-bbd3-466d3fd5d0cb"
storage_account_replication_type         = "LRS"
storage_account_is_gen2                  = true
sftp_enabled                             = false
storage_account_blob_retention_days      = 30
storage_account_container_retention_days = 30
storage_account_is_versioning_enabled    = false

tags = {
  Applications  = "sql"
  BusinessOwner = "IT"
  ITOwner       = "Database Team"
  CreatedBy     = "ggibson@3cloudsolutions.com"
  CreatedOn     = "07/23/2024"
  Department    = "IT"
  Description   = "Development SQL team shared resources like storage account and key vault "
  DisplayName   = "Development sql shared resources"
  Environment   = "Development"
  Tier          = "4"
}
