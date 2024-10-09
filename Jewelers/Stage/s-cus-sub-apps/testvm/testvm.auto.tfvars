location = "centralus"
rg_name  = "s-cus-rg-appgwtest"
key_vault_name = "s-cus-kv-apps-1"

#################################################################
######################### Subscriptions #########################
#################################################################

tags = {
  Applications  = "Networking"
  BusinessOwner = "IT"
  ITOwner       = "Networking"
  CreatedBy     = "ggibson@3cloudsolutions.com"
  CreatedOn     = "09/17/2024"
  Department    = "IT"
  Description   = "Test VM for APPGW"
  DisplayName   = "Test VM for APPGW"
  Environment   = "Stage"
  Tier          = "3"
}

public_ip_name = "appgwtest-pip"
subscription = "827d0e92-383f-4817-8056-37821889d544"


ADDS = {
  i-cus-vm-apgwt = {
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

