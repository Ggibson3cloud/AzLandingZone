# RESOURCE: {ENVIRONMENT}-{LOCATION}-{RESOURCE}-{APPLICATION}-{FUNCTION}
# RG:       {ENVIRONMENT}-{LOCATION}-{RESOURCE}-{APPLICATION}-{FUNCTION}

# Hub and Spoke Subscriptions:
# Hub and Spoke Subscriptions:
#Central US for main East US 2 for DR
#################################################################
######################### Subscriptions #########################

# PLT-eus2-Hub = 3a5271d7-a7d6-4584-818c-238fa6355819
# PLT-eus2-Identity = 1d8bcd67-7874-4cfa-9da0-06038011c26b
# PLT-eus2-SharedService = fc0f9a38-a35a-479a-a5ab-65bfd51dd52f

#################################################################
#################################################################

subscription_id = "4b50e0d5-116f-442e-a42a-3f0c652f13fb"


location = "eastus2" // 

tags = {
  Applications  = "Networking"
  BusinessOwner = "IT"
  ITOwner       = "Networking"
  CreatedBy     = "ggibson@3cloudsolutions.com"
  CreatedOn     = "08/29/2024"
  Department    = "IT"
  Description   = "DR Production SQL"
  DisplayName   = "DR Production SQL"
  Environment   = "DR Production"
  Tier          = "1"
}

#---------------------------------------------------------
# Resource Group Names
#---------------------------------------------------------
rg_name = "p-eus2-rg-sql"

#---------------------------------------------------------
# VNETs
#---------------------------------------------------------
vnets = [ ##update
  {
    resource_group = "p-eus2-rg-sql"
    name           = "p-eus2-vnet-sql"
    cidr           = ["10.121.128.0/19"]
    dns_servers    = []
  }
]

subnet = { ##update
  p-eus2-snet-servers = {
    subnet_range                                   = ["10.121.128.0/22"]
    service_endpoints                              = []
    delegation_name                                = null
    delegation_actions                             = null
    enforce_private_link_endpoint_network_policies = true
    vnet                                           = "p-eus2-vnet-sql"
    nsg                                            = "p-eus2-nsg-servers"
    route_table                                    = true
  },
  p-eus2-snet-sql = {
    subnet_range                                   = ["10.121.132.0/23"]
    service_endpoints                              = []
    delegation_name                                = null
    delegation_actions                             = null
    enforce_private_link_endpoint_network_policies = true
    vnet                                           = "p-eus2-vnet-sql"
    nsg                                            = "p-eus2-nsg-sql"
    route_table                                    = true
  },
  p-eus2-snet-privendpoint = {
    subnet_range                                   = ["10.121.134.0/24"]
    service_endpoints                              = []
    delegation_name                                = null
    delegation_actions                             = null
    enforce_private_link_endpoint_network_policies = true
    vnet                                           = "p-eus2-vnet-sql"
    nsg                                            = null
    route_table                                    = true
  },
  p-eus2-snet-sqlmi = {
    subnet_range                                   = ["10.121.136.0/23"]
    service_endpoints                              = []
    delegation_name                                = "Microsoft.Sql/managedInstances"
    delegation_actions                             = ["Microsoft.Network/virtualNetworks/subnets/join/action", "Microsoft.Network/virtualNetworks/subnets/prepareNetworkPolicies/action", "Microsoft.Network/virtualNetworks/subnets/unprepareNetworkPolicies/action"]
    enforce_private_link_endpoint_network_policies = true
    vnet                                           = "p-eus2-vnet-sql"
    nsg                                            = "p-eus2-nsg-sqlmi"
    route_table                                    = true
  },
  p-eus2-snet-sqlag-c = {
    subnet_range                                   = ["10.121.138.0/27"]
    service_endpoints                              = []
    delegation_name                                = null
    delegation_actions                             = null
    enforce_private_link_endpoint_network_policies = true
    vnet                                           = "p-eus2-vnet-sql"
    nsg                                            = "p-eus2-nsg-sqlag-c"
    route_table                                    = true
  },
  p-eus2-snet-sqlag-d = {
    subnet_range                                   = ["10.121.138.32/27"]
    service_endpoints                              = []
    delegation_name                                = null
    delegation_actions                             = null
    enforce_private_link_endpoint_network_policies = true
    vnet                                           = "p-eus2-vnet-sql"
    nsg                                            = "p-eus2-nsg-sqlag-d"
    route_table                                    = true
  },
  p-eus2-snet-sqlag-r = {
    subnet_range                                   = ["10.121.138.64/27"]
    service_endpoints                              = []
    delegation_name                                = null
    delegation_actions                             = null
    enforce_private_link_endpoint_network_policies = true
    vnet                                           = "p-eus2-vnet-sql"
    nsg                                            = "p-eus2-nsg-sqlag-r"
    route_table                                    = true
  },
}

nsgs = [
  {
    name = "p-eus2-nsg-servers"
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
    name = "p-eus2-nsg-sql"
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
    name = "p-eus2-nsg-sqlmi"
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
    name = "p-eus2-nsg-sqlag-c"
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
    name = "p-eus2-nsg-sqlag-d"
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
    name = "p-eus2-nsg-sqlag-r"
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
    name                          = "p-eus2-rt-servers" #update
    vnet                          = "p-eus2-vnet-sql"   #update
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
    name                          = "p-eus2-rt-sql"   #update
    vnet                          = "p-eus2-vnet-sql" #update
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
    name                          = "p-eus2-rt-privendpoint"
    vnet                          = "p-eus2-vnet-sql"
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
    name                          = "p-eus2-rt-sqlmi" #update
    vnet                          = "p-eus2-vnet-sql" #update
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
    name                          = "p-eus2-rt-sqlag-r" #update
    vnet                          = "p-eus2-vnet-sql"   #update
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
    name                          = "p-eus2-rt-sqlag-c" #update
    vnet                          = "p-eus2-vnet-sql"   #update
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
    name                          = "p-eus2-rt-sqlag-d" #update
    vnet                          = "p-eus2-vnet-sql"   #update
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
  "subnet3" = {
    subnet      = "p-eus2-snet-sql"
    route_table = "p-eus2-rt-sql"
  }
  "subnet4" = {
    subnet      = "p-eus2-snet-servers"
    route_table = "p-eus2-rt-servers"
  }
  "subnet2" = {
    subnet      = "p-eus2-snet-privendpoint"
    route_table = "p-eus2-rt-privendpoint"
  }
  "subnet1" = {
    subnet      = "p-eus2-snet-sqlmi"
    route_table = "p-eus2-rt-sqlmi"
  }
  "subnet5" = {
    subnet      = "p-eus2-snet-sqlag-c"
    route_table = "p-eus2-rt-sqlag-c"
  }
  "subnet6" = {
    subnet      = "p-eus2-snet-sqlag-d"
    route_table = "p-eus2-rt-sqlag-d"
  }
  "subnet7" = {
    subnet      = "p-eus2-snet-sqlag-r"
    route_table = "p-eus2-rt-sqlag-r"
  }
}




hubid = "8cc21a98-4584-4bed-8643-4cb6fd0d7bbf" 