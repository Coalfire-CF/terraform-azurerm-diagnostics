resource "azurerm_monitor_diagnostic_setting" "msql_diag" {
  count                      = var.resource_type == "msql" ? 1 : 0
  log_analytics_workspace_id = var.diag_log_analytics_id
  name                       = "mysql_diagnosticLogs"
  target_resource_id         = var.resource_id

  log {
    category = "MySqlAuditLogs"
    enabled  = true

    retention_policy {
      enabled = false
      days    = 0
    }
  }

  log {
    category = "MySqlSlowLogs"
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
