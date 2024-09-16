subscriptionid = "87aa7e85-aae4-4190-912c-1ce47b69f963"

rg_name  = "t-cus-kv-qa06"
location = "centralus"

tags = {
  Applications  = "SQLMI"
  BusinessOwner = "JMI IT"
  ITOwner       = "Database Team"
  CreatedBy     = "ggibson@3cloudsolutions.com"
  CreatedOn     = "08/15/2024"
  Department    = "IT"
  Description   = "SQLMI and required resources for qa06 for Test"
  DisplayName   = "SQLMI qa06 Test"
  Environment   = "Test"
  Tier          = "2"
}


##########################################################################
#sqlmi
#to add more instances just add a new key example commented out below
##########################################################################
sqlmi = {
  t-cus-mssql-mi-qa12 = {
    license_type       = "LicenseIncluded"
    sku                = "GP_Gen5"
    collation          = "Latin1_General_100_CI_AS"
    storage_size_in_gb = 640
    vcores             = 4
 databases = [
  "DataRetention_Support_12",
  "DataRetention_Support_12_TEST",
  "DataRetention_Support_DW",
  "EntLog",
  "JAMSQA6V7",
  "JMFinance",
  "JMIntegrations",
  "JMMarketing",
  "JMModelling",
  "JMServices",
  "JMSupport",
  "JMSurvey",
  "PLEcom",
  "PLEcom_QA6",
  "PmtServices",
  "RB_Rating",
  "RJC",
  "RJC_TEST",
  "SmartCommLogs",
  "SQLAudit"
]


  },
  #   sqlmi2 = {
  #     license_type     = "LicenseIncluded"
  #     sku              = "GP_Gen5_2"
  #     storage_size_in_gb = 32
  #     vcores           = 2
  #     databases        = ["base", "first", "second"]
  #   }
}
