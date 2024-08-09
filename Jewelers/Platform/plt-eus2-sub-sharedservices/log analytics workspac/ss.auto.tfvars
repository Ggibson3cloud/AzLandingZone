
subscription_id                          = "fc0f9a38-a35a-479a-a5ab-65bfd51dd52f"
laws_name                                = "o-cus-law-sharedservices01"
rg_name                                  = "o-cus-rg-monitoring01"
storage_account_name                     = "ocussalaw01"
location                                 = "centralus"
storage_account_replication_type         = "LRS"
storage_account_is_gen2                  = true
sftp_enabled                             = false
storage_account_blob_retention_days      = 30
storage_account_container_retention_days = 30
storage_account_is_versioning_enabled    = false

tags = {
  Applications  = "Log Analytics Workspace"
  BusinessOwner = "IT"
  ITOwner       = "Security"
  CreatedBy     = "ggibson@3cloudsolutions.com"
  CreatedOn     = "07/23/2024"
  Department    = "IT"
  Description   = "Log Analytics Workspace resources "
  DisplayName   = "LAW resources"
  Environment   = "Shared Services"
  Tier          = "1"
}
