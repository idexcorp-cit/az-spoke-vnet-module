# Azure Spoke vNET Terraform Module
This Terraform module is designed to be used with Terragrunt for deploying multiple spokes. This module should create the following resources:
- Resource Group
- vNET
    - Subnet if `custom_subnet` isn't specified or is `false`.
- vNET peering if `peer_spoke_to_hub` is `true`.

```hcl
module "spoke_vnet" {
    source = "git::https://github.com/idexcorp-cit/az-spoke-vnet-module.git?ref=<version tag>"

    resource_prefix             = "cus-acct-network"
    spoke_network_location      = "centralus"
    spoke_network_address_space = ["10.0.1.0/24"]
    peer_spoke_to_hub           = true
    hub_network_id              = "/subscriptions/<subscriptionId>/resourceGroups/<resourceGroupName>/providers/Microsoft.Network/virtualNetworks/<virtualNetworkName>"

    subnet_service_endpoints    = ["Microsoft.Storage"]
}
```

## Outputs
- `vnet_id`: ID of the vNET created by the module.
- `vnet_name`: Name of the vNET created by the module.
- `subnet_id`: ID of the subnet created by the module if the default subnet is created.
- `rg_id`: ID of the resource group created by the module.
- `rg_name`: Name of the resource group created by the module.