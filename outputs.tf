output "resource_groups" {
  value = { for key, value in azurerm_resource_group.demo : key => value.id }
  description = "resource group ids"
}