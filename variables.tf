variable "csp" {
  description = "The name of cloud service provider."
  type        = string
  default     = "az"
}

variable "service" {
  description = "The name of the provissioned service."
  type        = string
  default     = "sta"
}

variable "company" {
  description = "The company that own the service."
  type        = string
}

variable "project" {
  description = "The name of the project."
  type        = string
}

variable "environment" {
  description = "Environment"
  type        = string
}

variable "running_number" {
  description = "The running number of the service."
  type        = string
}

variable "location" {
  description = "The Azure Region where the Resource Group should exist."
  type        = string
}

variable "resource_group_name" {
  description = "(Required) The name of the resource group in which to create the storage account. Changing this forces a new resource to be created."
  type        = string
}

variable "account_kind" {
  description = "(Optional) Defines the Kind of account. Valid options are BlobStorage, BlockBlobStorage, FileStorage, Storage and StorageV2. Defaults to StorageV2."
  type        = string
  default     = "StorageV2"
}

variable "account_tier" {
  description = "(Required) Defines the Tier to use for this storage account. Valid options are Standard and Premium. For BlockBlobStorage and FileStorage accounts only Premium is valid. Changing this forces a new resource to be created."
  type        = string
}

variable "account_replication_type" {
  description = "(Required) Defines the type of replication to use for this storage account. Valid options are LRS, GRS, RAGRS, ZRS, GZRS and RAGZRS. Changing this forces a new resource to be created when types LRS, GRS and RAGRS are changed to ZRS, GZRS or RAGZRS and vice versa."
  type        = string
}

variable "cross_tenant_replication_enabled" {
  description = "(Optional) Should cross Tenant replication be enabled? Defaults to false."
  type        = string
  default     = false
}

variable "shared_access_key_enabled" {
  description = "(Optional) Indicates whether the storage account permits requests to be authorized with the account access key via Shared Key. If false, then all requests, including shared access signatures, must be authorized with Azure Active Directory (Azure AD). Defaults to true."
  type        = string
  default     = "true"
}

variable "public_network_access_enabled" {
  description = "(Optional) Whether the public network access is enabled? Defaults to true."
  type        = string
  default     = "true"
}

variable "default_to_oauth_authentication" {
  description = "(Optional) Default to Azure Active Directory authorization in the Azure portal when accessing the Storage Account. The default value is false."
  type        = string
  default     = "false"
}

variable "is_hns_enabled" {
  description = "(Optional) Is Hierarchical Namespace enabled? This can be used with Azure Data Lake Storage Gen 2. Changing this forces a new resource to be created."
  type        = string
}

variable "is_customer_managed_key_enabled" {
  description = "(Optional) This can be set to true if it requirs cmk. *This value is not default argument.*"
  type        = bool
  default     = false
}

variable "key_name" {
  description = "(Required) The name of Key Vault Key."
  type        = string
  default     = null
}

variable "key_vault_id" {
  description = "(Optional) The ID of the Key Vault. Exactly one of managed_hsm_key_id, key_vault_id, or key_vault_uri must be specified."
  type        = string
  default     = null
}

variable "is_network_rules_enabled" {
  description = "(Optional) This can be set to true if it requirs network rules. *This value is not default argument.*"
  type        = bool
  default     = false
}

variable "default_action" {
  description = "(Optional) Specifies the default action of allow or deny when no other rules match. Valid options are Deny or Allow. However, it will be required when network_rules is true."
  type        = string
}

variable "bypass" {
  description = "(Optional) Specifies whether traffic is bypassed for Logging/Metrics/AzureServices. Valid options are any combination of Logging, Metrics, AzureServices, or None. Defaults to ['AzureServices']."
  type        = list(string)
}

variable "ip_rules" {
  description = "(Optional) List of public IP or IP ranges in CIDR Format. Only IPv4 addresses are allowed. Private IP address ranges (as defined in RFC 1918) are not allowed."
  type        = list(string)
}

variable "virtual_network_subnet_ids" {
  description = "(Optional) A list of virtual network subnet ids to secure the storage account."
  type        = list(string)
}

variable "infrastructure_encryption_enabled" {
  description = "(Optional) Is infrastructure encryption enabled? Changing this forces a new resource to be created. Defaults to false."
  type        = string
  default     = "false"
}
