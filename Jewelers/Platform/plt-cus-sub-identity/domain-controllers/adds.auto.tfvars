location       = "centralus"
rg_name        = "i-cus-rg-adds"
key_vault_name = "i-cus-kv-identity"

#################################################################
######################### Subscriptions #########################

#######################
#################################################################


subscription = "1d8bcd67-7874-4cfa-9da0-06038011c26b"


ADDS = {
  i-cus-vm-adds01 = {
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
  i-cus-vm-adds02 = {
    private_ip_address_allocation = "Static"
    static_ip_address             = 6
    dns_servers                   = []
    vm_size                       = "Standard_D4lds_v5"
    zone                          = 2
    cache                         = "ReadWrite"
    storage_account_type          = "StandardSSD_LRS"
    publisher                     = "MicrosoftWindowsServer"
    offer                         = "WindowsServer"
    sku                           = "2022-datacenter-core"
    lun                           = 1
    disk_caching                  = "None"
  },
    i-cus-vm-inf01 = {
    private_ip_address_allocation = "Static"
    static_ip_address             = 4
    dns_servers                   = []
    vm_size                       = "Standard_B4ms"
    zone                          = 2
    cache                         = "ReadWrite"
    storage_account_type          = "StandardSSD_LRS"
    publisher                     = "MicrosoftWindowsServer"
    offer                         = "WindowsServer"
    sku                           = "2019-datacenter"
    lun                           = 1
    disk_caching                  = "None"
  },
}

tags = {
  Applications  = "Domain Controllers"
  BusinessOwner = "IT"
  ITOwner       = "Networking"
  CreatedBy     = "ggibson@3cloudsolutions.com"
  CreatedOn     = "06/24/2024"
  Department    = "IT"
  Description   = "Domain Controller"
  DisplayName   = "Domain Controller"
  Environment   = "Platform"
  Tier          = "1"
}