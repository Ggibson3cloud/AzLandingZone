subscriptionid = "162e080c-8cbc-4a7f-bbd3-466d3fd5d0cb"

# Resource Group variables
rg_name  = "d-cus-rg-imageright"
location = "centralus"

# Tags for the resources
tags = {
  Applications  = "SQL Database"
  BusinessOwner = "JMI IT"
  ITOwner       = "Database Team"
  CreatedBy     = "ggibson@3cloudsolutions.com"
  CreatedOn     = "07/30/2024"
  Department    = "IT"
  Description   = "SQL Database for Imagright and required resources"
  DisplayName   = "SQL Database Imageright"
  Environment   = "Development"
  Tier          = "2"
}

# SQL Server variables
sql_server_name = "d-cus-sqlserver-imageright01"
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
