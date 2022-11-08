variable "platform_vnet_name" {
  type = string
  description = "The name of the platform Virtual Network"
}

variable "platform_vnet_rg" {
  type = string
  description = "The name of the Platform Virtual Network resource group."
}

variable "resource_group_name" {
  type = string
  default = "networking_rg"
}

variable "location" {
  type = string
  description = "The azure region in which resources will be deployed to."
  default = "canadacentral"
}

variable "lz_vnet_name" {
  type = string
  description = "The name of the Virtual Network"
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

variable "lz_vnet_tags" {
  type = map(string)
  description = "The tags for the wan hub."
  default = {
    CostCenter = "None"
    Enviroment = "Production"
    Department = "IT"
  }
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

variable "lz_rs_rg" {
  type = string
  default = "RG-LZ-Recovery-Services"
}

variable "lz_rsv_name" {
  type = string
  description = "Recovery Services Vault name"
  default = "rsv-lz-recovery-services"
}

variable "lz_rsv_tags" {
  type = map(string)
  description = "The tags for the wan hub."
  default = {
    CostCenter = "None"
    Enviroment = "Production"
    Department = "IT"
  }
}

variable "platform_sub_id" {
  type = string
  description = "id of the platform subscription."
}

variable "soft_delete_enabled" {
  type = bool
  default = true
  description = "Global soft delete"
}