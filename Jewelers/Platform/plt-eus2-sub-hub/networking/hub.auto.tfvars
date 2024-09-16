# RESOURCE: {ENVIRONMENT}-{LOCATION}-{RESOURCE}-{APPLICATION}-{FUNCTION}
# RG:       {ENVIRONMENT}-{LOCATION}-{RESOURCE}-{APPLICATION}-{FUNCTION}

# Hub and Spoke Subscriptions:
#Central US for main East US 2 for DR
#################################################################
######################### Subscriptions #########################

# PLT-eus2-Hub = 3a5271d7-a7d6-4584-818c-238fa6355819
# PLT-eus2-Identity = 1d8bcd67-7874-4cfa-9da0-06038021c26b
# PLT-eus2-SharedService = fc0f9a38-a35a-479a-a5ab-65bfd51dd52f

#################################################################
#################################################################

subscriptionid = "8cc21a98-4584-4bed-8643-4cb6fd0d7bbf"


location = "eastus2" // 

tags = {
  Applications  = "Networking"
  BusinessOwner = "IT"
  ITOwner       = "Networking"
  CreatedBy     = "ggibson@3cloudsolutions.com"
  CreatedOn     = "6/24/2024"
  Department    = "IT"
  Description   = "DR Hub Resources"
  DisplayName   = "DR Hub Resources"
  Environment   = "Production DR Hub"
  Tier          = "1"
}

#---------------------------------------------------------
# Resource Group Names
#---------------------------------------------------------

rg_name = "h-eus2-rg-hub"

#---------------------------------------------------------
# VNETs
#---------------------------------------------------------

vnets = [
  {
    resource_group = "h-eus2-rg-hub"
    name           = "h-eus2-vnet-hub"
    cidr           = ["10.251.20.0/22"]
    dns_servers    = []
  },
  {
    resource_group = "h-eus2-rg-hub"
    name           = "h-eus2-vnet-appgw"
    cidr           = ["10.251.24.0/24"]
    dns_servers    = []
  }
]

