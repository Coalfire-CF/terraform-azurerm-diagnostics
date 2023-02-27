resource "azurerm_monitor_diagnostic_setting" "sub_diag" {
  count                      = var.resource_type == "sub" ? 1 : 0
  name                       = "subscription_securityLogs"
  log_analytics_workspace_id = var.diag_log_analytics_id
  target_resource_id         = var.resource_id

  # Can't have retention block for subscription diag settings. 
  # If you add the retention block, Azure will remove it in the background creating an update with every terraform plan/apply
  enabled_log {
    category = "Administrative"
    enabled  = true
  }
  enabled_log {
    category = "Alert"
    enabled  = true
  }
  enabled_log {
    category = "Autoscale"
    enabled  = false # Not needed for compliance
  }
  enabled_log {
    category = "Policy"
    enabled  = true
  }
  enabled_log {
    category = "Recommendation"
    enabled  = false # Not needed for compliance
  }
  enabled_log {
    category = "ResourceHealth"
    enabled  = false # Not needed for compliance
  }
  enabled_log {
    category = "Security"
    enabled  = true
  }
  enabled_log {
    category = "ServiceHealth"
    enabled  = false # Not needed for compliance
  }
}
