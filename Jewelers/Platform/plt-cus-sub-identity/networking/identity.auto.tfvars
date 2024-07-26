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

subscription_id = "1d8bcd67-7874-4cfa-9da0-06038011c26b"


location = "centralus" // 

tags = {
  Applications  = "Networking"
  BusinessOwner = "IT"
  ITOwner       = "Networking"
  CreatedBy     = "ggibson@3cloudsolutions.com"
  CreatedOn     = "06/24/2024"
  Department    = "IT"
  Description   = "Identity Resources"
  DisplayName   = "Identity Resources"
  Environment   = "Production Identity"
  Tier          = "1"
}

#---------------------------------------------------------
# Resource Group Names
#---------------------------------------------------------
rg_name = "i-cus-rg-identity"

#---------------------------------------------------------
# VNETs
#---------------------------------------------------------
vnets = [
  {
    resource_group = "i-cus-rg-identity"
    name           = "i-cus-vnet-identity"
    cidr           = ["10.120.0.0/24"]
    dns_servers    = []
  }
]

subnet = {
  i-cus-snet-privatelink = {
    subnet_range                                   = ["10.120.0.0/26"]
    service_endpoints                              = []
    delegation_name                                = null
    delegation_actions                             = null
    enforce_private_link_endpoint_network_policies = true
    vnet                                           = "i-cus-vnet-identity"
    nsg                                            = null
    route_table                                    = true
  },
  i-cus-snet-domain = {
    subnet_range                                   = ["10.120.0.64/26"]
    service_endpoints                              = []
    delegation_name                                = null
    delegation_actions                             = null
    enforce_private_link_endpoint_network_policies = true
    vnet                                           = "i-cus-vnet-identity"
    nsg                                            = "i-cus-nsg-domain"
    route_table                                    = true
  },
  i-cus-snet-identity = {
    subnet_range                                   = ["10.120.0.128/26"]
    service_endpoints                              = []
    delegation_name                                = null
    delegation_actions                             = null
    enforce_private_link_endpoint_network_policies = true
    vnet                                           = "i-cus-vnet-identity"
    nsg                                            = "i-cus-nsg-identity"
    route_table                                    = true
  },
}

nsgs = [
  {
    name = "i-cus-nsg-identity"
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
  {
    name = "i-cus-nsg-domain"
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
    name                          = "i-cus-rt-domain"
    vnet                          = "i-cus-vnet-identity"
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
  {
    name                          = "i-cus-rt-identity"
    vnet                          = "i-cus-vnet-identity"
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
  {
    name                          = "i-cus-rt-privatelink"
    vnet                          = "i-cus-vnet-identity"
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
    subnet      = "i-cus-snet-domain"
    route_table = "i-cus-rt-domain"
  }
  "subnet2" = {
    subnet      = "i-cus-snet-identity"
    route_table = "i-cus-rt-identity"
  }
  "subnet2" = {
    subnet      = "i-cus-snet-privatelink"
    route_table = "i-cus-rt-privatelink"
  }
}
key_vault_name = "i-cus-kv-identity-01"

hubid = "3a5271d7-a7d6-4584-818c-238fa6355819" 