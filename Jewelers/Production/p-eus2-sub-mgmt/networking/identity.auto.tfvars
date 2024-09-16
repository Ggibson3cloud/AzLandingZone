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

subscription_id = "0e37dc95-aafa-48f6-bef1-26fb543e3245"


location = "eastus2" // 

tags = {
  Applications  = "Networking"
  BusinessOwner = "IT"
  ITOwner       = "Networking"
  CreatedBy     = "ggibson@3cloudsolutions.com"
  CreatedOn     = "08/29/2024"
  Department    = "IT"
  Description   = "DR Production sub for management"
  DisplayName   = "DR Production external"
  Environment   = "DR Production"
  Tier          = "1"
}

#---------------------------------------------------------
# Resource Group Names
#---------------------------------------------------------
rg_name = "p-eus2-rg-external"

#---------------------------------------------------------
# VNETs
#---------------------------------------------------------
vnets = [ ##update
  {
    resource_group = "p-eus2-rg-external"
    name           = "p-eus2-vnet-external"
    cidr           = ["10.121.32.0/24"]
    dns_servers    = []
  }
]

subnet = { ##update
  p-eus2-snet-external = {
    subnet_range = ["10.121.32.0/26"]

    service_endpoints                              = []
    delegation_name                                = null
    delegation_actions                             = null
    enforce_private_link_endpoint_network_policies = true
    vnet                                           = "p-eus2-vnet-external"
    nsg                                            = null
    route_table                                    = true
  },
}

nsgs = [
  {
    name = "p-eus2-nsg-external"
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
    name                          = "p-eus2-rt-external"   #update
    vnet                          = "p-eus2-vnet-external" #update
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
    subnet      = "p-eus2-snet-external"
    route_table = "p-eus2-rt-external"
  }
}


# key_vault_name = "p-eus2-kv-external01" ###"ieus2identitykv" ##update

hubid = "8cc21a98-4584-4bed-8643-4cb6fd0d7bbf" 