subscriptionid = "87aa7e85-aae4-4190-912c-1ce47b69f963"

rg_name  = "t-cus-rg-anonymization99"
location = "centralus"

tags = {
  Applications  = "Anonymizations"
  BusinessOwner = "JMI IT"
  ITOwner       = "Database Team"
  CreatedBy     = "ggibson@3cloudsolutions.com"
  CreatedOn     = "08/15/2024"
  Department    = "IT"
  Description   = "SQLMI and required resources for Anonymizations"
  DisplayName   = "SQLMI Anonymizations"
  Environment   = "Test"
  Tier          = "2"
}


##########################################################################
#sqlmi
#to add more instances just add a new key example commented out below
##########################################################################
sqlmi = {
  t-cus-sqlmi-qa99 = {
    license_type       = "LicenseIncluded"
    sku                = "GP_Gen5"
    collation          = "Latin1_General_100_CI_AS"
    storage_size_in_gb = 896
    vcores             = 4
databases = [
  "DataRetention_Home",
  "DataScrubbing_Home",
  "DataScrubbing_Support_14",
  "DataScrubbing_Support_16",
  "DataScrubbing_Support_16DW",
  "DataScrubbing_Support_17",
  "DW_DDS",
  "DW_DQ",
  "DW_INT",
  "DW_SOURCE",
  "DW_STAGE",
  "GW_Reporting",
  "JMFinance",
  "JMReports",
  "JMServices",
  "JMSupport",
  "JMSurvey",
  "PayOnline_Legacy",
  "PLEcom",
  "RJC"
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
