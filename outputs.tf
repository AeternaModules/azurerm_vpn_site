output "vpn_sites" {
  description = "All vpn_site resources"
  value       = azurerm_vpn_site.vpn_sites
}
output "vpn_sites_address_cidrs" {
  description = "List of address_cidrs values across all vpn_sites"
  value       = [for k, v in azurerm_vpn_site.vpn_sites : v.address_cidrs]
}
output "vpn_sites_device_model" {
  description = "List of device_model values across all vpn_sites"
  value       = [for k, v in azurerm_vpn_site.vpn_sites : v.device_model]
}
output "vpn_sites_device_vendor" {
  description = "List of device_vendor values across all vpn_sites"
  value       = [for k, v in azurerm_vpn_site.vpn_sites : v.device_vendor]
}
output "vpn_sites_link" {
  description = "List of link values across all vpn_sites"
  value       = [for k, v in azurerm_vpn_site.vpn_sites : v.link]
}
output "vpn_sites_location" {
  description = "List of location values across all vpn_sites"
  value       = [for k, v in azurerm_vpn_site.vpn_sites : v.location]
}
output "vpn_sites_name" {
  description = "List of name values across all vpn_sites"
  value       = [for k, v in azurerm_vpn_site.vpn_sites : v.name]
}
output "vpn_sites_o365_policy" {
  description = "List of o365_policy values across all vpn_sites"
  value       = [for k, v in azurerm_vpn_site.vpn_sites : v.o365_policy]
}
output "vpn_sites_resource_group_name" {
  description = "List of resource_group_name values across all vpn_sites"
  value       = [for k, v in azurerm_vpn_site.vpn_sites : v.resource_group_name]
}
output "vpn_sites_tags" {
  description = "List of tags values across all vpn_sites"
  value       = [for k, v in azurerm_vpn_site.vpn_sites : v.tags]
}
output "vpn_sites_virtual_wan_id" {
  description = "List of virtual_wan_id values across all vpn_sites"
  value       = [for k, v in azurerm_vpn_site.vpn_sites : v.virtual_wan_id]
}

