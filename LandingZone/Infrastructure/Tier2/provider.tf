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
    key            = "terraform.tier3.tfstate"
  } */
  backend "local" {
    path = "./tier2.tfstate"
  }
}
provider "azurerm" {
  features {}
}

provider "azurerm" {
  features {}
  alias = "platform"
  subscription_id = var.platform_sub_id
}