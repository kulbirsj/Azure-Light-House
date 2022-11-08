variable "location" {
  type = string
  description = "The unique lowercase alpha numeric identifier for resources for the project."
}

variable "soft_delete_enabled" {
  type = bool
  default = true
  description = "Global soft delete"
}

variable "platform_monitoring_rg_name" {
  type = string
  description = "Name of the Monitoring resource group."
  default = "RG-Montoring"
}

variable "platform_log_analytics_workspace_name" {
  type = string
  description = "name of the log analyics workspace."
  default = "log-platform-prod-001"
}

variable "platform_recovery_services_rg_name" {
  type = string
  description = "Name of Recovery Services Resource Group."
  default = "RG-RecoveryServices"
}

variable "platform_recovery_services_rg_recovery_vault_name" {
  type = string
  description = "Name of the Revocery vault, emtpy will auto-generate."
}

variable "network_rg_name" {
  type = string
  description = "Name of the Networking resource group."
  default = "RG-Networking"
}

variable "platform_vnet_name" {
  type = string
  description = "The name of the Virtual Network"
  default = "vnet-platform-001"
}

variable "platform_vnet_address_space" {
  type = list(string)
  description = "The address space prefix for the virtual network in CIDR format"
  default = ["10.0.0.0/16"]
}

variable "platform_vnet_dns_servers" {
  type = list(string)
  description = "List of DNS Servers for the virtual network"
}

variable "platform_subnets" {
  type = map
  description = "A list of subnets and IP ranges for the VNET"
  default = {
    GatewaySubnet = ["10.0.250.0/24"]
  }
}

variable "platform_NSG_Prefix" {
  type = string
  description = "The prefix used for network security groups"
  default = "NSG"
}

variable "platform_addssubnet_name" {
  type = string
  description = "The name of the ADDS Subnet"
}

#Identity Variables
variable "deploy_identity" {
  type = bool
  description = "Whether or not to deploy the identity module"
  default = false
}

variable "ident_rg_name" {
  type = string
  description = "Name of the identity resource group"
  default = "RG-Identity"
}

variable "ident_dcstore_bootdiag_name" {
  type = string
  description = "*Optional: Emtpy will auto-generate. The name of the storage account that will store the boot diagnostics for the domain controllers. Must be globally unique."
}

variable "ident_keyvault_name" {
  type = string
  description = "*Optional: Emtpy will auto-generate. The name of key vault for the identity module. Must be globally unique."
}

variable "ident_recoveryservicesvault_name" {
  type = string
  description = "The name of the recovery services vault for the identity module"
}

variable "ident_recoveryservicesvault_softdelete" {
  type = bool
  description = "Whether Soft Delete is enabled on the recovery services vault"
}

variable "ident_dcavailset_name" {
  type = string
  description = "The name of the Availability Set for the domain controllers" 
}

variable "ident_dc01_nic_name" {
  type = string
}

variable "ident_dc02_nic_name" {
  type = string
}

variable "ident_dc01_nic_ip" {
  type = string
}

variable "ident_dc02_nic_ip" {
  type = string
}

variable "ident_dc_admin_username" {
  type = string
  description = "The username for the local admin account on the VMs"
}

variable "ident_dc_admin_password" {
  type = string
  description = "The password for the local admin account on the VMs"
}

variable "ident_dc01_name" {
  type = string
}

variable "ident_dc01_size" {
  type = string
}

variable "ident_dc02_name" {
  type = string
}

variable "ident_dc02_size" {
  type = string
}

variable "ident_backup_policy_name" {
  type = string
  description = "The name of the retention policy for the Domain Controllers"
}

variable "gtwy_vpn_sku" {
  type = string
}

variable "gtyw_vpn_generation" {
  type = string
}

variable "gtwy_local_address" {
  type = string
  description = "The public IP address of the on-premise VPN device"
}

variable "gtwy_local_address_spaces" {
  type = list(string)
  description = "A list of IP ranges used on-premises"
}

variable "gtwy_connection_private_key" {
  type = string
  description = "The private connection key for the VPN connection"  
}

