subscription_id     = "8cc21a98-4584-4bed-8643-4cb6fd0d7bbf"
location            = "eastus2"
dns_resolver_name   = "h-eus2-dnspr-dns01"
resource_group_name = "h-eus2-rg-privatednsresolver"
virtual_network_id  = "/subscriptions/8cc21a98-4584-4bed-8643-4cb6fd0d7bbf/resourceGroups/h-eus2-rg-hub/providers/Microsoft.Network/virtualNetworks/h-eus2-vnet-hub"

create_inbound_endpoint  = false
create_outbound_endpoint = false

## To add endpoints create a string list example ["inbound-endpoint-1", "inbound-endpoint-2"] 
##for all of the inbound and outbound endpoints you want to make
inbound_endpoint_names  = ["h-eus2-ep-dns01in"]
outbound_endpoint_names = ["h-eus2-ep-dns01out"]

##To add one or more enpoint subnets add a string list exmple ["subnet-id-1", "subnet-id-2"]
inbound_subnet_ids  = ["/subscriptions/8cc21a98-4584-4bed-8643-4cb6fd0d7bbf/resourceGroups/h-eus2-rg-hub/providers/Microsoft.Network/virtualNetworks/h-eus2-vnet-hub/subnets/h-eus2-snet-privatednsin"]
outbound_subnet_ids = ["/subscriptions/8cc21a98-4584-4bed-8643-4cb6fd0d7bbf/resourceGroups/h-eus2-rg-hub/providers/Microsoft.Network/virtualNetworks/h-eus2-vnet-hub/subnets/h-eus2-snet-privatednsout"]


tags = {
  Applications  = "Private DNS Resolver"
  BusinessOwner = "IT"
  ITOwner       = "Networking"
  CreatedBy     = "ggibson@3cloudsolutions.com"
  CreatedOn     = "10/08/2024"
  Department    = "IT"
  Description   = "Private DNS Resolver"
  DisplayName   = "Private DNS Resolver"
  Environment   = "Production DR Hub"
  Tier          = "1"
}