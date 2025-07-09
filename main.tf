terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
  }
}

provider "azurerm" {
  features {}
  resource_provider_registrations = "core"
  subscription_id                 = var.subscription_id
}

resource "azurerm_resource_group" "demo" {
  for_each = var.resource_groups

  name = "${var.prefix}_${each.value}"
  location = var.region
  tags = var.tags
}
