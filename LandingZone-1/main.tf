# Landing Zone Standard Policies

module "Policies" {

  source = "./modules/policies"

  company_name = var.company_name

  location = var.location

  networkwatcher_rg = var.networkwatcher_rg

  networkwatcher_locations = var.networkwatcher_locations

  policy_allowed_regions_enable = var.policy_allowed_regions_enable

  policy_allowed_regions_list = var.policy_allowed_regions_list

  policy_allowed_storage_skus_enable = var.policy_allowed_storage_skus_enable

  policy_allowed_storage_skus_list = var.policy_allowed_storage_skus_list

  policy_allowed_vm_skus_enable = var.policy_allowed_vm_skus_enable

  policy_allowed_vm_skus_list = var.policy_allowed_vm_skus_list

  policy_deny_ip_forwarding_enable = var.policy_deny_ip_forwarding_enable

  policy_prevent_inbound_rdp_enable = var.policy_prevent_inbound_rdp_enable

  policy_associate_with_nsg_enable = var.policy_associate_with_nsg_enable

  policy_networkwatcher_enabled_audit_enable = var.policy_networkwatcher_enabled_audit_enable

  policy_networkwatcher_deploy_enable = var.policy_networkwatcher_deploy_enable

  policy_https_to_storage_enable = var.policy_https_to_storage_enable

  policy_sql_encryption_enable = var.policy_sql_encryption_enable

  policy_invalid_resource_types_enable = var.policy_invalid_resource_types_enable

  policy_invalid_resource_types_list = var.policy_invalid_resource_types_list

  policy_security_center_deploy_enable = var.policy_security_center_deploy_enable

  policy_inherit_tags = var.policy_inherit_tags

  policy_asc_monitoring_enable = var.policy_asc_monitoring_enable

  policy_enforce_inguest_monitoring_enable = var.policy_enforce_inguest_monitoring_enable

  policy_enforce_vm_backup_enable = var.policy_enforce_vm_backup_enable

  policy_audit_diagnostics_enable = var.policy_audit_diagnostics_enable

  policy_audit_diagnostics_types_list = var.policy_audit_diagnostics_types_list

  policy_audit_sqlservers_enable = var.policy_audit_sqlservers_enable

  policy_required_tags = var.policy_required_tags

  policy_inherit_RG_tags = var.policy_inherit_RG_tags

}

#Management Groups creation and association with Subscription ids.

module "managementgroups" {
  source = "./Modules/managementgroups"
mainmanagement_group1_display_name = var.mainmanagement_group1_display_name
management_group1_display_name = var.management_group1_display_name
management_group1_subscription_ids = var.management_group1_subscription_ids
#management_group2_display_name = var.management_group2_display_name
#management_group2_subscription_ids = var.management_group2_subscription_ids
#management_group3_display_name = var.management_group3_display_name
#management_group3_subscription_ids = var.management_group3_subscription_ids
} 



#Additional Resource Groups Deployment

resource "azurerm_resource_group" "additional_rgs" {
  for_each = var.additional_resource_groups
  name     = each.key
  location = each.value
}



#Virtual Network Module Deployment

module "landingzone_virtual_network" {
  source                      = "./modules/landingzone-virtual-network"
  location                    = var.location
  resource_group_name         = var.network_rg_name
  landingzone_vnet_name          = var.landingzone_vnet_name
  landingzone_vnet_address_space = var.landingzone_vnet_address_space
  landingzone_vnet_dns_servers   = var.landingzone_vnet_dns_servers
  landingzone_subnets            = var.landingzone_subnets
  landingzone_NSG_Prefix         = var.landingzone_NSG_Prefix
  landingzone_vnet_tags          = var.landingzone_vnet_tags
  spoke_landingzone_vnet_name          = var.spoke_landingzone_vnet_name
  
}

#Spoke Virtual Network Module Deployment
/*data "azurerm_network" "network" {
  virtual_network_name = var.landingzone_vnet_name
  resource_group_name  = var.network_rg_name
  depends_on = [
    module.landingzone_virtual_network
  ]
}*/

module "spoke_landingzone_virtual_network" {
  source                      = "./modules/landingzone-virtual-network"
  location                    = var.location
  spoke_resource_group_name         = var.spoke_resource_group_name
  spoke_landingzone_vnet_name          = var.spoke_landingzone_vnet_name
  spoke_landingzone_vnet_address_space = var.spoke_landingzone_vnet_address_space
  spoke_landingzone_subnets            = var.spoke_landingzone_subnets
  landingzone_vnet_dns_servers   = var.landingzone_vnet_dns_servers
  landingzone_vnet_name          = var.landingzone_vnet_name
}

