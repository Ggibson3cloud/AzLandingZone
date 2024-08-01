terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.70.0"
    }
  }

  backend "azurerm" {
    subscription_id      = "fc0f9a38-a35a-479a-a5ab-65bfd51dd52f"         # SubID SA resides
    resource_group_name  = "ss-cus-rg-terraform"                          # RG Name
    storage_account_name = "sscussatfstate"                               # SA Name
    container_name       = "tfstate"                                      # Default for TFOS
    key                  = "jewelers_sandbox_test.terraform.tfstate" # Key for Deployment ##Update
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  skip_provider_registration = true
  subscription_id            = var.subscription_id
  features {
    key_vault {
      purge_soft_delete_on_destroy    = true
      recover_soft_deleted_key_vaults = true
    }
    resource_group {
      prevent_deletion_if_contains_resources = true
    }
  }
}
