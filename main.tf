terraform {
  required_version = "~> 1.12.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.35.0"
    }
  }
}

locals {
  name = "${var.csp}${var.service}${var.company}${var.project}${var.environment}${var.running_number}"
}

resource "azurerm_storage_account" "sta" {
  name                              = local.name
  resource_group_name               = var.resource_group_name
  location                          = var.location
  account_kind                      = var.account_kind # Optional, default: StorageV2
  account_tier                      = var.account_tier
  account_replication_type          = var.account_replication_type
  cross_tenant_replication_enabled  = var.cross_tenant_replication_enabled  # Optional, default: false
  shared_access_key_enabled         = var.shared_access_key_enabled         # Optional, default: true
  public_network_access_enabled     = var.public_network_access_enabled     # Optional, default: true
  default_to_oauth_authentication   = var.default_to_oauth_authentication   # Optional, default: false
  is_hns_enabled                    = var.is_hns_enabled                    # Optional, default: false
  infrastructure_encryption_enabled = var.infrastructure_encryption_enabled # Optional, default: false
}

resource "azurerm_storage_account_customer_managed_key" "cmk" {
  count              = var.is_customer_managed_key_enabled ? 1 : 0
  storage_account_id = azurerm_storage_account.sta.id
  key_name           = var.key_name
  key_vault_id       = var.key_vault_id
}

resource "azurerm_storage_account_network_rules" "nwr" {
  count                      = var.is_network_rules_enabled ? 1 : 0
  storage_account_id         = azurerm_storage_account.sta.id
  default_action             = var.default_action
  bypass                     = var.bypass # Optional, default: ['AzureServices'] 
  ip_rules                   = var.ip_rules
  virtual_network_subnet_ids = var.virtual_network_subnet_ids
}
