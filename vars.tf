variable resource_prefix {}
variable spoke_network_location {
    default = "centralus"
}
variable spoke_network_tags {
    default = null
}
variable spoke_network_address_space {}
variable spoke_network_dns {
    default = null
}
# should the spoke vnet be peered to the hub vnet? this seems obvious but who knows
variable peer_spoke_to_hub {
    default = false
}
# resource id of the virtual network to peer the spoke vnet to
variable hub_network_id {
    default = null
}

variable peer_allow_virtual_network_access {
    default = true
}
variable peer_allow_forwarded_traffic {
    default = true
}
variable peer_allow_gateway_transit {
    default = false
}
variable peer_use_remote_gateways {
    default = true
}

# If true, a default subnet will not be deployed
variable custom_subnet {
    default = false
}
# Enable this to add private link endpoints for existing services - if true, set subnet_enable_private_service to false
variable subnet_enable_private_endpoint {
    default = false
}
# Enable this to publish a private link service on this subnet
variable subnet_enable_private_service {
    default = false
}
# Enable service endpoints on the subnet
## Options - Microsoft.AzureActiveDirectory, Microsoft.AzureCosmosDB, Microsoft.ContainerRegistry, Microsoft.EventHub, Microsoft.KeyVault, Microsoft.ServiceBus, Microsoft.Sql, Microsoft.Storage, Microsoft.Web
variable subnet_service_endpoints {
    default = null
}