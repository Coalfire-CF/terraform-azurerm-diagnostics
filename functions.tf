resource "azurerm_monitor_diagnostic_setting" "func_diag" {
  count                      = var.resource_type == "func" ? 1 : 0
  log_analytics_workspace_id = var.diag_log_analytics_id
  name                       = "functions_securityLogs"
  target_resource_id         = var.resource_id

  log {
    category = "FunctionAppLogs"
    enabled  = true

    retention_policy {
      days    = 365
      enabled = true
    }
  }

  metric {
    category = "AllMetrics"
    enabled  = true

    retention_policy {
      days    = 365
      enabled = true
    }
  }
}