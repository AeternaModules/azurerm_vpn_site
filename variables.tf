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
    link = optional(list(object({
      bgp = optional(object({
        asn             = number
        peering_address = string
      }))
      fqdn          = optional(string)
      ip_address    = optional(string)
      name          = string
      provider_name = optional(string)
      speed_in_mbps = optional(number)
    })))
    o365_policy = optional(object({
      traffic_category = optional(object({
        allow_endpoint_enabled    = optional(bool)
        default_endpoint_enabled  = optional(bool)
        optimize_endpoint_enabled = optional(bool)
      }))
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.vpn_sites : (
        length(v.resource_group_name) <= 90
      )
    ])
    error_message = "[from resourcegroups.ValidateName: invalid when len(value) > 90]"
  }
  validation {
    condition = alltrue([
      for k, v in var.vpn_sites : (
        !endswith(v.resource_group_name, ".")
      )
    ])
    error_message = "[from resourcegroups.ValidateName: must not end with \".\"]"
  }
  validation {
    condition = alltrue([
      for k, v in var.vpn_sites : (
        length(v.resource_group_name) != 0
      )
    ])
    error_message = "[from resourcegroups.ValidateName: invalid when len(value) == 0]"
  }
  validation {
    condition = alltrue([
      for k, v in var.vpn_sites : (
        v.device_vendor == null || (length(v.device_vendor) > 0)
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.vpn_sites : (
        v.device_model == null || (length(v.device_model) > 0)
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.vpn_sites : (
        v.link == null || alltrue([for item in v.link : (length(item.name) > 0)])
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.vpn_sites : (
        v.link == null || alltrue([for item in v.link : (item.provider_name == null || (length(item.provider_name) > 0))])
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.vpn_sites : (
        v.link == null || alltrue([for item in v.link : (item.speed_in_mbps == null || (item.speed_in_mbps >= 0))])
      )
    ])
    error_message = "must be at least 0"
  }
  validation {
    condition = alltrue([
      for k, v in var.vpn_sites : (
        v.link == null || alltrue([for item in v.link : (item.fqdn == null || (length(item.fqdn) > 0))])
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.vpn_sites : (
        v.link == null || alltrue([for item in v.link : (item.bgp == null || (item.bgp.asn >= 1))])
      )
    ])
    error_message = "must be at least 1"
  }
  validation {
    condition = alltrue([
      for k, v in var.vpn_sites : (
        v.tags == null || (length(v.tags) <= 50)
      )
    ])
    error_message = "[from tags.Validate: invalid when len(value) > 50]"
  }
  # Note: 11 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

