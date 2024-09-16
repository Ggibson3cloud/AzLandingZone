subscription_id = "8cc21a98-4584-4bed-8643-4cb6fd0d7bbf"

rg_name  = "h-eus2-rg-ftdv"
location = "eastus2"
tags = {
  Applications  = "Networking"
  BusinessOwner = "IT"
  ITOwner       = "Networking"
  CreatedBy     = "ggibson@3cloudsolutions.com"
  CreatedOn     = "09/05/2024"
  Department    = "IT"
  Description   = "Disaster Recovery ftdv rg"
  DisplayName   = "DR ftdv rg"
  Environment   = "DR Production"
  Tier          = "1"
}


sku       = "Standard"
subnet_id = "/subscriptions/8cc21a98-4584-4bed-8643-4cb6fd0d7bbf/resourceGroups/h-eus2-rg-hub/providers/Microsoft.Network/virtualNetworks/h-eus2-vnet-hub/subnets/h-eus2-snet-ftdvinside"


###################################
#Internal Load Balancer
###################################
internal_lb_name                        = "h-eus2-ilb-ftdv"
private_ip_address_ilb                  = "10.251.20.70"
frontend_ip_configuration_name_internal = "internal"

###################################
#External Load Balancer
###################################
external_lb_name                   = "h-eus2-elb-ftdv"
frontend_ip_configuration_external = "external"
