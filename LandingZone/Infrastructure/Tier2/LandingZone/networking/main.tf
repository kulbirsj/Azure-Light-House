data "azurerm_virtual_network" "platform_vnet" {
  provider            = azurerm.platform
  name                = var.platform_vnet_name
  resource_group_name = var.platform_vnet_rg
}

resource "azurerm_resource_group" "networking_rg" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_virtual_network" "landingzone_vnet" {
  name                = var.lz_vnet_name
  location            = var.location
  resource_group_name = azurerm_resource_group.networking_rg.name
  address_space       = var.lz_vnet_address_space
  dns_servers         = var.lz_vnet_dns_servers
  tags                = var.lz_vnet_tags
}

resource "azurerm_route_table" "landingzone_rt" {
  name                          = var.lz_rt_name
  location                      = var.location
  resource_group_name           = azurerm_resource_group.networking_rg.name
  disable_bgp_route_propagation = false
  tags                          = var.lz_rt_tags
}

resource "azurerm_virtual_network_peering" "landingzone_to_hub_peering" {
  name                      = format("%s-to-%s", azurerm_virtual_network.landingzone_vnet.name, data.azurerm_virtual_network.platform_vnet.name)
  resource_group_name       = azurerm_resource_group.networking_rg.name
  virtual_network_name      = azurerm_virtual_network.landingzone_vnet.name
  remote_virtual_network_id = data.azurerm_virtual_network.platform_vnet.id
}

resource "azurerm_virtual_network_peering" "hub_to_landingzone_peering" {
  provider                  = azurerm.platform
  name                      = format("%s-to-%s", data.azurerm_virtual_network.platform_vnet.name, azurerm_virtual_network.landingzone_vnet.name)
  resource_group_name       = data.azurerm_virtual_network.platform_vnet.resource_group_name
  virtual_network_name      = data.azurerm_virtual_network.platform_vnet.name
  remote_virtual_network_id = azurerm_virtual_network.landingzone_vnet.id
}