subnet = {

  h-eus2-snet-ftdvoutside = {
    subnet_range                                   = ["10.251.20.0/26"]
    service_endpoints                              = []
    delegation_name                                = null
    delegation_actions                             = null
    enforce_private_link_endpoint_network_policies = true
    vnet                                           = "h-eus2-vnet-hub"
    nsg                                            = "h-eus2-nsg-ftdvoustide"
    route_table                                    = null
  },
  h-eus2-snet-ftdvinside = {
    subnet_range                                   = ["10.251.20.64/26"]
    service_endpoints                              = []
    delegation_name                                = null
    delegation_actions                             = null
    enforce_private_link_endpoint_network_policies = true
    vnet                                           = "h-eus2-vnet-hub"
    nsg                                            = "h-eus2-nsg-ftdvinside"
    route_table                                    = null
  },
  h-eus2-snet-ftdvdiag = {
    subnet_range                                   = ["10.251.20.128/26"]
    service_endpoints                              = []
    delegation_name                                = null
    delegation_actions                             = null
    enforce_private_link_endpoint_network_policies = true
    vnet                                           = "h-eus2-vnet-hub"
    nsg                                            = "h-eus2-nsg-ftdvdiag"
    route_table                                    = null
  },
  h-eus2-snet-ftdvmgmt = {
    subnet_range                                   = ["10.251.20.192/26"]
    service_endpoints                              = []
    delegation_name                                = null
    delegation_actions                             = null
    enforce_private_link_endpoint_network_policies = true
    vnet                                           = "h-eus2-vnet-hub"
    nsg                                            = "h-eus2-nsg-ftdvmgmt"
    route_table                                    = null
  },
  h-eus2-snet-sdwanoutside = {
    subnet_range                                   = ["10.251.21.64/26"]
    service_endpoints                              = []
    delegation_name                                = null
    delegation_actions                             = null
    enforce_private_link_endpoint_network_policies = true
    vnet                                           = "h-eus2-vnet-hub"
    nsg                                            = "h-eus2-nsg-sdwanoutside"
    route_table                                    = null
  },
  h-eus2-snet-sdwaninside = {
    subnet_range                                   = ["10.251.21.0/26"]
    service_endpoints                              = []
    delegation_name                                = null
    delegation_actions                             = null
    enforce_private_link_endpoint_network_policies = true
    vnet                                           = "h-eus2-vnet-hub"
    nsg                                            = null
    route_table                                    = null
  },
  h-eus2-snet-dnsprinside = {
    subnet_range                                   = ["10.251.21.128/26"]
    service_endpoints                              = []
    delegation_name                                = null
    delegation_actions                             = null
    enforce_private_link_endpoint_network_policies = true
    vnet                                           = "h-eus2-vnet-hub"
    nsg                                            = "h-eus2-vnet-dnsprinside"
    route_table                                    = null
  },
  h-eus2-snet-dnsproutside = {
    subnet_range                                   = ["10.251.21.192/26"]
    service_endpoints                              = []
    delegation_name                                = null
    delegation_actions                             = null
    enforce_private_link_endpoint_network_policies = true
    vnet                                           = "h-eus2-vnet-hub"
    nsg                                            = "h-eus2-nsg-dnsproutside"
    route_table                                    = null
  },
  AzureBastionSubnet = {
    subnet_range                                   = ["10.251.22.128/26"]
    service_endpoints                              = []
    delegation_name                                = null
    delegation_actions                             = null
    enforce_private_link_endpoint_network_policies = true
    vnet                                           = "h-eus2-vnet-hub"
    nsg                                            = null
    route_table                                    = null
  },
  h-eus2-snet-appgw = {
    subnet_range                                   = ["10.251.24.0/25"]
    service_endpoints                              = []
    delegation_name                                = null
    delegation_actions                             = null
    enforce_private_link_endpoint_network_policies = true
    vnet                                           = "h-eus2-vnet-appgw"
    nsg                                            = "h-eus2-nsg-appgw"
    route_table                                    = true
  },
  h-eus2-snet-privatednsin = {
    subnet_range                                   = ["10.251.22.64/27"]
    service_endpoints                              = []
    delegation_name                                = null
    delegation_actions                             = null
    enforce_private_link_endpoint_network_policies = true
    vnet                                           = "h-eus2-vnet-hub"
    nsg                                            = "h-eus2-nsg-privatednsin"
    route_table                                    = null
  },
  h-eus2-snet-privatednsout = {
    subnet_range                                   = ["10.251.22.96/27"]
    service_endpoints                              = []
    delegation_name                                = null
    delegation_actions                             = null
    enforce_private_link_endpoint_network_policies = true
    vnet                                           = "h-eus2-vnet-hub"
    nsg                                            = "h-eus2-nsg-privatednsout"
    route_table                                    = null
  },


}

