resource "azurerm_monitor_diagnostic_setting" "kusto_diag" {
  count                      = var.resource_type == "kusto" ? 1 : 0
  log_analytics_workspace_id = var.diag_log_analytics_id
  name                       = "kusto_securitylogs"
  target_resource_id         = var.resource_id

  enabled_log {
    category = "Command"

    retention_policy {
      days    = 0
      enabled = true
    }
  }

  enabled_log {
    category = "FailedIngestion"

    retention_policy {
      days    = 0
      enabled = true
    }
  }

  enabled_log {
    category = "IngestionBatching"

    retention_policy {
      days    = 0
      enabled = true
    }
  }

  enabled_log {
    category = "Journal"

    retention_policy {
      days    = 0
      enabled = true
    }
  }

  enabled_log {
    category = "Query"

    retention_policy {
      days    = 0
      enabled = true
    }
  }

  enabled_log {
    category = "SucceededIngestion"

    retention_policy {
      days    = 0
      enabled = true
    }
  }

  enabled_log {
    category = "TableDetails"

    retention_policy {
      days    = 0
      enabled = true
    }
  }

  enabled_log {
    category = "TableUsageStatistics"

    retention_policy {
      days    = 0
      enabled = true
    }
  }

  metric {
    category = "AllMetrics"
    enabled  = true

    retention_policy {
      days    = 0
      enabled = true
    }
  }
}
