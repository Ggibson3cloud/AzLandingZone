subscriptionid = "87aa7e85-aae4-4190-912c-1ce47b69f963"

# Resource Group variables
rg_name  = "t-cus-rg-imageright01"
location = "centralus"

# Tags for the resources
tags = {
  Applications  = "SQL Database"
  BusinessOwner = "JMI IT"
  ITOwner       = "Database Team"
  CreatedBy     = "ggibson@3cloudsolutions.com"
  CreatedOn     = "08/15/2024"
  Department    = "IT"
  Description   = "SQL Database for Imagright and required resources in Test"
  DisplayName   = "SQL Database Imageright Test"
  Environment   = "Test"
  Tier          = "2"
}

# SQL Server variables
sql_server_name = "t-cus-sqlserver-imageright01"
adminUser       = "jmadmin"


# Database configurations
databases = {
  ImageRight = {
    collation      = "SQL_Latin1_General_CP1_CI_AS"
    max_size_gb    = 32
    read_scale     = false
    sku            = "GP_Gen5_2"
    zone_redundant = false
  },

}

