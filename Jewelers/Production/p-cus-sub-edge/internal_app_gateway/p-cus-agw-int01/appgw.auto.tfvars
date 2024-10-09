resource_group_name = "p-cus-rg-intagw"
location            = "centralus"
appgw_name          = "p-cus-agw-int01"

private_ip_address = "10.120.32.133"
subscription_id    = "b6763db2-1ef7-48c9-8933-dad822054c64"

tags = {
  Applications  = "Internal Application Gateway"
  BusinessOwner = "IT"
  ITOwner       = "Networking"
  CreatedBy     = "ggibson@3cloudsolutions.com"
  CreatedOn     = "10/07/2024"
  Department    = "IT"
  Description   = "Production Internal App Gateway Resources"
  DisplayName   = "Production Internal App Gateway Resources"
  Environment   = "Production"
  Tier          = "1"
}