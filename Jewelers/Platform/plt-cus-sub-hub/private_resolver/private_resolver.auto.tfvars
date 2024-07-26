subscription_id          = "3a5271d7-a7d6-4584-818c-238fa6355819"
location                 = "centralus"
dns_resolver_name        = "h-cus-dnspr-dns01"
resource_group_name      = "h-cus-rg-privatednsresolver"
virtual_network_id       = "/subscriptions/3a5271d7-a7d6-4584-818c-238fa6355819/resourceGroups/h-cus-rg-hub/providers/Microsoft.Network/virtualNetworks/h-cus-vnet-hub"
create_inbound_endpoint  = false
create_outbound_endpoint = false

## To add endpoints create a string list example ["inbound-endpoint-1", "inbound-endpoint-2"] 
##for all of the inbound and outbound endpoints you want to make
inbound_endpoint_names   = ["h-cus-ep-dns01in"]
outbound_endpoint_names  = ["h-cus-ep-dns01out"]

##To add one or more enpoint subnets add a string list exmple ["subnet-id-1", "subnet-id-2"]
inbound_subnet_ids        = ["/subscriptions/3a5271d7-a7d6-4584-818c-238fa6355819/resourceGroups/h-cus-rg-hub/providers/Microsoft.Network/virtualNetworks/h-cus-vnet-hub/subnets/h-cus-snet-privatednsin"]
outbound_subnet_ids       = ["/subscriptions/3a5271d7-a7d6-4584-818c-238fa6355819/resourceGroups/h-cus-rg-hub/providers/Microsoft.Network/virtualNetworks/h-cus-vnet-hub/subnets/h-cus-snet-privatednsout"]


tags = {
  Applications  = "Private DNS Resolver"
  BusinessOwner = "IT"
  ITOwner       = "Networking"
  CreatedBy     = "ggibson@3cloudsolutions.com"
  CreatedOn     = "06/24/2024"
  Department    = "IT"
  Description   = "Private DNS Resolver"
  DisplayName   = "Private DNS Resolver"
  Environment   = "Production Hub"
  Tier          = "1"
}