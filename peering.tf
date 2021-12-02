resource "azurerm_virtual_network_peering" "spoke" {
    for_each    = var.peer_spoke_to_hub == true ? toset(["peer"]) : []

    name                        = "${var.resource_prefix}-spoke-hub"
    resource_group_name         = azurerm_resource_group.spoke.name
    virtual_network_name        = azurerm_virtual_network.spoke.name
    remote_virtual_network_id   = var.hub_network_id

    allow_virtual_network_access    = var.peer_allow_virtual_network_access
    allow_forwarded_traffic         = var.peer_allow_forwarded_traffic
    allow_gateway_transit           = var.peer_allow_gateway_transit
    use_remote_gateways             = var.peer_use_remote_gateways
}