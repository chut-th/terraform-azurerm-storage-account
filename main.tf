terraform {
  required_version = "1.12.2"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.35.0"
    }
  }
}

locals {
  name = "${var.csp}${var.service}${var.company}${var.project}${var.environment}${var.running_number}"
}

resource "azurerm_storage_account" "sta" {
  name                     = local.name
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = var.account_tier
  account_replication_type = var.account_replication_type
}
