rg_name                                  = "test"
storage_account_name                     = "testgg1234"
key_vault_name                           = "testgg123"
location                                 = "centralus"
subscription_id                          = "cc0f060c-71f0-46eb-883a-29f7386b1d34"
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
