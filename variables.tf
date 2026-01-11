variable "vpn_sites" {
  description = <<EOT
Map of vpn_sites, attributes below
Required:
    - location
    - name
    - resource_group_name
    - virtual_wan_id
Optional:
    - address_cidrs
    - device_model
    - device_vendor
    - tags
    - link (block):
        - bgp (optional, block):
            - asn (required)
            - peering_address (required)
        - fqdn (optional)
        - ip_address (optional)
        - name (required)
        - provider_name (optional)
        - speed_in_mbps (optional)
    - o365_policy (block):
        - traffic_category (optional, block):
            - allow_endpoint_enabled (optional)
            - default_endpoint_enabled (optional)
            - optimize_endpoint_enabled (optional)
EOT

  type = map(object({
    location            = string
    name                = string
    resource_group_name = string
    virtual_wan_id      = string
    address_cidrs       = optional(set(string))
    device_model        = optional(string)
    device_vendor       = optional(string)
    tags                = optional(map(string))
    link = optional(object({
      bgp = optional(object({
        asn             = number
        peering_address = string
      }))
      fqdn          = optional(string)
      ip_address    = optional(string)
      name          = string
      provider_name = optional(string)
      speed_in_mbps = optional(number, 0)
    }))
    o365_policy = optional(object({
      traffic_category = optional(object({
        allow_endpoint_enabled    = optional(bool, false)
        default_endpoint_enabled  = optional(bool, false)
        optimize_endpoint_enabled = optional(bool, false)
      }))
    }))
  }))
}