#LandingZone Domain Controller Subnet details

data "azurerm_subnet" "dc_subnet" {
  name                 = var.landingzone_dcsubnet_name
  virtual_network_name = var.landingzone_vnet_name
  resource_group_name  = var.network_rg_name
  depends_on = [
    module.landingzone_virtual_network
  ]
}

#Identity Module Deployment

module "identity" {
  source = "./modules/identity"
  depends_on = [
    module.landingzone_virtual_network
  ]
  location                               = var.location
  ident_rg_name                          = var.ident_rg_name
  ident_dcstore_bootdiag_name            = var.ident_dcstore_bootdiag_name
  ident_keyvault_name                    = var.ident_keyvault_name
  ident_recoveryservicesvault_name       = var.ident_recoveryservicesvault_name
  ident_recoveryservicesvault_softdelete = var.ident_recoveryservicesvault_softdelete
  ident_dcavailset_name                  = var.ident_dcavailset_name
  ident_dcavailset_fault_domain_count    = var.ident_dcavailset_fault_domain_count
  ident_dc_subnet_id                     = data.azurerm_subnet.dc_subnet.id
  ident_dc_admin_username                = var.ident_dc_admin_username
  ident_dc_admin_password                = var.ident_dc_admin_password
  ident_dc01_nic_name                    = var.ident_dc01_nic_name
  ident_dc02_nic_name                    = var.ident_dc02_nic_name
  ident_dc01_nic_ip                      = var.ident_dc01_nic_ip
  ident_dc02_nic_ip                      = var.ident_dc02_nic_ip
  ident_dc01_name                        = var.ident_dc01_name
  ident_dc01_size                        = var.ident_dc01_size
  ident_dc02_name                        = var.ident_dc02_name
  ident_dc02_size                        = var.ident_dc02_size
  ident_backup_policy_name               = var.ident_backup_policy_name
  ident_dcstore_bootdiag_tags            = var.ident_dcstore_bootdiag_tags
  ident_keyvault_tags                    = var.ident_keyvault_tags
  ident_recoveryservicesvault_tags       = var.ident_recoveryservicesvault_tags
  count                                  = var.deploy_identity ? 1 : 0
  ident_dc_count                         = var.ident_dc_count
}


#Gateway Subnet Details

data "azurerm_subnet" "GatewaySubnet" {
  name                 = "GatewaySubnet"
  virtual_network_name = var.landingzone_vnet_name
  resource_group_name  = var.network_rg_name
  depends_on = [
    module.landingzone_virtual_network
  ]
}

#Virtual Gateway Module Deployment

module "vpn_gateway" {
  depends_on = [
    data.azurerm_subnet.GatewaySubnet
  ]
  source = "./modules/vpngateway"
  count  = var.deploy_gateway ? 1 : 0
  gtwy_vpn_name               = var.gtwy_vpn_name
  gtwy_subnet_object          = data.azurerm_subnet.GatewaySubnet
  gtwy_local_address          = var.gtwy_local_address
  gtwy_local_address_spaces   = var.gtwy_local_address_spaces
  gtwy_connection_private_key = var.gtwy_connection_private_key
  gtwy_vpn_sku                = var.gtwy_vpn_sku
  gtyw_vpn_generation         = var.gtyw_vpn_generation
  gtwy_vpn_tags               = var.gtwy_vpn_tags
  gtwy_local_tags             = var.gtwy_local_tags
}

module "express_route" {
  depends_on = [
    data.azurerm_subnet.GatewaySubnet
  ]
  
  source = "./modules/expressroute"
  count  = var.deploy_expressroute ? 1 : 0

  expressroute_vpn_gtwy_name            = var.expressroute_vpn_gtwy_name
  gtwy_subnet_object                    = data.azurerm_subnet.GatewaySubnet
  expressroute_circuit_name             = var.expressroute_circuit_name
  expressroute_circuit_service_provider = var.expressroute_circuit_service_provider
  expressroute_circuit_peering_location = var.expressroute_circuit_peering_location
 ## expressroute_circuit_bandwidth        = var.expressroute_circuit_bandwidth
 ## expressroute_circuit_sku              = var.expressroute_circuit_sku
 ## expressroute_circuit_family           = var.expressroute_circuit_family
  ##expressroute_circuit_tags             = var.expressroute_circuit_tags
  expressroute_gtwy_vpn_tags            = var.expressroute_gtwy_vpn_tags

}
