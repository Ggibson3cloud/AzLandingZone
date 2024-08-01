# RESOURCE: {ENVIRONMENT}-{LOCATION}-{RESOURCE}-{APPLICATION}-{FUNCTION}
# RG:       {ENVIRONMENT}-{LOCATION}-{RESOURCE}-{APPLICATION}-{FUNCTION}

# Hub and Spoke Subscriptions:
# Hub and Spoke Subscriptions:
#Central US for main East US 2 for DR

subscription_id = "162e080c-8cbc-4a7f-bbd3-466d3fd5d0cb"


location = "centralus" // 

tags = {
  Applications  = "Networking"
  BusinessOwner = "IT"
  ITOwner       = "Networking"
  CreatedBy     = "ggibson@3cloudsolutions.com"
  CreatedOn     = "07/11/2024"
  Department    = "IT"
  Description   = "Azure_Sql dev subscription resources"
  DisplayName   = "Development SQL"
  Environment   = "Development SQL"
  Tier          = "4"
}

#---------------------------------------------------------
# Resource Group Names
#---------------------------------------------------------
rg_name = "d-cus-rg-sql"

#---------------------------------------------------------
# VNETs
#---------------------------------------------------------
vnets = [ ##update
  {
    resource_group = "d-cus-rg-sql"
    name           = "d-cus-vnet-sql"
    cidr           = ["10.130.96.0/21"]
    dns_servers    = ["10.251.8.68"]
  }
]

subnet = { ##update
  d-cus-snet-servers = {
    subnet_range                                   = ["10.130.96.0/23"]
    service_endpoints                              = []
    delegation_name                                = null
    delegation_actions                             = null
    enforce_private_link_endpoint_network_policies = true
    vnet                                           = "d-cus-vnet-sql"
    nsg                                            = "d-cus-nsg-servers"
    route_table                                    = true
  },
  d-cus-snet-sql = {
    subnet_range                                   = ["10.130.98.0/24"]
    service_endpoints                              = []
    delegation_name                                = null
    delegation_actions                             = null
    enforce_private_link_endpoint_network_policies = true
    vnet                                           = "d-cus-vnet-sql"
    nsg                                            = "d-cus-nsg-sql"
    route_table                                    = true
  },

  d-cus-snet-privendpoint = {
    subnet_range                                   = ["10.130.99.0/25"]
    service_endpoints                              = []
    delegation_name                                = null
    delegation_actions                             = null
    enforce_private_link_endpoint_network_policies = true
    vnet                                           = "d-cus-vnet-sql"
    nsg                                            = null
    route_table                                    = true
  },
  d-cus-snet-sqlmi = {
    subnet_range                                   = ["10.130.100.0/24"]
    service_endpoints                              = []
    delegation_name                                = "Microsoft.Sql/managedInstances"
    delegation_actions                             = ["Microsoft.Network/virtualNetworks/subnets/join/action", "Microsoft.Network/virtualNetworks/subnets/prepareNetworkPolicies/action", "Microsoft.Network/virtualNetworks/subnets/unprepareNetworkPolicies/action"]
    enforce_private_link_endpoint_network_policies = true
    vnet                                           = "d-cus-vnet-sql"
    nsg                                            = "d-cus-nsg-sqlmi"
    route_table                                    = true
  },
}


nsgs = [
  {
    name = "d-cus-nsg-sql"
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
    name = "d-cus-nsg-servers"
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
    name = "d-cus-nsg-sqlmi"
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
    name                          = "d-cus-rt-sql"   #update
    vnet                          = "d-cus-vnet-sql" #update
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
    name                          = "d-cus-rt-servers" #update
    vnet                          = "d-cus-vnet-sql"   #update
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
    name                          = "d-cus-rt-privendpoint"
    vnet                          = "d-cus-vnet-sql"
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
    name                          = "d-cus-rt-sqlmi" #update
    vnet                          = "d-cus-vnet-sql" #update
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
    subnet      = "d-cus-snet-sql"
    route_table = "d-cus-rt-sql"
  }
  "subnet2" = {
    subnet      = "d-cus-snet-servers"
    route_table = "d-cus-rt-servers"
  }
  "subnet4" = {
    subnet      = "d-cus-snet-privendpoint"
    route_table = "d-cus-rt-privendpoint"
  }
  "subnet5" = {
    subnet      = "d-cus-snet-sqlmi"
    route_table = "d-cus-rt-sqlmi"
  }
}



hubid = "3a5271d7-a7d6-4584-818c-238fa6355819" 