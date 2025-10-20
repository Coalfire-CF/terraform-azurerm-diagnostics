resource "azurerm_monitor_diagnostic_setting" "kusto_diag" {
  count                      = var.resource_type == "kusto" ? 1 : 0
  log_analytics_workspace_id = var.diag_log_analytics_id
  name                       = "kusto_securitylogs"
  target_resource_id         = var.resource_id

  enabled_log {
    category = "Command"
  }

  enabled_log {
    category = "FailedIngestion"
  }

  enabled_log {
    category = "IngestionBatching"
  }

  enabled_log {
    category = "Journal"
  }

  enabled_log {
    category = "Query"
  }

  enabled_log {
    category = "SucceededIngestion"
  }

  enabled_log {
    category = "TableDetails"
  }

  enabled_log {
    category = "TableUsageStatistics"
  }

  enabled_metric {
    category = "AllMetrics"
  }
}
