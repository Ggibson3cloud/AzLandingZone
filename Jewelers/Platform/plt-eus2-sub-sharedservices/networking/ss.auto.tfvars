# RESOURCE: {ENVIRONMENT}-{LOCATION}-{RESOURCE}-{APPLICATION}-{FUNCTION}
# RG:       {ENVIRONMENT}-{LOCATION}-{RESOURCE}-{APPLICATION}-{FUNCTION}

# Hub and Spoke Subscriptions:
#Central US for main East US 2 for DR
#################################################################
######################### Subscriptions #########################

# PLT-eus2-Hub = 3a5271d7-a7d6-4584-818c-238fa6355819
# PLT-eus2-Identity = 1d8bcd67-7874-4cfa-9da0-06038011c26b
# PLT-eus2-SharedService = 


#################################################################
#################################################################

subscription_id = "9c5c8a97-3c45-4ba3-b3f2-91da940ac498"


location = "eastus2" // 

tags = {
  Applications  = "Networking"
  BusinessOwner = "IT"
  ITOwner       = "Networking"
  CreatedBy     = "ggibson@3cloudsolutions.com"
  CreatedOn     = "08/29/2024"
  Department    = "IT"
  Description   = "DR Shared Services"
  DisplayName   = "DR Shared Services"
  Environment   = "DR Production Hub SS"
  Tier          = "1"
}


#---------------------------------------------------------
# Resource Group Names
#---------------------------------------------------------
rg_name = "o-eus2-rg-ss"

#---------------------------------------------------------
# VNETs
#---------------------------------------------------------
vnets = [
  {
    resource_group = "o-eus2-rg-ss"
    name           = "o-eus2-vnet-ss"
    cidr           = ["10.121.8.0/24"]
    dns_servers    = []
  }
]

subnet = {
  o-eus2-snet-servers = {
    subnet_range                                   = ["10.121.8.0/26"]
    service_endpoints                              = []
    delegation_name                                = null
    delegation_actions                             = null
    enforce_private_link_endpoint_network_policies = true
    vnet                                           = "o-eus2-vnet-ss"
    nsg                                            = "o-eus2-nsg-servers"
    route_table                                    = true
  }
  o-eus2-snet-sql = {
    subnet_range                                   = ["10.121.8.64/26"]
    service_endpoints                              = []
    delegation_name                                = null
    delegation_actions                             = null
    enforce_private_link_endpoint_network_policies = true
    vnet                                           = "o-eus2-vnet-ss"
    nsg                                            = "o-eus2-nsg-o-eus2-snet-sql"
    route_table                                    = true
  }
}

nsgs = [
  {
    name = "o-eus2-nsg-servers"
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
    name = "o-eus2-nsg-sql"
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
  }
]
route_tables = [
  {
    name                          = "o-eus2-rt-servers"
    vnet                          = "o-eus2-vnet-ss"
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
    name                          = "o-eus2-rt-o-eus2-snet-sql"
    vnet                          = "o-eus2-vnet-ss"
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
    subnet      = "o-eus2-snet-servers"
    route_table = "o-eus2-rt-servers"
  }
}


#---------------------
# KEY VAULT
#---------------------
key_vault_name = "o-eus2-kv-sharedservice-01"

# key_vault_default_access_policy = {
#   
#     "prdeusmgmtkvdap" = {
#     certificate_permissions = ["Get", "List"]
#     key_permissions         = ["Get", "List"]
#     secret_permissions      = ["Get", "List", "Set", "Backup", "Delete", "Purge", "Recover", "Restore"]
#     storage_permissions     = []
#   }
# }



hubid = "8cc21a98-4584-4bed-8643-4cb6fd0d7bbf" 