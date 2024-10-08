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

subscription_id = "0ba180a4-f5ab-4564-b73a-315a4a3b75c9"


location = "centralus" // 

tags = {
  Applications  = "Networking"
  BusinessOwner = "IT"
  ITOwner       = "Networking"
  CreatedBy     = "ggibson@3cloudsolutions.com"
  CreatedOn     = "06/24/2024"
  Department    = "IT"
  Description   = "Training"
  DisplayName   = "Training"
  Environment   = "Production"
  Tier          = "1"
}

#---------------------------------------------------------
# Resource Group Names
#---------------------------------------------------------
rg_name = "p-cus-rg-training"

#---------------------------------------------------------
# VNETs
#---------------------------------------------------------
vnets = [ ##update
  {
    resource_group = "p-cus-rg-training"
    name           = "p-cus-vnet-training"
    cidr           = ["10.120.96.0/19"]
    dns_servers    = ["10.251.8.68"]
  }
]

subnet = { ##update
  p-cus-snet-servers = {
    subnet_range                                   = ["10.120.96.0/22"]
    service_endpoints                              = []
    delegation_name                                = null
    delegation_actions                             = null
    enforce_private_link_endpoint_network_policies = true
    vnet                                           = "p-cus-vnet-training"
    nsg                                            = "p-cus-nsg-servers"
    route_table                                    = true
  },
  p-cus-snet-sql = {
    subnet_range                                   = ["10.120.100.0/23"]
    service_endpoints                              = []
    delegation_name                                = null
    delegation_actions                             = null
    enforce_private_link_endpoint_network_policies = true
    vnet                                           = "p-cus-vnet-training"
    nsg                                            = "p-cus-nsg-sql"
    route_table                                    = true
  },
  p-cus-snet-privendpoint = {
    subnet_range                                   = ["10.120.102.0/24"]
    service_endpoints                              = []
    delegation_name                                = null
    delegation_actions                             = null
    enforce_private_link_endpoint_network_policies = true
    vnet                                           = "p-cus-vnet-training"
    nsg                                            = null
    route_table                                    = true
  },
}

nsgs = [
  {
    name = "p-cus-nsg-servers"
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
    name = "p-cus-nsg-sql"
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
    name                          = "p-cus-rt-sql"        #update
    vnet                          = "p-cus-vnet-training" #update
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
    name                          = "p-cus-rt-servers"       #update
    vnet                          = "p-cus-vnet-training" #update
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
    name                          = "p-cus-rt-privendpoint"
    vnet                          = "p-cus-vnet-training"
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
  "subnet3" = {
    subnet      = "p-cus-snet-sql"
    route_table = "p-cus-rt-sql"
  }
  "subnet4" = {
    subnet      = "p-cus-snet-servers"
    route_table = "p-cus-rt-servers"
  }
  "subnet2" = {
    subnet      = "p-cus-snet-privendpoint"
    route_table = "p-cus-rt-privendpoint"
  }
}


key_vault_name = "p-cus-kv-training01" ###"icusidentitykv" ##update

hubid = "3a5271d7-a7d6-4584-818c-238fa6355819" 