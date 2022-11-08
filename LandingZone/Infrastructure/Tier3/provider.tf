terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>2.57.0"
    }
  }
  #https://www.terraform.io/docs/language/settings/backends/azurerm.html
  /* backend "azurerm" {
    container_name = "tfstate"
    key            = "terraform.tier1.tfstate"
  } */
  backend "local" {
    path = "./tier3.tfstate"
  }

}
provider "azurerm" {
  features {}
}
