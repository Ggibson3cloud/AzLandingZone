#################################################################
######################### Subscriptions #########################

# PLT-CUS-Hub = 3a5271d7-a7d6-4584-818c-238fa6355819
# PLT-CUS-Identity = 1d8bcd67-7874-4cfa-9da0-06038011c26b
# PLT-CUS-SharedService = fc0f9a38-a35a-479a-a5ab-65bfd51dd52f

#################################################################
#################################################################


location                                = "centralus"
rg_name                                 = "h-cus-rg-sdwan"
subscriptionid                          = "3a5271d7-a7d6-4584-818c-238fa6355819"
sku                                     = "Standard"
internal_lb_name                        = "h-cus-ilb-sdwan"
private_ip_address_ilb                  = "10.251.11.71"
frontend_ip_configuration_name_internal = "internal"
subnet_id                               = "/subscriptions/3a5271d7-a7d6-4584-818c-238fa6355819/resourceGroups/h-cus-rg-hub/providers/Microsoft.Network/virtualNetworks/h-cus-vnet-hub/subnets/h-cus-snet-sdwaninside"




tags = {
  Applications  = "Networking"
  BusinessOwner = "IT"
  ITOwner       = "Networking"
  CreatedBy     = "ggibson@3cloudsolutions.com"
  CreatedOn     = "07/17/2024"
  Department    = "IT"
  Description   = "SDWAN Load Balancer"
  DisplayName   = "SDWAN Load Balancer"
  Environment   = "Production Hub"
  Tier          = "1"
}
