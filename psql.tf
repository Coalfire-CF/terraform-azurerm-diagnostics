resource "azurerm_monitor_diagnostic_setting" "psql_diag" {
  count                      = var.resource_type == "psql" ? 1 : 0
  log_analytics_workspace_id = var.diag_log_analytics_id
  name                       = "psql_securityLogs"
  target_resource_id         = var.resource_id

  enabled_log {
    category = "PostgreSQLLogs"
  }
  enabled_log {
    category = "QueryStoreRuntimeStatistics"
  }
  enabled_log {
    category = "QueryStoreWaitStatistics"
  }

  metric {
    category = "AllMetrics"
    enabled  = true
  }
}
