terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>2.57.0"
      configuration_aliases = [ azurerm, azurerm.platform ]
    }
  }
}