resource "azurerm_monitor_diagnostic_setting" "func_diag" {
  count                      = var.resource_type == "func" ? 1 : 0
  log_analytics_workspace_id = var.diag_log_analytics_id
  name                       = "functions_securityLogs"
  target_resource_id         = var.resource_id

  enabled_log {
    category = "FunctionAppLogs"
  }

  enabled_metric {
    category = "AllMetrics"
  }
}
