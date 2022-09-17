resource "azurerm_resource_group" "resource_group" {
  count    = var.create_resource_group ? 1 : 0
  name     = var.resource_group_name
  location = var.location_name
  tags     = var.tags
}

data "azurerm_resource_group" "resource_group" {
  count = var.create_resource_group ? 0 : 1
  name  = var.resource_group_name
}

resource "azurerm_container_registry" "registry" {
  name                          = var.registry_name
  resource_group_name           = azurerm_resource_group.resource_group[0].name
  location                      = azurerm_resource_group.resource_group[0].location
  sku                           = var.sku
  admin_enabled                 = var.enable_admin
  public_network_access_enabled = var.enable_public_access
  network_rule_bypass_option    = var.network_bypass
  quarantine_policy_enabled     = var.enable_quarantine_policy
  export_policy_enabled         = var.enable_export_policy
  zone_redundancy_enabled       = var.enable_zone_redundancy
  data_endpoint_enabled         = var.enable_data_endpoint
  anonymous_pull_enabled        = var.enable_anonymous_pull
  tags                          = var.tags

  dynamic "retention_policy" {
    for_each = toset(var.retention_policy == null ? [] : [""])
    content {
      days    = var.retention_policy.days
      enabled = var.retention_policy.enabled
    }
  }
  dynamic "trust_policy" {
    for_each = toset(var.enable_trust_policy == null ? [] : [""])
    content {
      enabled = var.enable_trust_policy
    }
  }

  dynamic "georeplications" {
    for_each = (var.sku == "Premium" ? var.replicas : {})
    iterator = geozone
    content {
      location                  = geozone.key
      zone_redundancy_enabled   = geozone.value.enable_zone_redundancy
      regional_endpoint_enabled = geozone.value.enable_regional_endpoint
      tags                      = var.tags
    }
  }

  dynamic "identity" {
    for_each = toset(local._identity_type == null ? [] : [""])
    content {
      type         = local._identity_type
      identity_ids = var.identity_list
    }
  }
}
