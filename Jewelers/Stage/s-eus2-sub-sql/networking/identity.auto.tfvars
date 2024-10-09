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

subscription_id = "557e12db-141a-481c-b4ab-edc139420c03"


location = "eastus2" // 

tags = {
  Applications  = "Networking"
  BusinessOwner = "IT"
  ITOwner       = "Networking"
  CreatedBy     = "ggibson@3cloudsolutions.com"
  CreatedOn     = "09/23/2024"
  Department    = "IT"
  Description   = "Sql stage subscription resources"
  DisplayName   = "EU2 Stage SQL"
  Environment   = "EU2 Stage SQL"
  Tier          = "2"
}

#---------------------------------------------------------
# Resource Group Names
#---------------------------------------------------------
rg_name = "s-eus2-rg-sql"

#---------------------------------------------------------
# VNETs
#---------------------------------------------------------
vnets = [ ##update
  {
    resource_group = "s-eus2-rg-sql"
    name           = "s-eus2-vnet-sql"
    cidr           = ["10.131.16.0/21"]
    dns_servers    = []
  }
]

subnet = { ##update
  s-eus2-snet-sql = {
    subnet_range                                   = ["10.131.16.0/23"]
    service_endpoints                              = []
    delegation_name                                = null
    delegation_actions                             = null
    enforce_private_link_endpoint_network_policies = true
    vnet                                           = "s-eus2-vnet-sql"
    nsg                                            = "s-eus2-nsg-sql"
    route_table                                    = true
  },
  s-eus2-snet-servers = {
    subnet_range                                   = ["10.131.18.0/24"]
    service_endpoints                              = []
    delegation_name                                = null
    delegation_actions                             = null
    enforce_private_link_endpoint_network_policies = true
    vnet                                           = "s-eus2-vnet-sql"
    nsg                                            = "s-eus2-nsg-servers"
    route_table                                    = true
  },
  s-eus2-snet-privendpoint = {
    subnet_range                                   = ["10.131.19.0/25"]
    service_endpoints                              = []
    delegation_name                                = null
    delegation_actions                             = null
    enforce_private_link_endpoint_network_policies = true
    vnet                                           = "s-eus2-vnet-sql"
    nsg                                            = null
    route_table                                    = true
  },
  s-eus2-snet-sqlmi = {
    subnet_range                                   = ["10.131.20.0/23"]
    service_endpoints                              = []
    delegation_name                                = "Microsoft.Sql/managedInstances"
    delegation_actions                             = ["Microsoft.Network/virtualNetworks/subnets/join/action", "Microsoft.Network/virtualNetworks/subnets/prepareNetworkPolicies/action", "Microsoft.Network/virtualNetworks/subnets/unprepareNetworkPolicies/action"]
    enforce_private_link_endpoint_network_policies = true
    vnet                                           = "s-eus2-vnet-sql"
    nsg                                            = "s-eus2-nsg-sqlmi"
    route_table                                    = true
  },
  s-eus2-snet-sqlag-c = {
    subnet_range                                   = ["10.131.22.0/27"]
    service_endpoints                              = []
    delegation_name                                = null
    delegation_actions                             = null
    enforce_private_link_endpoint_network_policies = true
    vnet                                           = "s-eus2-vnet-sql"
    nsg                                            = "s-eus2-nsg-sqlag-c"
    route_table                                    = true
  },
  s-eus2-snet-sqlag-d = {
    subnet_range                                   = ["10.131.22.32/27"]
    service_endpoints                              = []
    delegation_name                                = null
    delegation_actions                             = null
    enforce_private_link_endpoint_network_policies = true
    vnet                                           = "s-eus2-vnet-sql"
    nsg                                            = "s-eus2-nsg-sqlag-d"
    route_table                                    = true
  },
  s-eus2-snet-sqlag-r = {
    subnet_range                                   = ["10.131.22.64/27"]
    service_endpoints                              = []
    delegation_name                                = null
    delegation_actions                             = null
    enforce_private_link_endpoint_network_policies = true
    vnet                                           = "s-eus2-vnet-sql"
    nsg                                            = "s-eus2-nsg-sqlag-r"
    route_table                                    = true
  },




}

nsgs = [
  {
    name = "s-eus2-nsg-sql"
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
    name = "s-eus2-nsg-servers"
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
    name = "s-eus2-nsg-sqlmi"
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
    }, {
    name = "s-eus2-nsg-sqlag-c"
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
    name = "s-eus2-nsg-sqlag-d"
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
    name = "s-eus2-nsg-sqlag-r"
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
    name                          = "s-eus2-rt-sql"   #update
    vnet                          = "s-eus2-vnet-sql" #update
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
    name                          = "s-eus2-rt-servers" #update
    vnet                          = "s-eus2-vnet-sql"   #update
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
    name                          = "s-eus2-rt-privendpoint"
    vnet                          = "s-eus2-vnet-sql"
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
    name                          = "s-eus2-rt-sqlmi" #update
    vnet                          = "s-eus2-vnet-sql" #update
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
    name                          = "s-eus2-rt-sqlag-c" #update
    vnet                          = "s-eus2-vnet-sql"   #update
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
    name                          = "s-eus2-rt-sqlag-d" #update
    vnet                          = "s-eus2-vnet-sql"   #update
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
    name                          = "s-eus2-rt-sqlag-r" #update
    vnet                          = "s-eus2-vnet-sql"   #update
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
    subnet      = "s-eus2-snet-sql"
    route_table = "s-eus2-rt-sql"
  },
  "subnet2" = {
    subnet      = "s-eus2-snet-servers"
    route_table = "s-eus2-rt-servers"
  },
  "subnet3" = {
    subnet      = "s-eus2-snet-privendpoint"
    route_table = "s-eus2-rt-privendpoint"
  },
  subnet4 = {
    subnet      = "s-eus2-snet-sqlmi"
    route_table = "s-eus2-rt-sqlmi"
  }
  subnet5 = {
    subnet      = "s-eus2-snet-sqlag-c"
    route_table = "s-eus2-rt-sqlag-c"
  }
  subnet6 = {
    subnet      = "s-eus2-snet-sqlag-d"
    route_table = "s-eus2-rt-sqlag-d"
  }
  subnet7 = {
    subnet      = "s-eus2-snet-sqlag-r"
    route_table = "s-eus2-rt-sqlag-r"
  }

}


key_vault_name = "s-eus2-kv-sql01" ### ##update

hubid = "8cc21a98-4584-4bed-8643-4cb6fd0d7bbf" 