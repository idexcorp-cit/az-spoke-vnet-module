resource "azurerm_route_table" "spoke" {
    for_each    = var.routes != false ? toset(["spoke"]) : []

    name                    = "${var.resource_prefix}-spoke-vnet"
    resource_group_name     = azurerm_resource_group.spoke.name
    location                = azurerm_resource_group.spoke.location

    tags = var.spoke_network_tags != null ? var.spoke_network_tags : null
}

resource "azurerm_route" "routes" {
    for_each    = var.routes

    name                    = each.value["name"]
    address_prefix          = each.value["address_prefix"]
    next_hop_type           = each.value["hop_type"]
    next_hop_in_ip_address  = each.value["hop_type"] == "VirtualAppliance" ? each.value["hop_ip"] : null

    resource_group_name     = azurerm_resource_group.spoke.name
    route_table_name        = azurerm_route_table.spoke["spoke"].name
}

resource "azurerm_subnet_route_table_association" "spoke" {
    for_each = var.route_table != false && var.custom_subnet == false ? toset(["spoke"]) : []

    subnet_id       = azurerm_subnet.default["spoke"].id
    route_table_id  = azurerm_route_table.spoke["spoke"].id
}

output "route_table_id" {
    value       = var.route_table != false ? azurerm_route_table.spoke["spoke"].id : null
}