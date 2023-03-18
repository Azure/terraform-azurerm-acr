output "name" {
  description = "ACR resource name."
  value       = azurerm_container_registry.acr.name
}

output "rg_name" {
  description = "Resource Group name."
  value       = data.azurerm_resource_group.rg.name
}

output "id" {
  description = "ACR resource ID."
  value       = azurerm_container_registry.acr.id
}

output "login_server" {
  description = "The URL that can be used to log into the container registry."
  value       = azurerm_container_registry.acr.login_server
}

output "admin_username" {
  description = <<EOT
The Username associated with the Container Registry Admin
account - if the admin account is enabled.
EOT
  value       = azurerm_container_registry.acr.admin_enabled ? azurerm_container_registry.acr.admin_username : ""
}

output "admin_password" {
  description = <<EOT
The Password associated with the Container Registry Admin
account - if the admin account is enabled.
EOT
  value       = azurerm_container_registry.acr.admin_enabled ? azurerm_container_registry.acr.admin_password : ""
}
