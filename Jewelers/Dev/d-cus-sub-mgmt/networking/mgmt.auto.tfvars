# RESOURCE: {ENVIRONMENT}-{LOCATION}-{RESOURCE}-{APPLICATION}-{FUNCTION}
# RG:       {ENVIRONMENT}-{LOCATION}-{RESOURCE}-{APPLICATION}-{FUNCTION}

# Hub and Spoke Subscriptions:
# Hub and Spoke Subscriptions:
#Central US for main East US 2 for DR
#################################################################

subscription_id = "b9fde64c-291c-4f7f-aaac-e2d1b13d8e68"


location = "centralus" // 

tags = {
  Applications  = "Networking"
  BusinessOwner = "IT"
  ITOwner       = "Networking"
  CreatedBy     = "ggibson@3cloudsolutions.com"
  CreatedOn     = "06/24/2024"
  Department    = "IT"
  Description   = "Development Mgmt "
  DisplayName   = "Development Mgmt"
  Environment   = "Development"
  Tier          = "2"
}

#---------------------------------------------------------
# Resource Group Names
#---------------------------------------------------------
rg_name = "d-cus-rg-mgmt"

#---------------------------------------------------------
# VNETs
#---------------------------------------------------------
vnets = [ ##update
  {
    resource_group = "d-cus-rg-mgmt"
    name           = "d-cus-vnet-mgmt"
    cidr           = ["10.130.80.0/24"]
    dns_servers    = ["10.251.8.68"]
  }
]

subnet = { ##update
  d-cus-snet-mgmt = {
    subnet_range                                   = ["10.130.80.0/26"]
    service_endpoints                              = []
    delegation_name                                = null
    delegation_actions                             = null
    enforce_private_link_endpoint_network_policies = true
    vnet                                           = "d-cus-vnet-mgmt"
    nsg                                            = "d-cus-nsg-mgmt"
    route_table                                    = true
  },
}

nsgs = [
  {
    name = "d-cus-nsg-mgmt"
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

route_tables = [
  {
    name                          = "d-cus-rt-mgmt"    #update
    vnet                          = "d-cus-vnet-mgmt" #update
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

subnet_route_table_associations = {
  "subnet1" = {
    subnet      = "d-cus-snet-mgmt"
    route_table = "d-cus-rt-mgmt"
  }
}

key_vault_name = "d-cus-kv-mgmt01" ###"icusidentitykv" ##update

hubid = "3a5271d7-a7d6-4584-818c-238fa6355819" 