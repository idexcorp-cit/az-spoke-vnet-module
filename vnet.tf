resource "azurerm_virtual_network" "spoke" {
    name                = "${var.resource_prefix}-spoke-vnet"
    resource_group_name = azurerm_resource_group.spoke.name
    location            = azurerm_resource_group.spoke.location

    address_space       = var.spoke_network_address_space

    dns_servers         = var.spoke_network_dns != null ? var.spoke_network_dns : []

    tags = var.spoke_network_tags != null ? var.spoke_network_tags : null
}

output "vnet_id" {
    value = azurerm_virtual_network.spoke.id
}

output "vnet_name" {
    value = azurerm_virtual_network.spoke.name
}