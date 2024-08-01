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

subscription_id = "87aa7e85-aae4-4190-912c-1ce47b69f963"


location = "centralus" // 

tags = {
  Applications  = "Networking"
  BusinessOwner = "IT"
  ITOwner       = "Networking"
  CreatedBy     = "ggibson@3cloudsolutions.com"
  CreatedOn     = "06/24/2024"
  Department    = "IT"
  Description   = "Test sql"
  DisplayName   = "Test sql"
  Environment   = "Test"
  Tier          = "3"
}

#---------------------------------------------------------
# Resource Group Names
#---------------------------------------------------------
rg_name = "t-cus-rg-sql"

#---------------------------------------------------------
# VNETs
#---------------------------------------------------------
vnets = [ ##update
  {
    resource_group = "t-cus-rg-sql"
    name           = "t-cus-vnet-sql"
    cidr           = ["10.130.56.0/21"]
    dns_servers    = ["10.251.8.68"]
  }
]

subnet = { ##update
  t-cus-snet-servers = {
    subnet_range                                   = ["10.130.56.0/23"]
    service_endpoints                              = []
    delegation_name                                = null
    delegation_actions                             = null
    enforce_private_link_endpoint_network_policies = true
    vnet                                           = "t-cus-vnet-sql"
    nsg                                            = "t-cus-nsg-servers"
    route_table                                    = true
  },
  t-cus-snet-sql = {
    subnet_range                                   = ["10.130.58.0/24"]
    service_endpoints                              = []
    delegation_name                                = null
    delegation_actions                             = null
    enforce_private_link_endpoint_network_policies = true
    vnet                                           = "t-cus-vnet-sql"
    nsg                                            = "t-cus-nsg-sql"
    route_table                                    = true
  },
  t-cus-snet-privendpoint = {
    subnet_range                                   = ["10.130.59.0/25"]
    service_endpoints                              = []
    delegation_name                                = null
    delegation_actions                             = null
    enforce_private_link_endpoint_network_policies = true
    vnet                                           = "t-cus-vnet-sql"
    nsg                                            = null
    route_table                                    = true
  },
    t-cus-snet-sqlmi = {
    subnet_range                                   = ["10.130.60.0/24"]
    service_endpoints                              = []
     delegation_name                                = "Microsoft.Sql/managedInstances"
    delegation_actions                             = ["Microsoft.Network/virtualNetworks/subnets/join/action", "Microsoft.Network/virtualNetworks/subnets/prepareNetworkPolicies/action", "Microsoft.Network/virtualNetworks/subnets/unprepareNetworkPolicies/action"]
    enforce_private_link_endpoint_network_policies = true
    vnet                                           = "t-cus-vnet-sql"
    nsg                                            = "t-cus-nsg-sqlmi"
    route_table                                    = true
  },
}

nsgs = [
  {
    name = "t-cus-nsg-sql"
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
    name = "t-cus-nsg-servers"
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
    name = "t-cus-nsg-sqlmi"
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
    name                          = "t-cus-rt-sql"   #update
    vnet                          = "t-cus-vnet-sql" #update
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
    name                          = "t-cus-rt-servers"  #update
    vnet                          = "t-cus-vnet-sql" #update
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
    name                          = "t-cus-rt-privendpoint"
    vnet                          = "t-cus-vnet-sql"
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
    name                          = "t-cus-rt-sqlmi"   #update
    vnet                          = "t-cus-vnet-sql" #update
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
    subnet      = "t-cus-snet-sql"
    route_table = "t-cus-rt-sql"
  }
  "subnet2" = {
    subnet      = "t-cus-snet-servers"
    route_table = "t-cus-rt-servers"
  }
    "subnet3" = {
    subnet      = "t-cus-snet-sqlmi"
    route_table = "t-cus-rt-sqlmi"
  }
  "subnet4" = {
    subnet      = "t-cus-snet-privendpoint"
    route_table = "t-cus-rt-privendpoint"
  }
  
}

hubid = "3a5271d7-a7d6-4584-818c-238fa6355819" 