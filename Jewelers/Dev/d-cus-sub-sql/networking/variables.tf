variable "location" {
  description = "(Required) Azure region"
  type        = string
}
variable "tags" {
  description = "(Required) Tags to be applied"
  type        = map(string)
}
variable "rg_name" {
  description = "Name of the Resource Groups to be created in the Hub Subscription"
  type        = string
}
variable "route_tables" {}
variable "subscription_id" {}
# variable "key_vault_name" {}
variable "vnets" {}
variable "subnet" {}
variable "nsgs" {}
variable "locations_3c" {
  description = "(Internal)Variable used to convert the Azure region code into a consistent 4 digit 3Cloud defined location code"
  type        = map(string)
  default = {
    eastus             = "usea"
    eastus2            = "use2"
    centralus          = "usce"
    northcentralus     = "usnc"
    southcentralus     = "ussc"
    westcentralus      = "uswc"
    westus             = "uswe"
    westus2            = "usw2"
    canadaceast        = "caea"
    brazilsouth        = "brso"
    northeurope        = "euno"
    westeurope         = "euwe"
    uksouth            = "ukso"
    ukwest             = "ukwe"
    japaneast          = "jaea"
    japanwest          = "jawe"
    germanywestcentral = "gmwc"
    eastasia           = "asee"
    southeastasia      = "asea"
    australiaeast      = "auea"
    australiasoutheast = "ausw"
    koreacentral       = "koce"
    koreasouth         = "koso"
    centralindia       = "ince"
    southindia         = "inso"
    westindia          = "inwe"
    francecentral      = "frce"
    francesouth        = "frso"
    australiacentral   = "auce"
    australiacentral2  = "auc2"
    switzerlandwest    = "stzw"
    switzerlandnorth   = "stzn"
  }
}


variable "subnet_route_table_associations" {
  description = "Mapping of subnets to route tables"
  type = map(object({
    subnet      = string
    route_table = string
  }))
  default = {}
}


variable "hubid" {}

