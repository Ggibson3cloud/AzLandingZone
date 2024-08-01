# RESOURCE: {ENVIRONMENT}-{LOCATION}-{RESOURCE}-{APPLICATION}-{FUNCTION}
# RG:       {ENVIRONMENT}-{LOCATION}-{RESOURCE}-{APPLICATION}-{FUNCTION}

# Hub and Spoke Subscriptions:
#Central US for main East US 2 for DR
#################################################################
######################### Subscriptions #########################

# PLT-CUS-Hub = 3a5271d7-a7d6-4584-818c-238fa6355819
# PLT-CUS-Identity = 1d8bcd67-7874-4cfa-9da0-06038011c26b
# PLT-CUS-SharedService = 


#################################################################
#################################################################

subscription_id = "fc0f9a38-a35a-479a-a5ab-65bfd51dd52f"


location = "centralus" // 

tags = {
  Applications  = "Networking"
  BusinessOwner = "IT"
  ITOwner       = "Networking"
  CreatedBy     = "ggibson@3cloudsolutions.com"
  CreatedOn     = "06/24/2024"
  Department    = "IT"
  Description   = "Shared Services"
  DisplayName   = "Shared Services"
  Environment   = "Production Hub SS"
  Tier          = "1"
}


#---------------------------------------------------------
# Resource Group Names
#---------------------------------------------------------
rg_name = "o-cus-rg-ss"

#---------------------------------------------------------
# VNETs
#---------------------------------------------------------
vnets = [
  {
    resource_group = "o-cus-rg-ss"
    name           = "o-cus-vnet-ss"
    cidr           = ["10.120.8.0/24"]
    dns_servers    = ["10.251.8.68"]
  }
]

subnet = {
  o-cus-snet-servers = {
    subnet_range                                   = ["10.120.8.0/26"]
    service_endpoints                              = []
    delegation_name                                = null
    delegation_actions                             = null
    enforce_private_link_endpoint_network_policies = true
    vnet                                           = "o-cus-vnet-ss"
    nsg                                            = "o-cus-nsg-servers"
    route_table                                    = true
  }
  AzureBastionSubnet = {
    subnet_range                                   = ["10.120.8.64/26"]
    service_endpoints                              = []
    delegation_name                                = null
    delegation_actions                             = null
    enforce_private_link_endpoint_network_policies = true
    vnet                                           = "o-cus-vnet-ss"
    nsg                                            = "o-cus-nsg-AzureBastionSubnet"
    route_table                                    = true
  }
}

nsgs = [
  {
    name = "o-cus-nsg-servers"
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
    name = "o-cus-nsg-AzureBastionSubnet"
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
    name                          = "o-cus-rt-servers"
    vnet                          = "o-cus-vnet-ss"
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
    name                          = "o-cus-rt-AzureBastionSubnet"
    vnet                          = "o-cus-vnet-ss"
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
    subnet      = "o-cus-snet-servers"
    route_table = "o-cus-rt-servers"
  }
}


#---------------------
# KEY VAULT
#---------------------
key_vault_name = "o-cus-kv-sharedservice-01"

# key_vault_default_access_policy = {
#   
#     "prdeusmgmtkvdap" = {
#     certificate_permissions = ["Get", "List"]
#     key_permissions         = ["Get", "List"]
#     secret_permissions      = ["Get", "List", "Set", "Backup", "Delete", "Purge", "Recover", "Restore"]
#     storage_permissions     = []
#   }
# }

#bastion_name = "h-cus-bastion-bastion01"

hubid = "3a5271d7-a7d6-4584-818c-238fa6355819" 