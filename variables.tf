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
  # --- Unconfirmed validation candidates, derived from azurerm_vpn_site's provider source ---
  # Not auto-enabled: either a bespoke provider validator we can't safely translate,
  # or a path that crosses a list-typed block (needs its own for_each wrapping).
  # Review, translate into a real validation{} block above, and delete once confirmed.
  # path: name
  #   source:    validate.VpnSiteName: no recognizable `if ... { errors = append(...) }` pattern - read it by hand
  # path: resource_group_name
  #   condition: length(value) <= 90
  #   message:   [from resourcegroups.ValidateName: invalid when len(value) > 90]
  #   source:    [from resourcegroups.ValidateName: invalid when len(value) > 90]
  # path: resource_group_name
  #   condition: !endswith(value, ".")
  #   message:   [from resourcegroups.ValidateName: must not end with "."]
  #   source:    [from resourcegroups.ValidateName: must not end with "."]
  # path: resource_group_name
  #   condition: length(value) != 0
  #   message:   [from resourcegroups.ValidateName: invalid when len(value) == 0]
  #   source:    [from resourcegroups.ValidateName: invalid when len(value) == 0]
  # path: resource_group_name
  #   source:    [from resourcegroups.ValidateName] !matched
  # path: location
  #   source:    location.EnhancedValidate: no recognizable `if ... { errors = append(...) }` pattern - read it by hand
  # path: virtual_wan_id
  #   source:    [from virtualwans.ValidateVirtualWANID] !ok
  # path: virtual_wan_id
  #   source:    [from virtualwans.ValidateVirtualWANID] err != nil
  # path: address_cidrs[*]
  #   source:    validation.IsCIDR(...) - no translation rule yet, add one
  # path: device_vendor
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: device_model
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: link.name
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: link.provider_name
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: link.speed_in_mbps
  #   condition: value >= 0
  #   message:   must be at least 0
  # path: link.ip_address
  #   source:    validation.IsIPAddress(...) - no translation rule yet, add one
  # path: link.fqdn
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: link.bgp.asn
  #   condition: value >= 1
  #   message:   must be at least 1
  # path: link.bgp.peering_address
  #   source:    validation.IsIPAddress(...) - no translation rule yet, add one
  # path: tags
  #   condition: length(value) <= 50
  #   message:   [from tags.Validate: invalid when len(value) > 50]
  #   source:    [from tags.Validate: invalid when len(value) > 50]
  # path: tags
  #   condition: length(value) <= 512
  #   message:   [from tags.Validate: invalid when len(value) > 512]
  #   source:    [from tags.Validate: invalid when len(value) > 512]
  # path: tags
  #   source:    [from tags.Validate] err != nil
  # path: tags
  #   condition: length(value) <= 256
  #   message:   [from tags.Validate: invalid when len(value) > 256]
  #   source:    [from tags.Validate: invalid when len(value) > 256]
}

