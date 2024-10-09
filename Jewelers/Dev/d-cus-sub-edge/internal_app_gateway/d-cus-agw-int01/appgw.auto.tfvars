resource_group_name = "d-cus-rg-intagw"
location            = "centralus"
appgw_name          = "d-cus-agw-int01"

private_ip_address = "10.130.82.6"
subscription_id    = "b9fde64c-291c-4f7f-aaac-e2d1b13d8e68"

tags = {
  Applications  = "Networking"
  BusinessOwner = "IT"
  ITOwner       = "Networking"
  CreatedBy     = "ggibson@3cloudsolutions.com"
  CreatedOn     = "09/30/2024"
  Department    = "IT"
  Description   = "Dev Internal App Gateway Resources"
  DisplayName   = "Dev Internal App Gateway Resources"
  Environment   = "Dev"
  Tier          = "2"
}