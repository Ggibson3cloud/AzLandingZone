subscriptionid = "162e080c-8cbc-4a7f-bbd3-466d3fd5d0cb"

rg_name  = "d-cus-rg-dev01"
location = "centralus"

tags = {
  Applications  = "SQLMI"
  BusinessOwner = "JMI IT"
  ITOwner       = "Database Team"
  CreatedBy     = "ggibson@3cloudsolutions.com"
  CreatedOn     = "07/30/2024"
  Department    = "IT"
  Description   = "SQLMI and required resources"
  DisplayName   = "SQLMI"
  Environment   = "Development"
  Tier          = "2"
}


##########################################################################
#sqlmi
#to add more instances just add a new key example commented out below
##########################################################################
sqlmi = {
  d-cus-sqlmi-01 = {
    license_type       = "LicenseIncluded"
    sku                = "GP_Gen5"
    collation          = "Latin1_General_100_CI_AS"
    storage_size_in_gb = 128
    vcores             = 4
    databases = [
      "Aspnet",
      "EntLog",
      "JAMSDEV1",
      "JAMSDEV1V7",
      "JMFinance",
      "JMIntegrations",
      "JMMarketing",
      "JMModelling",
      "JMServices",
      "JMSupport",
      "JMSurvey",
      "JSA",
      "PLEcom",
      "PLEcom_ASPState",
      "PmtServices",
      "RJC",
      "RulesEngine",
      "ImageRight",
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
