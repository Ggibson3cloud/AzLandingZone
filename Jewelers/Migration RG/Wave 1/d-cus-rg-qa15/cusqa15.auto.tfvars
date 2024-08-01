subscriptionid = "162e080c-8cbc-4a7f-bbd3-466d3fd5d0cb"

rg_name  = "d-cus-rg-qa15"
location = "centralus"

tags = {
  Applications  = "SQLMI"
  BusinessOwner = "JMI IT"
  ITOwner       = "Database Team"
  CreatedBy     = "ggibson@3cloudsolutions.com"
  CreatedOn     = "07/30/2024"
  Department    = "IT"
  Description   = "SQLMI and required resources for qa15"
  DisplayName   = "SQLMI qa15"
  Environment   = "Development"
  Tier          = "2"
}


##########################################################################
#sqlmi
#to add more instances just add a new key example commented out below
##########################################################################
sqlmi = {
  d-cus-sqlmi-qa15 = {
    license_type       = "LicenseIncluded"
    sku                = "GP_Gen5"
    collation          = "Latin1_General_100_CI_AS"
    storage_size_in_gb = 448
    vcores             = 4
    databases = [
  "EntLog", 
  "JAMSQA15V7", 
  "JMFinance", 
  "JMServices", 
  "JMSupport", 
  "JMSurvey", 
  "PLEcom", 
  "PmtServices", 
  "RB_Rating", 
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
