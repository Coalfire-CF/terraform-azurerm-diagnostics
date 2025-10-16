resource "azurerm_monitor_diagnostic_setting" "rdc_diag" {
  count                      = var.resource_type == "rdc" ? 1 : 0
  log_analytics_workspace_id = var.diag_log_analytics_id
  name                       = "redis_diagnosticLogs"
  target_resource_id         = var.resource_id

  log {
    category = "ConnectedClientList"
    enabled  = true

    retention_policy {
      enabled = false
      days    = 0
    }
  }

  metric {
    category = "AllMetrics"
    enabled  = true

    retention_policy {
      enabled = false
      days    = 0
    }
  }
}
