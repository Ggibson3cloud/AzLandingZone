location       = "eastus2"
rg_name        = "i-eus2-rg-adds"
key_vault_name = "i-eus2-kv-identity01"

#################################################################
######################### Subscriptions #########################
#################################################################

tags = {
  Applications  = "Networking"
  BusinessOwner = "IT"
  ITOwner       = "Networking"
  CreatedBy     = "ggibson@3cloudsolutions.com"
  CreatedOn     = "09/06/2024"
  Department    = "IT"
  Description   = "Identity Resources"
  DisplayName   = "Identity Resources"
  Environment   = "Production Disaster Recovery Identity"
  Tier          = "1"
}

subscription = "edd5864f-abc5-4e00-92a8-0037a1b634ad"


ADDS = {
  i-eus2-vm-adds1 = {
    private_ip_address_allocation = "Static"
    static_ip_address             = 5
    dns_servers                   = []
    vm_size                       = "Standard_D4lds_v5"
    zone                          = 1
    cache                         = "ReadWrite"
    storage_account_type          = "StandardSSD_LRS"
    publisher                     = "MicrosoftWindowsServer"
    offer                         = "WindowsServer"
    sku                           = "2022-datacenter-core"
    lun                           = 1
    disk_caching                  = "None"

  },
  i-eus2-vm-adds2 = {
    private_ip_address_allocation = "Static"
    static_ip_address             = 6
    dns_servers                   = []
    vm_size                       = "Standard_D4lds_v5"
    zone                          = 3
    cache                         = "ReadWrite"
    storage_account_type          = "StandardSSD_LRS"
    publisher                     = "MicrosoftWindowsServer"
    offer                         = "WindowsServer"
    sku                           = "2022-datacenter-core"
    lun                           = 1
    disk_caching                  = "None"
  },
  i-eus2-vm-inf01 = {
    private_ip_address_allocation = "Static"
    static_ip_address             = 4
    dns_servers                   = []
    vm_size                       = "Standard_B4ms"
    zone                          = 1
    cache                         = "ReadWrite"
    storage_account_type          = "StandardSSD_LRS"
    publisher                     = "MicrosoftWindowsServer"
    offer                         = "WindowsServer"
    sku                           = "2019-datacenter"
    lun                           = 1
    disk_caching                  = "None"
  },
}

