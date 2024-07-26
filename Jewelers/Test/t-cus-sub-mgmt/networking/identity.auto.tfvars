# RESOURCE: {ENVIRONMENT}-{LOCATION}-{RESOURCE}-{APPLICATION}-{FUNCTION}
# RG:       {ENVIRONMENT}-{LOCATION}-{RESOURCE}-{APPLICATION}-{FUNCTION}

# Hub and Spoke Subscriptions:
# Hub and Spoke Subscriptions:
#Central US for main East US 2 for DR
#################################################################
######################### Subscriptions #########################

# PLT-CUS-Hub = 3a5271d7-a7d6-4584-818c-238fa6355819
# PLT-CUS-Identity = 1d8bcd67-7874-4cfa-9da0-06038011c26b
# PLT-CUS-SharedService = fc0f9a38-a35a-479a-a5ab-65bfd51dd52f

#################################################################
#################################################################

subscription_id = "32571c40-8725-4e52-bb03-d702e98e33a8"


location = "centralus" // 

tags = {
  Applications  = "Networking"
  BusinessOwner = "IT"
  ITOwner       = "Networking"
  CreatedBy     = "ggibson@3cloudsolutions.com"
  CreatedOn     = "06/24/2024"
  Department    = "IT"
  Description   = "Test Mgmt"
  DisplayName   = "Test Mgmt"
  Environment   = "Test"
  Tier          = "3"
}

#---------------------------------------------------------
# Resource Group Names
#---------------------------------------------------------
rg_name = "t-cus-rg-mgmt"

#---------------------------------------------------------
# VNETs
#---------------------------------------------------------
vnets = [ ##update
  {
    resource_group = "t-cus-rg-mgmt"
    name           = "t-cus-vnet-mgmt"
    cidr           = ["10.130.40.0/24"]
    dns_servers    = []
  }
]

subnet = { ##update
  t-cus-snet-mgmt = {
    subnet_range                                   = ["10.130.40.0/26"]
    service_endpoints                              = []
    delegation_name                                = null
    delegation_actions                             = null
    enforce_private_link_endpoint_network_policies = true
    vnet                                           = "t-cus-vnet-mgmt"
    nsg                                            = "t-cus-nsg-mgmt"
    route_table                                    = true
  },
}

nsgs = [
  {
    name = "t-cus-nsg-mgmt"
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
    name                          = "t-cus-rt-mgmt"    #update
    vnet                          = "t-cus-vnet-mgmt" #update
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
    subnet      = "t-cus-snet-mgmt"
    route_table = "t-cus-rt-mgmt"
  }
}


key_vault_name = "t-cus-kv-mgmt" ###"icusidentitykv" ##update

hubid = "3a5271d7-a7d6-4584-818c-238fa6355819" 