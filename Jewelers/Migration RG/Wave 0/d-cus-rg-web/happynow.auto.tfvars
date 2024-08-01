subscription_id = "5c16164c-9749-4828-9c2a-bb21a762a489"

rg_name  = "d-cus-rg-web"
location = "centralus"

tags = {
  Applications  = "Networking"
  BusinessOwner = "IT"
  ITOwner       = "Networking"
  CreatedBy     = "ggibson@3cloudsolutions.com"
  CreatedOn     = "07/22/2024"
  Department    = "IT"
  Description   = "Development resources for web"
  DisplayName   = "Development web"
  Environment   = "Development"
  Tier          = "3"
}


###################################
#Internal Load Balancer
###################################
sku = "Standard"
internal_lb_name                        = "d-cus-ilb-svco15"
private_ip_address_ilb                  = "10.130.88.21"
frontend_ip_configuration_name_internal = "internal"