# TODO: Examples - Need to set with appropriate route rules
route_tables = [
  {
    name                          = "h-eus2-rt-appgw"
    vnet                          = "h-eus2-vnet-appgw"
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
    name                          = "h-eus2-rt-ftdvoutside"
    vnet                          = "h-eus2-vnet-hub"
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
    name                          = "h-eus2-rt-ftdvinside"
    vnet                          = "h-eus2-vnet-hub"
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
    name                          = "h-eus2-rt-ftdvdiag"
    vnet                          = "h-eus2-vnet-hub"
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
    name                          = "h-eus2-rt-ftdvmgmt"
    vnet                          = "h-eus2-vnet-hub"
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
    name                          = "h-eus2-rt-dnsprinside"
    vnet                          = "h-eus2-vnet-hub"
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
    name                          = "h-eus2-rt-dnsproutside"
    vnet                          = "h-eus2-vnet-hub"
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
    name                          = "h-eus2-rt-sdwanvinside"
    vnet                          = "h-eus2-vnet-hub"
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
    name                          = "h-eus2-rt-sdwanvoutside"
    vnet                          = "h-eus2-vnet-hub"
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



#---------------------------------------------------------
# Network Security Groups
#---------------------------------------------------------
nsgs = [

  {
    name = "h-eus2-nsg-ftdvoutside"
    rules = [
      {
        description                                = "Allow All Inbound"
        protocol                                   = "*"
        access                                     = "Allow"
        priority                                   = "210"
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
    name = "h-eus2-nsg-ftdvinside"
    rules = [
      {
        description                                = "Allow All Inbound"
        protocol                                   = "*"
        access                                     = "Allow"
        priority                                   = "210"
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
    name = "h-eus2-nsg-ftdvdiag"
    rules = [
      {
        description                                = "Allow All Inbound"
        protocol                                   = "*"
        access                                     = "Allow"
        priority                                   = "210"
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
    name = "h-eus2-nsg-ftdvmgmt"
    rules = [
      {
        description                                = "Allow All Inbound"
        protocol                                   = "*"
        access                                     = "Allow"
        priority                                   = "210"
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
    name = "h-eus2-nsg-dnsprinside"
    rules = [
      {
        description                                = "Allow All Inbound"
        protocol                                   = "*"
        access                                     = "Allow"
        priority                                   = "210"
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
    name = "h-eus2-nsg-dnsproutside"
    rules = [
      {
        description                                = "Allow All Inbound"
        protocol                                   = "*"
        access                                     = "Allow"
        priority                                   = "210"
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
    name = "h-eus2-nsg-appgw"
    rules = [
      {
        description                                = "Allow All Inbound"
        protocol                                   = "*"
        access                                     = "Allow"
        priority                                   = "210"
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
    name = "h-eus2-nsg-privatednsin"
    rules = [
      {
        description                                = "Allow All Inbound"
        protocol                                   = "*"
        access                                     = "Allow"
        priority                                   = "210"
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
    name = "h-eus2-nsg-privatednsout"
    rules = [
      {
        description                                = "Allow All Inbound"
        protocol                                   = "*"
        access                                     = "Allow"
        priority                                   = "210"
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
    name = "h-eus2-nsg-azurebastion"
    rules = [
      {
        description                                = "Allow All Inbound"
        protocol                                   = "*"
        access                                     = "Allow"
        priority                                   = "210"
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
    name = "h-eus2-nsg-sdwanvinside"
    rules = [
      {
        description                                = "Allow All Inbound"
        protocol                                   = "*"
        access                                     = "Allow"
        priority                                   = "210"
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
    name = "h-eus2-nsg-sdwanvoutside"
    rules = [
      {
        description                                = "Allow All Inbound"
        protocol                                   = "*"
        access                                     = "Allow"
        priority                                   = "210"
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

subnet_route_table_associations = {
  "subnet7" = {
    subnet      = "h-eus2-snet-appgw"
    route_table = "h-eus2-rt-appgw"
  }
  "subnet1" = {
    subnet      = "h-eus2-snet-dnsprinside"
    route_table = "h-eus2-rt-dnsprinside"
  }
  "subnet2" = {
    subnet      = "h-eus2-snet-dnsproutside"
    route_table = "h-eus2-rt-dnsproutside"
  }
  "subnet3" = {
    subnet      = "h-eus2-snet-ftdvinside"
    route_table = "h-eus2-rt-ftdvinside"
  }
  "subnet4" = {
    subnet      = "h-eus2-snet-ftdvoutside"
    route_table = "h-eus2-rt-ftdvoutside"
  }
  "subnet5" = {
    subnet      = "h-eus2-snet-ftdvmgmt"
    route_table = "h-eus2-rt-ftdvmgmt"
  }
  "subnet6" = {
    subnet      = "h-eus2-snet-ftdvdiag"
    route_table = "h-eus2-rt-ftdvdiag"
  }

}

bastion_name = "heus2bas"

