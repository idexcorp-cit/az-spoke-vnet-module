resource "azurerm_resource_group" "spoke" {
    name        = "${var.resource_prefix}-spoke-rg"
    location    = var.spoke_network_location

    tags = var.spoke_network_tags != null ? var.spoke_network_tags : null
}

output "rg_id" {
    value = azurerm_resource_group.spoke.id
}

output "rg_name" {
    value = azurerm_resource_group.spoke.name
}