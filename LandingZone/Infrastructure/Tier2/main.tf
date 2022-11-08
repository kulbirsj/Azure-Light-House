module "lz_virtual_network" {
  source = "./LandingZone/networking"
  providers = {
    azurerm = azurerm
    azurerm.platform = azurerm.platform
  }
  resource_group_name = var.resource_group_name
  location = var.location
  lz_vnet_name = var.lz_vnet_name
  lz_vnet_address_space = var.lz_vnet_address_space
  lz_vnet_dns_servers = var.lz_vnet_dns_servers
  lz_vnet_tags = var.lz_vnet_tags
  lz_rt_tags = var. lz_rt_tags
  platform_vnet_name = var.platform_vnet_name
  platform_vnet_rg = var.platform_vnet_rg
}

module "lz_recovery_services" {
  source = "./LandingZone/recovery-services"
  location = var.location
  soft_delete_enabled = var.soft_delete_enabled
  lz_rs_rg = var.lz_rs_rg
  lz_rsv_name = var.lz_rsv_name
  lz_rsv_tags = var.lz_rsv_tags
}