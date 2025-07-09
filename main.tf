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
  subscription_id = var.subscription_id
}

# No default means that we will be prompted for it? or supply with .tfvars? or supply with ENV variable input?
variable "prefix" {}

variable "region" {
  type        = string
  default     = "UK South"
  description = "The Azure region to deploy resources"
  validation {
    condition     = contains(["UK South", "UK West", "North Europe", "West Europe", "East US", "West US"], var.region)
    error_message = "Invalid region"
  }
}

# No default means that we will be prompted for it? or supply with .tfvars? or supply with ENV variable input?
variable "tags" {
  type        = map(any)
  description = "A map of tags"
}

resource "azurerm_resource_group" "contoso_rg" {
  name     = "${var.prefix}_rg"
  location = var.region
  tags     = var.tags
}

resource "azurerm_resource_group" "contoso_dev_rg" {
  name     = "${var.prefix}_dev_rg"
  location = var.region
  tags     = var.tags
}