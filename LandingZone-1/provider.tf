terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>2.57.0"
    }
  }

  /* backend "local" {
    path = "./landingzone.tfstate"
  }*/

  backend "azurerm" {
    resource_group_name  = "tfstate"
    storage_account_name = "tfstate3848"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }

}
provider "azurerm" {
  features {}
}
