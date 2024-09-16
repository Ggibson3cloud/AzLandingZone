subscriptionid = "3a5271d7-a7d6-4584-818c-238fa6355819"


location = "centralus" // 

tags = {
  Applications  = "Networking"
  BusinessOwner = "IT"
  ITOwner       = "Networking"
  CreatedBy     = "ggibson@3cloudsolutions.com"
  CreatedOn     = "6/24/2024"
  Department    = "IT"
  Description   = "DMZ Virtual Network"
  DisplayName   = "DMZ Virtual Network"
  Environment   = "Production Hub"
  Tier          = "1"
}

#---------------------------------------------------------
# Resource Group Names
#---------------------------------------------------------

rg_name = "h-cus-rg-hub"

#---------------------------------------------------------
# VNETs
#---------------------------------------------------------

vnets = [
  {
    resource_group = "h-cus-rg-hub"
    name           = "h-cus-vnet-dmz"
    cidr           = ["10.251.13.0/24"]
    dns_servers    = []
  },

]

subnet = {

  h-cus-snet-dmz = {
    subnet_range                                   = ["10.251.13.0/24"]
    service_endpoints                              = []
    delegation_name                                = null
    delegation_actions                             = null
    enforce_private_link_endpoint_network_policies = true
    vnet                                           = "h-cus-vnet-dmz"
    nsg                                            = "h-cus-nsg-dmz"
    route_table                                    = null
  },

}

route_tables = [
  {
    name                          = "h-cus-rt-dmz"
    vnet                          = "h-cus-vnet-dmz"
    disable_bgp_route_propagation = false
    nva_routes = [
      {
        name           = "defaultRoute"
        address_prefix = "0.0.0.0/0"
        next_hop_ip    = "10.251.10.70"
      },
    ]
    vnetlocal_routes = []
  },
]

nsgs = [

  {
    name = "h-cus-nsg-dmz"
    rules = [
      {
        description                                = "Allow All Inbound"
        protocol                                   = "*"
        access                                     = "Allow"
        priority                                   = "110"
        direction                                  = "Inbound"
        destination_address_prefix                 = "*"
        destination_application_security_group_ids = null
        destination_port_range                     = "*"
        name                                       = "Allow_All_Inbound"
        source_address_prefix                      = "*"
        source_application_security_group_ids      = null
        source_port_range                          = "*"
      },
      {
        description                                = "Allow All Outbound"
        protocol                                   = "*"
        access                                     = "Allow"
        priority                                   = "120"
        direction                                  = "Outbound"
        destination_address_prefix                 = "*"
        destination_application_security_group_ids = null
        destination_port_range                     = "*"
        name                                       = "Allow_All_Outbound"
        source_address_prefix                      = "*"
        source_application_security_group_ids      = null
        source_port_range                          = "*"
      }
    ]
  },
]

subnet_route_table_associations = {
  "subnet1" = {
    subnet      = "h-cus-snet-dmz"
    route_table = "h-cus-rt-dmz"
  }
}

hubid = "3a5271d7-a7d6-4584-818c-238fa6355819" 