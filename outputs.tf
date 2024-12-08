output "storage_account_id" {
  description = "The ID of the storage account."
  value       = azurerm_storage_account.sta.id
}

output "storage_account_name" {
  description = "The name of the resource group"
  value       = azurerm_storage_account.sta.name
}
