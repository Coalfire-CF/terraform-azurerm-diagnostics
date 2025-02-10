resource "azurerm_monitor_diagnostic_setting" "avd_workspace_diag" {
  count                      = var.resource_type == "avd_ws" ? 1 : 0
  log_analytics_workspace_id = var.diag_log_analytics_id
  name                       = "avd_ws_securityLogs"
  target_resource_id         = var.resource_id

  enabled_log {
    category = "Checkpoint"
  }
  enabled_log {
    category = "Error"
  }
  enabled_log {
    category = "Management"
  }
  enabled_log {
    category = "Feed"
  }
}
