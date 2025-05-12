resource "azurerm_cdn_frontdoor_profile" "frontdoor" {
  name                = var.cdn_profile_name
  resource_group_name = var.resource_group_name
  sku_name            = var.cdn_sku_name
  tags                = var.tags
}

resource "azurerm_cdn_frontdoor_endpoint" "frontdoor_endpoint" {
  name                     = var.frontdoor_endpoint_name
  cdn_frontdoor_profile_id = azurerm_cdn_frontdoor_profile.frontdoor.id
  tags                     = var.tags
}

resource "azurerm_cdn_frontdoor_origin_group" "frontdoor_origin_group" {
  name                     = var.frontdoor_origin_group_name
  cdn_frontdoor_profile_id = azurerm_cdn_frontdoor_profile.frontdoor.id
  session_affinity_enabled = true

  restore_traffic_time_to_healed_or_new_endpoint_in_minutes = 10

  health_probe {
    interval_in_seconds = 120
    path                = "/"
    protocol            = "Https"
    request_type        = "GET"
  }

  load_balancing {
    additional_latency_in_milliseconds = 0
    sample_size                        = 4
    successful_samples_required        = 2
  }
}

resource "azurerm_cdn_frontdoor_origin" "frontdoor_origin" {
  name                           = var.frontdoor_origin_name
  cdn_frontdoor_origin_group_id  = azurerm_cdn_frontdoor_origin_group.frontdoor_origin_group.id
  enabled                        = true
  certificate_name_check_enabled = false

  # Provide your existing storage account's static website endpoint
  host_name          = replace(var.storage_static_website_url, "https://", "")
  http_port          = 80
  https_port         = 443
  origin_host_header = var.storage_primary_web_host
  priority           = 1
  weight             = 1000

}

resource "azurerm_cdn_frontdoor_rule_set" "frontdoor_rule_set" {
  name                     = var.frontdoor_rule_set_name
  cdn_frontdoor_profile_id = azurerm_cdn_frontdoor_profile.frontdoor.id
}

/* resource "azurerm_cdn_frontdoor_rule" "example" {
  for_each                  = var.frontdoor_rules
  name                      = each.value.rule_name
  cdn_frontdoor_rule_set_id = azurerm_cdn_frontdoor_rule_set.frontdoor_rule_set.id
  order                     = each.value.order
  actions {

  }
  conditions {

  }
} */

resource "azurerm_cdn_frontdoor_route" "webapp_route" {
  name                          = var.frontdoor_route_name
  cdn_frontdoor_endpoint_id     = azurerm_cdn_frontdoor_endpoint.frontdoor_endpoint.id
  cdn_frontdoor_origin_group_id = azurerm_cdn_frontdoor_origin_group.frontdoor_origin_group.id
  cdn_frontdoor_origin_ids      = [azurerm_cdn_frontdoor_origin.frontdoor_origin.id]
  cdn_frontdoor_rule_set_ids    = []
  enabled                       = true
  forwarding_protocol           = "HttpsOnly"
  patterns_to_match             = var.patterns_to_match
  cdn_frontdoor_origin_path     = var.cdn_frontdoor_origin_path
  supported_protocols           = ["Http", "Https"]
}
