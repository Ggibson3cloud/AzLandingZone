subscriptionid = "87aa7e85-aae4-4190-912c-1ce47b69f963"

rg_name  = "t-cus-rg-qa04"
location = "centralus"

tags = {
  Applications  = "SQLMI"
  BusinessOwner = "JMI IT"
  ITOwner       = "Database Team"
  CreatedBy     = "ggibson@3cloudsolutions.com"
  CreatedOn     = "08/15/2024"
  Department    = "IT"
  Description   = "SQLMI and required resources for qa04 in Test"
  DisplayName   = "SQLMI qa04 Test"
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
    storage_size_in_gb = 800
    vcores             = 4
 databases = [
  "Aspnet",
  "EntLog",
  "JAMSQA4V7",
  "JMFinance",
  "JMIntegrations",
  "JMMarketing",
  "JMModelling",
  "JMServices",
  "JMSupport",
  "JMSurvey",
  "KPI",
  "KPI_Refresh",
  "PayOnline_Legacy",
  "PLEcom",
  "PLEcom_ASPState",
  "PmtServices",
  "RB_Rating",
  "RJC",
  "SmartCommLogs",
  "SQLVersion"
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
