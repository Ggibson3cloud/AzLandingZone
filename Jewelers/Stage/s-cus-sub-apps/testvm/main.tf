module "resource_group" {
  source   = "../../../../Jewelers-modules/base/resource_group/"
  name     = var.rg_name
  location = var.location
  tags     = var.tags
}

resource "azurerm_public_ip" "appgw_public_ip" {
  name                = var.public_ip_name
  location            = var.location
  resource_group_name = var.rg_name
  allocation_method   = "Static"
}

module "addns_servers" {
  for_each                      = var.ADDS
  source                        = "../../../../Jewelers-modules/compute/windows_virtual_machine"
  vm_name                       = each.key
  location                      = var.location
  resource_group                = module.resource_group.name
  key_vault_id                  = data.azurerm_key_vault.keyvault.id
  subnet_id                     = data.azurerm_subnet.snet-01.id
  private_ip_address_allocation = each.value.private_ip_address_allocation
  vm_size                       = each.value.vm_size
  zone                          = each.value.zone
  cache                         = each.value.cache
  storage_account_type          = each.value.storage_account_type
  publisher                     = each.value.publisher
  offer                         = each.value.offer
  sku                           = each.value.sku
  lun                           = each.value.lun
  disk_caching                  = each.value.disk_caching
  dns_servers                   = each.value.dns_servers
  static_ip_address             = cidrhost("${data.azurerm_subnet.snet-01.address_prefixes[0]}", each.value.static_ip_address)
  tags                          = var.tags
}
