resource "azurerm_monitor_diagnostic_setting" "sub_diag" {
  count                      = var.resource_type == "sub" ? 1 : 0
  name                       = "subscription_securityLogs"
  log_analytics_workspace_id = var.diag_log_analytics_id
  target_resource_id         = var.resource_id

  # Activity Log categories. Subscription settings take explicit categories, not category groups.
  enabled_log {
    category = "Administrative"
  }
  enabled_log {
    category = "Alert"
  }
  enabled_log {
    category = "Autoscale"
  }
  enabled_log {
    category = "Policy"
  }
  enabled_log {
    category = "Recommendation"
  }
  enabled_log {
    category = "ResourceHealth"
  }
  enabled_log {
    category = "Security"
  }
  enabled_log {
    category = "ServiceHealth"
  }
}
