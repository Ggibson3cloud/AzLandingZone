# RESOURCE: {ENVIRONMENT}-{LOCATION}-{RESOURCE}-{APPLICATION}-{FUNCTION}
# RG:       {ENVIRONMENT}-{LOCATION}-{RESOURCE}-{APPLICATION}-{FUNCTION}

# Hub and Spoke Subscriptions:
# Hub and Spoke Subscriptions:
#Central US for main East US 2 for DR
#################################################################
######################### Subscriptions #########################

# PLp-cus-Hub = 3a5271d7-a7d6-4584-818c-238fa6355819
# PLp-cus-Identity = 1d8bcd67-7874-4cfa-9da0-06038011c26b
# PLp-cus-SharedService = fc0f9a38-a35a-479a-a5ab-65bfd51dd52f

#################################################################
#################################################################

subscription_id = "312b8fcc-61e8-4c66-b399-055fbbdaccaa"


location = "centralus" // 

tags = {
  Applications  = "Networking"
  BusinessOwner = "IT"
  ITOwner       = "Networking"
  CreatedBy     = "ggibson@3cloudsolutions.com"
  CreatedOn     = "06/24/2024"
  Department    = "IT"
  Description   = "AVD"
  DisplayName   = "AVD"
  Environment   = "Production"
  Tier          = "1"
}

#---------------------------------------------------------
# Resource Group Names
#---------------------------------------------------------
rg_name = "p-cus-rg-avd"

#---------------------------------------------------------
# VNETs
#---------------------------------------------------------
vnets = [ ##update
  {
    resource_group = "p-cus-rg-avd"
    name           = "p-cus-vnet-avd"
    cidr           = ["10.120.160.0/19"]
    dns_servers    = []
  }
]

subnet = { ##update
  p-cus-snet-hostpool1 = {
    subnet_range                                   = ["10.120.160.0/23"]
    service_endpoints                              = []
    delegation_name                                = null
    delegation_actions                             = null
    enforce_private_link_endpoint_network_policies = true
    vnet                                           = "p-cus-vnet-avd"
    nsg                                            = "p-cus-nsg-hostpool1"
    route_table                                    = true
  },
  p-cus-snet-hostpool2 = {
    subnet_range                                   = ["10.120.162.0/23"]
    service_endpoints                              = []
    delegation_name                                = null
    delegation_actions                             = null
    enforce_private_link_endpoint_network_policies = true
    vnet                                           = "p-cus-vnet-avd"
    nsg                                            = "p-cus-nsg-hostpool2"
    route_table                                    = true
  },
  p-cus-snet-hostpool3 = {
    subnet_range                                   = ["10.120.164.0/23"]
    service_endpoints                              = []
    delegation_name                                = null
    delegation_actions                             = null
    enforce_private_link_endpoint_network_policies = true
    vnet                                           = "p-cus-vnet-avd"
    nsg                                            = "p-cus-nsg-hostpool3"
    route_table                                    = true
  },
  p-cus-snet-hostpool4 = {
    subnet_range                                   = ["10.120.166.0/23"]
    service_endpoints                              = []
    delegation_name                                = null
    delegation_actions                             = null
    enforce_private_link_endpoint_network_policies = true
    vnet                                           = "p-cus-vnet-avd"
    nsg                                            = "p-cus-nsg-hostpool4"
    route_table                                    = true
  },
  p-cus-snet-privatelink = {
    subnet_range                                   = ["10.120.168.0/26"]
    service_endpoints                              = []
    delegation_name                                = null
    delegation_actions                             = null
    enforce_private_link_endpoint_network_policies = true
    vnet                                           = "p-cus-vnet-avd"
    nsg                                            = null
    route_table                                    = true
  },
  p-cus-snet-images = {
    subnet_range                                   = ["10.120.170.0/26"]
    service_endpoints                              = []
    delegation_name                                = null
    delegation_actions                             = null
    enforce_private_link_endpoint_network_policies = true
    vnet                                           = "p-cus-vnet-avd"
    nsg                                            = "p-cus-nsg-images"
    route_table                                    = true
  },
    p-cus-snet-netapp = {
    subnet_range                                   = ["10.120.170.64/27"]
    service_endpoints                              = []
    delegation_name                                = null
    delegation_actions                             = null
    enforce_private_link_endpoint_network_policies = true
    vnet                                           = "p-cus-vnet-avd"
    nsg                                            = "p-cus-nsg-netapp"
    route_table                                    = true
  },
}

nsgs = [
  {
    name = "p-cus-nsg-hostpool1"
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
    name = "p-cus-nsg-hostpool2"
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
    name = "p-cus-nsg-hostpool3"
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
    name = "p-cus-nsg-hostpool4"
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
    name = "p-cus-nsg-images"
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
    name = "p-cus-nsg-netapp"
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
    name                          = "p-cus-rt-hostpool1" #update
    vnet                          = "p-cus-vnet-avd"              #update
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
    name                          = "p-cus-rt-hostpool2" #update
    vnet                          = "p-cus-vnet-avd"              #update
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
    name                          = "p-cus-rt-hostpool3" #update
    vnet                          = "p-cus-vnet-avd"              #update
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
    name                          = "p-cus-rt-hostpool4" #update
    vnet                          = "p-cus-vnet-avd"              #update
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
    name                          = "p-cus-rt-images" #update
    vnet                          = "p-cus-vnet-avd"           #update
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
    name                          = "p-cus-rt-privatelink"
    vnet                          = "p-cus-vnet-avd"
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
    name                          = "p-cus-rt-netapp" #update
    vnet                          = "p-cus-vnet-avd"              #update
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
    subnet      = "p-cus-snet-hostpool1"
    route_table = "p-cus-rt-hostpool1"
  }
  "subnet2" = {
    subnet      = "p-cus-snet-hostpool2"
    route_table = "p-cus-rt-hostpool2"
  }
  "subnet3" = {
    subnet      = "p-cus-snet-hostpool3"
    route_table = "p-cus-rt-hostpool3"
  }
  "subnet4" = {
    subnet      = "p-cus-snet-hostpool4"
    route_table = "p-cus-rt-hostpool4"
  }
  "subnet5" = {
    subnet      = "p-cus-snet-images"
    route_table = "p-cus-rt-images"
  }
  "subnet6" = {
    subnet      = "p-cus-snet-privatelink"
    route_table = "p-cus-rt-privatelink"
  }
   "subnet7" = {
    subnet      = "p-cus-snet-netapp"
    route_table = "p-cus-rt-netapp"
  }
}

key_vault_name = "p-cus-kv-avd-01" ###"icusidentitykv" ##update

hubid = "3a5271d7-a7d6-4584-818c-238fa6355819" 