output "vpn_sites_address_cidrs" {
  description = "Map of address_cidrs values across all vpn_sites, keyed the same as var.vpn_sites"
  value       = { for k, v in azurerm_vpn_site.vpn_sites : k => v.address_cidrs }
}
output "vpn_sites_device_model" {
  description = "Map of device_model values across all vpn_sites, keyed the same as var.vpn_sites"
  value       = { for k, v in azurerm_vpn_site.vpn_sites : k => v.device_model }
}
output "vpn_sites_device_vendor" {
  description = "Map of device_vendor values across all vpn_sites, keyed the same as var.vpn_sites"
  value       = { for k, v in azurerm_vpn_site.vpn_sites : k => v.device_vendor }
}
output "vpn_sites_link" {
  description = "Map of link values across all vpn_sites, keyed the same as var.vpn_sites"
  value       = { for k, v in azurerm_vpn_site.vpn_sites : k => v.link }
}
output "vpn_sites_location" {
  description = "Map of location values across all vpn_sites, keyed the same as var.vpn_sites"
  value       = { for k, v in azurerm_vpn_site.vpn_sites : k => v.location }
}
output "vpn_sites_name" {
  description = "Map of name values across all vpn_sites, keyed the same as var.vpn_sites"
  value       = { for k, v in azurerm_vpn_site.vpn_sites : k => v.name }
}
output "vpn_sites_o365_policy" {
  description = "Map of o365_policy values across all vpn_sites, keyed the same as var.vpn_sites"
  value       = { for k, v in azurerm_vpn_site.vpn_sites : k => v.o365_policy }
}
output "vpn_sites_resource_group_name" {
  description = "Map of resource_group_name values across all vpn_sites, keyed the same as var.vpn_sites"
  value       = { for k, v in azurerm_vpn_site.vpn_sites : k => v.resource_group_name }
}
output "vpn_sites_tags" {
  description = "Map of tags values across all vpn_sites, keyed the same as var.vpn_sites"
  value       = { for k, v in azurerm_vpn_site.vpn_sites : k => v.tags }
}
output "vpn_sites_virtual_wan_id" {
  description = "Map of virtual_wan_id values across all vpn_sites, keyed the same as var.vpn_sites"
  value       = { for k, v in azurerm_vpn_site.vpn_sites : k => v.virtual_wan_id }
}

