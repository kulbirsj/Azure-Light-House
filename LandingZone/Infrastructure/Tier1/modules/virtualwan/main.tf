resource "azurerm_resource_group" "azure_wan_rg" {
  name     = var.wan_RG_Name
  location = var.location
}

resource "azurerm_virtual_wan" "azurewan" {
  name                = var.wan_name
  resource_group_name = azurerm_resource_group.azure_wan_rg.name
  location            = azurerm_resource_group.azure_wan_rg.location
  tags                = var.wan_tags
}

resource "azurerm_virtual_hub" "wan_hub" {
  name                = var.wan_hub_name
  resource_group_name = azurerm_resource_group.azure_wan_rg.name
  location            = azurerm_resource_group.azure_wan_rg.location
  virtual_wan_id      = azurerm_virtual_wan.azurewan.id
  address_prefix      = var.wan_hub_prefix
  tags                = var.wan_hub_tags
}

resource "azurerm_virtual_hub_connection" "wan_hub_connection" {
  name                      = var.wan_hub_connection_name
  virtual_hub_id            = azurerm_virtual_hub.wan_hub.id
  remote_virtual_network_id = var.vlan_object.id
}

resource "azurerm_vpn_site" "wan_site" {
  name                = var.wan_site_name
  resource_group_name = azurerm_resource_group.azure_wan_rg.name
  location            = azurerm_resource_group.azure_wan_rg.location
  virtual_wan_id      = azurerm_virtual_wan.azurewan.id
  address_cidrs       = var.wan_site_address_spaces

  link {
    name       = var.wan_site_link_name
    ip_address = var.wan_site_link_ip
  }
}

resource "azurerm_vpn_gateway" "wan_vpn_gateway" {
  name                = var.wan_vpn_gtwy_name
  location            = azurerm_resource_group.azure_wan_rg.location
  resource_group_name = azurerm_resource_group.azure_wan_rg.name
  virtual_hub_id      = azurerm_virtual_hub.wan_hub.id
  depends_on = [
    azurerm_vpn_site.wan_site,
    azurerm_virtual_hub.wan_hub,
    azurerm_virtual_hub_connection.wan_hub_connection
  ]
  tags = var.wan_vpn_gtwy_tags
}

resource "azurerm_vpn_gateway_connection" "wan_vpn_gateway_connection" {
  name               = var.wan_vpn_gtwy_connection_name
  vpn_gateway_id     = azurerm_vpn_gateway.wan_vpn_gateway.id
  remote_vpn_site_id = azurerm_vpn_site.wan_site.id

  vpn_link {
    name             = var.wan_vpn_gtwy_connection_link_name
    vpn_site_link_id = azurerm_vpn_site.wan_site.link[0].id
    shared_key       = var.wan_vpn_gtwy_connection_link_private_key
  }
}
