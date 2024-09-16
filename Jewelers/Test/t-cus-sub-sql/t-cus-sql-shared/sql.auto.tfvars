rg_name                                  = "t-cus-rg-sql-shared01"
storage_account_name                     = "tsacussql01"
key_vault_name                           = "t-cus-kv-sql01"
location                                 = "centralus"
subscription_id = "c235f0a6-d999-4743-ae3f-b5d8e93ad7ba"
storage_account_replication_type         = "LRS"
storage_account_is_gen2                  = true
sftp_enabled                             = false
storage_account_blob_retention_days      = 30
storage_account_container_retention_days = 30
storage_account_is_versioning_enabled    = false

tags = {
  Applications  = "Database"
  BusinessOwner = "IT"
  ITOwner       = "Database Team"
  CreatedBy     = "ggibson@3cloudsolutions.com"
  CreatedOn     = "08/13/2024"
  Department    = "IT"
  Description   = "Test SQL team shared resources like storage account and key vault "
  DisplayName   = "Test sql shared resources"
  Environment   = "Test"
  Tier          = "2"
}
