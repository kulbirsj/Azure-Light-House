module "platform_virtual_network" {
  source                      = "./modules/platform-virtual-network"
  location                    = var.location
  resource_group_name         = var.network_rg_name
  platform_vnet_name          = var.platform_vnet_name
  platform_vnet_address_space = var.platform_vnet_address_space
  platform_vnet_dns_servers   = var.platform_vnet_dns_servers
  platform_subnets            = var.platform_subnets
  platform_NSG_Prefix         = var.platform_NSG_Prefix
  platform_vnet_tags          = var.platform_vnet_tags
}

resource "random_id" "recovery_vault_name" {
  byte_length = 6
  prefix      = "rsv-"
}

resource "azurerm_resource_group" "platform_recovery_services_rg" {
  name     = var.platform_recovery_services_rg_name
  location = var.location
}

resource "azurerm_recovery_services_vault" "platform_recovery_services_rg_recovery_vault" {
  name                = var.platform_recovery_services_rg_recovery_vault_name != "" ? var.platform_recovery_services_rg_recovery_vault_name : random_id.recovery_vault_name.id
  location            = azurerm_resource_group.platform_recovery_services_rg.location
  resource_group_name = azurerm_resource_group.platform_recovery_services_rg.name
  sku                 = "Standard"
  soft_delete_enabled = var.soft_delete_enabled
}

resource "azurerm_resource_group" "platform_monitoring_rg" {
  name     = var.platform_monitoring_rg_name
  location = var.location
}

resource "azurerm_log_analytics_workspace" "platform_log_analytics_workspace" {
  name                = var.platform_log_analytics_workspace_name
  location            = azurerm_resource_group.platform_monitoring_rg.location
  resource_group_name = azurerm_resource_group.platform_monitoring_rg.name
  sku                 = "PerGB2018"
  retention_in_days   = 30
  tags                = var.platform_log_analytics_workspace_tags
}

#Identity module
data "azurerm_subnet" "adds_subnet" {
  name                 = var.platform_addssubnet_name
  virtual_network_name = var.platform_vnet_name
  resource_group_name  = var.network_rg_name
  depends_on = [
    module.platform_virtual_network
  ]
}

module "identity" {
  source = "./modules/identity"
  depends_on = [
    module.platform_virtual_network
  ]
  location                               = var.location
  ident_rg_name                          = var.ident_rg_name
  ident_dcstore_bootdiag_name            = var.ident_dcstore_bootdiag_name
  ident_keyvault_name                    = var.ident_keyvault_name
  ident_recoveryservicesvault_name       = var.ident_recoveryservicesvault_name
  ident_recoveryservicesvault_softdelete = var.ident_recoveryservicesvault_softdelete
  ident_dcavailset_name                  = var.ident_dcavailset_name
  ident_dc_subnet_id                     = data.azurerm_subnet.adds_subnet.id
  ident_dc01_nic_name                    = var.ident_dc01_nic_name
  ident_dc02_nic_name                    = var.ident_dc02_nic_name
  ident_dc01_nic_ip                      = var.ident_dc01_nic_ip
  ident_dc02_nic_ip                      = var.ident_dc02_nic_ip
  ident_dc_admin_username                = var.ident_dc_admin_username
  ident_dc_admin_password                = var.ident_dc_admin_password
  ident_dc01_name                        = var.ident_dc01_name
  ident_dc01_size                        = var.ident_dc01_size
  ident_dc02_name                        = var.ident_dc02_name
  ident_dc02_size                        = var.ident_dc02_size
  ident_backup_policy_name               = var.ident_backup_policy_name
  ident_dcstore_bootdiag_tags            = var.ident_dcstore_bootdiag_tags
  ident_keyvault_tags                    = var.ident_keyvault_tags
  ident_recoveryservicesvault_tags       = var.ident_recoveryservicesvault_tags
  count                                  = var.deploy_identity ? 1 : 0
}

data "azurerm_subnet" "GatewaySubnet" {
  name                 = "GatewaySubnet"
  virtual_network_name = var.platform_vnet_name
  resource_group_name  = var.network_rg_name
  depends_on = [
    module.platform_virtual_network
  ]
}

module "vpn_gateway" {
  depends_on = [
    data.azurerm_subnet.GatewaySubnet
  ]
  source = "./modules/vpngateway"
  count  = var.deploy_gateway ? 1 : 0

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

  gtwy_subnet_object                    = data.azurerm_subnet.GatewaySubnet
  expressroute_circuit_name             = var.expressroute_circuit_name
  expressroute_circuit_service_provider = var.expressroute_circuit_service_provider
  expressroute_circuit_peering_location = var.expressroute_circuit_peering_location
  expressroute_circuit_bandwidth        = var.expressroute_circuit_bandwidth
  expressroute_circuit_sku              = var.expressroute_circuit_sku
  expressroute_circuit_family           = var.expressroute_circuit_family
  expressroute_circuit_tags             = var.expressroute_circuit_tags
  expressroute_gtwy_vpn_tags            = var.expressroute_gtwy_vpn_tags

}

data "azurerm_virtual_network" "vnet" {
  name                = var.platform_vnet_name
  resource_group_name = var.network_rg_name
  depends_on = [
    module.platform_virtual_network
  ]
}

module "virtual_wan" {
  depends_on = [
    data.azurerm_virtual_network.vnet
  ]
  source = "./modules/virtualwan"
  count  = var.deploy_wan ? 1 : 0

  vlan_object                              = data.azurerm_virtual_network.vnet
  wan_hub_name                             = var.wan_hub_name
  wan_hub_connection_name                  = var.wan_hub_connection_name
  wan_site_name                            = var.wan_site_name
  wan_site_link_name                       = var.wan_site_link_name
  wan_site_link_ip                         = var.wan_site_link_ip
  wan_site_address_spaces                  = var.wan_site_address_spaces
  wan_vpn_gtwy_connection_link_private_key = var.wan_vpn_gtwy_connection_link_private_key
  wan_hub_tags                             = var.wan_hub_tags
  wan_vpn_gtwy_tags                        = var.wan_vpn_gtwy_tags
}

module "automation" {
  source                  = "./modules/automation"
  location                = var.location
  count                   = var.deploy_automation ? 1 : 0
  automation_rg_name      = var.automation_rg_name
  automation_account_name = var.automation_account_name
  automation_account_sku  = var.automation_account_sku
  automation_account_tags = var.automation_account_tags

}

module "security" {
  source                      = "./modules/security"
  location                    = var.location
  count                       = var.deploy_security ? 1 : 0
  log_analytics               = azurerm_log_analytics_workspace.platform_log_analytics_workspace
  platform_alert_email        = var.platform_alert_email
  platform_asc_logexport_tags = var.platform_asc_logexport_tags
}
