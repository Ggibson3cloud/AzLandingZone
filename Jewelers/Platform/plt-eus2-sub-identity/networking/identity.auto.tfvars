# RESOURCE: {ENVIRONMENT}-{LOCATION}-{RESOURCE}-{APPLICATION}-{FUNCTION}
# RG:       {ENVIRONMENT}-{LOCATION}-{RESOURCE}-{APPLICATION}-{FUNCTION}

# Hub and Spoke Subscriptions:
# Hub and Spoke Subscriptions:
#Central US for main East US 2 for DR
#################################################################
######################### Subscriptions #########################

# PLT-eus2-Hub = 8cc21a98-4584-4bed-8643-4cb6fd0d7bbf
# PLT-eus2-Identity = edd5864f-abc5-4e00-92a8-0037a1b634ad
# PLT-eus2-SharedService = 9c5c8a97-3c45-4ba3-b3f2-91da940ac498

#################################################################
#################################################################

subscription_id = "edd5864f-abc5-4e00-92a8-0037a1b634ad"


location = "eastus2" // 

tags = {
  Applications  = "Networking"
  BusinessOwner = "IT"
  ITOwner       = "Networking"
  CreatedBy     = "ggibson@3cloudsolutions.com"
  CreatedOn     = "06/24/2024"
  Department    = "IT"
  Description   = "DR Identity Resources"
  DisplayName   = "DR Identity Resources"
  Environment   = "Disaster reProduction Identity"
  Tier          = "1"
}

#---------------------------------------------------------
# Resource Group Names
#---------------------------------------------------------
rg_name = "i-eus2-rg-identity"

#---------------------------------------------------------
# VNETs
#---------------------------------------------------------
vnets = [
  {
    resource_group = "i-eus2-rg-identity"
    name           = "i-eus2-vnet-identity"
    cidr           = ["10.121.0.0/24"]
    dns_servers    = []
  }
]

subnet = {
  i-eus2-snet-privatelink = {
    subnet_range                                   = ["10.121.0.0/26"]
    service_endpoints                              = []
    delegation_name                                = null
    delegation_actions                             = null
    enforce_private_link_endpoint_network_policies = true
    vnet                                           = "i-eus2-vnet-identity"
    nsg                                            = null
    route_table                                    = true
  },
  i-eus2-snet-domain = {
    subnet_range                                   = ["10.121.0.64/26"]
    service_endpoints                              = []
    delegation_name                                = null
    delegation_actions                             = null
    enforce_private_link_endpoint_network_policies = true
    vnet                                           = "i-eus2-vnet-identity"
    nsg                                            = "i-eus2-nsg-domain"
    route_table                                    = true
  },
  i-eus2-snet-identity = {
    subnet_range                                   = ["10.121.0.128/26"]
    service_endpoints                              = []
    delegation_name                                = null
    delegation_actions                             = null
    enforce_private_link_endpoint_network_policies = true
    vnet                                           = "i-eus2-vnet-identity"
    nsg                                            = "i-eus2-nsg-identity"
    route_table                                    = true
  },
}

nsgs = [
  {
    name = "i-eus2-nsg-identity"
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
        priority                                   = "121"
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
    name = "i-eus2-nsg-domain"
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
        priority                                   = "121"
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
    name                          = "i-eus2-rt-domain"
    vnet                          = "i-eus2-vnet-identity"
    disable_bgp_route_propagation = false
    nva_routes = [
      {
        name           = "defaultRoute"
        address_prefix = "0.0.0.0/0"
        next_hop_ip    = "10.251.20.70"
      },


    ]
    vnetlocal_routes = []
  },
  {
    name                          = "i-eus2-rt-identity"
    vnet                          = "i-eus2-vnet-identity"
    disable_bgp_route_propagation = false
    nva_routes = [
      {
        name           = "defaultRoute"
        address_prefix = "0.0.0.0/0"
        next_hop_ip    = "10.251.20.70"
      },

    ]
    vnetlocal_routes = []
  },
  {
    name                          = "i-eus2-rt-privatelink"
    vnet                          = "i-eus2-vnet-identity"
    disable_bgp_route_propagation = false
    nva_routes = [
      {
        name           = "defaultRoute"
        address_prefix = "0.0.0.0/0"
        next_hop_ip    = "10.251.20.70"
      },


    ]
    vnetlocal_routes = []
  },
]

subnet_route_table_associations = {
  "subnet1" = {
    subnet      = "i-eus2-snet-domain"
    route_table = "i-eus2-rt-domain"
  }
  "subnet2" = {
    subnet      = "i-eus2-snet-identity"
    route_table = "i-eus2-rt-identity"
  }
  "subnet2" = {
    subnet      = "i-eus2-snet-privatelink"
    route_table = "i-eus2-rt-privatelink"
  }
}
key_vault_name = "i-eus2-kv-identity01"

hubid = "8cc21a98-4584-4bed-8643-4cb6fd0d7bbf" 