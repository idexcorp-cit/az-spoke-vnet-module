resource "azurerm_subnet" "default" {
    for_each    = var.custom_subnet == false ? toset(["spoke"]) : []

    name                    = "spoke-subnet"
    resource_group_name     = azurerm_resource_group.spoke.name
    virtual_network_name    = azurerm_virtual_network.spoke.name

    address_prefixes        = var.spoke_network_address_space

    enforce_private_link_endpoint_network_policies  = var.subnet_enable_private_endpoint
    enforce_private_link_service_network_policies   = var.subnet_enable_private_service

    service_endpoints = var.subnet_service_endpoints != null ? var.subnet_service_endpoints : null
}

output "subnet_id" {
    value       = var.custom_subnet == false ? azurerm_subnet.default["spoke"].id : null
}