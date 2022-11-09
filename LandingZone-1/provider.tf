terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>2.57.0"
    }
  }
  
  backend "local" {
    path = "./landingzone.tfstate"
  }
}
provider "azurerm" {
  features {}
}
