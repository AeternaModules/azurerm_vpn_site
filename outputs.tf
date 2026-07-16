output "vpn_sites_id" {
  description = "Map of id values across all vpn_sites, keyed the same as var.vpn_sites"
  value       = { for k, v in azurerm_vpn_site.vpn_sites : k => v.id if v.id != null && length(v.id) > 0 }
}
output "vpn_sites_address_cidrs" {
  description = "Map of address_cidrs values across all vpn_sites, keyed the same as var.vpn_sites"
  value       = { for k, v in azurerm_vpn_site.vpn_sites : k => v.address_cidrs if v.address_cidrs != null && length(v.address_cidrs) > 0 }
}
output "vpn_sites_device_model" {
  description = "Map of device_model values across all vpn_sites, keyed the same as var.vpn_sites"
  value       = { for k, v in azurerm_vpn_site.vpn_sites : k => v.device_model if v.device_model != null && length(v.device_model) > 0 }
}
output "vpn_sites_device_vendor" {
  description = "Map of device_vendor values across all vpn_sites, keyed the same as var.vpn_sites"
  value       = { for k, v in azurerm_vpn_site.vpn_sites : k => v.device_vendor if v.device_vendor != null && length(v.device_vendor) > 0 }
}
output "vpn_sites_link" {
  description = "Map of link values across all vpn_sites, keyed the same as var.vpn_sites"
  value       = { for k, v in azurerm_vpn_site.vpn_sites : k => v.link if v.link != null && length(v.link) > 0 }
}
output "vpn_sites_location" {
  description = "Map of location values across all vpn_sites, keyed the same as var.vpn_sites"
  value       = { for k, v in azurerm_vpn_site.vpn_sites : k => v.location if v.location != null && length(v.location) > 0 }
}
output "vpn_sites_name" {
  description = "Map of name values across all vpn_sites, keyed the same as var.vpn_sites"
  value       = { for k, v in azurerm_vpn_site.vpn_sites : k => v.name if v.name != null && length(v.name) > 0 }
}
output "vpn_sites_o365_policy" {
  description = "Map of o365_policy values across all vpn_sites, keyed the same as var.vpn_sites"
  value       = { for k, v in azurerm_vpn_site.vpn_sites : k => v.o365_policy if v.o365_policy != null && length(v.o365_policy) > 0 }
}
output "vpn_sites_resource_group_name" {
  description = "Map of resource_group_name values across all vpn_sites, keyed the same as var.vpn_sites"
  value       = { for k, v in azurerm_vpn_site.vpn_sites : k => v.resource_group_name if v.resource_group_name != null && length(v.resource_group_name) > 0 }
}
output "vpn_sites_tags" {
  description = "Map of tags values across all vpn_sites, keyed the same as var.vpn_sites"
  value       = { for k, v in azurerm_vpn_site.vpn_sites : k => v.tags if v.tags != null && length(v.tags) > 0 }
}
output "vpn_sites_virtual_wan_id" {
  description = "Map of virtual_wan_id values across all vpn_sites, keyed the same as var.vpn_sites"
  value       = { for k, v in azurerm_vpn_site.vpn_sites : k => v.virtual_wan_id if v.virtual_wan_id != null && length(v.virtual_wan_id) > 0 }
}

