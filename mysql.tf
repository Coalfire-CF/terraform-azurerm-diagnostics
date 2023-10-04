resource "azurerm_monitor_diagnostic_setting" "msql_diag" {
  count                      = var.resource_type == "msql" ? 1 : 0
  log_analytics_workspace_id = var.diag_log_analytics_id
  name                       = "mysql_securityLogs"
  target_resource_id         = var.resource_id

  enabled_log {
    category = "MySqlAuditLogs"


    retention_policy {
      days    = 0
      enabled = true
    }
  }
  enabled_log {
    category = "MySqlSlowLogs"


    retention_policy {
      days    = 0
      enabled = true
    }
  }

  metric {
    category = "AllMetrics"


    retention_policy {
      days    = 0
      enabled = true
    }
  }
}
