data "azurerm_resource_group" "hub" {
  name = var.resource_group_name
}

resource "azurerm_virtual_network" "hub" {
  name                = format("%s-hub-vnet", var.name)
  address_space       = [var.cidr_block]
  location            = data.azurerm_resource_group.hub.location
  resource_group_name = data.azurerm_resource_group.hub.name
}

resource "azurerm_subnet" "hub" {
  name                 = format("%s-hub-snet", var.name)
  virtual_network_name = azurerm_subnet.virtual_network.hub.name
  address_prefixes     = [cidrsubnets(var.cidr_block, 8, 8, 8)]
}

resource "azurerm_virtual_wan" "hub" {
  name                = format("%s-hub-wan", var.name)
  resource_group_name = data.azurerm_resource_group.hub.name
  location            = data.azurerm_resource_group.hub.location
}

resource "azurerm_virtual_hub" "hub" {
  name                = format("%s-hub-vhub", var.name)
  resource_group_name = data.azurerm_resource_group.hub.name
  location            = data.azurerm_resource_group.hub.location
  virtual_wan_id      = azurerm_virtual_wan.hub.id
  address_prefix      = "10.0.1.0/24"
}

resource "azurerm_vpn_gateway" "hub" {
  name                = format("%s-hub-vpngw", var.name)
  location            = data.azurerm_resource_group.hub.location
  resource_group_name = data.azurerm_resource_group.hub.name
  virtual_hub_id      = azurerm_virtual_hub.id
}
