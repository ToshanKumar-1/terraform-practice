terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
  }

  backend "azurerm" {
    key = "sfbe"
    resource_group_name = "Practice"
    storage_account_name = "storageacc128y3829"
    container_name = "terraformstatefile"
  }
}
provider "azurerm" {
  features {
    
  }
  subscription_id = var.subscription_id
  # skip_provider_registration = true
}






