provider "azure" {
    version = ""
    features {}  
}

resource "azurerm_resource_group" "hub_network" {
    name     = "hub"
    location = "West Europe"
}
