resource "azurerm_monitor_diagnostic_setting" "psql_diag" {
  count                      = var.resource_type == "psql" ? 1 : 0
  log_analytics_workspace_id = var.diag_log_analytics_id
  name                       = "psql_securityLogs"
  target_resource_id         = var.resource_id

  enabled_log {
    category = "PostgreSQLLogs"
    enabled  = true

    retention_policy {
      days    = 365
      enabled = true
    }
  }
  enabled_log {
    category = "QueryStoreRuntimeStatistics"
    enabled  = false # Not needed for compliance

    retention_policy {
      days    = 365
      enabled = false
    }
  }
  enabled_log {
    category = "QueryStoreWaitStatistics"
    enabled  = false # Not needed for compliance

    retention_policy {
      days    = 365
      enabled = false
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
