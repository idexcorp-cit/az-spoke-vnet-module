module "spoke_vnet" {
    source = "../"

    resource_prefix             = "cus-network"
    spoke_network_location      = "centralus"
    spoke_network_address_space = ["10.0.1.0/24"]
    peer_spoke_to_hub           = true
    hub_network_id              = azurerm_virtual_network.hub.id
    peer_use_remote_gateways    = false

    subnet_service_endpoints    = ["Microsoft.Storage"]

    route_table                 = true
    routes = {
        route1 = {
            name            = "default"
            address_prefix  = "0.0.0.0/0"
            hop_type        = "Internet"
        }
    }
}