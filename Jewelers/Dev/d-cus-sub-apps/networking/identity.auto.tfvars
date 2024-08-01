# RESOURCE: {ENVIRONMENT}-{LOCATION}-{RESOURCE}-{APPLICATION}-{FUNCTION}
# RG:       {ENVIRONMENT}-{LOCATION}-{RESOURCE}-{APPLICATION}-{FUNCTION}

# Hub and Spoke Subscriptions:
# Hub and Spoke Subscriptions:
#Central US for main East US 2 for DR
#################################################################


subscription_id = "5c16164c-9749-4828-9c2a-bb21a762a489"


location = "centralus" // 

tags = {
  Applications  = "Networking"
  BusinessOwner = "IT"
  ITOwner       = "Networking"
  CreatedBy     = "ggibson@3cloudsolutions.com"
  CreatedOn     = "06/24/2024"
  Department    = "IT"
  Description   = "Development Apps"
  DisplayName   = "Development Apps"
  Environment   = "Development"
  Tier          = "4"
}

#---------------------------------------------------------
# Resource Group Names
#---------------------------------------------------------
rg_name = "d-cus-rg-apps"

#---------------------------------------------------------
# VNETs
#---------------------------------------------------------
vnets = [ ##update
  {
    resource_group = "d-cus-rg-apps"
    name           = "d-cus-vnet-apps"
    cidr           = ["10.130.88.0/21"]
    dns_servers    = ["10.251.8.68"]
  }
]

subnet = { ##update
  d-cus-snet-servers = {
    subnet_range                                   = ["10.130.88.0/23"]
    service_endpoints                              = []
    delegation_name                                = null
    delegation_actions                             = null
    enforce_private_link_endpoint_network_policies = true
    vnet                                           = "d-cus-vnet-apps"
    nsg                                            = "d-cus-nsg-servers"
    route_table                                    = true
  },
  d-cus-snet-sql = {
    subnet_range                                   = ["10.130.90.0/24"]
    service_endpoints                              = []
    delegation_name                                = null
    delegation_actions                             = null
    enforce_private_link_endpoint_network_policies = true
    vnet                                           = "d-cus-vnet-apps"
    nsg                                            = "d-cus-nsg-sql"
    route_table                                    = true
  },
  d-cus-snet-privendpoint = {
    subnet_range                                   = ["10.130.92.0/25"]
    service_endpoints                              = []
    delegation_name                                = null
    delegation_actions                             = null
    enforce_private_link_endpoint_network_policies = true
    vnet                                           = "d-cus-vnet-apps"
    nsg                                            = null
    route_table                                    = true
  },
}

nsgs = [
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
]

route_tables = [
  {
    name                          = "d-cus-rt-servers" #update
    vnet                          = "d-cus-vnet-apps"  #update
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
    name                          = "d-cus-rt-sql"    #update
    vnet                          = "d-cus-vnet-apps" #update
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
    vnet                          = "d-cus-vnet-apps"
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
}

key_vault_name = "d-cus-kv-apps01" ###"icusidentitykv" ##update

hubid = "3a5271d7-a7d6-4584-818c-238fa6355819" 