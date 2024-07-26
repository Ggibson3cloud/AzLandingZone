### Random Password Stored in SS Keyvault ###

resource "random_string" "local_password" {
  length           = var.passwordLength
  lower            = var.passwordLower
  upper            = var.passwordUpper
  numeric          = var.passwordNumber
  special          = var.passwordSpecial
  min_special      = var.min_special
  override_special = var.override_special
}

resource "azurerm_key_vault_secret" "randpass" {
  name         = join("-", [azurerm_windows_virtual_machine.this.name, "randpass"])
  value        = random_string.local_password.result
  key_vault_id = var.key_vault_id
}

resource "azurerm_key_vault_secret" "vm-username" {
  name         = join("-", [azurerm_windows_virtual_machine.this.name, "username"])
  value        = var.adminUser
  key_vault_id = var.key_vault_id
}

## Create Network Interface and NSG ##

resource "azurerm_network_security_group" "this" {
  name                = "${var.vm_name}-nsg"
  location            = var.location
  resource_group_name = var.resource_group
}


resource "azurerm_network_interface" "this" {
  name                = "${var.vm_name}-nic"
  location            = azurerm_network_security_group.this.location
  resource_group_name = var.resource_group

  ip_configuration {
    name                          = "${var.vm_name}-ip-configuration"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = var.private_ip_address_allocation
  }
}

resource "azurerm_network_interface_security_group_association" "this" {
  network_interface_id      = azurerm_network_interface.this.id
  network_security_group_id = azurerm_network_security_group.this.id
}


## Create Virtual Machine ##
resource "azurerm_virtual_machine" "this" {
  name                = var.vm_name
  resource_group_name = var.resource_group
  location            = var.location
  vm_size             = var.vm_size
  network_interface_ids = [
    azurerm_network_interface.this.id,
  ]

  # os_disk {
  #   caching              = var.cache # "ReadWrite"
  #   storage_account_type = var.storage_account_type #"Standard_LRS"
  #   disk_size_gb = 128
  # }

  storage_os_disk {
    name              = "${var.vm_name}-OSDisk1"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  os_profile {
    computer_name  = var.vm_name
    admin_username = var.adminUser
    admin_password = random_string.local_password.result
  }

  os_profile_linux_config {
    disable_password_authentication = false
  }


}



