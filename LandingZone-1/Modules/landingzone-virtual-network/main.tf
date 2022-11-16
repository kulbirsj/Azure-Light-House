resource "azurerm_resource_group" "networking_rg" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_virtual_network" "landingzone_vnet" {
  name                = var.landingzone_vnet_name
  location            = var.location
  resource_group_name = azurerm_resource_group.networking_rg.name
  address_space       = var.landingzone_vnet_address_space
  dns_servers         = var.landingzone_vnet_dns_servers
  tags = var.landingzone_vnet_tags
}

resource "azurerm_subnet" "Subnets" {
  for_each = var.landingzone_subnets
  name                 = each.key
  resource_group_name  = azurerm_resource_group.networking_rg.name
  virtual_network_name = azurerm_virtual_network.landingzone_vnet.name
  address_prefixes     = each.value
}

resource "azurerm_network_security_group" "NSGs" {
  for_each = {
    for key,value in var.landingzone_subnets : 
    key => key if key != "GatewaySubnet" && key != "AzureBastionSubnet"
  }
  name                = "${var.landingzone_NSG_Prefix}_${each.key}"
  location            = azurerm_resource_group.networking_rg.location
  resource_group_name = azurerm_resource_group.networking_rg.name
}
/*
resource "azurerm_subnet_network_security_group_association" "Associations" {
  for_each = {
    for key,value in var.landingzone_subnets : 
    key => key if key != "GatewaySubnet" && key != "AzureBastionSubnet"
  }
  subnet_id = azurerm_subnet.Subnets[each.key].id
  network_security_group_id = azurerm_network_security_group.NSGs[each.key].id
}
*/
/* Spoke Network resource code */

resource "azurerm_resource_group" "spoke_resource_group_name" {
  name     = var.spoke_resource_group_name
  location = var.location
}

resource "azurerm_virtual_network" "spoke_landingzone_vnet" {
  name                = var.spoke_landingzone_vnet_name
  location            = var.location
  resource_group_name = azurerm_resource_group.spoke_resource_group_name.name
  address_space       = var.spoke_landingzone_vnet_address_space
  dns_servers         = var.landingzone_vnet_dns_servers
  tags = var.landingzone_vnet_tags
}

resource "azurerm_subnet" "spoke_Subnets" {
  for_each = var.spoke_landingzone_subnets
  name                 = each.key
  resource_group_name  = azurerm_resource_group.spoke_resource_group_name.name
  virtual_network_name = azurerm_virtual_network.spoke_landingzone_vnet.name
  address_prefixes     = each.value
}

resource "azurerm_network_security_group" "spoke_NSGs" {
  for_each = {
    for key,value in var.landingzone_subnets : 
    key => key if key != "GatewaySubnet" && key != "AzureBastionSubnet"
  }
  name                = "${var.landingzone_NSG_Prefix}_${each.key}"
  location            = azurerm_resource_group.spoke_resource_group_name.location
  resource_group_name = azurerm_resource_group.spoke_resource_group_name.name
}

resource "azurerm_subnet_network_security_group_association" "Associations" {
  for_each = {
    for key,value in var.landingzone_subnets : 
    key => key if key != "GatewaySubnet" && key != "AzureBastionSubnet"
  }
  subnet_id = azurerm_subnet.Subnets[each.key].id
  network_security_group_id = azurerm_network_security_group.NSGs[each.key].id
}

resource "azurerm_route_table" "spoke_landingzone_rt" {
  name                          = var.lz_rt_name
  location                      = var.location
  resource_group_name           = azurerm_resource_group.spoke_resource_group_name.name
  disable_bgp_route_propagation = false
 
}

resource "azurerm_virtual_network_peering" "spoke_to_hub_peering" {
  name                      = format("%s-to-%s", azurerm_virtual_network.spoke_landingzone_vnet.name, azurerm_virtual_network.landingzone_vnet.name )
  resource_group_name       = azurerm_resource_group.spoke_resource_group_name.name
  virtual_network_name      = azurerm_virtual_network.spoke_landingzone_vnet.name
  remote_virtual_network_id = azurerm_virtual_network.landingzone_vnet.id
}

resource "azurerm_virtual_network_peering" "hub_to_spoke_peering" {
  name                      = format("%s-to-%s", azurerm_virtual_network.landingzone_vnet.name, azurerm_virtual_network.spoke_landingzone_vnet.name)
  resource_group_name       = azurerm_resource_group.networking_rg.name
  virtual_network_name      = azurerm_virtual_network.landingzone_vnet.name
  remote_virtual_network_id = azurerm_virtual_network.spoke_landingzone_vnet.id
}
