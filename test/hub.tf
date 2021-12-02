resource "azurerm_resource_group" "hub" {
    name                = "cus-network-hub-rg"
    location            = "centralus"
}

resource "azurerm_virtual_network" "hub" {
    name                = "cus-network-hub-vnet"
    resource_group_name = azurerm_resource_group.hub.name
    location            = azurerm_resource_group.hub.location

    address_space       = ["10.0.0.0/24"]
}

resource "azurerm_virtual_network_peering" "hub" {
    name                        = "cus-network-hub-spoke"
    resource_group_name         = azurerm_resource_group.hub.name
    virtual_network_name        = azurerm_virtual_network.hub.name
    remote_virtual_network_id   = module.spoke_vnet.vnet_id

    allow_virtual_network_access    = true
    allow_forwarded_traffic         = true
    allow_gateway_transit           = true
    use_remote_gateways             = false
}