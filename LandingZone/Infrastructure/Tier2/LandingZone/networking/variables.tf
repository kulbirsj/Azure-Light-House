variable "resource_group_name" {
  type = string
  default = "networking_rg"
}

variable "location" {
  type = string
  default = "northcentralus"
}

variable "lz_vnet_name" {
  type = string
  description = "The name of the Virtual Network"
}

variable "lz_vnet_tags" {
  type = map(string)
  description = "The tags for the wan hub."
  default = {
    CostCenter = "None"
    Enviroment = "Production"
    Department = "IT"
  }
}

variable "lz_vnet_address_space" {
  type = list(string)
  description = "The address space prefix for the virtual network in CIDR format"
  default = ["10.100.0.0/22"]
}

variable "lz_vnet_dns_servers" {
  type = list(string)
  description = "List of DNS Servers for the virtual network"
  default = ["10.0.0.1","10.0.0.2"]
}

variable "lz_rt_name" {
  type = string
  description = "Route Table name"
  default = "rt-landingzone"
}

variable "lz_rt_tags" {
  type = map(string)
  description = "The tags for the wan hub."
  default = {
    CostCenter = "None"
    Enviroment = "Production"
    Department = "IT"
  }
}

variable "platform_vnet_name" {
  type = string
  description = "The name of the platform Virtual Network"
}

variable "platform_vnet_rg" {
  type = string
  description = "The name of the Platform Virtual Network resource group."
}
