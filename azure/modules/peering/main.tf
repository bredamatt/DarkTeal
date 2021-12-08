data "azurerm_resource_group" "this" {
  name = var.resource_group_name
}

resource "azurerm_virtual_network_peering" "hub-to-spoke" {
  name                      = format("%s-to-%s", var.hub_network_name, var.spoke_network_name)
  resource_group_name       = data.azurerm_resource_group.this.name
  virtual_network_name      = var.hub_network_name
  remote_virtual_network_id = var.spoke_network_id
}

resource "azurerm_virtual_network_peering" "spoke-to-hub" {
  name                      = format("%s-to-%s", var.spoke_network_name, var.hub_network_name)
  resource_group_name       = data.azurerm_resource_group.this.name
  virtual_network_name      = var.spoke_network_name
  remote_virtual_network_id = var.hub_network_id
}