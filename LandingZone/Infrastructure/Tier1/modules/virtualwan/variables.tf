variable "vlan_object" {
  type = object({
    # Declare an object using only the subset of attributes the module
    # needs. Terraform will allow any object that has at least these
    # attributes.
    id           = string
    resource_group_name = string
  })
}

variable "location" {
  type = string
  description = "Location in azure to create objects"
  default = "eastus"
}

variable "wan_RG_Name" {
  type = string
  default = "AzureWanRG"
}

variable "wan_name" {
  type = string
  default = "AzureWan"
}

variable "wan_tags" {
  type = map(string)
  description = "The tags for the wan hub."
  default = {
    CostCenter = "None"
    Enviroment = "Production"
    Department = "IT"
  }
}

variable "wan_hub_name" {
  type = string
}

variable "wan_hub_prefix" {
  type = string
  default = "10.250.0.0/24"
}

variable "wan_hub_tags" {
  type = map(string)
  description = "The tags for the wan hub."
  default = {
    CostCenter = "None"
    Enviroment = "Production"
    Department = "IT"
  }
}

variable "wan_hub_connection_name" {
  type = string
}

variable "wan_site_name" {
  type = string
}

variable "wan_site_link_name" {
  type = string
}

variable "wan_site_link_ip" {
  type = string
}

variable "wan_site_address_spaces" {
    type = list(string)
}

variable "wan_vpn_gtwy_name" {
  type = string
  default = "AzureWan_VPNGtwy"
}

variable "wan_vpn_gtwy_connection_name" {
  type = string
  default = "AzureWan_VPNGtwy_Conn"
}

variable "wan_vpn_gtwy_connection_link_name" {
  type = string
  default = "AzureWan_VPNGtwy_Conn_Link"
}

variable "wan_vpn_gtwy_connection_link_private_key" {
  type = string
}

variable "wan_vpn_gtwy_tags" {
  type = map(string)
  description = "The tags for the wan hub."
  default = {
    CostCenter = "None"
    Enviroment = "Production"
    Department = "IT"
  }
}