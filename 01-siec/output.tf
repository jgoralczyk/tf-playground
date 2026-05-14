output "resource_group_name" {
  value       = azurerm_resource_group.siec.name
  description = "Nazwa grupy zasobów"
}

output "subnet_id" {
  value       = azurerm_subnet.siec.id
  description = "ID podsieci"
}
