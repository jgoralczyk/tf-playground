resource "azurerm_resource_group" "siec" {
  name     = "rg-warstwa-sieciowa"
  location = "westeurope"
}


resource "azurerm_virtual_network" "siec" {
  name                = "vnet-core"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.siec.location
  resource_group_name = azurerm_resource_group.siec.name
}

resource "azurerm_subnet" "siec" {
  name                 = "snet-aplikacje"
  resource_group_name  = azurerm_resource_group.siec.name
  virtual_network_name = azurerm_virtual_network.siec.name
  address_prefixes     = ["10.0.1.0/24"]
}
