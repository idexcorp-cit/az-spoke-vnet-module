terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      # Update this periodically especially to get newer features but beware of breakage :-0
      version = "2.87.0"
    }
  }
}

# Required - make sure features is here or else breakage...
provider "azurerm" {
    features {}
}