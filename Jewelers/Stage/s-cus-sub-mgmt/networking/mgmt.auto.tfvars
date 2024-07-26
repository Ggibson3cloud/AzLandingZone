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

subscription_id = "5c905764-41f1-4d77-99e6-83093f48b4d3"


location = "centralus" // 

tags = {
  Applications  = "Networking"
  BusinessOwner = "IT"
  ITOwner       = "Networking"
  CreatedBy     = "ggibson@3cloudsolutions.com"
  CreatedOn     = "06/24/2024"
  Department    = "IT"
  Description   = "Stage Mgmt "
  DisplayName   = "Stage Mgmt"
  Environment   = "Stage"
  Tier          = "2"
}

#---------------------------------------------------------
# Resource Group Names
#---------------------------------------------------------
rg_name = "s-cus-rg-mgmt"

#---------------------------------------------------------
# VNETs
#---------------------------------------------------------
vnets = [ ##update
  {
    resource_group = "s-cus-rg-mgmt"
    name           = "s-cus-vnet-mgmt"
    cidr           = ["10.130.0.0/24"]
    dns_servers    = []
  }
]

subnet = { ##update
  s-cus-snet-mgmt = {
    subnet_range                                   = ["10.130.0.0/26"]
    service_endpoints                              = []
    delegation_name                                = null
    delegation_actions                             = null
    enforce_private_link_endpoint_network_policies = true
    vnet                                           = "s-cus-vnet-mgmt"
    nsg                                            = "s-cus-nsg-mgmt"
    route_table                                    = true
  },
}

nsgs = [
  {
    name = "s-cus-nsg-mgmt"
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
    name                          = "s-cus-rt-mgmt"    #update
    vnet                          = "s-cus-vnet-mgmt" #update
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
    subnet      = "s-cus-snet-mgmt"
    route_table = "s-cus-rt-mgmt"
  }
}


key_vault_name = "s-cus-kv-mgmt-01" ###"icusidentitykv" ##update

hubid = "3a5271d7-a7d6-4584-818c-238fa6355819" 