variable "deploy_gateway" {
  type = bool
  default = false
  description = "Set to true to deploy the VPN Gateway module"
}

variable "expressroute_circuit_name" {
  type = string
}

variable "expressroute_circuit_service_provider" {
  type = string
}

variable "expressroute_circuit_peering_location" {
  type = string
}

variable "expressroute_circuit_bandwidth" {
  type = number
}

variable "expressroute_circuit_sku" {
  type = string
}

variable "expressroute_circuit_family" {
  type = string
}

variable "deploy_expressroute" {
  type = bool
  default = false
}

variable "automation_rg_name" {
  type        = string
  description = "The name of the automation resource group."
  default     = "rg-automation-prod-001"
}

variable "automation_account_name" {
  type = string
  description = "Name of the Automation Account"
  default = "aa-autiomation-prod-001"
}

variable "automation_account_sku" {
  type        = string
  description = "The SKU"
  default     = "Basic"
}

variable "automation_account_tags" {
  type        = map(string)
  description = "The tags to be applied to the automation account at creation."
  default = {
    CostCenter = "None"
    Enviroment = "Production"
    Department = "IT"
  }
}

variable "deploy_automation" {
  type = bool
  description = "Deploy Automation resources."
  default = true
}

variable "deploy_security" {
  type = bool
  description = "Deploy Security resources."
  default = true
}

variable "platform_alert_email" {
  type = string
  description = "The email to which security center will be sending emails."
}

variable "wan_RG_Name" {
  type = string
}

variable "wan_name" {
  type = string
}

variable "wan_hub_name" {
  type = string
}

variable "wan_hub_prefix" {
  type = string
  default = "10.250.0.0/24"
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

variable "deploy_wan" {
  type = bool
  default = false
}

variable "platform_vnet_tags" {
  type = map(string)
  description = "The tags for the wan hub."
  default = {
    CostCenter = "None"
    Enviroment = "Production"
    Department = "IT"
  }
}

variable "expressroute_circuit_tags" {
  type = map(string)
  description = "The tags for the expressroute circuit."
  default = {
    CostCenter = "None"
    Enviroment = "Production"
    Department = "IT"
  }
}

variable "expressroute_gtwy_vpn_tags" {
  type = map(string)
  description = "The tags for the expressroute vpn gateway."
  default = {
    CostCenter = "None"
    Enviroment = "Production"
    Department = "IT"
  }
}

variable "gtwy_vpn_tags" {
  type = map(string)
  description = "The tags for the public ip."
  default = {
    CostCenter = "None"
    Enviroment = "Production"
    Department = "IT"
  }
}

variable "gtwy_local_tags" {
  type = map(string)
  description = "The tags for the public ip."
  default = {
    CostCenter = "None"
    Enviroment = "Production"
    Department = "IT"
  }
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

variable "wan_hub_tags" {
  type = map(string)
  description = "The tags for the wan hub."
  default = {
    CostCenter = "None"
    Enviroment = "Production"
    Department = "IT"
  }
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

variable "platform_asc_logexport_tags" {
  type = map(string)
  description = "The tags for the security_center."
  default = {
    CostCenter = "None"
    Enviroment = "Production"
    Department = "IT"
  }
}

variable "ident_dcstore_bootdiag_tags" {
  type = map(string)
  description = "The tags for the boot diagnostic storage."
  default = {
    CostCenter = "None"
    Enviroment = "Production"
    Department = "IT"
  }
}

variable "ident_keyvault_tags" {
  type = map(string)
  description = "The tags for the identy keyvault."
  default = {
    CostCenter = "None"
    Enviroment = "Production"
    Department = "IT"
  }
}

variable "ident_recoveryservicesvault_tags" {
  type = map(string)
  description = "The tags for the boot diagnostic storage."
  default = {
    CostCenter = "None"
    Enviroment = "Production"
    Department = "IT"
  }
}

variable "platform_log_analytics_workspace_tags" {
  type = map(string)
  description = "The tags for the boot diagnostic storage."
  default = {
    CostCenter = "None"
    Enviroment = "Production"
    Department = "IT"
  }
}