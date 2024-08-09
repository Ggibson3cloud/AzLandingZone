terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.70.0"
    }
  }

  backend "azurerm" {
    subscription_id      = "fc0f9a38-a35a-479a-a5ab-65bfd51dd52f"     # SubID SA resides
    resource_group_name  = "ss-cus-rg-terraform"                      # RG Name
    storage_account_name = "sscussatfstate"                           # SA Name
    container_name       = "tfstate"                                  # Default for TFOS
    key                  = "jewelers_backup_vaults.terraform.tfstate" # Key for Deployment
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  subscription_id = var.subscription_id
  features {
    resource_group {
      prevent_deletion_if_contains_resources = true
    }
  }
}
